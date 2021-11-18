<?php

declare (strict_types = 1);

namespace app\common\model;

use app\common\library\helper;

/**
 * 优惠券模型
 * Class Coupon
 * @package app\common\model
 */
class Coupon extends BaseModel
{
    // 定义表名
    protected $name = 'coupon';

    // 定义主键
    protected $pk = 'coupon_id';

    /**
     * 追加字段
     * @var array
     */
    protected $append = ['state'];

    /**
     * 优惠券状态 (是否可领取)
     * @param $value
     * @param $data
     * @return array
     */
    public function getStateAttr($value, $data)
    {
        if (isset($data['is_receive']) && $data['is_receive']) {
            return ['text' => '已领取', 'value' => 0];
        }
        if ($data['total_num'] > -1 && $data['receive_num'] >= $data['total_num']) {
            return ['text' => '已抢光', 'value' => 0];
        }
        if ($data['expire_type'] == 20 && ($data['end_time'] + 86400) < time()) {
            return ['text' => '已过期', 'value' => 0];
        }
        return ['text' => '正常', 'value' => 1];
    }

    /**
     * 获取器：格式化折扣率
     * @param $value
     * @return mixed
     */
    public function getDiscountAttr($value)
    {
        return $value / 10;
    }

    /**
     * 获取器：开始时间
     * @param $value
     * @return string
     */
    public function getStartTimeAttr($value)
    {
        return date('Y/m/d', $value);
    }

    /**
     * 获取器：结束时间
     * @param $value
     * @return string
     */
    public function getEndTimeAttr($value)
    {
        return date('Y/m/d', $value);
    }

    /**
     * 获取器：适用范围配置
     * @param $value
     * @return mixed
     */
    public function getApplyRangeConfigAttr($value)
    {
        return $value ? helper::jsonDecode($value) : [];
    }

    /**
     * 修改器：格式化折扣率
     * @param $value
     * @return mixed
     */
    public function setDiscountAttr($value)
    {
        return $value * 10;
    }

    /**
     * 修改器：适用范围配置
     * @param $array
     * @return mixed
     */
    public function setApplyRangeConfigAttr($array)
    {
        return helper::jsonEncode($array);
    }

    /**
     * 优惠券详情
     * @param int $couponId
     * @return null|static
     */
    public static function detail(int $couponId)
    {
        return self::get($couponId);
    }
}
