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
}
