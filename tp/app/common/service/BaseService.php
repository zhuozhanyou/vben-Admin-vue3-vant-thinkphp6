<?php

declare (strict_types = 1);

namespace app\common\service;

use think\facade\Request;

/**
 * 系统服务基础类
 * Class BaseService
 * @package app\common\service
 */
class BaseService
{
    // 请求管理类
    /* @var $request \think\Request */
    protected $request;

    // 错误信息
    protected $error;

    // 当前访问的商城ID
    protected $storeId;

    /**
     * 构造方法
     * BaseService constructor.
     */
    public function __construct()
    {
        // 请求管理类
        $this->request = Request::instance();
        // 执行构造方法
        $this->initialize();
    }

    /**
     * 构造方法 (供继承的子类使用)
     */
    protected function initialize()
    {
        // 获取当前操作的商城ID
        $this->getStoreId();
    }

    /**
     * 获取当前操作的商城ID
     * @return int|null
     */
    protected function getStoreId()
    {
        if (empty($this->storeId) && in_array(app_name(), ['store', 'api'])) {
            $this->storeId = getStoreId();
        }
        return $this->storeId;
    }

    /**
     * 获取错误信息
     * @return mixed
     */
    public function getError()
    {
        return empty($this->error) ? false : $this->error;
    }

    /**
     * 是否存在错误
     * @return bool
     */
    public function hasError()
    {
        return !empty($this->error);
    }

}
