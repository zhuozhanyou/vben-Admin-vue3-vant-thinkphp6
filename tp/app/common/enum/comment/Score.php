<?php

declare (strict_types = 1);

namespace app\common\enum\comment;

use app\common\enum\EnumBasics;

/**
 * 枚举类：商品评价评分类型
 * Class Score
 * @package app\common\enum\comment
 */
class Score extends EnumBasics
{
    // 好评
    const GOOD = 10;

    // 中评
    const MEDIUM = 20;

    // 差评
    const BAD = 30;

    /**
     * 获取枚举类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::GOOD => [
                'name' => '好评',
                'value' => self::GOOD
            ],
            self::MEDIUM => [
                'name' => '中评',
                'value' => self::MEDIUM
            ],
            self::BAD => [
                'name' => '差评',
                'value' => self::BAD
            ]
        ];
    }
}