<?php

declare (strict_types = 1);

namespace app\common\service\message\order;

use app\common\service\message\Basics;
use app\common\model\store\Setting as SettingModel;

/**
 * 消息通知服务 [订单发货]
 * Class Delivery
 * @package app\common\service\message\order
 */
class Delivery extends Basics
{
    /**
     * 参数列表
     * @var array
     */
    protected $param = [
        'order' => [],
    ];

    /**
     * 订单页面链接
     * @var string
     */
    private $pageUrl = 'pages/order/detail';

    /**
     * 发送消息通知
     * @param array $param
     * @return mixed|void
     * @throws \think\Exception
     */
    public function send(array $param)
    {
        // 记录参数
        $this->param = $param;
    }

    /**
     * 格式化物流公司
     * @param $orderInfo
     * @return mixed
     */
    private function getFormatExpressName($orderInfo)
    {
        return $this->getSubstr($orderInfo['express']['express_name']);
    }

    /**
     * 格式化用户收货地址
     * @param $orderInfo
     * @return string
     */
    private function getFormatAddress($orderInfo)
    {
        return implode('', $orderInfo['address']['region']) . $orderInfo['address']['detail'];
    }

    /**
     * 格式化商品名称
     * @param $goodsData
     * @return string
     */
    private function getFormatGoodsName($goodsData)
    {
        return $this->getSubstr($goodsData[0]['goods_name']);
    }
}