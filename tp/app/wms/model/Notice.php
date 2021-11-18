<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;
use app\wms\service\User as UserService;
use \think\Request;

class Notice extends BaseModel
{
    protected $name = 'sys_notice';
    protected $pk   = 'notice_id';

    private function setWhere(array $param)
    {
        $query = $this->db();

        !empty($param['user_name']) && $query->where("{$this->name}.user_name", "like", "%{$param['user_name']}%");
        !empty($param['api']) && $query->where("wms_sys_api.name|{$this->name}.url", "like", "%{$param['api']}%");
        !empty($param['op_time']) && $query->whereTime("{$this->name}.create_time", "between", $param['op_time']);

        return $query;
    }
    public function getList(array $param)
    {
        $query = $this->setWhere($param);
        return $query->order($this->listOrder($param))->select()->toArray();
    }
    public function add(array $data)
    {
        $id = $data[$this->pk];
        unset($data[$this->pk]);
        if(!empty($id))
        {
            return $this->find($id)->save($data);
        }
        else
        {
            $user = UserService::getLoginInfo();
            $data['create_user'] = $user['user']['real_name'];
            return $this->save($data);
        }
    }
}
