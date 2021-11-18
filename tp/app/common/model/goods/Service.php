<?php

declare (strict_types = 1);

namespace app\common\model\goods;

use app\common\model\BaseModel;

/**
 * 商品服务与承诺模型
 * Class Service
 */
class Service extends BaseModel
{
    // 定义表名
    protected $name = 'goods_service';

    // 定义主键
    protected $pk = 'service_id';

    /**
     * 帮助详情
     * @param int $helpId
     * @return null|static
     */
    public static function detail(int $helpId)
    {
        return self::get($helpId);
    }

}
