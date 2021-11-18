<?php

declare (strict_types = 1);

namespace app\common\model\recharge;

use app\common\model\BaseModel;

/**
 * 用户充值订单套餐快照模型
 * Class OrderPlan
 * @package app\common\model\recharge
 */
class OrderPlan extends BaseModel
{
    // 定义表名
    protected $name = 'recharge_order_plan';

    // 定义主键
    protected $pk = 'order_plan_id';

}