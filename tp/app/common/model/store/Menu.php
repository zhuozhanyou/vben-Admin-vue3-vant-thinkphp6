<?php

declare (strict_types=1);

namespace app\common\model\store;

use app\common\library\helper;
use app\common\model\BaseModel;

/**
 * 商家后台菜单模型
 * Class Menu
 * @package app\common\model\admin
 */
class Menu extends BaseModel
{
    // 定义表名
    protected $name = 'store_menu';

    // 定义表主键
    protected $pk = 'menu_id';

    /**
     * 关联操作权限
     * @return \think\model\relation\HasMany
     */
    public function menuApi()
    {
        return $this->hasMany('MenuApi', 'menu_id');
    }

    /**
     * 获取菜单列表
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getList()
    {
        $list = static::getAll();
        return $this->getTreeData($list);
    }

    /**
     * 获取所有菜单
     * @param array $where
     * @return \think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected static function getAll(array $where = [])
    {
        // 菜单列表
        $model = (new static)->addHidden(['menuApi']);
        $list = static::withoutGlobalScope()
            ->with(['menuApi'])
            ->where($where)
            ->order(['sort' => 'asc', 'create_time' => 'asc'])
            ->select();
        // 整理菜单绑定的apiID集
        return $model->getMenuApiIds($list);
    }

    /**
     * 获取树状菜单列表
     * @param $menuList
     * @param int $parentId
     * @return array
     */
    protected function getTreeData($menuList, int $parentId = 0)
    {
        $data = [];
        foreach ($menuList as $key => $item) {
            if ($item['parent_id'] == $parentId) {
                $children = $this->getTreeData($menuList, (int)$item['menu_id']);
                !empty($children) && $item['children'] = $children;
                $data[] = $item;
                unset($menuList[$key]);
            }
        }
        return $data;
    }

    /**
     * 整理菜单的api ID集
     * @param $menuList
     * @return mixed
     */
    private function getMenuApiIds($menuList)
    {
        foreach ($menuList as &$item) {
            if (!empty($item['menuApi'])) {
                $item['apiIds'] = helper::getArrayColumn($item['menuApi'], 'api_id');
            }
        }
        return $menuList;
    }

    /**
     * 菜单信息
     * @param int|array $where
     * @return array|null|static
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function detail($where)
    {
        $query = static::withoutGlobalScope();
        is_array($where) ? $query->where($where) : $query->where('menu_id', '=', $where);
        return $query->find();
    }

    /**
     * 获取菜单url集
     * @param $menuIds
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public static function getMenuUrls($menuIds)
    {
        $urls = [];
        foreach (static::getAll() as $item) {
            in_array($item['menu_id'], $menuIds) && $urls[] = $item['url'];
        }
        return $urls;
    }

}
