<?php

declare (strict_types = 1);

namespace app\common\model\store;

use app\common\model\BaseModel;
use app\common\model\Region as RegionModel;

/**
 * 商家地址模型
 * Class Address
 * @package app\common\model\store
 */
class Address extends BaseModel
{
    // 定义表名
    protected $name = 'store_address';

    // 定义主键
    protected $pk = 'address_id';

    /**
     * 追加字段
     * @var array
     */
    protected $append = ['cascader', 'region', 'full_address'];

    /**
     * 省市区id集
     * @param $value
     * @param $data
     * @return array
     */
    public function getCascaderAttr($value, $data)
    {
        return [$data['province_id'], $data['city_id'], $data['region_id']];
    }

    /**
     * 省市区名称集
     * @param $value
     * @param $data
     * @return array
     */
    public function getRegionAttr($value, $data)
    {
        return $this->getRegionNames($data);
    }

    /**
     * 获取完整地址
     * @return string
     */
    public function getFullAddressAttr($value, $data)
    {
        $rgionNames = $this->getRegionNames($data);
        return "{$rgionNames['province']}{$rgionNames['city']}{$rgionNames['region']}{$data['detail']}";
    }

    /**
     * 获取省市区名称
     * @param array $data
     * @return mixed
     */
    private function getRegionNames(array $data)
    {
        static $dataset = [];
        $id = $data[$this->getPk()];
        if (!isset($dataset[$id])) {
            $dataset[$id] = [
                'province' => RegionModel::getNameById($data['province_id']),
                'city' => RegionModel::getNameById($data['city_id']),
                'region' => RegionModel::getNameById($data['region_id']),
            ];
        }
        return $dataset[$id];
    }

    /**
     * 详情记录
     * @param int $addressId
     * @return null|static
     */
    public static function detail(int $addressId)
    {
        return self::get($addressId);
    }

}
