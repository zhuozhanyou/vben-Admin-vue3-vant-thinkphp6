<?php

declare (strict_types = 1);

namespace app\common\enum\page;

use app\common\enum\EnumBasics;

/**
 * 枚举类：订单支付方式
 * Class PageType
 * @package app\common\enum\order
 */
class PageType extends EnumBasics
{
    // 首页
    const HOME = 10;

    // 自定义页
    const CUSTOM = 20;

    /**
     * 获取枚举数据
     * @return array
     */
    public static function data()
    {
        return [
            self::HOME => [
                'name' => '首页',
                'value' => self::HOME
            ],
            self::CUSTOM => [
                'name' => '自定义页',
                'value' => self::CUSTOM
            ]
        ];
    }

}