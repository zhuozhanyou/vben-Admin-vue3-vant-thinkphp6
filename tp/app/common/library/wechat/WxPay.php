<?php

namespace app\common\library\wechat;

use app\common\model\Wxapp as WxappModel;
use app\common\enum\OrderType as OrderTypeEnum;
use app\common\enum\order\PayType as OrderPayTypeEnum;
use app\common\library\helper;
use app\common\exception\BaseException;

/**
 * 微信支付
 * Class WxPay
 * @package app\common\library\wechat
 */
class WxPay extends WxBase
{
    // 微信支付配置
    private $config;

    // 订单模型
    private $modelClass = [
        OrderTypeEnum::ORDER => 'app\api\service\order\PaySuccess',
        OrderTypeEnum::RECHARGE => 'app\api\service\recharge\PaySuccess',
    ];

    /**
     * 构造函数
     * WxPay constructor.
     * @param $config
     */
    public function __construct($config = false)
    {
        parent::__construct();
        $this->config = $config;
        $this->config !== false && $this->setConfig($this->config['app_id'], $this->config['app_secret']);
    }

    /**
     * 统一下单API
     * @param $orderNo
     * @param $openid
     * @param $totalFee
     * @param int $orderType 订单类型
     * @return array
     * @throws BaseException
     */
    public function unifiedorder($orderNo, $openid, $totalFee, $orderType = OrderTypeEnum::ORDER)
    {
        // 当前时间
        $time = time();
        // 生成随机字符串
        $nonceStr = md5($time . $openid);
        // API参数
        $params = [
            'appid' => $this->appId,
            'attach' => helper::jsonEncode(['order_type' => $orderType]),
            'body' => $orderNo,
            'mch_id' => $this->config['mchid'],
            'nonce_str' => $nonceStr,
            'notify_url' => base_url() . 'notice.php',  // 异步通知地址
            'openid' => $openid,
            'out_trade_no' => $orderNo,
            'spbill_create_ip' => \request()->ip(),
            'total_fee' => $totalFee * 100, // 价格:单位分
            'trade_type' => 'JSAPI',
        ];
        // 生成签名
        $params['sign'] = $this->makeSign($params);
        // 请求API
        $url = 'https://api.mch.weixin.qq.com/pay/unifiedorder';
        $result = $this->post($url, $this->toXml($params));
        $prepay = $this->fromXml($result);
        // 请求失败
        if ($prepay['return_code'] === 'FAIL') {
            $errMsg = "微信支付api：{$prepay['return_msg']}";
            throwError($errMsg, null, ['error_code' => 'WECHAT_PAY', 'is_created' => true]);
        }
        if ($prepay['result_code'] === 'FAIL') {
            $errMsg = "微信支付api：{$prepay['err_code_des']}";
            throwError($errMsg, null, ['error_code' => 'WECHAT_PAY', 'is_created' => true]);
        }
        // 生成 nonce_str 供前端使用
        $paySign = $this->makePaySign($params['nonce_str'], $prepay['prepay_id'], $time);
        return [
            'prepay_id' => $prepay['prepay_id'],
            'nonceStr' => $nonceStr,
            'timeStamp' => (string)$time,
            'paySign' => $paySign
        ];
    }

