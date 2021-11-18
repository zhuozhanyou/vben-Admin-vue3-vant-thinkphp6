<?php

declare (strict_types = 1);

namespace app\common\enum\goods;

use app\common\enum\EnumBasics;

/**
 * 枚举类：商品规格
 * Class SpecType
 * @package app\common\enum\goods
 */
class SpecType extends EnumBasics
{
    // 单规格
    const SINGLE = 10;

    // 多规格
    const MULTI = 20;

    /**
     * 获取枚举类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::SINGLE => [
                'name' => '单规格',
                'value' => self::SINGLE,
            ],
            self::MULTI => [
                'name' => '多规格',
                'value' => self::MULTI,
            ],
        ];
    }
}
