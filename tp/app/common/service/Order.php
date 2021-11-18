<?php

declare (strict_types = 1);

namespace app\common\service;

use app\store\model\User as UserModel;
use app\store\model\UserCoupon as UserCouponModel;
use app\common\model\Order as OrderModel;
use app\common\service\goods\source\Factory as FactoryStock;

/**
 * 订单服务类
 * Class Order
 * @package app\common\service
 */
class Order extends BaseService
{
    /**
     * 生成订单号
     * @return string
     */
    public static function createOrderNo()
    {
        return date('Ymd') . substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
    }

    /**
     * 事件：订单取消
     * @param OrderModel $order
     */
    public static function cancelEvent(OrderModel $order)
    {
        // 回退商品库存
        FactoryStock::getFactory($order['order_source'])->backGoodsStock($order['goods'], true);
        // 回退用户优惠券
        $order['coupon_id'] > 0 && UserCouponModel::setIsUse($order['coupon_id'], false);
        // 回退用户积分
        if ($order['points_num'] > 0) {
            $describe = "订单取消：{$order['order_no']}";
            UserModel::setIncPoints($order['user_id'], $order['points_num'], $describe);
        }
    }
}