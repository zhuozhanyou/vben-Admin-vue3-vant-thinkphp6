<?php

declare (strict_types = 1);

namespace app\common\enum\order\refund;

use app\common\enum\EnumBasics;

/**
 * 枚举类：售后类型
 * Class RefundType
 * @package app\common\enum\order
 */
class RefundType extends EnumBasics
{
    // 退货退款
    const RETURN = 10;

    // 换货
    const EXCHANGE = 20;

    /**
     * 获取枚举数据
     * @return array
     */
    public static function data()
    {
        return [
            self::RETURN => [
                'name' => '退货退款',
                'value' => self::RETURN
            ],
            self::EXCHANGE => [
                'name' => '换货',
                'value' => self::EXCHANGE
            ]
        ];
    }

}
