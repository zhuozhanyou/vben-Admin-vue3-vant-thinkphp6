<?php

declare (strict_types = 1);

namespace app\common\model;

use app\common\library\helper;

/**
 * 配送模板区域及运费模型
 * Class DeliveryRule
 * @package app\store\model
 */
class DeliveryRule extends BaseModel
{
    // 定义表名
    protected $name = 'delivery_rule';

    // 定义主键
    protected $pk = 'rule_id';

    protected $updateTime = false;

    /**
     * 获取器：可配送区域转为数组格式
     * @param $value
     * @return array
     */
    public function getRegionAttr(string $value)
    {
        return helper::jsonDecode($value);
    }

    /**
     * 修改器：可配送区域转为json格式
     * @param array $value
     * @return string
     */
    public function setRegionAttr(array $value)
    {
        return helper::jsonEncode($value);
    }

    /**
     * 获取器：可配送区域(文字展示)转为数组格式
     * @param $value
     * @return array
     */
    public function getRegionTextAttr(string $value)
    {
        return helper::jsonDecode($value);
    }

    /**
     * 修改器：可配送区域转(文字展示)为json格式
     * @param array $value
     * @return string
     */
    public function setRegionTextAttr(array $value)
    {
        return helper::jsonEncode($value);
    }

}
