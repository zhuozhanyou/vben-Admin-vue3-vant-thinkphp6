<?php

declare (strict_types = 1);

namespace app\common\enum\recharge\order;

use app\common\enum\EnumBasics;

/**
 * 用户充值订单-支付状态枚举类
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
     * 获取订单类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::PENDING => [
                'name' => '未支付',
                'value' => self::PENDING,
            ],
            self::SUCCESS => [
                'name' => '已支付',
                'value' => self::SUCCESS,
            ],
        ];
    }

}