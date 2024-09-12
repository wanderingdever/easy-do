/*
 Navicat Premium Dump SQL

 Source Server         : 本地-192.168.5.111-3124
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 192.168.5.111:3124
 Source Schema         : lianlian_pay

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 12/09/2024 13:51:47
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
    `id`           bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `config_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数键值',
    `is_system`    tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否是系统内置',
    `enable`       tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用',
    `create_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`          tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1729339197222653954 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统参数配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `id`           bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `dict_type_id` bigint UNSIGNED NOT NULL COMMENT '字典类型ID easy_dict_type=>id',
    `dict_type`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '字典类型',
    `dict_label`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典键值',
    `dict_sort`    int UNSIGNED NOT NULL DEFAULT 0 COMMENT '字典排序',
    `css_class`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
    `enable`       tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用',
    `create_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`          tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6986880772967759893 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, 'system_enable', '启用', 'true', 1, '', 'success', 1, NULL, NULL, NULL, '2024-09-12 11:41:21.820', 0);
INSERT INTO `sys_dict_data`
VALUES (2, 1, 'system_enable', '停用', 'false', 2, '', 'danger', 1, NULL, NULL, NULL, '2024-09-12 11:41:23.887', 0);
INSERT INTO `sys_dict_data`
VALUES (3, 2, 'yes_or_no', '是', 'true', 1, '{font-size: 16px;}', 'success', 1, NULL, '2022-11-02 21:44:07.000', '',
        '2024-09-12 11:41:24.853', 0);
INSERT INTO `sys_dict_data`
VALUES (4, 2, 'yes_or_no', '否', 'false', 2, NULL, 'danger', 1, NULL, '2022-11-02 21:44:07.000', NULL,
        '2024-09-12 11:41:25.619', 0);
INSERT INTO `sys_dict_data`
VALUES (5, 3, 'system_menu', '目录', 'CATALOGUE', 1, NULL, 'success', 1, NULL, '2022-11-02 21:44:07.000', NULL,
        '2024-09-12 11:41:26.367', 0);
INSERT INTO `sys_dict_data`
VALUES (6, 3, 'system_menu', '按钮', 'BUTTON', 3, NULL, 'info', 1, NULL, '2022-11-02 21:44:07.000', NULL,
        '2024-09-12 11:41:27.233', 0);
INSERT INTO `sys_dict_data`
VALUES (7, 3, 'system_menu', '页面', 'PAGE', 2, NULL, 'success', 1, NULL, '2022-11-02 21:44:07.000', NULL,
        '2024-09-12 11:41:27.970', 0);
INSERT INTO `sys_dict_data`
VALUES (8, 4, 'system_sex', '男', 'MAN', 1, '', 'primary', 1, '1701847090820464641', '2023-11-30 11:25:08.000', NULL,
        '2024-09-12 11:41:28.685', 0);
INSERT INTO `sys_dict_data`
VALUES (9, 4, 'system_sex', '女', 'WOMAN', 2, '', 'primary', 1, '1701847090820464641', '2023-11-30 11:25:27.000', NULL,
        '2024-09-12 11:41:29.465', 0);
INSERT INTO `sys_dict_data`
VALUES (10, 4, 'system_sex', '其他', 'OTHER', 3, '', 'primary', 1, '1701847090820464641', '2023-11-30 11:26:01.000',
        NULL, '2024-09-12 11:41:32.450', 0);
INSERT INTO `sys_dict_data`
VALUES (11, 5, 'system_account_status', '未激活', 'INACTIVATED', 1, '', 'warning', 1, '1701847090820464641',
        '2023-11-30 11:31:12.000', NULL, '2024-09-12 11:41:33.213', 0);
INSERT INTO `sys_dict_data`
VALUES (12, 5, 'system_account_status', '正常', 'NORMAL', 2, '', 'success', 1, '1701847090820464641',
        '2023-11-30 11:31:24.000', NULL, '2024-09-12 11:41:33.894', 0);
INSERT INTO `sys_dict_data`
VALUES (13, 5, 'system_account_status', '停用', 'STOP', 3, '', 'danger', 1, '1701847090820464641',
        '2023-11-30 11:31:35.000', NULL, '2024-09-12 11:41:34.801', 0);
INSERT INTO `sys_dict_data`
VALUES (14, 6, 'system_client', 'WEB', 'WEB', 1, '', 'default', 1, '1701847090820464641', '2023-11-30 13:52:37.000',
        NULL, '2024-09-12 11:41:35.869', 0);
INSERT INTO `sys_dict_data`
VALUES (15, 6, 'system_client', 'APP', 'APP', 2, '', 'default', 1, '1701847090820464641', '2023-11-30 13:52:44.000',
        NULL, '2024-09-12 11:41:36.686', 0);
INSERT INTO `sys_dict_data`
VALUES (16, 6, 'system_client', '小程序', 'APPLETS', 3, '', 'default', 1, '1701847090820464641',
        '2023-11-30 13:53:14.000', NULL, '2024-09-12 11:41:37.641', 0);
INSERT INTO `sys_dict_data`
VALUES (17, 7, 'system_authority_level', '本级', 'ONESELF', 1, '', 'primary', 1, '1701847090820464641',
        '2023-12-06 09:21:38.000', NULL, '2024-09-12 11:41:38.742', 0);
INSERT INTO `sys_dict_data`
VALUES (18, 7, 'system_authority_level', '本级及以下', 'LOWER', 2, '', 'primary', 1, '1701847090820464641',
        '2023-12-06 09:21:55.000', NULL, '2024-09-12 11:41:39.678', 0);
INSERT INTO `sys_dict_data`
VALUES (19, 8, 'system_notification', '公告', 'NOTICE', 1, '', 'default', 1, '1701847090820464641',
        '2023-12-12 16:46:53.000', NULL, '2024-09-12 11:41:40.805', 0);
INSERT INTO `sys_dict_data`
VALUES (20, 9, 'sys_article_status', '草稿', 'DRAFT', 1, NULL, 'warning', 1, '1701847090820464641',
        '2023-12-25 16:54:11.000', NULL, '2024-09-12 11:41:41.644', 0);
INSERT INTO `sys_dict_data`
VALUES (21, 9, 'sys_article_status', '已发布', 'UNREAD', 2, NULL, 'primary', 1, '1701847090820464641',
        '2023-12-25 16:54:34.000', NULL, '2024-09-12 11:41:42.452', 0);
INSERT INTO `sys_dict_data`
VALUES (22, 9, 'sys_article_status', '已读', 'READ', 3, NULL, 'success', 1, '1701847090820464641',
        '2023-12-25 16:54:46.000', NULL, '2024-09-12 11:41:43.634', 0);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `dict_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典类型',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典描述',
    `is_system`   char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '是否是系统内置',
    `enable`      tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6986880524547522567 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '启用停用', 'system_enable', '启用或者停用', '1', 1, NULL, NULL, '1701847090820464641',
        '2024-09-12 11:39:40.106', 0);
INSERT INTO `sys_dict_type`
VALUES (2, '是否', 'yes_or_no', '是否', '1', 1, NULL, '2023-09-26 13:58:50.000', '1701847090820464641',
        '2024-09-12 11:39:42.351', 0);
INSERT INTO `sys_dict_type`
VALUES (3, '菜单类型', 'system_menu', '菜单类型', '1', 1, NULL, '2022-11-02 21:44:07.000', NULL,
        '2024-09-12 11:39:43.792', 0);
INSERT INTO `sys_dict_type`
VALUES (4, '性别', 'system_sex', '性别', '1', 1, '1701847090820464641', '2023-11-30 11:24:44.000',
        '1701847090820464641', '2024-09-12 11:40:36.530', 0);
INSERT INTO `sys_dict_type`
VALUES (5, '账号状态', 'system_account_status', '用户账号的状态', '1', 1, '1701847090820464641',
        '2023-11-30 11:30:55.000', NULL, '2024-09-12 11:39:48.204', 0);
INSERT INTO `sys_dict_type`
VALUES (6, '客户端', 'system_client', '所有的账号归属客户端', '1', 1, '1701847090820464641', '2023-11-30 13:52:18.000',
        NULL, '2024-09-12 11:39:49.908', 0);
INSERT INTO `sys_dict_type`
VALUES (7, '数据权限', 'system_authority_level', '角色数据权限', '1', 1, '1701847090820464641',
        '2023-12-06 09:21:17.000', NULL, '2024-09-12 11:39:51.807', 0);
INSERT INTO `sys_dict_type`
VALUES (8, '通知类型', 'system_notification', '通知类型', '1', 1, '1701847090820464641', '2023-12-12 16:45:08.000',
        NULL, '2024-09-12 11:39:53.538', 0);
INSERT INTO `sys_dict_type`
VALUES (9, '文章状态', 'system_article_status', '文章状态', '1', 1, '1701847090820464641', '2023-12-25 16:53:25.000',
        '1701847090820464641', '2024-09-12 11:39:55.092', 0);

-- ----------------------------
-- Table structure for sys_file_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_record`;
CREATE TABLE `sys_file_record`
(
    `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `file_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件原名',
    `file`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件路径',
    `file_type`   char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL COMMENT '文件类型',
    `file_size`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '大小(字节)',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_record
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_logs`;
CREATE TABLE `sys_login_logs`
(
    `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`     bigint                                                       NOT NULL COMMENT '用户ID',
    `username`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户账号',
    `ip`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
    `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
    `browser`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
    `login_time`  datetime(3) NOT NULL COMMENT '访问时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    `del`         int                                                          NOT NULL DEFAULT 0 COMMENT '逻辑删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 381 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_logs
-- ----------------------------
INSERT INTO `sys_login_logs`
VALUES (372, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0',
        '2024-09-12 12:44:43.000', '1', NULL, '2024-09-12 12:44:43.505', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (373, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0',
        '2024-09-12 12:46:08.000', '1', NULL, '2024-09-12 12:46:08.485', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (374, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0',
        '2024-09-12 12:46:42.000', '1', NULL, '2024-09-12 12:46:42.137', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (375, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0',
        '2024-09-12 12:47:41.000', '1', NULL, '2024-09-12 12:47:41.698', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (376, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0',
        '2024-09-12 13:39:24.000', '1', NULL, '2024-09-12 13:39:24.842', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (377, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0',
        '2024-09-12 13:43:39.000', '1', NULL, '2024-09-12 13:43:39.835', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (378, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0',
        '2024-09-12 13:43:40.000', '1', NULL, '2024-09-12 13:43:40.036', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (379, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0',
        '2024-09-12 13:45:47.000', '1', NULL, '2024-09-12 13:45:47.331', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (380, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0',
        '2024-09-12 13:50:00.000', '1', NULL, '2024-09-12 13:50:00.605', NULL, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `id`            bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `menu_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
    `menu_type`     char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    NOT NULL COMMENT '菜单类型',
    `parent_id`     bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`     int NULL DEFAULT 0 COMMENT '显示顺序',
    `path`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
    `component`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组件路径',
    `redirect`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '重定向',
    `is_iframe`     tinyint NULL DEFAULT 0 COMMENT '是否为外链',
    `is_link`       tinyint NULL DEFAULT 0 COMMENT '是否为外链',
    `is_affix`      tinyint NULL DEFAULT 0 COMMENT '是否固定',
    `is_keep_alive` tinyint NULL DEFAULT 0 COMMENT '是否缓存',
    `is_hide`       tinyint NULL DEFAULT 0 COMMENT '菜单是否显示',
    `link`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
    `perms`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
    `icon`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
    `enable`        tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用',
    `create_by`     char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`   datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`     char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`   datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`           tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '首页', 'PAGE', 0, 1, 'home', 'home/index', NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '#', 1, NULL, NULL, NULL,
        '2023-12-20 10:57:49.530', 0);
INSERT INTO `sys_menu`
VALUES (2, '系统管理', 'CATALOGUE', 0, 13, 'system', NULL, '/system/menu', 0, 0, 0, 0, 0, '0', NULL,
        'iconfont icon-xitongshezhi', 1, NULL, '2022-11-18 19:27:43.000', NULL, '2024-09-12 11:42:51.138', 0);
INSERT INTO `sys_menu`
VALUES (3, '菜单配置', 'PAGE', 2, 1, 'system/menu', 'system/menu/index', NULL, 0, 0, 0, 1, 0, '0', 'system.menu.tree',
        'iconfont icon-caidan', 1, NULL, '2022-11-05 00:20:58.000', NULL, '2024-09-12 11:42:58.103', 0);
INSERT INTO `sys_menu`
VALUES (4, '参数配置', 'PAGE', 2, 7, 'system/config', 'system/config/index', NULL, 0, 0, 0, 1, 0, '0',
        'system.config.page', 'iconfont icon-xitongshezhi', 1, NULL, '2022-12-22 00:09:14.000', NULL,
        '2024-09-12 11:42:51.152', 0);
INSERT INTO `sys_menu`
VALUES (5, '字典管理', 'PAGE', 2, 6, 'system/dict', 'system/dict/index', NULL, 0, 0, 0, 1, 0, '0', 'system.dict.page',
        'iconfont icon-diannao1', 1, NULL, '2022-12-21 00:10:37.000', NULL, '2024-09-12 11:42:58.112', 0);
INSERT INTO `sys_menu`
VALUES (6, '机构管理', 'PAGE', 2, 2, 'system/org', 'system/org/index', '', 0, 0, 0, 1, 0, '', 'system.org.tree',
        'iconfont icon-shuxingtu', 1, NULL, '2023-11-28 16:03:17.000', NULL, '2024-09-12 11:42:58.116', 0);
INSERT INTO `sys_menu`
VALUES (7, '用户管理', 'PAGE', 2, 3, 'system/user', 'system/user/index', '', 0, 0, 0, 1, 0, '', 'system.user.page',
        'iconfont icon-icon-', 1, NULL, '2023-11-30 09:49:51.000', NULL, '2024-09-12 11:42:51.172', 0);
INSERT INTO `sys_menu`
VALUES (8, '角色管理', 'PAGE', 2, 4, 'system/role', 'system/role/index', '', 0, 0, 0, 1, 0, '', 'system.role.page',
        'iconfont icon-gerenzhongxin', 1, NULL, '2023-12-04 16:11:48.000', NULL, '2024-09-12 11:42:58.125', 0);
INSERT INTO `sys_menu`
VALUES (9, '新增', 'BUTTON', 3, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.menu.add', '', 1, NULL,
        '2023-12-08 11:19:07.000', NULL, '2024-09-12 13:49:40.561', 0);
INSERT INTO `sys_menu`
VALUES (10, '通知消息', 'PAGE', 2, 8, 'system/msg', 'system/msg/index', '', 0, 0, 0, 1, 0, '', 'system.msg.page',
        'iconfont icon-tongzhi1', 1, NULL, '2023-12-11 14:05:27.000', NULL, '2024-09-12 13:49:40.568', 0);
INSERT INTO `sys_menu`
VALUES (11, '编辑', 'BUTTON', 3, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.menu.update', '', 1, NULL,
        '2023-12-12 16:18:13.000', NULL, '2024-09-12 13:49:40.575', 0);
INSERT INTO `sys_menu`
VALUES (12, '删除', 'BUTTON', 3, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.menu.del', '', 1, NULL,
        '2023-12-12 16:18:31.000', NULL, '2024-09-12 13:49:40.582', 0);
INSERT INTO `sys_menu`
VALUES (13, '新增', 'BUTTON', 5, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.dict.add', '', 1, NULL,
        '2023-12-12 16:19:30.000', NULL, '2024-09-12 13:49:40.588', 0);
INSERT INTO `sys_menu`
VALUES (14, '编辑', 'BUTTON', 5, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.dict.update', '', 1, NULL,
        '2023-12-12 16:19:41.000', NULL, '2024-09-12 13:49:40.594', 0);
INSERT INTO `sys_menu`
VALUES (15, '删除', 'BUTTON', 5, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.dict.del', '', 1, NULL,
        '2023-12-12 16:19:55.000', NULL, '2024-09-12 13:49:40.601', 0);
INSERT INTO `sys_menu`
VALUES (16, '删除', 'BUTTON', 4, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.config.del', '', 1, NULL,
        '2023-12-12 16:23:05.000', NULL, '2024-09-12 13:49:40.607', 0);
INSERT INTO `sys_menu`
VALUES (17, '新增', 'BUTTON', 4, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.config.add', '', 1, NULL,
        '2023-12-12 16:23:21.000', NULL, '2024-09-12 13:49:40.614', 0);
INSERT INTO `sys_menu`
VALUES (18, '编辑', 'BUTTON', 4, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.config.update', '', 1, NULL,
        '2023-12-12 16:23:35.000', NULL, '2024-09-12 13:49:40.621', 0);
INSERT INTO `sys_menu`
VALUES (19, '新增', 'BUTTON', 8, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.role.add', '', 1, NULL,
        '2023-12-12 16:39:25.000', NULL, '2024-09-12 13:49:40.626', 0);
INSERT INTO `sys_menu`
VALUES (20, '编辑', 'BUTTON', 8, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.role.update', '', 1, NULL,
        '2023-12-12 16:39:37.000', NULL, '2024-09-12 13:49:40.631', 0);
INSERT INTO `sys_menu`
VALUES (21, '删除', 'BUTTON', 8, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.role.del', '', 1, NULL,
        '2023-12-12 16:39:47.000', NULL, '2024-09-12 13:49:40.637', 0);
INSERT INTO `sys_menu`
VALUES (22, '删除', 'BUTTON', 7, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.user.del', '', 1, NULL,
        '2023-12-12 16:40:03.000', NULL, '2024-09-12 13:49:40.642', 0);
INSERT INTO `sys_menu`
VALUES (23, '编辑', 'BUTTON', 7, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.user.update', '', 1, NULL,
        '2023-12-12 16:40:14.000', NULL, '2024-09-12 13:49:40.646', 0);
INSERT INTO `sys_menu`
VALUES (24, '新增', 'BUTTON', 7, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.user.add', '', 1, NULL,
        '2023-12-12 16:40:23.000', NULL, '2024-09-12 13:49:40.651', 0);
INSERT INTO `sys_menu`
VALUES (25, '新增', 'BUTTON', 6, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.org.add', '', 1, NULL,
        '2023-12-12 16:40:52.000', NULL, '2024-09-12 13:49:40.657', 0);
INSERT INTO `sys_menu`
VALUES (26, '删除', 'BUTTON', 6, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.org.del', '', 1, NULL,
        '2023-12-12 16:41:47.000', NULL, '2024-09-12 13:49:40.663', 0);
INSERT INTO `sys_menu`
VALUES (27, '编辑', 'BUTTON', 6, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.org.update', '', 1, NULL,
        '2023-12-12 16:42:02.000', NULL, '2024-09-12 13:49:40.667', 0);
INSERT INTO `sys_menu`
VALUES (28, '编辑', 'BUTTON', 13, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.update', '', 1, NULL,
        '2023-12-12 16:43:41.000', NULL, '2024-09-12 13:49:40.672', 0);
INSERT INTO `sys_menu`
VALUES (29, '删除', 'BUTTON', 13, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.del', '', 1, NULL,
        '2023-12-12 16:43:55.000', NULL, '2024-09-12 13:49:40.676', 0);
INSERT INTO `sys_menu`
VALUES (30, '新增', 'BUTTON', 13, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.add', '', 1, NULL,
        '2023-12-12 16:44:04.000', NULL, '2024-09-12 13:49:40.681', 0);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `id`           bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `title`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
    `type`         char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '类别',
    `content`      longblob                                                      NOT NULL COMMENT '内容',
    `content_text` longblob                                                      NOT NULL COMMENT '纯文本内容',
    `sender`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者',
    `status`       char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '消息状态',
    `create_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`          tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息通知' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`
(
    `id`             bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `org_parent_id`  bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
    `org_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织名称',
    `org_short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织简称',
    `org_level`      char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '组织级别',
    `org_type`       char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织类型',
    `org_nature`     char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织性质',
    `org_code`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构编码',
    `org_tag`        char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织标签',
    `org_province`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
    `org_city`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
    `org_district`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
    `org_area_code`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区划代码集',
    `org_address`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
    `org_desc`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构简介',
    `org_logo`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo',
    `org_sort`       int NULL DEFAULT NULL COMMENT '顺序',
    `org_status`     char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织状态',
    `create_by`      char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`    datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`    datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`            tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org`
VALUES (1, 0, '测试机构', '测试', '一级', '测试', '测试', '001', '测试', '120000', '120100', '120101', NULL, '测试地址',
        '测试简介', '', 1, NULL, NULL, '2023-11-29 10:58:17.000', NULL, '2024-09-12 11:43:15.930', 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`              bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `org_id`          bigint UNSIGNED NOT NULL COMMENT '归属组织ID',
    `role_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '角色名字',
    `role_key`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色key',
    `authority_level` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '权限级别',
    `role_sort`       int UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示顺序',
    `enable`          tinyint                                                       NOT NULL DEFAULT 1 COMMENT '是否启用',
    `create_by`       char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time`     datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`       char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time`     datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`             tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, 1, 'admin', 'admin', 'LOWER', 1, 1, NULL, NULL, NULL, '2024-09-12 13:46:52.028', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `role_id`     bigint UNSIGNED NOT NULL COMMENT '角色ID',
    `menu_id`     bigint UNSIGNED NOT NULL COMMENT '菜单ID',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色->菜单权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (1, 1, 1, NULL, '2024-09-12 13:46:52.058', NULL, '2024-09-12 13:47:50.400', 0);
INSERT INTO `sys_role_menu`
VALUES (2, 1, 2, NULL, '2024-09-12 13:46:52.063', NULL, '2024-09-12 13:47:50.411', 0);
INSERT INTO `sys_role_menu`
VALUES (3, 1, 3, NULL, '2024-09-12 13:46:52.063', NULL, '2024-09-12 13:47:50.418', 0);
INSERT INTO `sys_role_menu`
VALUES (4, 1, 4, NULL, '2024-09-12 13:46:52.063', NULL, '2024-09-12 13:49:54.329', 0);
INSERT INTO `sys_role_menu`
VALUES (5, 1, 5, NULL, '2024-09-12 13:46:52.064', NULL, '2024-09-12 13:49:54.335', 0);
INSERT INTO `sys_role_menu`
VALUES (6, 1, 6, NULL, '2024-09-12 13:46:52.065', NULL, '2024-09-12 13:49:54.342', 0);
INSERT INTO `sys_role_menu`
VALUES (7, 1, 7, NULL, '2024-09-12 13:46:52.065', NULL, '2024-09-12 13:49:54.348', 0);
INSERT INTO `sys_role_menu`
VALUES (8, 1, 8, NULL, '2024-09-12 13:46:52.066', NULL, '2024-09-12 13:49:54.355', 0);
INSERT INTO `sys_role_menu`
VALUES (9, 1, 9, NULL, '2024-09-12 13:46:52.066', NULL, '2024-09-12 13:49:54.361', 0);
INSERT INTO `sys_role_menu`
VALUES (10, 1, 10, NULL, '2024-09-12 13:46:52.067', NULL, '2024-09-12 13:49:54.367', 0);
INSERT INTO `sys_role_menu`
VALUES (11, 1, 11, NULL, '2024-09-12 13:46:52.067', NULL, '2024-09-12 13:49:54.378', 0);
INSERT INTO `sys_role_menu`
VALUES (12, 1, 12, NULL, '2024-09-12 13:46:52.067', NULL, '2024-09-12 13:49:54.383', 0);
INSERT INTO `sys_role_menu`
VALUES (13, 1, 13, NULL, '2024-09-12 13:46:52.069', NULL, '2024-09-12 13:49:54.399', 0);
INSERT INTO `sys_role_menu`
VALUES (14, 1, 14, NULL, '2024-09-12 13:46:52.070', NULL, '2024-09-12 13:49:54.409', 0);
INSERT INTO `sys_role_menu`
VALUES (15, 1, 15, NULL, '2024-09-12 13:46:52.070', NULL, '2024-09-12 13:49:54.413', 0);
INSERT INTO `sys_role_menu`
VALUES (16, 1, 16, NULL, '2024-09-12 13:46:52.071', NULL, '2024-09-12 13:49:54.418', 0);
INSERT INTO `sys_role_menu`
VALUES (17, 1, 17, NULL, '2024-09-12 13:46:52.072', NULL, '2024-09-12 13:49:54.424', 0);
INSERT INTO `sys_role_menu`
VALUES (18, 1, 18, NULL, '2024-09-12 13:46:52.072', NULL, '2024-09-12 13:49:54.429', 0);
INSERT INTO `sys_role_menu`
VALUES (19, 1, 19, NULL, '2024-09-12 13:46:52.072', NULL, '2024-09-12 13:49:54.433', 0);
INSERT INTO `sys_role_menu`
VALUES (20, 1, 20, NULL, '2024-09-12 13:46:52.073', NULL, '2024-09-12 13:49:54.441', 0);
INSERT INTO `sys_role_menu`
VALUES (21, 1, 21, NULL, '2024-09-12 13:46:52.073', NULL, '2024-09-12 13:49:54.445', 0);
INSERT INTO `sys_role_menu`
VALUES (22, 1, 22, NULL, '2024-09-12 13:46:52.074', NULL, '2024-09-12 13:49:54.450', 0);
INSERT INTO `sys_role_menu`
VALUES (23, 1, 23, NULL, '2024-09-12 13:46:52.074', NULL, '2024-09-12 13:49:54.454', 0);
INSERT INTO `sys_role_menu`
VALUES (24, 1, 24, NULL, '2024-09-12 13:46:52.074', NULL, '2024-09-12 13:49:54.458', 0);
INSERT INTO `sys_role_menu`
VALUES (25, 1, 25, NULL, '2024-09-12 13:46:52.075', NULL, '2024-09-12 13:49:54.463', 0);
INSERT INTO `sys_role_menu`
VALUES (26, 1, 26, NULL, '2024-09-12 13:46:52.075', NULL, '2024-09-12 13:49:54.469', 0);
INSERT INTO `sys_role_menu`
VALUES (27, 1, 27, NULL, '2024-09-12 13:46:52.075', NULL, '2024-09-12 13:49:54.475', 0);
INSERT INTO `sys_role_menu`
VALUES (28, 1, 28, NULL, '2024-09-12 13:46:52.076', NULL, '2024-09-12 13:49:54.480', 0);
INSERT INTO `sys_role_menu`
VALUES (29, 1, 29, NULL, '2024-09-12 13:46:52.076', NULL, '2024-09-12 13:49:54.484', 0);
INSERT INTO `sys_role_menu`
VALUES (30, 1, 30, NULL, '2024-09-12 13:46:52.076', NULL, '2024-09-12 13:49:54.489', 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `username`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '账号',
    `password`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `email`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `phone`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
    `client`      char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '所属客户端',
    `status`      char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '账号状态',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `index_username_del`(`username` ASC, `del` ASC) USING BTREE COMMENT '用户名+逻辑删除唯一',
    INDEX         `index_phone_del`(`phone` ASC, `del` ASC) USING BTREE COMMENT '手机号+逻辑删除索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1706931386700636177 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账号信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 'admin', '$2a$10$ctagQJswnSwUyl/akFuFFeLyRO/ffMxuK2HhnzM29w9lfBLoZCU82', NULL, '13300006666', 'ADMIN',
        'NORMAL', NULL, '2022-10-07 10:16:26.000', NULL, '2024-09-12 12:38:41.941', 0);

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`
(
    `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint UNSIGNED NOT NULL COMMENT '用户信息ID',
    `nickname`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号昵称',
    `avatar`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
    `sex`         char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
    `id_card`     char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info`
VALUES (1, 1, 'admin', 'test/2023/12/08/102816_***REMOVE_SECRET***.jpeg', '1', NULL, NULL, NULL, NULL,
        NULL, '2024-09-12 11:44:18.926', 0);

-- ----------------------------
-- Table structure for sys_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_notice`;
CREATE TABLE `sys_user_notice`
(
    `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint NOT NULL COMMENT '接受用户ID',
    `notice_id`   bigint NOT NULL COMMENT '消息ID',
    `status`      int UNSIGNED NOT NULL DEFAULT 9 COMMENT '阅读状态',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户消息关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org`
(
    `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint UNSIGNED NOT NULL COMMENT '用户id',
    `org_id`      bigint UNSIGNED NOT NULL COMMENT '机构id',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户->机构关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
INSERT INTO `sys_user_org`
VALUES (1, 1, 1, NULL, NULL, NULL, '2024-09-12 12:42:07.868', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `id`          bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint UNSIGNED NOT NULL COMMENT '用户ID',
    `role_id`     bigint UNSIGNED NOT NULL COMMENT '角色ID',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户->角色关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1, 1, NULL, NULL, NULL, '2024-09-12 12:43:39.845', 0);

SET
FOREIGN_KEY_CHECKS = 1;