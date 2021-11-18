<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 商品与分类关系模型
 * Class GoodsCategoryRel
 * @package app\common\model
 */
class GoodsCategoryRel extends BaseModel
{
    // 定义表名
    protected $name = 'goods_category_rel';

    // 定义主键
    protected $pk = 'id';

    protected $updateTime = false;

}
