<?php

declare (strict_types = 1);

namespace app\wms\model;


class Menu extends BaseModel
{
    // 定义表名
    protected $name = 'sys_menu';
    protected $pk = 'menu_id';
    protected $isGlobalScopeStoreId = false;
    /**
     * @param array $menuIds
     * @return array
     *  @throws \think\db\exception\DbException
     */
    public static function getMenus(array $menuIds = [])
    {
        $where = [];
        if($menuIds) $where[] = ['menu_id', 'in', $menuIds];
        return static::withoutGlobalScope()->where($where)->order(['orderNo' => 'asc', 'create_time' => 'asc'])
                ->select()->each(function($item,$key){
                    if($item['accessApi']) $item['accessApi'] = explode(",",$item['accessApi']);
                    return $item;
                });
    }
    public static function getPermCode()
    {
        $where = [];
        $where[] = ['menu_type', '=', 30];
        return static::withoutGlobalScope()->where($where)->column('name');
    }
    public function getList(array $params)
    {
        $where = [];
        !empty($params['title']) && $where[] = ['title', 'like', "%{$params['title']}%"];
        !empty($params['status']) && $where[] = ['status', '=', $params['status']];
        $list = $this->where($where)->order(['orderNo' => 'asc', 'create_time' => 'asc'])
                ->select()->each(function ($item,$key){
                    $item['accessApi'] = $item['accessApi']?explode(",",$item['accessApi']):[];
                    return $item;
            });
        return $this->getTreeData($list);
    }
    protected function getTreeData($menuList, int $parentId = 0)
    {
        $data = [];
        foreach ($menuList as $key => $item) {
            if ($item['parent_id'] == $parentId) {
                $children = $this->getTreeData($menuList, (int)$item['menu_id']);
                !empty($children) && $item['children'] = $children;
                $item['menu_id'] = (string) $item['menu_id'];
                $data[] = $item;
                unset($menuList[$key]);
            }
        }
        return $data;
    }
    public static function getParents(array $finds)
    {
        $list = static::withoutGlobalScope()
            ->order(['orderNo' => 'asc', 'create_time' => 'asc'])
            ->select()->toArray();
        $parentId = [];
        foreach($finds as $find)
        {
            $parentId = array_merge($parentId,self::getParentData($list, (int)$find));
        }
        return $parentId;
    }
    protected static function getParentData($menuList, int $findId)
    {
        $data = [];
        foreach ($menuList as $key => $item) {
            if ($item['menu_id'] == $findId && $item['parent_id']!==0) {
                $data[] = $item['parent_id'];
                $data = array_merge($data,self::getParentData($menuList, (int)$item['parent_id']));
            }
        }
        return $data;
    }
    public function add(array $data)
    {
        $menu_id = $data['menu_id'];
        unset($data['menu_id']);
        if(!empty($data['accessApi']))
        {
            $accessApi = isset($data['accessApi']['checked'])?$data['accessApi']['checked']:$data['accessApi'];
            $data['accessApi'] = join(",",$accessApi);
        }
        if(!empty($menu_id))
        {
             return static::withoutGlobalScope()->find($menu_id)->save($data);
        }
        else
        {
            return $this->save($data);
        }
    }
}
