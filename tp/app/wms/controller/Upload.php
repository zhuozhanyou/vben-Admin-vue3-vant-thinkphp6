<?php

declare (strict_types=1);

namespace app\wms\controller;

use app\common\enum\file\FileType as FileTypeEnum;
use app\common\library\storage\Driver as StorageDriver;
use app\store\model\UploadFile as UploadFileModel;
use app\wms\model\Log as Model;
class Upload extends Controller
{
    public function initialize()
    {
        parent::initialize();
        $this->model = new Model;
    }
    public function image(int $groupId = 0)
    {
        $config = ['default'=>'local','engine'=>['local'=>null]];
        // 实例化存储驱动
        $storage = new StorageDriver($config);
        // 设置上传文件的信息
        $storage->setUploadFile('file')
            ->setRootDirName((string)$this->storeId)
            ->setValidationScene('image')
            ->upload();
        // 执行文件上传
        if (!$storage->upload()) {
            return $this->renderError('图片上传失败：' . $storage->getError());
        }
        // 文件信息
        $fileInfo = $storage->getSaveFileInfo();
        // 添加文件库记录
        $model = new UploadFileModel;
        $model->add($fileInfo, FileTypeEnum::IMAGE, $groupId);
        // 图片上传成功
        return $this->renderSuccess(['fileInfo' => $model->toArray()], '图片上传成功');
    }
}
