<?php

declare (strict_types = 1);

namespace app\common\service;

/**
 * 消息通知服务
 * Class Message
 * @package app\common\service
 */
class Message extends BaseService
{
    /**
     * 场景列表
     * [场景名称] => [场景类]
     * @var array
     */
    private static $sceneList = [
        // 短信验证码
        'passport.captcha' => \app\common\service\message\passport\Captcha::class,
        // 订单支付成功
        'order.payment' => \app\common\service\message\order\Payment::class,
        // 订单发货
        'order.delivery' => \app\common\service\message\order\Delivery::class,
        // 订单退款
        'order.refund' => \app\common\service\message\order\Refund::class,
    ];

    /**
     * 发送消息通知
     * @param string $sceneName 场景名称
     * @param array $param 参数
     * @param int $storeId 商城ID
     * @return bool
     */
    public static function send(string $sceneName, array $param, int $storeId)
    {
        if (!isset(self::$sceneList[$sceneName])) return false;
        $class = self::$sceneList[$sceneName];
        return (new $class($storeId))->send($param);
    }

}