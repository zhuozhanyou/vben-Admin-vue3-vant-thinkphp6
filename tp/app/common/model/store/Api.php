<?php

declare (strict_types=1);

namespace app\common\model\store;

use app\common\model\BaseModel;

/**
 * 商家后台API权限模型
 * Class Api
 * @package app\common\model\admin
 */
class Api extends BaseModel
{
    // 定义表名
    protected $name = 'store_api';

    // 定义表主键
    protected $pk = 'api_id';

    /**
     * 获取所有权限
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected static function getAll()
    {
        $data = static::withoutGlobalScope()
            ->order(['sort', 'create_time'])
            ->select();
        return !$data->isEmpty() ? $data->toArray() : [];
    }

    /**
     * 权限信息
     * @param int|array $where
     * @return array|null|static
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function detail($where)
    {
        $model = static::withoutGlobalScope();
        is_array($where) ? $model->where($where) : $model->where('api_id', '=', $where);
        return $model->find();
    }

    /**
     * 获取指定ID集的url
     * @param array $apiIds
     * @return array
     */
    public static function getApiUrls(array $apiIds)
    {
        return static::withoutGlobalScope()
            ->where('api_id', 'in', $apiIds)
            ->order(['sort', 'create_time'])
            ->column('url');
    }
}
