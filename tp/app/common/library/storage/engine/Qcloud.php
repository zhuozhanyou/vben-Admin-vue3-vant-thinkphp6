<?php

declare (strict_types=1);

namespace app\common\library\storage\engine;

use Qcloud\Cos\Client;

/**
 * 腾讯云存储引擎 (COS)
 * Class Qcloud
 * @package app\common\library\storage\engine
 */
class Qcloud extends Basics
{
    // Qcloud类
    private $cosClient;

    /**
     * 构造方法
     * Qcloud constructor.
     * @param string $storage 存储方式
     * @param array|null $config 存储配置
     */
    public function __construct(string $storage, array $config = null)
    {
        parent::__construct($storage, $config);
        // 创建Qcloud类
        $this->createCosClient();
    }

    /**
     * 创建COS控制类
     */
    private function createCosClient()
    {
        $this->cosClient = new Client([
            'region' => $this->config['region'],
            'credentials' => [
                'secretId' => $this->config['secret_id'],
                'secretKey' => $this->config['secret_key'],
            ],
        ]);
    }

    /**
     * 执行上传
     * @return bool|mixed
     */
    public function upload()
    {
        // 上传文件
        // putObject(上传接口，最大支持上传5G文件)
        try {
            $result = $this->cosClient->putObject([
                'Bucket' => $this->config['bucket'],
                'Key' => $this->getSaveFileInfo()['file_path'],
                'Body' => fopen($this->getRealPath(), 'rb')
            ]);
            return true;
        } catch (\Exception $e) {
            $this->error = $e->getMessage();
            return false;
        }
    }

    /**
     * 删除文件
     * @param string $fileName
     * @return bool|mixed
     */
    public function delete(string $fileName)
    {
        try {
            $result = $this->cosClient->deleteObject(array(
                'Bucket' => $this->config['bucket'],
                'Key' => $fileName
            ));
            return true;
        } catch (\Exception $e) {
            $this->error = $e->getMessage();
            return false;
        }
    }

}
