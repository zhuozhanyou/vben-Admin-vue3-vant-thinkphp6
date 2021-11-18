<?php

declare (strict_types = 1);

namespace app\common\model\store;

use app\common\model\BaseModel;

/**
 * 商家用户角色模型
 * Class Role
 * @package app\common\model\admin
 */
class Role extends BaseModel
{
    // 定义表名
    protected $name = 'store_role';

    // 定义主键
    protected $pk = 'role_id';

    /**
     * 关联操作权限
     * @return \think\model\relation\HasMany
     */
    public function roleMenu()
    {
        return $this->hasMany('RoleMenu', 'role_id');
    }

    /**
     * 角色信息
     * @param $where
     * @return array|null|static
     */
    public static function detail($where)
    {
        return static::get($where);
    }

}
