/*
创建数据库
*/
CREATE DATABASE `um` CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';


/*
 Navicat Premium Data Transfer

 Source Server         : 63
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 192.168.200.63:3306
 Source Schema         : um

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 13/11/2019 09:22:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `service_key` bigint(20) NOT NULL COMMENT '微服务表主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口名称',
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口地址url',
  `api_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口类型：R读W写',
  `auth_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限类型：N 无需控制；L 登录控制； R 权限控制',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口描述',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统api配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级机构ID，一级机构为0',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_info`;
CREATE TABLE `sys_info`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统编码，唯一',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统名称',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统描述',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统表' ROW_FORMAT = Dynamic;

INSERT INTO `um`.`sys_info`( `code`, `name`, `remark`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`) VALUES ( 'Zysl Platform', '云控台', '控台管理系统', 'admin', '2019-11-13 10:00:46', 'admin', '2019-11-13 10:00:52', 0);


-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3119 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sys_key` bigint(255) NULL DEFAULT NULL COMMENT '系统表主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL,类型：1.普通页面（如用户管理， /sys/user） 2.嵌套完整外部页面，以http(s)开头的链接 3.嵌套服务器页面，使用iframe:前缀+目标URL(如SQL监控， iframe:/druid/login.html, iframe:前缀会替换成服务器地址)',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:add,sys:user:edit)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  `sys_default` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是系统默认菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (1,(select id from sys_info), '系统管理', 0, NULL, NULL, 0, 'el-icon-setting', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (2,(select id from sys_info), '用户管理', 91, '/sys/user', NULL, 1, 'el-icon-service', 2, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (3,(select id from sys_info), '机构管理', 91, '/sys/dept', NULL, 1, 'el-icon-news', 1, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (4,(select id from sys_info), '角色管理', 91, '/sys/role', NULL, 1, 'el-icon-view', 3, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (5,(select id from sys_info), '菜单管理', 1, '/sys/menu', NULL, 1, 'el-icon-menu', 4, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (6,(select id from sys_info), '数据监控', 43, 'http://139.196.87.48:8001/druid/login.html', NULL, 1, 'el-icon-warning', 0, NULL, NULL, 'admin', '2018-12-27 11:03:45', 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (7,(select id from sys_info), '字典管理', 92, '/sys/dict', NULL, 1, 'el-icon-edit-outline', 1, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (8,(select id from sys_info), '系统日志', 92, '/sys/log', 'sys:log:view', 1, 'el-icon-info', 2, NULL, NULL, 'admin', '2018-09-23 19:32:28', 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (9,(select id from sys_info), '查看', 2, NULL, 'sys:user:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (10,(select id from sys_info), '新增', 2, NULL, 'sys:user:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (11,(select id from sys_info), '修改', 2, NULL, 'sys:user:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (12,(select id from sys_info), '删除', 2, NULL, 'sys:user:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (13,(select id from sys_info), '查看', 3, NULL, 'sys:dept:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (14,(select id from sys_info), '新增', 3, NULL, 'sys:dept:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (15,(select id from sys_info), '修改', 3, NULL, 'sys:dept:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (16,(select id from sys_info), '删除', 3, NULL, 'sys:dept:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (17,(select id from sys_info), '查看', 4, NULL, 'sys:role:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (18,(select id from sys_info), '新增', 4, NULL, 'sys:role:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (19,(select id from sys_info), '修改', 4, NULL, 'sys:role:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (20,(select id from sys_info), '删除', 4, NULL, 'sys:role:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (21,(select id from sys_info), '查看', 5, NULL, 'sys:menu:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (22,(select id from sys_info), '新增', 5, NULL, 'sys:menu:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (23,(select id from sys_info), '修改', 5, NULL, 'sys:menu:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (24,(select id from sys_info), '删除', 5, NULL, 'sys:menu:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (29,(select id from sys_info), '国际化', 28, '/demo/i18n', NULL, 1, 'el-icon-edit', 1, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (30,(select id from sys_info), '换皮肤', 28, '/demo/theme', NULL, 1, 'el-icon-picture', 2, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (31,(select id from sys_info), '查看',(select id from sys_info), NULL, 'sys:dict:view', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (32,(select id from sys_info), '新增',(select id from sys_info), NULL, 'sys:dict:add', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (33,(select id from sys_info), '修改',(select id from sys_info), NULL, 'sys:dict:edit', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (34,(select id from sys_info), '删除',(select id from sys_info), NULL, 'sys:dict:delete', 2, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (38,(select id from sys_info), '服务监控', 43, 'http://139.196.87.48:8000/', '', 1, 'el-icon-view', 1, 'admin', '2018-11-02 20:02:15', 'admin', '2018-12-27 11:03:53', 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (41,(select id from sys_info), '注册中心', 44, 'http://139.196.87.48:8500', '', 1, ' el-icon-view', 0, 'admin', '2018-11-03 11:06:48', 'admin', '2018-12-27 11:08:11', 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (47,(select id from sys_info), '测试数据详情', 45, '', '', 1, '', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (49,(select id from sys_info), '测试接口列表', 48, '', '', 1, '', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (51,(select id from sys_info), '测试接口文档列表', 50, '', '', 1, '', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (52,(select id from sys_info), '测试文档修改', 50, '', '', 1, '', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (65,(select id from sys_info), '项目管理', 1, '/sys/sysInfo', '', 1, 'el-icon-menu', 1, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (66,(select id from sys_info), '查看', 65, '', 'sys:sysInfo:view', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (67,(select id from sys_info), '新增', 65, '', 'sys:sysInfo:add', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (68,(select id from sys_info), '修改', 65, '', 'sys:sysInfo:edit', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (69,(select id from sys_info), '删除', 65, '', 'sys:sysInfo:delete', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (77,(select id from sys_info), '写接口', 76, NULL, 'write', 3, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (78,(select id from sys_info), '微服务管理', 1, '/sys/sysService', '', 1, 'el-icon-menu', 2, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (79,(select id from sys_info), '写接口', 78, NULL, 'write', 3, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (80,(select id from sys_info), '系统Api管理', 1, '/sys/sysApi', '', 1, 'el-icon-menu', 3, NULL, NULL, NULL, NULL, 0, '1');
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (81,(select id from sys_info), '写接口', 80, NULL, 'write', 3, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (82,(select id from sys_info), '查看', 78, '', 'sys:sysService:view', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (84,(select id from sys_info), '新增', 78, '', 'sys:sysService:add', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (85,(select id from sys_info), '修改', 78, '', 'sys:sysService:edit', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (86,(select id from sys_info), '删除', 78, '', 'sys:sysService:delete', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (87,(select id from sys_info), '查看', 80, '', 'sys:sysApi:view', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (88,(select id from sys_info), '新增', 80, '', 'sys:sysApi:add', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (89,(select id from sys_info), '修改', 80, '', 'sys:sysApi:edit', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (90,(select id from sys_info), '删除', 80, '', 'sys:sysApi:delete', 2, '', 0, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (91,(select id from sys_info), '用户角色管理', 0, NULL, NULL, NULL, 'el-icon-star-on', 1, 'admin', '2019-11-08 11:05:30', 'admin', '2019-11-08 11:05:35', 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (92,(select id from sys_info), '信息管理', 0, NULL, NULL, NULL, 'el-icon-picture-outline', 2, 'admin', '2019-11-08 11:06:30', 'admin', '2019-11-08 11:06:34', 0, NULL);
INSERT INTO `sys_menu`(`id`, `sys_key`, `name`, `parent_id`, `url`, `perms`, `type`, `icon`, `order_num`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`, `sys_default`) VALUES (94,(select id from sys_info), '解锁', 2, '', 'sys:user:unlock', 2, '', 0, 'admin', '2019-11-11 16:50:59', NULL, NULL, 0, NULL);



-- ----------------------------
-- Table structure for sys_menu_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_api`;
CREATE TABLE `sys_menu_api`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `menu_key` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  `api_key` bigint(20) NULL DEFAULT NULL COMMENT 'api表ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 476 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '机构ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  `role_type` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限类型：R只读W读写',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 451 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_service
-- ----------------------------
DROP TABLE IF EXISTS `sys_service`;
CREATE TABLE `sys_service`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sys_key` bigint(255) NULL DEFAULT NULL COMMENT '系统表主键',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微服务编号',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微服务名称',
  `gate_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关编号，比如/gate/01,则编号为01',
  `developer` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发负责人',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微服务描述',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(登录账号)',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常：2：锁定 3：注销',
  `login_error_times` int(11) NULL DEFAULT 0 COMMENT '连续登录错误次数',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '机构ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理' ROW_FORMAT = Dynamic;

INSERT INTO `um`.`sys_user`(`id`, `name`, `password`, `user_name`, `salt`, `email`, `mobile`, `status`, `login_error_times`, `last_login_time`, `dept_id`, `create_by`, `create_time`, `last_update_by`, `last_update_time`, `del_flag`) VALUES (1, 'admin', 'bd1718f058d8a02468134432b8656a86', NULL, 'YzcmCZNvbXocrsz9dm8e', 'admin@qq.com', '13612345678', 1, 0, NULL, 4, 'admin', '2018-08-14 11:11:11', 'admin', '2019-11-12 16:17:00', 0);


-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `service_key` bigint(20) NULL DEFAULT NULL COMMENT '微服务表主键',
  `user_login_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户登录账号',
  `op_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '成功T失败F',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录日志表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
