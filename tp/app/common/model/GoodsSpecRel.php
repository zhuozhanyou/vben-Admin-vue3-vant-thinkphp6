<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 商品规格关系模型
 * Class GoodsSpecRel
 * @package app\common\model
 */
class GoodsSpecRel extends BaseModel
{
    // 定义表名
    protected $name = 'goods_spec_rel';

    // 定义主键
    protected $pk = 'id';

    protected $updateTime = false;

    /**
     * 关联规格组
     * @return \think\model\relation\BelongsTo
     */
    public function spec()
    {
        return $this->belongsTo('Spec');
    }

    /**
     * 关联规格值
     * @return \think\model\relation\BelongsTo
     */
    public function specValue()
    {
        return $this->belongsTo('SpecValue');
    }

    /**
     * 指定商品的规格列表
     * @param int $goodsId 商品ID
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function getSpecList(int $goodsId)
    {
        // 获取指定商品的规格值关系记录
        $data = (new static)->with(['spec', 'specValue'])
            ->where('goods_id', '=', $goodsId)
            ->select();
        // 规格组
        $groupData = [];
        foreach ($data as $groupKey => $item) {
            $groupData[$item['spec_id']] = [
                'spec_id' => $item['spec']['spec_id'],
                'spec_name' => $item['spec']['spec_name']
            ];
        }
        // 去除索引
        $specList = array_values($groupData);
        // 规格值
        foreach ($specList as $groupKey => &$group) {
            $group['key'] = $groupKey;
            foreach ($data as $valueKey => $item) {
                ($item['spec_id'] == $group['spec_id']) && $group['valueList'][] = [
                    'key' => isset($group['valueList']) ? count($group['valueList']) : 0,
                    'groupKey' => $groupKey,
                    'spec_value_id' => $item['specValue']['spec_value_id'],
                    'spec_value' => $item['specValue']['spec_value']
                ];
            }
        }
        return $specList;
    }

}
