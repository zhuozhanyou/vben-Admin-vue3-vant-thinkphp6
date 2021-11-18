<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 文件库分组模型
 * Class UploadGroup
 * @package app\common\model
 */
class UploadGroup extends BaseModel
{
    // 定义表名
    protected $name = 'upload_group';

    // 定义主键
    protected $pk = 'group_id';

    /**
     * 分组详情
     * @param int|array $where
     * @return static|array|null
     */
    public static function detail($where)
    {
        return self::get($where);
    }

}
