<?php

declare (strict_types=1);

namespace app\wms\controller\stock;

use app\wms\controller\Controller;
use app\wms\model\stock as Model;

class Scatter extends Controller
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new Model;
    }
}
