<?php

declare (strict_types = 1);

namespace app\common\model\recharge;

use app\common\model\BaseModel;

/**
 * 用户充值订单模型
 * Class Order
 * @package app\common\model\recharge
 */
class Order extends BaseModel
{
    // 定义表名
    protected $name = 'recharge_order';

    // 定义主键
    protected $pk = 'order_id';

    /**
     * 关联会员记录表
     * @return \think\model\relation\BelongsTo
     */
    public function user()
    {
        $module = self::getCalledModule();
        return $this->belongsTo("app\\{$module}\\model\\User");
    }

    /**
     * 关联订单套餐快照表
     * @return \think\model\relation\HasOne
     */
    public function orderPlan()
    {
        return $this->hasOne('OrderPlan', 'order_id');
    }

    /**
     * 付款时间
     * @param $value
     * @return array
     */
    public function getPayTimeAttr($value)
    {
        return format_time($value);
    }

    /**
     * 获取订单详情
     * @param $where
     * @return array|null|\think\Model
     */
    public static function detail($where)
    {
        return static::get($where);
    }

}
