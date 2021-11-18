<?php

declare (strict_types=1);

namespace app\common\library\wechat;

use think\facade\Cache;
use app\common\library\helper;
use app\common\exception\BaseException;

/**
 * 微信api基类
 * Class wechat
 * @package app\library
 */
class WxBase
{
    protected $appId;
    protected $appSecret;

    protected $error;

    /**
     * 构造函数
     * WxBase constructor.
     * @param $appId
     * @param $appSecret
     */
    public function __construct($appId = null, $appSecret = null)
    {
        $this->setConfig($appId, $appSecret);
    }

    protected function setConfig($appId = null, $appSecret = null)
    {
        !empty($appId) && $this->appId = $appId;
        !empty($appSecret) && $this->appSecret = $appSecret;
    }

    /**
     * 获取access_token
     * @return mixed
     * @throws BaseException
     */
    protected function getAccessToken()
    {
        $cacheKey = $this->appId . '@access_token';
        if (!Cache::instance()->get($cacheKey)) {
            // 请求API获取 access_token
            $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$this->appId}&secret={$this->appSecret}";
            $result = $this->get($url);
            $response = $this->jsonDecode($result);
            if (array_key_exists('errcode', $response)) {
                throwError("access_token获取失败，错误信息：{$result}");
            }
            // 记录日志
            log_record([
                'name' => '获取access_token',
                'url' => $url,
                'appId' => $this->appId,
                'result' => $result
            ]);
            // 写入缓存
            Cache::instance()->set($cacheKey, $response['access_token'], 6000);
        }
        return Cache::instance()->get($cacheKey);
    }

    /**
     * 模拟GET请求 HTTPS的页面
     * @param string $url 请求地址
     * @param array $data
     * @return string $result
     * @throws BaseException
     */
    protected function get(string $url, array $data = [])
    {
        // 处理query参数
        if (!empty($data)) {
            $url = $url . '?' . http_build_query($data);
        }
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE); // https请求 不验证证书和hosts
        $result = curl_exec($curl);
        if ($result === false) {
            throwError(curl_error($curl));
        }
        curl_close($curl);
        return $result;
    }

    /**
     * 模拟POST请求
     * @param string $url 请求地址
     * @param array $data 请求数据
     * @param false $useCert 是否引入微信支付证书
     * @param array $sslCert 证书路径
     * @return mixed|bool|string
     * @throws BaseException
     */
    protected function post(string $url, $data = [], $useCert = false, $sslCert = [])
    {
        $header = [
            'Content-type: application/json;'
        ];
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_POST, TRUE);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        if ($useCert == true) {
            // 设置证书：cert 与 key 分别属于两个.pem文件
            curl_setopt($curl, CURLOPT_SSLCERTTYPE, 'PEM');
            curl_setopt($curl, CURLOPT_SSLCERT, $sslCert['certPem']);
            curl_setopt($curl, CURLOPT_SSLKEYTYPE, 'PEM');
            curl_setopt($curl, CURLOPT_SSLKEY, $sslCert['keyPem']);
        }
        $result = curl_exec($curl);
        if ($result === false) {
            throwError(curl_error($curl));
        }
        curl_close($curl);
        return $result;
    }

    /**
     * 模拟POST请求 [第二种方式, 用于兼容微信api]
     * @param $url
     * @param array $data
     * @return mixed
     * @throws BaseException
     */
    protected function post2($url, $data = [])
    {
        $header = [
            'Content-Type: application/x-www-form-urlencoded'
        ];
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//这个是重点。
        $result = curl_exec($ch);
        if ($result === false) {
            throwError(curl_error($ch));
        }
        curl_close($ch);
        return $result;
    }

    /**
     * 数组转json
     * @param $data
     * @return string
     */
    protected function jsonEncode($data)
    {
        return helper::jsonEncode($data, JSON_UNESCAPED_UNICODE);
    }

    /**
     * json转数组
     * @param $json
     * @return mixed
     */
    protected function jsonDecode($json)
    {
        return helper::jsonDecode($json);
    }

    /**
     * 返回错误信息
     * @return mixed
     */
    public function getError()
    {
        return $this->error;
    }

}
