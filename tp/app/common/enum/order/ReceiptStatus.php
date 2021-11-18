<?php

declare (strict_types = 1);

namespace app\common\enum\order;

use app\common\enum\EnumBasics;

/**
 * 枚举类：订单收货状态
 * Class ReceiptStatus
 * @package app\common\enum\order
 */
class ReceiptStatus extends EnumBasics
{
    // 未收货
    const NOT_RECEIVED = 10;

    // 已收货
    const RECEIVED = 20;

}