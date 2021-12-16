<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;
use app\wms\model\Menu as MenuModel;

class Role extends BaseModel
{
    protected $name = 'sys_role';
    protected $pk = 'role_id';

    public static function getMenuIds(array $roleIds)
    {
        $where = [];
        $where[] = ['role_id', 'in', $roleIds];
        $where[] = ['status', '=', 1];
        return (new self)->where($where)->column('menu_id');
    }
    public static function getRoleNames(array $roleIds)
    {
        return (new self)->where('role_id', 'in', $roleIds)->column('role_name');
    }
    public function getList($params = [])
    {
        $where = [];
        !empty($params['role_name']) && $where[] = ['role_name', 'like', "%{$params['role_name']}%"];
        !empty($params['status']) && $where[] = ['status', '=', $params['status']];
        // 查询列表记录
        $list = $this->where($where)->order(['create_time' => 'desc'])->paginate()->each(function($item,$key){
            if($item['menu_id']) $item['menu_id'] = array_map(function($v){return (int)$v;},explode(",",$item['menu_id']));
        })->toArray();
        return $list;
    }
    public function getListAll($params = [])
    {
        $where = [];
        $where[] = ['status', '=', 1];
        $list = $this->where($where)->order(['create_time' => 'desc'])->select()->toArray();
        return $list;
    }
    public function add(array $data)
    {
        $role_id = $data['role_id'];
        unset($data['role_id']);
        $menuId = isset($data['menu_id']['checked'])?$data['menu_id']['checked']:$data['menu_id'];
        $parentId = array_unique(MenuModel::getParents($menuId));
        $data['menu_id'] = join(",",array_unique(array_merge($menuId,$parentId)));
        if(!empty($role_id))
        {
            return $this->find($role_id)->save($data);
        }
        else
        {
            return $this->save($data);
        }
    }
    public  function setRoleStatus(array $data)
    {
        return $this->find($data['id'])->save(['status'=>$data['status']]);
    }
}
