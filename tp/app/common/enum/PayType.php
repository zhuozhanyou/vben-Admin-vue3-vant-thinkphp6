<?php

declare (strict_types = 1);

namespace app\common\enum;

/**
 * 枚举类：支付类型
 * Class PayType
 * @package app\common\enum
 */
class PayType extends EnumBasics
{
    // 商城订单
    const ORDER = 10;

    // 余额充值
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
                'name' => '余额充值',
                'value' => self::RECHARGE,
            ],
        ];
    }

    /**
     * 获取订单类型名称
     * @return array
     */
    public static function getTypeName()
    {
        static $names = [];
        if (empty($names)) {
            foreach (self::data() as $item)
                $names[$item['value']] = $item['name'];
        }
        return $names;
    }

}