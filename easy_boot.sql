/*
 Navicat Premium Dump SQL

 Source Server         : 192.168.1.111-3124
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 192.168.1.111:3124
 Source Schema         : easy_boot

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 29/10/2025 11:22:45
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for open_api_auth
-- ----------------------------
DROP TABLE IF EXISTS `open_api_auth`;
CREATE TABLE `open_api_auth`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint unsigned NOT NULL COMMENT '用户ID',
    `appid`       char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL DEFAULT '' COMMENT 'appid',
    `api_id`      bigint                                                        NOT NULL COMMENT 'api列表ID',
    `api_url`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'api地址',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Api授权关联';

-- ----------------------------
-- Records of open_api_auth
-- ----------------------------
BEGIN;
INSERT INTO `open_api_auth` (`id`, `user_id`, `appid`, `api_id`, `api_url`, `create_time`, `update_time`)
VALUES (65, 1, 'umTaOMA2Nnp9WII4ebYsTts3', 1, '/api/get', '2025-10-24 13:41:58.000', '2025-10-24 13:41:58.000');
INSERT INTO `open_api_auth` (`id`, `user_id`, `appid`, `api_id`, `api_url`, `create_time`, `update_time`)
VALUES (66, 2, 'KsROTqnDFKyJj39fVuPEjMVs', 9, '/api/get_v', '2025-10-24 15:38:23.000', '2025-10-24 15:38:23.000');
COMMIT;

-- ----------------------------
-- Table structure for open_api_list
-- ----------------------------
DROP TABLE IF EXISTS `open_api_list`;
CREATE TABLE `open_api_list`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `api_name`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `api_url`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    `limit_num`   int                                                           DEFAULT NULL COMMENT '限制',
    `enable`      tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='api列表';

-- ----------------------------
-- Records of open_api_list
-- ----------------------------
BEGIN;
INSERT INTO `open_api_list` (`id`, `api_name`, `api_url`, `limit_num`, `enable`, `update_time`, `create_time`)
VALUES (1, '测试', '/api/get', 0, 1, '2025-10-23 14:35:05.967', '2025-07-21 10:25:28.000');
INSERT INTO `open_api_list` (`id`, `api_name`, `api_url`, `limit_num`, `enable`, `update_time`, `create_time`)
VALUES (9, '测试版号', '/api/get_v', 0, 1, '2025-10-23 15:32:05.000', '2025-10-23 15:32:05.000');
COMMIT;

-- ----------------------------
-- Table structure for open_api_request_logs
-- ----------------------------
DROP TABLE IF EXISTS `open_api_request_logs`;
CREATE TABLE `open_api_request_logs`
(
    `id`            bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `appid`         char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL DEFAULT '' COMMENT 'appid',
    `request_id`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '请求ID',
    `api_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'api地址',
    `header_param`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '请求头参数',
    `request_ip`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '请求ip',
    `request_time`  datetime                                                               DEFAULT NULL COMMENT '请求时间',
    `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数',
    `response_time` datetime                                                               DEFAULT NULL COMMENT '响应时间',
    `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '响应数据',
    `error_msg`     longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '异常',
    `create_time`   datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY             `index_appid` (`api_url`) USING BTREE,
    KEY             `index_request_id` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='开放api请求日志';

-- ----------------------------
-- Records of open_api_request_logs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for open_api_user_auth_info
-- ----------------------------
DROP TABLE IF EXISTS `open_api_user_auth_info`;
CREATE TABLE `open_api_user_auth_info`
(
    `id`              bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`         bigint unsigned NOT NULL COMMENT '用户ID',
    `appid`           char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL DEFAULT '' COMMENT 'appid',
    `sm2_public_key`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'sm2公钥',
    `sm2_private_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'sm2私钥',
    `aes_key`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'aeskey',
    `aes_iv`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'aesIv',
    `status`          char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL DEFAULT '0' COMMENT '授权状态',
    `create_time`     datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `index_appid` (`appid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户api授权信息';

-- ----------------------------
-- Records of open_api_user_auth_info
-- ----------------------------
BEGIN;
INSERT INTO `open_api_user_auth_info` (`id`, `user_id`, `appid`, `sm2_public_key`, `sm2_private_key`, `aes_key`,
                                       `aes_iv`, `status`, `create_time`, `update_time`)
VALUES (1, 1, 'umTaOMA2Nnp9WII4ebYsTts3',
        '***REMOVE_SECRET***',
        '***REMOVE_SECRET***', 'broQWbSlOhJwrKVj', 'hm2j0dFYL6PBZA9K', '1',
        '2025-04-28 10:54:50.000', '2025-10-21 14:08:53.718');
INSERT INTO `open_api_user_auth_info` (`id`, `user_id`, `appid`, `sm2_public_key`, `sm2_private_key`, `aes_key`,
                                       `aes_iv`, `status`, `create_time`, `update_time`)
VALUES (5, 2, 'KsROTqnDFKyJj39fVuPEjMVs',
        '***REMOVE_SECRET***',
        '***REMOVE_SECRET***', 'ydAxqC/fOi1nt1Ed', 'iyaM5wvByvXxpfZh', '1',
        '2025-10-24 15:38:13.000', '2025-10-24 15:38:13.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `config_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数键值',
    `is_system`    tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否是系统内置',
    `enable`       tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_time`  datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time`  datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `index_key` (`config_key`) USING BTREE COMMENT 'key唯一'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统参数配置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `config_name`, `config_key`, `config_value`, `is_system`, `enable`, `create_time`,
                          `update_time`)
VALUES (5, '初始密码', 'init_password', '123456', 1, 1, '2025-08-19 15:51:48.000', '2025-08-19 15:53:20.000');
INSERT INTO `sys_config` (`id`, `config_name`, `config_key`, `config_value`, `is_system`, `enable`, `create_time`,
                          `update_time`)
VALUES (18, '开启登录验证码', 'captcha_enable', '1', 1, 1, '2025-10-28 14:06:18.000', '2025-10-28 14:06:18.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `dict_type_id` bigint unsigned NOT NULL COMMENT '字典类型ID easy_dict_type=>id',
    `dict_label`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典键值',
    `dict_sort`    int unsigned NOT NULL DEFAULT '0' COMMENT '字典排序',
    `css_class`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '表格回显样式',
    `enable`       tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_time`  datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time`  datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (1, 1, '是', '1', 1, 'primary', NULL, 1, '2025-08-22 15:12:05.000', '2025-08-22 15:20:12.441');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (2, 1, '否', '0', 3, 'danger', NULL, 1, '2025-08-22 15:12:18.000', '2025-08-22 15:20:12.444');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (3, 1, '是', 'true', 2, 'success', NULL, 1, '2025-08-22 15:13:56.000', '2025-08-22 15:20:12.446');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (4, 1, '否', 'false', 4, 'danger', NULL, 1, '2025-08-22 15:14:12.000', '2025-08-22 15:20:12.448');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (5, 2, '男', '1', 1, 'default', NULL, 1, '2025-08-22 15:24:20.000', '2025-08-22 15:24:20.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (6, 2, '女', '0', 2, 'default', NULL, 1, '2025-08-22 15:24:28.000', '2025-08-22 15:24:28.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (7, 2, '男', 'MAN', 3, 'default', NULL, 1, '2025-08-22 15:24:40.000', '2025-08-22 15:24:40.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (8, 2, '女', 'WOMAN', 4, 'default', NULL, 1, '2025-08-22 15:25:02.000', '2025-08-22 15:25:02.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (9, 2, '男', 'MALE', 5, 'default', NULL, 1, '2025-08-22 15:25:19.000', '2025-08-22 15:25:19.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (10, 2, '女', 'FEMALE', 6, 'default', NULL, 1, '2025-08-22 15:25:41.000', '2025-08-22 15:25:49.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (11, 3, '目录', 'DIR', 1, 'primary', NULL, 1, '2025-09-25 16:59:02.000', '2025-09-25 16:59:02.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (12, 3, '页面', 'PAGE', 2, 'success', NULL, 1, '2025-09-25 16:59:17.000', '2025-09-25 16:59:17.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (13, 3, '按钮', 'BUTTON', 3, 'info', NULL, 1, '2025-09-25 16:59:29.000', '2025-09-25 16:59:29.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (14, 4, '未激活', 'INACTIVATED', 1, 'warning', NULL, 1, '2025-09-25 17:02:02.000', '2025-09-25 17:02:02.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (15, 4, '正常', 'NORMAL', 2, 'success', NULL, 1, '2025-09-25 17:02:12.000', '2025-09-25 17:02:12.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (16, 4, '停用', 'STOP', 3, 'danger', NULL, 1, '2025-09-25 17:02:23.000', '2025-09-25 17:02:23.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (17, 5, '管理端', 'ADMIN', 1, 'success', NULL, 1, '2025-09-25 17:03:58.000', '2025-09-25 17:03:58.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (18, 5, 'WEB', 'WEB', 2, 'primary', NULL, 1, '2025-09-25 17:04:11.000', '2025-09-25 17:04:11.000');
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_time`, `update_time`)
VALUES (19, 5, '移动端', 'MOBILE', 3, 'info', NULL, 1, '2025-09-25 17:04:31.000', '2025-09-25 17:04:31.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `dict_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典类型',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '字典描述',
    `is_system`   tinyint                                                      NOT NULL COMMENT '是否是系统内置',
    `enable`      tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_time`,
                             `update_time`)
VALUES (1, '是或否', 'yes_or_no', '是否字典', 1, 1, '2025-08-22 11:31:14.000', '2025-08-22 16:15:16.000');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_time`,
                             `update_time`)
VALUES (2, '性别', 'sex', '男女性别', 1, 1, '2025-08-22 15:11:29.000', '2025-08-22 15:11:29.000');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_time`,
                             `update_time`)
VALUES (3, '菜单类型', 'menu_type', '系统菜单类型', 1, 1, '2025-09-25 16:58:16.000', '2025-09-25 16:58:16.000');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_time`,
                             `update_time`)
VALUES (4, '账号状态', 'account_status', '用户账号状态', 1, 1, '2025-09-25 17:01:38.000', '2025-09-25 17:01:38.000');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_time`,
                             `update_time`)
VALUES (5, '客户端', 'account_client', '账号所属客户端', 1, 1, '2025-09-25 17:03:39.000', '2025-09-25 17:03:39.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_login_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_logs`;
CREATE TABLE `sys_login_logs`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`     bigint                                                       NOT NULL COMMENT '用户ID',
    `username`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户账号',
    `login_type`  char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci             DEFAULT NULL COMMENT '登录方式',
    `ip`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT '' COMMENT '登录IP地址',
    `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '登录地点',
    `browser`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '浏览器类型',
    `login_time`  datetime(3) NOT NULL COMMENT '访问时间',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_logs
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (1, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-07-31 17:08:12.000', '2025-07-31 17:08:12.000',
        '2025-07-31 17:08:12.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (2, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-07-31 17:08:50.000', '2025-07-31 17:08:50.000',
        '2025-07-31 17:08:50.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (3, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-07-31 17:14:51.000', '2025-07-31 17:14:51.000',
        '2025-07-31 17:14:51.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (4, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-01 10:24:13.000', '2025-08-01 10:24:13.000',
        '2025-08-01 10:24:13.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (5, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-01 10:24:16.000', '2025-08-01 10:24:17.000',
        '2025-08-01 10:24:17.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (6, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-01 10:25:06.000', '2025-08-01 10:25:06.000',
        '2025-08-01 10:25:06.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (7, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-01 10:28:02.000', '2025-08-01 10:28:02.000',
        '2025-08-01 10:28:02.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (8, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-08 10:23:58.000', '2025-08-08 10:23:58.000',
        '2025-08-08 10:23:58.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (9, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-08 10:28:18.000', '2025-08-08 10:28:18.000',
        '2025-08-08 10:28:18.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (10, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-08 10:44:26.000', '2025-08-08 10:44:26.000',
        '2025-08-08 10:44:26.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (11, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-08 10:45:10.000', '2025-08-08 10:45:10.000',
        '2025-08-08 10:45:10.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (12, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-08 10:46:07.000', '2025-08-08 10:46:07.000',
        '2025-08-08 10:46:07.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (13, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-11 10:10:41.000', '2025-08-11 10:10:41.000',
        '2025-08-11 10:10:41.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (14, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-11 10:27:25.000', '2025-08-11 10:27:25.000',
        '2025-08-11 10:27:25.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (15, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-11 11:24:53.000', '2025-08-11 11:24:53.000',
        '2025-08-11 11:24:53.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (16, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-15 10:39:34.000', '2025-08-15 10:39:34.000',
        '2025-08-15 10:39:34.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (17, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-18 10:12:23.000', '2025-08-18 10:12:23.000',
        '2025-08-18 10:12:23.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (18, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-19 10:00:12.000', '2025-08-19 10:00:12.000',
        '2025-08-19 10:00:12.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (19, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-20 10:59:39.000', '2025-08-20 10:59:39.000',
        '2025-08-20 10:59:39.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (20, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-20 10:59:44.000', '2025-08-20 10:59:44.000',
        '2025-08-20 10:59:44.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (21, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-20 11:09:09.000', '2025-08-20 11:09:09.000',
        '2025-08-20 11:09:09.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (22, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-20 13:48:51.000', '2025-08-20 13:48:51.000',
        '2025-08-20 13:48:51.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (23, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-20 13:54:44.000', '2025-08-20 13:54:44.000',
        '2025-08-20 13:54:44.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (24, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-20 13:57:33.000', '2025-08-20 13:57:33.000',
        '2025-08-20 13:57:33.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (25, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-21 10:43:39.000', '2025-08-21 10:43:39.000',
        '2025-08-21 10:43:39.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (26, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-21 10:45:07.000', '2025-08-21 10:45:07.000',
        '2025-08-21 10:45:07.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (27, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-21 11:04:33.000', '2025-08-21 11:04:33.000',
        '2025-08-21 11:04:33.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (28, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-21 11:48:09.000', '2025-08-21 11:48:09.000',
        '2025-08-21 11:48:09.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (29, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-21 15:18:10.000', '2025-08-21 15:18:10.000',
        '2025-08-21 15:18:10.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (30, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-21 16:43:20.000', '2025-08-21 16:43:20.000',
        '2025-08-21 16:43:20.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (31, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-21 16:44:03.000', '2025-08-21 16:44:03.000',
        '2025-08-21 16:44:03.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (32, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-22 10:50:02.000', '2025-08-22 10:50:02.000',
        '2025-08-22 10:50:02.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (33, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-22 16:52:49.000', '2025-08-22 16:52:49.000',
        '2025-08-22 16:52:49.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (34, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-25 14:08:38.000', '2025-08-25 14:08:38.000',
        '2025-08-25 14:08:38.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (35, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-25 14:10:18.000', '2025-08-25 14:10:18.000',
        '2025-08-25 14:10:18.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (36, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-08-26 10:38:46.000', '2025-08-26 10:38:46.000',
        '2025-08-26 10:38:46.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (37, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-16 10:20:11.000', '2025-09-16 10:20:11.000',
        '2025-09-16 10:20:11.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (38, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-16 11:05:26.000', '2025-09-16 11:05:26.000',
        '2025-09-16 11:05:26.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (39, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-17 10:26:34.000', '2025-09-17 10:26:34.000',
        '2025-09-17 10:26:34.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (40, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-18 13:53:48.000', '2025-09-18 13:53:48.000',
        '2025-09-18 13:53:48.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (41, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-18 15:11:13.000', '2025-09-18 15:11:13.000',
        '2025-09-18 15:11:13.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (42, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-18 15:16:57.000', '2025-09-18 15:16:57.000',
        '2025-09-18 15:16:57.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (43, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-18 15:17:17.000', '2025-09-18 15:17:17.000',
        '2025-09-18 15:17:17.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (44, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-18 15:42:02.000', '2025-09-18 15:42:02.000',
        '2025-09-18 15:42:02.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (45, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-18 15:43:04.000', '2025-09-18 15:43:04.000',
        '2025-09-18 15:43:04.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (46, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-18 15:45:34.000', '2025-09-18 15:45:34.000',
        '2025-09-18 15:45:34.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (47, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-18 15:45:54.000', '2025-09-18 15:45:54.000',
        '2025-09-18 15:45:54.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (48, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-22 10:33:43.000', '2025-09-22 10:33:43.000',
        '2025-09-22 10:33:43.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (49, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-23 10:43:38.000', '2025-09-23 10:43:38.000',
        '2025-09-23 10:43:38.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (50, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-23 11:02:15.000', '2025-09-23 11:02:15.000',
        '2025-09-23 11:02:15.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (51, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-23 14:46:47.000', '2025-09-23 14:46:47.000',
        '2025-09-23 14:46:47.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (52, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-23 14:47:39.000', '2025-09-23 14:47:39.000',
        '2025-09-23 14:47:39.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (53, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-23 14:49:26.000', '2025-09-23 14:49:26.000',
        '2025-09-23 14:49:26.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (54, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-25 14:52:14.000', '2025-09-25 14:52:14.000',
        '2025-09-25 14:52:14.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (55, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-25 15:28:09.000', '2025-09-25 15:28:09.000',
        '2025-09-25 15:28:09.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (56, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-25 15:28:59.000', '2025-09-25 15:28:59.000',
        '2025-09-25 15:28:59.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (57, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-25 15:39:31.000', '2025-09-25 15:39:31.000',
        '2025-09-25 15:39:31.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (58, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-30 10:04:17.000', '2025-09-30 10:04:17.000',
        '2025-09-30 10:04:17.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (59, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-30 11:13:33.000', '2025-09-30 11:13:33.000',
        '2025-09-30 11:13:33.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (60, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-30 11:19:13.000', '2025-09-30 11:19:13.000',
        '2025-09-30 11:19:13.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (61, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-30 11:22:27.000', '2025-09-30 11:22:27.000',
        '2025-09-30 11:22:27.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (62, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-30 11:23:16.000', '2025-09-30 11:23:16.000',
        '2025-09-30 11:23:16.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (63, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-30 11:34:56.000', '2025-09-30 11:34:56.000',
        '2025-09-30 11:34:56.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (64, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-09-30 11:42:42.000', '2025-09-30 11:42:42.000',
        '2025-09-30 11:42:42.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (65, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-17 15:20:33.000', '2025-10-17 15:20:33.000',
        '2025-10-17 15:20:33.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (66, 1, 'admin', 'PWD', '192.168.0.32', ',,内网IP', 'Mac', '2025-10-17 15:23:52.000', '2025-10-17 15:23:52.000',
        '2025-10-17 15:23:52.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (67, 1, 'admin', 'PWD', '192.168.0.32', ',,内网IP', 'Mac', '2025-10-17 15:26:41.000', '2025-10-17 15:26:41.000',
        '2025-10-17 15:26:41.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (68, 1, 'admin', 'PWD', '192.168.0.32', ',,内网IP', 'Mac', '2025-10-17 15:27:47.000', '2025-10-17 15:27:47.000',
        '2025-10-17 15:27:47.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (69, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-23 14:56:48.000', '2025-10-23 14:56:48.000',
        '2025-10-23 14:56:48.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (70, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-23 15:01:00.000', '2025-10-23 15:01:00.000',
        '2025-10-23 15:01:00.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (71, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-24 11:04:38.000', '2025-10-24 11:04:38.000',
        '2025-10-24 11:04:38.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (72, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-28 11:02:11.000', '2025-10-28 11:02:11.000',
        '2025-10-28 11:02:11.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (73, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-28 14:05:11.000', '2025-10-28 14:05:11.000',
        '2025-10-28 14:05:11.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (74, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-28 14:33:16.000', '2025-10-28 14:33:16.000',
        '2025-10-28 14:33:16.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (75, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-28 14:33:43.000', '2025-10-28 14:33:43.000',
        '2025-10-28 14:33:43.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (76, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-29 10:11:37.000', '2025-10-29 10:11:37.000',
        '2025-10-29 10:11:37.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (77, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-29 10:17:48.000', '2025-10-29 10:17:48.000',
        '2025-10-29 10:17:48.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (78, 1, 'admin', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-29 11:15:44.000', '2025-10-29 11:15:44.000',
        '2025-10-29 11:15:44.000');
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `login_type`, `ip`, `ip_location`, `browser`, `login_time`,
                              `create_time`, `update_time`)
VALUES (79, 2, 'test', 'PWD', '192.168.0.51', ',,内网IP', 'Mac', '2025-10-29 11:16:19.000', '2025-10-29 11:16:19.000',
        '2025-10-29 11:16:19.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `id`            bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `menu_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
    `menu_type`     char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    NOT NULL COMMENT '菜单类型',
    `parent_id`     bigint unsigned NOT NULL DEFAULT '0' COMMENT '父菜单ID',
    `order_num`     int                                                           DEFAULT '0' COMMENT '显示顺序',
    `path`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
    `component`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '组件路径',
    `redirect`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '重定向',
    `is_iframe`     tinyint                                                       DEFAULT '0' COMMENT '是否为外链',
    `is_link`       tinyint                                                       DEFAULT '0' COMMENT '是否为外链',
    `is_affix`      tinyint                                                       DEFAULT '0' COMMENT '是否固定',
    `is_keep_alive` tinyint                                                       DEFAULT '0' COMMENT '是否缓存',
    `is_hide`       tinyint                                                       DEFAULT '0' COMMENT '菜单是否显示',
    `link`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
    `perms`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '权限标识',
    `icon`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT '#' COMMENT '菜单图标',
    `enable`        tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_time`   datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限信息';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (1, '首页', 'PAGE', 0, 1, 'home', 'home/home', '', 0, 0, 1, 1, 0, NULL, 'home', 'ele-House', 1, NULL,
        '2025-09-30 11:19:36.616');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (2, '系统管理', 'DIR', 0, 13, 'system', NULL, '/system/menu', 0, 0, 0, 0, 0, '0', 'system.menu', 'ele-Setting',
        1, NULL, '2025-08-21 13:52:53.247');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (3, '菜单配置', 'PAGE', 2, 1, 'system/menu', 'system/menu/menu', NULL, 0, 0, 0, 1, 0, '0', 'system.menu.tree',
        'ele-Memo', 1, NULL, '2025-10-24 11:06:19.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (4, '参数配置', 'PAGE', 2, 9, 'system/config', 'system/config/config', NULL, 0, 0, 0, 1, 0, '0',
        'system.config.page', 'ele-Operation', 1, NULL, '2025-10-28 11:13:37.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (5, '字典管理', 'PAGE', 2, 6, 'system/dict', 'system/dict/dictType', NULL, 0, 0, 0, 1, 0, '0',
        'system.dict.page', 'ele-Reading', 1, NULL, '2025-08-22 16:29:19.564');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (6, '字典数据', 'PAGE', 2, 7, 'system/dict_data', 'system/dict/dictData', NULL, 0, 0, 0, 1, 1, '0',
        'system.dict.page', 'ele-Tickets', 1, NULL, '2025-10-28 11:13:28.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (14, '角色管理', 'PAGE', 2, 4, 'system/role', 'system/role/role', '', 0, 0, 0, 1, 0, NULL, NULL,
        'ele-Coordinate', 1, '2025-08-26 11:39:41.000', '2025-09-18 16:17:39.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (15, '新增', 'BUTTON', 3, 1, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.menu.add', '', 1, '2025-09-16 14:06:28.000',
        '2025-09-16 14:06:28.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (16, '编辑', 'BUTTON', 3, 2, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.menu.edit', '', 1, '2025-09-16 14:53:10.000',
        '2025-09-16 14:53:10.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (17, '删除', 'BUTTON', 3, 3, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.menu.del', '', 1, '2025-09-16 14:53:27.000',
        '2025-09-16 14:53:27.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (18, '用户管理', 'PAGE', 2, 3, 'system/user', 'system/user/user', '', 0, 0, 0, 0, 0, NULL, NULL, 'ele-User', 1,
        '2025-09-16 15:59:22.000', '2025-09-17 16:32:04.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (19, '机构管理', 'PAGE', 2, 2, 'system/org', 'system/org/org', '', 0, 0, 0, 0, 0, NULL, NULL,
        'ele-OfficeBuilding', 1, '2025-09-17 16:31:22.000', '2025-09-17 16:31:50.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (22, 'API管理', 'PAGE', 2, 8, 'system/api', 'system/api', '', 0, 0, 0, 0, 0, NULL, NULL, 'ele-Monitor', 1,
        '2025-10-23 15:02:22.000', '2025-10-28 11:13:09.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (23, 'API授权', 'BUTTON', 18, 4, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.user.api', '', 1,
        '2025-10-24 14:19:49.000', '2025-10-24 15:23:06.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (24, '重置密码', 'BUTTON', 18, 5, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.user.initPwd', '', 1,
        '2025-10-24 14:20:21.000', '2025-10-24 15:23:11.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (25, '新增', 'BUTTON', 18, 1, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.user.add', '', 1, '2025-10-24 15:23:25.000',
        '2025-10-24 15:23:25.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (26, '删除', 'BUTTON', 18, 3, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.user.del', '', 1, '2025-10-24 15:23:38.000',
        '2025-10-24 15:23:38.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (27, '编辑', 'BUTTON', 18, 2, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.user.edit', '', 1, '2025-10-24 15:23:50.000',
        '2025-10-24 15:23:50.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (28, '新增', 'BUTTON', 19, 1, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.org.add', '', 1, '2025-10-28 11:08:24.000',
        '2025-10-28 11:08:24.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (29, '编辑', 'BUTTON', 19, 2, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.org.edit', '', 1, '2025-10-28 11:08:38.000',
        '2025-10-28 11:08:38.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (30, '删除', 'BUTTON', 19, 3, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.org.del', '', 1, '2025-10-28 11:08:49.000',
        '2025-10-28 11:08:49.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (31, '新增', 'BUTTON', 14, 1, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.role.add', '', 1, '2025-10-28 11:09:20.000',
        '2025-10-28 11:09:20.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (32, '编辑', 'BUTTON', 14, 2, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.role.edit', '', 1, '2025-10-28 11:09:29.000',
        '2025-10-28 11:09:29.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (33, '删除', 'BUTTON', 14, 3, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.role.del', '', 1, '2025-10-28 11:09:39.000',
        '2025-10-28 11:09:39.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (34, '新增', 'BUTTON', 22, 1, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.api.add', '', 1, '2025-10-28 11:10:02.000',
        '2025-10-28 11:10:02.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (35, '编辑', 'BUTTON', 22, 2, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.api.edit', '', 1, '2025-10-28 11:10:10.000',
        '2025-10-28 11:10:10.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (36, '删除', 'BUTTON', 22, 3, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.api.del', '', 1, '2025-10-28 11:10:19.000',
        '2025-10-28 11:10:19.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (37, '新增', 'BUTTON', 6, 1, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.dict.data.add', '', 1,
        '2025-10-28 11:10:32.000', '2025-10-28 11:11:30.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (38, '编辑', 'BUTTON', 6, 2, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.dict.data.edit', '', 1,
        '2025-10-28 11:10:42.000', '2025-10-28 11:11:38.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (39, '删除', 'BUTTON', 6, 3, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.dict.data.del', '', 1,
        '2025-10-28 11:10:51.000', '2025-10-28 11:11:44.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (40, '新增', 'BUTTON', 5, 1, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.dict.add', '', 1, '2025-10-28 11:11:56.000',
        '2025-10-28 11:11:56.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (41, '编辑', 'BUTTON', 5, 2, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.dict.edit', '', 1, '2025-10-28 11:12:22.000',
        '2025-10-28 11:12:22.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (42, '删除', 'BUTTON', 5, 3, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.dict.del', '', 1, '2025-10-28 11:13:52.000',
        '2025-10-28 11:13:52.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (43, '新增', 'BUTTON', 4, 1, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.config.add', '', 1, '2025-10-28 11:14:10.000',
        '2025-10-28 11:14:10.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (44, '编辑', 'BUTTON', 4, 2, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.config.edit', '', 1,
        '2025-10-28 11:14:27.000', '2025-10-28 11:14:27.000');
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_time`, `update_time`)
VALUES (45, '删除', 'BUTTON', 4, 3, '', '', '', 0, 0, 0, 0, 0, NULL, 'sys.config.del', '', 1, '2025-10-28 11:14:36.000',
        '2025-10-28 11:14:36.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `parent_id`      bigint unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
    `org_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织名称',
    `org_short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '组织简称',
    `org_code`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构编码',
    `org_sort`       int                                                           DEFAULT NULL COMMENT '顺序',
    `org_status`     char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '组织状态',
    `create_time`    datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time`    datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='机构基本信息';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
BEGIN;
INSERT INTO `sys_org` (`id`, `parent_id`, `org_name`, `org_short_name`, `org_code`, `org_sort`, `org_status`,
                       `create_time`, `update_time`)
VALUES (1, 0, '测试', '测试', '00001', 2, '0', NULL, '2025-09-18 14:36:16.000');
INSERT INTO `sys_org` (`id`, `parent_id`, `org_name`, `org_short_name`, `org_code`, `org_sort`, `org_status`,
                       `create_time`, `update_time`)
VALUES (3, 1, '测试子机构', '测试子机构', '0000101', 1, '0', '2025-09-18 14:32:35.000', '2025-09-18 14:35:13.000');
INSERT INTO `sys_org` (`id`, `parent_id`, `org_name`, `org_short_name`, `org_code`, `org_sort`, `org_status`,
                       `create_time`, `update_time`)
VALUES (4, 0, 'EasyBoot', 'ez', '01', 1, '0', '2025-09-18 14:35:41.000', '2025-09-18 14:35:41.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_org_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_org_info`;
CREATE TABLE `sys_org_info`
(
    `id`                bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `org_id`            bigint unsigned NOT NULL DEFAULT '0' COMMENT '机构ID',
    `org_level`         char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '组织级别',
    `org_type`          char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '组织类型',
    `org_nature`        char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '组织性质',
    `org_tag`           char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '组织标签',
    `org_province`      varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '省',
    `org_province_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '省',
    `org_city`          varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '市',
    `org_city_code`     varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '市',
    `org_district`      varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '区',
    `org_district_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '区',
    `org_area_code`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区划代码集',
    `org_address`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
    `org_desc`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构简介',
    `org_logo`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'logo',
    `create_time`       datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time`       datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='机构详细信息';

-- ----------------------------
-- Records of sys_org_info
-- ----------------------------
BEGIN;
INSERT INTO `sys_org_info` (`id`, `org_id`, `org_level`, `org_type`, `org_nature`, `org_tag`, `org_province`,
                            `org_province_code`, `org_city`, `org_city_code`, `org_district`, `org_district_code`,
                            `org_area_code`, `org_address`, `org_desc`, `org_logo`, `create_time`, `update_time`)
VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        '2025-09-18 14:32:35.000', '2025-09-18 14:36:16.000');
INSERT INTO `sys_org_info` (`id`, `org_id`, `org_level`, `org_type`, `org_nature`, `org_tag`, `org_province`,
                            `org_province_code`, `org_city`, `org_city_code`, `org_district`, `org_district_code`,
                            `org_area_code`, `org_address`, `org_desc`, `org_logo`, `create_time`, `update_time`)
VALUES (2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
        '2025-09-18 14:35:41.000', '2025-09-18 14:35:41.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`              bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `role_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '角色名字',
    `role_key`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色key',
    `authority_level` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限级别',
    `role_sort`       int unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
    `enable`          tinyint                                                       NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_time`     datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time`     datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `role_name`, `role_key`, `authority_level`, `role_sort`, `enable`, `create_time`,
                        `update_time`)
VALUES (1, '超级管理员', 'admin', 'LOWER', 1, 1, NULL, '2025-10-24 15:36:06.000');
INSERT INTO `sys_role` (`id`, `role_name`, `role_key`, `authority_level`, `role_sort`, `enable`, `create_time`,
                        `update_time`)
VALUES (2, '测试', 'test', 'ONESELF', 0, 1, '2025-10-29 10:13:01.000', '2025-10-29 10:15:34.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `role_id`     bigint unsigned NOT NULL COMMENT '角色ID',
    `menu_id`     bigint unsigned NOT NULL COMMENT '菜单ID',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色->菜单权限关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (65, 1, 2, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (66, 1, 18, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (67, 1, 1, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (68, 1, 3, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (69, 1, 15, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (70, 1, 16, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (71, 1, 17, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (72, 1, 19, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (73, 1, 25, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (74, 1, 27, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (75, 1, 26, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (76, 1, 23, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (77, 1, 14, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (78, 1, 6, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (79, 1, 22, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (80, 1, 5, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (81, 1, 4, '2025-10-24 15:36:06.000', '2025-10-24 15:36:06.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (86, 2, 2, '2025-10-29 10:15:34.000', '2025-10-29 10:15:34.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (87, 2, 3, '2025-10-29 10:15:34.000', '2025-10-29 10:15:34.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (88, 2, 1, '2025-10-29 10:15:34.000', '2025-10-29 10:15:34.000');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_time`, `update_time`)
VALUES (89, 2, 16, '2025-10-29 10:15:34.000', '2025-10-29 10:15:34.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `username`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '账号',
    `password`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `email`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
    `phone`        char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    DEFAULT NULL COMMENT '密文手机号',
    `client`       char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '所属客户端',
    `status`       char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '账号状态',
    `create_time`  datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time`  datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `phone_prefix` int                                                          DEFAULT NULL COMMENT '手机号前',
    `phone_suffix` int                                                          DEFAULT NULL COMMENT '手机号后',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `index_username_del` (`username`) USING BTREE COMMENT '用户名+逻辑删除唯一',
    KEY            `index_phone_del` (`phone`) USING BTREE COMMENT '手机号+逻辑删除索引'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='账号信息';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `phone`, `client`, `status`, `create_time`,
                        `update_time`, `phone_prefix`, `phone_suffix`)
VALUES (1, 'admin', '$2a$10$Z3u35JLLfT1H6fbxr6oypuelRWgA/dQ5IMDMjSzyQshDrEGGTwK/S', '',
        '***REMOVE_SECRET***', 'ADMIN', 'NORMAL', '2025-07-31 16:59:39.000', '2025-10-29 11:15:12.000',
        181, 1234);
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `phone`, `client`, `status`, `create_time`,
                        `update_time`, `phone_prefix`, `phone_suffix`)
VALUES (2, 'test', '$2a$10$5KdJQZy6lvs/LoEhNzcY9ey7RfRhVeRV9PEIVCE/TmIa4rnAKo.2i', NULL,
        '***REMOVE_SECRET***', 'WEB', 'NORMAL', '2025-09-17 16:24:02.000', '2025-10-29 11:15:57.000', 181,
        7194);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint unsigned NOT NULL COMMENT '用户信息ID',
    `nickname`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号昵称',
    `avatar`      longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '头像',
    `sex`         char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '性别',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户基本信息';

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_info` (`id`, `user_id`, `nickname`, `avatar`, `sex`, `create_time`, `update_time`)
VALUES (1, 1, '超级管理员',
        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/***REMOVE_SECRET***/***REMOVE_SECRET***/wAARCAFKAUkDASIAAhEBAxEB/***REMOVE_SECRET***/***REMOVE_SECRET***+Tl5ufo6erx8vP09fb3+Pn6/***REMOVE_SECRET***/***REMOVE_SECRET***+Pn6/***REMOVE_SECRET***+z/wDXWgC+BgdDSLwfumqq30DEbboEHpU/***REMOVE_SECRET***/a7/bA8c/tF+***REMOVE_SECRET***/***REMOVE_SECRET***+Pfxq0HH9lfFvxZbY6eTrU6/1rstN/bW/am0qJYLT44eKWRDkC4vTcf+jM/yrwqMYBp/Q8UAfRY/b+/bFH/NcddA/wCvO3/+NV594h/aO+Oniu/mvvEPxb8WXMk33mfVpxn6815tub+8fzppIJ55oA9Itf2hfjnY4+w/GfxfHjp/xOJ/8a6HSf2nP2ovD0KahY/GPx1BA5/1zalOYs/TdivFwB7V0+o+MPE+v+***REMOVE_SECRET***/izwp8TvHGpvp1v5l/cwvJcQ20Gf485UDI6ketfUn7Nf/***REMOVE_SECRET***++HQ/hj8a+b/AIQ/tOaX8EPgj4r8A+***REMOVE_SECRET***+zJ/wT58H6f8ACm6+O/***REMOVE_SECRET***/AA0+LXw8+LOjQ678P/FthrNvIu4i2udxj5wQwHQ+xrugTmv50PBfx08VfDz4sXHxd+FNlb+HbaO6+2rpFpcFLfyc/wCp2DsBx+owcY/Vj9lD/goTd/tO+***REMOVE_SECRET***+jXWt61epBY2kLTzzSthVjA5JNfhv+3X+2rq/7S3ihvDHhO5u9P8C6RKRaWgYKL+YEZmn9e4jB6AnPJIHsn/BTv9svUvFGt6p+zx4Bvzb6NprGLxBcQvj7XMG5h+ikc+49ufzb5x3/***REMOVE_SECRET***/ACpR1zX27+zD/wAEzviR8btK0/***REMOVE_SECRET***+yR4Z02yjm+***REMOVE_SECRET***/H7ZywCT7m+v6AtM/YS/ZM8MavbeI9K+***REMOVE_SECRET***+HPHfg/TtZsLgYw6NGf+/qEN+RFAH81BU/d6mlEE6jg8Gv2i1//AII9/sxav5TaLr/jzRXTORDfW0qE/wDbSDkV4n8af+CWWqfCu4i+I/***REMOVE_SECRET***/Zh/Zu8H+A/Dtr+01+1a9raeBlt0v8Aw7o8l2DPrE5wY/3YyPLI3Hnk8HG3JrK+***REMOVE_SECRET***+NvxH8X/EPx3e6x4q0ttJ8km107REVkh0a3H+rhhj/***REMOVE_SECRET***/Zs+EnwE0rUNH+OvxwA8cvCoi8N+F7E3wtWIP+unkAjHOOBg45BOQD4V8Nfi14z+E3iqz8Y+BtdutP1OzbO9TjPpj8q5rUL+***REMOVE_SECRET***+iXhf8A4LL/***REMOVE_SECRET***+lfbX7Jn7efw5/apk/4R+0srrQvF0MPnz6dP88LDjPkzDk9e6g/qa/A7AzmvYf2Y/i83wM+N3hj4kMrPBpl3suUEmC0DjBB4OeM/jQB/***REMOVE_SECRET***+mK+ga/J//gtF45E+r+***REMOVE_SECRET***+tI5LOSSeuadQAV6D8BfBUfxK+MHg/4f3cpjtte1mzsLg9xA8qiQj0+UmvPhya+kP2DfFWgeD/2s/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+KX/BIL45aNq1w3wz1nSPEmlH54GuZ/stzySdrK2VyM9jX7Gkv3pScDNAH84/xk/Zo+MvwBv0074neB73SI7lisN5/rbabBx8si/LXkot5wemK/***REMOVE_SECRET***/wBla+/Zh+Kj6dp6yXHhTXzJd+***REMOVE_SECRET***/sRIbzTRMcsIXJDj8CBn3PvX6XV+Nf/AARu07zfj34s1byv+Pfw6U3/AN3zLiH/***REMOVE_SECRET***+CwevW97+0hpOj2yHOm+HIBI+eCzzTsB/wB8sp+hB71+1VfhB/wVOkun/bE8SfaAREunaekHoV+zoMr6jIIz6hh2oA+***REMOVE_SECRET***/***REMOVE_SECRET***+8eOwoA+qvFni/***REMOVE_SECRET***/4KnfsmaFbwyW2v69rLXGc/***REMOVE_SECRET***+jxuMMp9iK/Ij/goZ4Y/Zy+B4t/gL8JvhNp8fiG7SHUtR8QOZGns0X/llEzHGG6tzgfXoAfZHgn/AIKl/si+Jb9bC81/VvDxT/***REMOVE_SECRET***/***REMOVE_SECRET***/6uaSJlRz6Akcmun8A/E74i/DC6/tHwD451vQJWILG1naNTj6cfpQB/St5iKfmdR9TVgY2huMV+IXwE/wCCn/xx+FV5JZeObw+PtGnURmHUZdlxAOeY5dp9ehGMCv2K+FvjEfELwBoPjlYDCNesLfUI4/Oyu6VVO3POcZxQB2eBSErjtSc9+teG/Ef9rX4E/***REMOVE_SECRET***+Wv/BZ7xBps7/DTwtEQNRthqF5Iv9wSCAA/iVP5H0r3LUv+CsX7Keha2+ix3HiO8tlOPt1rYBrY+65YMfwFfnz/AMFBfj58KP2gvid4f+IXw01LVp0GkGxvbe/tRCYpI5XKsME/eV1/KgD5KOc89aOT0pSckn1pKAP1G/4IseHZWuvib4mlXpDp9ln/AHjO/wDOv1ZHAAr4k/4JV/Cq4+Hv7NyeJNRjdLvxzdDVsNnKxDKxcH2+***REMOVE_SECRET***/***REMOVE_SECRET***/buvx4/4LMaMzfF/***REMOVE_SECRET***/OV5MsaQZJzUrW+DmkwFoA/RD/glj+zLB4/8dXHxv8AEc0M2i+Fbv7NYW6AMJb/***REMOVE_SECRET***/wAEdre3j/Zq1ovKu/8A4Su5D8dG+zW5x+or7tuAcfuaAKGqa1pei2M+***REMOVE_SECRET***+***REMOVE_SECRET***/ir89v2pvhL/AMFLPGtxP8OL+8/4SzwfqFxJLA+hR2tpE8XzbVm2hCPvdDXKeCP+CUHx/***REMOVE_SECRET***+***REMOVE_SECRET***+tn/ANHWG60bbYBf9iUJ8v514F+0Lp//AAS60D4d634i0C00O+***REMOVE_SECRET***+MX/BPH9p/wCEYnuZ/h5/wkemxscXfh/***REMOVE_SECRET***/***REMOVE_SECRET***+G/B+g3mr6lfHbFbWsLSOfwUE1+/8A+xx8O/Gnwy/***REMOVE_SECRET***/***REMOVE_SECRET***+KvLC6doXnB5WkI++y9VXDZycZ21+Enj34geJ/iV4v1bxx4rv5LnU9auftNyzOTz/dHoAOB6AAV6v+***REMOVE_SECRET***+lJ+***REMOVE_SECRET***+bz5Mnb/wIqM8LQB+KbDnHWkPPWv2n8EfG3/gnx+1d4cudQ8e+G/CWhXtuv7+28RGC1nZckDynBXI47c18NftZ+G/2J49DHiD9mLxaRqdlqbWt3pDtNIJY+PniaUZZQehBI5oA+Pq0tK8P6nrN/***REMOVE_SECRET***/RT/***REMOVE_SECRET***+VNfHH70MRgtH8uCOhI7igD9U/hp4T/AOED+***REMOVE_SECRET***/at/aT/Z7+IX7W97qXxT0bV/***REMOVE_SECRET***/UT9o2/1LS/***REMOVE_SECRET***/OBDDLcysiuWRjmQk5JPr0oA++fHH7BPw9+N3gWf4z/sX+***REMOVE_SECRET***+***REMOVE_SECRET***+KXjqb4k/EHxB45ntYbV9d1CW/eCGMRojOckBRwBmgD9tv8Agmr8L5/hx+***REMOVE_SECRET***+***REMOVE_SECRET***+tXb5zz60AyFxnIrL1iy1C+0m6sdN1BrK6lg8uO6EW8xtk/Nt6HrWvTduMnFBilY/P74s/H3/***REMOVE_SECRET***/3mtYgrI35D0Hp598K/2lf+CnHxyv8A/***REMOVE_SECRET***+7UqiPsSv1w1BV2eS/s5fAzU/***REMOVE_SECRET***/3oHFn8/P7ZunW/h39sD4lw6ha+ZaHxPLfSR/xyJOFmx+FfZXxl/wCCfGh/tNxeDvip+zBr3hbRPCl1o8UD2zRlC7qCN/yZLynO192CCnPOa8H/AOCqfwzv/***REMOVE_SECRET***+UYCtjuGFfRn/***REMOVE_SECRET***+X/iL/wAEtf2rPB0dxdaVouj+I7e3faTp16DK30jbDE+wr5G1PSdU0HUrnSNZ0+7sb61cxz291CYpYnHVWRuQfrX6Q+NP24f+CgvwP8Qed8Y/BGnQ26x+XEseiMbJ5T91jKsg/PcBXxz+07+***REMOVE_SECRET***/sY/DGP4S/s3+BvCj2scMx05L6+CDiS4m/eM2fq36V/O4CD0Nf06eAIv+KA8ORfwDSrT/0UKAOqByM+***REMOVE_SECRET***/tD4D/EKw7zeG9QH/kA1+YX/***REMOVE_SECRET***/TMEEH1PtX60+ONGXXvCer6HIo2ajZz2rZ9JFZf61+ff/BP7xZpQ/Yu+JfgD+***REMOVE_SECRET***/wD+Cn/w6/Z58CeOdAn+***REMOVE_SECRET***+jE9R0r9Yf29P2evh/8P/2KpNO+Hngy3tm8JX+***REMOVE_SECRET***/***REMOVE_SECRET***/AIJW+LbHxH+yro2gW8hN34Z1K+0y4DNk5MxuE4/65zKv1BHavsqgBlH0oooIPE/jX+1j8D/gCY7b4l+***REMOVE_SECRET***+z9+0J4M/***REMOVE_SECRET***+KHxh8Y/G79q+zluZLnXLgadozXBcTQ5Plu5B/1SjaEQHGFFfYfxO03xR4R+CXiKD4F6JYWuvWWmS/2LZx26LGLlF+TCgY54AHegViv8Wv2mPgZ8FXtbb4p/EGw0S5uwSkBfzJB9VTJH4iotR/ab+A+hfDy1+***REMOVE_SECRET***+F7eEvj78b/HGs6g/g3xX4k8SNcN/***REMOVE_SECRET***+***REMOVE_SECRET***+tP8AgpD+***REMOVE_SECRET***/4JhfGO9+Evxzi8GeKtOvrTQ/***REMOVE_SECRET***/8RvEx0KTWvF9/***REMOVE_SECRET***+***REMOVE_SECRET***/8A4J8/sk+IPESeJpvhPpsMvmq1xbrI8cT8/wBwHH5V5D8GP+Cmvwh1b4Er4s+LGqLZ+LtAjjtbvSoFJuNRkAJWSBRwVbB3Z+6QetYH7RX/AAVQ+HSfCaC7+***REMOVE_SECRET***/4KGeHPhL4Z/aDvfD/AMGtN0210ewsYba4h08lgl6Cd+ecA4xnnqDX7m/D7cPAHhwHORpVr1/64r/WvwR/ZD+Ed3+0l+***REMOVE_SECRET***/***REMOVE_SECRET***+0H4e034A/8ABQFdJ1C5udL+H3xcts61FbN5Vu4uPNhkVl+78rbXPPAck8V+t56dcV8Ef8FZPg7e+***REMOVE_SECRET***+J3/BISaOzv8AxJ8GPihFdGMNLp+nakACwXJSMTDILdg3Ir7N/Zw+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+DHwF+GXwH0W98K/DTw7/***REMOVE_SECRET***/bN+***REMOVE_SECRET***+***REMOVE_SECRET***/wBo+O/HGgaHCp+Q6heKjZ/65jLHt2r8Cvjj+0z8Tfjd8Rbvx3rXie/tJ3lIs7a1uGjjsos42Jg8/TvXluravqWq3P2rUtTvbxick3E5f+ZoJP1r/a0/4Kb+C/hzp9t4c/Zs1XRte1m9bN7rEcYaC1THKpkDc/PVjx79R8SfDn9rjUtY/aG0b4l/tIDTvGWg3Nu+kaxFPp0cgNg27DRxcBSGJftyx9a+Xydxz60lAHr/AO0s3wjPxf8AEs/wS1CC68H304vdNWOKSMW8ckQaSFQ/ICOxUD/Z4rxwHJ9qex/lTMGgB+OKjkySR7V+gfi+w/***REMOVE_SECRET***+VPuXPmMsi7nHGFGOwr8/uMZ6470DP1m/4Iy/***REMOVE_SECRET***/wT18AN8PP2Tvh5YXJmiudT0+TWJ/MXaxF5K9xF+UbKK+***REMOVE_SECRET***+***REMOVE_SECRET***/gK6KlYDGSKAPxO/aX/4Jh/Ff4OWtz40+***REMOVE_SECRET***/wTR/ag0v4O/ELU/***REMOVE_SECRET***+zVwqyQOk1sGVkPmRMN6Gv5n/Hk9qPFOuhbYKBqt08QHACecfloA/o/8BfEfwN8UdCbxH8P/***REMOVE_SECRET***+Caf7SMvwJ+M6eF/E/***REMOVE_SECRET***+6oAs1+CP7ZvwC+J2g/tI+O2sfB3iHWLS+***REMOVE_SECRET***/gnpuvXHi3TfhJ4W/tW5k8w3jaZEz7/AKEf/***REMOVE_SECRET***/***REMOVE_SECRET***/sAftQ+OPAtl8SPCXw+***REMOVE_SECRET***+LdNt9OJ+yxQalL5Keq+UTs2+2K7fWf2xPjD4u8ZweN/G1p4T8SahHDFaH+09BhdJEU8b1XaCevPvQB8+GNh1/***REMOVE_SECRET***/lrXU/CvwDefEv4g+G/h9YSKt14i1O30+HK5+aRgufwyK4/0r7F/4Jb+***REMOVE_SECRET***+uO+KAP3A0Pw9Y+***REMOVE_SECRET***/***REMOVE_SECRET***+JvD+***REMOVE_SECRET***+azTdGuPHfxDh0K3l+fxFqyWkJPO1ppwoP5n9a93/bn+OF/wDGX9o7xTf2urXE2i6TcnSdOh+***REMOVE_SECRET***+lnxd/wCCSUGh/***REMOVE_SECRET***/wBVJ/dBJz0znGfDPhN/wUR/aS/***REMOVE_SECRET***/***REMOVE_SECRET***/BUT9kjxv4+1nSfjH8KPB7as9vbvb67a6fD++O0gpJtBy5IOPlXI285oA9T+Af/BUP4D/***REMOVE_SECRET***/FT4ZfEm3lu/AXjzSNbSB/Km+w30chQ+***REMOVE_SECRET***+GPxJ8R/***REMOVE_SECRET***/2OPhD+***REMOVE_SECRET***/***REMOVE_SECRET***/gm5+yPommJp958Mm1icE5vL6/lNyvA53IVHr2r5y/bG/***REMOVE_SECRET***/XFfcfiP8AaE+FfhX4seHfg3quuxW+v+JYZbiyfz4zDtQMdrtu+VjtOB3pPj/8d/BnwA+***REMOVE_SECRET***+0d+0Lrf7RvxVvfiL4gSS1i8iOysrNnQ/***REMOVE_SECRET***/Hnj+S0lS30/RItKjk2ZAkuJlYpn+8PIGR7ivgLwN4E8UfEXxJY+***REMOVE_SECRET***+8v7EH7Od/wDs5/A/***REMOVE_SECRET***+O9p+z78AfEHiCG6C+ItbjOj6KEOHN1MDmVQf+eabnB55ABr6X3r3kH5V+LP8AwVh+Nn/***REMOVE_SECRET***+***REMOVE_SECRET***/315/WvvD9jz/gph4r+F1za+***REMOVE_SECRET***/PsqD2qQdgT0oA/Y/wDbX/Z28D/ta/ByD4/fA9tO1XW9Mtft8U9jCB/***REMOVE_SECRET***/***REMOVE_SECRET***/q2wOvT1rzD43eKPAPjf4o694q+HWn32i+HNZu2vYNOuWUvaGRtzxqV/***REMOVE_SECRET***/ap/***REMOVE_SECRET***+***REMOVE_SECRET***/Stfw/p39r6xp+n/wDP1d28FZOK2PC+***REMOVE_SECRET***+Anwl+***REMOVE_SECRET***+FLfxN8OfE1nqVs6fNGsq+***REMOVE_SECRET***/aO/4KlfCP4UXVz4W+***REMOVE_SECRET***/tQftyftOT+***REMOVE_SECRET***/wU5+O/wAPvEGlxfEbxM/***REMOVE_SECRET***/PVfzrw74k/tk/AP4W+BLHx9rXj/***REMOVE_SECRET***/Pn9p7/go58e/Fvhq1ufhj8P9d+HPg/***REMOVE_SECRET***/eIrmPDvxi+F/jDVH0Twp8Q/Dusakqlzb2t9HI+3OAcKxOM8ZxXxJ4F/wCCdHh/***REMOVE_SECRET***+***REMOVE_SECRET***+hFBEtT+lpTHwCeacK5fwVfazqfhLQrvxFa/***REMOVE_SECRET***+1p+z58HEeLx58UtItblc/6NBKLic+3lx5b9K8o8Q/8FOf2RvDujvqlh8QZdem6/ZbC2cyn8HC0AfXRmiHG4ZrB8U+M/C/gvTzq3irxBY6TaAkGa8nWKMf8CYgV+RHxr/4K9/FvxdNcab8IdDsPCGnvjbfTItxesMe+UXn2P1r4s8efGP4k/FC/wDt/wAQfiBreuyA5Aurl2QfQE4oA/W/9oH/***REMOVE_SECRET***/gP/gtF4gtoZLb4lfC2ynkPAuNMuNo/wC+G/xr8xjLnOD1qInJyaAP0++JH/BZm+1Dw7PY/DH4dSWOozZC3eo3KOIPcIo5r82/FXivV/F/***REMOVE_SECRET***+tFA4oA7v4N+***REMOVE_SECRET***+2Z/wTrk/Z/wDCknxQ+GXihvEXg8NGrWsy+***REMOVE_SECRET***/AO9/Z4vNctL/wAM3MUNpFLcqGuLa1jx/***REMOVE_SECRET***/2fIqiQnigBFgn6iGSm989zX2N+1J8IvhT4G/Zj+A2v6D4atdJ8a+***REMOVE_SECRET***+OT1wOKAP0A/***REMOVE_SECRET***/aLcBmXpnpzX7NdOK/IX/gitpAm+KHxC8QBMvYaJbWob0E8pbH/kv+tfr2etBLHUUUE4ODQUJkClMi9CKj+0QA4r8vv23P8Agobrk+uR/Bb9mHWPt945EF/***REMOVE_SECRET***/Ef8AaN+MNt+***REMOVE_SECRET***/BO/wAB/s9/Ao/Ejwf4g1m91fR7mBdT+3gFbxXIXd8uNgBbr0r6j/ZX+Eeg/***REMOVE_SECRET***/***REMOVE_SECRET***+RTwSCKAO5+HnxAvvh34v0zxlY+***REMOVE_SECRET***+1X8Y/j9Dp2j/EDWoW0/***REMOVE_SECRET***/***REMOVE_SECRET***+oXw4/YO/Zd+GTxXnh34R6S95AG/0rVEN9Lk98TFx+***REMOVE_SECRET***+YQc8bSfyr6//ZM/4Jo+EvgbqNp49+Jl+***REMOVE_SECRET***/n0h/4KMftiRHEXxlv/8AwEt//iK4Lx/+058efiVKG8afFXxDfj73lC7MUXP+***REMOVE_SECRET***/wCx/wCDPCt78ZP2h/***REMOVE_SECRET***/aO+K9z4yt7W5s9BsoVstE0yaRc2lv/GAFGAHPP/6q8E6n60rbW5OKZxu/woA/***REMOVE_SECRET***/Wbqa/***REMOVE_SECRET***+/f2Tv+Cpvir4dwJ4Q+OxuvFGhQ5W21JEzf2vUjcc/vB29enWgTR+xV/q+***REMOVE_SECRET***/wCCpPwA+***REMOVE_SECRET***+AMeeQK+ePiR8Wvi5/wUj8Wf8K5+D2nXPhr4VaIfN1/Ub2QxLtJ+/NjqFHKQDluSfb5x+J37PHgbxz+0Ro3wE/***REMOVE_SECRET***/tf/tseLm8I+GrfV/7Nm/dLoHh5WjtI15/1rjkjn+MkcccV9rfsZ/sL+H/ANm21u/jV8eLrSo/***REMOVE_SECRET***+z94H0/wP4M0eCJ7eEC+1bylW51GXABmkYfxHGcdBnjivi3/***REMOVE_SECRET***/FAHyj+3Z+2brv7SnjefQvD+***REMOVE_SECRET***/***REMOVE_SECRET***/Yb3d3YpPefbpZ9008WMk+injFAHx3b6fe3TR/Z7d5TMcRqilmc9woHU19CaP+wL+1prvh+***REMOVE_SECRET***/YV/4J/6d8K0t/jB8brKCfxYymbTdMmX9zpi9RK4P/***REMOVE_SECRET***/***REMOVE_SECRET***+LtT+***REMOVE_SECRET***+6PpS5PrRRQAUUUUAFFFFABRRRQB/K/***REMOVE_SECRET***+M/xJ0b4beD7dJL/WZkhSR+I4V/jkf0VRkk+1cKAMdK/WL/gkb8A59K8O638evEekxL/***REMOVE_SECRET***+0D8J/FXhDUfhh+wv+z5dy6Bpviawkv/EWqwJ/pF8FyGkuHX7xAjZiAf4gOmBX2H+zh+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/2nv2mfGf7U/***REMOVE_SECRET***/***REMOVE_SECRET***/sR/sG+***REMOVE_SECRET***+7kgA5+lAHwF+zx/wTg+PvxsFvr+***REMOVE_SECRET***/gnf4Cm8f8AivVobnWVR1/***REMOVE_SECRET***/***REMOVE_SECRET***+Hb3vhHwczGOZIpyL+/T/pq46Ajsp7HntXzL8HPGVh4G+***REMOVE_SECRET***+tefkAN8uODxW14c8P6t4r1zT/AA1odpLd3+***REMOVE_SECRET***/***REMOVE_SECRET***+G0fwi+FPhn4cRXP2j+***REMOVE_SECRET***+PHxu8L/***REMOVE_SECRET***+***REMOVE_SECRET***+CQPwRgt9K8RfH3VrPE13Kvh7RmZV+SMEedKM9GLbRnvg1+mi9aAJQTjr160ADIoHSigDzu3+DXwus/GsnxGg+Guif8JVO+w6t/Z0f2j7/wDe9e+euK7wHP171YwWxgdDXwh+3P8A8FCPCPwf0vWPhn8KtTN/47lHkXNzAP3Olk54dzx5v+yORnnryAe7a/8Atp/sxeE/Her/***REMOVE_SECRET***+WH7cXx1k/a++MlpF8J/DuqavpWg2LWOmJZWEk1xd/MZZJ9iAsVzgY7BcmvNfhL+x7+0t+***REMOVE_SECRET***/U79i79jDRf2RdE1rxH4s8R2eq+***REMOVE_SECRET***/SP/AIJBfCf4c+KfFfij4j6/9nvvEXhN7e30q0f5hZLIJA84X+Itwuf4cf7XHxv+***REMOVE_SECRET***/uo3AHHzIoYn+8Qa9z/4JNa/4i0n9qW10nR7iQaVqelXkOrRg/I8QG+OQ+***REMOVE_SECRET***/***REMOVE_SECRET***/gw/EL42+BPB6KCura7awSZ5ATzF3E+2M0Afvf+zL8K/wDhUHwM8GfDyWBI7zT9Lj+3uo+9eOPMdvwcn869YA70rKEAhiGAvH+NPAwOetAAOlGRgkdutBrj/***REMOVE_SECRET***+MfgX4MeBtT8dePdZ/s7TbBeSh3Syv2SNOrsfQV+K/wO+GWt/***REMOVE_SECRET***+198TfDGn+OZW0vwJb6xBCthYYaRIJZQsrkD/WSBMsAfoMZr9nvhX8Gvhv8E/DX/CM/DbwtZ6PaJ80xiGZpm/vSMecnB4JoA8n/ba+KY/Zy/***REMOVE_SECRET***+278SvjR+zx4K/Zt+***REMOVE_SECRET***/wTr+F+r/***REMOVE_SECRET***+gB+Un7Qf7NPxV/Zm1PSdM+I9jaW8+s2hurb7NcrOgVWKlcjuOPz9q/Sj/gk1+zpN4G+HF38cfEdmn9p+LgsWmq6cx6ZkMGGefnYZB/uhfXj5Lstd8X/wDBS/***REMOVE_SECRET***/E6jpX7U+C/Cmj+CfDOm+***REMOVE_SECRET***/K/***REMOVE_SECRET***+gn/AASM+Bn/AAmHxev/***REMOVE_SECRET***/voV8X/***REMOVE_SECRET***/oE/Z0+A2g/s7/***REMOVE_SECRET***/ansI9StzcRRee8SyAyLH/fKjkL71+VH/BU/wDay0LxVc2/7PXw81RLm00+***REMOVE_SECRET***+PXxE8X/EDW/***REMOVE_SECRET***+gv2L/APgn746/***REMOVE_SECRET***/AMtenpk0AYH/AATz+AGpfFL9ovRrzXtBvn8O+Fn/ALVv5fILQmdMm3iY9Msy8iv2s8b+***REMOVE_SECRET***+***REMOVE_SECRET***/4vftBf8ABQfx0PD3wm8G+JZ/***REMOVE_SECRET***+5Pgn/wAFDPhh8QfAPjv4jeO7iHwpp/hK++yW0E83my3tox/cN5X32uS24FQCM8g4NfnH+2f+254k/af13+ydNtxo3grTXzp+nDiV3XI86X/aIP3egrwTxr4R8U/DzxLceFvFfh+***REMOVE_SECRET***+KOi/***REMOVE_SECRET***/RvpOr6dq9nb3+n3KT291Es8EqnKyxsMqynuCK/luKg9RX76/***REMOVE_SECRET***/***REMOVE_SECRET***/BLz9myT4n/***REMOVE_SECRET***+2v2A/2MrH9nPwVH4v8Y6bHN461u22Xjlc/2ZGWJ8iMgn7w27yD14HA5+xsgcgdc0xYAsIQcAdqlUDAoAZk+***REMOVE_SECRET***/AKqAPzy8Y/8ABJ/wLd/***REMOVE_SECRET***/FP49/***REMOVE_SECRET***+y54Kh1/***REMOVE_SECRET***+O3xB1Px/44vGuLq+***REMOVE_SECRET***/YG/aOsfDfxL+I/wAbrOK00+E2ltHZamP30fURtCPnHJ64Brg/H3/BSb9mz4KfCeHwt+yfoKy6kUaOzt/***REMOVE_SECRET***/dFVnfJ6D8KAOl8d+N/***REMOVE_SECRET***/wCCP/xam0D4vav8KL65b7J4p055bRGbC/aofnGPfZvP4V+e1e4/saeMB4F/ac+GviGWSdYRr9rZyiI4JS4cQt+GJDQB/***REMOVE_SECRET***/DT4YeM/i54tsfBXgbRJtR1e/keOOKIDooySecAD1JFfv/wDsqfAvT/***REMOVE_SECRET***/4JFf8AJ1v/AHLl/wD+jbav25t+3+***REMOVE_SECRET***/PNNyf41OelUtd/5Al5/wBetAH853x2+O3jr49/***REMOVE_SECRET***+/wCPqb/***REMOVE_SECRET***/IgGsk9KYSc/59aAP6dvAPjG28c+CdA8Z6fl4Nf0+11CHB6xSoHDc44wRXV15D+yd/ybn8Kv+xJ0f/***REMOVE_SECRET***/9m9TCcgAAAAAMOHSqoJWFWeyt/iowmwwGI=',
        '1', '2025-07-31 16:59:39.000', '2025-09-18 14:52:58.000');
