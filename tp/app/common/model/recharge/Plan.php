<?php

declare (strict_types = 1);

namespace app\common\model\recharge;

use app\common\model\BaseModel;

/**
 * 用户充值订单模型
 * Class Plan
 * @package app\common\model\recharge
 */
class Plan extends BaseModel
{
    // 定义表名
    protected $name = 'recharge_plan';

    // 定义主键
    protected $pk = 'plan_id';

    /**
     * 充值套餐详情
     * @param $plan_id
     * @return null|static
     */
    public static function detail($plan_id)
    {
        return self::get($plan_id);
    }

}