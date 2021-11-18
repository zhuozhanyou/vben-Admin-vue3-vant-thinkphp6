<?php

declare (strict_types=1);

namespace app\wms\controller;

use app\wms\model\User as UserModel;
use app\wms\service\User as UserService;

class Passport extends Controller
{

    protected $methodRules = [
        'login' => 'POST'
    ];

    public function initialize()
    {
        parent::initialize();
        $this->model = new UserModel;
    }
    public function login()
    {
        $model = new UserModel;
        if (($userInfo = $model->login($this->postData())) === false) {
            return $this->renderError($model->getError() ?: '登录失败');
        }
        return $this->renderSuccess([
            'userId' => (int)$userInfo['user_id'],
            'token' => $model->getToken()
        ], '登录成功');
    }

    public function logout()
    {
        UserService::logout();
        return $this->renderSuccess('操作成功');
    }

}