INSERT INTO `sys_user_info` (`id`, `user_id`, `nickname`, `avatar`, `sex`, `create_time`, `update_time`)
VALUES (2, 2, '测试', NULL, '0', '2025-09-17 16:24:02.000', '2025-10-29 10:17:07.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint unsigned NOT NULL COMMENT '用户id',
    `org_id`      bigint unsigned NOT NULL COMMENT '机构id',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户->机构关联';

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_time`, `update_time`)
VALUES (9, 1, 4, '2025-09-18 14:52:58.000', '2025-09-18 14:52:58.000');
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_time`, `update_time`)
VALUES (12, 2, 1, '2025-10-29 10:17:07.000', '2025-10-29 10:17:07.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint unsigned NOT NULL COMMENT '用户ID',
    `role_id`     bigint unsigned NOT NULL COMMENT '角色ID',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户->角色关联';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_time`, `update_time`)
VALUES (9, 1, 1, '2025-09-18 14:52:58.000', '2025-09-18 14:52:58.000');
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_time`, `update_time`)
VALUES (12, 2, 2, '2025-10-29 10:17:07.000', '2025-10-29 10:17:07.000');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_wechat
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_wechat`;
CREATE TABLE `sys_user_wechat`
(
    `id`      bigint NOT NULL,
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `openid`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'openid',
    `unioid`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin        DEFAULT NULL COMMENT '微信唯一标识',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户微信信息';

-- ----------------------------
-- Records of sys_user_wechat
-- ----------------------------
BEGIN;
COMMIT;

SET
FOREIGN_KEY_CHECKS = 1;
