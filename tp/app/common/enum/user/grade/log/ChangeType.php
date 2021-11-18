<?php

declare (strict_types = 1);

namespace app\common\enum\user\grade\log;

use app\common\enum\EnumBasics;

/**
 * 会员等级变更记录表 -> 变更类型
 * Class ChangeType
 * @package app\common\enum\user\grade\log
 */
class ChangeType extends EnumBasics
{
    // 后台管理员设置
    const ADMIN_USER = 10;

    // 自动升级
    const AUTO_UPGRADE = 20;

}