<?php

namespace app\wms;

use Throwable;
use think\Response;
use think\facade\Log;
use think\exception\Handle;
use app\wms\exception\BaseException;

/**
 * 应用异常处理类
 */
class ExceptionHandle extends Handle
{
    // 状态码
    private $code;

    // 错误信息
    private $message;

    // 附加数据
    public $result = [];

    private $type = 'error';
    /**
     * 记录异常信息（包括日志或者其它方式记录）
     * @access public
     * @param Throwable $exception
     * @return void
     */
    public function report(Throwable $exception): void
    {
        // 不使用内置的方式记录异常日志
        // parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @access public
     * @param $request
     * @param Throwable $e
     * @return Response
     */
    public function render($request, Throwable $e): Response
    {
        if ($e instanceof BaseException) {
            $this->code = $e->code;
            $this->message = $e->message;
            $this->result = $e->result;
            $this->type = $e->type;
            return $this->renderJson();
        }
        $this->code = config('status.error');
        $this->message = $e->getMessage() ?: '很抱歉，服务器内部错误';
        // 如果是debug模式, 输出调试信息
        if (is_debug()) {
            return $this->renderDebug($e);
        }
        // 将异常写入日志
        $this->recordErrorLog($e);
        return $this->renderJson();
    }

    /**
     * 返回json格式数据
     * @param array $extend 扩展的数据
     * @return \think\response\Json
     */
    private function renderJson($extend = [])
    {
        $jsonData = ['message' => $this->message, 'code' => $this->code, 'result' => $this->result, 'type'=>$this->type];
        return json(array_merge($jsonData, $extend));
    }

    /**
     * 返回json格式数据 (debug模式)
     * @param Throwable $e
     * @return \think\response\Json
     */
    private function renderDebug(Throwable $e)
    {
        $debug = [
            'name' => get_class($e),
            'file' => $e->getFile(),
            'line' => $e->getLine(),
            'code' => $this->getCode($e),
            'message' => $this->getMessage($e),
            'trace' => $e->getTrace(),
            'source' => $this->getSourceCode($e),
        ];
        return $this->renderJson(['debug' => $debug]);
    }

    /**
     * 将异常写入日志
     * @param Throwable $e
     */
    private function recordErrorLog(Throwable $e)
    {
        // 生成日志内容
        $data = [
            'file' => $e->getFile(),
            'line' => $e->getLine(),
            'message' => $this->getMessage($e),
            'status' => $this->getCode($e),
        ];
        $log = "[{$data['status']}]{$data['message']} [{$data['file']}:{$data['line']}]";
        $log .= "\r\n" . $e->getTraceAsString();

        // 写入日志文件
        Log::record($log, 'error');
    }
}
