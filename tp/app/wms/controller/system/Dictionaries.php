<?php

declare (strict_types=1);

namespace app\wms\controller\system;

use app\wms\controller\Controller;
use app\wms\model\Dictionaries as Model;
class Dictionaries extends Controller
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new Model;
    }
    public function getListTree()
    {
        $list = $this->model->getListTree($this->request->param());
        return $this->renderSuccess($list);
    }
    public function add()
    {
        if ($this->model->add($this->postData())!==false) {
            $this->model->createCache();
            return $this->renderSuccess('操作成功');
        }
        return $this->renderError($this->model->getError() ?: '操作失败');
    }
    public function del()
    {
        if ($this->model->destroy($this->postData())!==false) {
            $this->model->createCache();
            return $this->renderSuccess('操作成功');
        }
        return $this->renderError($this->model->getError() ?: '操作失败');
    }
    public function getDic()
    {
        $list = $this->model->getDic($this->request->param());
        return $this->renderSuccess($list);
    }
}
