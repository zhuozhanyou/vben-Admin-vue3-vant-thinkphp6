<?php

declare (strict_types = 1);

namespace app\common\enum\goods;

use app\common\enum\EnumBasics;

/**
 * 枚举类：商品库存计算方式
 * Class DeductStockType
 * @package app\common\enum\goods
 */
class DeductStockType extends EnumBasics
{
    // 下单减库存
    const CREATE = 10;

    // 付款减库存
    const PAYMENT = 20;

    /**
     * 获取枚举类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::CREATE => [
                'name' => '下单减库存',
                'value' => self::CREATE,
            ],
            self::PAYMENT => [
                'name' => '付款减库存',
                'value' => self::PAYMENT,
            ],
        ];
    }

}
