<?php

declare (strict_types = 1);

namespace app\common\enum\order;

use app\common\enum\EnumBasics;

/**
 * 枚举类：订单发货状态
 * Class DeliveryStatus
 * @package app\common\enum\order
 */
class DeliveryStatus extends EnumBasics
{
    // 未发货
    const NOT_DELIVERED = 10;

    // 已发货
    const DELIVERED = 20;

    /**
     * 获取枚举数据
     * @return array
     */
    public static function data()
    {
        return [
            self::NOT_DELIVERED => [
                'name' => '未发货',
                'value' => self::NOT_DELIVERED,
            ],
            self::DELIVERED => [
                'name' => '已发货',
                'value' => self::DELIVERED,
            ],
        ];
    }

}
