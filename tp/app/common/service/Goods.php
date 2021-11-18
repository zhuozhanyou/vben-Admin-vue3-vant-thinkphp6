<?php

declare (strict_types = 1);

namespace app\common\service;

use app\common\library\helper;
use app\common\model\Goods as GoodsModel;

/**
 * 商品服务类
 * Class Goods
 * @package app\store\service
 */
class Goods extends BaseService
{
    /**
     * 设置商品数据
     * @param $data
     * @param bool $isMultiple
     * @param string $goodsIndex
     * @return mixed
     */
    public static function setGoodsData($data, $isMultiple = true, $goodsIndex = 'goods_id')
    {
        if (!$isMultiple) $dataSource = [&$data]; else $dataSource = &$data;
        // 获取商品列表
        $model = new GoodsModel;
        $goodsData = $model->getListByIds(helper::getArrayColumn($dataSource, $goodsIndex));
        $goodsList = helper::arrayColumn2Key($goodsData, 'goods_id');
        // 整理列表数据
        foreach ($dataSource as &$item) {
            $item['goods'] = isset($goodsList[$item[$goodsIndex]]) ? $goodsList[$item[$goodsIndex]] : null;
        }
        return $data;
    }

    /**
     * 商品多规格信息
     * @param GoodsModel|null $model
     * @return null|array
     */
    public static function getSpecData($model = null)
    {
        // 商品sku数据
        if (!is_null($model) && $model['spec_type'] == 20) {
            return $model->getManySpecData($model['spec_rel'], $model['skuList']);
        }
        return null;
    }

}