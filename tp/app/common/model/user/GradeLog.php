<?php

declare (strict_types = 1);

namespace app\common\model\user;

use app\common\model\BaseModel;
use app\common\enum\user\grade\log\ChangeType as ChangeTypeEnum;

/**
 * 用户会员等级变更记录模型
 * Class GradeLog
 * @package app\common\model\user
 */
class GradeLog extends BaseModel
{
    // 定义表名
    protected $name = 'user_grade_log';

    // 定义主键
    protected $pk = 'log_id';

    protected $updateTime = false;

    /**
     * 新增变更记录 (批量)
     * @param $data
     * @return int
     */
    public function records($data)
    {
        $saveData = [];
        foreach ($data as $item) {
            $saveData[] = array_merge([
                'change_type' => ChangeTypeEnum::ADMIN_USER,
                'store_id' => static::$storeId
            ], $item);
        }
        return $this->addAll($saveData) !== false;
    }

}
