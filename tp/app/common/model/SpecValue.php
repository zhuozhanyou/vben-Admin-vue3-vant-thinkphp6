<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 规格/属性(值)模型
 * Class SpecValue
 * @package app\common\model
 */
class SpecValue extends BaseModel
{
    // 定义表名
    protected $name = 'spec_value';

    // 定义主键
    protected $pk = 'spec_value_id';

    protected $updateTime = false;

    /**
     * 关联规格组表
     * @return $this|\think\model\relation\BelongsTo
     */
    public function spec()
    {
        return $this->belongsTo('Spec');
    }

}
