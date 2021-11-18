<?php

declare (strict_types=1);

namespace app\common\model;

use app\common\model\user\PointsLog as PointsLogModel;
use think\model\relation\BelongsTo;
use think\model\relation\HasMany;
use think\model\relation\HasOne;

/**
 * 用户模型类
 * Class User
 * @package app\common\model
 */
class User extends BaseModel
{
    // 定义表名
    protected $name = 'user';

    // 定义主键
    protected $pk = 'user_id';

    // 性别
    private $gender = [0 => '未知', 1 => '男', 2 => '女'];

    /**
     * 关联用户头像表
     * @return HasOne
     */
    public function avatar()
    {
        return $this->hasOne('uploadFile', 'file_id', 'avatar_id')
            ->bind(['avatar_url' => 'preview_url']);
    }

    /**
     * 关联会员等级表
     * @return BelongsTo
     */
    public function grade()
    {
        $module = self::getCalledModule();
        return $this->belongsTo("app\\{$module}\\model\\user\\Grade", 'grade_id');
    }

    /**
     * 关联收货地址表
     * @return HasMany
     */
    public function address()
    {
        return $this->hasMany('UserAddress');
    }

    /**
     * 关联收货地址表 (默认地址)
     * @return BelongsTo
     */
    public function addressDefault()
    {
        return $this->belongsTo('UserAddress', 'address_id');
    }

    /**
     * 获取器：显示性别
     * @param $value
     * @return mixed
     */
    public function getGenderAttr($value)
    {
        return $this->gender[$value];
    }

    /**
     * 获取用户信息
     * @param $where
     * @param array $with
     * @return array|null|static
     */
    public static function detail($where, $with = [])
    {
        $filter = ['is_delete' => 0];
        if (is_array($where)) {
            $filter = array_merge($filter, $where);
        } else {
            $filter['user_id'] = (int)$where;
        }
        return static::get($filter, $with);
    }

    /**
     * 累积用户的实际消费金额
     * @param int $userId
     * @param $expendMoney
     * @return mixed
     */
    public static function setIncUserExpend(int $userId, float $expendMoney)
    {
        return (new static)->setInc($userId, 'expend_money', $expendMoney);
    }

    /**
     * 累积用户可用余额
     * @param int $userId
     * @param $money
     * @return mixed
     */
    public static function setIncBalance(int $userId, float $money)
    {
        return (new static)->setInc($userId, 'balance', $money);
    }

    /**
     * 消减用户可用余额
     * @param int $userId
     * @param $money
     * @return mixed
     */
    public static function setDecBalance(int $userId, float $money)
    {
        return (new static)->setDec([['user_id', '=', $userId]], 'balance', $money);
    }

    /**
     * 指定会员等级下是否存在用户
     * @param int $gradeId
     * @return bool
     */
    public static function checkExistByGradeId(int $gradeId)
    {
        $model = new static;
        return (bool)$model->where('grade_id', '=', (int)$gradeId)
            ->where('is_delete', '=', 0)
            ->value('user_id');
    }

    /**
     * 累积用户总消费金额
     * @param int $userId
     * @param $money
     * @return mixed
     */
    public static function setIncPayMoney(int $userId, float $money)
    {
        return (new static)->setInc($userId, 'pay_money', $money);
    }

    /**
     * 累积用户实际消费的金额 (批量)
     * @param array $data
     * @return bool
     */
    public function onBatchIncExpendMoney(array $data)
    {
        foreach ($data as $userId => $expendMoney) {
            static::setIncUserExpend($userId, (float)$expendMoney);
        }
        return true;
    }

    /**
     * 累积用户的可用积分数量 (批量)
     * @param array $data
     * @return bool
     */
    public function onBatchIncPoints(array $data)
    {
        foreach ($data as $userId => $value) {
            $this->setInc($userId, 'points', $value);
        }
        return true;
    }

    /**
     * 累积用户的可用积分
     * @param int $userId 用户ID
     * @param int $points 累计的积分
     * @param string $describe
     * @return mixed
     */
    public static function setIncPoints(int $userId, int $points, string $describe)
    {
        // 新增积分变动明细
        PointsLogModel::add([
            'user_id' => $userId,
            'value' => $points,
            'describe' => $describe,
        ]);
        // 更新用户可用积分
        return (new static)->setInc($userId, 'points', $points);
    }

}
