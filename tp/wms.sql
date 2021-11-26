/*
Navicat MySQL Data Transfer

Source Server         : qn_t
Source Server Version : 50733
Source Host           : 121.41.99.69:3306
Source Database       : wms

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2021-11-25 16:28:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wms_stock`
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock`;
CREATE TABLE `wms_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `fnumber` varchar(255) NOT NULL DEFAULT '0' COMMENT '编码',
  `fname` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `is_scattered` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '是否零散库',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fnumber` (`fnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='仓库管理';

-- ----------------------------
-- Records of wms_stock
-- ----------------------------
INSERT INTO `wms_stock` VALUES ('1', 'W103005', '医贸-阴凉库(中药饮片)', '-1', '100', '0', '1637809432', '1637809432');
INSERT INTO `wms_stock` VALUES ('2', 'W103011', '医贸-阴凉库二-零货区', '1', '1', '0', '1637809473', '1637822125');
INSERT INTO `wms_stock` VALUES ('3', 'W103012', '医贸-阴凉库二-整货区', '-1', '100', '0', '1637809496', '1637809496');
INSERT INTO `wms_stock` VALUES ('4', 'W103014', '医贸-常温库三', '-1', '100', '0', '1637809623', '1637809623');
INSERT INTO `wms_stock` VALUES ('5', 'W103016', '医贸-常温库四', '-1', '100', '0', '1637809645', '1637809645');
INSERT INTO `wms_stock` VALUES ('6', 'W103017', '医贸-常温库五', '-1', '100', '0', '1637809680', '1637809680');
INSERT INTO `wms_stock` VALUES ('7', 'W103018', '医贸-常温库六', '-1', '100', '0', '1637809694', '1637809694');
INSERT INTO `wms_stock` VALUES ('8', 'W103019', '医贸-阴凉库三', '-1', '100', '0', '1637809710', '1637809710');
INSERT INTO `wms_stock` VALUES ('9', 'W103020', '医贸-阴凉库四', '-1', '100', '1637821702', '1637809720', '1637821702');

-- ----------------------------
-- Table structure for `wms_stock_location`
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_location`;
CREATE TABLE `wms_stock_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `stock_id` int(11) NOT NULL COMMENT '仓库ID',
  `fnumber` varchar(255) NOT NULL DEFAULT '' COMMENT '编码',
  `goodsSn` varchar(255) NOT NULL DEFAULT '' COMMENT '当前存放商品',
  `flot` varchar(255) NOT NULL DEFAULT '' COMMENT '商品批号',
  `goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '存放数量',
  `area_cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '适存品类',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `stock_id` (`stock_id`),
  KEY `goodsSn` (`goodsSn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓库储位管理';

-- ----------------------------
-- Records of wms_stock_location
-- ----------------------------

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
INSERT INTO `wms_sys_api` VALUES ('2', '1', '菜单管理', '/system.menu/getList', '10', '0', '1635231218', '1635243120');
INSERT INTO `wms_sys_api` VALUES ('3', '2', '新增、编辑', '/system.menu/add', '100', '0', '1635232530', '1635232885');
INSERT INTO `wms_sys_api` VALUES ('4', '2', '编辑', '/system.menu/add', '100', '1635232889', '1635232550', '1635232889');
INSERT INTO `wms_sys_api` VALUES ('5', '2', '删除', '/system.menu/del', '100', '0', '1635232572', '1635232621');
INSERT INTO `wms_sys_api` VALUES ('6', '0', '白名单', '-', '1', '0', '1635232711', '1635232717');
INSERT INTO `wms_sys_api` VALUES ('7', '1', '后台API', '/system.api/getList', '20', '0', '1635232776', '1635243129');
INSERT INTO `wms_sys_api` VALUES ('8', '7', '新增、编辑', '/system.api/add', '100', '0', '1635232813', '1635232879');
INSERT INTO `wms_sys_api` VALUES ('9', '7', '删除', '/system.api/del', '100', '0', '1635232868', '1635232868');
INSERT INTO `wms_sys_api` VALUES ('10', '1', '账号管理', '/system.user/getList', '100', '0', '1635232950', '1635232950');
INSERT INTO `wms_sys_api` VALUES ('11', '10', '新增、编辑', '/system.user/add', '100', '0', '1635233099', '1635233112');
INSERT INTO `wms_sys_api` VALUES ('12', '10', '删除', '/system.user/del', '100', '0', '1635233142', '1635233142');
INSERT INTO `wms_sys_api` VALUES ('13', '10', '修改密码', '/system.user/changePassword', '100', '0', '1635233166', '1635233166');
INSERT INTO `wms_sys_api` VALUES ('14', '1', '角色管理', '/system.role/getList', '100', '0', '1635233214', '1635233214');
INSERT INTO `wms_sys_api` VALUES ('15', '14', '所有角色数据', '/system.role/getListAll', '100', '0', '1635233300', '1635233300');
INSERT INTO `wms_sys_api` VALUES ('16', '14', '新增、编辑', '/system.role/add', '100', '0', '1635233317', '1635233324');
INSERT INTO `wms_sys_api` VALUES ('17', '14', '删除', '/system.role/del', '100', '0', '1635233343', '1635233343');
INSERT INTO `wms_sys_api` VALUES ('18', '14', '更改角色状态', '/system.role/setRoleStatus', '100', '0', '1635233376', '1635233376');
INSERT INTO `wms_sys_api` VALUES ('19', '1', '数据字典', '/system.dictionaries/getList', '100', '0', '1635233578', '1635233578');
INSERT INTO `wms_sys_api` VALUES ('20', '19', '新增、编辑', '/system.Dictionaries/add', '100', '0', '1635233613', '1635233613');
INSERT INTO `wms_sys_api` VALUES ('21', '19', '删除', '/system.dictionaries/del', '100', '0', '1635233647', '1635233647');
INSERT INTO `wms_sys_api` VALUES ('22', '1', '部门管理', '/system.dept/getList', '30', '0', '1635243164', '1635243178');
INSERT INTO `wms_sys_api` VALUES ('23', '22', '新增、编辑', '/system.dept/add', '100', '0', '1635243222', '1635243222');
INSERT INTO `wms_sys_api` VALUES ('24', '22', '删除', '/system.dept/del', '100', '0', '1635243247', '1635243247');
INSERT INTO `wms_sys_api` VALUES ('25', '6', '登录', '/passport/login', '100', '0', '1635388141', '1635388149');
INSERT INTO `wms_sys_api` VALUES ('26', '6', '退出', '/passport/logout', '100', '0', '1635388165', '1635388175');
INSERT INTO `wms_sys_api` VALUES ('27', '6', '用户信息', '/system/getUserInfo', '100', '0', '1635388205', '1635388285');
INSERT INTO `wms_sys_api` VALUES ('28', '6', '角色按钮权限', '/system/getPermCode', '100', '0', '1635388232', '1637803946');
INSERT INTO `wms_sys_api` VALUES ('29', '6', '菜单', '/system/getMenuList', '100', '0', '1635388272', '1635388272');
INSERT INTO `wms_sys_api` VALUES ('30', '1', '系统日志', '/system.log/getList', '100', '0', '1635415692', '1635415692');
INSERT INTO `wms_sys_api` VALUES ('31', '19', '数据树', '/system.dictionaries/getListTree', '100', '0', '1635676253', '1637804007');
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='数据字典';

-- ----------------------------
-- Records of wms_sys_dictionaries
-- ----------------------------
INSERT INTO `wms_sys_dictionaries` VALUES ('1', '0', '10', '系统配置', 'sysConfig', '', null, '100', '0', '1637139300', '1637139300');
INSERT INTO `wms_sys_dictionaries` VALUES ('2', '1', '10', '物料品类', 'stockCate', '', null, '100', '0', '1637822459', '1637822474');
INSERT INTO `wms_sys_dictionaries` VALUES ('3', '2', '20', '药品', '10', '', null, '10', '0', '1637822529', '1637822709');
INSERT INTO `wms_sys_dictionaries` VALUES ('4', '2', '20', '食品', '20', '', null, '20', '0', '1637822548', '1637822718');
INSERT INTO `wms_sys_dictionaries` VALUES ('5', '2', '20', '物料', '40', '', null, '100', '0', '1637822590', '1637822637');
INSERT INTO `wms_sys_dictionaries` VALUES ('6', '2', '20', '器械', '30', '', null, '30', '0', '1637822700', '1637822700');

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
) ENGINE=MyISAM AUTO_INCREMENT=837 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='系统操作日志';

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
INSERT INTO `wms_sys_log` VALUES ('291', '0', '', '/passport/logout', '{\"_t\":\"1637203688206\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '211.141.131.245', '1637203689', '1637203689', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('292', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '211.141.131.245', '1637203700', '1637203700', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('293', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '211.141.131.245', '1637203793', '1637203793', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('294', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '211.141.131.245', '1637203814', '1637203814', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('295', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '211.141.131.245', '1637203840', '1637203840', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('296', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637203839235\"}', null, '211.141.131.245', '1637203840', '1637203840', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('297', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637203839693\"}', null, '211.141.131.245', '1637203841', '1637203841', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('298', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637203839693\"}', null, '211.141.131.245', '1637203841', '1637203841', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('299', '1', '系统管理员', '/api/getList', '{\"_t\":\"1637203857099\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637203858', '1637203858', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('300', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637203859223\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '211.141.131.245', '1637203861', '1637203861', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('301', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637203859952\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637203861', '1637203861', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('302', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637203861150\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637203863', '1637203863', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('303', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637203861211\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '211.141.131.245', '1637203863', '1637203863', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('304', '1', '系统管理员', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637203862141\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '211.141.131.245', '1637203864', '1637203864', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('305', '1', '系统管理员', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637203863408\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '211.141.131.245', '1637203865', '1637203865', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('306', '1', '系统管理员', '/dictionaries/getListTree', '{\"_t\":\"1637203863349\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637203865', '1637203865', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('307', '1', '系统管理员', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637203863927\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637203865', '1637203865', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('308', '1', '系统管理员', '/notice/getList', '{\"_t\":\"1637203868219\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '211.141.131.245', '1637203870', '1637203870', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('309', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '211.141.131.245', '1637204324', '1637204324', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('310', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637656826', '1637656826', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('311', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637656826623\"}', null, '127.0.0.1', '1637656826', '1637656826', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('312', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637656826959\"}', null, '127.0.0.1', '1637656827', '1637656827', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('313', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637656826958\"}', null, '127.0.0.1', '1637656827', '1637656827', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('314', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637656868505\"}', null, '127.0.0.1', '1637656868', '1637656868', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('315', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637656868883\"}', null, '127.0.0.1', '1637656869', '1637656869', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('316', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637656868883\"}', null, '127.0.0.1', '1637656869', '1637656869', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('317', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637658027690\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637658028', '1637658028', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('318', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637658038858\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637658039', '1637658039', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('319', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637658040194\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637658040', '1637658040', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('320', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637658040264\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637658040', '1637658040', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('321', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637658178125\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637658178', '1637658178', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('322', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637658181071\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637658181', '1637658181', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('323', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637658181132\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637658181', '1637658181', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('324', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637658187273\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637658187', '1637658187', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('325', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637659585425\"}', null, '127.0.0.1', '1637659585', '1637659585', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('326', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637659585836\"}', null, '127.0.0.1', '1637659586', '1637659586', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('327', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637659585835\"}', null, '127.0.0.1', '1637659586', '1637659586', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('328', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637659587124\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637659587', '1637659587', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('329', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637659627551\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637659627', '1637659627', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('330', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637659627619\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637659628', '1637659628', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('331', '0', '', '/passport/logout', '{\"_t\":\"1637743443419\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637743445', '1637743445', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('332', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637743453', '1637743453', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('333', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637743459', '1637743459', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('334', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637743459465\"}', null, '127.0.0.1', '1637743459', '1637743459', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('335', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637743459805\"}', null, '127.0.0.1', '1637743460', '1637743460', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('336', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637743459805\"}', null, '127.0.0.1', '1637743460', '1637743460', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('337', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637743529944\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637743530', '1637743530', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('338', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637744058400\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637744058', '1637744058', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('339', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637744058447\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637744059', '1637744059', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('340', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637744062266\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637744062', '1637744062', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('341', '1', '系统管理员', '/role/getListAll', '{\"_t\":\"1637744062213\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637744062', '1637744062', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('342', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637744370708\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637744371', '1637744371', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('343', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637744376120\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637744376', '1637744376', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('344', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637744385521\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637744385', '1637744385', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('345', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637745954756\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637745955', '1637745955', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('346', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637745954834\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637745955', '1637745955', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('347', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637745958158\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637745958', '1637745958', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('348', '1', '系统管理员', '/role/getListAll', '{\"_t\":\"1637745958122\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637745958', '1637745958', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('349', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637745980723\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637745981', '1637745981', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('350', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637745987368\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637745987', '1637745987', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('351', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637745992372\"}', null, '127.0.0.1', '1637745992', '1637745992', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('352', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637745992706\"}', null, '127.0.0.1', '1637745992', '1637745992', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('353', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637745992706\"}', null, '127.0.0.1', '1637745992', '1637745992', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('354', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637745994764\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637745995', '1637745995', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('355', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637745995022\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637745995', '1637745995', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('356', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637745997500\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637745997', '1637745997', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('357', '1', '系统管理员', '/role/getListAll', '{\"_t\":\"1637745997460\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637745997', '1637745997', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('358', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746001103\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746001', '1637746001', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('359', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746004471\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746004', '1637746004', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('360', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746013352\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746013', '1637746013', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('361', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746028839\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746029', '1637746029', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('362', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637746121995\"}', null, '127.0.0.1', '1637746122', '1637746122', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('363', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637746122447\"}', null, '127.0.0.1', '1637746122', '1637746122', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('364', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637746122447\"}', null, '127.0.0.1', '1637746122', '1637746122', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('365', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746124073\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746124', '1637746124', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('366', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637746124288\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637746124', '1637746124', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('367', '1', '系统管理员', '/role/getListAll', '{\"_t\":\"1637746126850\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637746127', '1637746127', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('368', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746126894\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746127', '1637746127', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('369', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746135497\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746135', '1637746135', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('370', '1', '系统管理员', '/user/add', '{\"user_id\":\"1\",\"user_name\":\"admin\",\"role_id\":[1],\"dept_id\":1,\"real_name\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\\u5458\",\"mobile\":\"18118731011\",\"is_super\":1,\"remark\":null}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_id` = 1 ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637746165', '1637746165', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('371', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637746166044\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637746166', '1637746166', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('372', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746167836\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746168', '1637746168', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('373', '1', '系统管理员', '/user/add', '{\"user_id\":\"2\",\"user_name\":\"zhanyou\",\"role_id\":[1],\"dept_id\":8,\"real_name\":\"zhuozhanyou\",\"mobile\":\"\",\"is_super\":-1,\"remark\":null}', 'UPDATE `wms_sys_user`  SET `role_id` = \'1\' , `update_time` = 1637746173  WHERE (  `user_id` = 2 ) AND `wms_sys_user`.`delete_time` = \'0\'', '127.0.0.1', '1637746173', '1637746173', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('374', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637746173859\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637746174', '1637746174', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('375', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637746177611\"}', null, '127.0.0.1', '1637746177', '1637746177', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('376', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637746177928\"}', null, '127.0.0.1', '1637746178', '1637746178', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('377', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637746177928\"}', null, '127.0.0.1', '1637746178', '1637746178', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('378', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746178905\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746179', '1637746179', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('379', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637746179114\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637746179', '1637746179', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('380', '1', '系统管理员', '/role/getListAll', '{\"_t\":\"1637746181517\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637746181', '1637746181', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('381', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746181559\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746181', '1637746181', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('382', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746188374\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746188', '1637746188', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('383', '1', '系统管理员', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637746198516\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '127.0.0.1', '1637746198', '1637746198', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('384', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637746201088\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637746201', '1637746201', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('385', '1', '系统管理员', '/role/add', '{\"role_id\":0,\"role_name\":\"\\u53d1\\u8d27\\u5458\",\"status\":1,\"menu_id\":{\"checked\":[13,17],\"halfChecked\":[]}}', 'INSERT INTO `wms_sys_role` SET `role_name` = \'发货员\' , `status` = 1 , `menu_id` = \'13,17\' , `create_time` = 1637746217 , `update_time` = 1637746217', '127.0.0.1', '1637746217', '1637746217', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('386', '1', '系统管理员', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637746217356\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '127.0.0.1', '1637746217', '1637746217', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('387', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746222852\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746223', '1637746223', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('388', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637746222909\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637746223', '1637746223', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('389', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637746225294\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637746225', '1637746225', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('390', '1', '系统管理员', '/role/getListAll', '{\"_t\":\"1637746225258\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637746225', '1637746225', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('391', '1', '系统管理员', '/user/add', '{\"user_id\":\"2\",\"user_name\":\"zhanyou\",\"role_id\":[1,2],\"dept_id\":8,\"real_name\":\"zhuozhanyou\",\"mobile\":\"\",\"is_super\":-1,\"remark\":null}', 'UPDATE `wms_sys_user`  SET `role_id` = \'1,2\' , `update_time` = 1637746231  WHERE (  `user_id` = 2 ) AND `wms_sys_user`.`delete_time` = \'0\'', '127.0.0.1', '1637746231', '1637746231', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('392', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637746232121\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637746232', '1637746232', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('393', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637748037815\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637748038', '1637748038', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('394', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637748042074\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637748042', '1637748042', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('395', '1', '系统管理员', '/notice/getList', '{\"_t\":\"1637748296490\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637748296', '1637748296', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('396', '1', '系统管理员', '/log/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637748300499\"}', 'SELECT sys_log.*,sys_api.name api_name FROM `wms_sys_log` `sys_log` LEFT JOIN `wms_sys_api` `sys_api` ON `sys_api`.`url`=`sys_log`.`url` WHERE `sys_log`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637748300', '1637748300', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('397', '1', '系统管理员', '/dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637748303681\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637748304', '1637748304', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('398', '1', '系统管理员', '/dictionaries/getListTree', '{\"_t\":\"1637748303626\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637748304', '1637748304', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('399', '1', '系统管理员', '/role/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637748307459\"}', 'SELECT * FROM `wms_sys_role` WHERE `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC LIMIT 0,15', '127.0.0.1', '1637748307', '1637748307', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('400', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637748308956\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637748309', '1637748309', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('401', '1', '系统管理员', '/user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637748309009\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637748309', '1637748309', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('402', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637748311235\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637748311', '1637748311', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('403', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637748312966\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637748313', '1637748313', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('404', '0', '', '/passport/logout', '{\"_t\":\"1637800245164\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637800245', '1637800245', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('405', '0', '', '/passport/login', '{\"password\":\"hjjhkatdc\",\"username\":\"admin\"}', 'SELECT * FROM `wms_sys_user` WHERE (  `user_name` = \'admin\' ) AND `wms_sys_user`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637800254', '1637800254', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('406', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637800261', '1637800261', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('407', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637800261322\"}', null, '127.0.0.1', '1637800261', '1637800261', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('408', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637800261680\"}', null, '127.0.0.1', '1637800261', '1637800261', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('409', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637800261681\"}', null, '127.0.0.1', '1637800261', '1637800261', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('410', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637800344573\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637800345', '1637800345', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('411', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637800365507\"}', null, '127.0.0.1', '1637800365', '1637800365', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('412', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637800365852\"}', null, '127.0.0.1', '1637800366', '1637800366', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('413', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637800365852\"}', null, '127.0.0.1', '1637800366', '1637800366', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('414', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637800368648\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637800369', '1637800369', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('415', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637800372437\"}', null, '127.0.0.1', '1637800372', '1637800372', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('416', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637800372853\"}', null, '127.0.0.1', '1637800373', '1637800373', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('417', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637800372853\"}', null, '127.0.0.1', '1637800373', '1637800373', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('418', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637800375628\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637800376', '1637800376', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('419', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637800399956\"}', null, '127.0.0.1', '1637800400', '1637800400', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('420', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637800400290\"}', null, '127.0.0.1', '1637800400', '1637800400', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('421', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637800400290\"}', null, '127.0.0.1', '1637800400', '1637800400', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('422', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637800402628\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637800403', '1637800403', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('423', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637800424334\"}', null, '127.0.0.1', '1637800424', '1637800424', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('424', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637800424740\"}', null, '127.0.0.1', '1637800424', '1637800424', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('425', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637800424741\"}', null, '127.0.0.1', '1637800424', '1637800424', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('426', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637800427017\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637800427', '1637800427', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('427', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637800441185\"}', null, '127.0.0.1', '1637800441', '1637800441', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('428', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637800441672\"}', null, '127.0.0.1', '1637800441', '1637800441', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('429', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637800441673\"}', null, '127.0.0.1', '1637800441', '1637800441', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('430', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637800442831\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637800443', '1637800443', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('431', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637800515849\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637800516', '1637800516', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('432', '1', '系统管理员', '/api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637800531', '1637800531', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('433', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637800531321\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637800531', '1637800531', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('434', '1', '系统管理员', '/menu/add', '{\"menu_type\":\"20\",\"menu_id\":\"14\",\"title\":\"\\u4ed3\\u5e93\\u7ba1\\u7406\",\"parent_id\":13,\"name\":\"stockManage\",\"path\":\"stock\",\"component\":\"\\/stock\\/stock\\/index\",\"orderNo\":100,\"icon\":\"ant-design:bank-twotone\",\"status\":1,\"accessApi\":[],\"frameSrc\":-1,\"ignoreKeepAlive\":-1}', 'UPDATE `wms_sys_menu`  SET `component` = \'/stock/stock/index\' , `update_time` = 1637800540  WHERE (  `menu_id` = 14 ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637800540', '1637800540', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('435', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637800540363\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637800540', '1637800540', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('436', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637800544677\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637800545', '1637800545', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('437', '1', '系统管理员', '/menu/add', '{\"menu_type\":\"20\",\"menu_id\":\"16\",\"title\":\"\\u50a8\\u4f4d\\u7ba1\\u7406\",\"parent_id\":13,\"name\":\"location\",\"path\":\"location\",\"component\":\"\\/stock\\/location\\/index\",\"orderNo\":100,\"icon\":\"ant-design:calculator-outlined\",\"status\":1,\"accessApi\":[],\"frameSrc\":-1,\"ignoreKeepAlive\":-1}', 'UPDATE `wms_sys_menu`  SET `component` = \'/stock/location/index\' , `update_time` = 1637800551  WHERE (  `menu_id` = 16 ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637800551', '1637800551', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('438', '1', '系统管理员', '/menu/getList', '{\"_t\":\"1637800551770\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637800552', '1637800552', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('439', '1', '系统管理员', '/passport/logout', '{\"_t\":\"1637800556480\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637800556', '1637800556', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('440', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637800563', '1637800563', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('441', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637800564082\"}', null, '127.0.0.1', '1637800564', '1637800564', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('442', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637800564432\"}', null, '127.0.0.1', '1637800564', '1637800564', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('443', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637800564431\"}', null, '127.0.0.1', '1637800564', '1637800564', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('444', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637800580103\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637800580', '1637800580', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('445', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637800957300\"}', null, '127.0.0.1', '1637800957', '1637800957', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('446', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637800957733\"}', null, '127.0.0.1', '1637800957', '1637800957', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('447', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637800957734\"}', null, '127.0.0.1', '1637800958', '1637800958', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('448', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637801090823\"}', null, '127.0.0.1', '1637801091', '1637801091', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('449', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637801091189\"}', null, '127.0.0.1', '1637801091', '1637801091', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('450', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637801091188\"}', null, '127.0.0.1', '1637801091', '1637801091', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('451', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637801144107\"}', null, '127.0.0.1', '1637801144', '1637801144', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('452', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637801144458\"}', null, '127.0.0.1', '1637801144', '1637801144', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('453', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637801144459\"}', null, '127.0.0.1', '1637801144', '1637801144', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('454', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637801323863\"}', null, '127.0.0.1', '1637801324', '1637801324', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('455', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637801324222\"}', null, '127.0.0.1', '1637801324', '1637801324', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('456', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637801324222\"}', null, '127.0.0.1', '1637801324', '1637801324', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('457', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637801585321\"}', null, '127.0.0.1', '1637801585', '1637801585', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('458', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637801585735\"}', null, '127.0.0.1', '1637801585', '1637801585', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('459', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637801585736\"}', null, '127.0.0.1', '1637801585', '1637801585', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('460', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637801780258\"}', null, '127.0.0.1', '1637801780', '1637801780', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('461', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637801780608\"}', null, '127.0.0.1', '1637801780', '1637801780', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('462', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637801780607\"}', null, '127.0.0.1', '1637801780', '1637801780', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('463', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637801786273\"}', null, '127.0.0.1', '1637801786', '1637801786', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('464', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637801786608\"}', null, '127.0.0.1', '1637801786', '1637801786', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('465', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637801786608\"}', null, '127.0.0.1', '1637801786', '1637801786', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('466', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637801788523\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637801788', '1637801788', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('467', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637801885168\"}', null, '127.0.0.1', '1637801885', '1637801885', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('468', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637801885503\"}', null, '127.0.0.1', '1637801885', '1637801885', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('469', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637801885503\"}', null, '127.0.0.1', '1637801885', '1637801885', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('470', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637801887631\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637801887', '1637801887', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('471', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637801912544\"}', null, '127.0.0.1', '1637801912', '1637801912', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('472', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637801912923\"}', null, '127.0.0.1', '1637801913', '1637801913', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('473', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637801912922\"}', null, '127.0.0.1', '1637801913', '1637801913', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('474', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637801914506\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637801914', '1637801914', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('475', '1', '系统管理员', '/dept/getList', '{\"_t\":\"1637801994272\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637801994', '1637801994', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('476', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637802670094\"}', null, '127.0.0.1', '1637802670', '1637802670', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('477', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637802670436\"}', null, '127.0.0.1', '1637802670', '1637802670', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('478', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637802670435\"}', null, '127.0.0.1', '1637802670', '1637802670', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('479', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637802930615\"}', null, '127.0.0.1', '1637802930', '1637802930', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('480', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637802930983\"}', null, '127.0.0.1', '1637802931', '1637802931', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('481', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637802930983\"}', null, '127.0.0.1', '1637802931', '1637802931', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('482', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637803158282\"}', null, '127.0.0.1', '1637803158', '1637803158', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('483', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637803158678\"}', null, '127.0.0.1', '1637803158', '1637803158', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('484', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637803158678\"}', null, '127.0.0.1', '1637803158', '1637803158', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('485', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637803159861\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803160', '1637803160', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('486', '1', '系统管理员', '/system.menu/getList', '{\"_t\":\"1637803161695\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637803162', '1637803162', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('487', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637803163546\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803163', '1637803163', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('488', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637803164765\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803165', '1637803165', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('489', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637803164829\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637803165', '1637803165', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('490', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637803166099\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803166', '1637803166', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('491', '1', '系统管理员', '/system.menu/getList', '{\"_t\":\"1637803547930\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637803548', '1637803548', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('492', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637803588865\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803589', '1637803589', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('493', '1', '系统管理员', '/system.menu/getList', '{\"_t\":\"1637803591350\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637803591', '1637803591', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('494', '1', '系统管理员', '/system.api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803594', '1637803594', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('495', '1', '系统管理员', '/system.menu/getList', '{\"_t\":\"1637803595004\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637803595', '1637803595', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('496', '1', '系统管理员', '/system.menu/getList', '{\"_t\":\"1637803600825\"}', 'SELECT * FROM `wms_sys_menu` WHERE `wms_sys_menu`.`delete_time` = \'0\' ORDER BY `orderNo` ASC,`create_time` ASC', '127.0.0.1', '1637803601', '1637803601', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('497', '1', '系统管理员', '/passport/logout', '{\"_t\":\"1637803849405\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637803849', '1637803849', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('498', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637803859', '1637803859', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('499', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637803859556\"}', null, '127.0.0.1', '1637803859', '1637803859', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('500', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637803859911\"}', null, '127.0.0.1', '1637803860', '1637803860', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('501', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637803859911\"}', null, '127.0.0.1', '1637803860', '1637803860', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('502', '1', '系统管理员', '/system.notice/getList', '{\"_t\":\"1637803869517\"}', 'SELECT * FROM `wms_sys_notice` WHERE `wms_sys_notice`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637803869', '1637803869', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('503', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637803874082\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803874', '1637803874', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('504', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637803899786\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803900', '1637803900', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('505', '1', '系统管理员', '/system.api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803906', '1637803906', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('506', '1', '系统管理员', '/system.api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803910', '1637803910', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('507', '1', '系统管理员', '/system.api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803919', '1637803919', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('508', '1', '系统管理员', '/system.api/add', '{\"id\":\"28\",\"pid\":6,\"name\":\"\\u89d2\\u8272\\u6309\\u94ae\\u6743\\u9650\",\"url\":\"\\/system\\/getPermCode\",\"sort\":100}', 'UPDATE `wms_sys_api`  SET `name` = \'角色按钮权限\' , `update_time` = 1637803946  WHERE (  `id` = 28 ) AND `wms_sys_api`.`delete_time` = \'0\'', '127.0.0.1', '1637803946', '1637803946', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('509', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637803946529\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803946', '1637803946', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('510', '1', '系统管理员', '/system.api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803968', '1637803968', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('511', '1', '系统管理员', '/system.api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637803973', '1637803973', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('512', '1', '系统管理员', '/system.api/getList', '[]', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637804003', '1637804003', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('513', '1', '系统管理员', '/system.api/add', '{\"id\":\"31\",\"pid\":19,\"name\":\"\\u6570\\u636e\\u6811\",\"url\":\"\\/system.dictionaries\\/getListTree\",\"sort\":100}', 'UPDATE `wms_sys_api`  SET `url` = \'/system.dictionaries/getListTree\' , `update_time` = 1637804007  WHERE (  `id` = 31 ) AND `wms_sys_api`.`delete_time` = \'0\'', '127.0.0.1', '1637804007', '1637804007', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('514', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637804007991\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637804008', '1637804008', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('515', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808397892\"}', null, '127.0.0.1', '1637808398', '1637808398', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('516', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808398263\"}', null, '127.0.0.1', '1637808398', '1637808398', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('517', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808398264\"}', null, '127.0.0.1', '1637808398', '1637808398', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('518', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808400633\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808401', '1637808401', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('519', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808449166\"}', null, '127.0.0.1', '1637808449', '1637808449', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('520', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808449505\"}', null, '127.0.0.1', '1637808449', '1637808449', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('521', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808449505\"}', null, '127.0.0.1', '1637808449', '1637808449', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('522', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808450691\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808451', '1637808451', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('523', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808454931\"}', null, '127.0.0.1', '1637808455', '1637808455', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('524', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808455271\"}', null, '127.0.0.1', '1637808455', '1637808455', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('525', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808455271\"}', null, '127.0.0.1', '1637808455', '1637808455', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('526', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808456673\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808457', '1637808457', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('527', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808509212\"}', null, '127.0.0.1', '1637808509', '1637808509', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('528', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808509573\"}', null, '127.0.0.1', '1637808509', '1637808509', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('529', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808509573\"}', null, '127.0.0.1', '1637808509', '1637808509', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('530', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808510646\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808510', '1637808510', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('531', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808515056\"}', null, '127.0.0.1', '1637808515', '1637808515', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('532', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808515389\"}', null, '127.0.0.1', '1637808515', '1637808515', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('533', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808515389\"}', null, '127.0.0.1', '1637808515', '1637808515', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('534', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808516624\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808516', '1637808516', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('535', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808634178\"}', null, '127.0.0.1', '1637808634', '1637808634', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('536', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808634524\"}', null, '127.0.0.1', '1637808634', '1637808634', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('537', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808634524\"}', null, '127.0.0.1', '1637808634', '1637808634', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('538', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808636625\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808636', '1637808636', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('539', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808660469\"}', null, '127.0.0.1', '1637808660', '1637808660', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('540', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808660798\"}', null, '127.0.0.1', '1637808661', '1637808661', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('541', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808660798\"}', null, '127.0.0.1', '1637808661', '1637808661', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('542', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808662673\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808663', '1637808663', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('543', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808683219\"}', null, '127.0.0.1', '1637808683', '1637808683', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('544', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808683564\"}', null, '127.0.0.1', '1637808683', '1637808683', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('545', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808683564\"}', null, '127.0.0.1', '1637808683', '1637808683', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('546', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808684688\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808685', '1637808685', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('547', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808700777\"}', null, '127.0.0.1', '1637808700', '1637808700', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('548', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808701104\"}', null, '127.0.0.1', '1637808701', '1637808701', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('549', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808701104\"}', null, '127.0.0.1', '1637808701', '1637808701', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('550', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808702630\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808703', '1637808703', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('551', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808710773\"}', null, '127.0.0.1', '1637808710', '1637808710', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('552', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808711093\"}', null, '127.0.0.1', '1637808711', '1637808711', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('553', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808711092\"}', null, '127.0.0.1', '1637808711', '1637808711', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('554', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808712638\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808713', '1637808713', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('555', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808713726\"}', null, '127.0.0.1', '1637808713', '1637808713', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('556', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808714050\"}', null, '127.0.0.1', '1637808714', '1637808714', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('557', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808714050\"}', null, '127.0.0.1', '1637808714', '1637808714', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('558', '1', '系统管理员', '/system.api/getList', '{\"_t\":\"1637808715158\"}', 'SELECT * FROM `wms_sys_api` WHERE `wms_sys_api`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637808715', '1637808715', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('559', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637808810334\"}', null, '127.0.0.1', '1637808810', '1637808810', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('560', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637808810689\"}', null, '127.0.0.1', '1637808810', '1637808810', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('561', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637808810688\"}', null, '127.0.0.1', '1637808810', '1637808810', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('562', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809263644\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809264', '1637809264', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('563', '1', '系统管理员', '/stock.stock/add', '{\"id\":0,\"fname\":\"\\u533b\\u8d38-\\u9634\\u51c9\\u5e93(\\u4e2d\\u836f\\u996e\\u7247)\",\"fnumber\":\"W103005\",\"sort\":100,\"is_scattered\":-1}', 'INSERT INTO `wms_stock` SET `fname` = \'医贸-阴凉库(中药饮片)\' , `fnumber` = \'W103005\' , `sort` = 100 , `is_scattered` = -1 , `create_time` = 1637809432 , `update_time` = 1637809432', '127.0.0.1', '1637809432', '1637809432', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('564', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809432274\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809432', '1637809432', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('565', '1', '系统管理员', '/stock.stock/add', '{\"id\":0,\"fname\":\"\\u533b\\u8d38-\\u9634\\u51c9\\u5e93\\u4e8c-\\u96f6\\u8d27\\u533a\",\"fnumber\":\"W103011\",\"sort\":100,\"is_scattered\":-1}', 'INSERT INTO `wms_stock` SET `fname` = \'医贸-阴凉库二-零货区\' , `fnumber` = \'W103011\' , `sort` = 100 , `is_scattered` = -1 , `create_time` = 1637809473 , `update_time` = 1637809473', '127.0.0.1', '1637809473', '1637809473', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('566', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809473531\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809473', '1637809473', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('567', '1', '系统管理员', '/stock.stock/add', '{\"id\":0,\"fname\":\"\\u533b\\u8d38-\\u9634\\u51c9\\u5e93\\u4e8c-\\u6574\\u8d27\\u533a\",\"fnumber\":\"W103012\",\"sort\":100,\"is_scattered\":-1}', 'INSERT INTO `wms_stock` SET `fname` = \'医贸-阴凉库二-整货区\' , `fnumber` = \'W103012\' , `sort` = 100 , `is_scattered` = -1 , `create_time` = 1637809496 , `update_time` = 1637809496', '127.0.0.1', '1637809496', '1637809496', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('568', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809496946\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809497', '1637809497', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('569', '1', '系统管理员', '/stock.stock/add', '{\"id\":\"2\",\"fname\":\"\\u533b\\u8d38-\\u9634\\u51c9\\u5e93\\u4e8c-\\u96f6\\u8d27\\u533a\",\"fnumber\":\"W103011\",\"sort\":100,\"is_scattered\":1}', 'UPDATE `wms_stock`  SET `is_scattered` = 1 , `update_time` = 1637809501  WHERE (  `id` = 2 ) AND `wms_stock`.`delete_time` = \'0\'', '127.0.0.1', '1637809502', '1637809502', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('570', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809502216\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809502', '1637809502', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('571', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809544143\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809544', '1637809544', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('572', '1', '系统管理员', '/stock.stock/add', '{\"id\":\"2\",\"fname\":\"\\u533b\\u8d38-\\u9634\\u51c9\\u5e93\\u4e8c-\\u96f6\\u8d27\\u533a\",\"fnumber\":\"W103011\",\"sort\":100,\"is_scattered\":1}', 'SELECT * FROM `wms_stock` WHERE (  `id` = 2 ) AND `wms_stock`.`delete_time` = \'0\' LIMIT 1', '127.0.0.1', '1637809549', '1637809549', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('573', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809549482\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809549', '1637809549', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('574', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637809584792\"}', null, '127.0.0.1', '1637809585', '1637809585', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('575', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637809585119\"}', null, '127.0.0.1', '1637809585', '1637809585', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('576', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637809585119\"}', null, '127.0.0.1', '1637809585', '1637809585', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('577', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809586451\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809586', '1637809586', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('578', '1', '系统管理员', '/stock.stock/add', '{\"id\":0,\"fname\":\"\\u533b\\u8d38-\\u5e38\\u6e29\\u5e93\\u4e09\",\"fnumber\":\"W103014\",\"sort\":100,\"is_scattered\":-1}', 'INSERT INTO `wms_stock` SET `fname` = \'医贸-常温库三\' , `fnumber` = \'W103014\' , `sort` = 100 , `is_scattered` = -1 , `create_time` = 1637809623 , `update_time` = 1637809623', '127.0.0.1', '1637809624', '1637809624', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('579', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809624319\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809624', '1637809624', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('580', '1', '系统管理员', '/stock.stock/add', '{\"id\":0,\"fname\":\"\\u533b\\u8d38-\\u5e38\\u6e29\\u5e93\\u56db\",\"fnumber\":\"W103016\",\"sort\":100,\"is_scattered\":-1}', 'INSERT INTO `wms_stock` SET `fname` = \'医贸-常温库四\' , `fnumber` = \'W103016\' , `sort` = 100 , `is_scattered` = -1 , `create_time` = 1637809645 , `update_time` = 1637809645', '127.0.0.1', '1637809645', '1637809645', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('581', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809645792\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809646', '1637809646', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('582', '1', '系统管理员', '/stock.stock/add', '{\"id\":0,\"fname\":\"\\u533b\\u8d38-\\u5e38\\u6e29\\u5e93\\u4e94\",\"fnumber\":\"W103017\",\"sort\":100,\"is_scattered\":-1}', 'INSERT INTO `wms_stock` SET `fname` = \'医贸-常温库五\' , `fnumber` = \'W103017\' , `sort` = 100 , `is_scattered` = -1 , `create_time` = 1637809680 , `update_time` = 1637809680', '127.0.0.1', '1637809681', '1637809681', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('583', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809681463\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809681', '1637809681', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('584', '1', '系统管理员', '/stock.stock/add', '{\"id\":0,\"fname\":\"\\u533b\\u8d38-\\u5e38\\u6e29\\u5e93\\u516d\",\"fnumber\":\"W103018\",\"sort\":100,\"is_scattered\":-1}', 'INSERT INTO `wms_stock` SET `fname` = \'医贸-常温库六\' , `fnumber` = \'W103018\' , `sort` = 100 , `is_scattered` = -1 , `create_time` = 1637809694 , `update_time` = 1637809694', '127.0.0.1', '1637809694', '1637809694', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('585', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809695100\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809695', '1637809695', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('586', '1', '系统管理员', '/stock.stock/add', '{\"id\":0,\"fname\":\"\\u533b\\u8d38-\\u9634\\u51c9\\u5e93\\u4e09\",\"fnumber\":\"W103019\",\"sort\":100,\"is_scattered\":-1}', 'INSERT INTO `wms_stock` SET `fname` = \'医贸-阴凉库三\' , `fnumber` = \'W103019\' , `sort` = 100 , `is_scattered` = -1 , `create_time` = 1637809710 , `update_time` = 1637809710', '127.0.0.1', '1637809710', '1637809710', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('587', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809710613\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809711', '1637809711', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('588', '1', '系统管理员', '/stock.stock/add', '{\"id\":0,\"fname\":\"\\u533b\\u8d38-\\u9634\\u51c9\\u5e93\\u56db\",\"fnumber\":\"W103020\",\"sort\":100,\"is_scattered\":-1}', 'INSERT INTO `wms_stock` SET `fname` = \'医贸-阴凉库四\' , `fnumber` = \'W103020\' , `sort` = 100 , `is_scattered` = -1 , `create_time` = 1637809720 , `update_time` = 1637809720', '127.0.0.1', '1637809721', '1637809721', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('589', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809721158\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809721', '1637809721', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('590', '1', '系统管理员', '/stock.stock/getList', '{\"fname\":\"\\u5e38\\u6e29\\u5e93\\u4e09\",\"_t\":\"1637809735731\"}', 'SELECT * FROM `wms_stock` WHERE (  `fname` LIKE \'%常温库三%\' ) AND `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809736', '1637809736', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('591', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637809761576\"}', null, '127.0.0.1', '1637809761', '1637809761', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('592', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637809761914\"}', null, '127.0.0.1', '1637809762', '1637809762', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('593', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637809761914\"}', null, '127.0.0.1', '1637809762', '1637809762', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('594', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637809763649\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637809764', '1637809764', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('595', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810033777\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810034', '1637810034', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('596', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810033846\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810034', '1637810034', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('597', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810071250\"}', null, '127.0.0.1', '1637810071', '1637810071', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('598', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810072015\"}', null, '127.0.0.1', '1637810072', '1637810072', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('599', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810072015\"}', null, '127.0.0.1', '1637810072', '1637810072', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('600', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810074753\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810075', '1637810075', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('601', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810075648\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810076', '1637810076', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('602', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810362963\"}', null, '127.0.0.1', '1637810363', '1637810363', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('603', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810363453\"}', null, '127.0.0.1', '1637810363', '1637810363', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('604', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810363452\"}', null, '127.0.0.1', '1637810363', '1637810363', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('605', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810365999\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810366', '1637810366', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('606', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810366654\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810367', '1637810367', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('607', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810374194\"}', null, '127.0.0.1', '1637810374', '1637810374', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('608', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810374532\"}', null, '127.0.0.1', '1637810374', '1637810374', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('609', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810374532\"}', null, '127.0.0.1', '1637810374', '1637810374', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('610', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810376708\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810377', '1637810377', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('611', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810377622\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810378', '1637810378', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('612', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810419590\"}', null, '127.0.0.1', '1637810419', '1637810419', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('613', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810419949\"}', null, '127.0.0.1', '1637810420', '1637810420', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('614', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810419949\"}', null, '127.0.0.1', '1637810420', '1637810420', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('615', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810420995\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810421', '1637810421', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('616', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810421680\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810423', '1637810423', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('617', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810474833\"}', null, '127.0.0.1', '1637810475', '1637810475', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('618', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810475384\"}', null, '127.0.0.1', '1637810475', '1637810475', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('619', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810475384\"}', null, '127.0.0.1', '1637810475', '1637810475', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('620', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810476698\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810477', '1637810477', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('621', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810477645\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810478', '1637810478', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('622', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810504888\"}', null, '127.0.0.1', '1637810505', '1637810505', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('623', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810505282\"}', null, '127.0.0.1', '1637810505', '1637810505', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('624', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810505282\"}', null, '127.0.0.1', '1637810505', '1637810505', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('625', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810506291\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810506', '1637810506', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('626', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810506625\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810507', '1637810507', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('627', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810758767\"}', null, '127.0.0.1', '1637810759', '1637810759', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('628', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810759134\"}', null, '127.0.0.1', '1637810759', '1637810759', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('629', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810759134\"}', null, '127.0.0.1', '1637810759', '1637810759', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('630', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810760119\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810760', '1637810760', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('631', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810760640\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810761', '1637810761', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('632', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810768334\"}', null, '127.0.0.1', '1637810768', '1637810768', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('633', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810768684\"}', null, '127.0.0.1', '1637810768', '1637810768', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('634', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810768684\"}', null, '127.0.0.1', '1637810768', '1637810768', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('635', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810769676\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810770', '1637810770', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('636', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810770638\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810771', '1637810771', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('637', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810775678\"}', null, '127.0.0.1', '1637810775', '1637810775', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('638', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810776054\"}', null, '127.0.0.1', '1637810776', '1637810776', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('639', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810776054\"}', null, '127.0.0.1', '1637810776', '1637810776', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('640', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810776990\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810777', '1637810777', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('641', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810777655\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810778', '1637810778', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('642', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810871182\"}', null, '127.0.0.1', '1637810871', '1637810871', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('643', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810871540\"}', null, '127.0.0.1', '1637810871', '1637810871', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('644', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810871539\"}', null, '127.0.0.1', '1637810871', '1637810871', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('645', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810872466\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810872', '1637810872', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('646', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810872718\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810873', '1637810873', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('647', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810909689\"}', null, '127.0.0.1', '1637810909', '1637810909', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('648', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810910066\"}', null, '127.0.0.1', '1637810910', '1637810910', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('649', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810910066\"}', null, '127.0.0.1', '1637810910', '1637810910', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('650', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810911178\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810911', '1637810911', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('651', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810911634\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810912', '1637810912', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('652', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637810937945\"}', null, '127.0.0.1', '1637810938', '1637810938', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('653', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637810938257\"}', null, '127.0.0.1', '1637810938', '1637810938', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('654', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637810938257\"}', null, '127.0.0.1', '1637810938', '1637810938', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('655', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810939336\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810939', '1637810939', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('656', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810939634\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810940', '1637810940', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('657', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637810946667\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637810947', '1637810947', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('658', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637810946728\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637810947', '1637810947', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('659', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637811215513\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811215', '1637811215', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('660', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637811218594\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811218', '1637811218', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('661', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637811218645\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637811219', '1637811219', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('662', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637811234125\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811234', '1637811234', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('663', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637811236629\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811237', '1637811237', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('664', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637811236686\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637811237', '1637811237', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('665', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637811241873\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811242', '1637811242', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('666', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637811241930\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637811242', '1637811242', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('667', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637811243504\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811243', '1637811243', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('668', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637811274298\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811274', '1637811274', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('669', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637811274351\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637811274', '1637811274', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('670', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637811283691\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811284', '1637811284', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('671', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637811326793\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811327', '1637811327', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('672', '1', '系统管理员', '/system.user/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637811326853\"}', 'SELECT `role_name` FROM `wms_sys_role` WHERE (  `role_id` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\'', '127.0.0.1', '1637811327', '1637811327', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('673', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637811405656\"}', null, '127.0.0.1', '1637811405', '1637811405', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('674', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637811406028\"}', null, '127.0.0.1', '1637811406', '1637811406', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('675', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637811406028\"}', null, '127.0.0.1', '1637811406', '1637811406', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('676', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637811421510\"}', null, '127.0.0.1', '1637811421', '1637811421', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('677', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637811421843\"}', null, '127.0.0.1', '1637811422', '1637811422', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('678', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637811421843\"}', null, '127.0.0.1', '1637811422', '1637811422', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('679', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637811429445\"}', null, '127.0.0.1', '1637811429', '1637811429', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('680', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637811429793\"}', null, '127.0.0.1', '1637811430', '1637811430', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('681', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637811429794\"}', null, '127.0.0.1', '1637811430', '1637811430', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('682', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637811458281\"}', null, '127.0.0.1', '1637811458', '1637811458', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('683', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637811458775\"}', null, '127.0.0.1', '1637811458', '1637811458', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('684', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637811458776\"}', null, '127.0.0.1', '1637811459', '1637811459', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('685', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637811459786\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811460', '1637811460', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('686', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637811550916\"}', null, '127.0.0.1', '1637811551', '1637811551', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('687', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637811551308\"}', null, '127.0.0.1', '1637811551', '1637811551', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('688', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637811551309\"}', null, '127.0.0.1', '1637811551', '1637811551', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('689', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637811553198\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637811553', '1637811553', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('690', '0', '', '/passport/logout', '{\"_t\":\"1637819116664\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637819117', '1637819117', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('691', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637819123', '1637819123', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('692', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637819123823\"}', null, '127.0.0.1', '1637819124', '1637819124', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('693', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637819124178\"}', null, '127.0.0.1', '1637819124', '1637819124', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('694', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637819124178\"}', null, '127.0.0.1', '1637819124', '1637819124', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('695', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637819132565\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637819132', '1637819132', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('696', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637819372189\"}', null, '127.0.0.1', '1637819372', '1637819372', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('697', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637819372603\"}', null, '127.0.0.1', '1637819372', '1637819372', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('698', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637819372604\"}', null, '127.0.0.1', '1637819372', '1637819372', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('699', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637819373575\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637819374', '1637819374', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('700', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637819514942\"}', null, '127.0.0.1', '1637819515', '1637819515', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('701', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637819515297\"}', null, '127.0.0.1', '1637819515', '1637819515', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('702', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637819515297\"}', null, '127.0.0.1', '1637819515', '1637819515', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('703', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637819516276\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637819516', '1637819516', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('704', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637819538816\"}', null, '127.0.0.1', '1637819539', '1637819539', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('705', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637819539136\"}', null, '127.0.0.1', '1637819539', '1637819539', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('706', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637819539136\"}', null, '127.0.0.1', '1637819539', '1637819539', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('707', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637819540101\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637819540', '1637819540', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('708', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637819567653\"}', null, '127.0.0.1', '1637819567', '1637819567', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('709', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637819567984\"}', null, '127.0.0.1', '1637819568', '1637819568', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('710', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637819567984\"}', null, '127.0.0.1', '1637819568', '1637819568', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('711', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637819568960\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637819569', '1637819569', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('712', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637819591849\"}', null, '127.0.0.1', '1637819592', '1637819592', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('713', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637819592192\"}', null, '127.0.0.1', '1637819592', '1637819592', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('714', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637819592192\"}', null, '127.0.0.1', '1637819592', '1637819592', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('715', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637819593126\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637819593', '1637819593', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('716', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637820200667\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637820201', '1637820201', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('717', '1', '系统管理员', '/system.role/getListAll', '{\"_t\":\"1637820200612\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637820201', '1637820201', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('718', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637820345435\"}', null, '127.0.0.1', '1637820345', '1637820345', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('719', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637820345764\"}', null, '127.0.0.1', '1637820345', '1637820345', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('720', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637820345764\"}', null, '127.0.0.1', '1637820345', '1637820345', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('721', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637820346712\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637820347', '1637820347', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('722', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637820364727\"}', null, '127.0.0.1', '1637820364', '1637820364', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('723', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637820365069\"}', null, '127.0.0.1', '1637820365', '1637820365', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('724', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637820365069\"}', null, '127.0.0.1', '1637820365', '1637820365', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('725', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637820366011\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637820366', '1637820366', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('726', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637820373338\"}', null, '127.0.0.1', '1637820373', '1637820373', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('727', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637820373708\"}', null, '127.0.0.1', '1637820373', '1637820373', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('728', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637820373708\"}', null, '127.0.0.1', '1637820373', '1637820373', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('729', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637820374584\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637820375', '1637820375', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('730', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637821536239\"}', null, '127.0.0.1', '1637821536', '1637821536', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('731', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637821536589\"}', null, '127.0.0.1', '1637821536', '1637821536', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('732', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637821536589\"}', null, '127.0.0.1', '1637821536', '1637821536', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('733', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637821537534\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637821538', '1637821538', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('734', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637821555891\"}', null, '127.0.0.1', '1637821556', '1637821556', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('735', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637821556257\"}', null, '127.0.0.1', '1637821556', '1637821556', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('736', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637821556257\"}', null, '127.0.0.1', '1637821556', '1637821556', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('737', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637821557606\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637821557', '1637821557', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('738', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637821559782\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637821560', '1637821560', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('739', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637821563236\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637821563', '1637821563', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('740', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637821565210\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637821565', '1637821565', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('741', '1', '系统管理员', '/stock.stock/del', '[]', 'SHOW FULL COLUMNS FROM `wms_stock`', '127.0.0.1', '1637821574', '1637821574', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('742', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637821583794\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637821584', '1637821584', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('743', '1', '系统管理员', '/stock.stock/del', '[]', 'SHOW FULL COLUMNS FROM `wms_stock`', '127.0.0.1', '1637821588', '1637821588', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('744', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637821629602\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637821629', '1637821629', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('745', '1', '系统管理员', '/stock.stock/del', '[]', 'SHOW FULL COLUMNS FROM `wms_stock`', '127.0.0.1', '1637821633', '1637821633', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('746', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637821650116\"}', null, '127.0.0.1', '1637821650', '1637821650', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('747', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637821650965\"}', null, '127.0.0.1', '1637821651', '1637821651', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('748', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637821650965\"}', null, '127.0.0.1', '1637821651', '1637821651', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('749', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637821653999\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637821654', '1637821654', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('750', '1', '系统管理员', '/stock.stock/del', '[9]', 'UPDATE `wms_stock`  SET `delete_time` = 1637821702 , `update_time` = 1637821702  WHERE (  `id` = 9 ) AND `wms_stock`.`delete_time` = \'0\'', '127.0.0.1', '1637821702', '1637821702', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('751', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637821702770\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637821703', '1637821703', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('752', '1', '系统管理员', '/stock.stock/add', '{\"id\":\"2\",\"fname\":\"\\u533b\\u8d38-\\u9634\\u51c9\\u5e93\\u4e8c-\\u96f6\\u8d27\\u533a\",\"fnumber\":\"W103011\",\"sort\":1,\"is_scattered\":1}', 'UPDATE `wms_stock`  SET `sort` = 1 , `update_time` = 1637822125  WHERE (  `id` = 2 ) AND `wms_stock`.`delete_time` = \'0\'', '127.0.0.1', '1637822125', '1637822125', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('753', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637822125572\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822126', '1637822126', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('754', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637822150237\"}', null, '127.0.0.1', '1637822150', '1637822150', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('755', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637822150590\"}', null, '127.0.0.1', '1637822150', '1637822150', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('756', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637822150591\"}', null, '127.0.0.1', '1637822150', '1637822150', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('757', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637822153022\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822153', '1637822153', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('758', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637822162707\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822163', '1637822163', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('759', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822337656\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822338', '1637822338', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('760', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637822337713\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822338', '1637822338', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('761', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"1\",\"_t\":\"1637822340389\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 1  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822340', '1637822340', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('762', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822342991\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822343', '1637822343', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('763', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":0,\"type\":\"10\",\"parent_id\":0,\"name\":\"\\u7269\\u6599\\u54c1\\u7c7b\",\"code\":\"stockCate\",\"sort\":100}', 'INSERT INTO `wms_sys_dictionaries` SET `type` = \'10\' , `parent_id` = 0 , `name` = \'物料品类\' , `code` = \'stockCate\' , `sort` = 100 , `create_time` = 1637822459 , `update_time` = 1637822459', '127.0.0.1', '1637822460', '1637822460', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('764', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822460231\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822460', '1637822460', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('765', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"2\",\"_t\":\"1637822463505\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 2  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822463', '1637822463', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('766', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822468680\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822469', '1637822469', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('767', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":\"2\",\"type\":\"10\",\"parent_id\":1,\"name\":\"\\u7269\\u6599\\u54c1\\u7c7b\",\"code\":\"stockCate\",\"spell\":\"\",\"sort\":\"100\",\"remark\":null}', 'UPDATE `wms_sys_dictionaries`  SET `parent_id` = 1 , `update_time` = 1637822474  WHERE (  `id` = 2 ) AND `wms_sys_dictionaries`.`delete_time` = \'0\'', '127.0.0.1', '1637822474', '1637822474', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('768', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822475045\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822475', '1637822475', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('769', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822479006\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822479', '1637822479', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('770', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":0,\"type\":\"20\",\"parent_id\":2,\"name\":\"\\u836f\\u54c1\",\"code\":\"10\",\"sort\":100}', 'INSERT INTO `wms_sys_dictionaries` SET `type` = \'20\' , `parent_id` = 2 , `name` = \'药品\' , `code` = \'10\' , `sort` = 100 , `create_time` = 1637822529 , `update_time` = 1637822529', '127.0.0.1', '1637822529', '1637822529', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('771', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"2\",\"_t\":\"1637822529545\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 2  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822529', '1637822529', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('772', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822532817\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822533', '1637822533', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('773', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":0,\"type\":\"20\",\"parent_id\":2,\"name\":\"\\u98df\\u54c1\",\"code\":\"20\",\"sort\":100}', 'INSERT INTO `wms_sys_dictionaries` SET `type` = \'20\' , `parent_id` = 2 , `name` = \'食品\' , `code` = \'20\' , `sort` = 100 , `create_time` = 1637822548 , `update_time` = 1637822548', '127.0.0.1', '1637822548', '1637822548', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('774', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"2\",\"_t\":\"1637822548399\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 2  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822548', '1637822548', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('775', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822552534\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822552', '1637822552', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('776', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":0,\"type\":\"10\",\"parent_id\":2,\"name\":\"\\u5668\\u68b0\",\"code\":\"30\",\"sort\":100}', 'INSERT INTO `wms_sys_dictionaries` SET `type` = \'10\' , `parent_id` = 2 , `name` = \'器械\' , `code` = \'30\' , `sort` = 100 , `create_time` = 1637822590 , `update_time` = 1637822590', '127.0.0.1', '1637822590', '1637822590', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('777', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822590535\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822590', '1637822590', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('778', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822594923\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822595', '1637822595', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('779', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":\"5\",\"type\":\"20\",\"parent_id\":2,\"name\":\"\\u5668\\u68b0\",\"code\":\"30\",\"spell\":\"\",\"sort\":\"100\",\"remark\":null}', 'UPDATE `wms_sys_dictionaries`  SET `type` = \'20\' , `update_time` = 1637822602  WHERE (  `id` = 5 ) AND `wms_sys_dictionaries`.`delete_time` = \'0\'', '127.0.0.1', '1637822603', '1637822603', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('780', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"2\",\"_t\":\"1637822603407\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 2  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822603', '1637822603', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('781', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822610271\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822610', '1637822610', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('782', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"5\",\"_t\":\"1637822620343\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 5  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822620', '1637822620', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('783', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822621734\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822622', '1637822622', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('784', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":\"5\",\"type\":\"20\",\"parent_id\":2,\"name\":\"\\u7269\\u6599\",\"code\":\"40\",\"spell\":\"\",\"sort\":\"100\",\"remark\":null}', 'UPDATE `wms_sys_dictionaries`  SET `name` = \'物料\' , `code` = \'40\' , `update_time` = 1637822637  WHERE (  `id` = 5 ) AND `wms_sys_dictionaries`.`delete_time` = \'0\'', '127.0.0.1', '1637822637', '1637822637', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('785', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"5\",\"_t\":\"1637822637303\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 5  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822637', '1637822637', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('786', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"2\",\"_t\":\"1637822639826\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 2  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822640', '1637822640', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('787', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637822645303\"}', null, '127.0.0.1', '1637822645', '1637822645', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('788', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637822645700\"}', null, '127.0.0.1', '1637822645', '1637822645', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('789', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637822645700\"}', null, '127.0.0.1', '1637822645', '1637822645', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('790', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822646799\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822647', '1637822647', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('791', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"_t\":\"1637822647088\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822647', '1637822647', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('792', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"2\",\"_t\":\"1637822648646\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 2  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822649', '1637822649', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('793', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822657426\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822657', '1637822657', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('794', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822671230\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822671', '1637822671', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('795', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":0,\"type\":\"20\",\"parent_id\":2,\"name\":\"\\u5668\\u68b0\",\"code\":\"30\",\"sort\":\"30\"}', 'INSERT INTO `wms_sys_dictionaries` SET `type` = \'20\' , `parent_id` = 2 , `name` = \'器械\' , `code` = \'30\' , `sort` = 30 , `create_time` = 1637822700 , `update_time` = 1637822700', '127.0.0.1', '1637822701', '1637822701', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('796', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"2\",\"_t\":\"1637822701368\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 2  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822701', '1637822701', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('797', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822705285\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822705', '1637822705', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('798', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":\"3\",\"type\":\"20\",\"parent_id\":2,\"name\":\"\\u836f\\u54c1\",\"code\":\"10\",\"spell\":\"\",\"sort\":\"10\",\"remark\":null}', 'UPDATE `wms_sys_dictionaries`  SET `sort` = 10 , `update_time` = 1637822709  WHERE (  `id` = 3 ) AND `wms_sys_dictionaries`.`delete_time` = \'0\'', '127.0.0.1', '1637822709', '1637822709', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('799', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"2\",\"_t\":\"1637822709681\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 2  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822710', '1637822710', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('800', '1', '系统管理员', '/system.dictionaries/getListTree', '{\"_t\":\"1637822713773\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `type` = \'10\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822714', '1637822714', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('801', '1', '系统管理员', '/system.dictionaries/add', '{\"id\":\"4\",\"type\":\"20\",\"parent_id\":2,\"name\":\"\\u98df\\u54c1\",\"code\":\"20\",\"spell\":\"\",\"sort\":\"20\",\"remark\":null}', 'UPDATE `wms_sys_dictionaries`  SET `sort` = 20 , `update_time` = 1637822718  WHERE (  `id` = 4 ) AND `wms_sys_dictionaries`.`delete_time` = \'0\'', '127.0.0.1', '1637822718', '1637822718', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('802', '1', '系统管理员', '/system.dictionaries/getList', '{\"page\":\"1\",\"pageSize\":\"50\",\"parent_id\":\"2\",\"_t\":\"1637822718659\"}', 'SELECT * FROM `wms_sys_dictionaries` WHERE (  `parent_id` = 2  AND `type` = \'20\' ) AND `wms_sys_dictionaries`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822719', '1637822719', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('803', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637822984739\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822985', '1637822985', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('804', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637822991725\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637822992', '1637822992', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('805', '1', '系统管理员', '/system.role/getListAll', '{\"_t\":\"1637822991679\"}', 'SELECT * FROM `wms_sys_role` WHERE (  `status` = 1 ) AND `wms_sys_role`.`delete_time` = \'0\' ORDER BY `create_time` DESC', '127.0.0.1', '1637822992', '1637822992', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('806', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637823234698\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637823235', '1637823235', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('807', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637823273812\"}', null, '127.0.0.1', '1637823274', '1637823274', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('808', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637823274168\"}', null, '127.0.0.1', '1637823274', '1637823274', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('809', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637823274168\"}', null, '127.0.0.1', '1637823274', '1637823274', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('810', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637823275418\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637823275', '1637823275', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('811', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637823327089\"}', null, '127.0.0.1', '1637823327', '1637823327', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('812', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637823327429\"}', null, '127.0.0.1', '1637823327', '1637823327', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('813', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637823327429\"}', null, '127.0.0.1', '1637823327', '1637823327', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('814', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637823339438\"}', null, '127.0.0.1', '1637823339', '1637823339', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('815', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637823339785\"}', null, '127.0.0.1', '1637823339', '1637823339', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('816', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637823339785\"}', null, '127.0.0.1', '1637823340', '1637823340', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('817', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637823340936\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637823341', '1637823341', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('818', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637823367934\"}', null, '127.0.0.1', '1637823368', '1637823368', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('819', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637823368274\"}', null, '127.0.0.1', '1637823368', '1637823368', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('820', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637823368273\"}', null, '127.0.0.1', '1637823368', '1637823368', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('821', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637823369354\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637823369', '1637823369', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('822', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637824375427\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637824375', '1637824375', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('823', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637824375482\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637824375', '1637824375', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('824', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637824387316\"}', null, '127.0.0.1', '1637824387', '1637824387', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('825', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637824387640\"}', null, '127.0.0.1', '1637824387', '1637824387', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('826', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637824387640\"}', null, '127.0.0.1', '1637824387', '1637824387', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('827', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637824388577\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637824389', '1637824389', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('828', '1', '系统管理员', '/stock.stock/getList', '{\"_t\":\"1637824390458\"}', 'SELECT * FROM `wms_stock` WHERE `wms_stock`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637824390', '1637824390', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('829', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637824390493\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637824390', '1637824390', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('830', '1', '系统管理员', '/system.dept/getList', '{\"_t\":\"1637828205253\"}', 'SELECT * FROM `wms_sys_dept` WHERE `wms_sys_dept`.`delete_time` = \'0\' ORDER BY `sort` ASC,`create_time` ASC', '127.0.0.1', '1637828208', '1637828208', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('831', '1', '系统管理员', '/passport/logout', '{\"_t\":\"1637828724618\"}', 'SHOW FULL COLUMNS FROM `wms_sys_user`', '127.0.0.1', '1637828742', '1637828742', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('832', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637828772', '1637828772', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('833', '0', '', '/passport/login', '{\"password\":\"123456\",\"username\":\"admin\"}', 'SELECT `name` FROM `wms_sys_menu` WHERE (  `menu_type` = \'30\' ) AND `wms_sys_menu`.`delete_time` = \'0\'', '127.0.0.1', '1637828893', '1637828893', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('834', '1', '系统管理员', '/system/getUserInfo', '{\"_t\":\"1637828893430\"}', null, '127.0.0.1', '1637828893', '1637828893', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('835', '1', '系统管理员', '/system/getPermCode', '{\"_t\":\"1637828893809\"}', null, '127.0.0.1', '1637828894', '1637828894', '0', '0');
INSERT INTO `wms_sys_log` VALUES ('836', '1', '系统管理员', '/system/getMenuList', '{\"_t\":\"1637828893809\"}', null, '127.0.0.1', '1637828894', '1637828894', '0', '0');

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
INSERT INTO `wms_sys_menu` VALUES ('14', '13', '20', 'stock', 'stockManage', '/stock/stock/index', '仓库管理', 'ant-design:bank-twotone', '100', '1', '-1', '-1', '-1', null, '1632808435', '1637800540', '0');
INSERT INTO `wms_sys_menu` VALUES ('15', '4', '20', 'dictionaries', 'dictionaries', '/system/dictionaries/index', '数据字典', 'ant-design:profile-outlined', '100', '1', '-1', '-1', '-1', '/dictionaries/getList,/dictionaries/getListTree', '1632820732', '1635207098', '0');
INSERT INTO `wms_sys_menu` VALUES ('16', '13', '20', 'location', 'location', '/stock/location/index', '储位管理', 'ant-design:calculator-outlined', '100', '1', '-1', '-1', '-1', null, '1633748010', '1637800551', '0');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色表';

-- ----------------------------
-- Records of wms_sys_role
-- ----------------------------
INSERT INTO `wms_sys_role` VALUES ('1', '系统管理员', '4,32,33,34,35,5,10,11,12,7,19,20,21,2,22,24,26,8,23,25,27,9,15,29,30,31,28,36,37,38,39', '1', null, '0', '1637138596', '1637138596');
INSERT INTO `wms_sys_role` VALUES ('2', '发货员', '13,17', '1', null, '0', '1637746217', '1637746217');

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
INSERT INTO `wms_sys_user` VALUES ('2', 'zhanyou', '$2y$10$v2FXHjHZCH3wd5AuBHW01.pCezljBnMEmDFtkDVFSiZaEXCkxzu7C', 'zhuozhanyou', '', '', '', '8', '1,2', null, '-1', '1', null, '0', '1634438062', '1637746231');
