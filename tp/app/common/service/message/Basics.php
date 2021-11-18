<?php

declare (strict_types = 1);

namespace app\common\service\message;

use app\common\model\store\Setting as SettingModel;
use app\common\library\sms\Driver as SmsDriver;
use app\common\service\BaseService;

/**
 * 消息通知服务[基类]
 * Class Basics
 * @package app\common\service\message
 */
abstract class Basics extends BaseService
{
    // 参数列表
    protected $param = [];
    // 商城ID
    protected $storeId;
    // 错误信息
    protected $error = '';

    /**
     * 构造方法
     * Basics constructor.
     * @param int $storeId
     */
    public function __construct(int $storeId)
    {
        parent::__construct();
        $this->storeId = $storeId;
    }

    /**
     * 发送消息通知
     * @param array $param 参数
     * @return mixed
     */
    abstract public function send(array $param);

    /**
     * 发送短信提醒
     * @param string $sceneValue
     * @param array $templateParams
     * @param array $sceneConfig
     * @return bool
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function sendSms(string $sceneValue, array $templateParams, array $sceneConfig = [])
    {
        // 短信通知设置
        $smsConfig = SettingModel::getItem('sms', $this->storeId);
        // 短信服务
        $SmsDriver = new SmsDriver($smsConfig);
        // 发送短信
        if (!$SmsDriver->sendSms($sceneValue, $templateParams, $sceneConfig)) {
            $this->error = $SmsDriver->getError();
            return false;
        }
        return true;
    }

    /**
     * 字符串截取前20字符
     * [用于兼容thing数据类型]
     * @param string $content
     * @param int $length
     * @return bool|string
     */
    protected function getSubstr(string $content, int $length = 20)
    {
        return str_substr($content, $length);
    }

    /**
     * 获取错误信息
     * @return mixed
     */
    public function getError()
    {
        return $this->error;
    }

}