    /**
     * 支付成功异步通知
     * @throws BaseException
     * @throws \Exception
     */
    public function notify()
    {
//        $xml = <<<EOF
//<xml><appid><![CDATA[wx8908532a27c5dd4f]]></appid>
//<attach><![CDATA[{"order_type":10}]]></attach>
//<bank_type><![CDATA[CFT]]></bank_type>
//<cash_fee><![CDATA[1]]></cash_fee>
//<fee_type><![CDATA[CNY]]></fee_type>
//<is_subscribe><![CDATA[N]]></is_subscribe>
//<mch_id><![CDATA[1509822581]]></mch_id>
//<nonce_str><![CDATA[ca1fe6d2b4f667cf249bd1d7176c6178]]></nonce_str>
//<openid><![CDATA[oZDDE5JLnVyc6qe6nbNWdbFHtY5I]]></openid>
//<out_trade_no><![CDATA[2019040155491005]]></out_trade_no>
//<result_code><![CDATA[SUCCESS]]></result_code>
//<return_code><![CDATA[SUCCESS]]></return_code>
//<sign><![CDATA[3880232710B7328822D079DC405FB09D]]></sign>
//<time_end><![CDATA[20190401104804]]></time_end>
//<total_fee>1</total_fee>
//<trade_type><![CDATA[JSAPI]]></trade_type>
//<transaction_id><![CDATA[4200000265201904014227830207]]></transaction_id>
//</xml>
//EOF;
        if (!$xml = file_get_contents('php://input')) {
            $this->returnCode(false, 'Not found DATA');
        }
        // 将服务器返回的XML数据转化为数组
        $data = $this->fromXml($xml);
        // 记录日志
        log_record($xml);
        log_record($data);
        // 实例化订单模型
        $model = $this->getOrderModel($data['out_trade_no'], $data['attach']);
        // 订单信息
        $order = $model->getOrderInfo();
        empty($order) && $this->returnCode(false, '订单不存在');
        // 小程序配置信息
        $wxConfig = WxappModel::getWxappCache($order['store_id']);
        // 设置支付秘钥
        $this->config['apikey'] = $wxConfig['apikey'];
        // 保存微信服务器返回的签名sign
        $dataSign = $data['sign'];
        // sign不参与签名算法
        unset($data['sign']);
        // 生成签名
        $sign = $this->makeSign($data);
        // 判断签名是否正确 判断支付状态
        if (
            ($sign !== $dataSign)
            || ($data['return_code'] !== 'SUCCESS')
            || ($data['result_code'] !== 'SUCCESS')
        ) {
            $this->returnCode(false, '签名失败');
        }
        // 订单支付成功业务处理
        $status = $model->onPaySuccess(OrderPayTypeEnum::WECHAT, $data);
        if ($status == false) {
            $this->returnCode(false, $model->getError());
        }
        // 返回状态
        $this->returnCode(true, 'OK');
    }

    /**
     * 申请退款API
     * @param $transaction_id
     * @param double $total_fee 订单总金额
     * @param double $refund_fee 退款金额
     * @return bool
     * @throws BaseException
     */
    public function refund($transaction_id, $total_fee, $refund_fee)
    {
        // 当前时间
        $time = time();
        // 生成随机字符串
        $nonceStr = md5($time . $transaction_id . $total_fee . $refund_fee);
        // API参数
        $params = [
            'appid' => $this->appId,
            'mch_id' => $this->config['mchid'],
            'nonce_str' => $nonceStr,
            'transaction_id' => $transaction_id,
            'out_refund_no' => $time,
            'total_fee' => $total_fee * 100,
            'refund_fee' => $refund_fee * 100,
        ];
        // 生成签名
        $params['sign'] = $this->makeSign($params);
        // 请求API
        $url = 'https://api.mch.weixin.qq.com/secapi/pay/refund';
        $result = $this->post($url, $this->toXml($params), true, $this->getCertPem());
        // 请求失败
        if (empty($result)) {
            throwError('微信退款api请求失败');
        }
        // 格式化返回结果
        $prepay = $this->fromXml($result);
        // 记录日志
        log_record(['name' => '微信退款API', [
            'params' => $params,
            'result' => $result,
            'prepay' => $prepay
        ]]);
        // 请求失败
        if ($prepay['return_code'] === 'FAIL') {
            throwError("return_msg: {$prepay['return_msg']}");
        }
        if ($prepay['result_code'] === 'FAIL') {
            throwError("err_code_des: {$prepay['err_code_des']}");
        }
        return true;
    }

    /**
     * 企业付款到零钱API
     * @param $orderNo
     * @param $openid
     * @param $amount
     * @param $desc
     * @return bool
     * @throws BaseException
     */
    public function transfers($orderNo, $openid, $amount, $desc)
    {
        // API参数
        $params = [
            'mch_appid' => $this->appId,
            'mchid' => $this->config['mchid'],
            'nonce_str' => md5(uniqid()),
            'partner_trade_no' => $orderNo,
            'openid' => $openid,
            'check_name' => 'NO_CHECK',
            'amount' => $amount * 100,
            'desc' => $desc,
            'spbill_create_ip' => \request()->ip(),
        ];
        // 生成签名
        $params['sign'] = $this->makeSign($params);
        // 请求API
        $url = 'https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';
        $result = $this->post($url, $this->toXml($params), true, $this->getCertPem());
        // 请求失败
        if (empty($result)) {
            throwError('企业付款到零钱API请求失败');
        }
        // 格式化返回结果
        $prepay = $this->fromXml($result);
        // 请求失败
        if ($prepay['return_code'] === 'FAIL') {
            throwError("return_msg: {$prepay['return_msg']}");
        }
        if ($prepay['result_code'] === 'FAIL') {
            throwError("err_code_des: {$prepay['err_code_des']}");
        }
        return true;
    }

