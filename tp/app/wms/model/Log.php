<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;

class Log extends BaseModel
{
    protected $name = 'sys_log';
    protected $pk = 'id';

    public function api()
    {
        return $this->hasOne(Api::class,'url','url');
    }
    private function setWhere(array $param)
    {
        $query = $this->db();
        !empty($param['user_name']) && $query->where("user_name", "like", "%{$param['user_name']}%");
        !empty($param['api']) && $query->hasWhere("api",function($query) use($param){ $query->where("name", "like", "%{$param['api']}%");});
        !empty($param['op_time']) && $query->whereTime("create_time", "between", $param['op_time']);

        return $query;
    }
    public function getList(array $param)
    {
        $query = $this->setWhere($param);
        return $query->with('api')->order($this->listOrder($param))->select()->toArray();
    }

    public function add(array $data)
    {
        return $this->save($data);
    }
}
