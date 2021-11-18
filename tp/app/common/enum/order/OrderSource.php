<?php

declare (strict_types = 1);

namespace app\common\enum\order;

use app\common\enum\EnumBasics;

/**
 * 枚举类：订单来源
 * Class OrderSource
 * @package app\common\enum\order
 */
class OrderSource extends EnumBasics
{
    // 普通订单
    const MASTER = 10;

    /**
     * 获取枚举数据
     * @return array
     */
    public static function data()
    {
        return [
            self::MASTER => [
                'name' => '普通订单',
                'value' => self::MASTER,
            ]
        ];
    }

}