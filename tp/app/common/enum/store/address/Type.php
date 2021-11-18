<?php

declare (strict_types = 1);

namespace app\common\enum\store\address;

use app\common\enum\EnumBasics;

/**
 * 枚举类：地址类型
 * Class Type
 * @package app\common\enum\store\address
 */
class Type extends EnumBasics
{
    // 发货地址
    const DELIVERY = 10;

    // 退货地址
    const RETURN = 20;

    /**
     * 获取类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::DELIVERY => [
                'name' => '发货地址',
                'value' => self::DELIVERY,
            ],
            self::RETURN => [
                'name' => '退货地址',
                'value' => self::RETURN
            ]
        ];
    }

}
