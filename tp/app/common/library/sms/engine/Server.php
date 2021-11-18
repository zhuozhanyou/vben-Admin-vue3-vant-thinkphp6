<?php

declare (strict_types = 1);

namespace app\common\library\sms\engine;


abstract class Server
{
    protected $error;

    /**
     * 返回错误信息
     * @return mixed
     */
    public function getError()
    {
        return $this->error;
    }

}
