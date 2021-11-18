<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 售后单图片模型
 * Class OrderRefundImage
 * @package app\common\model
 */
class OrderRefundImage extends BaseModel
{
    // 定义表名
    protected $name = 'order_refund_image';

    // 定义主键
    protected $pk = 'id';

    protected $updateTime = false;

    /**
     * 关联文件库
     * @return \think\model\relation\BelongsTo
     */
    public function file()
    {
        return $this->belongsTo('UploadFile', 'image_id', 'file_id')->bind(['image_url' => 'preview_url']);
    }

}
