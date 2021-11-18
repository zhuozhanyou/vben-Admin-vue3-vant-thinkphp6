<?php

// +----------------------------------------------------------------------
// | 缓存设置
// +----------------------------------------------------------------------

// 设置绝对路径
// 因为在console中使用cache会导致找不到正确的runtime目录, 所以此处不能使用相对路径
$rootPath = dirname(__DIR__);

return [
    // 默认缓存驱动
    'default' => env('cache.driver', 'redis'),

    // 缓存连接方式配置
    'stores'  => [
        'file' => [
            // 驱动方式
            'type'       => 'File',
            // 缓存保存目录
            'path'       => "{$rootPath}/runtime/cache/",
            // 缓存前缀
            'prefix'     => '',
            // 缓存有效期 0表示永久缓存
            'expire'     => 0,
            // 缓存标签前缀
            'tag_prefix' => 'tag:',
            // 序列化机制 例如 ['serialize', 'unserialize']
            'serialize'  => [],
        ],
        // 更多的缓存连接
        'redis' => [
            // 驱动方式
            'type'       => 'Redis',
            'host'       => '127.0.0.1',
            'port'       => 6379,
            'password'   => '',
            'select'     => 0,
            'prefix'     => 'wms:',
            'serialize'  => []
        ]
    ],
];
