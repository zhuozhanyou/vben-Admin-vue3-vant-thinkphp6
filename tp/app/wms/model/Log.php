<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;

class Log extends BaseModel
{
    protected $name = 'sys_log';
    protected $pk = 'id';
    private function setWhere(array $param)
    {
        $query = $this->db();

        !empty($param['user_name']) && $query->where("{$this->name}.user_name", "like", "%{$param['user_name']}%");
        !empty($param['api']) && $query->where("sys_api.name|{$this->name}.url", "like", "%{$param['api']}%");
        !empty($param['op_time']) && $query->whereTime("{$this->name}.create_time", "between", $param['op_time']);

        return $query;
    }
    public function getList(array $param)
    {
        $query = $this->setWhere($param);
        return $query->alias($this->name)->field(["$this->name.*,sys_api.name api_name"])
                ->leftJoin("sys_api","sys_api.url = {$this->name}.url")
                ->order($this->listOrder($param))->select()->toArray();
    }

    public function add(array $data)
    {
        return $this->save($data);
    }
}
