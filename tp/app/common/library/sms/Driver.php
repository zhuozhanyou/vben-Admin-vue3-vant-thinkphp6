<?php

declare (strict_types = 1);

namespace app\common\library\sms;

use think\Exception;

/**
 * 短信通知模块驱动
 * Class driver
 * @package app\common\library\sms
 */
class Driver
{
    private $config;    // 配置信息
    private $engine;    // 当前短信服务引擎类
    private $engineName;    // 当前短信引擎名称

    private $error = '';    // 错误信息

    /**
     * 构造方法
     * Driver constructor.
     * @param array $config
     * @throws Exception
     */
    public function __construct(array $config)
    {
        // 配置信息
        $this->config = $config;
        // 当前引擎名称
        $this->engineName = $this->config['default'];
        // 实例化当前存储引擎
        $this->engine = $this->getEngineClass();
    }

    /**
     * 发送短信通知
     * @param string $sceneValue 场景值
     * @param array $templateParams 短信模板变量
     * @param array $sceneConfig 短信场景配置
     * @param bool $isTest
     * @return bool
     */
    public function sendSms(string $sceneValue, array $templateParams, array $sceneConfig = [], bool $isTest = false)
    {
        // 短信场景配置
        $sceneConfig = array_merge($this->config['scene'][$sceneValue], $sceneConfig);
        if ($isTest == false && !$sceneConfig['isEnable']) {
            $this->error = '短信通知服务未开启，请在商户后台中设置';
            return false;
        }
        // 执行发送短信
        if (!$this->engine->sendSms($sceneConfig, $templateParams)) {
            $this->error = $this->engine->getError();
            return false;
        }
        return true;
    }

    /**
     * 获取错误信息
     * @return mixed
     */
    public function getError()
    {
        return $this->error;
    }

    /**
     * 获取当前的存储引擎
     * @return mixed
     * @throws Exception
     */
    private function getEngineClass()
    {
        $classSpace = __NAMESPACE__ . '\\engine\\' . ucfirst($this->engineName);
        if (!class_exists($classSpace)) {
            throwError('未找到存储引擎类: ' . $this->engineName);
        }
        return new $classSpace($this->config['engine'][$this->engineName]);
    }

}
