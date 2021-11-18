<?php

declare (strict_types = 1);

namespace app\common\model\article;

use app\common\model\BaseModel;

/**
 * 文章分类模型
 * Class Category
 * @package app\common\model
 */
class Category extends BaseModel
{
    // 定义表名
    protected $name = 'article_category';

    // 定义主键
    protected $pk = 'category_id';

    /**
     * 分类详情
     * @param int $categoryId
     * @return static|null
     */
    public static function detail(int $categoryId)
    {
        return static::get($categoryId);
    }

    /**
     * 获取列表
     * @param array $where
     * @return \think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getList(array $where = [])
    {
        return $this->where($where)
            ->order(['sort', $this->getPk()])
            ->select();
    }

}
