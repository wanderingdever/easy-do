/*
 Navicat Premium Dump SQL

 Source Server         : 192.168.5.111-3124
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 192.168.5.111:3124
 Source Schema         : easy-do

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 25/11/2024 15:16:57
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

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
    `create_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`          tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统参数配置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
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
    `create_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`          tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典数据';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1, '启用', 'true', 1, '', 'success', 1, NULL, NULL, NULL, '2024-09-12 11:41:21.820', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (2, 1, '停用', 'false', 2, '', 'danger', 1, NULL, NULL, NULL, '2024-09-12 11:41:23.887', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (3, 2, '是', 'true', 1, '{font-size: 16px;}', 'success', 1, NULL, '2022-11-02 21:44:07.000', '',
        '2024-09-12 11:41:24.853', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (4, 2, '否', 'false', 2, NULL, 'danger', 1, NULL, '2022-11-02 21:44:07.000', NULL, '2024-09-12 11:41:25.619', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (5, 3, '目录', 'CATALOGUE', 1, NULL, 'success', 1, NULL, '2022-11-02 21:44:07.000', NULL,
        '2024-09-12 11:41:26.367', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6, 3, '按钮', 'BUTTON', 3, NULL, 'info', 1, NULL, '2022-11-02 21:44:07.000', NULL, '2024-09-12 11:41:27.233',
        0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, 3, '页面', 'PAGE', 2, NULL, 'success', 1, NULL, '2022-11-02 21:44:07.000', NULL, '2024-09-12 11:41:27.970',
        0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (8, 4, '男', 'MAN', 1, '', 'primary', 1, '1701847090820464641', '2023-11-30 11:25:08.000', NULL,
        '2024-09-12 11:41:28.685', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, 4, '女', 'WOMAN', 2, '', 'primary', 1, '1701847090820464641', '2023-11-30 11:25:27.000', NULL,
        '2024-09-12 11:41:29.465', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (10, 4, '其他', 'OTHER', 3, '', 'primary', 1, '1701847090820464641', '2023-11-30 11:26:01.000', NULL,
        '2024-09-12 11:41:32.450', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (11, 5, '未激活', 'INACTIVATED', 1, '', 'warning', 1, '1701847090820464641', '2023-11-30 11:31:12.000', NULL,
        '2024-09-12 11:41:33.213', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (12, 5, '正常', 'NORMAL', 2, '', 'success', 1, '1701847090820464641', '2023-11-30 11:31:24.000', NULL,
        '2024-09-12 11:41:33.894', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (13, 5, '停用', 'STOP', 3, '', 'danger', 1, '1701847090820464641', '2023-11-30 11:31:35.000', NULL,
        '2024-09-12 11:41:34.801', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (14, 6, 'WEB', 'WEB', 2, '', 'default', 1, '1701847090820464641', '2023-11-30 13:52:37.000', NULL,
        '2024-10-09 16:38:57.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (15, 6, 'APP', 'APP', 3, '', 'default', 1, '1701847090820464641', '2023-11-30 13:52:44.000', NULL,
        '2024-10-09 16:39:00.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (16, 6, '管理端', 'ADMIN', 1, '', 'default', 1, '1701847090820464641', '2023-11-30 13:53:14.000', NULL,
        '2024-10-09 16:38:52.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (17, 7, '本级', 'ONESELF', 1, '', 'primary', 1, '1701847090820464641', '2023-12-06 09:21:38.000', NULL,
        '2024-09-12 11:41:38.742', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (18, 7, '本级及以下', 'LOWER', 2, '', 'primary', 1, '1701847090820464641', '2023-12-06 09:21:55.000', NULL,
        '2024-09-12 11:41:39.678', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (19, 8, '公告', 'NOTICE', 1, '', 'default', 1, '1701847090820464641', '2023-12-12 16:46:53.000', NULL,
        '2024-09-12 11:41:40.805', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (20, 9, '草稿', 'DRAFT', 1, NULL, 'warning', 1, '1701847090820464641', '2023-12-25 16:54:11.000', NULL,
        '2024-09-12 11:41:41.644', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (21, 9, '已发布', 'UNREAD', 2, NULL, 'primary', 1, '1701847090820464641', '2023-12-25 16:54:34.000', NULL,
        '2024-09-12 11:41:42.452', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_label`, `dict_value`, `dict_sort`, `css_class`, `list_class`,
                             `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (22, 9, '已读', 'READ', 3, NULL, 'success', 1, '1701847090820464641', '2023-12-25 16:54:46.000', NULL,
        '2024-09-12 11:41:43.634', 0);
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
    `is_system`   char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '是否是系统内置',
    `enable`      tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci             DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci             DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='字典类型';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, '启用停用', 'system_enable', '启用或者停用', '1', 1, NULL, NULL, '1701847090820464641',
        '2024-09-12 11:39:40.106', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (2, '是否', 'yes_or_no', '是否', '1', 1, NULL, '2023-09-26 13:58:50.000', '1701847090820464641',
        '2024-09-12 11:39:42.351', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (3, '菜单类型', 'system_menu', '菜单类型', '1', 1, NULL, '2022-11-02 21:44:07.000', NULL,
        '2024-09-12 11:39:43.792', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (4, '性别', 'system_sex', '性别', '1', 1, '1701847090820464641', '2023-11-30 11:24:44.000',
        '1701847090820464641', '2024-09-12 11:40:36.530', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (5, '账号状态', 'system_account_status', '用户账号的状态', '1', 1, '1701847090820464641',
        '2023-11-30 11:30:55.000', NULL, '2024-09-12 11:39:48.204', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (6, '客户端', 'system_client', '所有的账号归属客户端', '1', 1, '1701847090820464641', '2023-11-30 13:52:18.000',
        NULL, '2024-09-12 11:39:49.908', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, '数据权限', 'system_authority_level', '角色数据权限', '1', 1, '1701847090820464641',
        '2023-12-06 09:21:17.000', NULL, '2024-09-12 11:39:51.807', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (8, '通知类型', 'system_notification', '通知类型', '1', 1, '1701847090820464641', '2023-12-12 16:45:08.000',
        NULL, '2024-09-12 11:39:53.538', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, '文章状态', 'system_article_status', '文章状态', '1', 1, '1701847090820464641', '2023-12-25 16:53:25.000',
        '1701847090820464641', '2024-09-12 11:39:55.092', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_file_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_record`;
CREATE TABLE `sys_file_record`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `file_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件原名',
    `file`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件路径',
    `file_type`   char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL COMMENT '文件类型',
    `file_size`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '大小(字节)',
    `downloads`   int unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci              DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci              DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint                                                       NOT NULL DEFAULT '0' COMMENT '逻辑删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='文件记录表';

-- ----------------------------
-- Records of sys_file_record
-- ----------------------------
BEGIN;
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `downloads`, `create_by`,
                               `create_time`, `update_by`, `update_time`, `del`)
VALUES (19, '熊猫上班.png', '2024/10/10/102301_熊猫上班.png', 'png', '151121', 0, NULL, '2024-10-10 10:23:02.000', NULL,
        NULL, 0);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `downloads`, `create_by`,
                               `create_time`, `update_by`, `update_time`, `del`)
VALUES (20, 'WechatIMG883.jpg', '2024/10/17/095625_WechatIMG883.jpg', 'jpg', '1518746', 0, NULL,
        '2024-10-17 09:56:25.000', NULL, NULL, 0);
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
    `ip`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT '' COMMENT '登录IP地址',
    `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '登录地点',
    `browser`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '浏览器类型',
    `login_time`  datetime(3) NOT NULL COMMENT '访问时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    `del`         tinyint                                                      NOT NULL DEFAULT '0' COMMENT '逻辑删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_login_logs
-- ----------------------------
BEGIN;
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
    `create_by`     char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '创建人',
    `create_time`   datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`     char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '更新人',
    `update_time`   datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`           tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单权限信息';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, '首页', 'PAGE', 0, 1, 'home', 'home/index', '', 0, 0, 0, 1, 0, NULL, 'home', 'iconfont icon-shouye', 1, NULL,
        '2024-10-09 11:00:53.000', NULL, '2024-10-12 10:23:12.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (2, '系统管理', 'CATALOGUE', 0, 13, 'system', NULL, '/system/menu', 0, 0, 0, 0, 0, '0', 'system.menu',
        'iconfont icon-xitongshezhi', 1, NULL, '2022-11-18 19:27:43.000', NULL, '2024-10-10 09:58:37.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (3, '菜单配置', 'PAGE', 2, 1, 'system/menu', 'system/menu/index', NULL, 0, 0, 0, 1, 0, '0', 'system.menu.tree',
        'iconfont icon-caidan', 1, NULL, '2022-11-05 00:20:58.000', NULL, '2024-09-29 14:26:18.058', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (4, '参数配置', 'PAGE', 2, 7, 'system/config', 'system/config/index', NULL, 0, 0, 0, 1, 0, '0',
        'system.config.page', 'iconfont icon-xitongshezhi', 1, NULL, '2022-12-22 00:09:14.000', NULL,
        '2024-09-12 11:42:51.152', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (5, '字典管理', 'PAGE', 2, 6, 'system/dict', 'system/dict/index', NULL, 0, 0, 0, 1, 0, '0', 'system.dict.page',
        'iconfont icon-diannao1', 1, NULL, '2022-12-21 00:10:37.000', NULL, '2024-09-12 11:42:58.112', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6, '机构管理', 'PAGE', 2, 2, 'system/org', 'system/org/index', '', 0, 0, 0, 1, 0, '', 'system.org.tree',
        'iconfont icon-shuxingtu', 1, NULL, '2023-11-28 16:03:17.000', NULL, '2024-09-12 11:42:58.116', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, '用户管理', 'PAGE', 2, 3, 'system/user', 'system/user/index', '', 0, 0, 0, 1, 0, '', 'system.user.page',
        'iconfont icon-icon-', 1, NULL, '2023-11-30 09:49:51.000', NULL, '2024-09-12 11:42:51.172', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (8, '角色管理', 'PAGE', 2, 4, 'system/role', 'system/role/index', '', 0, 0, 0, 1, 0, '', 'system.role.page',
        'iconfont icon-gerenzhongxin', 1, NULL, '2023-12-04 16:11:48.000', NULL, '2024-09-12 11:42:58.125', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, '新增', 'BUTTON', 3, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.menu.add', '', 1, NULL,
        '2023-12-08 11:19:07.000', NULL, '2024-09-12 13:49:40.561', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (10, '通知消息', 'PAGE', 2, 8, 'system/msg', 'system/msg/index', '', 0, 0, 0, 1, 0, '', 'system.msg.page',
        'iconfont icon-tongzhi1', 1, NULL, '2023-12-11 14:05:27.000', NULL, '2024-09-12 13:49:40.568', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (11, '编辑', 'BUTTON', 3, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.menu.update', '', 1, NULL,
        '2023-12-12 16:18:13.000', NULL, '2024-09-12 13:49:40.575', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (12, '删除', 'BUTTON', 3, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.menu.del', '', 1, NULL,
        '2023-12-12 16:18:31.000', NULL, '2024-09-12 13:49:40.582', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (13, '新增', 'BUTTON', 5, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.dict.add', '', 1, NULL,
        '2023-12-12 16:19:30.000', NULL, '2024-09-12 13:49:40.588', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (14, '编辑', 'BUTTON', 5, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.dict.update', '', 1, NULL,
        '2023-12-12 16:19:41.000', NULL, '2024-09-12 13:49:40.594', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (15, '删除', 'BUTTON', 5, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.dict.del', '', 1, NULL,
        '2023-12-12 16:19:55.000', NULL, '2024-09-12 13:49:40.601', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (16, '删除', 'BUTTON', 4, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.config.del', '', 1, NULL,
        '2023-12-12 16:23:05.000', NULL, '2024-09-12 13:49:40.607', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (17, '新增', 'BUTTON', 4, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.config.add', '', 1, NULL,
        '2023-12-12 16:23:21.000', NULL, '2024-09-12 13:49:40.614', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (18, '编辑', 'BUTTON', 4, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.config.update', '', 1, NULL,
        '2023-12-12 16:23:35.000', NULL, '2024-09-12 13:49:40.621', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (19, '新增', 'BUTTON', 8, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.role.add', '', 1, NULL,
        '2023-12-12 16:39:25.000', NULL, '2024-09-12 13:49:40.626', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (20, '编辑', 'BUTTON', 8, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.role.update', '', 1, NULL,
        '2023-12-12 16:39:37.000', NULL, '2024-09-12 13:49:40.631', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (21, '删除', 'BUTTON', 8, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.role.del', '', 1, NULL,
        '2023-12-12 16:39:47.000', NULL, '2024-09-12 13:49:40.637', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (22, '删除', 'BUTTON', 7, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.user.del', '', 1, NULL,
        '2023-12-12 16:40:03.000', NULL, '2024-09-12 13:49:40.642', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (23, '编辑', 'BUTTON', 7, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.user.update', '', 1, NULL,
        '2023-12-12 16:40:14.000', NULL, '2024-09-12 13:49:40.646', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (24, '新增', 'BUTTON', 7, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.user.add', '', 1, NULL,
        '2023-12-12 16:40:23.000', NULL, '2024-09-12 13:49:40.651', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (25, '新增', 'BUTTON', 6, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.org.add', '', 1, NULL,
        '2023-12-12 16:40:52.000', NULL, '2024-09-12 13:49:40.657', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (26, '删除', 'BUTTON', 6, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.org.del', '', 1, NULL,
        '2023-12-12 16:41:47.000', NULL, '2024-09-12 13:49:40.663', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (27, '编辑', 'BUTTON', 6, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.org.update', '', 1, NULL,
        '2023-12-12 16:42:02.000', NULL, '2024-09-12 13:49:40.667', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (28, '编辑', 'BUTTON', 10, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.update', '', 1, NULL,
        '2023-12-12 16:43:41.000', NULL, '2024-10-12 10:22:14.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (29, '删除', 'BUTTON', 10, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.del', '', 1, NULL,
        '2023-12-12 16:43:55.000', NULL, '2024-10-12 10:22:20.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (30, '新增', 'BUTTON', 10, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.add', '', 1, NULL,
        '2023-12-12 16:44:04.000', NULL, '2024-10-12 10:22:07.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (38, '文件管理', 'PAGE', 2, 9, 'system/file', 'system/file/index', '', 0, 0, 0, 1, 0, NULL, 'system.file.page',
        'iconfont icon-zhongduancanshuchaxun', 1, NULL, '2024-10-10 11:41:10.000', NULL, '2024-10-12 10:22:54.000', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `title`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
    `type`         char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '类别',
    `content`      longblob                                                      NOT NULL COMMENT '内容',
    `content_text` longblob                                                      NOT NULL COMMENT '纯文本内容',
    `sender`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发送者',
    `status`       char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '消息状态',
    `create_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`          tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='消息通知';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`
(
    `id`             bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `org_parent_id`  bigint unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
    `org_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织名称',
    `org_short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '组织简称',
    `org_level`      char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '组织级别',
    `org_type`       char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '组织类型',
    `org_nature`     char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '组织性质',
    `org_code`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构编码',
    `org_tag`        char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '组织标签',
    `org_province`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '省',
    `org_city`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '市',
    `org_district`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  DEFAULT NULL COMMENT '区',
    `org_area_code`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区划代码集',
    `org_address`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
    `org_desc`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构简介',
    `org_logo`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'logo',
    `org_sort`       int                                                           DEFAULT NULL COMMENT '顺序',
    `org_status`     char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '组织状态',
    `create_by`      char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '创建人',
    `create_time`    datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`      char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '更新人',
    `update_time`    datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`            tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='组织信息';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
BEGIN;
INSERT INTO `sys_org` (`id`, `org_parent_id`, `org_name`, `org_short_name`, `org_level`, `org_type`, `org_nature`,
                       `org_code`, `org_tag`, `org_province`, `org_city`, `org_district`, `org_area_code`,
                       `org_address`, `org_desc`, `org_logo`, `org_sort`, `org_status`, `create_by`, `create_time`,
                       `update_by`, `update_time`, `del`)
VALUES (1, 0, '测试机构', '测试', '一级', '测试', '测试', '001', '测试', '120000', '120100', '120101', NULL, '测试地址',
        '测试简介', '', 1, NULL, NULL, '2023-11-29 10:58:17.000', NULL, '2024-09-12 11:43:15.930', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`              bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `org_id`          bigint unsigned NOT NULL COMMENT '归属组织ID',
    `role_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '角色名字',
    `role_key`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色key',
    `authority_level` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '权限级别',
    `role_sort`       int unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
    `enable`          tinyint                                                       NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_by`       char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '创建人',
    `create_time`     datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`       char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '更新人',
    `update_time`     datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`             tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色信息';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `org_id`, `role_name`, `role_key`, `authority_level`, `role_sort`, `enable`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1, '超级管理员', 'admin', 'LOWER', 1, 1, NULL, NULL, NULL, '2024-10-09 16:51:57.000', 0);
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
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色->菜单权限关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1, 1, NULL, '2024-09-12 13:46:52.058', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (2, 1, 2, NULL, '2024-09-12 13:46:52.063', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (3, 1, 3, NULL, '2024-09-12 13:46:52.063', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (4, 1, 4, NULL, '2024-09-12 13:46:52.063', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (5, 1, 5, NULL, '2024-09-12 13:46:52.064', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6, 1, 6, NULL, '2024-09-12 13:46:52.065', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, 1, 7, NULL, '2024-09-12 13:46:52.065', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (8, 1, 8, NULL, '2024-09-12 13:46:52.066', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, 1, 9, NULL, '2024-09-12 13:46:52.066', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (10, 1, 10, NULL, '2024-09-12 13:46:52.067', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (11, 1, 11, NULL, '2024-09-12 13:46:52.067', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (12, 1, 12, NULL, '2024-09-12 13:46:52.067', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (13, 1, 13, NULL, '2024-09-12 13:46:52.069', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (14, 1, 14, NULL, '2024-09-12 13:46:52.070', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (15, 1, 15, NULL, '2024-09-12 13:46:52.070', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (16, 1, 16, NULL, '2024-09-12 13:46:52.071', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (17, 1, 17, NULL, '2024-09-12 13:46:52.072', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (18, 1, 18, NULL, '2024-09-12 13:46:52.072', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (19, 1, 19, NULL, '2024-09-12 13:46:52.072', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (20, 1, 20, NULL, '2024-09-12 13:46:52.073', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (21, 1, 21, NULL, '2024-09-12 13:46:52.073', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (22, 1, 22, NULL, '2024-09-12 13:46:52.074', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (23, 1, 23, NULL, '2024-09-12 13:46:52.074', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (24, 1, 24, NULL, '2024-09-12 13:46:52.074', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (25, 1, 25, NULL, '2024-09-12 13:46:52.075', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (26, 1, 26, NULL, '2024-09-12 13:46:52.075', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (27, 1, 27, NULL, '2024-09-12 13:46:52.075', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (28, 1, 28, NULL, '2024-09-12 13:46:52.076', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (29, 1, 29, NULL, '2024-09-12 13:46:52.076', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (30, 1, 30, NULL, '2024-09-12 13:46:52.076', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (87, 1, 1, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:52:30.691', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (88, 1, 2, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (89, 1, 3, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (90, 1, 9, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (91, 1, 11, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (92, 1, 12, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (93, 1, 6, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (94, 1, 25, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (95, 1, 27, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (96, 1, 26, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (97, 1, 7, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (98, 1, 24, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (99, 1, 23, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (100, 1, 22, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (101, 1, 8, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (102, 1, 19, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (103, 1, 20, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (104, 1, 21, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (105, 1, 5, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (106, 1, 13, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (107, 1, 30, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (108, 1, 28, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (109, 1, 29, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (110, 1, 14, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (111, 1, 15, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (112, 1, 4, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (113, 1, 17, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (114, 1, 18, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (115, 1, 16, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (116, 1, 10, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (117, 1, 1, NULL, '2024-10-09 16:51:57.000', NULL, '2024-10-09 16:52:32.876', 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (118, 1, 2, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (119, 1, 3, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (120, 1, 9, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (121, 1, 11, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (122, 1, 12, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (123, 1, 6, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (124, 1, 25, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (125, 1, 27, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (126, 1, 26, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (127, 1, 7, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (128, 1, 24, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (129, 1, 23, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (130, 1, 22, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (131, 1, 8, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (132, 1, 19, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (133, 1, 20, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (134, 1, 21, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (135, 1, 5, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (136, 1, 13, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (137, 1, 30, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (138, 1, 28, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (139, 1, 29, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (140, 1, 14, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (141, 1, 15, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (142, 1, 4, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (143, 1, 17, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (144, 1, 18, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (145, 1, 16, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (146, 1, 10, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `username`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '账号',
    `password`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `email`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
    `phone`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
    `client`      char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '所属客户端',
    `status`      char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '账号状态',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `index_username_del` (`username`,`del`) USING BTREE COMMENT '用户名+逻辑删除唯一',
    KEY           `index_phone_del` (`phone`,`del`) USING BTREE COMMENT '手机号+逻辑删除索引'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='账号信息';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `phone`, `client`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `del`)
VALUES (1, 'admin', '$2a$10$ctagQJswnSwUyl/akFuFFeLyRO/ffMxuK2HhnzM29w9lfBLoZCU82', NULL, '13300006666', 'ADMIN',
        'NORMAL', NULL, '2022-10-07 10:16:26.000', NULL, '2024-09-12 12:38:41.941', 0);
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `phone`, `client`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `del`)
VALUES (2, '测试', '$2a$10$ZQa8WPa7xyioBXDM.pI/***REMOVE_SECRET***', NULL, '15399999999', 'WEB',
        'INACTIVATED', NULL, '2024-10-17 10:24:02.000', NULL, '2024-10-17 10:24:14.000', 1);
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
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
    `id_card`     char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '身份证',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户基本信息';

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_info` (`id`, `user_id`, `nickname`, `avatar`, `sex`, `name`, `id_card`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1, '超级管理员',
        'data:image/png;base64,***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/lVViTLLUUAAAAgdFJOUwBsBPH2+***REMOVE_SECRET***/U3aVpl5LQWFRKnV+WaNPCIvdGeBHqm/***REMOVE_SECRET***+Y28QM+4KWGXsiCCHA7wc9tByWMPIYQv7h/B0+WS/BH8BHwyn1zDN5fpteHJaDB+BSwmef3BNG/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***',
        '1', NULL, NULL, NULL, NULL, NULL, '2024-10-17 10:17:17.000', 0);
INSERT INTO `sys_user_info` (`id`, `user_id`, `nickname`, `avatar`, `sex`, `name`, `id_card`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (10, 2, '测试1',
        'data:image/png;base64,***REMOVE_SECRET***/***REMOVE_SECRET***/T0//d2//Ny//h3//c2f/Y1v/Nyv/T0P/l4//PzP/k4f/a2P/PzP/W1v/Z1//Z1//l4//l4//Py//Qy//k4v/l4//PzP/l4v/l4//Oyv/h4f/Rzv/S0P/i4v/l4/+wqv/k4v/V0v/j4f/T0P/c2v/U0f/Rz//i4P/W0//Sz//h3//Qzf/f3f/Pzf/e3P/X1f/Z1//OzP/g3v+0r//Ny//d2//FwP/Dv//W1P60sf/Y1v/a1/6yrv+2s//a2PzAvf+1sf/Y1f+/uv/Fwv/Nyf+yrP+vqf/g3f/V0//b2f+8uP/U0v/AvP7Ixvy+uv+zrv+voP/d2v2uq/2wrP/T0f/CvfaZlP+xq/y7uPuzsP/q6P/Kxvacl/ysqP6vqf/Qzv+7tv/IxPu2s/yuqf+tp/+4tfaYkv+snvuqp/uinv7Avv+wrP/t7P7Gw/6+u//MyP+xqv/Cvv3Ewf/n5v6wqvukofeemfzCv/3Ny/aWkfy5tvywrf+ik/+mmP/k4f3S0P2ppP2moPzGxP3X1f/z8v/***REMOVE_SECRET***/b89vb29/b28+YUX3Lk7oUqifOztsXEKsj6LDy+***REMOVE_SECRET***+KCoIghIBC6KgvCY+xrEqFYPJiPWX+2fPWmvvfV6cc6C5mdVzQPtD+8l3rb0OarNh/f7x08Sb/2+9+7Wa+PTxd5uo9x8+T7y5Nq0t01oSr8GtYHBpKWhQPh/ePuXb4fLKL/***REMOVE_SECRET***/***REMOVE_SECRET***/EBzgfn6+H2hcUMS3x22y2glYsH7+HsyIR+***REMOVE_SECRET***/***REMOVE_SECRET***+SEXwz7SiVUuVnRuwCaJwVd+4szZSRRZeXEoEhmVAAcHiveP6/F8eMucx8FZN3GkioojS+***REMOVE_SECRET***+/0SgTn5NdJjGVWDo0WsO+LC+***REMOVE_SECRET***/***REMOVE_SECRET***/n9Q0A4JG9VzRt1/***REMOVE_SECRET***+i37lxbwScCU48K/***REMOVE_SECRET***/NTOYgh/***REMOVE_SECRET***/***REMOVE_SECRET***/7PkkGdc4jylHCJKQYODLn+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+EyJP+PTT4g++pjr9V07GVCMVWBkrYBJW+sAFBj5he8p3OPwFxI9zOWTAAOH+5w/G4nmCwa3+K9swOnM+v3exsHaYuPmyA0tpvCsdAQR72jCP+t4w9cq4NB5w++***REMOVE_SECRET***/***REMOVE_SECRET***+GjjR5TbQLZEoW0FfZ6SBIYX5/***REMOVE_SECRET***/sZJJeBs3p/m2gEHZ7d+/***REMOVE_SECRET***/***REMOVE_SECRET***+/f2+***REMOVE_SECRET***+du2uN1B9ZDs1MLruz1VT9vhzZiL+***REMOVE_SECRET***+PLwA02Z84g5LDW/***REMOVE_SECRET***/pNr5/***REMOVE_SECRET***+***REMOVE_SECRET***+ubhouLfItDoCZjBjiNwy3d3aWc+nh82tgu5QWjneK3GH17mXS/S9f19TTnNds0MhsNH+/Mj0po3LgRmDBYojmEUtuDW1t3q5Vc+gHg0CnXM7RyDGyzfPrn+/PPF17jtxa/i3/***REMOVE_SECRET***/***REMOVE_SECRET***/d35/J+***REMOVE_SECRET***+***REMOVE_SECRET***/vje3FMYGdGALjDTzEDjgtT+WSg/***REMOVE_SECRET***+EKcEFE48KY1SvbK+Mn4HQZADiDBIQIyw+D+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/bvquuZ+dVmpdW6+***REMOVE_SECRET***/ftQ4MJ0NegXw8bH1A4D9veVm9SH+ECoc9lut6s/+***REMOVE_SECRET***/1a7e62s5s+O1SALQCiL1m+5EBq8QUAR0QlULoyB+***REMOVE_SECRET***/***REMOVE_SECRET***/IMlgkIe/CGDsnC1Dh5DZcREHc6NHl/***REMOVE_SECRET***/***REMOVE_SECRET***/e9JSA7usxfCz6dqa0uKL8MzULM3UL+Cm4Jr6BwIN1joC1w0SJOC/***REMOVE_SECRET***//I91sn9LIsjA+***REMOVE_SECRET***/***REMOVE_SECRET***/lpwBIYywHPqqs3toJskmTocL+dZ4C0n9m/***REMOVE_SECRET***+3D/***REMOVE_SECRET***+UxYC/MfM+***REMOVE_SECRET***/***REMOVE_SECRET***+PNr/K0B53poAtMsXg6xWYoUgB+TbLW4xAOoIeMotdgF+fpMRgJASbNTQaD7OApQdrvl8CDgz+qQg9Jmg3s/***REMOVE_SECRET***/***REMOVE_SECRET***+8Q8NgNGM/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+PcAaBMCWA3hDNSgAM0zB+GE2n+VF+HH/***REMOVE_SECRET***/c+EvjAXBmuLAVkoJ+***REMOVE_SECRET***/XL28GoG4EAoWB1cspAg4DWNYnzpA+fiTAoBkXD3zCyHyuuucU91NFKm+t/CgFiEEdj0+/3KVd4bkgbV4MAOyYA1ageQQvJye/f3d+8+Z/J4dNo9O1LFc1/aHq97OZWR3X0WBQTClTIABsDi/BWfJF/o+WDjst8RCkpg8QQgegwOv8zsvnv5+ffP29ixs/***REMOVE_SECRET***/KsQAFQ5ICva/ugGHpxL0wa4b8FdsMxSST/***REMOVE_SECRET***/***REMOVE_SECRET***+D4FAT/9+v59Taqs9Nvth3Y/***REMOVE_SECRET***+8cuLWc6TgniucxS0ARt12+IbyV2DAjDz73+9e/36+/dm0Dw/b513/***REMOVE_SECRET***+/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/wRj10QiLZKX50FBx7FCTAV/geEVcJCLf0YNgfCGhYd+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+e6r+***REMOVE_SECRET***/AHfxbFLQa+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/ha+6EyY+7vF/gOfHoqll4p4sbBoP2A3E+***REMOVE_SECRET***/QclGl+***REMOVE_SECRET***/mw1omrfFBwu6NH2h+***REMOVE_SECRET***+qJCCOVIQQ3Jf/TgJ2HAB9sji4tFDIMjuuwfoRqc/YA2uf3559OMFzR4B7kHPBsA/Fwccsf2gL5x21+***REMOVE_SECRET***+6AJwFa/***REMOVE_SECRET***+***REMOVE_SECRET***/YgONpQOWVmeAWJ2mTYBiCsZD++r+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+6z64bxDgW8DamQcINcgB1a4NmNxjH/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+ukUK1jngSeNyMFGD1+4+***REMOVE_SECRET***+***REMOVE_SECRET***+OV+***REMOVE_SECRET***+A1SeAagIwFcCEG9gzgDs+DDFX21ApwbDXEEEDHg+***REMOVE_SECRET***/3wz2FxAWIeb70KJh1ALsOoM/***REMOVE_SECRET***+***REMOVE_SECRET***+fzFn+***REMOVE_SECRET***/Jvb71X3dyOk0k2vBjp5gg/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+waAd9cW7OJq+***REMOVE_SECRET***+***REMOVE_SECRET***+CNFwigZZdMY5vZ/***REMOVE_SECRET***/***REMOVE_SECRET***+6nXue8c/XSqLgfaHCZHwHBPkj5/n0k3w18Ai/***REMOVE_SECRET***/oCAjRu+***REMOVE_SECRET***/q+***REMOVE_SECRET***/X7iUTyjLQeEQK4I6DwJzrjsHof/tdp06+v/***REMOVE_SECRET***/WPu/kb/iiUO4lfuTFCl+***REMOVE_SECRET***/k//nRA9ahSIPBq/wdibHOiwG+***REMOVE_SECRET***/M5+***REMOVE_SECRET***+***REMOVE_SECRET***+nQg6TtcWH24zX6YXgDTZquMQU+YsVx+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+KEEWFhY+/EHkI5FPVD5//jQpo8/***REMOVE_SECRET***',
        '1', '测试1', NULL, NULL, '2024-10-17 10:24:02.000', NULL, '2024-10-17 10:24:15.512', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_notice`;
CREATE TABLE `sys_user_notice`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint NOT NULL COMMENT '接受用户ID',
    `notice_id`   bigint NOT NULL COMMENT '消息ID',
    `status`      int unsigned NOT NULL DEFAULT '9' COMMENT '阅读状态',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户消息关联';

-- ----------------------------
-- Records of sys_user_notice
-- ----------------------------
BEGIN;
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
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户->机构关联';

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1, 1, NULL, NULL, NULL, '2024-10-11 16:59:46.731', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (18, 1, 1, NULL, '2024-10-11 16:59:45.000', NULL, '2024-10-17 09:58:52.485', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (19, 1, 1, NULL, '2024-10-17 09:58:51.000', NULL, '2024-10-17 10:03:04.279', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (20, 1, 1, NULL, '2024-10-17 10:03:03.000', NULL, '2024-10-17 10:04:54.870', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (21, 1, 1, NULL, '2024-10-17 10:04:54.000', NULL, '2024-10-17 10:09:14.948', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (22, 1, 1, NULL, '2024-10-17 10:09:14.000', NULL, '2024-10-17 10:10:31.692', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (23, 1, 1, NULL, '2024-10-17 10:10:31.000', NULL, '2024-10-17 10:11:41.933', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (24, 1, 1, NULL, '2024-10-17 10:11:41.000', NULL, '2024-10-17 10:16:21.532', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (25, 1, 1, NULL, '2024-10-17 10:16:20.000', NULL, '2024-10-17 10:16:32.877', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (26, 1, 1, NULL, '2024-10-17 10:16:32.000', NULL, '2024-10-17 10:17:18.400', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (27, 1, 1, NULL, '2024-10-17 10:17:17.000', NULL, NULL, 0);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (28, 2, 1, NULL, '2024-10-17 10:24:02.000', NULL, '2024-10-17 10:24:15.517', 1);
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
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户->角色关联';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1, 1, NULL, NULL, NULL, '2024-10-11 16:59:46.738', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (14, 1, 1, NULL, '2024-10-11 16:59:45.000', NULL, '2024-10-17 09:58:52.491', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (15, 1, 1, NULL, '2024-10-17 09:58:51.000', NULL, '2024-10-17 10:03:04.283', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (16, 1, 1, NULL, '2024-10-17 10:03:03.000', NULL, '2024-10-17 10:04:54.877', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (17, 1, 1, NULL, '2024-10-17 10:04:54.000', NULL, '2024-10-17 10:09:14.962', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (18, 1, 1, NULL, '2024-10-17 10:09:14.000', NULL, '2024-10-17 10:10:31.698', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (19, 1, 1, NULL, '2024-10-17 10:10:31.000', NULL, '2024-10-17 10:11:41.937', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (20, 1, 1, NULL, '2024-10-17 10:11:41.000', NULL, '2024-10-17 10:16:21.536', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (21, 1, 1, NULL, '2024-10-17 10:16:20.000', NULL, '2024-10-17 10:16:32.881', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (22, 1, 1, NULL, '2024-10-17 10:16:32.000', NULL, '2024-10-17 10:17:18.450', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (23, 1, 1, NULL, '2024-10-17 10:17:17.000', NULL, NULL, 0);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (24, 2, 1, NULL, '2024-10-17 10:24:02.000', NULL, '2024-10-17 10:24:15.523', 1);
COMMIT;

SET
FOREIGN_KEY_CHECKS = 1;