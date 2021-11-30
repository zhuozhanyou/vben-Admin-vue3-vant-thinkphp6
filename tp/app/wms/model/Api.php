<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;

class Api extends BaseModel
{
    protected $name = 'sys_api';
    protected $pk = 'id';
    protected $isGlobalScopeStoreId = false;

    public function getList(array $params)
    {
        $where = [];
        !empty($params['name']) && $where[] = ['name', 'like', "%{$params['name']}%"];
        !empty($params['url']) && $where[] = ['url', 'like', "%{$params['url']}%"];
        $list = $this->where($where)->order(['sort' => 'asc', 'create_time' => 'asc'])->select()->toArray();
        return $this->getTreeData($list);
    }
    protected function getTreeData($datalist, int $parentId = 0)
    {
        $data = [];
        foreach ($datalist as $key => $item) {
            if ($item['pid'] == $parentId) {
                $children = $this->getTreeData($datalist, (int)$item['id']);
                !empty($children) && $item['children'] = $children;
                $item['id'] = (string) $item['id'];
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
}
