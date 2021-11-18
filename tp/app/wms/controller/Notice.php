<?php

declare (strict_types=1);

namespace app\wms\controller;

use app\wms\model\Notice as Model;
class Notice extends Controller
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new Model;
    }
    public function add()
    {
        if ($this->model->add($this->request->post('',null,null))!==false) {
            return $this->renderSuccess('操作成功');
        }
        return $this->renderError($this->model->getError() ?: '操作失败');
    }
}
