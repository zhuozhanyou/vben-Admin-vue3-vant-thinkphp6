# vtAdmin

#### 介绍
vben admin 一款很优秀的ant vue前端框架，但对于一个后端人员开发，不能拿开直接开干，多少有点望而却步。vtAdmin是使用vben admin(前端)+thinkphp6(后端）快速搭建管理后台，旨在让更多后端开发人员快速上手使用vben admin这样优秀的前端框架。

#### 软件架构
前端vben admin https://gitee.com/annsion/vue-vben-admin
后端tp6 https://gitee.com/liu21st/thinkphp

#### 安装教程
项目tp目录为tp6文件，front为vben admin文。

##### tp6安装
1.  下载宝塔或phpstudy，并安装好nginx、php7.4+、mysql、redis、composer；
2.  composer install安装tp6依赖；
3.  创建数据库，并导入sql，配置.env文件，配置config/cache.php为redis；
4.  使用宝塔或phpstudy创建web站点，运行查看是否正常；

##### vben admin 安装
1.  修改front目录下的.env.development文件的VITE_PROXY为刚创建的tp6站点；
2.  终端运行yarn install;
3.  终端运行yarn run serve,编译完成即可访问 http://localhost:3100/  ;

登录账号admin 密码123456

#### 使用说明

qq群：248367725