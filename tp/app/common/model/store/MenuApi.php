<?php

declare (strict_types = 1);

namespace app\common\model\store;

use app\common\model\BaseModel;

/**
 * 商家后台用户角色与菜单权限关系表模型
 * Class MenuApi
 * @package app\common\model\store
 */
class MenuApi extends BaseModel
{
    // 定义表名
    protected $name = 'store_menu_api';

    // 定义表主键
    protected $pk = 'id';

    protected $updateTime = false;

    // 不允许全局查询store_id
    protected $isGlobalScopeStoreId = false;

}
