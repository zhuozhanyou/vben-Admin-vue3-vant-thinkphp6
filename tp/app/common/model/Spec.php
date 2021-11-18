<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 规格/属性(组)模型
 * Class Spec
 * @package app\common\model
 */
class Spec extends BaseModel
{
    // 定义表名
    protected $name = 'spec';

    // 定义主键
    protected $pk = 'spec_id';

    protected $updateTime = false;

}
