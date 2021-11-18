<?php

declare (strict_types = 1);

namespace app\common\model;

use app\common\model\Region as RegionModel;

/**
 * 用户收货地址模型
 * Class UserAddress
 * @package app\common\model
 */
class UserAddress extends BaseModel
{
    // 定义表名
    protected $name = 'user_address';

    // 定义主键
    protected $pk = 'address_id';

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
