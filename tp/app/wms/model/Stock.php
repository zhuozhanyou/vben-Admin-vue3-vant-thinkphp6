<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;

class Stock extends BaseModel
{

    public function getList(array $params)
    {
        $where = [];
        !empty($params['fname']) && $where[] = ['fname', 'like', "%{$params['fname']}%"];
        $list = $this->where($where)->order(['sort' => 'asc', 'create_time' => 'asc'])->select()->toArray();
        return $list;
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
