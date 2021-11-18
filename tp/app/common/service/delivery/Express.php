<?php

declare (strict_types=1);

namespace app\common\service\delivery;

use app\common\enum\Setting as SettingEnum;
use app\common\library\helper;
use app\common\model\store\Setting as SettingModel;
use app\common\model\Delivery as DeliveryModel;
use app\common\enum\OrderType as OrderTypeEnum;
use app\common\service\BaseService;

/**
 * 快递配送服务类
 * Class Delivery
 * @package app\common\service
 */
class Express extends BaseService
{
    private $cityId;     // 用户收货城市id
    private $goodsList;  // 订单商品列表
    private $notInRuleGoodsId;  // 不在配送范围的商品ID

    // 运费模板数据集
    private $data = [];

    /**
     * 构造方法
     * Express constructor.
     * @param int $cityId 城市ID
     * @param $goodsList
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function __construct(int $cityId, $goodsList)
    {
        parent::__construct();
        // 赋值传参
        $this->cityId = $cityId;
        $this->goodsList = $goodsList;
        // 整合运费模板
        $this->initDeliveryTemplate();
    }

    /**
     * 验证用户收货地址是否在配送范围
     * @return bool
     */
    public function isIntraRegion()
    {
        if (!$this->cityId) return false;
        foreach ($this->data as $item) {
            $cityIds = [];
            foreach ($item['delivery']['rule'] as $ruleItem) {
                $cityIds = array_merge($cityIds, $ruleItem['region']);
            }
            if (!in_array($this->cityId, $cityIds)) {
                $this->notInRuleGoodsId = current($item['goodsList'])['goods_id'];
                return false;
            }
        }
        return true;
    }

    /**
     * 获取不在配送范围的商品名称
     * @return null
     */
    public function getNotInRuleGoodsName()
    {
        $item = helper::getArrayItemByColumn($this->goodsList, 'goods_id', $this->notInRuleGoodsId);
        return !empty($item) ? $item['goods_name'] : null;
    }

    /**
     * 获取订单的配送费用
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getDeliveryFee()
    {
        if (empty($this->cityId) || empty($this->goodsList) || $this->notInRuleGoodsId > 0) {
            return helper::number2(0.00);
        }
        // 处理商品包邮
        $this->freeshipping();
        // 计算配送金额
        foreach ($this->data as &$item) {
            // 计算当前配送模板的运费
            $item['delivery_fee'] = $this->calcDeliveryAmount($item);
        }
        // 根据运费组合策略获取最终运费金额
        return helper::number2($this->getFinalFreight());
    }

    /**
     * 根据运费组合策略 计算最终运费
     * @return float|int|mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException\
     */
    private function getFinalFreight()
    {
        // 运费合集
        $expressPriceArr = helper::getArrayColumn($this->data, 'delivery_fee');
        // 最终运费金额
        $expressPrice = 0.00;
        // 判断运费组合策略
        switch (SettingModel::getItem('trade')['freight_rule']) {
            case '10':    // 策略1: 叠加
                $expressPrice = array_sum($expressPriceArr);
                break;
            case '20':    // 策略2: 以最低运费结算
                $expressPrice = min($expressPriceArr);
                break;
            case '30':    // 策略3: 以最高运费结算
                $expressPrice = max($expressPriceArr);
                break;
        }
        return $expressPrice;
    }

    /**
     * 商品满额包邮
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    private function freeshipping()
    {
        // 订单商品总金额
        $orderTotalPrice = helper::getArrayColumnSum($this->goodsList, 'total_price');
        // 获取满额包邮设置
        $options = SettingModel::getItem(SettingEnum::FULL_FREE);
        foreach ($this->data as &$item) {
            $item['free_goods_list'] = [];
            foreach ($item['goodsList'] as $goodsItem) {
                if (
                    $options['is_open'] == true
                    && $orderTotalPrice >= $options['money']
                    && !in_array($goodsItem['goods_id'], $options['excludedGoodsIds'])
                    && !in_array($this->cityId, $options['excludedRegions']['cityIds'])
                ) {
                    $item['free_goods_list'][] = $goodsItem['goods_id'];
                }
            }
        }
        return true;
    }

    /**
     * 计算当前配送模板的运费
     * @param $item
     * @return float|mixed|string
     */
    private function calcDeliveryAmount($item)
    {
        // 获取运费模板下商品总数量or总重量
        if (!$totality = $this->getItemGoodsTotal($item)) {
            return 0.00;
        }
        // 当前收货城市配送规则
        $deliveryRule = $this->getCityDeliveryRule($item['delivery']);
        if ($totality <= $deliveryRule['first']) {
            return $deliveryRule['first_fee'];
        }
        // 续件or续重 数量
        $additional = $totality - $deliveryRule['first'];
        if ($additional <= $deliveryRule['additional']) {
            return helper::bcadd($deliveryRule['first_fee'], $deliveryRule['additional_fee']);
        }
        // 计算续重/件金额
        if ($deliveryRule['additional'] < 1) {
            // 配送规则中续件为0
            $additionalFee = 0.00;
        } else {
            $additionalFee = helper::bcdiv($deliveryRule['additional_fee'], $deliveryRule['additional']) * $additional;
        }
        return helper::bcadd($deliveryRule['first_fee'], $additionalFee);
    }

    /**
     * 获取运费模板下商品总数量or总重量
     * @param $item
     * @return int|string
     */
    private function getItemGoodsTotal($item)
    {
        $totalWeight = 0;   // 总重量
        $totalNum = 0;      // 总数量
        foreach ($item['goodsList'] as $goodsItem) {
            // 如果商品为包邮，则不计算总量中
            if (!in_array($goodsItem['goods_id'], $item['free_goods_list'])) {
                $goodsWeight = helper::bcmul($goodsItem['skuInfo']['goods_weight'], $goodsItem['total_num']);
                $totalWeight = helper::bcadd($totalWeight, $goodsWeight);
                $totalNum = helper::bcadd($totalNum, $goodsItem['total_num']);
            }
        }
        return $item['delivery']['method'] == 10 ? $totalNum : $totalWeight;
    }

    /**
     * 根据城市id获取规则信息
     * @param
     * @return array|false
     */
    private function getCityDeliveryRule($delivery)
    {
        foreach ($delivery['rule'] as $item) {
            if (in_array($this->cityId, $item['region'])) {
                return $item;
            }
        }
        return false;
    }

    /**
     * 整合运费模板
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    private function initDeliveryTemplate()
    {
        // 运费模板ID集
        $deliveryIds = helper::getArrayColumn($this->goodsList, 'delivery_id');
        // 运费模板列表
        $deliveryList = (new DeliveryModel)->getListByIds(array_values(array_unique($deliveryIds)));
        // 整理数据集
        foreach ($deliveryList as $item) {
            $this->data[$item['delivery_id']]['delivery'] = $item;
            $this->data[$item['delivery_id']]['goodsList'] = $this->getGoodsListByDeliveryId($item['delivery_id']);
        }
        return true;
    }

    /**
     * 根据运费模板id整理商品集
     * @param $deliveryId
     * @return array
     */
    private function getGoodsListByDeliveryId($deliveryId)
    {
        $data = [];
        foreach ($this->goodsList as $item) {
            $item['delivery_id'] == $deliveryId && $data[] = $item;
        }
        return $data;
    }
}
