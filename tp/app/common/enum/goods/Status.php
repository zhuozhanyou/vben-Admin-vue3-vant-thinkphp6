<?php

declare (strict_types = 1);

namespace app\common\enum\goods;

use app\common\enum\EnumBasics;

/**
 * 枚举类：商品状态
 * Class Status
 * @package app\common\enum\goods
 */
class Status extends EnumBasics
{
    // 上架
    const ON_SALE = 10;

    // 下架
    const OFF_SALE = 20;

    /**
     * 获取枚举类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::ON_SALE => [
                'name' => '上架',
                'value' => self::ON_SALE,
            ],
            self::OFF_SALE => [
                'name' => '下架',
                'value' => self::OFF_SALE,
            ],
        ];
    }
}
