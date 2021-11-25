<?php

declare (strict_types=1);

namespace app\wms\controller\system;

use app\wms\controller\Controller;
use app\wms\model\Api as Model;
class Api extends Controller
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new Model;
    }
}
