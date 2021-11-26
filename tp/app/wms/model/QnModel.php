<?php

declare (strict_types=1);

namespace app\wms\model;

use think\Model;
/**
 * 模型基类
 * Class BaseModel
 * @package app\common\model
 */
class QnModel extends Model
{
    // 定义表名
    protected $name;

    // 模型别名
    protected $alias = '';

    // 错误信息
    protected $error = '';

    protected $lastSql = '';
    /**
     * 模型基类初始化
     */
    public static function init()
    {
        parent::init();
    }
}
