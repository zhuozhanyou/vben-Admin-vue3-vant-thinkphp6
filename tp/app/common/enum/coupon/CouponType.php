<?php

declare (strict_types = 1);

namespace app\common\enum\coupon;

use app\common\enum\EnumBasics;

/**
 * 枚举类：优惠券类型
 * Class CouponType
 * @package app\common\enum\coupon
 */
class CouponType extends EnumBasics
{
    // 满减券
    const FULL_DISCOUNT = 10;

    // 折扣券
    const DISCOUNT = 20;

    /**
     * 获取枚举类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::FULL_DISCOUNT => [
                'name' => '满减券',
                'value' => self::FULL_DISCOUNT
            ],
            self::DISCOUNT => [
                'name' => '折扣券',
                'value' => self::DISCOUNT
            ]
        ];
    }

}
