<?php

declare (strict_types = 1);

namespace app\common\model\admin;

use app\common\model\BaseModel;

/**
 * 超管后台用户模型
 * Class User
 * @package app\common\model\admin
 */
class User extends BaseModel
{
    // 定义表名
    protected $name = 'admin_user';

    // 定义主键
    protected $pk = 'admin_user_id';

    /**
     * 超管用户信息
     * @param $id
     * @return array|null|static
     */
    public static function detail(int $id)
    {
        return static::get($id);
    }

}