<?php

declare (strict_types = 1);

namespace app\common\model;

use app\common\enum\file\Storage as StorageEnum;
use app\common\enum\file\FileType as FileTypeEnum;

/**
 * 文件库模型
 * Class UploadFile
 * @package app\common\model
 */
class UploadFile extends BaseModel
{
    // 定义表名
    protected $name = 'upload_file';

    // 定义主键
    protected $pk = 'file_id';

    // 追加的字段
    protected $append = [
        'preview_url',     // 预览url
        'external_url'     // 外链url
    ];

    /**
     * 关联文件库分组表
     * @return \think\model\relation\BelongsTo
     */
    public function uploadGroup()
    {
        return $this->belongsTo('UploadGroup', 'group_id');
    }

    /**
     * 生成预览url (preview_url)
     * @param $value
     * @param $data
     * @return string
     */
    public function getPreviewUrlAttr($value, $data)
    {
        // 图片的预览图直接使用外链
        if ($data['file_type'] == FileTypeEnum::IMAGE) {
            return $this->getExternalUrlAttr($value, $data);
        }
        // 生成默认的预览图
        $previewPath = FileTypeEnum::data()[$data['file_type']]['preview_path'];
        return base_url() . $previewPath;
    }

    /**
     * 生成外链url (external_url)
     * @param $value
     * @param $data
     * @return string
     */
    public function getExternalUrlAttr($value, $data)
    {
        // 存储方式本地：拼接当前域名
        if ($data['storage'] === StorageEnum::LOCAL) {
            $data['domain'] = uploads_url();
        }
        return "{$data['domain']}/{$data['file_path']}";
    }

    /**
     * 文件详情
     * @param int $fileId
     * @return static|array|null
     */
    public static function detail(int $fileId)
    {
        return self::get($fileId);
    }

}
