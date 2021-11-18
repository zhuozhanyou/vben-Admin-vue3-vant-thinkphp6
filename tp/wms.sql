/*
Navicat MySQL Data Transfer

Source Server         : qn_t
Source Server Version : 50733
Source Host           : 121.41.99.69:3306
Source Database       : wms

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2021-11-18 10:22:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wms_sys_api`
-- ----------------------------
DROP TABLE IF EXISTS `wms_sys_api`;
CREATE TABLE `wms_sys_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'url',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台API';

-- ----------------------------
-- Records of wms_sys_api
-- ----------------------------
INSERT INTO `wms_sys_api` VALUES ('1', '0', '系统管理', '-', '100', '0', '1635231103', '1635231103');
INSERT INTO `wms_sys_api` VALUES ('2', '1', '菜单管理', '/menu/getList', '10', '0', '1635231218', '1635243120');
INSERT INTO `wms_sys_api` VALUES ('3', '2', '新增、编辑', '/menu/add', '100', '0', '1635232530', '1635232885');
INSERT INTO `wms_sys_api` VALUES ('4', '2', '编辑', '/menu/add', '100', '1635232889', '1635232550', '1635232889');
INSERT INTO `wms_sys_api` VALUES ('5', '2', '删除', '/menu/del', '100', '0', '1635232572', '1635232621');
INSERT INTO `wms_sys_api` VALUES ('6', '0', '白名单', '-', '1', '0', '1635232711', '1635232717');
INSERT INTO `wms_sys_api` VALUES ('7', '1', '后台API', '/api/getList', '20', '0', '1635232776', '1635243129');
INSERT INTO `wms_sys_api` VALUES ('8', '7', '新增、编辑', '/api/add', '100', '0', '1635232813', '1635232879');
INSERT INTO `wms_sys_api` VALUES ('9', '7', '删除', '/api/del', '100', '0', '1635232868', '1635232868');
INSERT INTO `wms_sys_api` VALUES ('10', '1', '账号管理', '/user/getList', '100', '0', '1635232950', '1635232950');
INSERT INTO `wms_sys_api` VALUES ('11', '10', '新增、编辑', '/user/add', '100', '0', '1635233099', '1635233112');
INSERT INTO `wms_sys_api` VALUES ('12', '10', '删除', '/user/del', '100', '0', '1635233142', '1635233142');
INSERT INTO `wms_sys_api` VALUES ('13', '10', '修改密码', '/user/changePassword', '100', '0', '1635233166', '1635233166');
INSERT INTO `wms_sys_api` VALUES ('14', '1', '角色管理', '/role/getList', '100', '0', '1635233214', '1635233214');
INSERT INTO `wms_sys_api` VALUES ('15', '14', '所有角色数据', '/role/getListAll', '100', '0', '1635233300', '1635233300');
INSERT INTO `wms_sys_api` VALUES ('16', '14', '新增、编辑', '/role/add', '100', '0', '1635233317', '1635233324');
INSERT INTO `wms_sys_api` VALUES ('17', '14', '删除', '/role/del', '100', '0', '1635233343', '1635233343');
INSERT INTO `wms_sys_api` VALUES ('18', '14', '更改角色状态', '/role/setRoleStatus', '100', '0', '1635233376', '1635233376');
INSERT INTO `wms_sys_api` VALUES ('19', '1', '数据字典', '/dictionaries/getList', '100', '0', '1635233578', '1635233578');
INSERT INTO `wms_sys_api` VALUES ('20', '19', '新增、编辑', '/Dictionaries/add', '100', '0', '1635233613', '1635233613');
INSERT INTO `wms_sys_api` VALUES ('21', '19', '删除', '/dictionaries/del', '100', '0', '1635233647', '1635233647');
INSERT INTO `wms_sys_api` VALUES ('22', '1', '部门管理', '/dept/getList', '30', '0', '1635243164', '1635243178');
INSERT INTO `wms_sys_api` VALUES ('23', '22', '新增、编辑', '/dept/add', '100', '0', '1635243222', '1635243222');
INSERT INTO `wms_sys_api` VALUES ('24', '22', '删除', '/dept/del', '100', '0', '1635243247', '1635243247');
INSERT INTO `wms_sys_api` VALUES ('25', '6', '登录', '/passport/login', '100', '0', '1635388141', '1635388149');
INSERT INTO `wms_sys_api` VALUES ('26', '6', '退出', '/passport/logout', '100', '0', '1635388165', '1635388175');
INSERT INTO `wms_sys_api` VALUES ('27', '6', '用户信息', '/system/getUserInfo', '100', '0', '1635388205', '1635388285');
INSERT INTO `wms_sys_api` VALUES ('28', '6', '用户按钮权限', '/system/getPermCode', '100', '0', '1635388232', '1635388238');
INSERT INTO `wms_sys_api` VALUES ('29', '6', '菜单', '/system/getMenuList', '100', '0', '1635388272', '1635388272');
INSERT INTO `wms_sys_api` VALUES ('30', '1', '系统日志', '/log/getList', '100', '0', '1635415692', '1635415692');
INSERT INTO `wms_sys_api` VALUES ('31', '19', '数据树', '/dictionaries/getListTree', '100', '0', '1635676253', '1635676253');
INSERT INTO `wms_sys_api` VALUES ('32', '1', '系统通知', '/notice/getList', '100', '0', '1635747688', '1637138748');
INSERT INTO `wms_sys_api` VALUES ('33', '32', '新增、编辑', '/notice/add', '100', '0', '1635750208', '1636082253');
INSERT INTO `wms_sys_api` VALUES ('34', '32', '删除', '/notice/del', '100', '0', '1636082272', '1636082272');

-- ----------------------------
-- Table structure for `wms_sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `wms_sys_dept`;
CREATE TABLE `wms_sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `dept_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`dept_id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of wms_sys_dept
-- ----------------------------
INSERT INTO `wms_sys_dept` VALUES ('1', '0', '技术部', '100', '1', null, '0', '1637138498', '1637138498');
INSERT INTO `wms_sys_dept` VALUES ('2', '0', '总经办', '100', '1', null, '0', '1637138510', '1637138510');
INSERT INTO `wms_sys_dept` VALUES ('3', '0', '储运部', '100', '1', null, '0', '1637138523', '1637138523');

-- ----------------------------
-- Table structure for `wms_sys_dictionaries`
-- ----------------------------
DROP TABLE IF EXISTS `wms_sys_dictionaries`;
CREATE TABLE `wms_sys_dictionaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '编码',
  `spell` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '简拼',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='数据字典';

-- ----------------------------
-- Records of wms_sys_dictionaries
-- ----------------------------
INSERT INTO `wms_sys_dictionaries` VALUES ('1', '0', '10', '系统配置', 'sysConfig', '', null, '100', '0', '1637139300', '1637139300');

-- ----------------------------
-- Table structure for `wms_sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `wms_sys_log`;
CREATE TABLE `wms_sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT '0' COMMENT '操作人ID',
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '操作API',
  `params` text COLLATE utf8_unicode_ci COMMENT '参数',
  `run_sql` text COLLATE utf8_unicode_ci COMMENT '语句',
  `ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `view_times` int(11) DEFAULT '0' COMMENT '阅读次数',
  PRIMARY KEY (`id`),
  KEY `url` (`url`) USING BTREE,
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统操作日志';

-- ----------------------------
-- Records of wms_sys_log
-- ----------------------------
INSERT INTO `wms_sys_log` VALUES ('1', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637119175', '1637119175', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('2', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637119212', '1637119212', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('3', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637119223', '1637119223', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('4', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637119246', '1637119246', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('5', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '211.141.131.245', '1637128386', '1637128386', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('6', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637128616', '1637128616', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('7', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637128656', '1637128656', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('8', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637128752', '1637128752', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('9', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637128998', '1637128998', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('10', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637129136', '1637129136', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('11', '1', '卓战友', '/system/getUserInfo?_t=1637129137358', '[]', null, '127.0.0.1', '1637129138', '1637129138', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('12', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637132534', '1637132534', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('13', '1', '卓战友', '/system/getUserInfo?_t=1637132534489', '[]', null, '127.0.0.1', '1637132534', '1637132534', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('14', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637132542', '1637132542', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('15', '1', '卓战友', '/system/getUserInfo?_t=1637132542650', '[]', null, '127.0.0.1', '1637132542', '1637132542', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('16', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637133316', '1637133316', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('17', '1', '卓战友', '/system/getUserInfo?_t=1637133316959', '[]', null, '127.0.0.1', '1637133317', '1637133317', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('18', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637133792', '1637133792', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('19', '1', '卓战友', '/system/getUserInfo?_t=1637133793105', '[]', null, '127.0.0.1', '1637133793', '1637133793', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('20', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637133858', '1637133858', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('21', '1', '卓战友', '/system/getUserInfo?_t=1637133859027', '[]', null, '127.0.0.1', '1637133859', '1637133859', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('22', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637133919', '1637133919', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('23', '1', '卓战友', '/system/getUserInfo?_t=1637133919488', '[]', null, '127.0.0.1', '1637133919', '1637133919', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('24', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637134195', '1637134195', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('25', '1', '卓战友', '/system/getUserInfo?_t=1637134195334', '[]', null, '127.0.0.1', '1637134195', '1637134195', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('26', '1', '卓战友', '/system/getUser?_t=1637134326810', '[]', null, '127.0.0.1', '1637134327', '1637134327', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('27', '1', '卓战友', '/system/getUser?_t=1637134446512', '[]', null, '127.0.0.1', '1637134446', '1637134446', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('28', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637134454', '1637134454', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('29', '1', '卓战友', '/system/getUser?_t=1637134454799', '[]', null, '127.0.0.1', '1637134455', '1637134455', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('30', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637134625', '1637134625', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('31', '1', '卓战友', '/system/getUser?_t=1637134625316', '[]', null, '127.0.0.1', '1637134625', '1637134625', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('32', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637134669', '1637134669', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('33', '1', '卓战友', '/system/getUser?_t=1637134669415', '[]', null, '127.0.0.1', '1637134669', '1637134669', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('34', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637135236', '1637135236', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('35', '1', '卓战友', '/system/getUser?_t=1637135236647', '[]', null, '127.0.0.1', '1637135236', '1637135236', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('36', '1', '卓战友', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637135319', '1637135319', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('37', '1', '卓战友', '/system/getUser?_t=1637135320065', '[]', null, '127.0.0.1', '1637135320', '1637135320', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('38', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637135441', '1637135441', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('39', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637135625', '1637135625', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('40', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637136586', '1637136586', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('41', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637136606', '1637136606', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('42', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637136655', '1637136655', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('43', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637136661', '1637136661', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('44', '1', '卓战友', '/system/getUser', '[]', null, '127.0.0.1', '1637136739', '1637136739', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('45', '1', '卓战友', '/system/getUserInfo?_t=1637136774976', '[]', null, '127.0.0.1', '1637136775', '1637136775', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('46', '1', '卓战友', '/system/getUserInfo', '[]', null, '127.0.0.1', '1637136778', '1637136778', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('47', '1', '卓战友', '/system/getMenuList', '[]', null, '127.0.0.1', '1637136940', '1637136940', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('48', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '211.141.131.245', '1637137076', '1637137076', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('49', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637137075762\"}', null, '211.141.131.245', '1637137076', '1637137076', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('50', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637137076333\"}', null, '211.141.131.245', '1637137077', '1637137077', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('51', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637137076332\"}', null, '211.141.131.245', '1637137077', '1637137077', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('52', '1', '卓战友', '/api/getList', '{\"_t\":\"1637137094674\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637137096', '1637137096', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('53', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637137141460\"}', null, '211.141.131.245', '1637137142', '1637137142', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('54', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637137142331\"}', null, '211.141.131.245', '1637137143', '1637137143', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('55', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637137142331\"}', null, '211.141.131.245', '1637137143', '1637137143', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('56', '1', '卓战友', '/api/getList', '{\"_t\":\"1637137144181\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637137145', '1637137145', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('57', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637137615455\"}', null, '211.141.131.245', '1637137616', '1637137616', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('58', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637137615996\"}', null, '211.141.131.245', '1637137616', '1637137616', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('59', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637137615996\"}', null, '211.141.131.245', '1637137617', '1637137617', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('60', '1', '卓战友', '/api/getList', '{\"_t\":\"1637137617338\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637137618', '1637137618', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('61', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637137779049\"}', null, '211.141.131.245', '1637137780', '1637137780', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('62', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637137779592\"}', null, '211.141.131.245', '1637137780', '1637137780', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('63', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637137779591\"}', null, '211.141.131.245', '1637137780', '1637137780', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('64', '1', '卓战友', '/api/getList', '{\"_t\":\"1637137780922\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637137782', '1637137782', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('65', '1', '卓战友', '/passport/logout', '{\"_t\":\"1637137786555\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '211.141.131.245', '1637137787', '1637137787', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('66', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '211.141.131.245', '1637137794', '1637137794', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('67', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637137794361\"}', null, '211.141.131.245', '1637137795', '1637137795', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('68', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637137794830\"}', null, '211.141.131.245', '1637137795', '1637137795', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('69', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637137794831\"}', null, '211.141.131.245', '1637137795', '1637137795', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('70', '1', '卓战友', '/api/getList', '{\"_t\":\"1637137805494\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637137806', '1637137806', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('71', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637137807949\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637137809', '1637137809', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('72', '1', '卓战友', '/api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637137828', '1637137828', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('73', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637137828142\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637137829', '1637137829', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('74', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637137835366\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637137836', '1637137836', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('75', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '211.141.131.245', '1637138051', '1637138051', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('76', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637138050964\"}', null, '211.141.131.245', '1637138051', '1637138051', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('77', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637138051455\"}', null, '211.141.131.245', '1637138052', '1637138052', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('78', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637138051455\"}', null, '211.141.131.245', '1637138052', '1637138052', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('79', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138058129\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138059', '1637138059', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('80', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637138105505\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637138106', '1637138106', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('81', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138106333\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138107', '1637138107', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('82', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138106925\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138108', '1637138108', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('83', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138107000\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '211.141.131.245', '1637138108', '1637138108', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('84', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138108437\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138109', '1637138109', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('85', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637138108359\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138109', '1637138109', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('86', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138108994\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` ON `wms_sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138110', '1637138110', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('87', '1', '卓战友', '/notice/getList', '{\"_t\":\"1637138112117\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138113', '1637138113', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('88', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637138173167\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637138174', '1637138174', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('89', '1', '卓战友', '/api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138180', '1637138180', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('90', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637138180071\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637138181', '1637138181', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('91', '1', '卓战友', '/menu/add', '{\"menu_type\":\"10\",\"menu_id\":\"1\",\"title\":\"\\u9996\\u9875\",\"parent_id\":0,\"name\":\"Dashboard\",\"path\":\"\\/dashboard\",\"component\":\"LAYOUT\",\"orderNo\":1,\"icon\":\"ion:grid-outline\",\"status\":1,\"hideChildrenInMenu\":1,\"accessApi\":[]}', 'UPDATE `wms_sys_menu`  SET `hideChildrenInMenu` = 1 , `update_time` = 1637138183  WHERE (  `menu_id` = 1 ) AND `wms_sys_menu`.`delete_time` = \'0\'', '211.141.131.245', '1637138183', '1637138183', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('92', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637138183172\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637138184', '1637138184', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('93', '1', '卓战友', '/passport/logout', '{\"_t\":\"1637138187696\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '211.141.131.245', '1637138188', '1637138188', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('94', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '211.141.131.245', '1637138196', '1637138196', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('95', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637138195582\"}', null, '211.141.131.245', '1637138196', '1637138196', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('96', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637138196070\"}', null, '211.141.131.245', '1637138197', '1637138197', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('97', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637138196071\"}', null, '211.141.131.245', '1637138197', '1637138197', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('98', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138462462\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138463', '1637138463', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('99', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637138465698\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637138466', '1637138466', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('100', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138467522\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138468', '1637138468', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('101', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637138469673\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637138470', '1637138470', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('102', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138470886\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138471', '1637138471', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('103', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637138475225\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637138476', '1637138476', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('104', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138477762\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138478', '1637138478', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('105', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138478245\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138479', '1637138479', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('106', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138478314\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '211.141.131.245', '1637138479', '1637138479', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('107', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138481659\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138482', '1637138482', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('108', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138483221\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138484', '1637138484', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('109', '1', '卓战友', '/dept/add', '{\"dept_id\":0,\"dept_name\":\"\\u6280\\u672f\\u90e8\",\"parent_id\":0,\"sort\":100,\"status\":1}', 'INSERT INTO `wms_sys_dept` SET `dept_name` = \'技术部\' , `parent_id` = 0 , `sort` = 100 , `status` = 1 , `create_time` = 1637138498 , `update_time` = 1637138498', '211.141.131.245', '1637138498', '1637138498', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('110', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138498019\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138499', '1637138499', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('111', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138500988\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138502', '1637138502', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('112', '1', '卓战友', '/dept/add', '{\"dept_id\":0,\"dept_name\":\"\\u603b\\u7ecf\\u529e\",\"parent_id\":0,\"sort\":100,\"status\":1}', 'INSERT INTO `wms_sys_dept` SET `dept_name` = \'总经办\' , `parent_id` = 0 , `sort` = 100 , `status` = 1 , `create_time` = 1637138510 , `update_time` = 1637138510', '211.141.131.245', '1637138510', '1637138510', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('113', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138510026\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138511', '1637138511', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('114', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138512375\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138513', '1637138513', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('115', '1', '卓战友', '/dept/add', '{\"dept_id\":0,\"dept_name\":\"\\u50a8\\u8fd0\\u90e8\",\"parent_id\":0,\"sort\":100,\"status\":1}', 'INSERT INTO `wms_sys_dept` SET `dept_name` = \'储运部\' , `parent_id` = 0 , `sort` = 100 , `status` = 1 , `create_time` = 1637138523 , `update_time` = 1637138523', '211.141.131.245', '1637138523', '1637138523', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('116', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138522769\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138523', '1637138523', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('117', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138525790\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138526', '1637138526', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('118', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138525854\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '211.141.131.245', '1637138527', '1637138527', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('119', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637138530794\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138531', '1637138531', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('120', '1', '卓战友', '/role/getListAll', '{\"_t\":\"1637138530753\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138531', '1637138531', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('121', '1', '卓战友', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138538837\"}', 'SELECT COUNT(*) AS think_count FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' LIMIT 1', '211.141.131.245', '1637138539', '1637138539', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('122', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637138541187\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637138542', '1637138542', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('123', '1', '卓战友', '/role/add', '{\"role_id\":0,\"role_name\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\\u5458\",\"status\":1,\"menu_id\":{\"checked\":[4,32,33,34,35,5,10,11,12,7,19,20,21,2,22,24,26,8,23,25,27,9,15,29,30,31,28,36,37,38,39],\"halfChecked\":[]}}', 'INSERT INTO `wms_sys_role` SET `role_name` = \'系统管理员\' , `status` = 1 , `menu_id` = \'4,32,33,34,35,5,10,11,12,7,19,20,21,2,22,24,26,8,23,25,27,9,15,29,30,31,28,36,37,38,39\' , `create_time` = 1637138596 , `update_time` = 1637138596', '211.141.131.245', '1637138596', '1637138596', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('124', '1', '卓战友', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138595947\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '211.141.131.245', '1637138597', '1637138597', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('125', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637138615600\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138616', '1637138616', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('126', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138615649\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138616', '1637138616', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('127', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138617724\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` ON `wms_sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138618', '1637138618', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('128', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138626103\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138627', '1637138627', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('129', '1', '卓战友', '/notice/getList', '{\"_t\":\"1637138631258\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138632', '1637138632', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('130', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138634002\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` ON `wms_sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138635', '1637138635', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('131', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138653350\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138654', '1637138654', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('132', '1', '卓战友', '/api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138658', '1637138658', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('133', '1', '卓战友', '/api/add', '{\"id\":0,\"pid\":1,\"name\":\"\\u7cfb\\u7edf\\u901a\\u77e5\",\"url\":\"\\/notice\\/getList\",\"sort\":100}', 'INSERT INTO `wms_sys_api` SET `pid` = 1 , `name` = \'系统通知\' , `url` = \'/notice/getList\' , `sort` = 100 , `create_time` = 1637138676 , `update_time` = 1637138676', '211.141.131.245', '1637138676', '1637138676', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('134', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138675814\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138676', '1637138676', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('135', '1', '卓战友', '/api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138695', '1637138695', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('136', '1', '卓战友', '/api/add', '{\"id\":0,\"pid\":35,\"name\":\"\\u65b0\\u589e\\u3001\\u7f16\\u8f91\",\"url\":\"\\/notice\\/add\",\"sort\":100}', 'INSERT INTO `wms_sys_api` SET `pid` = 35 , `name` = \'新增、编辑\' , `url` = \'/notice/add\' , `sort` = 100 , `create_time` = 1637138724 , `update_time` = 1637138724', '211.141.131.245', '1637138724', '1637138724', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('137', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138723953\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138725', '1637138725', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('138', '1', '卓战友', '/api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138745', '1637138745', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('139', '1', '卓战友', '/api/add', '{\"id\":\"32\",\"pid\":1,\"name\":\"\\u7cfb\\u7edf\\u901a\\u77e5\",\"url\":\"\\/notice\\/getList\",\"sort\":100}', 'UPDATE `wms_sys_api`  SET `url` = \'/notice/getList\' , `update_time` = 1637138748  WHERE (  `id` = 32 ) AND `wms_sys_api`.`delete_time` = \'0\'', '211.141.131.245', '1637138748', '1637138748', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('140', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138748491\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138749', '1637138749', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('141', '1', '卓战友', '/api/del', '[36]', 'UPDATE `wms_sys_api`  SET `delete_time` = 1637138759 , `update_time` = 1637138759  WHERE (  `id` = 36 ) AND `wms_sys_api`.`delete_time` = \'0\'', '211.141.131.245', '1637138759', '1637138759', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('142', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138758789\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138759', '1637138759', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('143', '1', '卓战友', '/api/del', '[35]', 'UPDATE `wms_sys_api`  SET `delete_time` = 1637138772 , `update_time` = 1637138772  WHERE (  `id` = 35 ) AND `wms_sys_api`.`delete_time` = \'0\'', '211.141.131.245', '1637138773', '1637138773', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('144', '1', '卓战友', '/api/getList', '{\"_t\":\"1637138772571\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637138773', '1637138773', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('145', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138775426\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` ON `wms_sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138776', '1637138776', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('146', '1', '卓战友', '/notice/getList', '{\"_t\":\"1637138780679\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138781', '1637138781', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('147', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637138783160\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` ON `wms_sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637138784', '1637138784', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('148', '1', '卓战友', '/notice/getList', '{\"_t\":\"1637139040115\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139041', '1637139041', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('149', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637139042095\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` ON `wms_sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139043', '1637139043', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('150', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637139199828\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` ON `wms_sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139200', '1637139200', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('151', '1', '卓战友', '/notice/getList', '{\"_t\":\"1637139226260\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139227', '1637139227', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('152', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637139229630\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` ON `wms_sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139230', '1637139230', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('153', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637139230250\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139231', '1637139231', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('154', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637139230316\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637139231', '1637139231', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('155', '1', '卓战友', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637139237600\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '211.141.131.245', '1637139238', '1637139238', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('156', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637139243278\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637139244', '1637139244', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('157', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637139243331\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '211.141.131.245', '1637139244', '1637139244', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('158', '1', '卓战友', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637139249584\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '211.141.131.245', '1637139250', '1637139250', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('159', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637139250560\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139251', '1637139251', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('160', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637139250615\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637139251', '1637139251', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('161', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637139256302\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139257', '1637139257', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('162', '1', '卓战友', '/dictionaries/add', '{\"id\":0,\"type\":\"10\",\"parent_id\":0,\"name\":\"\\u7cfb\\u7edf\\u914d\\u7f6e\",\"code\":\"sysConfig\",\"sort\":100}', 'INSERT INTO `wms_sys_dictionaries` SET `type` = \'10\' , `parent_id` = 0 , `name` = \'系统配置\' , `code` = \'sysConfig\' , `sort` = 100 , `create_time` = 1637139300 , `update_time` = 1637139300', '211.141.131.245', '1637139300', '1637139300', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('163', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637139300499\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139301', '1637139301', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('164', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637139307883\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637139309', '1637139309', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('165', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637139307936\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637139309', '1637139309', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('166', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"1\",\"_t\":\"1637139311533\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 1  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637139312', '1637139312', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('167', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"\",\"_t\":\"1637140402444\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637140403', '1637140403', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('168', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637140406211\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` ON `wms_sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637140407', '1637140407', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('169', '1', '卓战友', '/notice/getList', '{\"_t\":\"1637140414318\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637140415', '1637140415', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('170', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637140416284\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637140417', '1637140417', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('171', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637140416231\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637140417', '1637140417', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('172', '1', '卓战友', '/notice/getList', '{\"_t\":\"1637140417507\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637140418', '1637140418', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('173', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637140972', '1637140972', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('174', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637140972308\"}', null, '127.0.0.1', '1637140972', '1637140972', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('175', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637140972627\"}', null, '127.0.0.1', '1637140972', '1637140972', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('176', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637140972627\"}', null, '127.0.0.1', '1637140973', '1637140973', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('177', '1', '卓战友', '/api/getList', '{\"_t\":\"1637140988710\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637140989', '1637140989', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('178', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637140992028\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637140992', '1637140992', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('179', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637140993519\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637140993', '1637140993', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('180', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637140995347\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637140995', '1637140995', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('181', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637140995414\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637140996', '1637140996', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('182', '1', '卓战友', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637140997328\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '127.0.0.1', '1637140997', '1637140997', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('183', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637141040403\"}', 'SELECT sys_log.*,wms_sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637141040', '1637141040', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('184', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637141062081\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637141062', '1637141062', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('185', '1', '卓战友', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637141065743\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '127.0.0.1', '1637141066', '1637141066', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('186', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637141066823\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637141067', '1637141067', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('187', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637141066887\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637141067', '1637141067', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('188', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637141068152\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637141068', '1637141068', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('189', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637141069136\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637141069', '1637141069', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('190', '1', '卓战友', '/api/getList', '{\"_t\":\"1637141069862\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637141070', '1637141070', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('191', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637141073928\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637141074', '1637141074', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('192', '1', '卓战友', '/log/getList', '{\"page\":\"2\",\"pageSize\":\"50\",\"_t\":\"1637141084502\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637141085', '1637141085', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('193', '1', '卓战友', '/log/getList', '{\"page\":\"3\",\"pageSize\":\"50\",\"_t\":\"1637141086250\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637141086', '1637141086', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('194', '1', '卓战友', '/log/getList', '{\"page\":\"4\",\"pageSize\":\"50\",\"_t\":\"1637141087932\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637141088', '1637141088', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('195', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637141104289\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637141105', '1637141105', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('196', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637144013859\"}', null, '127.0.0.1', '1637144014', '1637144014', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('197', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637144014231\"}', null, '127.0.0.1', '1637144014', '1637144014', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('198', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637144014230\"}', null, '127.0.0.1', '1637144014', '1637144014', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('199', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637144022192\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637144022', '1637144022', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('200', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637144034894\"}', null, '127.0.0.1', '1637144035', '1637144035', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('201', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637144035246\"}', null, '127.0.0.1', '1637144035', '1637144035', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('202', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637144035247\"}', null, '127.0.0.1', '1637144035', '1637144035', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('203', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637144040296\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637144040', '1637144040', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('204', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637144310892\"}', null, '127.0.0.1', '1637144311', '1637144311', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('205', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637144311250\"}', null, '127.0.0.1', '1637144311', '1637144311', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('206', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637144311251\"}', null, '127.0.0.1', '1637144311', '1637144311', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('207', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637144313192\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637144313', '1637144313', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('208', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637144316145\"}', null, '127.0.0.1', '1637144316', '1637144316', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('209', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637144316590\"}', null, '127.0.0.1', '1637144316', '1637144316', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('210', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637144316590\"}', null, '127.0.0.1', '1637144316', '1637144316', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('211', '1', '卓战友', '/passport/logout', '{\"_t\":\"1637144323425\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637144323', '1637144323', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('212', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637144332', '1637144332', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('213', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637144332252\"}', null, '127.0.0.1', '1637144332', '1637144332', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('214', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637144332594\"}', null, '127.0.0.1', '1637144332', '1637144332', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('215', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637144332593\"}', null, '127.0.0.1', '1637144332', '1637144332', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('216', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637145999783\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637146000', '1637146000', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('217', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637146888810\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637146889', '1637146889', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('218', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637146890503\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637146890', '1637146890', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('219', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637146890560\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637146891', '1637146891', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('220', '1', '卓战友', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637146891969\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '127.0.0.1', '1637146892', '1637146892', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('221', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637147078323\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637147079', '1637147079', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('222', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637147078279\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637147079', '1637147079', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('223', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"1\",\"_t\":\"1637147080564\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 1  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637147081', '1637147081', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('224', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637147085235\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637147085', '1637147085', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('225', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637147087944\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637147088', '1637147088', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('226', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637147088009\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637147088', '1637147088', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('227', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"1\",\"_t\":\"1637147089211\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 1  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637147089', '1637147089', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('228', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637147090439\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637147090', '1637147090', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('229', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637147093975\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637147094', '1637147094', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('230', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637147716546\"}', null, '127.0.0.1', '1637147716', '1637147716', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('231', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637147716922\"}', null, '127.0.0.1', '1637147717', '1637147717', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('232', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637147716922\"}', null, '127.0.0.1', '1637147717', '1637147717', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('233', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637147728186\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637147729', '1637147729', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('234', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637147907269\"}', null, '127.0.0.1', '1637147907', '1637147907', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('235', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637147907705\"}', null, '127.0.0.1', '1637147907', '1637147907', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('236', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637147907706\"}', null, '127.0.0.1', '1637147907', '1637147907', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('237', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637147910724\"}', null, '127.0.0.1', '1637147910', '1637147910', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('238', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637147911074\"}', null, '127.0.0.1', '1637147911', '1637147911', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('239', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637147911075\"}', null, '127.0.0.1', '1637147911', '1637147911', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('240', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637147915561\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637147915', '1637147915', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('241', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637147925364\"}', null, '127.0.0.1', '1637147925', '1637147925', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('242', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637147925710\"}', null, '127.0.0.1', '1637147925', '1637147925', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('243', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637147925710\"}', null, '127.0.0.1', '1637147925', '1637147925', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('244', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637147931196\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637147931', '1637147931', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('245', '0', '', '/passport/logout', '{\"_t\":\"1637199101379\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637199102', '1637199102', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('246', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637199230', '1637199230', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('247', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637199230696\"}', null, '127.0.0.1', '1637199230', '1637199230', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('248', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637199231042\"}', null, '127.0.0.1', '1637199231', '1637199231', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('249', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637199231043\"}', null, '127.0.0.1', '1637199231', '1637199231', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('250', '1', '卓战友', '/api/getList', '{\"_t\":\"1637199243039\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637199243', '1637199243', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('251', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637199247093\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637199247', '1637199247', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('252', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637199248501\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637199248', '1637199248', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('253', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637199363043\"}', null, '127.0.0.1', '1637199363', '1637199363', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('254', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637199363418\"}', null, '127.0.0.1', '1637199363', '1637199363', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('255', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637199363418\"}', null, '127.0.0.1', '1637199363', '1637199363', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('256', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637199364565\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637199364', '1637199364', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('257', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637199373553\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637199373', '1637199373', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('258', '1', '卓战友', '/api/getList', '{\"_t\":\"1637199375657\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637199376', '1637199376', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('259', '1', '卓战友', '/menu/getList', '{\"_t\":\"1637199754891\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637199755', '1637199755', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('260', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637199755868\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637199756', '1637199756', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('261', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637199756603\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637199756', '1637199756', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('262', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637199756664\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637199757', '1637199757', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('263', '1', '卓战友', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637199757380\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '127.0.0.1', '1637199757', '1637199757', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('264', '1', '卓战友', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637199758439\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637199758', '1637199758', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('265', '1', '卓战友', '/dictionaries/getListTree', '{\"_t\":\"1637199758356\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637199758', '1637199758', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('266', '1', '卓战友', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637199758994\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637199759', '1637199759', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('267', '1', '卓战友', '/notice/getList', '{\"_t\":\"1637199761007\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637199761', '1637199761', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('268', '1', '卓战友', '/system/getUserInfo', '{\"_t\":\"1637202032027\"}', null, '127.0.0.1', '1637202032', '1637202032', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('269', '1', '卓战友', '/system/getPermCode', '{\"_t\":\"1637202032359\"}', null, '127.0.0.1', '1637202032', '1637202032', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('270', '1', '卓战友', '/system/getMenuList', '{\"_t\":\"1637202032359\"}', null, '127.0.0.1', '1637202032', '1637202032', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('271', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637202041736\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637202042', '1637202042', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('272', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637202041799\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637202042', '1637202042', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('273', '1', '卓战友', '/role/getListAll', '{\"_t\":\"1637202044622\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637202044', '1637202044', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('274', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637202044672\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637202044', '1637202044', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('275', '1', '卓战友', '/user/add', '{\"user_id\":\"1\",\"user_name\":\"admin\",\"password\":\"123456\",\"role_id\":[1],\"dept_id\":1,\"real_name\":\"\\u5353\\u6218\\u53cb\",\"mobile\":\"18118731011\",\"is_super\":1,\"remark\":null}', 'UPDATE `wms_sys_user`  SET `password` = \'$2y$10$AnKvZi3o20ZSfoBHNJLDbOzLaJShBxWSlFoYhBaoAuuIhuw7wEsqO\' , `update_time` = 1637202051  WHERE (  `user_id` = 1 ) AND `wms_sys_user`.`delete_time` = \'0\'', '127.0.0.1', '1637202052', '1637202052', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('276', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637202052269\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637202052', '1637202052', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('277', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637202054063\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637202054', '1637202054', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('278', '1', '卓战友', '/user/add', '{\"user_id\":\"2\",\"user_name\":\"zhanyou\",\"password\":\"123456\",\"role_id\":[2],\"dept_id\":8,\"real_name\":\"zhanyou\",\"mobile\":\"\",\"is_super\":-1,\"remark\":null}', 'UPDATE `wms_sys_user`  SET `password` = \'$2y$10$v2FXHjHZCH3wd5AuBHW01.pCezljBnMEmDFtkDVFSiZaEXCkxzu7C\' , `update_time` = 1637202058  WHERE (  `user_id` = 2 ) AND `wms_sys_user`.`delete_time` = \'0\'', '127.0.0.1', '1637202059', '1637202059', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('279', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637202059254\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637202059', '1637202059', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('280', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637202062268\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637202062', '1637202062', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('281', '1', '卓战友', '/user/add', '{\"user_id\":\"1\",\"user_name\":\"admin\",\"role_id\":[1],\"dept_id\":1,\"real_name\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\\u5458\",\"mobile\":\"18118731011\",\"is_super\":1,\"remark\":null}', 'UPDATE `wms_sys_user`  SET `real_name` = \'系统管理员\' , `update_time` = 1637202072  WHERE (  `user_id` = 1 ) AND `wms_sys_user`.`delete_time` = \'0\'', '127.0.0.1', '1637202072', '1637202072', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('282', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637202072864\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637202073', '1637202073', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('283', '1', '卓战友', '/dept/getList', '{\"_t\":\"1637202075161\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637202075', '1637202075', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('284', '1', '卓战友', '/user/add', '{\"user_id\":\"2\",\"user_name\":\"zhanyou\",\"role_id\":[2],\"dept_id\":8,\"real_name\":\"zhuozhanyou\",\"mobile\":\"\",\"is_super\":-1,\"remark\":null}', 'UPDATE `wms_sys_user`  SET `real_name` = \'zhuozhanyou\' , `update_time` = 1637202084  WHERE (  `user_id` = 2 ) AND `wms_sys_user`.`delete_time` = \'0\'', '127.0.0.1', '1637202084', '1637202084', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('285', '1', '卓战友', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637202084550\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637202085', '1637202085', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('286', '1', '卓战友', '/passport/logout', '{\"_t\":\"1637202090882\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637202091', '1637202091', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('287', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637202099', '1637202099', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('288', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637202100023\"}', null, '127.0.0.1', '1637202100', '1637202100', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('289', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637202100357\"}', null, '127.0.0.1', '1637202100', '1637202100', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('290', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637202100357\"}', null, '127.0.0.1', '1637202100', '1637202100', '0', '0');

-- ----------------------------
-- Table structure for `wms_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `wms_sys_menu`;
CREATE TABLE `wms_sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级菜单',
  `menu_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单类型',
  `path` varchar(200) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '路由',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '组件',
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '图标',
  `orderNo` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `ignoreKeepAlive` tinyint(3) DEFAULT '1' COMMENT '是否忽略KeepAlive缓存',
  `frameSrc` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否外链',
  `hideChildrenInMenu` tinyint(3) NOT NULL DEFAULT '0' COMMENT '隐藏所有子菜单',
  `accessApi` text COLLATE utf8_unicode_ci COMMENT 'API权限',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`menu_id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单表';

-- ----------------------------
-- Records of wms_sys_menu
-- ----------------------------
INSERT INTO `wms_sys_menu` VALUES ('1', '0', '10', '/dashboard', 'Dashboard', 'LAYOUT', '首页', 'ion:grid-outline', '1', '1', '-1', '1', '1', null, '0', '1637138183', '0');
INSERT INTO `wms_sys_menu` VALUES ('2', '4', '20', 'account', 'AccountManagement', '/system/account/index', '账号管理', 'ant-design:aliwangwang-outlined', '100', '1', '-1', '-1', '-1', '/user/getList,/dept/getList', '0', '1635217355', '0');
INSERT INTO `wms_sys_menu` VALUES ('3', '1', '20', 'workbench', 'workbench', '/dashboard/workbench/index', '工作台', 'ant-design:carry-out-outlined', '100', '1', '-1', '-1', '-1', null, '0', '1634458831', '0');
INSERT INTO `wms_sys_menu` VALUES ('4', '0', '10', '/system', 'System', 'LAYOUT', '系统管理', 'ion:settings-outline', '100', '1', '-1', '-1', '-1', null, '0', '0', '0');
INSERT INTO `wms_sys_menu` VALUES ('5', '4', '20', 'menu', 'MenuManagement', '/system/menu/index', '菜单管理', 'ant-design:align-left-outlined', '5', '1', '-1', '-1', '-1', '/menu/getList', '0', '1635749819', '0');
INSERT INTO `wms_sys_menu` VALUES ('6', '1', '20', 'analysis', 'Analysis', '/dashboard/analysis/index', '首页', 'ant-design:appstore-outlined', '1', '1', '-1', '-1', '-1', null, '0', '0', '0');
INSERT INTO `wms_sys_menu` VALUES ('7', '4', '20', 'dept', 'DeptManagement', '/system/dept/index', '部门管理', 'ant-design:apartment-outlined', '10', '1', '-1', '-1', '-1', '/dept/getList', '0', '1635216371', '0');
INSERT INTO `wms_sys_menu` VALUES ('8', '4', '20', 'role', 'RoleManagement', '/system/role/index', '角色管理', 'ant-design:contacts-outlined', '100', '1', '-1', '-1', '-1', '/role/getList,/role/setRoleStatus', '0', '1635217781', '0');
INSERT INTO `wms_sys_menu` VALUES ('9', '4', '20', 'changePassword', 'changePassword', '/system/password/index', '修改密码', 'ant-design:copyright-circle-outlined', '100', '1', '-1', '-1', '-1', '/user/changePassword', '0', '1634725740', '0');
INSERT INTO `wms_sys_menu` VALUES ('10', '5', '30', '', 'addMenu', '', '新增', '', '100', '1', '-1', '-1', '-1', '/menu/add', '0', '1634724769', '0');
INSERT INTO `wms_sys_menu` VALUES ('11', '5', '30', '', 'editMenu', '', '编辑', '', '100', '1', '-1', '-1', '-1', '/menu/add', '0', '1634724778', '0');
INSERT INTO `wms_sys_menu` VALUES ('12', '5', '30', '', 'delMenu', '', '删除', '', '100', '1', '-1', '-1', '-1', '/menu/del', '0', '1634724786', '0');
INSERT INTO `wms_sys_menu` VALUES ('13', '0', '10', '/stock', 'stock', '/stock', '仓库配置', 'ant-design:file-protect-outlined', '100', '1', '-1', '-1', '-1', null, '0', '1633743569', '0');
INSERT INTO `wms_sys_menu` VALUES ('14', '13', '20', 'stock', 'stockManage', '/stock/stock', '仓库管理', 'ant-design:bank-twotone', '100', '1', '-1', '-1', '-1', null, '1632808435', '1633747864', '0');
INSERT INTO `wms_sys_menu` VALUES ('15', '4', '20', 'dictionaries', 'dictionaries', '/system/dictionaries/index', '数据字典', 'ant-design:profile-outlined', '100', '1', '-1', '-1', '-1', '/dictionaries/getList,/dictionaries/getListTree', '1632820732', '1635207098', '0');
INSERT INTO `wms_sys_menu` VALUES ('16', '13', '20', 'location', 'location', '/stock/location', '储位管理', 'ant-design:calculator-outlined', '100', '1', '-1', '-1', '-1', null, '1633748010', '1634034263', '0');
INSERT INTO `wms_sys_menu` VALUES ('17', '0', '10', '/delivery', 'delivery', 'LAYOUT', '发货管理', 'ant-design:dashboard-outlined', '10', '1', '-1', '-1', '-1', null, '1634034447', '1634034472', '0');
INSERT INTO `wms_sys_menu` VALUES ('18', '17', '20', 'orders', 'orders', '/delivery/orders/inex', '待发货订单', 'ant-design:audit-outlined', '100', '1', '-1', '-1', '-1', null, '1634034557', '1634034557', '0');
INSERT INTO `wms_sys_menu` VALUES ('19', '7', '30', '', 'addDept', '', '新增', '', '100', '1', '-1', '-1', '-1', '/dept/add', '1634626662', '1634725076', '0');
INSERT INTO `wms_sys_menu` VALUES ('20', '7', '30', '', 'editDept', '', '编辑', '', '100', '1', '-1', '-1', '-1', '/dept/add', '1634626697', '1634725088', '0');
INSERT INTO `wms_sys_menu` VALUES ('21', '7', '30', '', 'delDept', '', '删除', '', '100', '1', '-1', '-1', '-1', '/dept/del', '1634626726', '1634725099', '0');
INSERT INTO `wms_sys_menu` VALUES ('22', '2', '30', '', 'addUser', '', '新增', '', '100', '1', '-1', '-1', '-1', '/dept/getList,/role/getListAll,/user/add', '1634626761', '1635217421', '0');
INSERT INTO `wms_sys_menu` VALUES ('23', '8', '30', '', 'addRole', '', '新增', '', '100', '1', '-1', '-1', '-1', '/role/add,/menu/getList', '1634626787', '1635217724', '0');
INSERT INTO `wms_sys_menu` VALUES ('24', '2', '30', '', 'editUser', '', '编辑', '', '100', '1', '-1', '-1', '-1', '/dept/getList,/role/getListAll,/user/add', '1634626822', '1635217437', '0');
INSERT INTO `wms_sys_menu` VALUES ('25', '8', '30', '', 'editRole', '', '编辑', '', '100', '1', '-1', '-1', '-1', '/role/add,/menu/getList', '1634626848', '1635217737', '0');
INSERT INTO `wms_sys_menu` VALUES ('26', '2', '30', '', 'delUser', '', '删除', '', '100', '1', '-1', '-1', '-1', '/user/del', '1634626878', '1634725255', '0');
INSERT INTO `wms_sys_menu` VALUES ('27', '8', '30', '', 'delRole', '', '删除', '', '100', '1', '-1', '-1', '-1', '/role/del', '1634626891', '1634725232', '0');
INSERT INTO `wms_sys_menu` VALUES ('28', '4', '20', 'log', 'log', '/system/log/index', '系统日志', 'ant-design:exception-outlined', '100', '1', '-1', '-1', '-1', '/logs/getList,/log/getList', '1634808731', '1635415833', '0');
INSERT INTO `wms_sys_menu` VALUES ('29', '15', '30', '', 'addDic', '', '新增', '', '100', '1', '-1', '-1', '-1', '/Dictionaries/add', '1635212789', '1635244637', '0');
INSERT INTO `wms_sys_menu` VALUES ('30', '15', '30', '', 'editDic', '', '编辑', '', '100', '1', '-1', '-1', '-1', '/dictionaries/add,/Dictionaries/add', '1635212819', '1635244645', '0');
INSERT INTO `wms_sys_menu` VALUES ('31', '15', '30', '', 'delDic', '', '删除', '', '100', '1', '-1', '-1', '-1', '/dictionaries/del', '1635212857', '1635212857', '0');
INSERT INTO `wms_sys_menu` VALUES ('32', '4', '20', 'api', 'apiManage', '/system/api/index', '后台API', 'ant-design:delete-row-outlined', '1', '1', '-1', '-1', '-1', '/api/getList', '1635218298', '1635749803', '0');
INSERT INTO `wms_sys_menu` VALUES ('33', '32', '30', '', 'addApi', '', '新增', '', '100', '1', '-1', '-1', '-1', '/api/add', '1635218455', '1635244433', '0');
INSERT INTO `wms_sys_menu` VALUES ('34', '32', '30', '', 'editApi', '', '编辑', '', '100', '1', '-1', '-1', '-1', '/menu/add', '1635218486', '1635244456', '0');
INSERT INTO `wms_sys_menu` VALUES ('35', '32', '30', '', 'delApi', '', '删除', '', '100', '1', '-1', '-1', '-1', '/api/del', '1635218509', '1635244474', '0');
INSERT INTO `wms_sys_menu` VALUES ('36', '4', '20', 'notice', 'noticeManage', '/system/notice/index', '系统通知', 'ant-design:notification-outlined', '100', '1', '-1', '-1', '-1', '/notice/list', '1635747639', '1635762594', '0');
INSERT INTO `wms_sys_menu` VALUES ('37', '36', '30', '', 'addNotice', '', '新增', '', '100', '1', '-1', '-1', '-1', '/notice/add', '1635750260', '1636082335', '0');
INSERT INTO `wms_sys_menu` VALUES ('38', '36', '30', '', 'editNotice', '', '编辑', '', '100', '1', '-1', '-1', '-1', '/notice/add', '1636082390', '1636082390', '0');
INSERT INTO `wms_sys_menu` VALUES ('39', '36', '30', '', 'delNotice', '', '删除', '', '100', '1', '-1', '-1', '-1', '/notice/del', '1636082413', '1636082413', '0');

-- ----------------------------
-- Table structure for `wms_sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `wms_sys_notice`;
CREATE TABLE `wms_sys_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `notice_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '消息类型',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8_unicode_ci COMMENT '内容',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '跳转url',
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '来源',
  `accepter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '接收',
  `grade` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '紧急度',
  `create_user` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '发布人',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '状态',
  `view_times` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  PRIMARY KEY (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统消息';

-- ----------------------------
-- Records of wms_sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `wms_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `wms_sys_role`;
CREATE TABLE `wms_sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `menu_id` text COLLATE utf8_unicode_ci COMMENT '权限菜单',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色表';

-- ----------------------------
-- Records of wms_sys_role
-- ----------------------------
INSERT INTO `wms_sys_role` VALUES ('1', '系统管理员', '4,32,33,34,35,5,10,11,12,7,19,20,21,2,22,24,26,8,23,25,27,9,15,29,30,31,28,36,37,38,39', '1', null, '0', '1637138596', '1637138596');

-- ----------------------------
-- Table structure for `wms_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `wms_sys_user`;
CREATE TABLE `wms_sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `real_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `telphone` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '电话',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属部门',
  `role_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '所属角色',
  `menu_id` text COLLATE utf8_unicode_ci COMMENT '附加权限',
  `is_super` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of wms_sys_user
-- ----------------------------
INSERT INTO `wms_sys_user` VALUES ('1', 'admin', '$2y$10$AnKvZi3o20ZSfoBHNJLDbOzLaJShBxWSlFoYhBaoAuuIhuw7wEsqO', '系统管理员', '', '18118731011', '', '1', '1', null, '1', '1', null, '0', '0', '1637202072');
INSERT INTO `wms_sys_user` VALUES ('2', 'zhanyou', '$2y$10$v2FXHjHZCH3wd5AuBHW01.pCezljBnMEmDFtkDVFSiZaEXCkxzu7C', 'zhuozhanyou', '', '', '', '8', '2', null, '-1', '1', null, '0', '1634438062', '1637202084');
