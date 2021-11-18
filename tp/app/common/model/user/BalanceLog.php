<?php

declare (strict_types = 1);

namespace app\common\model\user;

use app\common\model\BaseModel;
use app\common\enum\user\balanceLog\Scene as SceneEnum;

/**
 * 用户余额变动明细模型
 * Class BalanceLog
 * @package app\common\model\user
 */
class BalanceLog extends BaseModel
{
    // 定义表名
    protected $name = 'user_balance_log';

    // 定义主键
    protected $pk = 'log_id';

    protected $updateTime = false;

    /**
     * 关联会员记录表
     * @return \think\model\relation\BelongsTo
     */
    public function user()
    {
        $module = self::getCalledModule();
        return $this->belongsTo("app\\{$module}\\model\\User");
    }

    /**
     * 新增记录
     * @param int $scene
     * @param array $data
     * @param array $describeParam
     */
    public static function add(int $scene, array $data, array $describeParam)
    {
        $model = new static;
        $model->save(array_merge([
            'scene' => $scene,
            'describe' => vsprintf(SceneEnum::data()[$scene]['describe'], $describeParam),
            'store_id' => $model::$storeId
        ], $data));
    }

}
