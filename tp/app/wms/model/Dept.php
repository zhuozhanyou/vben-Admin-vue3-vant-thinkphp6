<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;

class Dept extends BaseModel
{
    protected $name = 'sys_dept';
    protected $pk = 'dept_id';

    public function getList(array $params)
    {
        $where = [];
        !empty($params['dept_name']) && $where[] = ['dept_name', 'like', "%{$params['dept_name']}%"];
        !empty($params['status']) && $where[] = ['status', '=', $params['status']];
        $list = $this->where($where)->order(['sort' => 'asc', 'create_time' => 'asc'])->select()->toArray();
        return $this->getTreeData($list);
    }
    protected function getTreeData($datalist, int $parentId = 0)
    {
        $data = [];
        foreach ($datalist as $key => $item) {
            if ($item['parent_id'] == $parentId) {
                $children = $this->getTreeData($datalist, (int)$item['dept_id']);
                !empty($children) && $item['children'] = $children;
                $data[] = $item;
                unset($datalist[$key]);
            }
        }
        return $data;
    }
    public function add(array $data)
    {
        $id = $data['dept_id'];
        unset($data['dept_id']);
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
