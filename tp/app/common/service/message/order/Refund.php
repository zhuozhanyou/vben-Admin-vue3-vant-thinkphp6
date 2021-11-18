<?php

declare (strict_types=1);

namespace app\common\service\message\order;

use app\common\service\message\Basics;
use app\common\model\store\Setting as SettingModel;

/**
 * 消息通知服务 [订单售后]
 * Class Refund
 * @package app\common\service\message\order
 */
class Refund extends Basics
{
    /**
     * 参数列表
     * @var array
     */
    protected $param = [
        'refund' => [],     // 退款单信息
        'order_no' => [],      // 订单信息
    ];

    /**
     * 订单页面链接
     * @var array
     */
    private $pageUrl = 'pages/order/refund/index';

    /**
     * 发送消息通知
     * @param array $param
     * @return mixed|void
     * @throws \app\common\exception\BaseException
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function send(array $param)
    {
        // 记录参数
        $this->param = $param;
    }

}