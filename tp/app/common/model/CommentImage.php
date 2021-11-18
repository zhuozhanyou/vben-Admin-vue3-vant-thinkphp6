<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 商品评价图片模型
 * Class CommentImage
 * @package app\common\model
 */
class CommentImage extends BaseModel
{
    // 定义表名
    protected $name = 'comment_image';

    // 定义主键
    protected $pk = 'id';

    protected $updateTime = false;

    /**
     * 关联文件库
     * @return \think\model\relation\BelongsTo
     */
    public function file()
    {
        return $this->belongsTo('UploadFile', 'image_id', 'file_id');
    }

}
