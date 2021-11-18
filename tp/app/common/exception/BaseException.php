<?php

declare (strict_types = 1);

namespace app\common\exception;

use think\Exception;

/**
 * 自定义异常类的基类
 * Class BaseException
 * @package app\common\exception
 */
class BaseException extends Exception
{
    // 状态码
    public $status;

    // 错误信息
    public $message = '很抱歉，服务器内部错误';

    // 附加数据
    public $data = [];

    /**
     * 构造函数，接收一个关联数组
     * @param array $params 关联数组只应包含status、msg、data，且不应该是空值
     */
    public function __construct($params = [])
    {
        $this->status = array_key_exists('status', $params) ? $params['status']
            : config('status.error');
        if (array_key_exists('msg', $params)) {
            $this->message = $params['msg'];
        }
        if (array_key_exists('data', $params)) {
            $this->data = $params['data'];
        }
    }
}

