<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 配送模板模型
 * Class Delivery
 * @package app\common\model
 */
class Delivery extends BaseModel
{
    // 定义表名
    protected $name = 'delivery';

    // 定义主键
    protected $pk = 'delivery_id';

    /**
     * 关联配送模板区域及运费
     * @return \think\model\relation\HasMany
     */
    public function rule()
    {
        return $this->hasMany('DeliveryRule');
    }

    /**
     * 运费模板详情
     * @param int $deliveryId
     * @param array $with
     * @return null|static
     */
    public static function detail(int $deliveryId, array $with = [])
    {
        return self::get($deliveryId, ['rule']);
    }

    /**
     * 获取列表(根据模板id集)
     * @param array $deliveryIds
     * @return \think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getListByIds(array $deliveryIds)
    {
        return $this->with(['rule'])
            ->where('delivery_id', 'in', $deliveryIds)
            ->order(['sort', $this->getPk()])
            ->select();
    }

}
