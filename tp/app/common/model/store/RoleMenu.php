<?php

declare (strict_types = 1);

namespace app\common\model\store;

use app\common\model\BaseModel;

/**
 * 商家后台用户角色与菜单权限关系模型
 * Class RoleAccess
 * @package app\common\model\admin
 */
class RoleMenu extends BaseModel
{
    // 定义表名
    protected $name = 'store_role_menu';

    protected $updateTime = false;

}
