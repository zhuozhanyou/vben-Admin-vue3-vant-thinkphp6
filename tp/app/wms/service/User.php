<?php

declare (strict_types = 1);

namespace app\wms\service;

use app\wms\model\Menu as MenuModel;
use app\wms\model\Role as RoleModel;
use think\facade\Cache;
use app\common\service\BaseService;

/**
 * 商家用户服务类
 * Class User
 */
class User extends BaseService
{
    // 用于生成token的自定义盐
    const TOKEN_SALT = '_wms_user_salt_';

    /**
     * 获取当前登录用户的信息
     * @return mixed
     */
    public static function getLoginInfo()
    {
        if (($token = self::getToken()) !== false) {
            return Cache::get($token);
        }
        return false;
    }

    /**
     * 获取当前登录用户的ID
     * @return mixed
     */
    public static function getLoginUserId()
    {
        return (int)static::getLoginInfo()['user']['user_id'];
    }

    /**
     * 记录登录信息
     * @param array $userInfo
     * @return bool
     */
    public static function login(array $userInfo)
    {
        // 生成token
        $token = self::makeToken((int)$userInfo['user_id']);
        $rs = [
            'user' => $userInfo,
            'is_login' => true,
        ];
        $rs = array_merge($rs,self::getUserMenu($userInfo));
        // 记录缓存, 7天
        Cache::set($token, $rs, 86400 * 7);
        return $token;
    }

    /**
     * 清空登录状态
     * @return bool
     */
    public static function logout()
    {
        Cache::delete(self::getToken());
        return true;
    }

    /**
     * 生成用户认证的token
     * @param int $userId
     * @return string
     */
    protected static function makeToken(int $userId)
    {
        // 生成一个不会重复的随机字符串
        $guid = get_guid_v4();
        // 当前时间戳 (精确到毫秒)
        $timeStamp = microtime(true);
        // 自定义一个盐
        $salt = self::TOKEN_SALT;
        return md5("{$timeStamp}_{$userId}_{$guid}_{$salt}");
    }

    /**
     * 获取用户认证Token
     * @return bool|string
     */
    private static function getToken()
    {
        // 获取请求中的token
        $token = request()->header('Authorization');
        // 调试模式下可通过param
        if (empty($token) && is_debug()) {
            $token = request()->param('Authorization');
        }
        // 不存在token报错
        if (empty($token)) {
            return false;
        }
        return $token;
    }
    /**
     * 获取当前用户的权限url列表
     * @return array
     * @param $user
     * @throws \think\db\exception\DbException
     */
    protected static function getUserMenu($user)
    {
        $menuIds = [];
        $roleMenu = $user['role_id']?RoleModel::getMenuIds(explode(",",$user['role_id'])):[];
        if($user['menu_id']) $roleMenu = array_merge($roleMenu,$user['menu_id']);
        foreach($roleMenu as $v)
        {
            $menuIds = array_merge($menuIds,explode(',',$v));
        }
        $user['is_super']===1 && $menuIds = [];
        $menus = (MenuModel::getMenus($menuIds))->toArray();
        $permCode = array_filter($menus,function($v){return $v['menu_type'] == '30';});
        $menuList  = array_filter($menus,function($v){return $v['menu_type'] != '30';});
        $accessApi = array_reduce($menus,function ($v,$item){return $item['accessApi']?array_merge($v,$item['accessApi']):$v;},[]);

        $rs = [];
        $rs['permCode']  = $user['is_super']===1?MenuModel::getPermCode():array_column($permCode,'name');
        $rs['routers']   = self::getTreeMenu($menuList);
        $rs['accessApi'] = array_unique($accessApi);
        return $rs;
    }
    /**
     * 获取树状菜单列表
     * @param $menuList
     * @param int $parentId
     * @return array
     */
    protected static function getTreeMenu($menuList, int $parentId = 0)
    {
        $data = [];
        foreach ($menuList as $key => $item) {
            if ($item['parent_id'] == $parentId) {
                $children = self::getTreeMenu($menuList, (int)$item['menu_id']);
                $route = [];
                $route['path'] = $item['path'];
                $route['name'] = $item['name'];
                $route['component'] = $item['component'];

                $meta = [];
                $meta['title'] = $item['title'];
                $meta['ignoreKeepAlive'] = $item['ignoreKeepAlive']==1 ? true:false;
                if($item['icon'])     $meta['icon']    = $item['icon'];
                if($item['orderNo'])  $meta['orderNo'] = $item['orderNo'];
                if($item['hideChildrenInMenu']>0) $meta['hideChildrenInMenu'] = true;
                if($item['frameSrc']>0)  $meta['frameSrc'] = $item['path'];
                $route['meta'] = $meta;

                !empty($children) && $item['children']  = $children;
                if(isset($item['children'])) $route['redirect'] = $item['path'] . "/" . $item['children'][0]['path'];

                !empty($children) && $route['children'] = $children;
                $data[] = $route;
                unset($menuList[$key]);
            }
        }
        return $data;
    }
}
