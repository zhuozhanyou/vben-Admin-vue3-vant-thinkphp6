<?php

declare (strict_types=1);

namespace app\wms\controller;

use app\wms\model\User as Model;

class User extends Controller
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new Model;
    }
    public function changePassword()
    {
        $model = new Model;
        if ($model->changePassword($this->postData())!==false) {
            return $this->renderSuccess('操作成功');
        }
        return $this->renderError($model->getError() ?: '操作失败');
    }
}
