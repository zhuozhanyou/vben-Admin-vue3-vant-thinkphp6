<?php

declare (strict_types = 1);

namespace app\common\enum\order;

use app\common\enum\EnumBasics;

/**
 * 枚举类：配送方式
 * Class DeliveryType
 * @package app\common\enum\order
 */
class DeliveryType extends EnumBasics
{
    // 快递配送
    const EXPRESS = 10;

    /**
     * 获取枚举数据
     * @return array
     */
    public static function data()
    {
        return [
            self::EXPRESS => [
                'name' => '快递配送',
                'value' => self::EXPRESS,
            ]
        ];
    }

}