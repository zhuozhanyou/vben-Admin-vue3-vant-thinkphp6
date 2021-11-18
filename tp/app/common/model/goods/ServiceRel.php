<?php

declare (strict_types = 1);

namespace app\common\model\goods;

use app\common\model\BaseModel;

/**
 * 商品服务与承诺模型
 * Class ServiceRel
 */
class ServiceRel extends BaseModel
{
    // 定义表名
    protected $name = 'goods_service_rel';

    // 定义主键
    protected $pk = 'id';

    protected $updateTime = false;

    /**
     * 获取商品服务与承诺ID集
     * @param int $goodsId
     * @return array
     */
    public static function getServiceIds(int $goodsId)
    {
        return (new static)->where('goods_id', '=', $goodsId)->column('service_id');
    }

}
