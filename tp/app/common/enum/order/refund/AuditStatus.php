<?php

declare (strict_types = 1);

namespace app\common\enum\order\refund;

use app\common\enum\EnumBasics;

/**
 * 枚举类：商家审核状态
 * Class AuditStatus
 * @package app\common\enum\order
 */
class AuditStatus extends EnumBasics
{
    // 待审核
    const WAIT = 0;

    // 已同意
    const REVIEWED = 10;

    // 已拒绝
    const REJECTED = 20;

    /**
     * 获取枚举数据
     * @return array
     */
    public static function data()
    {
        return [
            self::WAIT => [
                'name' => '待审核',
                'value' => self::WAIT
            ],
            self::REVIEWED => [
                'name' => '已同意',
                'value' => self::REVIEWED
            ],
            self::REJECTED => [
                'name' => '已拒绝',
                'value' => self::REJECTED
            ]
        ];
    }

}
