<?php

declare (strict_types = 1);

namespace app\common\library;

/**
 * 文件阻塞锁
 * Class Lock
 * @package app\common\library
 */
class Lock
{
    // 文件锁资源树
    static $resource = [];

    /**
     * 加锁
     * @param $uniqueId
     * @return bool
     */
    public static function lockUp($uniqueId)
    {
        static::$resource[$uniqueId] = fopen(static::getFilePath($uniqueId), 'w+');
        return flock(static::$resource[$uniqueId], LOCK_EX);
    }

    /**
     * 解锁
     * @param $uniqueId
     * @return bool
     */
    public static function unLock($uniqueId)
    {
        if (!isset(static::$resource[$uniqueId])) return false;
        flock(static::$resource[$uniqueId], LOCK_UN);
        fclose(static::$resource[$uniqueId]);
        return static::deleteFile($uniqueId);
    }

    /**
     * 获取锁文件的路径
     * @param $uniqueId
     * @return string
     */
    private static function getFilePath($uniqueId)
    {
        $dirPath = runtime_root_path() . 'lock/';
        !is_dir($dirPath) && mkdir($dirPath, 0755, true);
        return $dirPath . md5($uniqueId) . '.lock';
    }

    /**
     * 删除锁文件
     * @param $uniqueId
     * @return bool
     */
    private static function deleteFile($uniqueId)
    {
        $filePath = static::getFilePath($uniqueId);
        return file_exists($filePath) && unlink($filePath);
    }
}
