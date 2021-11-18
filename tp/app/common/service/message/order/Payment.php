<?php

declare (strict_types = 1);

namespace app\common\service\message\order;

use app\common\service\message\Basics;
use app\common\model\store\Setting as SettingModel;
use app\common\enum\setting\sms\Scene as SettingSmsScene;

/**
 * 消息通知服务 [订单支付成功]
 * Class Payment
 * @package app\common\service\message\order
 */
class Payment extends Basics
{
    /**
     * 参数列表
     * @var array
     */
    protected $param = [
        'order' => []
    ];

    /**
     * 订单页面链接
     * @var array
     */
    private $pageUrl = 'pages/order/detail';

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
        // 短信通知商家
        $this->onSendSms();
    }

    /**
     * 短信通知商家
     * @return bool
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    private function onSendSms()
    {
        $orderInfo = $this->param['order'];
        return $this->sendSms(SettingSmsScene::ORDER_PAY, ['order_no' => $orderInfo['order_no']]);
    }

    /**
     * 格式化商品名称
     * @param $goodsData
     * @return string
     */
    private function getFormatGoodsName($goodsData)
    {
        return $this->getSubstr($goodsData[0]['goods_name']);
    }
}