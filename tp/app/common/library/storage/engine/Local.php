<?php

declare (strict_types = 1);

namespace app\common\library\storage\engine;

use think\facade\Filesystem;
use app\common\library\storage\FileValidate;

/**
 * 本地文件驱动
 * Class Local
 * @package app\common\library\storage\drivers
 */
class Local extends Basics
{
    /**
     * 上传图片文件
     * @return array|bool
     */
    public function upload()
    {
        // 验证文件类型
        if (!$this->validate()) {
            return false;
        }
        try {
            $filePath = $this->getSaveFileInfo()['file_path'];
            // 上传到本地服务器
            $sts = Filesystem::disk($this->disk)->putFileAs(
                $this->getFileHashRoute($filePath),
                $this->file,
                $this->getFileHashName($filePath)
            );
            return (bool)$sts;
        } catch (\Exception $e) {
            $this->error = $e->getMessage();
            return false;
        }
    }

    /**
     * 验证上传的文件
     * @return bool
     */
    private function validate()
    {
        $FileValidate = new FileValidate;
        if (!$FileValidate->check([$this->validateRuleScene => $this->file])) {
            $this->error = $FileValidate->getError();
            return false;
        }
        return true;
    }

    /**
     * 删除文件
     * @param string $filePath
     * @return bool|mixed
     */
    public function delete(string $filePath)
    {
        // 文件所在目录
        $realPath = realpath(web_path() . "uploads/{$filePath}");
        return $realPath === false || unlink($realPath);
    }

}
