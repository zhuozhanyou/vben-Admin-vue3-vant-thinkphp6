<?php

declare (strict_types = 1);

namespace app\common\library\express;

use think\facade\Cache;
use app\common\library\helper;

/**
 * 快递100API模块
 * Class Kuaidi100
 * @package app\common\library\express
 */
class Kuaidi100
{
    /* @var array $config 微信支付配置 */
    private $config;

    /* @var string $error 错误信息 */
    private $error;

    /**
     * 构造方法
     * WxPay constructor.
     * @param $config
     */
    public function __construct($config)
    {
        $this->config = $config;
    }

    /**
     * 执行查询
     * @param $code
     * @param $expressNo
     * @return bool
     */
    public function query($code, $expressNo)
    {
        // 缓存索引
        $cacheIndex = "express_{$code}_$expressNo";
        if ($data = Cache::instance()->get($cacheIndex)) {
            return $data;
        }
        // 参数设置
        $postData = [
            'customer' => $this->config['customer'],
            'param' => helper::jsonEncode([
                'resultv2' => '1',
                'com' => $code,
                'num' => $expressNo
            ])
        ];
        $postData['sign'] = strtoupper(md5($postData['param'] . $this->config['key'] . $postData['customer']));
        // 请求快递100 api
        $url = 'http://poll.kuaidi100.com/poll/query.do';
        $result = curl_post($url, http_build_query($postData));
        $express = helper::jsonDecode($result);
        // 记录错误信息
        if (isset($express['returnCode']) || !isset($express['data'])) {
            $this->error = isset($express['message']) ? $express['message'] : '查询失败';
            return false;
        }
        // 记录缓存, 时效5分钟
        Cache::instance()->set($cacheIndex, $express['data'], 300);
        return $express['data'];
    }

    /**
     * 返回错误信息
     * @return string
     */
    public function getError()
    {
        return $this->error;
    }

}
