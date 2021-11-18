<?php

declare (strict_types = 1);

namespace app\common\enum\order;

use app\common\enum\EnumBasics;

/**
 * 枚举类：订单支付状态
 * Class PayStatus
 * @package app\common\enum\recharge\order
 */
class PayStatus extends EnumBasics
{
    // 待支付
    const PENDING = 10;

    // 支付成功
    const SUCCESS = 20;

    /**
     * 获取枚举数据
     * @return array
     */
    public static function data()
    {
        return [
            self::PENDING => [
                'name' => '待付款',
                'value' => self::PENDING,
            ],
            self::SUCCESS => [
                'name' => '已付款',
                'value' => self::SUCCESS,
            ],
        ];
    }

}