<?php

declare (strict_types=1);

namespace app\wms\controller;

class System extends Controller
{
    public function getUserInfo()
    {
        return $this->renderSuccess([
            'userId'   => (int)$this->userInfo['user']['user_id'],
            'username' => $this->userInfo['user']['user_name'],
            'realName' => $this->userInfo['user']['real_name'],
            'avatar' => $this->userInfo['user']['avatar'],
            'desc' => $this->userInfo['user']['remark'],
            'roles' => [],
            ]);
    }
    public function getPermCode()
    {
        return $this->renderSuccess($this->userInfo['permCode']);
    }
    public function getMenuList()
    {
        return $this->renderSuccess($this->userInfo['routers']);
    }
}
