<?php

declare (strict_types = 1);

namespace app\common\model;

/**
 * 商家记录表模型
 * Class Store
 * @package app\common\model
 */
class Store extends BaseModel
{
    // 定义表名
    protected $name = 'store';

    // 定义主键
    protected $pk = 'store_id';

    /**
     * 关联logo图片
     * @return \think\model\relation\HasOne
     */
    public function logoImage()
    {
        return $this->hasOne('UploadFile', 'file_id', 'logo_image_id');
    }

    /**
     * 详情信息
     * @param int $storeId
     * @return array|null|static
     */
    public static function detail(int $storeId)
    {
        return self::get($storeId, ['logoImage']);
    }

    /**
     * 获取列表数据
     * @param bool $isRecycle 是否在回收站
     * @return \think\Paginator
     * @throws \think\db\exception\DbException
     */
    public function getList(bool $isRecycle = false)
    {
        return $this->where('is_recycle', '=', (int)$isRecycle)
            ->where('is_delete', '=', 0)
            ->order(['create_time' => 'desc', $this->getPk()])
            ->paginate(15);
    }

}
