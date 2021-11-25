<?php

declare (strict_types=1);

namespace app\wms\controller\system;

use app\wms\controller\Controller;
use app\wms\model\Menu as Model;
class Menu extends Controller
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new Model;
    }
}
