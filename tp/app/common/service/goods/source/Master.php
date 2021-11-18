<?php

declare (strict_types=1);

namespace app\common\service\goods\source;

use app\common\model\Goods as GoodsModel;
use app\common\model\GoodsSku as GoodsSkuModel;
use app\common\enum\goods\DeductStockType as DeductStockTypeEnum;

/**
 * 商品来源-普通商品扩展类
 * Class Master
 * @package app\common\service\stock
 */
class Master extends Basics
{
    /**
     * 更新商品库存 (针对下单减库存的商品)
     * @param $goodsList
     * @return bool
     */
    public function updateGoodsStock($goodsList)
    {
        $goodsData = [];
        $goodsSkuData = [];
        foreach ($goodsList as $goods) {
            // 是否减库存 (下单减库存)
            $isUpdateStockNum = $goods['deduct_stock_type'] == DeductStockTypeEnum::CREATE;
            // 商品的数据
            $isUpdateStockNum && $goodsData[] = [
                'where' => ['goods_id' => $goods['goods_id']],
                'data' => [
                    // 递减商品总库存
                    'stock_total' => ['dec', $goods['total_num']]
                ]
            ];
            // 商品SKU数据
            $isUpdateStockNum && $goodsSkuData[] = [
                'data' => ['stock_num' => ['dec', $goods['total_num']]],
                'where' => [
                    'goods_id' => $goods['goods_id'],
                    'goods_sku_id' => $goods['goods_sku_id'],
                ],
            ];
        }
        // 更新商品总库存
        !empty($goodsData) && $this->updateGoods($goodsData);
        // 更新商品sku库存
        !empty($goodsSkuData) && $this->updateGoodsSku($goodsSkuData);
        return true;
    }

    /**
     * 更新商品库存销量（订单付款后）
     * @param $goodsList
     * @return bool
     */
    public function updateStockSales($goodsList)
    {
        $goodsData = [];
        $goodsSkuData = [];
        foreach ($goodsList as $goods) {
            // 是否减库存 (付款减库存)
            $isUpdateStockNum = $goods['deduct_stock_type'] == DeductStockTypeEnum::PAYMENT;
            // 商品的数据
            $goodsDataItm = [
                'where' => ['goods_id' => $goods['goods_id']],
                'data' => [
                    // 累计商品实际销量
                    'sales_actual' => ['inc', $goods['total_num']]
                ]
            ];
            // 递减商品总库存
            $isUpdateStockNum && $goodsDataItm['data']['stock_total'] = ['dec', $goods['total_num']];
            $goodsData[] = $goodsDataItm;
            // 付款减库存
            $isUpdateStockNum && $goodsSkuData[] = [
                'where' => [
                    'goods_id' => $goods['goods_id'],
                    'goods_sku_id' => $goods['goods_sku_id'],
                ],
                'data' => ['stock_num' => ['dec', $goods['total_num']]],
            ];
        }
        // 更新商品信息
        !empty($goodsData) && $this->updateGoods($goodsData);
        // 更新商品sku信息
        !empty($goodsSkuData) && $this->updateGoodsSku($goodsSkuData);
        return true;
    }

    /**
     * 回退商品库存事件 (用于取消订单时调用)
     * @param mixed $goodsList 订单商品列表
     * @param bool $isPayOrder 是否为已支付订单
     * @return bool|mixed
     */
    public function backGoodsStock($goodsList, bool $isPayOrder = false)
    {
        $goodsData = [];
        $goodsSkuData = [];
        foreach ($goodsList as $goods) {
            // 更新条件: 订单已经支付或者订单商品为 "下单减库存"
            if ($isPayOrder == true || $goods['deduct_stock_type'] == DeductStockTypeEnum::CREATE) {
                $goodsData[] = [
                    'where' => ['goods_id' => $goods['goods_id']],
                    'data' => ['stock_total' => ['inc', $goods['total_num']]]
                ];
                $goodsSkuData[] = [
                    'where' => [
                        'goods_id' => $goods['goods_id'],
                        'goods_sku_id' => $goods['goods_sku_id'],
                    ],
                    'data' => ['stock_num' => ['inc', $goods['total_num']]],
                ];
            }
        }
        // 更新商品总库存
        !empty($goodsData) && $this->updateGoods($goodsData);
        // 更新商品sku库存
        !empty($goodsSkuData) && $this->updateGoodsSku($goodsSkuData);
        return true;
    }

    /**
     * 更新商品信息
     * @param array $data
     * @return array|false
     */
    private function updateGoods(array $data)
    {
        return (new GoodsModel)->updateAll($data);
    }

    /**
     * 更新商品sku信息
     * @param array $data
     * @return array|false
     */
    private function updateGoodsSku(array $data)
    {
        return (new GoodsSkuModel)->updateAll($data);
    }
}