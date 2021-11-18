<?php

declare (strict_types = 1);

namespace app\common\service\goods\source;

use app\common\service\BaseService;
use app\common\enum\order\OrderSource as OrderSourceEnum;

/**
 * 商品来源工厂类
 * Class Factory
 * @package app\common\service\stock
 */
class Factory extends BaseService
{
    // 订单来源的结算台服务类
    private static $class = [
        OrderSourceEnum::MASTER => Master::class
    ];

    /**
     * 根据订单来源获取商品库存类
     * @param int $orderSource
     * @return mixed
     */
    public static function getFactory($orderSource = OrderSourceEnum::MASTER)
    {
        static $classObj = [];
        if (!isset($classObj[$orderSource])) {
            // $className = __NAMESPACE__ . '\\' . static::$class[$orderSource];
            $classObj[$orderSource] = new static::$class[$orderSource];
        }
        return $classObj[$orderSource];
    }
}