<?php

declare (strict_types = 1);

namespace app\common\enum;

/**
 * 商城设置枚举类
 * Class Setting
 * @package app\common\enum
 */
class Setting extends EnumBasics
{
    // 配送设置
    const DELIVERY = 'delivery';

    // 交易设置
    const TRADE = 'trade';

    // 短信通知
    const SMS = 'sms';

    // 上传设置
    const STORAGE = 'storage';

    // 满额包邮设置
    const FULL_FREE = 'full_free';

    // 充值设置
    const RECHARGE = 'recharge';

    // 积分设置
    const POINTS = 'points';

    // 分类页模板
    const PAGE_CATEGORY_TEMPLATE = 'page_category_template';

    /**
     * 获取订单类型值
     * @return array
     */
    public static function data()
    {
        return [
            self::DELIVERY => [
                'value' => self::DELIVERY,
                'describe' => '配送设置',
            ],
            self::TRADE => [
                'value' => self::TRADE,
                'describe' => '交易设置',
            ],
                self::SMS => [
                    'value' => self::SMS,
                    'describe' => '短信通知',
                ],
            self::STORAGE => [
                'value' => self::STORAGE,
                'describe' => '上传设置',
            ],
            self::FULL_FREE => [
                'value' => self::FULL_FREE,
                'describe' => '满额包邮设置',
            ],
            self::RECHARGE => [
                'value' => self::RECHARGE,
                'describe' => '充值设置',
            ],
            self::POINTS => [
                'value' => self::POINTS,
                'describe' => '积分设置',
            ],
            self::PAGE_CATEGORY_TEMPLATE => [
                'value' => self::PAGE_CATEGORY_TEMPLATE,
                'describe' => '分类页模板',
            ],
        ];
    }

}
