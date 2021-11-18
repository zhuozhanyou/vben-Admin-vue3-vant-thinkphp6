<?php

declare (strict_types = 1);

namespace app\common\model\store;

use app\common\model\BaseModel;

/**
 * 商家用户角色模型
 * Class UserRole
 * @package app\common\model\admin
 */
class UserRole extends BaseModel
{
    // 定义表名
    protected $name = 'store_user_role';

    // 定义主键
    protected $pk = 'id';

    protected $updateTime = false;

}