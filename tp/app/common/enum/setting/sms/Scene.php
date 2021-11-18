<?php

declare (strict_types = 1);

namespace app\common\enum\setting\sms;

use app\common\enum\EnumBasics;

/**
 * 枚举类: 短信通知场景
 * Class Scene
 * @package app\common\enum\setting\sms
 */
class Scene extends EnumBasics
{
    // 短信验证码
    const CAPTCHA = 'captcha';

    // 新付款订单
    const ORDER_PAY = 'order_pay';

    /**
     * 获取类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::CAPTCHA => [
                'name' => '短信验证码',
                'value' => self::CAPTCHA
            ],
            self::ORDER_PAY => [
                'name' => '新付款订单',
                'value' => self::ORDER_PAY
            ]
        ];
    }

}
