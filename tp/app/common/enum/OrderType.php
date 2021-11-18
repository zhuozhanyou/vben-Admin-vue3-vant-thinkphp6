<?php

declare (strict_types = 1);

namespace app\common\enum;

/**
 * 枚举类：订单类型
 * Class OrderType
 * @package app\common\enum
 */
class OrderType extends EnumBasics
{
    // 商城订单
    const ORDER = 10;

    // 余额充值订单
    const RECHARGE = 100;

    /**
     * 获取订单类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::ORDER => [
                'name' => '商城订单',
                'value' => self::ORDER,
            ],
            self::RECHARGE => [
                'name' => '余额充值订单',
                'value' => self::RECHARGE,
            ],
        ];
    }

}