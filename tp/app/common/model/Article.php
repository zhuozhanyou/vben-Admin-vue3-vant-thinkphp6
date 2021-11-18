<?php

declare (strict_types=1);

namespace app\common\model;

/**
 * 文章模型
 * Class Article
 * @package app\common\model
 */
class Article extends BaseModel
{
    // 定义表名
    protected $name = 'article';

    // 定义主键
    protected $pk = 'article_id';

    // 追加字段
    protected $append = ['show_views'];

    /**
     * 关联文章封面图
     * @return \think\model\relation\HasOne
     */
    public function image()
    {
        return $this->hasOne('uploadFile', 'file_id', 'image_id')
            ->bind(['image_url' => 'preview_url']);
    }

    /**
     * 关联文章分类表
     * @return \think\model\relation\BelongsTo
     */
    public function category()
    {
        $module = self::getCalledModule();
        return $this->BelongsTo("app\\{$module}\\model\\article\\Category", 'category_id');
    }

    /**
     * 文章详情：HTML实体转换回普通字符
     * @param $value
     * @return string
     */
    public function getContentAttr($value)
    {
        return htmlspecialchars_decode($value);
    }

    /**
     * 展示的浏览次数
     * @param $value
     * @param $data
     * @return mixed
     */
    public function getShowViewsAttr($value, $data)
    {
        return $data['virtual_views'] + $data['actual_views'];
    }

    /**
     * 文章详情
     * @param int $articleId
     * @param array $with
     * @return array|null|static
     */
    public static function detail(int $articleId, array $with = [])
    {
        return self::get($articleId, $with);
    }
}
