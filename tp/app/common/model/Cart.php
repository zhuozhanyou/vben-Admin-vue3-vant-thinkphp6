<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 模型类：购物车
 * Class Cart
 * @package app\common\model
 */
class Cart extends BaseModel
{
    // 定义表名
    protected $name = 'cart';

    // 定义主键
    protected $pk = 'id';

    /**
     * 详情记录
     * @param int $userId 用户ID
     * @param int $goodsId 商品ID
     * @param string $goodsSkuId 商品sku唯一标识
     * @return array|static|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function detail(int $userId, int $goodsId, string $goodsSkuId)
    {
        return (new static)->where('user_id', '=', $userId)
            ->where('goods_id', '=', $goodsId)
            ->where('goods_sku_id', '=', $goodsSkuId)
            ->where('is_delete', '=', 0)
            ->find();
    }

}