<?php

declare (strict_types=1);

namespace app\common\model;

use app\common\model\Region as RegionModel;

/**
 * 售后单退货地址模型
 * Class OrderRefundAddress
 * @package app\common\model
 */
class OrderRefundAddress extends BaseModel
{
    // 定义表名
    protected $name = 'order_refund_address';

    // 定义主键
    protected $pk = 'id';

    protected $updateTime = false;

    /**
     * 追加字段
     * @var array
     */
    protected $append = ['region'];

    /**
     * 获取器：地区名称
     * @param $value
     * @param $data
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getRegionAttr($value, $data)
    {
        return [
            'province' => RegionModel::getNameById($data['province_id']),
            'city' => RegionModel::getNameById($data['city_id']),
            'region' => RegionModel::getNameById($data['region_id'])
        ];
    }

}