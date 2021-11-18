<?php

declare (strict_types = 1);

namespace app\common\model;

use app\common\model\store\shop\Order as ShopOrder;
use app\common\service\Order as OrderService;
use app\common\service\order\Complete as OrderCompleteService;
use app\common\enum\OrderType as OrderTypeEnum;
use app\common\enum\order\PayStatus as PayStatusEnum;
use app\common\enum\order\OrderStatus as OrderStatusEnum;
use app\common\enum\order\DeliveryType as DeliveryTypeEnum;
use app\common\enum\order\DeliveryStatus as DeliveryStatusEnum;
use app\common\library\helper;

/**
 * 订单模型
 * Class Order
 * @package app\common\model
 */
class Order extends BaseModel
{
    // 定义表名
    protected $name = 'order';

    // 定义表名(外部引用)
    public static $tableName = 'order';

    // 定义主键
    protected $pk = 'order_id';

    // 定义别名
    protected $alias = 'order';

    /**
     * 追加字段
     * @var array
     */
    protected $append = [
        'state_text',   // 售后单状态文字描述
    ];

    /**
     * 订单商品列表
     * @return \think\model\relation\HasMany
     */
    public function goods()
    {
        $module = self::getCalledModule();
        return $this->hasMany("app\\{$module}\\model\\OrderGoods")->withoutField('content');
    }

    /**
     * 关联订单收货地址表
     * @return \think\model\relation\HasOne
     */
    public function address()
    {
        $module = self::getCalledModule();
        return $this->hasOne("app\\{$module}\\model\\OrderAddress");
    }

    /**
     * 关联用户表
     * @return \think\model\relation\BelongsTo
     */
    public function user()
    {
        $module = self::getCalledModule();
        return $this->belongsTo("app\\{$module}\\model\\User");
    }

    /**
     * 关联物流公司表
     * @return \think\model\relation\BelongsTo
     */
    public function express()
    {
        $module = self::getCalledModule();
        return $this->belongsTo("app\\{$module}\\model\\Express");
    }

    /**
     * 订单状态文字描述
     * @param $value
     * @param $data
     * @return string
     */
    public function getStateTextAttr($value, $data)
    {
        // 订单状态
//        if (in_array($data['order_status'], [OrderStatusEnum::CANCELLED, OrderStatusEnum::COMPLETED])) {
//            $orderStatus = [OrderStatusEnum::CANCELLED => '已取消', OrderStatusEnum::COMPLETED => '已完成'];
//            return $orderStatus[$data['order_status']];
//        }
        // 订单状态
        if ($data['order_status'] != OrderStatusEnum::NORMAL) {
            return OrderStatusEnum::data()[$data['order_status']]['name'];
        }
        // 付款状态
        if ($data['pay_status'] == PayStatusEnum::PENDING) {
            return '待支付';
        }
        // 订单类型：单独购买
        if ($data['delivery_status'] == 10) {
            return '待发货';
        }
        if ($data['receipt_status'] == 10) {
            return '待收货';
        }
        return $value;
    }

    /**
     * 获取器：订单金额(含优惠折扣)
     * @param $value
     * @param $data
     * @return string
     */
    public function getOrderPriceAttr($value, $data)
    {
        // 兼容旧数据：订单金额
        if ($value == 0) {
            return helper::bcadd(helper::bcsub($data['total_price'], $data['coupon_money']), $data['update_price']);
        }
        return $value;
    }

    /**
     * 改价金额（差价）
     * @param $value
     * @return array
     */
    public function getUpdatePriceAttr($value)
    {
        return [
            'symbol' => $value < 0 ? '-' : '+',
            'value' => sprintf('%.2f', abs($value))
        ];
    }

    /**
     * 付款时间
     * @param $value
     * @return false|string
     */
    public function getPayTimeAttr($value)
    {
        return format_time($value);
    }

    /**
     * 发货时间
     * @param $value
     * @return false|string
     */
    public function getDeliveryTimeAttr($value)
    {
        return format_time($value);
    }

    /**
     * 收货时间
     * @param $value
     * @return false|string
     */
    public function getReceiptTimeAttr($value)
    {
        return format_time($value);
    }

    /**
     * 生成订单号
     * @return string
     */
    public function orderNo()
    {
        return OrderService::createOrderNo();
    }

    /**
     * 订单详情
     * @param $where
     * @param array $with
     * @return array|null|static
     */
    public static function detail($where, $with = [])
    {
        is_array($where) ? $filter = $where : $filter['order_id'] = (int)$where;
        return self::get($filter, $with);
    }

    /**
     * 批量获取订单列表
     * @param $orderIds
     * @param array $with
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getListByIds(array $orderIds, array $with = [])
    {
        $data = $this->getListByInArray('order_id', $orderIds, $with);
        return helper::arrayColumn2Key($data, 'order_id');
    }

    /**
     * 批量获取订单列表
     * @param $field
     * @param $data
     * @param array $with
     * @return \think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    private function getListByInArray($field, $data, $with = [])
    {
        return $this->with($with)
            ->where($field, 'in', $data)
            ->where('is_delete', '=', 0)
            ->select();
    }

    /**
     * 根据订单号批量查询
     * @param $orderNos
     * @param array $with
     * @return \think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getListByOrderNos($orderNos, $with = [])
    {
        return $this->getListByInArray('order_no', $orderNos, $with);
    }

    /**
     * 批量更新订单
     * @param $orderIds
     * @param $data
     * @return false|int
     */
    public function onBatchUpdate($orderIds, $data)
    {
        return static::updateBase($data, [['order_id', 'in', $orderIds]]);
    }

}
