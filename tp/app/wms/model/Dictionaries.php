<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;
use think\facade\Cache;

class Dictionaries extends BaseModel
{
    protected $name = 'sys_dictionaries';
    protected $pk = 'id';
    protected $isGlobalScopeStoreId = false;

    public function getList(array $params)
    {
        $where = [];
        !empty($params['name']) && $where[] = ['name', 'like', "%{$params['name']}%"];
        !empty($params['code']) && $where[] = ['code', '=', $params['code']];
        !empty($params['parent_id']) && $where[] = ['parent_id', '=', $params['parent_id']];
        $where[] = ['type', '=', 20];
        $list = $this->where($where)->order(['sort' => 'asc', 'create_time' => 'asc'])->select()->toArray();
        return $list;
    }
    public function getListTree($params = [])
    {
        $where = [];
        $where[] = ['type', '=', 10];
        $list = $this->where($where)->order(['create_time' => 'desc'])->select()->toArray();
        return $this->getTreeData($list);
    }
    protected function getTreeData($datalist, int $parentId = 0)
    {
        $data = [];
        foreach ($datalist as $key => $item) {
            if ($item['parent_id'] == $parentId) {
                $children = $this->getTreeData($datalist, (int)$item['id']);
                !empty($children) && $item['children'] = $children;
                $data[] = $item;
                unset($datalist[$key]);
            }
        }
        return $data;
    }
    public function add(array $data)
    {
        $id = $data['id'];
        unset($data['id']);
        if(!empty($id))
        {
             return $this->find($id)->save($data);
        }
        else
        {
            return $this->save($data);
        }
    }
    public static function createCache()
    {
        $where = [];
        $where[] = ['type', '=', 20];
        $list = (new static)->where($where)->order(['parent_id' => 'asc','sort'=>'asc'])->column('parent_id,name,code');
        $parentId = array_unique(array_column($list,'parent_id'));
        $parent = (new static)->where('id','in',$parentId)->column('code','id');
        $data = [];
        foreach($list as $v)
        {
            $data[$parent[$v['parent_id']]][] = ['id'=>$v['code'],'name'=>$v['name']];
        }
        Cache::set('dic', $data);
        return $data;
    }
    public function getDic(array $params = [])
    {
        $data = Cache::get('dic');
        if(empty($data))
        {
            $data = $this->createCache();
        }
        return empty($params['item'])?$data:$data[$params['item']];
    }
}
