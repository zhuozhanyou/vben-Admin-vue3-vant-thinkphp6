<?php

declare (strict_types = 1);
// 商户后台api白名单配置
// 此处定义的api所有账户均有权访问
// Auth类: app\store\service\Auth.php
return [
    // 用户登录
    '/passport/login',
    // 退出登录
    '/passport/logout',


    '/system/getUserInfo',
    // 当前用户信息
    '/system/getPermCode',
    // 获取路由菜单信息
    '/system/getMenuList',
    // 修改当前用户信息

    '/system.dictionaries/getDic',
    // 获取数据字典数据

    // 文件库列表
    '/files/list',
    // 文件分组列表
    '/files.group/list',
    // 上传图片文件
    '/upload/image',

    // 获取所有地区
    '/region/all',
    // 获取所有地区(树状格式)
    '/region/tree',
];