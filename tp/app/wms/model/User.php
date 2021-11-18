<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\service\User as UserService;
use app\wms\model\Role as RoleModel;
/**
 * 商家用户模型
 * Class StoreUser
 * @package app\store\model
 */
class User extends BaseModel
{
    // 定义表名
    protected $name = 'sys_user';

    // 定义主键
    protected $pk = 'user_id';
    /**
     * 隐藏的字段
     * @var array
     */
    protected $hidden = [
        'password',
    ];

    // 用户登录token
    private $token;

    /**
     * 商家用户登录
     * @param array $data
     * @return array|bool|null|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function login(array $data)
    {
        // 用户信息
        $userInfo = $this->where(['user_name' => trim($data['username'])])->find();
        if (empty($userInfo)) {
            $this->error = '登录失败, 该用户不存在';
            return false;
        }
        // 验证密码是否正确
        if (!password_verify($data['password'], $userInfo['password'])) {
            $this->error = '登录失败, 用户名或密码错误';
            return false;
        }
        // 记录登录状态, 并记录token
        $this->token = UserService::login($userInfo->toArray());
        return $userInfo;
    }

    /**
     * 返回生成的token
     * @return mixed
     */
    public function getToken()
    {
        return $this->token;
    }

    public function getList($params = [])
    {
        $where = [];
        !empty($params['user_name']) && $where[] = ['user_name|real_name', 'like', "%{$params['user_name']}%"];
        !empty($params['mobile']) && $where[] = ['mobile', 'like', "%{$params['mobile']}%"];
        !empty($params['dept_id']) && $where[] = ['dept_id', '=', $params['dept_id']];
        // 查询列表记录
        $list = $this->where($where)->order(['create_time' => 'desc'])->paginate()->each(function($item,$key){
            $item['role_name'] = $item['role_id']?join(" ",RoleModel::getRoleNames(explode(",",$item['role_id']))):'';
            $item['role_id'] = $item['role_id']? array_map(function($v){return (int)$v;},explode(",",$item['role_id'])):[];
            return $item;
        })->toArray();
        return $list;
    }

    /**
     * 新增记录
     * @param array $data
     * @return bool
     */
    public function addbak(array $data)
    {
        if (self::checkExist($data['user_name'])) {
            $this->error = '用户名已存在';
            return false;
        }
        if ($data['password'] !== $data['password_confirm']) {
            $this->error = '确认密码不正确';
            return false;
        }
        if (empty($data['roles'])) {
            $this->error = '请选择所属角色';
            return false;
        }
        // 整理数据
        $data['password'] = encryption_hash($data['password']);
        $data['store_id'] = self::$storeId;
        $data['is_super'] = 0;

        // 事务处理
        $this->transaction(function () use ($data) {
            // 新增管理员记录
            $this->save($data);
            // 新增角色关系记录
            UserRole::increased((int)$this['store_user_id'], $data['roles']);
        });
        return true;
    }
    public function add(array $data)
    {
        $id = (int)$data['user_id'];
        unset($data['user_id']);
        $data['role_id'] = join(",",$data['role_id']);
        if (self::checkExist($data['user_name'],$id)) {
            $this->error = '用户名已存在';
            return false;
        }
        if (!empty($data['password'])) {
            $data['password'] = encryption_hash($data['password']);
        } else {
            unset($data['password']);
        }
        if(!empty($id))
        {
            return $this->find($id)->save($data);
        }
        else
        {
            return $this->save($data);
        }
    }
    public function changePassword(array $data)
    {
        $user = UserService::getLoginInfo();
        $oldPass = $this->where('user_id',$user['user']['user_id'])->value('password');
        if (!password_verify($data['passwordOld'], $oldPass)) {
            $this->error = '当前密码不正确';
            return false;
        }
        return $this->find($user['user']['user_id'])->save(['password'=>encryption_hash($data['passwordNew'])]);
    }
    /**
     * 更新记录
     * @param array $data
     * @return bool
     */
    public function edit(array $data)
    {
        if ($this['user_name'] !== $data['user_name']
            && self::checkExist($data['user_name'])) {
            $this->error = '用户名已存在';
            return false;
        }
        if (!empty($data['password']) && ($data['password'] !== $data['password_confirm'])) {
            $this->error = '确认密码不正确';
            return false;
        }
        if (empty($data['roles']) && !$this['is_super']) {
            $this->error = '请选择所属角色';
            return false;
        }
        if (!empty($data['password'])) {
            $data['password'] = encryption_hash($data['password']);
        } else {
            unset($data['password']);
        }
        $this->transaction(function () use ($data) {
            // 更新管理员记录
            $this->save($data);
            // 更新角色关系记录
            !$this['is_super'] && UserRole::updates((int)$this['store_user_id'], $data['roles']);
        });
        return true;
    }

    /**
     * 软删除
     * @return false|int
     */
    public function setDelete()
    {
        if ($this['is_super']) {
            $this->error = '超级管理员不允许删除';
            return false;
        }
        return $this->transaction(function () {
            // 删除对应的角色关系
            UserRole::deleteAll([['store_user_id', '=', (int)$this['store_user_id']]]);
            return $this->save(['is_delete' => 1]);
        });
    }

    /**
     * 更新当前管理员信息
     * @param array $data
     * @return bool
     */
    public function renew(array $data)
    {
        if (!empty($data['password']) && ($data['password'] !== $data['password_confirm'])) {
            $this->error = '确认密码不正确';
            return false;
        }
        if ($this['user_name'] !== $data['user_name']
            && self::checkExist($data['user_name'])) {
            $this->error = '用户名已存在';
            return false;
        }
        !empty($data['password']) && $data['password'] = encryption_hash($data['password']);
        // 更新管理员信息
        if ($this->save($data) === false) {
            return false;
        }
        // 更新登录状态
        StoreUserService::update($this->toArray());
        return true;
    }

    public static function checkExist(string $userName,int $userId = 0)
    {
        $where = [];
        $where[] = ['user_name', '=', $userName];
        if($userId) $where[] = ['user_id', '<>', $userId];
        return (bool)static::withoutGlobalScope()
            ->where($where)
            ->value('user_id');
    }
}
