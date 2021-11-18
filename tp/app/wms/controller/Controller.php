<?php

declare (strict_types=1);

namespace app\wms\controller;

use app\wms\service\Auth as AuthService;
use app\wms\service\User as UserService;
use app\common\exception\BaseException;
use app\wms\model\Log as LogModel;

/**
 * 商户后台控制器基类
 * Class BaseController
 * @package app\store\controller
 */
class Controller extends \app\BaseController
{
    protected $model;
    // 商家登录信息
    protected $userInfo;

    // 当前控制器名称
    protected $controller = '';

    // 当前方法名称
    protected $action = '';

    // 当前路由uri
    protected $routeUri = '';

    // 当前路由：分组名称
    protected $group = '';

    // 登录验证白名单
    protected $allowAllAction = [
        'passport/login',
        'passport/logout',
    ];

    /**
     * 强制验证当前访问的控制器方法method
     * 例: [ 'login' => 'POST' ]
     * @var array
     */
    protected $methodRules = [];

    public function initialize()
    {
        // 当前路由信息
        $this->getRouteInfo();
        // 强制验证当前访问的控制器方法method
        $this->checkMethodRules();
        // 设置管理员登录信息
        $this->getUserInfo();
        // 验证登录状态
        $this->checkLogin();
        // 验证当前API权限
        $this->checkPrivilege();
    }

    private function getUserInfo()
    {
        $this->userInfo = UserService::getLoginInfo();
    }

    private function checkPrivilege()
    {
        if (!AuthService::getInstance()->checkPrivilege('/' . $this->routeUri)) {
            throwError('很抱歉，没有当前api的访问权限 ' . $this->routeUri);
        }
        return true;
    }

    protected function getRouteInfo()
    {
        // 控制器名称
        $this->controller = uncamelize($this->request->controller());
        // 方法名称
        $this->action = $this->request->action();
        // 控制器分组 (用于定义所属模块)
        $group = strstr($this->controller, '.', true);
        $this->group = $group !== false ? $group : $this->controller;
        // 当前uri
        $this->routeUri = "{$this->controller}/$this->action";
    }

    private function checkLogin()
    {
        // 验证当前请求是否在白名单
        if (in_array($this->routeUri, $this->allowAllAction)) {
            return true;
        }
        // 验证登录状态
        if (empty($this->userInfo) || (int)$this->userInfo['is_login'] !== 1) {
            throwError('请先登录后再访问', config('status.not_logged'));
        }
        return true;
    }


    protected function renderData(int $code = null, string $message = '', array $result = [], string $type = 'success')
    {
        is_null($code) && $code = config('status.success');
        return json(compact('code', 'message', 'result', 'type'));
    }

    protected function renderSuccess($result = [], string $message = 'success', string $type = 'success')
    {
        if (is_string($result)) {
            $message = $result;
            $result = [];
        }
        return $this->renderData(config('status.success'), $message, $result,$type);
    }

    protected function renderError(string $message = 'error', array $result = [], string $type = 'error')
    {
        return $this->renderData(config('status.error'), $message, $result,$type);
    }

    protected function postData($key = null)
    {
        return $this->request->post(empty($key) ? '' : "{$key}/a");
    }

    protected function getData($key = null)
    {
        return $this->request->get(is_null($key) ? '' : $key);
    }

    private function checkMethodRules()
    {
        if (!isset($this->methodRules[$this->action])) {
            return true;
        }
        $methodRule = $this->methodRules[$this->action];
        $currentMethod = $this->request->method();
        if (empty($methodRule)) {
            return true;
        }
        if (is_array($methodRule) && in_array($currentMethod, $methodRule)) {
            return true;
        }
        if (is_string($methodRule) && $methodRule == $currentMethod) {
            return true;
        }
        throwError('请求错误');
        return false;
    }
    public function getList()
    {
        $list = $this->model->getList($this->request->param());
        return $this->renderSuccess($list);
    }
    public function add()
    {
        if ($this->model->add($this->postData())!==false) {
            return $this->renderSuccess('操作成功');
        }
        return $this->renderError($this->model->getError() ?: '操作失败');
    }
    public function del()
    {
        if ($this->model->destroy($this->postData())!==false) {
            return $this->renderSuccess('操作成功');
        }
        return $this->renderError($this->model->getError() ?: '操作失败');
    }
    public function  __destruct() {
        $log = [];
        if (!empty($this->userInfo))
        {
            $log['user_id'] = $this->userInfo['user']['user_id'];
            $log['user_name'] = $this->userInfo['user']['real_name'];
        }
        $log['url'] = '/' . $this->routeUri;
        $log['params'] = json_encode($this->request->param());
        if($this->model) $log['run_sql'] = $this->model->lastSql?$this->model->lastSql:$this->model->getLastSql();
        $log['ip']      = $this->request->ip();
        $logModel = new LogModel();
        $logModel->add($log);
    }
}
