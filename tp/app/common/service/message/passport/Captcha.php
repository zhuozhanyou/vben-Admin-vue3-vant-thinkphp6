<?php

declare (strict_types = 1);

namespace app\common\service\message\passport;

use app\common\service\message\Basics;
use app\common\enum\setting\sms\Scene as SettingSmsScene;

/**
 * 消息通知服务 [短信验证码]
 * Class Captcha
 * @package app\common\service\message\passport
 */
class Captcha extends Basics
{
    /**
     * 发送消息通知
     * @param array $param
     * @return bool|mixed
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function send(array $param)
    {
        // 短信api参数
        $sceneConfig = ['acceptPhone' => $param['mobile']];
        $templateParams = ['code' => $param['code']];
        // 发送短信
        if (!$this->sendSms(SettingSmsScene::CAPTCHA, $templateParams, $sceneConfig)) {
            throwError('短信发送失败：' . $this->getError());
        }
        return true;
    }

}