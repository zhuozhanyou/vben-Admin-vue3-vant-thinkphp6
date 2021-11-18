<?php

declare (strict_types=1);

namespace app\common\model;

use app\common\library\helper;

/**
 * 订单商品模型
 * Class OrderGoods
 * @package app\common\model
 */
class OrderGoods extends BaseModel
{
    // 定义表名
    protected $name = 'order_goods';

    // 定义主键
    protected $pk = 'order_goods_id';

    protected $updateTime = false;

    /**
     * 订单商品图片
     * @return \think\model\relation\BelongsTo
     */
    public function image()
    {
        $model = "app\\common\\model\\UploadFile";
        return $this->belongsTo($model, 'image_id', 'file_id')
            ->bind(['goods_image' => 'preview_url']);
    }

    /**
     * 关联商品表
     * @return \think\model\relation\BelongsTo
     */
    public function goods()
    {
        return $this->belongsTo('Goods');
    }

    /**
     * 关联订单主表
     * @return \think\model\relation\BelongsTo
     */
    public function orderM()
    {
        return $this->belongsTo('Order');
    }

    /**
     * 售后单记录表
     * @return \think\model\relation\HasOne
     */
    public function refund()
    {
        return $this->hasOne('OrderRefund');
    }

    /**
     * 获取器：规格属性
     * @param $value
     * @return array
     */
    public function getGoodsPropsAttr($value)
    {
        return helper::jsonDecode($value);
    }

    /**
     * 设置器：规格属性
     * @param $value
     * @return string
     */
    public function setGoodsPropsAttr($value)
    {
        return $value ? helper::jsonEncode($value) : '';
    }

    /**
     * 订单商品详情
     * @param $where
     * @return OrderGoods|null
     */
    public static function detail($where)
    {
        return static::get($where, ['image', 'refund']);
    }

}