    /**
     * 获取cert证书文件
     * @return array
     * @throws BaseException
     */
    private function getCertPem()
    {
        if (empty($this->config['cert_pem']) || empty($this->config['key_pem'])) {
            throwError('请先到后台小程序设置填写微信支付证书文件');
        }
        // cert目录
        $filePath = __DIR__ . '/cert/' . $this->config['store_id'] . '/';
        return [
            'certPem' => $filePath . 'cert.pem',
            'keyPem' => $filePath . 'key.pem'
        ];
    }

    /**
     * 实例化订单模型 (根据attach判断)
     * @param $orderNo
     * @param null $attach
     * @return mixed
     */
    private function getOrderModel($orderNo, $attach = null)
    {
        $attach = helper::jsonDecode($attach);
        // 判断订单类型返回对应的订单模型
        $model = $this->modelClass[$attach['order_type']];
        return new $model($orderNo);
    }

    /**
     * 返回状态给微信服务器
     * @param boolean $returnCode
     * @param string $msg
     */
    private function returnCode($returnCode = true, $msg = null)
    {
        // 返回状态
        $return = [
            'return_code' => $returnCode ? 'SUCCESS' : 'FAIL',
            'return_msg' => $msg ?: 'OK',
        ];
        // 记录日志
        log_record([
            'name' => '返回微信支付状态',
            'data' => $return
        ]);
        die($this->toXml($return));
    }

    /**
     * 生成paySign
     * @param $nonceStr
     * @param $prepay_id
     * @param $timeStamp
     * @return string
     */
    private function makePaySign($nonceStr, $prepay_id, $timeStamp)
    {
        $data = [
            'appId' => $this->appId,
            'nonceStr' => $nonceStr,
            'package' => 'prepay_id=' . $prepay_id,
            'signType' => 'MD5',
            'timeStamp' => $timeStamp,
        ];
        // 签名步骤一：按字典序排序参数
        ksort($data);
        $string = $this->toUrlParams($data);
        // 签名步骤二：在string后加入KEY
        $string = $string . '&key=' . $this->config['apikey'];
        // 签名步骤三：MD5加密
        $string = md5($string);
        // 签名步骤四：所有字符转为大写
        $result = strtoupper($string);
        return $result;
    }

    /**
     * 将xml转为array
     * @param $xml
     * @return mixed
     */
    private function fromXml($xml)
    {
        // 禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        return helper::jsonDecode(helper::jsonEncode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)));
    }

    /**
     * 生成签名
     * @param $values
     * @return string 本函数不覆盖sign成员变量，如要设置签名需要调用SetSign方法赋值
     */
    private function makeSign($values)
    {
        //签名步骤一：按字典序排序参数
        ksort($values);
        $string = $this->toUrlParams($values);
        //签名步骤二：在string后加入KEY
        $string = $string . '&key=' . $this->config['apikey'];
        //签名步骤三：MD5加密
        $string = md5($string);
        //签名步骤四：所有字符转为大写
        $result = strtoupper($string);
        return $result;
    }

    /**
     * 格式化参数格式化成url参数
     * @param $values
     * @return string
     */
    private function toUrlParams($values)
    {
        $buff = '';
        foreach ($values as $k => $v) {
            if ($k != 'sign' && $v != '' && !is_array($v)) {
                $buff .= $k . '=' . $v . '&';
            }
        }
        return trim($buff, '&');
    }

    /**
     * 输出xml字符
     * @param $values
     * @return bool|string
     */
    private function toXml($values)
    {
        if (!is_array($values)
            || count($values) <= 0
        ) {
            return false;
        }

        $xml = "<xml>";
        foreach ($values as $key => $val) {
            if (is_numeric($val)) {
                $xml .= "<" . $key . ">" . $val . "</" . $key . ">";
            } else {
                $xml .= "<" . $key . "><![CDATA[" . $val . "]]></" . $key . ">";
            }
        }
        $xml .= "</xml>";
        return $xml;
    }

}
