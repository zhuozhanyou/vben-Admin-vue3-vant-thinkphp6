<?php

declare (strict_types=1);

namespace app\wms\service;

use app\wms\service\User as UserService;

/**
 * 商家后台权限业务
 * Class Auth
 * @package app\admin\service
 */
class Auth
{
    // 实例句柄
    static public $instance;
    // 用户信息
    private $user;

    /**
     * 公有化获取实例方法
     * @return Auth
     */
    public static function getInstance()
    {
        if (!(self::$instance instanceof Auth)) {
            self::$instance = new self;
        }
        return self::$instance;
    }

    /**
     * 私有化构造方法
     * Auth constructor.
     */
    private function __construct()
    {
        // 商家登录信息
        $this->user = UserService::getLoginInfo();
    }

    /**
     * 私有化克隆方法
     */
    private function __clone()
    {
    }

    /**
     * 验证指定url是否有访问权限
     * @param $url
     * @param bool $strict 严格模式($url必须全部有权)
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function checkPrivilege($url, bool $strict = true)
    {
        if (!is_array($url)) {
            return $this->checkAccess($url);
        }
        foreach ($url as $val) {
            $status = $this->checkAccess($val);
            if ($strict && !$status) return false;
            if (!$strict && $status) return true;
        }
        return true;
    }

    /**
     * 验证url的权限
     * @param $url
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    private function checkAccess($url)
    {
        // 域名白名单
        // config/allowapi.php
        $allowApis = config('allowapi');
        // 验证当前请求是否在白名单
        if (in_array($url, $allowApis)) {
            return true;
        }
        // 用户不存在 禁止访问
        if (empty($this->user)) {
            return false;
        }
        // 超级管理员无需验证
        if ($this->user['user']['is_super']===1) {
            return true;
        }
        // 通配符支持
        foreach ($allowApis as $action) {
            if (strpos($action, '*') !== false
                && preg_match('/^' . str_replace('/', '\/', $action) . '/', $url)
            ) {
                return true;
            }
        }
        if (!in_array($url, $this->user['accessApi'])) {
            return false;
        }
        return true;
    }
}
