<?php

declare (strict_types = 1);

namespace app\wms\model;


class Goods extends QnModel
{
    protected $connection = 'qingniu';
    protected $pk = 'goodsId';
}
