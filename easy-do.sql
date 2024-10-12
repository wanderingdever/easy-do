/*
 Navicat Premium Dump SQL

 Source Server         : 本地-192.168.5.111-3124
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 192.168.5.111:3124
 Source Schema         : easy-do

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 12/10/2024 10:58:04
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统参数配置' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据' ROW_FORMAT = DYNAMIC;

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
VALUES (14, 6, 'system_client', 'WEB', 'WEB', 2, '', 'default', 1, '1701847090820464641', '2023-11-30 13:52:37.000',
        NULL, '2024-10-09 16:38:57.000', 0);
INSERT INTO `sys_dict_data`
VALUES (15, 6, 'system_client', 'APP', 'APP', 3, '', 'default', 1, '1701847090820464641', '2023-11-30 13:52:44.000',
        NULL, '2024-10-09 16:39:00.000', 0);
INSERT INTO `sys_dict_data`
VALUES (16, 6, 'system_client', '管理端', 'ADMIN', 1, '', 'default', 1, '1701847090820464641',
        '2023-11-30 13:53:14.000', NULL, '2024-10-09 16:38:52.000', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型' ROW_FORMAT = DYNAMIC;

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
    `del`         tinyint                                                       NOT NULL DEFAULT 0 COMMENT '逻辑删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_record
-- ----------------------------
INSERT INTO `sys_file_record`
VALUES (19, '熊猫上班.png', '2024/10/10/102301_熊猫上班.png', 'png', '151121', NULL, '2024-10-10 10:23:02.000', NULL,
        NULL, 0);

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
    `del`         tinyint                                                      NOT NULL DEFAULT 0 COMMENT '逻辑删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1855 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_login_logs`
VALUES (381, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:24:16.000', '1', NULL, '2024-09-26 16:24:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (382, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:39:57.000', '1', NULL, '2024-09-26 16:39:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (383, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:39:58.000', '1', NULL, '2024-09-26 16:39:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (384, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:45:04.000', '1', NULL, '2024-09-26 16:45:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (385, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:45:56.000', '1', NULL, '2024-09-26 16:45:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (386, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:46:24.000', '1', NULL, '2024-09-26 16:46:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (387, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:46:39.000', '1', NULL, '2024-09-26 16:46:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (388, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:49:11.000', '1', NULL, '2024-09-26 16:49:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (389, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:49:26.000', '1', NULL, '2024-09-26 16:49:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (390, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:51:10.000', '1', NULL, '2024-09-26 16:51:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (391, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:51:16.000', '1', NULL, '2024-09-26 16:51:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (392, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:56:44.000', '1', NULL, '2024-09-26 16:56:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (393, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:56:51.000', '1', NULL, '2024-09-26 16:56:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (394, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 16:56:52.000', '1', NULL, '2024-09-26 16:56:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (395, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 17:01:31.000', '1', NULL, '2024-09-26 17:01:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (396, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 17:02:54.000', '1', NULL, '2024-09-26 17:02:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (397, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 17:02:59.000', '1', NULL, '2024-09-26 17:02:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (398, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 17:03:08.000', '1', NULL, '2024-09-26 17:03:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (399, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 17:04:39.000', '1', NULL, '2024-09-26 17:04:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (400, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-26 17:05:00.000', '1', NULL, '2024-09-26 17:05:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (401, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 09:58:58.000', '1', NULL, '2024-09-27 09:58:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (402, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 09:58:58.000', '1', NULL, '2024-09-27 09:58:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (403, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:00:21.000', '1', NULL, '2024-09-27 10:00:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (404, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:15:07.000', '1', NULL, '2024-09-27 10:15:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (405, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:26:13.000', '1', NULL, '2024-09-27 10:26:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (406, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:28:29.000', '1', NULL, '2024-09-27 10:28:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (407, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:30:06.000', '1', NULL, '2024-09-27 10:30:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (408, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:33:13.000', '1', NULL, '2024-09-27 10:33:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (409, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:33:59.000', '1', NULL, '2024-09-27 10:33:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (410, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:39:16.000', '1', NULL, '2024-09-27 10:39:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (411, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:42:19.000', '1', NULL, '2024-09-27 10:42:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (412, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:42:27.000', '1', NULL, '2024-09-27 10:42:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (413, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:46:39.000', '1', NULL, '2024-09-27 10:46:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (414, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:47:25.000', '1', NULL, '2024-09-27 10:47:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (415, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:49:12.000', '1', NULL, '2024-09-27 10:49:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (416, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:53:25.000', '1', NULL, '2024-09-27 10:53:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (417, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:55:02.000', '1', NULL, '2024-09-27 10:55:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (418, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 10:57:07.000', '1', NULL, '2024-09-27 10:57:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (419, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:01:40.000', '1', NULL, '2024-09-27 11:01:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (420, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:01:46.000', '1', NULL, '2024-09-27 11:01:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (421, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:03:27.000', '1', NULL, '2024-09-27 11:03:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (422, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:17:42.000', '1', NULL, '2024-09-27 11:17:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (423, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:19:10.000', '1', NULL, '2024-09-27 11:19:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (424, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:21:35.000', '1', NULL, '2024-09-27 11:21:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (425, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:22:50.000', '1', NULL, '2024-09-27 11:22:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (426, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:23:09.000', '1', NULL, '2024-09-27 11:23:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (427, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:24:03.000', '1', NULL, '2024-09-27 11:24:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (428, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:24:10.000', '1', NULL, '2024-09-27 11:24:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (429, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:27:47.000', '1', NULL, '2024-09-27 11:27:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (430, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:30:33.000', '1', NULL, '2024-09-27 11:30:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (431, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:30:33.000', '1', NULL, '2024-09-27 11:30:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (432, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:30:33.000', '1', NULL, '2024-09-27 11:30:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (433, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:35:56.000', '1', NULL, '2024-09-27 11:35:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (434, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:38:36.000', '1', NULL, '2024-09-27 11:38:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (435, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:39:55.000', '1', NULL, '2024-09-27 11:39:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (436, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:40:05.000', '1', NULL, '2024-09-27 11:40:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (437, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:40:40.000', '1', NULL, '2024-09-27 11:40:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (438, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:40:58.000', '1', NULL, '2024-09-27 11:40:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (439, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:42:17.000', '1', NULL, '2024-09-27 11:42:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (440, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:42:59.000', '1', NULL, '2024-09-27 11:42:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (441, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:44:02.000', '1', NULL, '2024-09-27 11:44:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (442, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:44:28.000', '1', NULL, '2024-09-27 11:44:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (443, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:44:32.000', '1', NULL, '2024-09-27 11:44:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (444, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:44:50.000', '1', NULL, '2024-09-27 11:44:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (445, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:45:17.000', '1', NULL, '2024-09-27 11:45:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (446, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:46:07.000', '1', NULL, '2024-09-27 11:46:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (447, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:46:41.000', '1', NULL, '2024-09-27 11:46:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (448, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:47:02.000', '1', NULL, '2024-09-27 11:47:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (449, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:47:14.000', '1', NULL, '2024-09-27 11:47:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (450, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:47:52.000', '1', NULL, '2024-09-27 11:47:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (451, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:48:51.000', '1', NULL, '2024-09-27 11:48:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (452, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:49:02.000', '1', NULL, '2024-09-27 11:49:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (453, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:49:29.000', '1', NULL, '2024-09-27 11:49:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (454, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:50:06.000', '1', NULL, '2024-09-27 11:50:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (455, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:50:15.000', '1', NULL, '2024-09-27 11:50:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (456, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:51:28.000', '1', NULL, '2024-09-27 11:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (457, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:52:32.000', '1', NULL, '2024-09-27 11:52:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (458, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:53:52.000', '1', NULL, '2024-09-27 11:53:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (459, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:54:03.000', '1', NULL, '2024-09-27 11:54:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (460, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:54:47.000', '1', NULL, '2024-09-27 11:54:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (461, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:54:50.000', '1', NULL, '2024-09-27 11:54:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (462, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:54:54.000', '1', NULL, '2024-09-27 11:54:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (463, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:55:17.000', '1', NULL, '2024-09-27 11:55:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (464, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:55:22.000', '1', NULL, '2024-09-27 11:55:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (465, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:55:27.000', '1', NULL, '2024-09-27 11:55:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (466, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:55:50.000', '1', NULL, '2024-09-27 11:55:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (467, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:55:54.000', '1', NULL, '2024-09-27 11:55:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (468, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:57:32.000', '1', NULL, '2024-09-27 11:57:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (469, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:57:40.000', '1', NULL, '2024-09-27 11:57:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (470, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:57:47.000', '1', NULL, '2024-09-27 11:57:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (471, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:58:04.000', '1', NULL, '2024-09-27 11:58:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (472, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 11:58:10.000', '1', NULL, '2024-09-27 11:58:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (473, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:38:41.000', '1', NULL, '2024-09-27 13:38:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (474, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:48:06.000', '1', NULL, '2024-09-27 13:48:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (475, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:48:46.000', '1', NULL, '2024-09-27 13:48:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (476, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:49:34.000', '1', NULL, '2024-09-27 13:49:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (477, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:50:03.000', '1', NULL, '2024-09-27 13:50:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (478, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:50:19.000', '1', NULL, '2024-09-27 13:50:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (479, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:50:29.000', '1', NULL, '2024-09-27 13:50:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (480, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:52:21.000', '1', NULL, '2024-09-27 13:52:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (481, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:52:24.000', '1', NULL, '2024-09-27 13:52:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (482, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:59:21.000', '1', NULL, '2024-09-27 13:59:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (483, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 13:59:37.000', '1', NULL, '2024-09-27 13:59:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (484, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:02:39.000', '1', NULL, '2024-09-27 14:02:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (485, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:03:10.000', '1', NULL, '2024-09-27 14:03:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (486, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:32:43.000', '1', NULL, '2024-09-27 14:32:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (487, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:32:44.000', '1', NULL, '2024-09-27 14:32:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (488, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:33:01.000', '1', NULL, '2024-09-27 14:33:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (489, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:33:06.000', '1', NULL, '2024-09-27 14:33:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (490, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:33:56.000', '1', NULL, '2024-09-27 14:33:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (491, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:07.000', '1', NULL, '2024-09-27 14:34:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (492, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:13.000', '1', NULL, '2024-09-27 14:34:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (493, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:14.000', '1', NULL, '2024-09-27 14:34:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (494, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:15.000', '1', NULL, '2024-09-27 14:34:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (495, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:15.000', '1', NULL, '2024-09-27 14:34:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (496, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:15.000', '1', NULL, '2024-09-27 14:34:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (497, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:15.000', '1', NULL, '2024-09-27 14:34:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (498, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:15.000', '1', NULL, '2024-09-27 14:34:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (499, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:15.000', '1', NULL, '2024-09-27 14:34:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (500, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:15.000', '1', NULL, '2024-09-27 14:34:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (501, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:15.000', '1', NULL, '2024-09-27 14:34:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (502, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:16.000', '1', NULL, '2024-09-27 14:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (503, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:16.000', '1', NULL, '2024-09-27 14:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (504, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:16.000', '1', NULL, '2024-09-27 14:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (505, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:16.000', '1', NULL, '2024-09-27 14:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (506, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:16.000', '1', NULL, '2024-09-27 14:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (507, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:16.000', '1', NULL, '2024-09-27 14:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (508, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:16.000', '1', NULL, '2024-09-27 14:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (509, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:16.000', '1', NULL, '2024-09-27 14:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (510, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:16.000', '1', NULL, '2024-09-27 14:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (511, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:17.000', '1', NULL, '2024-09-27 14:34:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (512, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:17.000', '1', NULL, '2024-09-27 14:34:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (513, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:17.000', '1', NULL, '2024-09-27 14:34:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (514, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:17.000', '1', NULL, '2024-09-27 14:34:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (515, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:17.000', '1', NULL, '2024-09-27 14:34:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (516, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:17.000', '1', NULL, '2024-09-27 14:34:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (517, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:17.000', '1', NULL, '2024-09-27 14:34:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (518, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:17.000', '1', NULL, '2024-09-27 14:34:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (519, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:17.000', '1', NULL, '2024-09-27 14:34:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (520, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:18.000', '1', NULL, '2024-09-27 14:34:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (521, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:18.000', '1', NULL, '2024-09-27 14:34:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (522, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:18.000', '1', NULL, '2024-09-27 14:34:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (523, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:18.000', '1', NULL, '2024-09-27 14:34:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (524, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:18.000', '1', NULL, '2024-09-27 14:34:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (525, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:20.000', '1', NULL, '2024-09-27 14:34:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (526, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:20.000', '1', NULL, '2024-09-27 14:34:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (527, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (528, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (529, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (530, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (531, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (532, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (533, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (534, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (535, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (536, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:21.000', '1', NULL, '2024-09-27 14:34:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (537, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:22.000', '1', NULL, '2024-09-27 14:34:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (538, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:22.000', '1', NULL, '2024-09-27 14:34:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (539, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:22.000', '1', NULL, '2024-09-27 14:34:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (540, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:22.000', '1', NULL, '2024-09-27 14:34:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (541, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:22.000', '1', NULL, '2024-09-27 14:34:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (542, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:22.000', '1', NULL, '2024-09-27 14:34:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (543, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:22.000', '1', NULL, '2024-09-27 14:34:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (544, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:23.000', '1', NULL, '2024-09-27 14:34:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (545, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:23.000', '1', NULL, '2024-09-27 14:34:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (546, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:23.000', '1', NULL, '2024-09-27 14:34:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (547, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:23.000', '1', NULL, '2024-09-27 14:34:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (548, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:23.000', '1', NULL, '2024-09-27 14:34:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (549, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:23.000', '1', NULL, '2024-09-27 14:34:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (550, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (551, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (552, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (553, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (554, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (555, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (556, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (557, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (558, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (559, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (560, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:24.000', '1', NULL, '2024-09-27 14:34:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (561, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:25.000', '1', NULL, '2024-09-27 14:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (562, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:25.000', '1', NULL, '2024-09-27 14:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (563, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:25.000', '1', NULL, '2024-09-27 14:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (564, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:25.000', '1', NULL, '2024-09-27 14:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (565, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:25.000', '1', NULL, '2024-09-27 14:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (566, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:25.000', '1', NULL, '2024-09-27 14:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (567, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:25.000', '1', NULL, '2024-09-27 14:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (568, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:25.000', '1', NULL, '2024-09-27 14:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (569, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:25.000', '1', NULL, '2024-09-27 14:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (570, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:26.000', '1', NULL, '2024-09-27 14:34:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (571, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:26.000', '1', NULL, '2024-09-27 14:34:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (572, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:26.000', '1', NULL, '2024-09-27 14:34:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (573, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:26.000', '1', NULL, '2024-09-27 14:34:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (574, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:26.000', '1', NULL, '2024-09-27 14:34:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (575, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:29.000', '1', NULL, '2024-09-27 14:34:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (576, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:29.000', '1', NULL, '2024-09-27 14:34:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (577, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:29.000', '1', NULL, '2024-09-27 14:34:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (578, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:29.000', '1', NULL, '2024-09-27 14:34:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (579, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:29.000', '1', NULL, '2024-09-27 14:34:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (580, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:29.000', '1', NULL, '2024-09-27 14:34:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (581, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (582, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (583, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (584, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (585, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (586, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (587, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (588, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (589, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (590, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:30.000', '1', NULL, '2024-09-27 14:34:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (591, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (592, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (593, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (594, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (595, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (596, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (597, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (598, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (599, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (600, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:31.000', '1', NULL, '2024-09-27 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (601, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:32.000', '1', NULL, '2024-09-27 14:34:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (602, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:32.000', '1', NULL, '2024-09-27 14:34:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (603, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:32.000', '1', NULL, '2024-09-27 14:34:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (604, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:32.000', '1', NULL, '2024-09-27 14:34:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (605, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:32.000', '1', NULL, '2024-09-27 14:34:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (606, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:40.000', '1', NULL, '2024-09-27 14:34:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (607, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:40.000', '1', NULL, '2024-09-27 14:34:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (608, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:40.000', '1', NULL, '2024-09-27 14:34:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (609, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:40.000', '1', NULL, '2024-09-27 14:34:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (610, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:40.000', '1', NULL, '2024-09-27 14:34:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (611, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:40.000', '1', NULL, '2024-09-27 14:34:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (612, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:40.000', '1', NULL, '2024-09-27 14:34:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (613, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:40.000', '1', NULL, '2024-09-27 14:34:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (614, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:41.000', '1', NULL, '2024-09-27 14:34:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (615, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:41.000', '1', NULL, '2024-09-27 14:34:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (616, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:41.000', '1', NULL, '2024-09-27 14:34:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (617, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:41.000', '1', NULL, '2024-09-27 14:34:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (618, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:41.000', '1', NULL, '2024-09-27 14:34:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (619, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:41.000', '1', NULL, '2024-09-27 14:34:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (620, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:41.000', '1', NULL, '2024-09-27 14:34:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (621, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:41.000', '1', NULL, '2024-09-27 14:34:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (622, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:41.000', '1', NULL, '2024-09-27 14:34:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (623, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:42.000', '1', NULL, '2024-09-27 14:34:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (624, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:42.000', '1', NULL, '2024-09-27 14:34:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (625, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:42.000', '1', NULL, '2024-09-27 14:34:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (626, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:42.000', '1', NULL, '2024-09-27 14:34:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (627, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:42.000', '1', NULL, '2024-09-27 14:34:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (628, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:42.000', '1', NULL, '2024-09-27 14:34:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (629, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:42.000', '1', NULL, '2024-09-27 14:34:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (630, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:42.000', '1', NULL, '2024-09-27 14:34:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (631, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:42.000', '1', NULL, '2024-09-27 14:34:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (632, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:43.000', '1', NULL, '2024-09-27 14:34:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (633, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:43.000', '1', NULL, '2024-09-27 14:34:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (634, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:43.000', '1', NULL, '2024-09-27 14:34:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (635, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:43.000', '1', NULL, '2024-09-27 14:34:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (636, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:43.000', '1', NULL, '2024-09-27 14:34:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (637, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:52.000', '1', NULL, '2024-09-27 14:34:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (638, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:52.000', '1', NULL, '2024-09-27 14:34:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (639, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:52.000', '1', NULL, '2024-09-27 14:34:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (640, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:52.000', '1', NULL, '2024-09-27 14:34:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (641, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:52.000', '1', NULL, '2024-09-27 14:34:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (642, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:52.000', '1', NULL, '2024-09-27 14:34:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (643, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (644, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (645, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (646, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (647, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (648, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (649, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (650, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (651, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (652, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:53.000', '1', NULL, '2024-09-27 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (653, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:54.000', '1', NULL, '2024-09-27 14:34:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (654, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:54.000', '1', NULL, '2024-09-27 14:34:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (655, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:54.000', '1', NULL, '2024-09-27 14:34:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (656, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:54.000', '1', NULL, '2024-09-27 14:34:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (657, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:54.000', '1', NULL, '2024-09-27 14:34:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (658, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:54.000', '1', NULL, '2024-09-27 14:34:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (659, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:54.000', '1', NULL, '2024-09-27 14:34:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (660, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:54.000', '1', NULL, '2024-09-27 14:34:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (661, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:54.000', '1', NULL, '2024-09-27 14:34:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (662, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:55.000', '1', NULL, '2024-09-27 14:34:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (663, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:55.000', '1', NULL, '2024-09-27 14:34:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (664, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:55.000', '1', NULL, '2024-09-27 14:34:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (665, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:55.000', '1', NULL, '2024-09-27 14:34:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (666, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:55.000', '1', NULL, '2024-09-27 14:34:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (667, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:55.000', '1', NULL, '2024-09-27 14:34:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (668, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:56.000', '1', NULL, '2024-09-27 14:34:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (669, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:56.000', '1', NULL, '2024-09-27 14:34:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (670, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:56.000', '1', NULL, '2024-09-27 14:34:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (671, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:56.000', '1', NULL, '2024-09-27 14:34:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (672, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:56.000', '1', NULL, '2024-09-27 14:34:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (673, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:56.000', '1', NULL, '2024-09-27 14:34:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (674, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (675, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (676, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (677, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (678, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (679, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (680, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (681, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (682, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (683, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:57.000', '1', NULL, '2024-09-27 14:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (684, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (685, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (686, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (687, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (688, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (689, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (690, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (691, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (692, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (693, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:58.000', '1', NULL, '2024-09-27 14:34:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (694, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:59.000', '1', NULL, '2024-09-27 14:34:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (695, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:59.000', '1', NULL, '2024-09-27 14:34:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (696, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:59.000', '1', NULL, '2024-09-27 14:34:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (697, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:59.000', '1', NULL, '2024-09-27 14:34:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (698, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:34:59.000', '1', NULL, '2024-09-27 14:34:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (699, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:33.000', '1', NULL, '2024-09-27 14:35:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (700, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:34.000', '1', NULL, '2024-09-27 14:35:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (701, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:34.000', '1', NULL, '2024-09-27 14:35:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (702, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:34.000', '1', NULL, '2024-09-27 14:35:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (703, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:34.000', '1', NULL, '2024-09-27 14:35:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (704, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:34.000', '1', NULL, '2024-09-27 14:35:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (705, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:34.000', '1', NULL, '2024-09-27 14:35:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (706, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:34.000', '1', NULL, '2024-09-27 14:35:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (707, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:34.000', '1', NULL, '2024-09-27 14:35:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (708, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:34.000', '1', NULL, '2024-09-27 14:35:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (709, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:35.000', '1', NULL, '2024-09-27 14:35:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (710, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:35.000', '1', NULL, '2024-09-27 14:35:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (711, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:35.000', '1', NULL, '2024-09-27 14:35:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (712, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:35.000', '1', NULL, '2024-09-27 14:35:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (713, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:35.000', '1', NULL, '2024-09-27 14:35:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (714, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:35.000', '1', NULL, '2024-09-27 14:35:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (715, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:35.000', '1', NULL, '2024-09-27 14:35:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (716, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:35.000', '1', NULL, '2024-09-27 14:35:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (717, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:35.000', '1', NULL, '2024-09-27 14:35:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (718, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (719, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (720, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (721, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (722, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (723, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (724, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (725, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (726, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (727, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:36.000', '1', NULL, '2024-09-27 14:35:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (728, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:37.000', '1', NULL, '2024-09-27 14:35:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (729, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:37.000', '1', NULL, '2024-09-27 14:35:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (730, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:46.000', '1', NULL, '2024-09-27 14:35:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (731, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:46.000', '1', NULL, '2024-09-27 14:35:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (732, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:46.000', '1', NULL, '2024-09-27 14:35:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (733, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:46.000', '1', NULL, '2024-09-27 14:35:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (734, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:46.000', '1', NULL, '2024-09-27 14:35:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (735, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:47.000', '1', NULL, '2024-09-27 14:35:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (736, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:47.000', '1', NULL, '2024-09-27 14:35:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (737, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:47.000', '1', NULL, '2024-09-27 14:35:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (738, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:47.000', '1', NULL, '2024-09-27 14:35:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (739, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:47.000', '1', NULL, '2024-09-27 14:35:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (740, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:47.000', '1', NULL, '2024-09-27 14:35:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (741, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:47.000', '1', NULL, '2024-09-27 14:35:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (742, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:47.000', '1', NULL, '2024-09-27 14:35:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (743, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:47.000', '1', NULL, '2024-09-27 14:35:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (744, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (745, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (746, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (747, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (748, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (749, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (750, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (751, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (752, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (753, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:48.000', '1', NULL, '2024-09-27 14:35:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (754, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:49.000', '1', NULL, '2024-09-27 14:35:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (755, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:49.000', '1', NULL, '2024-09-27 14:35:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (756, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:49.000', '1', NULL, '2024-09-27 14:35:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (757, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:49.000', '1', NULL, '2024-09-27 14:35:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (758, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:49.000', '1', NULL, '2024-09-27 14:35:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (759, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:49.000', '1', NULL, '2024-09-27 14:35:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (760, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:35:49.000', '1', NULL, '2024-09-27 14:35:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (761, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:15.000', '1', NULL, '2024-09-27 14:36:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (762, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:15.000', '1', NULL, '2024-09-27 14:36:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (763, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:15.000', '1', NULL, '2024-09-27 14:36:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (764, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:15.000', '1', NULL, '2024-09-27 14:36:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (765, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:15.000', '1', NULL, '2024-09-27 14:36:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (766, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:15.000', '1', NULL, '2024-09-27 14:36:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (767, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:15.000', '1', NULL, '2024-09-27 14:36:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (768, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:15.000', '1', NULL, '2024-09-27 14:36:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (769, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:16.000', '1', NULL, '2024-09-27 14:36:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (770, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:16.000', '1', NULL, '2024-09-27 14:36:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (771, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:16.000', '1', NULL, '2024-09-27 14:36:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (772, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:16.000', '1', NULL, '2024-09-27 14:36:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (773, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:16.000', '1', NULL, '2024-09-27 14:36:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (774, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:16.000', '1', NULL, '2024-09-27 14:36:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (775, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:16.000', '1', NULL, '2024-09-27 14:36:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (776, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:16.000', '1', NULL, '2024-09-27 14:36:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (777, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (778, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (779, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (780, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (781, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (782, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (783, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (784, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (785, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (786, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:17.000', '1', NULL, '2024-09-27 14:36:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (787, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:18.000', '1', NULL, '2024-09-27 14:36:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (788, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:18.000', '1', NULL, '2024-09-27 14:36:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (789, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:18.000', '1', NULL, '2024-09-27 14:36:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (790, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:18.000', '1', NULL, '2024-09-27 14:36:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (791, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:18.000', '1', NULL, '2024-09-27 14:36:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (792, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (793, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (794, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (795, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (796, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (797, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (798, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (799, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (800, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (801, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:25.000', '1', NULL, '2024-09-27 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (802, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (803, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (804, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (805, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (806, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (807, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (808, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (809, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (810, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (811, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:26.000', '1', NULL, '2024-09-27 14:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (812, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (813, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (814, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (815, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (816, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (817, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (818, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (819, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (820, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (821, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:27.000', '1', NULL, '2024-09-27 14:36:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (822, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:28.000', '1', NULL, '2024-09-27 14:36:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (823, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:49.000', '1', NULL, '2024-09-27 14:36:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (824, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:50.000', '1', NULL, '2024-09-27 14:36:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (825, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:50.000', '1', NULL, '2024-09-27 14:36:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (826, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:50.000', '1', NULL, '2024-09-27 14:36:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (827, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:50.000', '1', NULL, '2024-09-27 14:36:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (828, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:50.000', '1', NULL, '2024-09-27 14:36:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (829, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:50.000', '1', NULL, '2024-09-27 14:36:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (830, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:50.000', '1', NULL, '2024-09-27 14:36:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (831, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:50.000', '1', NULL, '2024-09-27 14:36:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (832, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:50.000', '1', NULL, '2024-09-27 14:36:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (833, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:51.000', '1', NULL, '2024-09-27 14:36:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (834, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:51.000', '1', NULL, '2024-09-27 14:36:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (835, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:51.000', '1', NULL, '2024-09-27 14:36:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (836, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:51.000', '1', NULL, '2024-09-27 14:36:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (837, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:51.000', '1', NULL, '2024-09-27 14:36:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (838, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:51.000', '1', NULL, '2024-09-27 14:36:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (839, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:51.000', '1', NULL, '2024-09-27 14:36:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (840, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:51.000', '1', NULL, '2024-09-27 14:36:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (841, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:51.000', '1', NULL, '2024-09-27 14:36:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (842, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (843, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (844, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (845, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (846, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (847, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (848, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (849, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (850, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (851, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (852, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:52.000', '1', NULL, '2024-09-27 14:36:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (853, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:36:53.000', '1', NULL, '2024-09-27 14:36:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (854, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:03.000', '1', NULL, '2024-09-27 14:37:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (855, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:04.000', '1', NULL, '2024-09-27 14:37:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (856, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:04.000', '1', NULL, '2024-09-27 14:37:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (857, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:04.000', '1', NULL, '2024-09-27 14:37:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (858, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:04.000', '1', NULL, '2024-09-27 14:37:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (859, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:04.000', '1', NULL, '2024-09-27 14:37:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (860, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:04.000', '1', NULL, '2024-09-27 14:37:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (861, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:05.000', '1', NULL, '2024-09-27 14:37:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (862, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:05.000', '1', NULL, '2024-09-27 14:37:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (863, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:05.000', '1', NULL, '2024-09-27 14:37:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (864, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:05.000', '1', NULL, '2024-09-27 14:37:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (865, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:05.000', '1', NULL, '2024-09-27 14:37:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (866, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:05.000', '1', NULL, '2024-09-27 14:37:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (867, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:05.000', '1', NULL, '2024-09-27 14:37:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (868, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:05.000', '1', NULL, '2024-09-27 14:37:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (869, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:05.000', '1', NULL, '2024-09-27 14:37:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (870, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:06.000', '1', NULL, '2024-09-27 14:37:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (871, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:06.000', '1', NULL, '2024-09-27 14:37:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (872, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:06.000', '1', NULL, '2024-09-27 14:37:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (873, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:06.000', '1', NULL, '2024-09-27 14:37:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (874, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:07.000', '1', NULL, '2024-09-27 14:37:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (875, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:07.000', '1', NULL, '2024-09-27 14:37:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (876, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:07.000', '1', NULL, '2024-09-27 14:37:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (877, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:07.000', '1', NULL, '2024-09-27 14:37:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (878, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:07.000', '1', NULL, '2024-09-27 14:37:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (879, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:07.000', '1', NULL, '2024-09-27 14:37:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (880, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:07.000', '1', NULL, '2024-09-27 14:37:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (881, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:07.000', '1', NULL, '2024-09-27 14:37:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (882, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:07.000', '1', NULL, '2024-09-27 14:37:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (883, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:08.000', '1', NULL, '2024-09-27 14:37:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (884, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:08.000', '1', NULL, '2024-09-27 14:37:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (885, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:37:08.000', '1', NULL, '2024-09-27 14:37:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (886, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:12.000', '1', NULL, '2024-09-27 14:39:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (887, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:12.000', '1', NULL, '2024-09-27 14:39:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (888, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:12.000', '1', NULL, '2024-09-27 14:39:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (889, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:12.000', '1', NULL, '2024-09-27 14:39:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (890, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:12.000', '1', NULL, '2024-09-27 14:39:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (891, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:12.000', '1', NULL, '2024-09-27 14:39:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (892, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:12.000', '1', NULL, '2024-09-27 14:39:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (893, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:13.000', '1', NULL, '2024-09-27 14:39:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (894, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:13.000', '1', NULL, '2024-09-27 14:39:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (895, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:13.000', '1', NULL, '2024-09-27 14:39:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (896, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:13.000', '1', NULL, '2024-09-27 14:39:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (897, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:13.000', '1', NULL, '2024-09-27 14:39:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (898, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:13.000', '1', NULL, '2024-09-27 14:39:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (899, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:13.000', '1', NULL, '2024-09-27 14:39:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (900, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:13.000', '1', NULL, '2024-09-27 14:39:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (901, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:13.000', '1', NULL, '2024-09-27 14:39:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (902, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (903, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (904, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (905, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (906, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (907, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (908, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (909, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (910, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (911, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:14.000', '1', NULL, '2024-09-27 14:39:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (912, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:15.000', '1', NULL, '2024-09-27 14:39:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (913, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:15.000', '1', NULL, '2024-09-27 14:39:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (914, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:15.000', '1', NULL, '2024-09-27 14:39:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (915, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:15.000', '1', NULL, '2024-09-27 14:39:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (916, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:15.000', '1', NULL, '2024-09-27 14:39:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (917, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:17.000', '1', NULL, '2024-09-27 14:39:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (918, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:17.000', '1', NULL, '2024-09-27 14:39:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (919, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:17.000', '1', NULL, '2024-09-27 14:39:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (920, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:17.000', '1', NULL, '2024-09-27 14:39:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (921, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:17.000', '1', NULL, '2024-09-27 14:39:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (922, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:17.000', '1', NULL, '2024-09-27 14:39:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (923, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:17.000', '1', NULL, '2024-09-27 14:39:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (924, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:17.000', '1', NULL, '2024-09-27 14:39:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (925, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:18.000', '1', NULL, '2024-09-27 14:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (926, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:18.000', '1', NULL, '2024-09-27 14:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (927, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:18.000', '1', NULL, '2024-09-27 14:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (928, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:18.000', '1', NULL, '2024-09-27 14:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (929, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:18.000', '1', NULL, '2024-09-27 14:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (930, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:18.000', '1', NULL, '2024-09-27 14:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (931, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:18.000', '1', NULL, '2024-09-27 14:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (932, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:18.000', '1', NULL, '2024-09-27 14:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (933, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:18.000', '1', NULL, '2024-09-27 14:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (934, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (935, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (936, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (937, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (938, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (939, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (940, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (941, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (942, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (943, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:19.000', '1', NULL, '2024-09-27 14:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (944, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:20.000', '1', NULL, '2024-09-27 14:39:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (945, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:20.000', '1', NULL, '2024-09-27 14:39:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (946, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:20.000', '1', NULL, '2024-09-27 14:39:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (947, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:20.000', '1', NULL, '2024-09-27 14:39:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (948, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:21.000', '1', NULL, '2024-09-27 14:39:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (949, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:22.000', '1', NULL, '2024-09-27 14:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (950, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:22.000', '1', NULL, '2024-09-27 14:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (951, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:22.000', '1', NULL, '2024-09-27 14:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (952, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:22.000', '1', NULL, '2024-09-27 14:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (953, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:22.000', '1', NULL, '2024-09-27 14:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (954, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:22.000', '1', NULL, '2024-09-27 14:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (955, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:22.000', '1', NULL, '2024-09-27 14:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (956, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:22.000', '1', NULL, '2024-09-27 14:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (957, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:22.000', '1', NULL, '2024-09-27 14:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (958, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (959, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (960, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (961, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (962, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (963, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (964, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (965, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (966, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (967, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:23.000', '1', NULL, '2024-09-27 14:39:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (968, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (969, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (970, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (971, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (972, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (973, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (974, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (975, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (976, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (977, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:24.000', '1', NULL, '2024-09-27 14:39:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (978, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:25.000', '1', NULL, '2024-09-27 14:39:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (979, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:29.000', '1', NULL, '2024-09-27 14:39:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (980, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:29.000', '1', NULL, '2024-09-27 14:39:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (981, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (982, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (983, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (984, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (985, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (986, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (987, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (988, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (989, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (990, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:30.000', '1', NULL, '2024-09-27 14:39:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (991, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (992, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (993, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (994, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (995, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (996, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (997, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (998, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (999, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1000, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:31.000', '1', NULL, '2024-09-27 14:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1001, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:32.000', '1', NULL, '2024-09-27 14:39:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1002, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:32.000', '1', NULL, '2024-09-27 14:39:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1003, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:32.000', '1', NULL, '2024-09-27 14:39:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1004, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:33.000', '1', NULL, '2024-09-27 14:39:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1005, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:33.000', '1', NULL, '2024-09-27 14:39:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1006, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:33.000', '1', NULL, '2024-09-27 14:39:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1007, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:33.000', '1', NULL, '2024-09-27 14:39:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1008, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:33.000', '1', NULL, '2024-09-27 14:39:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1009, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:33.000', '1', NULL, '2024-09-27 14:39:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1010, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:33.000', '1', NULL, '2024-09-27 14:39:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1011, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:33.000', '1', NULL, '2024-09-27 14:39:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1012, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1013, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1014, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1015, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1016, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1017, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1018, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1019, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1020, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1021, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:34.000', '1', NULL, '2024-09-27 14:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1022, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1023, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1024, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1025, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1026, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1027, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1028, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1029, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1030, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1031, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:35.000', '1', NULL, '2024-09-27 14:39:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1032, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:36.000', '1', NULL, '2024-09-27 14:39:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1033, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:39:36.000', '1', NULL, '2024-09-27 14:39:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1034, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:41:40.000', '1', NULL, '2024-09-27 14:41:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1035, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:42:14.000', '1', NULL, '2024-09-27 14:42:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1036, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:42:14.000', '1', NULL, '2024-09-27 14:42:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1037, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:44:37.000', '1', NULL, '2024-09-27 14:44:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1038, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:44:50.000', '1', NULL, '2024-09-27 14:44:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1039, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:44:51.000', '1', NULL, '2024-09-27 14:44:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1040, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:45:30.000', '1', NULL, '2024-09-27 14:45:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1041, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:45:31.000', '1', NULL, '2024-09-27 14:45:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1042, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:45:36.000', '1', NULL, '2024-09-27 14:45:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1043, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:45:47.000', '1', NULL, '2024-09-27 14:45:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1044, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:45:48.000', '1', NULL, '2024-09-27 14:45:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1045, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:47:55.000', '1', NULL, '2024-09-27 14:47:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1046, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:47:56.000', '1', NULL, '2024-09-27 14:47:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1047, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:47:57.000', '1', NULL, '2024-09-27 14:47:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1048, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:20.000', '1', NULL, '2024-09-27 14:48:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1049, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:20.000', '1', NULL, '2024-09-27 14:48:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1050, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:20.000', '1', NULL, '2024-09-27 14:48:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1051, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:20.000', '1', NULL, '2024-09-27 14:48:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1052, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:20.000', '1', NULL, '2024-09-27 14:48:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1053, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:20.000', '1', NULL, '2024-09-27 14:48:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1054, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:20.000', '1', NULL, '2024-09-27 14:48:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1055, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1056, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1057, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1058, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1059, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1060, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1061, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1062, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1063, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1064, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1065, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1066, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1067, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1068, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1069, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1070, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:21.000', '1', NULL, '2024-09-27 14:48:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1071, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1072, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1073, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1074, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1075, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1076, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1077, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1078, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1079, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1080, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1081, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1082, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1083, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1084, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1085, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1086, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1087, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1088, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1089, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:22.000', '1', NULL, '2024-09-27 14:48:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1090, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1091, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1092, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1093, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1094, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1095, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1096, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1097, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1098, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1099, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1100, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1101, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1102, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1103, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1104, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1105, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:23.000', '1', NULL, '2024-09-27 14:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1106, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:24.000', '1', NULL, '2024-09-27 14:48:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1107, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:24.000', '1', NULL, '2024-09-27 14:48:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1108, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:24.000', '1', NULL, '2024-09-27 14:48:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1109, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:24.000', '1', NULL, '2024-09-27 14:48:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1110, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:24.000', '1', NULL, '2024-09-27 14:48:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1111, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:48:24.000', '1', NULL, '2024-09-27 14:48:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1112, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:50:00.000', '1', NULL, '2024-09-27 14:50:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1113, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:50:01.000', '1', NULL, '2024-09-27 14:50:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1114, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:50:02.000', '1', NULL, '2024-09-27 14:50:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1115, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:50:37.000', '1', NULL, '2024-09-27 14:50:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1116, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:50:37.000', '1', NULL, '2024-09-27 14:50:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1117, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:50:38.000', '1', NULL, '2024-09-27 14:50:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1118, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:26.000', '1', NULL, '2024-09-27 14:51:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1119, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:26.000', '1', NULL, '2024-09-27 14:51:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1120, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:26.000', '1', NULL, '2024-09-27 14:51:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1121, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:26.000', '1', NULL, '2024-09-27 14:51:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1122, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:26.000', '1', NULL, '2024-09-27 14:51:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1123, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:26.000', '1', NULL, '2024-09-27 14:51:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1124, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:27.000', '1', NULL, '2024-09-27 14:51:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1125, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:27.000', '1', NULL, '2024-09-27 14:51:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1126, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:27.000', '1', NULL, '2024-09-27 14:51:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1127, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:27.000', '1', NULL, '2024-09-27 14:51:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1128, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:27.000', '1', NULL, '2024-09-27 14:51:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1129, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:27.000', '1', NULL, '2024-09-27 14:51:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1130, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:27.000', '1', NULL, '2024-09-27 14:51:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1131, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:27.000', '1', NULL, '2024-09-27 14:51:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1132, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:27.000', '1', NULL, '2024-09-27 14:51:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1133, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1134, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1135, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1136, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1137, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1138, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1139, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1140, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1141, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1142, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1143, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1144, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1145, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1146, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1147, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1148, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1149, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1150, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:28.000', '1', NULL, '2024-09-27 14:51:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1151, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1152, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1153, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1154, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1155, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1156, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1157, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1158, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1159, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1160, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1161, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1162, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1163, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1164, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1165, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1166, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1167, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1168, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1169, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1170, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:29.000', '1', NULL, '2024-09-27 14:51:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1171, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1172, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1173, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1174, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1175, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1176, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1177, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1178, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1179, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1180, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1181, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:30.000', '1', NULL, '2024-09-27 14:51:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1182, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:31.000', '1', NULL, '2024-09-27 14:51:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1183, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:31.000', '1', NULL, '2024-09-27 14:51:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1184, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:31.000', '1', NULL, '2024-09-27 14:51:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1185, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:50.000', '1', NULL, '2024-09-27 14:51:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1186, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:50.000', '1', NULL, '2024-09-27 14:51:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1187, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:50.000', '1', NULL, '2024-09-27 14:51:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1188, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:50.000', '1', NULL, '2024-09-27 14:51:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1189, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:50.000', '1', NULL, '2024-09-27 14:51:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1190, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:50.000', '1', NULL, '2024-09-27 14:51:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1191, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1192, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1193, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1194, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1195, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1196, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1197, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1198, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1199, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1200, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1201, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1202, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1203, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1204, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:51.000', '1', NULL, '2024-09-27 14:51:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1205, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1206, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1207, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1208, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1209, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1210, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1211, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1212, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1213, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1214, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1215, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1216, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1217, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1218, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1219, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1220, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1221, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1222, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1223, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:52.000', '1', NULL, '2024-09-27 14:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1224, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1225, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1226, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1227, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1228, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1229, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1230, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1231, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1232, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1233, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1234, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1235, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1236, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1237, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1238, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1239, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:53.000', '1', NULL, '2024-09-27 14:51:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1240, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:54.000', '1', NULL, '2024-09-27 14:51:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1241, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:54.000', '1', NULL, '2024-09-27 14:51:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1242, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:54.000', '1', NULL, '2024-09-27 14:51:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1243, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:54.000', '1', NULL, '2024-09-27 14:51:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1244, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:54.000', '1', NULL, '2024-09-27 14:51:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1245, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:54.000', '1', NULL, '2024-09-27 14:51:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1246, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:54.000', '1', NULL, '2024-09-27 14:51:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1247, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:54.000', '1', NULL, '2024-09-27 14:51:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1248, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:51:54.000', '1', NULL, '2024-09-27 14:51:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1249, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:52:00.000', '1', NULL, '2024-09-27 14:52:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1250, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:52:01.000', '1', NULL, '2024-09-27 14:52:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1251, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:52:30.000', '1', NULL, '2024-09-27 14:52:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1252, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:52:31.000', '1', NULL, '2024-09-27 14:52:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1253, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:52:54.000', '1', NULL, '2024-09-27 14:52:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1254, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:52:55.000', '1', NULL, '2024-09-27 14:52:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1255, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:55:23.000', '1', NULL, '2024-09-27 14:55:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1256, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:55:24.000', '1', NULL, '2024-09-27 14:55:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1257, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:55:24.000', '1', NULL, '2024-09-27 14:55:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1258, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:56:31.000', '1', NULL, '2024-09-27 14:56:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1259, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:56:31.000', '1', NULL, '2024-09-27 14:56:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1260, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:57:21.000', '1', NULL, '2024-09-27 14:57:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1261, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:57:39.000', '1', NULL, '2024-09-27 14:57:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1262, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:57:39.000', '1', NULL, '2024-09-27 14:57:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1263, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:58:01.000', '1', NULL, '2024-09-27 14:58:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1264, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:58:02.000', '1', NULL, '2024-09-27 14:58:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1265, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:58:05.000', '1', NULL, '2024-09-27 14:58:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1266, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:58:29.000', '1', NULL, '2024-09-27 14:58:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1267, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:58:29.000', '1', NULL, '2024-09-27 14:58:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1268, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:58:54.000', '1', NULL, '2024-09-27 14:58:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1269, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:58:54.000', '1', NULL, '2024-09-27 14:58:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1270, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 14:59:47.000', '1', NULL, '2024-09-27 14:59:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1271, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:00:06.000', '1', NULL, '2024-09-27 15:00:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1272, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:00:06.000', '1', NULL, '2024-09-27 15:00:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1273, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:01:14.000', '1', NULL, '2024-09-27 15:01:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1274, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:01:14.000', '1', NULL, '2024-09-27 15:01:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1275, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:01:14.000', '1', NULL, '2024-09-27 15:01:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1276, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:01:21.000', '1', NULL, '2024-09-27 15:01:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1277, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:01:21.000', '1', NULL, '2024-09-27 15:01:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1278, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:01:54.000', '1', NULL, '2024-09-27 15:01:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1279, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:01:54.000', '1', NULL, '2024-09-27 15:01:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1280, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:01:55.000', '1', NULL, '2024-09-27 15:01:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1281, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:01:55.000', '1', NULL, '2024-09-27 15:01:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1282, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:06:13.000', '1', NULL, '2024-09-27 15:06:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1283, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:06:13.000', '1', NULL, '2024-09-27 15:06:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1284, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:06:13.000', '1', NULL, '2024-09-27 15:06:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1285, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:06:13.000', '1', NULL, '2024-09-27 15:06:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1286, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:06:39.000', '1', NULL, '2024-09-27 15:06:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1287, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:06:39.000', '1', NULL, '2024-09-27 15:06:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1288, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:07:47.000', '1', NULL, '2024-09-27 15:07:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1289, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:07:48.000', '1', NULL, '2024-09-27 15:07:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1290, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:08:49.000', '1', NULL, '2024-09-27 15:08:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1291, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:08:50.000', '1', NULL, '2024-09-27 15:08:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1292, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:08:54.000', '1', NULL, '2024-09-27 15:08:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1293, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:08:54.000', '1', NULL, '2024-09-27 15:08:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1294, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:10:33.000', '1', NULL, '2024-09-27 15:10:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1295, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:10:33.000', '1', NULL, '2024-09-27 15:10:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1296, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:10:38.000', '1', NULL, '2024-09-27 15:10:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1297, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:10:38.000', '1', NULL, '2024-09-27 15:10:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1298, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:10:39.000', '1', NULL, '2024-09-27 15:10:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1299, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:10:40.000', '1', NULL, '2024-09-27 15:10:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1300, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:11:16.000', '1', NULL, '2024-09-27 15:11:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1301, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:11:16.000', '1', NULL, '2024-09-27 15:11:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1302, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:11:21.000', '1', NULL, '2024-09-27 15:11:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1303, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:11:22.000', '1', NULL, '2024-09-27 15:11:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1304, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:12:18.000', '1', NULL, '2024-09-27 15:12:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1305, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:12:19.000', '1', NULL, '2024-09-27 15:12:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1306, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:12:32.000', '1', NULL, '2024-09-27 15:12:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1307, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:12:32.000', '1', NULL, '2024-09-27 15:12:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1308, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:15:19.000', '1', NULL, '2024-09-27 15:15:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1309, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:15:19.000', '1', NULL, '2024-09-27 15:15:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1310, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:15:42.000', '1', NULL, '2024-09-27 15:15:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1311, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:15:42.000', '1', NULL, '2024-09-27 15:15:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1312, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:18:28.000', '1', NULL, '2024-09-27 15:18:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1313, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:18:29.000', '1', NULL, '2024-09-27 15:18:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1314, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:18:40.000', '1', NULL, '2024-09-27 15:18:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1315, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:18:40.000', '1', NULL, '2024-09-27 15:18:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1316, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:21:24.000', '1', NULL, '2024-09-27 15:21:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1317, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:21:24.000', '1', NULL, '2024-09-27 15:21:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1318, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-09-27 15:33:34.000', '1', NULL, '2024-09-27 15:33:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1319, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-09-27 15:33:34.000', '1', NULL, '2024-09-27 15:33:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1320, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:36:56.000', '1', NULL, '2024-09-27 15:36:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1321, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:36:56.000', '1', NULL, '2024-09-27 15:36:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1322, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:40:51.000', '1', NULL, '2024-09-27 15:40:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1323, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:40:51.000', '1', NULL, '2024-09-27 15:40:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1324, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:42:55.000', '1', NULL, '2024-09-27 15:42:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1325, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:42:55.000', '1', NULL, '2024-09-27 15:42:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1326, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:44:07.000', '1', NULL, '2024-09-27 15:44:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1327, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:44:08.000', '1', NULL, '2024-09-27 15:44:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1328, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:44:17.000', '1', NULL, '2024-09-27 15:44:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1329, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:44:17.000', '1', NULL, '2024-09-27 15:44:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1330, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:49:49.000', '1', NULL, '2024-09-27 15:49:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1331, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:49:49.000', '1', NULL, '2024-09-27 15:49:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1332, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:51:45.000', '1', NULL, '2024-09-27 15:51:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1333, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:51:45.000', '1', NULL, '2024-09-27 15:51:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1334, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:51:58.000', '1', NULL, '2024-09-27 15:51:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1335, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:51:59.000', '1', NULL, '2024-09-27 15:51:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1336, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:53:47.000', '1', NULL, '2024-09-27 15:53:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1337, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:53:48.000', '1', NULL, '2024-09-27 15:53:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1338, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:54:11.000', '1', NULL, '2024-09-27 15:54:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1339, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:54:12.000', '1', NULL, '2024-09-27 15:54:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1340, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:55:08.000', '1', NULL, '2024-09-27 15:55:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1341, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:55:09.000', '1', NULL, '2024-09-27 15:55:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1342, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:55:11.000', '1', NULL, '2024-09-27 15:55:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1343, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:55:11.000', '1', NULL, '2024-09-27 15:55:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1344, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:56:32.000', '1', NULL, '2024-09-27 15:56:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1345, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:56:33.000', '1', NULL, '2024-09-27 15:56:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1346, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:56:48.000', '1', NULL, '2024-09-27 15:56:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1347, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:56:48.000', '1', NULL, '2024-09-27 15:56:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1348, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:59:28.000', '1', NULL, '2024-09-27 15:59:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1349, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 15:59:29.000', '1', NULL, '2024-09-27 15:59:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1350, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:00:07.000', '1', NULL, '2024-09-27 16:00:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1351, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:00:07.000', '1', NULL, '2024-09-27 16:00:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1352, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:00:40.000', '1', NULL, '2024-09-27 16:00:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1353, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:00:40.000', '1', NULL, '2024-09-27 16:00:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1354, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:01:03.000', '1', NULL, '2024-09-27 16:01:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1355, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:01:03.000', '1', NULL, '2024-09-27 16:01:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1356, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:01:20.000', '1', NULL, '2024-09-27 16:01:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1357, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:01:21.000', '1', NULL, '2024-09-27 16:01:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1358, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:01:38.000', '1', NULL, '2024-09-27 16:01:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1359, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:01:38.000', '1', NULL, '2024-09-27 16:01:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1360, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:01:40.000', '1', NULL, '2024-09-27 16:01:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1361, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:01:40.000', '1', NULL, '2024-09-27 16:01:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1362, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:02:17.000', '1', NULL, '2024-09-27 16:02:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1363, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:02:18.000', '1', NULL, '2024-09-27 16:02:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1364, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:02:27.000', '1', NULL, '2024-09-27 16:02:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1365, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:02:27.000', '1', NULL, '2024-09-27 16:02:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1366, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:03:24.000', '1', NULL, '2024-09-27 16:03:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1367, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:03:24.000', '1', NULL, '2024-09-27 16:03:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1368, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:03:31.000', '1', NULL, '2024-09-27 16:03:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1369, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:03:31.000', '1', NULL, '2024-09-27 16:03:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1370, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:12.000', '1', NULL, '2024-09-27 16:04:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1371, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:13.000', '1', NULL, '2024-09-27 16:04:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1372, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:36.000', '1', NULL, '2024-09-27 16:04:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1373, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:40.000', '1', NULL, '2024-09-27 16:04:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1374, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:40.000', '1', NULL, '2024-09-27 16:04:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1375, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:45.000', '1', NULL, '2024-09-27 16:04:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1376, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:45.000', '1', NULL, '2024-09-27 16:04:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1377, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:52.000', '1', NULL, '2024-09-27 16:04:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1378, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:53.000', '1', NULL, '2024-09-27 16:04:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1379, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:04:54.000', '1', NULL, '2024-09-27 16:04:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1380, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:05:14.000', '1', NULL, '2024-09-27 16:05:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1381, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:05:19.000', '1', NULL, '2024-09-27 16:05:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1382, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:05:20.000', '1', NULL, '2024-09-27 16:05:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1383, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:05:34.000', '1', NULL, '2024-09-27 16:05:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1384, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:05:34.000', '1', NULL, '2024-09-27 16:05:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1385, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:05:51.000', '1', NULL, '2024-09-27 16:05:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1386, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:05:51.000', '1', NULL, '2024-09-27 16:05:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1387, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:05:52.000', '1', NULL, '2024-09-27 16:05:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1388, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:05:52.000', '1', NULL, '2024-09-27 16:05:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1389, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:11.000', '1', NULL, '2024-09-27 16:06:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1390, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:11.000', '1', NULL, '2024-09-27 16:06:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1391, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:15.000', '1', NULL, '2024-09-27 16:06:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1392, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:15.000', '1', NULL, '2024-09-27 16:06:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1393, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:52.000', '1', NULL, '2024-09-27 16:06:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1394, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:52.000', '1', NULL, '2024-09-27 16:06:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1395, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:54.000', '1', NULL, '2024-09-27 16:06:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1396, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:54.000', '1', NULL, '2024-09-27 16:06:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1397, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:56.000', '1', NULL, '2024-09-27 16:06:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1398, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:56.000', '1', NULL, '2024-09-27 16:06:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1399, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:58.000', '1', NULL, '2024-09-27 16:06:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1400, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-27 16:06:58.000', '1', NULL, '2024-09-27 16:06:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1401, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-09-29 11:02:34.000', '1', NULL, '2024-09-29 11:02:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1402, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-09-29 11:02:34.000', '1', NULL, '2024-09-29 11:02:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1403, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:26:57.000', '1', NULL, '2024-09-29 11:26:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1404, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:28:37.000', '1', NULL, '2024-09-29 11:28:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1405, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:29:12.000', '1', NULL, '2024-09-29 11:29:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1406, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:37:49.000', '1', NULL, '2024-09-29 11:37:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1407, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:39:07.000', '1', NULL, '2024-09-29 11:39:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1408, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:39:28.000', '1', NULL, '2024-09-29 11:39:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1409, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:39:28.000', '1', NULL, '2024-09-29 11:39:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1410, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:40:15.000', '1', NULL, '2024-09-29 11:40:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1411, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:40:28.000', '1', NULL, '2024-09-29 11:40:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1412, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:41:10.000', '1', NULL, '2024-09-29 11:41:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1413, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:41:33.000', '1', NULL, '2024-09-29 11:41:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1414, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:41:54.000', '1', NULL, '2024-09-29 11:41:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1415, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:43:31.000', '1', NULL, '2024-09-29 11:43:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1416, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:43:40.000', '1', NULL, '2024-09-29 11:43:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1417, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:43:51.000', '1', NULL, '2024-09-29 11:43:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1418, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:44:20.000', '1', NULL, '2024-09-29 11:44:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1419, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:44:32.000', '1', NULL, '2024-09-29 11:44:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1420, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:44:56.000', '1', NULL, '2024-09-29 11:44:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1421, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:45:36.000', '1', NULL, '2024-09-29 11:45:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1422, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:45:43.000', '1', NULL, '2024-09-29 11:45:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1423, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:45:50.000', '1', NULL, '2024-09-29 11:45:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1424, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:50:36.000', '1', NULL, '2024-09-29 11:50:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1425, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:53:03.000', '1', NULL, '2024-09-29 11:53:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1426, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 11:53:35.000', '1', NULL, '2024-09-29 11:53:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1427, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:49:39.000', '1', NULL, '2024-09-29 13:49:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1428, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:50:04.000', '1', NULL, '2024-09-29 13:50:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1429, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:51:07.000', '1', NULL, '2024-09-29 13:51:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1430, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:51:22.000', '1', NULL, '2024-09-29 13:51:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1431, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:51:35.000', '1', NULL, '2024-09-29 13:51:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1432, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:51:45.000', '1', NULL, '2024-09-29 13:51:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1433, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:52:19.000', '1', NULL, '2024-09-29 13:52:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1434, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:52:29.000', '1', NULL, '2024-09-29 13:52:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1435, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:53:08.000', '1', NULL, '2024-09-29 13:53:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1436, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:53:14.000', '1', NULL, '2024-09-29 13:53:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1437, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:54:46.000', '1', NULL, '2024-09-29 13:54:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1438, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:54:55.000', '1', NULL, '2024-09-29 13:54:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1439, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:54:56.000', '1', NULL, '2024-09-29 13:54:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1440, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:55:07.000', '1', NULL, '2024-09-29 13:55:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1441, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:55:20.000', '1', NULL, '2024-09-29 13:55:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1442, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:55:37.000', '1', NULL, '2024-09-29 13:55:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1443, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:55:55.000', '1', NULL, '2024-09-29 13:55:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1444, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:56:19.000', '1', NULL, '2024-09-29 13:56:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1445, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 13:56:48.000', '1', NULL, '2024-09-29 13:56:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1446, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:00:21.000', '1', NULL, '2024-09-29 14:00:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1447, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:00:45.000', '1', NULL, '2024-09-29 14:00:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1448, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:02:26.000', '1', NULL, '2024-09-29 14:02:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1449, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:02:31.000', '1', NULL, '2024-09-29 14:02:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1450, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:02:51.000', '1', NULL, '2024-09-29 14:02:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1451, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:03:34.000', '1', NULL, '2024-09-29 14:03:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1452, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:03:35.000', '1', NULL, '2024-09-29 14:03:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1453, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:04:17.000', '1', NULL, '2024-09-29 14:04:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1454, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:04:36.000', '1', NULL, '2024-09-29 14:04:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1455, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:04:42.000', '1', NULL, '2024-09-29 14:04:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1456, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:04:42.000', '1', NULL, '2024-09-29 14:04:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1457, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:04:50.000', '1', NULL, '2024-09-29 14:04:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1458, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:04:51.000', '1', NULL, '2024-09-29 14:04:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1459, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:05:09.000', '1', NULL, '2024-09-29 14:05:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1460, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:05:28.000', '1', NULL, '2024-09-29 14:05:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1461, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:06:17.000', '1', NULL, '2024-09-29 14:06:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1462, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:06:55.000', '1', NULL, '2024-09-29 14:06:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1463, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:07:04.000', '1', NULL, '2024-09-29 14:07:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1464, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:07:27.000', '1', NULL, '2024-09-29 14:07:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1465, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:09:22.000', '1', NULL, '2024-09-29 14:09:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1466, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:09:45.000', '1', NULL, '2024-09-29 14:09:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1467, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:09:51.000', '1', NULL, '2024-09-29 14:09:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1468, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:11:16.000', '1', NULL, '2024-09-29 14:11:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1469, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:11:52.000', '1', NULL, '2024-09-29 14:11:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1470, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:13:07.000', '1', NULL, '2024-09-29 14:13:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1471, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:13:23.000', '1', NULL, '2024-09-29 14:13:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1472, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:14:27.000', '1', NULL, '2024-09-29 14:14:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1473, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:15:18.000', '1', NULL, '2024-09-29 14:15:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1474, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:15:59.000', '1', NULL, '2024-09-29 14:15:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1475, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:16:36.000', '1', NULL, '2024-09-29 14:16:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1476, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:16:42.000', '1', NULL, '2024-09-29 14:16:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1477, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:17:20.000', '1', NULL, '2024-09-29 14:17:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1478, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:17:48.000', '1', NULL, '2024-09-29 14:17:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1479, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:17:59.000', '1', NULL, '2024-09-29 14:17:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1480, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:18:18.000', '1', NULL, '2024-09-29 14:18:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1481, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:19:10.000', '1', NULL, '2024-09-29 14:19:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1482, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:21:33.000', '1', NULL, '2024-09-29 14:21:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1483, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:21:44.000', '1', NULL, '2024-09-29 14:21:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1484, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:22:24.000', '1', NULL, '2024-09-29 14:22:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1485, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:23:09.000', '1', NULL, '2024-09-29 14:23:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1486, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:25:39.000', '1', NULL, '2024-09-29 14:25:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1487, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:26:03.000', '1', NULL, '2024-09-29 14:26:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1488, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:26:21.000', '1', NULL, '2024-09-29 14:26:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1489, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:28:14.000', '1', NULL, '2024-09-29 14:28:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1490, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:28:17.000', '1', NULL, '2024-09-29 14:28:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1491, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:28:42.000', '1', NULL, '2024-09-29 14:28:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1492, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:29:03.000', '1', NULL, '2024-09-29 14:29:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1493, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:29:23.000', '1', NULL, '2024-09-29 14:29:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1494, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:30:38.000', '1', NULL, '2024-09-29 14:30:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1495, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:36:16.000', '1', NULL, '2024-09-29 14:36:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1496, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:40:42.000', '1', NULL, '2024-09-29 14:40:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1497, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 14:46:06.000', '1', NULL, '2024-09-29 14:46:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1498, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 16:11:39.000', '1', NULL, '2024-09-29 16:11:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1499, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 16:19:51.000', '1', NULL, '2024-09-29 16:19:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1500, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 16:22:01.000', '1', NULL, '2024-09-29 16:22:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1501, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 16:23:57.000', '1', NULL, '2024-09-29 16:23:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1502, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 16:29:15.000', '1', NULL, '2024-09-29 16:29:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1503, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 16:31:27.000', '1', NULL, '2024-09-29 16:31:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1504, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 16:34:45.000', '1', NULL, '2024-09-29 16:34:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1505, 1, 'admin', '0:0:0:0:0:0:0:1', 'null,null,null',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-09-29 16:34:57.000', '1', NULL, '2024-09-29 16:34:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1506, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:29:57.000', '1', NULL, '2024-10-09 10:29:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1507, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:29:57.000', '1', NULL, '2024-10-09 10:29:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1508, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:36:01.000', '1', NULL, '2024-10-09 10:36:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1509, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:36:55.000', '1', NULL, '2024-10-09 10:36:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1510, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:38:27.000', '1', NULL, '2024-10-09 10:38:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1511, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:38:29.000', '1', NULL, '2024-10-09 10:38:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1512, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:41:47.000', '1', NULL, '2024-10-09 10:41:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1513, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:41:47.000', '1', NULL, '2024-10-09 10:41:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1514, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:43:07.000', '1', NULL, '2024-10-09 10:43:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1515, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:43:19.000', '1', NULL, '2024-10-09 10:43:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1516, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:44:07.000', '1', NULL, '2024-10-09 10:44:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1517, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:44:43.000', '1', NULL, '2024-10-09 10:44:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1518, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:45:50.000', '1', NULL, '2024-10-09 10:45:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1519, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:46:15.000', '1', NULL, '2024-10-09 10:46:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1520, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:46:48.000', '1', NULL, '2024-10-09 10:46:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1521, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:49:52.000', '1', NULL, '2024-10-09 10:49:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1522, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 10:52:38.000', '1', NULL, '2024-10-09 10:52:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1523, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 10:52:38.000', '1', NULL, '2024-10-09 10:52:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1524, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 10:54:19.000', '1', NULL, '2024-10-09 10:54:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1525, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 10:55:37.000', '1', NULL, '2024-10-09 10:55:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1526, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:00:56.000', '1', NULL, '2024-10-09 11:00:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1527, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:01:25.000', '1', NULL, '2024-10-09 11:01:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1528, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:01:43.000', '1', NULL, '2024-10-09 11:01:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1529, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:02:09.000', '1', NULL, '2024-10-09 11:02:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1530, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:02:32.000', '1', NULL, '2024-10-09 11:02:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1531, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:03:00.000', '1', NULL, '2024-10-09 11:03:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1532, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 11:04:57.000', '1', NULL, '2024-10-09 11:04:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1533, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:04:57.000', '1', NULL, '2024-10-09 11:04:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1534, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:11:25.000', '1', NULL, '2024-10-09 11:11:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1535, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 11:15:28.000', '1', NULL, '2024-10-09 11:15:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1536, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:23:18.000', '1', NULL, '2024-10-09 11:23:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1537, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:23:18.000', '1', NULL, '2024-10-09 11:23:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1538, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:23:58.000', '1', NULL, '2024-10-09 11:23:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1539, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:25:31.000', '1', NULL, '2024-10-09 11:25:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1540, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:26:30.000', '1', NULL, '2024-10-09 11:26:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1541, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:35:03.000', '1', NULL, '2024-10-09 11:35:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1542, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:35:26.000', '1', NULL, '2024-10-09 11:35:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1543, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:43:59.000', '1', NULL, '2024-10-09 11:43:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1544, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:44:31.000', '1', NULL, '2024-10-09 11:44:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1545, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:44:51.000', '1', NULL, '2024-10-09 11:44:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1546, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 11:45:34.000', '1', NULL, '2024-10-09 11:45:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1547, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:47:45.000', '1', NULL, '2024-10-09 11:47:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1548, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:49:13.000', '1', NULL, '2024-10-09 11:49:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1549, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:52:19.000', '1', NULL, '2024-10-09 11:52:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1550, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:53:38.000', '1', NULL, '2024-10-09 11:53:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1551, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:54:26.000', '1', NULL, '2024-10-09 11:54:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1552, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:55:46.000', '1', NULL, '2024-10-09 11:55:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1553, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:56:24.000', '1', NULL, '2024-10-09 11:56:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1554, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 11:57:25.000', '1', NULL, '2024-10-09 11:57:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1555, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 12:00:27.000', '1', NULL, '2024-10-09 12:00:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1556, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 12:01:42.000', '1', NULL, '2024-10-09 12:01:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1557, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 12:05:22.000', '1', NULL, '2024-10-09 12:05:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1558, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 12:22:42.000', '1', NULL, '2024-10-09 12:22:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1559, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 12:40:43.000', '1', NULL, '2024-10-09 12:40:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1560, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 12:59:20.000', '1', NULL, '2024-10-09 12:59:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1561, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 13:16:48.000', '1', NULL, '2024-10-09 13:16:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1562, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 13:29:10.000', '1', NULL, '2024-10-09 13:29:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1563, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 13:38:39.000', '1', NULL, '2024-10-09 13:38:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1564, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 13:41:03.000', '1', NULL, '2024-10-09 13:41:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1565, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 13:50:00.000', '1', NULL, '2024-10-09 13:50:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1566, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 13:53:40.000', '1', NULL, '2024-10-09 13:53:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1567, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 13:54:25.000', '1', NULL, '2024-10-09 13:54:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1568, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:02:39.000', '1', NULL, '2024-10-09 14:02:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1569, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:04:29.000', '1', NULL, '2024-10-09 14:04:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1570, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:05:20.000', '1', NULL, '2024-10-09 14:05:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1571, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:05:48.000', '1', NULL, '2024-10-09 14:05:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1572, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:08:29.000', '1', NULL, '2024-10-09 14:08:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1573, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:30:25.000', '1', NULL, '2024-10-09 14:30:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1574, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:30:50.000', '1', NULL, '2024-10-09 14:30:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1575, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:31:11.000', '1', NULL, '2024-10-09 14:31:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1576, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:31:57.000', '1', NULL, '2024-10-09 14:31:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1577, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:35:59.000', '1', NULL, '2024-10-09 14:35:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1578, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:41:50.000', '1', NULL, '2024-10-09 14:41:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1579, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1',
        '2024-10-09 14:42:51.000', '1', NULL, '2024-10-09 14:42:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1580, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:46:38.000', '1', NULL, '2024-10-09 14:46:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1581, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:48:25.000', '1', NULL, '2024-10-09 14:48:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1582, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:48:25.000', '1', NULL, '2024-10-09 14:48:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1583, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 14:53:27.000', '1', NULL, '2024-10-09 14:53:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1584, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 15:17:12.000', '1', NULL, '2024-10-09 15:17:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1585, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 16:35:30.000', '1', NULL, '2024-10-09 16:35:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1586, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 16:35:30.000', '1', NULL, '2024-10-09 16:35:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1587, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:37:38.000', '1', NULL, '2024-10-09 16:37:38.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1588, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 16:39:02.000', '1', NULL, '2024-10-09 16:39:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1589, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:40:42.000', '1', NULL, '2024-10-09 16:40:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1590, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:42:40.000', '1', NULL, '2024-10-09 16:42:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1591, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:48:07.000', '1', NULL, '2024-10-09 16:48:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1592, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:48:07.000', '1', NULL, '2024-10-09 16:48:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1593, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:48:33.000', '1', NULL, '2024-10-09 16:48:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1594, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:49:12.000', '1', NULL, '2024-10-09 16:49:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1595, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:49:32.000', '1', NULL, '2024-10-09 16:49:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1596, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:49:45.000', '1', NULL, '2024-10-09 16:49:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1597, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:49:55.000', '1', NULL, '2024-10-09 16:49:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1598, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:50:14.000', '1', NULL, '2024-10-09 16:50:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1599, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 16:51:36.000', '1', NULL, '2024-10-09 16:51:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1600, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 16:51:36.000', '1', NULL, '2024-10-09 16:51:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1601, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 16:52:35.000', '1', NULL, '2024-10-09 16:52:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1602, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:54:52.000', '1', NULL, '2024-10-09 16:54:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1603, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:57:52.000', '1', NULL, '2024-10-09 16:57:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1604, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:58:12.000', '1', NULL, '2024-10-09 16:58:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1605, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 16:58:53.000', '1', NULL, '2024-10-09 16:58:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1606, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:01:42.000', '1', NULL, '2024-10-09 17:01:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1607, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:01:52.000', '1', NULL, '2024-10-09 17:01:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1608, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:02:54.000', '1', NULL, '2024-10-09 17:02:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1609, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:03:41.000', '1', NULL, '2024-10-09 17:03:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1610, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:07:29.000', '1', NULL, '2024-10-09 17:07:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1611, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:07:49.000', '1', NULL, '2024-10-09 17:07:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1612, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:07:54.000', '1', NULL, '2024-10-09 17:07:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1613, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 17:08:49.000', '1', NULL, '2024-10-09 17:08:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1614, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 17:08:57.000', '1', NULL, '2024-10-09 17:08:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1615, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 17:09:17.000', '1', NULL, '2024-10-09 17:09:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1616, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:10:05.000', '1', NULL, '2024-10-09 17:10:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1617, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 17:10:05.000', '1', NULL, '2024-10-09 17:10:05.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1618, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 17:10:15.000', '1', NULL, '2024-10-09 17:10:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1619, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 17:10:21.000', '1', NULL, '2024-10-09 17:10:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1620, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:10:32.000', '1', NULL, '2024-10-09 17:10:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1621, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 17:11:27.000', '1', NULL, '2024-10-09 17:11:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1622, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:11:29.000', '1', NULL, '2024-10-09 17:11:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1623, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:13:17.000', '1', NULL, '2024-10-09 17:13:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1624, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:13:23.000', '1', NULL, '2024-10-09 17:13:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1625, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:13:26.000', '1', NULL, '2024-10-09 17:13:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1626, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:13:34.000', '1', NULL, '2024-10-09 17:13:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1627, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-09 17:14:03.000', '1', NULL, '2024-10-09 17:14:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1628, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:19:12.000', '1', NULL, '2024-10-09 17:19:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1629, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 17:30:04.000', '1', NULL, '2024-10-09 17:30:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1630, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 18:00:52.000', '1', NULL, '2024-10-09 18:00:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1631, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-09 18:18:53.000', '1', NULL, '2024-10-09 18:18:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1632, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 09:54:00.000', '1', NULL, '2024-10-10 09:54:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1633, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 09:54:09.000', '1', NULL, '2024-10-10 09:54:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1634, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 09:54:09.000', '1', NULL, '2024-10-10 09:54:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1635, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 09:58:44.000', '1', NULL, '2024-10-10 09:58:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1636, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 09:58:57.000', '1', NULL, '2024-10-10 09:58:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1637, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:04:15.000', '1', NULL, '2024-10-10 10:04:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1638, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:04:15.000', '1', NULL, '2024-10-10 10:04:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1639, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:05:20.000', '1', NULL, '2024-10-10 10:05:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1640, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 10:09:23.000', '1', NULL, '2024-10-10 10:09:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1641, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 10:09:28.000', '1', NULL, '2024-10-10 10:09:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1642, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:10:53.000', '1', NULL, '2024-10-10 10:10:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1643, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 10:15:27.000', '1', NULL, '2024-10-10 10:15:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1644, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:16:31.000', '1', NULL, '2024-10-10 10:16:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1645, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:16:31.000', '1', NULL, '2024-10-10 10:16:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1646, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:27:47.000', '1', NULL, '2024-10-10 10:27:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1647, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:36:00.000', '1', NULL, '2024-10-10 10:36:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1648, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:40:13.000', '1', NULL, '2024-10-10 10:40:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1649, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:42:28.000', '1', NULL, '2024-10-10 10:42:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1650, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:44:56.000', '1', NULL, '2024-10-10 10:44:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1651, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:46:52.000', '1', NULL, '2024-10-10 10:46:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1652, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:48:42.000', '1', NULL, '2024-10-10 10:48:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1653, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:48:42.000', '1', NULL, '2024-10-10 10:48:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1654, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 10:48:43.000', '1', NULL, '2024-10-10 10:48:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1655, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:49:02.000', '1', NULL, '2024-10-10 10:49:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1656, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 10:49:02.000', '1', NULL, '2024-10-10 10:49:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1657, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:49:22.000', '1', NULL, '2024-10-10 10:49:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1658, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 10:49:22.000', '1', NULL, '2024-10-10 10:49:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1659, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:49:34.000', '1', NULL, '2024-10-10 10:49:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1660, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:52:43.000', '1', NULL, '2024-10-10 10:52:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1661, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:53:16.000', '1', NULL, '2024-10-10 10:53:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1662, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 10:53:17.000', '1', NULL, '2024-10-10 10:53:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1663, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:53:21.000', '1', NULL, '2024-10-10 10:53:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1664, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 10:53:21.000', '1', NULL, '2024-10-10 10:53:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1665, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:53:46.000', '1', NULL, '2024-10-10 10:53:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1666, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:55:50.000', '1', NULL, '2024-10-10 10:55:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1667, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:57:13.000', '1', NULL, '2024-10-10 10:57:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1668, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:59:15.000', '1', NULL, '2024-10-10 10:59:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1669, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:59:39.000', '1', NULL, '2024-10-10 10:59:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1670, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 10:59:48.000', '1', NULL, '2024-10-10 10:59:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1671, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:01:53.000', '1', NULL, '2024-10-10 11:01:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1672, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:15:39.000', '1', NULL, '2024-10-10 11:15:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1673, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:15:39.000', '1', NULL, '2024-10-10 11:15:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1674, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:16:40.000', '1', NULL, '2024-10-10 11:16:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1675, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:16:55.000', '1', NULL, '2024-10-10 11:16:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1676, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:17:04.000', '1', NULL, '2024-10-10 11:17:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1677, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:17:04.000', '1', NULL, '2024-10-10 11:17:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1678, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:17:20.000', '1', NULL, '2024-10-10 11:17:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1679, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:18:08.000', '1', NULL, '2024-10-10 11:18:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1680, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:27:42.000', '1', NULL, '2024-10-10 11:27:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1681, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:27:47.000', '1', NULL, '2024-10-10 11:27:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1682, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:27:56.000', '1', NULL, '2024-10-10 11:27:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1683, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:29:07.000', '1', NULL, '2024-10-10 11:29:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1684, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:30:18.000', '1', NULL, '2024-10-10 11:30:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1685, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:30:22.000', '1', NULL, '2024-10-10 11:30:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1686, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:30:24.000', '1', NULL, '2024-10-10 11:30:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1687, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:30:26.000', '1', NULL, '2024-10-10 11:30:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1688, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:30:28.000', '1', NULL, '2024-10-10 11:30:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1689, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:38:15.000', '1', NULL, '2024-10-10 11:38:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1690, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:38:15.000', '1', NULL, '2024-10-10 11:38:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1691, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:41:15.000', '1', NULL, '2024-10-10 11:41:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1692, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 11:41:28.000', '1', NULL, '2024-10-10 11:41:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1693, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 11:41:28.000', '1', NULL, '2024-10-10 11:41:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1694, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:42:15.000', '1', NULL, '2024-10-10 11:42:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1695, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:42:31.000', '1', NULL, '2024-10-10 11:42:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1696, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 11:43:52.000', '1', NULL, '2024-10-10 11:43:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1697, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 11:45:44.000', '1', NULL, '2024-10-10 11:45:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1698, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:45:46.000', '1', NULL, '2024-10-10 11:45:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1699, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:46:08.000', '1', NULL, '2024-10-10 11:46:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1700, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 11:47:39.000', '1', NULL, '2024-10-10 11:47:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1701, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:48:04.000', '1', NULL, '2024-10-10 11:48:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1702, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:48:04.000', '1', NULL, '2024-10-10 11:48:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1703, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:48:30.000', '1', NULL, '2024-10-10 11:48:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1704, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:49:00.000', '1', NULL, '2024-10-10 11:49:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1705, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:49:09.000', '1', NULL, '2024-10-10 11:49:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1706, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:49:56.000', '1', NULL, '2024-10-10 11:49:56.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1707, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:50:35.000', '1', NULL, '2024-10-10 11:50:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1708, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:50:42.000', '1', NULL, '2024-10-10 11:50:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1709, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:51:42.000', '1', NULL, '2024-10-10 11:51:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1710, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:52:19.000', '1', NULL, '2024-10-10 11:52:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1711, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:54:57.000', '1', NULL, '2024-10-10 11:54:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1712, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 11:59:36.000', '1', NULL, '2024-10-10 11:59:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1713, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 12:00:36.000', '1', NULL, '2024-10-10 12:00:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1714, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 12:23:39.000', '1', NULL, '2024-10-10 12:23:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1715, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 12:40:34.000', '1', NULL, '2024-10-10 12:40:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1716, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 12:57:44.000', '1', NULL, '2024-10-10 12:57:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1717, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 13:12:14.000', '1', NULL, '2024-10-10 13:12:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1718, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 13:29:53.000', '1', NULL, '2024-10-10 13:29:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1719, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 13:31:19.000', '1', NULL, '2024-10-10 13:31:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1720, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 13:35:08.000', '1', NULL, '2024-10-10 13:35:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1721, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 13:35:33.000', '1', NULL, '2024-10-10 13:35:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1722, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 13:35:33.000', '1', NULL, '2024-10-10 13:35:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1723, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 13:41:24.000', '1', NULL, '2024-10-10 13:41:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1724, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-10 14:06:22.000', '1', NULL, '2024-10-10 14:06:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1725, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 14:18:49.000', '1', NULL, '2024-10-10 14:18:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1726, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 14:18:57.000', '1', NULL, '2024-10-10 14:18:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1727, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 14:31:47.000', '1', NULL, '2024-10-10 14:31:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1728, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 14:31:47.000', '1', NULL, '2024-10-10 14:31:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1729, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 14:44:36.000', '1', NULL, '2024-10-10 14:44:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1730, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 14:44:36.000', '1', NULL, '2024-10-10 14:44:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1731, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 14:47:45.000', '1', NULL, '2024-10-10 14:47:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1732, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 14:49:26.000', '1', NULL, '2024-10-10 14:49:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1733, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:04:35.000', '1', NULL, '2024-10-10 15:04:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1734, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:08:49.000', '1', NULL, '2024-10-10 15:08:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1735, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:10:29.000', '1', NULL, '2024-10-10 15:10:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1736, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:20:19.000', '1', NULL, '2024-10-10 15:20:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1737, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:20:19.000', '1', NULL, '2024-10-10 15:20:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1738, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:21:13.000', '1', NULL, '2024-10-10 15:21:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1739, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:22:21.000', '1', NULL, '2024-10-10 15:22:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1740, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:24:12.000', '1', NULL, '2024-10-10 15:24:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1741, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:40:50.000', '1', NULL, '2024-10-10 15:40:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1742, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:43:18.000', '1', NULL, '2024-10-10 15:43:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1743, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:45:42.000', '1', NULL, '2024-10-10 15:45:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1744, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:47:27.000', '1', NULL, '2024-10-10 15:47:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1745, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:47:57.000', '1', NULL, '2024-10-10 15:47:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1746, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:48:53.000', '1', NULL, '2024-10-10 15:48:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1747, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:49:04.000', '1', NULL, '2024-10-10 15:49:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1748, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:52:27.000', '1', NULL, '2024-10-10 15:52:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1749, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 15:56:16.000', '1', NULL, '2024-10-10 15:56:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1750, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:00:15.000', '1', NULL, '2024-10-10 16:00:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1751, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:01:55.000', '1', NULL, '2024-10-10 16:01:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1752, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:02:11.000', '1', NULL, '2024-10-10 16:02:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1753, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:02:19.000', '1', NULL, '2024-10-10 16:02:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1754, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:02:28.000', '1', NULL, '2024-10-10 16:02:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1755, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:04:12.000', '1', NULL, '2024-10-10 16:04:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1756, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:06:01.000', '1', NULL, '2024-10-10 16:06:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1757, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:08:49.000', '1', NULL, '2024-10-10 16:08:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1758, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:10:11.000', '1', NULL, '2024-10-10 16:10:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1759, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:10:31.000', '1', NULL, '2024-10-10 16:10:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1760, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:10:39.000', '1', NULL, '2024-10-10 16:10:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1761, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:12:48.000', '1', NULL, '2024-10-10 16:12:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1762, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:16:00.000', '1', NULL, '2024-10-10 16:16:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1763, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:16:18.000', '1', NULL, '2024-10-10 16:16:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1764, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:16:32.000', '1', NULL, '2024-10-10 16:16:32.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1765, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:22:49.000', '1', NULL, '2024-10-10 16:22:49.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1766, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:33:12.000', '1', NULL, '2024-10-10 16:33:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1767, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:34:16.000', '1', NULL, '2024-10-10 16:34:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1768, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-10 16:39:22.000', '1', NULL, '2024-10-10 16:39:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1769, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 10:48:23.000', '1', NULL, '2024-10-11 10:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1770, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 10:48:23.000', '1', NULL, '2024-10-11 10:48:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1771, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:40:19.000', '1', NULL, '2024-10-11 15:40:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1772, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:40:20.000', '1', NULL, '2024-10-11 15:40:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1773, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:40:59.000', '1', NULL, '2024-10-11 15:40:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1774, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:48:25.000', '1', NULL, '2024-10-11 15:48:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1775, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:49:29.000', '1', NULL, '2024-10-11 15:49:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1776, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:51:48.000', '1', NULL, '2024-10-11 15:51:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1777, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:52:40.000', '1', NULL, '2024-10-11 15:52:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1778, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:53:06.000', '1', NULL, '2024-10-11 15:53:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1779, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:55:44.000', '1', NULL, '2024-10-11 15:55:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1780, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:57:24.000', '1', NULL, '2024-10-11 15:57:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1781, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:59:01.000', '1', NULL, '2024-10-11 15:59:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1782, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 15:59:13.000', '1', NULL, '2024-10-11 15:59:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1783, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:00:07.000', '1', NULL, '2024-10-11 16:00:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1784, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:01:06.000', '1', NULL, '2024-10-11 16:01:06.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1785, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:02:51.000', '1', NULL, '2024-10-11 16:02:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1786, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:05:54.000', '1', NULL, '2024-10-11 16:05:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1787, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:06:15.000', '1', NULL, '2024-10-11 16:06:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1788, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:06:25.000', '1', NULL, '2024-10-11 16:06:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1789, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:08:55.000', '1', NULL, '2024-10-11 16:08:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1790, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:09:25.000', '1', NULL, '2024-10-11 16:09:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1791, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:09:51.000', '1', NULL, '2024-10-11 16:09:51.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1792, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:10:01.000', '1', NULL, '2024-10-11 16:10:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1793, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:10:10.000', '1', NULL, '2024-10-11 16:10:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1794, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:13:21.000', '1', NULL, '2024-10-11 16:13:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1795, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:14:34.000', '1', NULL, '2024-10-11 16:14:34.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1796, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 16:15:55.000', '1', NULL, '2024-10-11 16:15:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1797, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 16:15:55.000', '1', NULL, '2024-10-11 16:15:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1798, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 16:17:44.000', '1', NULL, '2024-10-11 16:17:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1799, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:17:57.000', '1', NULL, '2024-10-11 16:17:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1800, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:20:00.000', '1', NULL, '2024-10-11 16:20:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1801, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:21:04.000', '1', NULL, '2024-10-11 16:21:04.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1802, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:22:10.000', '1', NULL, '2024-10-11 16:22:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1803, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:22:33.000', '1', NULL, '2024-10-11 16:22:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1804, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 16:22:37.000', '1', NULL, '2024-10-11 16:22:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1805, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:22:58.000', '1', NULL, '2024-10-11 16:22:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1806, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 16:28:45.000', '1', NULL, '2024-10-11 16:28:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1807, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:39:01.000', '1', NULL, '2024-10-11 16:39:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1808, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:39:19.000', '1', NULL, '2024-10-11 16:39:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1809, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:39:27.000', '1', NULL, '2024-10-11 16:39:27.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1810, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:39:36.000', '1', NULL, '2024-10-11 16:39:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1811, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:40:37.000', '1', NULL, '2024-10-11 16:40:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1812, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:45:26.000', '1', NULL, '2024-10-11 16:45:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1813, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:46:42.000', '1', NULL, '2024-10-11 16:46:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1814, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:47:39.000', '1', NULL, '2024-10-11 16:47:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1815, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 16:49:43.000', '1', NULL, '2024-10-11 16:49:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1816, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:52:29.000', '1', NULL, '2024-10-11 16:52:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1817, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:52:39.000', '1', NULL, '2024-10-11 16:52:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1818, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:55:17.000', '1', NULL, '2024-10-11 16:55:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1819, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:55:24.000', '1', NULL, '2024-10-11 16:55:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1820, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:55:30.000', '1', NULL, '2024-10-11 16:55:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1821, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:55:45.000', '1', NULL, '2024-10-11 16:55:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1822, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:56:53.000', '1', NULL, '2024-10-11 16:56:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1823, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:57:37.000', '1', NULL, '2024-10-11 16:57:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1824, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:58:45.000', '1', NULL, '2024-10-11 16:58:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1825, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:58:57.000', '1', NULL, '2024-10-11 16:58:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1826, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 16:59:50.000', '1', NULL, '2024-10-11 16:59:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1827, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 17:00:12.000', '1', NULL, '2024-10-11 17:00:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1828, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 17:04:25.000', '1', NULL, '2024-10-11 17:04:25.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1829, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 17:07:42.000', '1', NULL, '2024-10-11 17:07:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1830, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 17:11:28.000', '1', NULL, '2024-10-11 17:11:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1831, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 17:15:52.000', '1', NULL, '2024-10-11 17:15:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1832, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-11 17:15:58.000', '1', NULL, '2024-10-11 17:15:58.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1833, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 17:16:50.000', '1', NULL, '2024-10-11 17:16:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1834, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-11 17:28:43.000', '1', NULL, '2024-10-11 17:28:43.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1835, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 09:47:39.000', '1', NULL, '2024-10-12 09:47:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1836, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 09:47:39.000', '1', NULL, '2024-10-12 09:47:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1837, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:05:59.000', '1', NULL, '2024-10-12 10:05:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1838, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 10:06:10.000', '1', NULL, '2024-10-12 10:06:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1839, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 10:06:10.000', '1', NULL, '2024-10-12 10:06:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1840, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:11:18.000', '1', NULL, '2024-10-12 10:11:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1841, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:12:54.000', '1', NULL, '2024-10-12 10:12:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1842, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:13:37.000', '1', NULL, '2024-10-12 10:13:37.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1843, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:16:30.000', '1', NULL, '2024-10-12 10:16:30.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1844, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:18:35.000', '1', NULL, '2024-10-12 10:18:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1845, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:19:19.000', '1', NULL, '2024-10-12 10:19:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1846, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:19:20.000', '1', NULL, '2024-10-12 10:19:20.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1847, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:21:09.000', '1', NULL, '2024-10-12 10:21:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1848, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:47:47.000', '1', NULL, '2024-10-12 10:47:47.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1849, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 10:53:16.000', '1', NULL, '2024-10-12 10:53:16.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1850, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 10:53:17.000', '1', NULL, '2024-10-12 10:53:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1851, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:53:31.000', '1', NULL, '2024-10-12 10:53:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1852, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 10:55:44.000', '1', NULL, '2024-10-12 10:55:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1853, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 10:55:44.000', '1', NULL, '2024-10-12 10:55:44.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1854, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 10:56:45.000', '1', NULL, '2024-10-12 10:56:45.000', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '首页', 'PAGE', 0, 1, 'home', 'home/index', '', 0, 0, 0, 1, 0, NULL, 'home', 'iconfont icon-shouye', 1, NULL,
        '2024-10-09 11:00:53.000', NULL, '2024-10-12 10:23:12.000', 0);
INSERT INTO `sys_menu`
VALUES (2, '系统管理', 'CATALOGUE', 0, 13, 'system', NULL, '/system/menu', 0, 0, 0, 0, 0, '0', 'system.menu',
        'iconfont icon-xitongshezhi', 1, NULL, '2022-11-18 19:27:43.000', NULL, '2024-10-10 09:58:37.000', 0);
INSERT INTO `sys_menu`
VALUES (3, '菜单配置', 'PAGE', 2, 1, 'system/menu', 'system/menu/index', NULL, 0, 0, 0, 1, 0, '0', 'system.menu.tree',
        'iconfont icon-caidan', 1, NULL, '2022-11-05 00:20:58.000', NULL, '2024-09-29 14:26:18.058', 0);
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
VALUES (28, '编辑', 'BUTTON', 10, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.update', '', 1, NULL,
        '2023-12-12 16:43:41.000', NULL, '2024-10-12 10:22:14.000', 0);
INSERT INTO `sys_menu`
VALUES (29, '删除', 'BUTTON', 10, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.del', '', 1, NULL,
        '2023-12-12 16:43:55.000', NULL, '2024-10-12 10:22:20.000', 0);
INSERT INTO `sys_menu`
VALUES (30, '新增', 'BUTTON', 10, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.add', '', 1, NULL,
        '2023-12-12 16:44:04.000', NULL, '2024-10-12 10:22:07.000', 0);
INSERT INTO `sys_menu`
VALUES (38, '文件管理', 'PAGE', 2, 9, 'system/file', 'system/file/index', '', 0, 0, 0, 1, 0, NULL, 'system.file.page',
        'iconfont icon-zhongduancanshuchaxun', 1, NULL, '2024-10-10 11:41:10.000', NULL, '2024-10-12 10:22:54.000', 0);

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
VALUES (1, 1, '超级管理员', 'admin', 'LOWER', 1, 1, NULL, NULL, NULL, '2024-10-09 16:51:57.000', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色->菜单权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (1, 1, 1, NULL, '2024-09-12 13:46:52.058', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (2, 1, 2, NULL, '2024-09-12 13:46:52.063', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (3, 1, 3, NULL, '2024-09-12 13:46:52.063', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (4, 1, 4, NULL, '2024-09-12 13:46:52.063', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (5, 1, 5, NULL, '2024-09-12 13:46:52.064', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (6, 1, 6, NULL, '2024-09-12 13:46:52.065', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (7, 1, 7, NULL, '2024-09-12 13:46:52.065', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (8, 1, 8, NULL, '2024-09-12 13:46:52.066', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (9, 1, 9, NULL, '2024-09-12 13:46:52.066', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (10, 1, 10, NULL, '2024-09-12 13:46:52.067', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (11, 1, 11, NULL, '2024-09-12 13:46:52.067', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (12, 1, 12, NULL, '2024-09-12 13:46:52.067', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (13, 1, 13, NULL, '2024-09-12 13:46:52.069', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (14, 1, 14, NULL, '2024-09-12 13:46:52.070', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (15, 1, 15, NULL, '2024-09-12 13:46:52.070', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (16, 1, 16, NULL, '2024-09-12 13:46:52.071', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (17, 1, 17, NULL, '2024-09-12 13:46:52.072', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (18, 1, 18, NULL, '2024-09-12 13:46:52.072', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (19, 1, 19, NULL, '2024-09-12 13:46:52.072', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (20, 1, 20, NULL, '2024-09-12 13:46:52.073', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (21, 1, 21, NULL, '2024-09-12 13:46:52.073', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (22, 1, 22, NULL, '2024-09-12 13:46:52.074', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (23, 1, 23, NULL, '2024-09-12 13:46:52.074', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (24, 1, 24, NULL, '2024-09-12 13:46:52.074', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (25, 1, 25, NULL, '2024-09-12 13:46:52.075', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (26, 1, 26, NULL, '2024-09-12 13:46:52.075', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (27, 1, 27, NULL, '2024-09-12 13:46:52.075', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (28, 1, 28, NULL, '2024-09-12 13:46:52.076', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (29, 1, 29, NULL, '2024-09-12 13:46:52.076', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (30, 1, 30, NULL, '2024-09-12 13:46:52.076', NULL, '2024-10-09 14:53:26.523', 1);
INSERT INTO `sys_role_menu`
VALUES (87, 1, 1, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:52:30.691', 1);
INSERT INTO `sys_role_menu`
VALUES (88, 1, 2, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (89, 1, 3, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (90, 1, 9, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (91, 1, 11, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (92, 1, 12, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (93, 1, 6, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (94, 1, 25, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (95, 1, 27, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (96, 1, 26, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (97, 1, 7, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (98, 1, 24, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (99, 1, 23, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (100, 1, 22, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (101, 1, 8, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (102, 1, 19, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (103, 1, 20, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (104, 1, 21, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (105, 1, 5, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (106, 1, 13, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (107, 1, 30, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (108, 1, 28, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (109, 1, 29, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (110, 1, 14, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (111, 1, 15, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (112, 1, 4, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (113, 1, 17, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (114, 1, 18, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (115, 1, 16, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (116, 1, 10, NULL, '2024-10-09 14:53:25.000', NULL, '2024-10-09 16:51:58.712', 1);
INSERT INTO `sys_role_menu`
VALUES (117, 1, 1, NULL, '2024-10-09 16:51:57.000', NULL, '2024-10-09 16:52:32.876', 0);
INSERT INTO `sys_role_menu`
VALUES (118, 1, 2, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (119, 1, 3, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (120, 1, 9, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (121, 1, 11, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (122, 1, 12, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (123, 1, 6, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (124, 1, 25, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (125, 1, 27, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (126, 1, 26, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (127, 1, 7, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (128, 1, 24, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (129, 1, 23, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (130, 1, 22, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (131, 1, 8, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (132, 1, 19, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (133, 1, 20, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (134, 1, 21, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (135, 1, 5, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (136, 1, 13, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (137, 1, 30, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (138, 1, 28, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (139, 1, 29, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (140, 1, 14, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (141, 1, 15, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (142, 1, 4, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (143, 1, 17, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (144, 1, 18, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (145, 1, 16, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu`
VALUES (146, 1, 10, NULL, '2024-10-09 16:51:57.000', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账号信息' ROW_FORMAT = DYNAMIC;

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
    `avatar`      longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '头像',
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
VALUES (1, 1, '超级管理员',
        'data:image/jpeg;base64,***REMOVE_SECRET***/***REMOVE_SECRET***/3fG99zcmZO6kzsz93rWyQNn3nL0/***REMOVE_SECRET***+J1rmY80pMSNLllBSlpKTocvJlpVy+/Pc/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+AnvwB/+du+/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/Zqz86/v/LzqZHCQi/***REMOVE_SECRET***+***REMOVE_SECRET***/ArEX47R+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/pz3Z/***REMOVE_SECRET***+U7KgAgg4GYCaamptm+At27epq0bt+***REMOVE_SECRET***/6xD+w/n59AuP5Zxgk/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/d/BOvbsomubNFaVGtUVUbGCwsqUkX+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/vsrOUXG//6Sk41/TlFSUpLtM5yUmGzbLygpwfizvz/PxtNfxu+vpKfnujhPzxLy8fVRSd+Sf3+V/Ofv//Pvsvz7v2O8vL1yPS83uo/AonnfacEX3+***REMOVE_SECRET***/p5+NjlH0qVM6ffKUTh4/oRNHjtmaJI5elapVVvlKlVS+0v//***REMOVE_SECRET***/rd31flykc4dB/BCCCAQIEJ0DQpMFoGRgABJxEwGiQ/LVqiFT+tLLANXYOCg9S+Syc1btlMla+***REMOVE_SECRET***+O7tMuXlRB3SRfPGo9iR+***REMOVE_SECRET***+P/09z4z+***REMOVE_SECRET***+Av/wDjF/95B9o/N5fAQH+8vP3lb//3/9s+/f+//***REMOVE_SECRET***/INDbGMar8pEHj6k7Zs2a/eW7dr0+***REMOVE_SECRET***+V63/***REMOVE_SECRET***+***REMOVE_SECRET***+pnWMnygmJcTb3i8/Fx2t6KhTOnn0mI4dOqL42DjFxcba/rJq+/VinM6fO5/jTxerVK+***REMOVE_SECRET***/939fFmDM6uHuPNq9br1+XLNeeHbtM528msMNNN+ihYYNsf7Hkcg6ByymXdfrUGZ0/e17nzp6T0RgxmiEXzl+0/TT9woUL//u9c2TsmlkYGyWHR5RWaFioypQLt/***REMOVE_SECRET***+nOOIunNO+bdv187ffa/***REMOVE_SECRET***+u6rBfmeWqt2LXTvwwNUsXLFfB+***REMOVE_SECRET***+***REMOVE_SECRET***+VhdiYhR57LgO792vPdu364/***REMOVE_SECRET***/Vrx3WLN/uDjfNnnxTgh4YmnH2fD2EJabWP/hejTZxR9JkanI0/rzOkY2z+***REMOVE_SECRET***/***REMOVE_SECRET***+1468teRq/qG9uc2M7dept/DewrcpWqmLbOyW7Kyk+Tvu3b9eyb3/QF9Nn5mvavW7rYXuS0c+fJ7ryFZbBEEDAvgBNE/***REMOVE_SECRET***/W9Ti+vbqXq9eirpH2gXwfhJ4oGdu7T8+5/05cez7MYXdcAdDwxQlz69VLN+PQWG/v9f1NJTL+***REMOVE_SECRET***/+***REMOVE_SECRET***/***REMOVE_SECRET***+ftL/***REMOVE_SECRET***/w04fvho/iXrRCMFBQfrzsH36YZuN+maevVUwss72+xSEhO0Y+NGzZ85Rz9/+2O+VGA8vXjvQwPUvU/***REMOVE_SECRET***/XL+vXp+***REMOVE_SECRET***/6Zs48Hdl/IE/zF+***REMOVE_SECRET***+nXpbl/b52nThxbXWPT1GOHj+***REMOVE_SECRET***+mSqS++rd07cr+***REMOVE_SECRET***/Vh4lsn8CJfZctNb/8qs+e+***REMOVE_SECRET***/ZD7v8wbpQ0a/phuvrufKl5T026jxHiaxHh3e+mi77Xo83lOKpO3tPz8/XXXQw+oU6/uqlanjkr4/P3T7VPHDuu7L+bpwylTcz3BrXf20cAh9+***REMOVE_SECRET***/***REMOVE_SECRET***/L/dMlt9zdTw8MG6Ly1a7R1t/Xac60T/LUUHYneKOBMnjE4+pyc0+***REMOVE_SECRET***/Jv6tVFDz5+***REMOVE_SECRET***+***REMOVE_SECRET***/6Nsv5mntil9zNZ+r3mQ8bt7/wXvVs99tqt2oie14zMTYi/***REMOVE_SECRET***/sP6fB/***REMOVE_SECRET***/***REMOVE_SECRET***/2JT7hNz8zqYtm+mhkU+ocZs28iqZ/YbgF86c0qI5X+idF17Lk0Zo6VDb/***REMOVE_SECRET***/***REMOVE_SECRET***/scO12o0TMa+MMZtH602NmU9tP+***REMOVE_SECRET***+7+3X4wBE9P3pyrp7gqt+koca99pLqNG2mhEsXNOvt9/Txm3l/***REMOVE_SECRET***/fjlPL06blKeWNg/K0983IwAAjkJ0DTh84EAAq4gYGxy+en7s7RqWe6e9Og38F7dM2SwKlS/+***REMOVE_SECRET***+u5dbRvknjy0X28//5KW/7DE4ZRGPjdcN3S+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/rrjxZ8X/8/vitqecjCsjPV0ZGRlKN361fWUoPeM/v09LV1pamu3P0tP/86vxz2npSk1NVXxcrBLijOO+***REMOVE_SECRET***++***REMOVE_SECRET***+jipQu+0Qsjx+VaJyQ0WI+***REMOVE_SECRET***+rzT+***REMOVE_SECRET***+***REMOVE_SECRET***/W/bxUj/W7z2GOYc8MVefuHR2+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+j2+++***REMOVE_SECRET***+pxx+***REMOVE_SECRET***+***REMOVE_SECRET***+/***REMOVE_SECRET***/MFC+/n7y+***REMOVE_SECRET***/U/***REMOVE_SECRET***+aOFc9W4bTvbU0yLv/pS4x8b4eylumx+Y15+Xj3v7Cf/***REMOVE_SECRET***+***REMOVE_SECRET***+FHqu8dMlgPPvWEgsLCr5qZsV/***REMOVE_SECRET***/t2rLpq22Vzmc+***REMOVE_SECRET***+cLztr/AG3tsTH5qtJZ9+5NDYxDsuIDx/13PvDpZPfrdftVN2Y/v36e3J72klT8udXgCo+***REMOVE_SECRET***/FhVuKbGVe9Lio/***REMOVE_SECRET***/***REMOVE_SECRET***/2Fatm+jpq1bqG7jhqpWq6aCQsPkGxCY/xMxYpEJJMXH6Xz0GR3et087N2/VxrXr9deGjUWWj72J6zWs+3cDpWVTVa5W2V54gf258XrUC8+8pL82bnFojnfnzlC77j1s9+ze9KceuqW/***REMOVE_SECRET***/p0dsH5OqHHUZD/***REMOVE_SECRET***+eKU+***REMOVE_SECRET***+x808cmnlZKUXEDZM+y/BUa/OEE33X6Lht11v+0vfmavYWOGqnOPgt/***REMOVE_SECRET***+pUipW7O8NUbmsJWC8+hN34bzOnDypw3v3acufm7Vm2S+***REMOVE_SECRET***/3giO3E5vPAs3bt9Gzb76iilfZtD32/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+Pr6qlX7lmrZvoVatWtRYDkZDZNnh0/Qnp2O1T3v18Wq1aipUhIT9NKIp/Xdl/MLLEcGdkzg8XEjNWDIo/***REMOVE_SECRET***/p7CK1S6agX7t23R04Mft22+yFX0AgMeeVDHDh3RmuW/mE5m3ItjbH/hyutlvGqzbvV629fJY0X/U/***REMOVE_SECRET***+J2A0Us79p5Gy5c+***REMOVE_SECRET***/***REMOVE_SECRET***/J6WNH9MzDQ7XFwVfX/Pz99Pxrz6pO/***REMOVE_SECRET***+***REMOVE_SECRET***/G159S0ZROH7jGCD+w7qPW/bdCalWt1KvK0w/fn5w29+9+uNh2vV93GjRRevoK8S/rm5/***REMOVE_SECRET***/bp/***REMOVE_SECRET***+0BvPf+yw+WOmjBC13dq5/***REMOVE_SECRET***+n9r+eoVqOr/wV6z+***REMOVE_SECRET***/***REMOVE_SECRET***+VCwBkFrmRk6OzpKO3+a4t+W7ZCC2d/VWRpGo3RGzq3141dbnAoh3defU/Lflxh+***REMOVE_SECRET***/2qx7s3c/***REMOVE_SECRET***/0twZ5r9Bv/2+u/***REMOVE_SECRET***/***REMOVE_SECRET***/23atWfGLFs7+MlenlOQlj5IlfdTmhtbq0rOz6jaok+NQi+Z9p0/fm2l6ukrVqmj2z9+rVOky+***REMOVE_SECRET***//dq3y7FX0QYNHag+d/R2niLJBAEEnE+AponzrQkZIeCuAhkZGXrzhbf16/LVpkt8dfo7uumOq//06OCObRp294OKPH7C9JgEup6Ar5+***REMOVE_SECRET***/sxTeAJXrlzRhejT2rlps5Z9+***REMOVE_SECRET***/rz9/***REMOVE_SECRET***/K29cvS4YpifF6fexzmj/***REMOVE_SECRET***/+VSvPPO8meGIcQOBwMBANW7eSOvXrC/U44Fbd2gvY1+***REMOVE_SECRET***/qs3rftf8WZ9rx+Ztjg2Qh+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/Xfrhu436Zq6deXlk/***REMOVE_SECRET***+jhMU9nu0u+Abfq++81/***REMOVE_SECRET***/***REMOVE_SECRET***+/***REMOVE_SECRET***+1XH28fefn4yMfHR37+ASpTNkJePiXddAWKrqyYqJNa+f2PmjF1mqJPnym6RP4x8/vzPlNExQq6p8vNSoiPd4qcSCL/BZ5942Xd9uDAbAc+tm+Pbm7h2AbDQ0cP0U29uuR/***REMOVE_SECRET***+3AVTqb41+yPd2LtPtrHGo+EfT3mNo4RNSRJkT6Bs+XLq9+A9atelk6rUrC1PLy97t/***REMOVE_SECRET***+faHunjB3P//53dtDz75mK5r21qP3H53fg/NeE4o0H/Q/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/EVTk3//52pVqlk729iThw7o4Vv6K/L4SVNjEYTAvwVuv/***REMOVE_SECRET***/8Ejttds3PHy9PBQy+ZN1bxN+yIvb+***REMOVE_SECRET***+zS91/M0+***REMOVE_SECRET***+Dhzr2qVqxChqZ+8LmNjei4EELC4AE0Ti38AKB+BfBaIPh2t0Y+NlbGXib3L+Mn/km1/KrRs9o/G//***REMOVE_SECRET***+44YzQnPEp4q4eGhEiVKyNPTUyWML6+/f+/***REMOVE_SECRET***/GP2fYjqY2jsxNTEpWYg4/ba5QrozuuOuevJaap/tnfTJd5y/G/***REMOVE_SECRET***/***REMOVE_SECRET***+SWrF3m/wCg7IN/enLuRr36HB7w/DnCPxPwNin5OGRT+jGXj1UKoxHqvP60Th75rR+XrJYZ86ev+pQRgPEx8dLxh4hxkarJX195e/nJ+PRdv+AAPn5+cs/MEjBoaEqVqx4XlPK1/sTE+***REMOVE_SECRET***/kcGezfTZOc7jUaJn6+Pgr081NAYMD/N1SCgxXiAk+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/ffVevP/***REMOVE_SECRET***/tu2wnXBjNEQC/***REMOVE_SECRET***/r/MVL+TK08ZSKv7+fAv39FRQUqNDQMJWJiFCEE+***REMOVE_SECRET***+oVBaIkwf3q2ezdqaBRj8/***REMOVE_SECRET***/rHCxk+***REMOVE_SECRET***/NPPtaVrxw5J8G5eBrCfg4+OtXw/vkU82Dd4df6zXPTdlf2Lfv6VKlvTR+***REMOVE_SECRET***/***REMOVE_SECRET***/aKAqVHf+p0pSk42mSLJsv6YkK+1yku33xr4b/***REMOVE_SECRET***/9NZ+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+Ic7x031TCRNU5ALxsbG6dOG8zp+L0alTpxQdE6PzF2KVlp6er7kF+vuqRvVr1KjpdU5xFHNKYoKWL/pWU8ZNVGw+***REMOVE_SECRET***/n0H3Kb7Hi7ajaJNJUoQAgjkrwBNk/z1ZDQErCRgPF0yYdQkuyUbGxV+***REMOVE_SECRET***/***REMOVE_SECRET***+rM6dOKjjmrC5di8+***REMOVE_SECRET***+WZ5vwm+Oe1ez3p9stxvhv0wtvPq+***REMOVE_SECRET***+d1JODRig5h6M7/5vOzB8XqHHb7DdcW/***REMOVE_SECRET***/memnH2zwb5mRcwmnsnjx/ViWNHFRUVpeiYc0q+nGp+gGwiq1Ysp87de9lORiry68oVHdm3R++/8KpW/***REMOVE_SECRET***+NdgspFVJK02a/q8AgJ/***REMOVE_SECRET***/XkwBGKirR/***REMOVE_SECRET***/TXm1Ynq3KePfPz8nYYpKfac4s+dUUp8/***REMOVE_SECRET***/sxpfTn9Y338xnsFNQXjupHAu1/OUrtuWb8vOX/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/L/***REMOVE_SECRET***+J/8tLv7iBc398CNNe+UtVhyBHAW+***REMOVE_SECRET***/***REMOVE_SECRET***+jaYt/EqeJbyyxG7+7Tc92Luv3TEIcF+B5u1aa+***REMOVE_SECRET***/***REMOVE_SECRET***/XeS28U1pTM44ICy3b8ofCKVbJkPv/jT/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/MkNvT57CccXOtjhOkE+Dpo316eJvVcLbJ0s2I+65Xyt/***REMOVE_SECRET***+p+***REMOVE_SECRET***+g3TEIcC+BG27qqJEvTlSF6jWcqrDk+Iu6cPKw0lNT8i2v4p6eCgyvKP/***REMOVE_SECRET***/***REMOVE_SECRET***/9FHshRt7G/***REMOVE_SECRET***+***REMOVE_SECRET***/WBkFlK7gNPuz5FtxDGR5AWP/ky2bN+nAwcNKvMpGmVUrltct/***REMOVE_SECRET***/***REMOVE_SECRET***/E0hJiNW5o3uVkZE/r+IYJ+***REMOVE_SECRET***+***REMOVE_SECRET***//***REMOVE_SECRET***/Xg/***REMOVE_SECRET***/X8TstON16tB0+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/kGh8k3OFzGRq9cCCAgGc2T33/7Vbv27ldaWrp8vLw08KHB8snmJ/fO6BV/***REMOVE_SECRET***+***REMOVE_SECRET***/I2FHBl7+***REMOVE_SECRET***+eUKTh4/***REMOVE_SECRET***+***REMOVE_SECRET***/sDvbLvi0KKVMuS9zir77U2EeetHs/Aa4nULFyJb300du6tmVrp08+***REMOVE_SECRET***/***REMOVE_SECRET***+RR4+oB5N2tq9nwDXEvD09NSEqa+qe/9+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/keHfPO/rohelZjyFOTUnWgI7dtG/***REMOVE_SECRET***/***REMOVE_SECRET***/r72t1f/***REMOVE_SECRET***/ykD9/***REMOVE_SECRET***/HxD1LJoBD5+***REMOVE_SECRET***/Q9K8+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+d/W2Q5MHHBC/gH+OuX/dvlVdIv02R/rflNA3v1tZvA+***REMOVE_SECRET***+/NtDvbL3v/UkjZ8lniJj0+TN98/pXd+***REMOVE_SECRET***/N2e53E/gtRnvq/***REMOVE_SECRET***+d0X3Q+FihCwqgBNE6uuPHUjkFXAeMrk/***REMOVE_SECRET***+brTpNm7lwFaSOAAIIFLyA8Rfo1T/9qGceeVLJiYkFPyEzFKpAaOkwLdm+UV4lfTPNu2n1rxp0cz+***REMOVE_SECRET***+HrOAs2e/***REMOVE_SECRET***/***REMOVE_SECRET***/7MCbMjpbwIvDV7um7sfXOmITLS0tT/+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+ddquc/***REMOVE_SECRET***/y/ww8Kf9NFU+yfm/HZopwJDS2eiu5yUqC51G+vihZw3j8Xb+***REMOVE_SECRET***/bjjq4L+c9be4ZfLf63Wt/***REMOVE_SECRET***//jO578sksMWsW/6Shdw0E0oUEKlSuqPe//lyVa9V2oaxJFQEEEHANgaS4WE0c+pSWfvuDayRMllcVaNCsiWavWJLlz/***REMOVE_SECRET***/z5+***REMOVE_SECRET***/xdIlzLAdZIICAGwts3/C7ht01UBfOX3DjKt2/tAVrl2d5hTU9NUVdr71OMadz/oHTy++8oGsb13d/JCpEwJ0FaJq48+pSGwLmBMYPn6Ctm7blGDzqhed09+***REMOVE_SECRET***+drzmzbC/0bqVXFyp1t539tWkD97LkvLiL7/***REMOVE_SECRET***/CRw/***REMOVE_SECRET***/AUUr0KBJY72/***REMOVE_SECRET***/Jl/fzEcXuxENpSDg/gI0Tdx/jakQgZwEpr3xoRZ/uzRHpM69u+***REMOVE_SECRET***+5MgIAQQQsJBAemqqPnrlVU1/***REMOVE_SECRET***/gkUIUlBWiaWHLZKRoBm0B6Wpr6dx+gpKTkHEU+***REMOVE_SECRET***/***REMOVE_SECRET***+FuApgmfBASsK7Bu1e96+bkpdgF+***REMOVE_SECRET***+YYJ+fkdN1+710a/07Wx06XL1yoUQ8OsS6eE1c+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/u63KvrUaXuh/HkRCtSoU1vz16/***REMOVE_SECRET***/+o6e98kmMNniVK6Pfj++***REMOVE_SECRET***/***REMOVE_SECRET***/73JVE/JGwO0FaJq4/RJTIALZCoweMka7d+***REMOVE_SECRET***/7o+69V0j/***REMOVE_SECRET***+/py59+2aZdcroMZo7PetJg/8M/***REMOVE_SECRET***+nbprytXruSY+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/2b5dnCa9McVFHDqp74zbWQ3PCiie/***REMOVE_SECRET***/XAiKeyxPz4xeca/xiPDRflwvr5+2nC65PUpf+***REMOVE_SECRET***+eoVZcuWW7pZ2ySv2PnVYcKDArQ3B/nODIVsQgg4AwCNE2cYRXIAYHCFRjc/xGdisx5h/55q5eqVsPGWRIb1ONmbVq3oXATZrb/***REMOVE_SECRET***/22a/***REMOVE_SECRET***/8QcMG2P/vt9MW4GaJbYg8JB8//***REMOVE_SECRET***/9mix2e/7arDs7dMe0kAXq1K+***REMOVE_SECRET***+nzZd+pfvOWWSwalcr5KZI+d/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+cr8Zt22cp+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/VPZ276+CeA9aGKMLq10ceVEm/gEwZLPpsliYOy/q07j+Dps1+***REMOVE_SECRET***+wf4a+***REMOVE_SECRET***/TTpvV/FMJsTPFvgQVrlqv6tQ0y/est69bogR6354g1/***REMOVE_SECRET***+pL2/fzD/RghMBBBBAwNoC6ampGjNwsJb/sMTaEEVQ/XNvvqxbB2be1PXU0SPq1ijrBrH/TO/***REMOVE_SECRET***/***REMOVE_SECRET***/+Ec73l09DA9PHZslhh7R+***REMOVE_SECRET***/***REMOVE_SECRET***+N33avXSFUUwuzWn/OtclIp7eGQq/***REMOVE_SECRET***+dm+cs3SRrm2Z+dSW6BPH1eXa6+***REMOVE_SECRET***+TR265XRvXbgCjEATWHN2jgFIhmWYa++BgLV74fY6z/***REMOVE_SECRET***+PkFNWzS2e0fx4h4qW6epjF+***REMOVE_SECRET***/0iR9/Ob7OY46Y/***REMOVE_SECRET***//***REMOVE_SECRET***+//UrX3XBjphkWfvqpJo/Iuj/cP4Pe+uR11ahVvQAzY2gEEMg3AZom+***REMOVE_SECRET***/***REMOVE_SECRET***+hTZ3JzO/eYEJj83hvqNWBApsjfFv+kJ+7KfBTxv4ea9OYENbnO/hOnJlIgBAEEClqApklBCzM+As4hMHv65/p6jv0d9TedOSZPb59MSQ/***REMOVE_SECRET***+PWio+Nze0Q3JeDwLBnR+***REMOVE_SECRET***/LVOQ7k5++ntccPqNg/9s+***REMOVE_SECRET***/***REMOVE_SECRET***/oPo15fUqmkSMPH1KPJpk31f/31I8+***REMOVE_SECRET***+***REMOVE_SECRET***/JXBDt86a+uXnmf7t2VOR6lQn5//u3zPobvW7ry+***REMOVE_SECRET***+c4UHZNk5TEeLUod03eE7DoCE88/***REMOVE_SECRET***/lHY5RT9+85M+fOvjvA7H/f8QqFm3tr7+***REMOVE_SECRET***/i7BvbXXQ/0d7g4Y+***REMOVE_SECRET***+Q40AhocH65dDeTDFnjh/VTQ1a5D0Bi43QsWsHDR/3RK6qNo4YNo4a5kIAAQQQQCA/***REMOVE_SECRET***/E2MckN1dxD0+***REMOVE_SECRET***/XLz7+ilUcB/wB/***REMOVE_SECRET***/nbF+/***REMOVE_SECRET***+***REMOVE_SECRET***++rsCgQPM3/SOyuKenbS+TYsWK5+p+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+c9M+***REMOVE_SECRET***+JiuSma65WLFievbVcWreqpnpe/4daJyYY+***REMOVE_SECRET***+3rA2U82Hdu3QbW065ejARrCW+***REMOVE_SECRET***+***REMOVE_SECRET***+waXzMgT3IoAAAgggkEUg6dJZnTt+wI5MMc2ePkdfz1mAoIMCbW5oo/e//SbTXRtX/aLBt9yZ40i9b++***REMOVE_SECRET***+T/***REMOVE_SECRET***/MMMjqe4kVdXV3bvWeitrPc49e5/***REMOVE_SECRET***/+***REMOVE_SECRET***/J/f0wrO1FHTce3Sda1iGfSFQJO2zeG+etU3OA7/ug0T+***REMOVE_SECRET***+6Id40SeJ4zvtXL1C/***REMOVE_SECRET***+j25qBScsNAz9Og3Ex8BPWsUzCOg+***REMOVE_SECRET***/qECEJkIA+***REMOVE_SECRET***+N0+bavLS7078Mnwe/rluErDlSP/hVqNrC2g6Z8/+***REMOVE_SECRET***+AzkMGf4NhSt8B2L9d/KjThFnjULFKeWPHx/pJQD8IsGmiH/***REMOVE_SECRET***//wypS7MKzsnYwJH2slARIgARJQmIDP/atIiI/TWnXNUi8c2HlI63hjDpy+YiF+6dDxGwSdatTDnRvib/fMXzUHhX/g9ytj/***REMOVE_SECRET***+pjHDuef34JA+***REMOVE_SECRET***+0XmOsgat3bUGFWrW/***REMOVE_SECRET***/3aL7olgdQSOHbwOJbNW6lx+dFbl5AlZ+***REMOVE_SECRET***+***REMOVE_SECRET***+e42hvUYgLjY2ReuMLXj3+T+Q94d/j9lGR0agvOu/36OS47Hz2K+***REMOVE_SECRET***/9iaXyjnyIywkRONaQw+***REMOVE_SECRET***+zHuuUbUrzOmBacenQT6TO7fS35w+uXqPuj+KwSGxtr7Dy+3ZgwsVYS0G8CbJro9/7RPQloS8Dfzx/***REMOVE_SECRET***/***REMOVE_SECRET***/FDJuH2jTspXmcsCy6/e/***REMOVE_SECRET***+bMxVt+***REMOVE_SECRET***/xANFhKb9K+GPQR/***REMOVE_SECRET***/4nRRa7Ub1sSQsYN0bZ/6JEAC2hJg00RbUowjAf0n0KfDALx7/***REMOVE_SECRET***++Pj2mXbB/xN1/***REMOVE_SECRET***/44+***REMOVE_SECRET***/P/flNzAHvzZg8aJRRwhW+CM1aOgPFSkhzy42dswucs+***REMOVE_SECRET***+PP4Gd0VoELlPsP7od/kqd84q5Q1N8LDxd/***REMOVE_SECRET***/7cwNTP7Gnf97Gn0aCx+PtdQKbbs0Bxd+3aWpDzhJLlrwVIwt7SSJB+TkAAJkAAJkEBKCPg/v4/o8OCULPkaGxkRgf6dB8P/Q0Cq1hviopXb1+Oneg2/lhYdEYbybpp/***REMOVE_SECRET***/a1xnaAE58+TEik3fHlVKS422TpmQPnu+***REMOVE_SECRET***/9hU6xvawiM3L8A1979/r798eB9NK1QXLdPB0QG/***REMOVE_SECRET***/***REMOVE_SECRET***/X927cAPeh4k2lEmWKY4aHO/GRAAnoEwE2TfRpt+iVBNJOoHPTbggK/***REMOVE_SECRET***//***REMOVE_SECRET***+ewF0Qo6dG+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/ePU/***REMOVE_SECRET***/***REMOVE_SECRET***/HhsXrlOX8pMk8/Bowegzi+***REMOVE_SECRET***+ZhNs37qQxi/4u9z62H8XKV/***REMOVE_SECRET***/Up/CdA5CRgRATZNjGizWSoJAHj1/***REMOVE_SECRET***/***REMOVE_SECRET***/B15jA929Rs3Bpg0e4bMNi5M6n+***REMOVE_SECRET***/TrLN57Rb8tnlXmvPoW4IS5Upj4/***REMOVE_SECRET***/***REMOVE_SECRET***/GMfMs3+YT1o4Cy169Pi6BZFhoaiY7d+rh5Pbm+***REMOVE_SECRET***/***REMOVE_SECRET***/fhfR4eJvnWqjpe13Cm1y6UvM/***REMOVE_SECRET***+5ewvK1/x3IOq5wwcxqENPgwQ2fsZY/***REMOVE_SECRET***/u0H9ERTE0dNR3XLl2X1J9ak1lZW+***REMOVE_SECRET***/PAe1Qsa3mulpcuXhPuCKZJ+***REMOVE_SECRET***/eEOKVPB5+x692/WTJJfak7Tt0RljF/573XJwoD+q5v1Bo+***REMOVE_SECRET***/B1tHpS1xiIjrVqoc71//***REMOVE_SECRET***+D27g5iIMEkqXz5/JY4eOC5JLjUn2XJ8P34o9++***REMOVE_SECRET***+***REMOVE_SECRET***/t9WjQBNf/uiRqt2Gz+ug3XLyxosZ66YkESOD/CbBpwo8CCRgvgdmT5+HCn3+JAihepiQ2/XEEMDH5HPf+***REMOVE_SECRET***+yap+***REMOVE_SECRET***+GA96/Q63Cmge+L1g1B4V++***REMOVE_SECRET***/+***REMOVE_SECRET***/tbVn/XpMGz5O1KbwCxqvHZ5qK4V+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/C+***REMOVE_SECRET***+JjkOPNj3xMfCTQfEd4T4enYYM+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+wxZpE7LfCRAAiRAAiQgK4FQv7cI/iDdrDLh+G+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/XnC0H6DM7w2rEGllYWku+***REMOVE_SECRET***/aDz7v3kuZUOlnuAvmw66/TMDP/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+7z5En1+e3TYShp8Izvldf/L5zr+***REMOVE_SECRET***/n9ySVi4+PR8/WfeHv5y9pXqWSpXN2xh8PbsDS+ssctOtnT6NH4zYa5cdOG43K1X/***REMOVE_SECRET***/3QrUbtHys6Nn9+***REMOVE_SECRET***+***REMOVE_SECRET***//6dr6hh4W2N8y8fwNbR6XNc/+at8Neps6otMk+BPFi6bpEs/***REMOVE_SECRET***/E0/***REMOVE_SECRET***+LM9bJrZOGZE+e/7UGeMqEiABEiABElARgcjgQAS+fiy5o/07D2Lt0nWS55Uz4aiZU9BhQP/***REMOVE_SECRET***+yGhIR4tKlSE0/***REMOVE_SECRET***+EBIdKmleuZNY21jj1+DZsHdJ9lti+2hNzxk7WKCccyxGO5/***REMOVE_SECRET***/NEjGNi2qwTq0qYYMWkoqtepJm3S/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/DufMrrhz+SI61W2qmkL6D++DBs3qy+***REMOVE_SECRET***+yXJbdUSResX4VazZt/Tnd8zx6M7t5PY+***REMOVE_SECRET***+***REMOVE_SECRET***/S9YWFnjU0AAmpavgk+***REMOVE_SECRET***+jfgl5bqrRaOI/AT0GdEOztk1SsiRFsZlyF4GV/ZcBcXxIgARIgARIwJAIBPu+Rqj/O1lKmjtlPs6duiBL7rQmXbXTGxVr1/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***++***REMOVE_SECRET***++***REMOVE_SECRET***+D64hIS5WFhvDe4/G4wfqGRwvFHn8zmW4ZM+Fvy/+***REMOVE_SECRET***/+qVmqcc3Zk+cxb+oCjXFKBUxcMBMte/***REMOVE_SECRET***/iQAAkYAQE2TYxgk1kiCUhEYHT/sbh/56HGbGNmTUW7/v2wdIo71i9ZqTFeyoDm7Zqie/+***REMOVE_SECRET***+cufPi9/OnYSpuTnaVKmOpw+***REMOVE_SECRET***+E/gY+***REMOVE_SECRET***+7fT/WrdggS+6UJN3x5+8oWLI0pvTtj/***REMOVE_SECRET***/lP1Zm/A0x9RrXAcDR/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/5NXDj+B8b3G6YxPq0Bq7YsQ/***REMOVE_SECRET***/TFR58Xsnny9FiDg3t+ly2/***REMOVE_SECRET***/cPr8tWxgefD+jRpo9s+cUS7zp3DMGfQtHjl5Ya9YuV/***REMOVE_SECRET***/***REMOVE_SECRET***/T24iJDJetipnjZ+***REMOVE_SECRET***+vEaI3zvZfN/9+x7GDpogW/7/***REMOVE_SECRET***+***REMOVE_SECRET***/bQEpM+***REMOVE_SECRET***+Z5uO4aSlsSPdhePZEvtkp//U2Y6UHJvbXPGfNJbMLFqyeg/***REMOVE_SECRET***+H/***REMOVE_SECRET***/pF9x7Bi4SrZ8v+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/lm7YveHZfMAWly5eU2v43+***REMOVE_SECRET***+8PnjY+sGkklz5ErO+***REMOVE_SECRET***+hWLyyKl4+uiZLO7dsrpizXb5h8ZlzFkQ1o6cnC/***REMOVE_SECRET***/00u/***REMOVE_SECRET***/AhARIgARIgAWMmEB0eCv/nd2VFEBIcik5NuyE+Lk5WHSG58Hd7604t0bFne/***REMOVE_SECRET***/D3tVuYNWEuhGsF0/***REMOVE_SECRET***/***REMOVE_SECRET***+HwKwbO4K3Lh6M00u562YjSI/Fk5TDk2LTczMkLVwWeH9XU2h/HMSIAESIAESMAoCER/9EPRWnlll/***REMOVE_SECRET***+***REMOVE_SECRET***/DEYi2cvw9WLKfvy1bl3x8+D2+R+***REMOVE_SECRET***+8e+***REMOVE_SECRET***/Nf2entfhpY2bgyl8p+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+/QuIvoL1P+10CeAnkwaHR/5C+***REMOVE_SECRET***+5/PbQJZubmslZhZm4BV+FoDh8SIAESIAESIIEkCQS8fIio0I+y01m/ciP2/***REMOVE_SECRET***/zWDjVo3Qe3DPNGbXvNw+gyuc3HJpDmQECZAACZAACRgpgfCgD/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/Iy46UvYyDuw+***REMOVE_SECRET***/bRbZC6EACZAACZAACchM4JPPC4QF+sqsAkSEhaPdL10QHxeXrJZwRGfdTk/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+9qxB+***REMOVE_SECRET***+L+4gOC5bdoXA0p/0vXRAeFp6slvBmqve+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+Ph+SdLZ+5xq4ZHGR3bVd+sxwzppHdh0KkAAJkAAJkIChEXj/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***++***REMOVE_SECRET***+TZC1tRW2HfKGpZWl7M5tnDIgQ/***REMOVE_SECRET***+***REMOVE_SECRET***/DEYnZt1R3x8fJLO5q+ag8I/***REMOVE_SECRET***/h5/***REMOVE_SECRET***+PjuGcKD/BRxHh8Xh7YNOiIyUrxJ4+G1APkL5lPEE0VIgAQMnACbJga+wSyPBFRIYOPqzdi1dU+***REMOVE_SECRET***+BYdIVpSrW2bkz58f+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/Tfu3LqFR/***REMOVE_SECRET***+***REMOVE_SECRET***+yqLfs3wSm9Mtf/uhYqDTML+YfNphARw5MgcPf6VZz/8zSuXryER4+***REMOVE_SECRET***+a+LuH/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+Mazv95ClcvX8XDh+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/IuClcm8sBfoHomuLnhB+ISP2rPttDTK7uqgdH/***REMOVE_SECRET***+***REMOVE_SECRET***+uieQEB+***REMOVE_SECRET***+***REMOVE_SECRET***/l/vcv6IokPFDJ+P2dfG/***REMOVE_SECRET***/***REMOVE_SECRET***/lQqbRrvE79ldxESEKlb/***REMOVE_SECRET***/***REMOVE_SECRET***/cWHD1wEG/e+ujGhA5UO3fvhN7DR+pAmZLGRuDV0yeYMX4CHtx/***REMOVE_SECRET***+***REMOVE_SECRET***/B6NysO+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+BoeMHK+***REMOVE_SECRET***/xF90KBpfUXcm5qZw61IWUW0KPKFgL+vL/***REMOVE_SECRET***/B+***REMOVE_SECRET***+***REMOVE_SECRET***/AFZuv+jbCxU2Yoq61zRqTPlt8AyKq/hNCQEGxf74WDe/YjKOiT+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+3Xvh4/***REMOVE_SECRET***+7z5YWVril+a/oPvAQXB0ctblNhmVdqjfOwR/eK1ozVvWbcP2jb+***REMOVE_SECRET***++9OrbV/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/evIDGZ4e/***REMOVE_SECRET***/***REMOVE_SECRET***+MASOGoE6TZlKmZa7/***REMOVE_SECRET***/K/***REMOVE_SECRET***+***REMOVE_SECRET***+HQgSOGXKaitVWoWBYL1nopqkkx/SQwuk9f/HXhon6aV5HrYj/+gAmzZiBbrtwqcmUYVsIC3uPT+***REMOVE_SECRET***/rtybr7sVQxzFqS/***REMOVE_SECRET***/8xY+***REMOVE_SECRET***+***REMOVE_SECRET***+dE4xs2q49+***REMOVE_SECRET***+XCG+ZCG+bJPeMmDwU1Wsrd/***REMOVE_SECRET***/6UW+M6NG7Bl/SYEBiXfCEttbq77lkDRHwrBc/***REMOVE_SECRET***+***REMOVE_SECRET***+aW1shSsKRieoYk9PjePXgtXYK/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+JaDU/jLlKQorO17lqi3X92/fYPns2Thz5oK2SxgnA4F2HdtgwFj+JlQGtHqXcliP7rh6+bre+***REMOVE_SECRET***/fviubtmiqGytTcHG6Fyyqmp+9CR/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+7Rs8koE4CVy9eg/***REMOVE_SECRET***+***REMOVE_SECRET***+fh/J9/JStcvnJ5TJqt7G91MuYqBGsHZ+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+OXExNQUbkXKwcTERKaq9T/thmXLsGHteghHq/iokwD/***REMOVE_SECRET***+I1hUn+***REMOVE_SECRET***/xKmF17xRQpGghrNmxQ+***REMOVE_SECRET***/***REMOVE_SECRET***+2zpmkKM+gclw8fRpL58zDm7fvDKouQy5m/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+796iZd2GeuHV2E2ampqgS4+u6DFkqLGjSLL+mMgw+***REMOVE_SECRET***+***REMOVE_SECRET***+DwwSNqt0p/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/x4WTp+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+eUkBg+***REMOVE_SECRET***+NFoG/***REMOVE_SECRET***//***REMOVE_SECRET***+***REMOVE_SECRET***/Qb0Qod+***REMOVE_SECRET***+***REMOVE_SECRET***+QbRHgmonECvtn3xXuR2h+***REMOVE_SECRET***/VatVxszlK9KSgmv1hMDThw/***REMOVE_SECRET***+LhvYeiH9Z5K+egSLFC/ECTAAmQwPcE2DThp4IESCC1BJ4/***REMOVE_SECRET***/xfPEB0mG7mmuz+***REMOVE_SECRET***/h/***REMOVE_SECRET***+kc06fqvWGsEiXc038P/ihW8veohhdMrtg/***REMOVE_SECRET***+***REMOVE_SECRET***+/***REMOVE_SECRET***/A0i0JkID8BNg0kZ8xFUjAEAnc+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+HwF7/***REMOVE_SECRET***/SeMsztzDHzAVzUalmLaOD4P/iPqLDkn9DVU4gzx4/x5Ae4rOCsmZ3g+***REMOVE_SECRET***/3cI9n2tuO4/gt1b9obfBz9R/***REMOVE_SECRET***/AUoq3rnSEYelDRgxGy67Gc2NLdHgI/J/f0xVyrPJYg8N7xIeld+***REMOVE_SECRET***/qUphAL0yiV+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/iZ3JMnXy4sVfgLhzD8VRgCa+gPGyaGvsPi9bm6ZsHOP/iPaUP/FMwaOwa/***REMOVE_SECRET***/xWKviv/jRBQxqkgAJaE+ATRPtWTGSBEgA+***REMOVE_SECRET***+lsAnaeKQJWqlTBz2XKYmpqmar2+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+Z5rYGFhYbAEhNtzhFt0dPUIN/***REMOVE_SECRET***+SEC9BOLj49GmXntERUUna1IX1/***REMOVE_SECRET***/JD/8WBSL1q6FrZ2dwSJ4e/siYKKb8gL9A9GleQ9RcWtrK+***REMOVE_SECRET***+***REMOVE_SECRET***+GYO6DcWLpy9FPySzl85AsZI/***REMOVE_SECRET***/sr44nULka9AXkVxuOT/EZbWhvfFMiE+***REMOVE_SECRET***+FOtWr5MkF5PoL4EiRQthubc3LC0N7+***REMOVE_SECRET***/MmLZE3aO9jj18ObYWKi3BA7YY6JMM/E0B7hOsbWderh/fsPhlYa60kDgSxZMmPXieNpyMCl+***REMOVE_SECRET***/***REMOVE_SECRET***/kJc1YZVhNN+***REMOVE_SECRET***+uDihUtyyzC/***REMOVE_SECRET***+eOhI/***REMOVE_SECRET***+mIIjROxZ/XWFciWI6uilbgVLQdTU8N5bXn2+***REMOVE_SECRET***/***REMOVE_SECRET***/d/***REMOVE_SECRET***+8NW+***REMOVE_SECRET***/TPc+XKgTLly8LK2uob3ajIKFy/chUvX75R1I+xinXp0QW9hg03iPKjw4Lh/+K+zmq5ff02xg+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/bly+xY+N67N21XxW+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+/***REMOVE_SECRET***+z+***REMOVE_SECRET***/nKkZ04A7Tq2QfOOneCaLXuqeDx//Bjrly3F6T/***REMOVE_SECRET***/***REMOVE_SECRET***+8gj+sezfcvq27M916DVAL8+***REMOVE_SECRET***/***REMOVE_SECRET***+/DOLUwcNgq+***REMOVE_SECRET***+c/5PyTPnjiHee4LRT9anGvC/+WRAAmATRN+CEiABMQIaDPPpEGTeug/sq+iIJ1cc8E+***REMOVE_SECRET***/N1bktaTlmThoaF4+ewJAgMDYGFhAQtLS1j+89PSCpaWlrCwEn7+/3+sv/zkox2BWePG4veDR7QLlihq+NgRaN6xs0TZvqSJCA/***REMOVE_SECRET***/mWuio8ffzx/dWmieD7PtkDcc030/A0tHtilLAiSgNAE2TZQmTj0S0C8Cv+89gpWLPEVNj5s2GpWq/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/avZuKmZKU7fuKZVw+Txrb/hMWUGLp7+MqvENXs2FCxSCD/***REMOVE_SECRET***/qN0OzA4JioSmzduQEhYhGIfAwtzs8+***REMOVE_SECRET***/McuRd4CfN/***REMOVE_SECRET***+QbNvatX0Kd5W4SFhn+z1t7BDrM8l6FKvfowMTUV9SrMb+***REMOVE_SECRET***+***REMOVE_SECRET***+RXVlErs7o3rGDNoKIKDQ6RKyTz/ITBp5nTUbSI+***REMOVE_SECRET***//wVS1CxajXF9JIS2rtjG1680d0/bpQovmyp4qhSo7YSUqIawR+D0LCK/DeSubllwW/***REMOVE_SECRET***/6pztoZqIH/+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+GTx8/arVv/ccOQ++xY0VjheNcv1T+***REMOVE_SECRET***/***REMOVE_SECRET***/msXYGNn/93aLZ6rsHrZ6hTnTOkCNcwzOXpgL+4/NuyGX95c2dFERUdI+ndoj9u35GvK5cyVHVsPHfru4+***REMOVE_SECRET***/E2B8CgjUrF0d7h6LU7BC96F+***REMOVE_SECRET***+/u8Q+0ipVKZHWjdrSPGe3x/LaVw3Kpv5+6pzqvtwlbtW2HI+InahssSt9FrDYI+***REMOVE_SECRET***/DWrdrQPGeywSXXf/***REMOVE_SECRET***+/***REMOVE_SECRET***/N8zcntkfhIgAR0SYNNEh/ApTQIqJzB+yCTcvnFH1OVvR7Z+HsSo1GOXPgucs0p7jazc3s+dOI5xQ0fJLWO0+UuUKIblW7aI1j+pd18c/***REMOVE_SECRET***+***REMOVE_SECRET***//8bv7F33+dR9cGLVKtec3/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/v8U/jv4uMTEB8fi4S4eMTFx3/584QEJMR/+bN/4hITEj7/uTDD4HNcgrDuy8/oqCjExMYiJibm88+***REMOVE_SECRET***/F7tu8CVMHj9YqR1JBJx/eTHYG0D/***REMOVE_SECRET***/8IaO1IGrF6/***REMOVE_SECRET***/sGhVvRcjA1NdObTRvbry/On7uoN3710ejKTevxY+nk/1Fw+9JFdK7XNE2ljZwxCR0HDvwuR/DHj2hYRd4bbX78sShWbtuWJv+Gsjg6KhJRkZGIEhos0V/+***REMOVE_SECRET***/SD5Fg4dNRQtu3x/TMZz9hysmvt9M0VbA1v/***REMOVE_SECRET***/***REMOVE_SECRET***+NxY8d64AcGhmodMNm5YH/kKF1UVtklDBuPPk2ck9+TpvQFFS34/58d9wEDs3boz1Xq/nT6KAiVKJrs+KiIStcpVSHV+Lkw5gWzZ3LB+907YJjHMOuXZ5Fvh/+I+osOC5RPQkLl/p0F4/fKNaNR0j6koWUb/***REMOVE_SECRET***+K/***REMOVE_SECRET***/PpNmaSNKm2FSuWxwFP8dem18+***REMOVE_SECRET***+L71jwzosW7hUck8HT5+Ec8aM3+***REMOVE_SECRET***+8rhPnr7ijr0rnLcfzQCVE+***REMOVE_SECRET***+uIVNqjNDREHNm/G5MGpO0Zm7+***REMOVE_SECRET***+uQYCPm9fY+***REMOVE_SECRET***/evELdYuLHa5Iz45DOEedefT8w+b/xB3/***REMOVE_SECRET***/BSDwjfjnR05rh/YcxmqPtaIStRvUxJBxg+***REMOVE_SECRET***+LRQ/m+***REMOVE_SECRET***/PUaOOhv+VBnBIaGSpj5/52/AxOS7nImJiahXtCQ++KT8+tcpHnPQrJv4dcJj+***REMOVE_SECRET***+97GDtI/***REMOVE_SECRET***/Dl5xYxoEPJevRqey1epxY7B+5i9YCaq1BO/8veTvx+q5S+WYhY7zx1H/mLJ3/Jx7++***REMOVE_SECRET***+/QcQHRObZKipqQl69+mjqvkPk4cOwakTpzWVlqI/33n0IFyzJX3c8Y/duzCqx4AU5ataryYWb/OGicigbmEwb/0KlRAdk/***REMOVE_SECRET***+6KIuav4fe2cBEMXa9fE/3SEhYovdra96ba/d3WJhYWAnKioqimJ3Xzuu1+7uxEDBTrq7+***REMOVE_SECRET***+***REMOVE_SECRET***+8esZ+3CxrxFuO70f9luyjXhdNm4KL59nPv+eFQuHCNjh84Tzrh9C82M/PumEhwTh29CiiosU3h61bqzoat/hbaRBdPHkCi+bmvs+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/BC6cuoT1K9gn5yxYMQ91/id5zCvfUZkWLApTG+UemTjBfgiePfHkO3Wyx0Kg0V//w/***REMOVE_SECRET***/aCc15jUST8uNhan/***REMOVE_SECRET***/wOD+GDN9hkSbKclJGNGhC54/fMrqlymYrDt6ENo63P2tlsyYjvNnL/KaBxnLHYHWbVrB2T33DbJz55VbK+znJ8SE8j9im9tzusT8aS54+uAZq/***REMOVE_SECRET***+wdLPoOyLFEeBqYWfJrk1dau9euwY/N2Xm2SMW4CxsZGOHLxPEzNuBsE+335hJP7D+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+flRYTLs27cXxAydY/Q8Y1g/***REMOVE_SECRET***+***REMOVE_SECRET***/+6VhYW4K+xEOUlqQv9i+***REMOVE_SECRET***/87g3o3b+PntOwaOHo72vXuiYBHpd//tXOeBnVt2yRIeycqZgL6eHrYf+kep+pskxEQi6BN/***REMOVE_SECRET***/***REMOVE_SECRET***/+oie7d+uCkqXLKgWiL+/fYWC3XrzGYm1tJRppLe/eFhFhoejZpj3iYuN4jZ+M5Z1AseJFsfe/***REMOVE_SECRET***+***REMOVE_SECRET***+TF/***REMOVE_SECRET***+Di8f/MaySkpqFlXeXoXDOjYCV+//N4Nw8cadujcHrNcl/JhSqwNZqfKJHt7PH1K/Z7kBjmPhtt3aofZS5fl0Qp/6r5vHiE1JYU/***REMOVE_SECRET***/***REMOVE_SECRET***+pC/7u1IU/g3mwFPjxNRIVOEFn9EBH/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+c+hcFCyl+lG7o9w+IDf/***REMOVE_SECRET***/IkAEFEWAiiaKIk9+***REMOVE_SECRET***+ffrmIJHcqFhbm2HX8KCytC+***REMOVE_SECRET***/VfepHhEZg/xQmP5TxhKs+BkoFsBGrXqYk1uxW/yy0q8CciAvg9hibLUq9124BLpy+***REMOVE_SECRET***/CrLFeDrC4d+AxASEqosIVEcfxDo3K0jhk+***REMOVE_SECRET***+EwZVpezZC+GhOQdzPiJs3+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/+dws0bdxWCs0gRW2w/chAmZgUU4p+cqgYBpodSm/***REMOVE_SECRET***+LUocM4f/ocQkIlT17jNEQCCiegDMd0kuJjEPD+***REMOVE_SECRET***/HE5un/***REMOVE_SECRET***+***REMOVE_SECRET***+fPiIdz4+8PH+IEgs5EQYAkKOcReXUVpaKn6+***REMOVE_SECRET***/DMli0RAVQmkpKSIRu2xTYNp0OR/mLOEfboOn/mbFSoOE+***REMOVE_SECRET***+***REMOVE_SECRET***/asR3rV6+T8yqQ+fxIYMoMJ3QbRBNz8uPa5zbn8YMH4/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+2iXCb0+ZCJw9+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+VAeAszUuq3/7EHF6tUFDyo62A/***REMOVE_SECRET***/***REMOVE_SECRET***+TJ9yziOB4/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+/ngLC1ml/***REMOVE_SECRET***+***REMOVE_SECRET***+tO3u2SQSKQScDU1ASHzp2BqbmwTdl/vH4ApKUpZCGk2Xn7v7/qY+***REMOVE_SECRET***+fSkxQj09PRy/***REMOVE_SECRET***/***REMOVE_SECRET***/z2Pjqi2s+***REMOVE_SECRET***/UR8+***REMOVE_SECRET***/+iA+***REMOVE_SECRET***/SsSlaEvomw24GzLo/T8GF4/***REMOVE_SECRET***+HjEx8UiLiYG0ZGRiAgLQ1Jiklh/***REMOVE_SECRET***/***REMOVE_SECRET***+kV1YYADCQ4IR5B8A/+8/8OXDR3z99BnvvXzw7TM/***REMOVE_SECRET***+***REMOVE_SECRET***/L9/w5vnnrhx/jLOHf9P4bnq6euhaZuWqFm/LqrVrY0SZcvA0MQcmlpaCo+NrwBSU1PRt117+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/Q7U6tWFhWwya2toqEbukIO9euYQZk/***REMOVE_SECRET***/fwoiC9xTrh23zI6//y3G+YWijtGrDA45JgI5DcCVDTJbytO+RIB8QQ++***REMOVE_SECRET***+Xz7jxrkL2LN+KwL9Vb/***REMOVE_SECRET***+8/***REMOVE_SECRET***/x0GIjIhi9b/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+TuR5KDoT1HIIijubL75uUoX1m1/15XGGByTARUiQAVTVRptShWIiA/Aq+ev8Ysjk7xC1fOR+36NeUXRBb***REMOVE_AK******REMOVE_SECRET***+8lO0NETpvFlbmIUp7Nr/Vrs2ExTPfjiSXZyEth/8hhKlCkrVzSJsdEI/PhKrj7YjI/oMwr+vuy76BaucEbt/***REMOVE_SECRET***/***REMOVE_SECRET***+pLoFLlCth6+***REMOVE_SECRET***/5ylXH2zGRw0Yh5/***REMOVE_SECRET***/frj1Ssvwf2SQ/***REMOVE_SECRET***/XuYMHIMH+mTDSKQg4CFhTn+u3ENGnL885CSnAS/t08URp8ZOcyMHma7pi+YiiYt/***REMOVE_SECRET***/***REMOVE_SECRET***/LxrYQzC0tUMDKAuYFCsDI2BBBAUHw/+***REMOVE_SECRET***/aPpUXDx3mRdbZIQI/EnAfcNq1G8q34Lwj1f3FQZ+wvDJ+PTuE6v/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+tL3DIkMC0Wwnx9+fP6CD2/f4sNbb9y9ehMR4ZFyjT3TeL/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/hJi9pGVnYoEARYY4CZcY5vGdP+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+46+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+Qe890RSfJzc7LMZnjV+Dl55svc4GzVpJDr16KCQ+***REMOVE_SECRET***+nnP94gXMmzJDsPzIkfoSqPe/***REMOVE_SECRET***/2+Dbi9/***REMOVE_SECRET***+fgFq+***REMOVE_SECRET***+***REMOVE_SECRET***/QOE+2hFJOTU3BpzdvcGr/***REMOVE_SECRET***/Z27dgLmFfPqdBX9+g/joCIXAnD/NBU8fPGP1bT96MHoO6K6Q+***REMOVE_SECRET***+4+***REMOVE_SECRET***/RGTTn26Y66HO/***REMOVE_SECRET***+***REMOVE_SECRET***/eICFGMUWTeZMX4Plj9mOLA4f3R1/***REMOVE_SECRET***/***REMOVE_SECRET***+ffHO54MiwyDfakagQ+cOmOXqKpesgj6/***REMOVE_SECRET***++PkR+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/H/6yryO+***REMOVE_SECRET***/DvIAF71kFfniJxLgY3u1KY9DRfiK+***REMOVE_SECRET***/0eljm7KU3RRM/EHNYlK/KQGbeJY3t2w2MF+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/RxMgU1naVBQG2bqkrDu8/LIgvcqJeBKbOnoau/QeqZFJnD+***REMOVE_SECRET***+***REMOVE_SECRET***+CDMcl+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/1eaNfkT80IVK9RBRv+***REMOVE_SECRET***+ch7tx9DHNzU1hZWaBC+bKoUqV8Xs2qpP6zR8/hPIX9Tf+xy4ehr68nSH5aOrqwrVBbEF8je/fG2zc+gvgiJ+***REMOVE_SECRET***+***REMOVE_SECRET***+vR0hLVUzvnd5t+***REMOVE_SECRET***/twS2LHjAC5fybm7QN9AH02b/A+***REMOVE_SECRET***+***REMOVE_SECRET***/fuIDyNWryYUohNn58+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/YFWlYTZzaXysDgSuP/***REMOVE_SECRET***+k7pkjR7DMZYmQLsmXGhFwdHJE3+***REMOVE_SECRET***+/***REMOVE_SECRET***+8RiNCgIHRu3kpJV4TCUiYCm/duR5VadZUppDzHsnTKVBzesS/***REMOVE_SECRET***/UUMhGHcSMxeIwjby7jo8IR/OUtb/ZkMfTO+wMmj2Q/***REMOVE_SECRET***/AQpeVuSqYZPqqUaMypjiNho4u+/***REMOVE_SECRET***+f0KdjN7n6IOOqT8B9/WrUb9ZC9RP5I4NPXq/***REMOVE_SECRET***/***REMOVE_SECRET***+8/8Dew4TTEID/1a+FSZPY+35IY0dZZRztJ+***REMOVE_SECRET***+AqLu/b/amPrmf+gpa2ehfRVLgtw4kjexzErbIHIseAE+g/sg7EzZ/PmNyroJyL8v/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***//***REMOVE_SECRET***+fAtnz15GZFS0WD1mJLHHKheYq+EZ1qXObrh7/Z5EXm07t4bjtLHSoOdFRs+kAKxLVuDFliQjj+/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/qYv+Xo/***REMOVE_SECRET***+z6HWMmSxTF71niYmpqwmjh//hr27D0iUWbx4hkoU7oUVxgqdf/***REMOVE_SECRET***/h7duYMpYKprIFbKKGV+0whXN23VQsaj5Cffotm1YMk24wig/UQtn5cS9q7CrVEU4h0rk6fi+***REMOVE_SECRET***++***REMOVE_SECRET***/***REMOVE_SECRET***/W5cuYP7MuWJ3cMpqi+***REMOVE_SECRET***/vX76zuu/***REMOVE_SECRET***/***REMOVE_SECRET***/bjWJ2pVUqbnkFy3zL+/***REMOVE_SECRET***+***REMOVE_SECRET***/MGs+wsfbo3q+***REMOVE_SECRET***/***REMOVE_SECRET***+ZwOKligiWBpmhYrDxFp+/h7euiX6AEBX/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+ioc37+Dzh0/***REMOVE_SECRET***/mjJ+It298pJAmEXUnUKtOTazdvZu3NIM+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+vR7zYyo2Rw3uOYt/2/***REMOVE_SECRET***+XaF+***REMOVE_SECRET***/***REMOVE_SECRET***+whtS1f2907NMdevr60NXTE/3o6Oqm/+joiJpGa+loQ0tLG1ra2tDU0kr/***REMOVE_SECRET***++***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+f/qihNFRSPIkoK+nh1O3rsHQiJ+jymG+nxET4i/PkFltj+o/Fj+/+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/+HrB/***REMOVE_SECRET***/***REMOVE_SECRET***+ni81bVoJ5VPXrnfd7TB4peVcO0yH/6MWDgqapZ2gC69LyG+***REMOVE_SECRET***+***REMOVE_SECRET***+AcEchY25sx1QtkypWSitXLlJjx5+***REMOVE_SECRET***+WsEHB3sh3A/xR3xOnHoP+zcsIsT1/***REMOVE_SECRET***/Hjhy+mTpPuXKmhoQGWuc5BQRvpP/CfOHEOR46e4iTctm0L2A/***REMOVE_SECRET***+***REMOVE_SECRET***+fIXE2Gje7MlqyGXmEjy6+***REMOVE_SECRET***+Lo8ekPz9dokQxLFk8Q+rxw8+***REMOVE_SECRET***/KYKwIh/r5oWYG7ELvrzHHU/OuvXPkgJcURiAwPx2oXF1y+dFVxQZBn3gmUsiuJfaf+481uSlIC/Lyf8WZPVkPMDts+***REMOVE_SECRET***+ozF+***REMOVE_SECRET***/***REMOVE_SECRET***+6tHIV9hFUS5vDRrWQ+***REMOVE_SECRET***/BtwGSUIpCTy7fw/***REMOVE_SECRET***/8qbPVkNfXr3CROGT+***REMOVE_SECRET***+mW377Ro0RH5/Au20yKH8CVapUQM+BA9CqY2f5OyMPciHw+tEDDGzNfZRq/***REMOVE_SECRET***+GvUuDHK5eKlUqTy2HjnCq23/9y+QHK+YqTlMIqeOnsZWli+***REMOVE_SECRET***/iZnSjMjpSsV4EC5vDwcIGeLvfEG/dVm/H4sSfnagwb1g+t/+b+***REMOVE_SECRET***+wJH+/***REMOVE_SECRET***+fOYEL/4Zz+Dl0/jwo1a3HKkYDyE/D78R2uc+bguRSN1pU/m/***REMOVE_SECRET***+3Y8W8MHNCDM6Z//z2Hw0e4m8F2aN8Kgwb15LSnCgIO/***REMOVE_SECRET***/gb8aN0Cbzp3QvF0H/o2TRYUQOLFrJ1ycZnH6PnLrIspVU/0pZZyJ5iOB6+fPYtu6jWKP2eYjDCqVqqOTI/***REMOVE_SECRET***/***REMOVE_SECRET***/exWlefx2m9MhCQhCIC0tDZf++***REMOVE_SECRET***+***REMOVE_SECRET***/+***REMOVE_SECRET***/***REMOVE_SECRET***/71/***REMOVE_SECRET***+cSE+***REMOVE_SECRET***/mZJkIEAGpCFDRRCpM+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/L/PTpS7x89QavX/vg50/***REMOVE_SECRET***+***REMOVE_SECRET***+2E1N6kwMY8YmXPnR9eu7dC3j+QJDAmJiRjlMBXxCYnZ3DJ9TZj+JmzXKo+***REMOVE_SECRET***+zCHj/***REMOVE_SECRET***/fpWf+apC7m0r14T/T+5jGWee3UVRuzKqkBLFyBOB+zeu4dj+***REMOVE_SECRET***/***REMOVE_SECRET***+SusWbcD8XHxUmlZWJiDmRBTpzb//3BKFUCGEDPJhplo8+fVqFFdjHdkn8Awz9kN799/***REMOVE_SECRET***/q40FK+YJHqqekQms7fjr2p/lVbIeAAAgAElEQVSZQOj394gN594S/vLVW1FT4cdPXiAyIkrw/***REMOVE_SECRET***/VQ/W69aFvYKBKKVGsciBQw1y6Qtk5z/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+rzijo62A/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+L9F+***REMOVE_SECRET***/K5S/***REMOVE_SECRET***+***REMOVE_SECRET***/XL9F7p37+***REMOVE_SECRET***+LFiwiBQFAfI/qMgr9vgESfLdo2x+***REMOVE_SECRET***/GSMSKgDgSCfn7H35Wl+***REMOVE_SECRET***+BThEZGKDkel/ZctWxqrtm9FAUt+p+***REMOVE_SECRET***+***REMOVE_SECRET***+WusUU+e5IB69WvJPbN79x5j7bodv/***REMOVE_SECRET***+hHaxfsREXTl2S6NbA0AD7/tsDfX3hGwRbFi8HAzN+m+76v/***REMOVE_SECRET***+***REMOVE_SECRET***/yIRyBj97eeHzvDp4/***REMOVE_SECRET***+BgHvX0oflJwk37zyxvSxMzmtN2/***REMOVE_SECRET***+Mi/***REMOVE_SECRET***/***REMOVE_SECRET***/BhBx8AIGhp0/IUPtmRDdQg8v3sbQzv0lCrg6+9eokBB6ZrGSmWQhPIFAZ/Xr/D0/***REMOVE_SECRET***+DDKyTFRcvdD5cDt4XuuHXl9/tJSfJL1y1B1Rrq9/6Oiw/***REMOVE_SECRET***/***REMOVE_SECRET***+Hi4i76ta6uDubMnoTy5XPu/***REMOVE_SECRET***/si3O8rb/***REMOVE_SECRET***/McV+tFQx3/zwGmZW1lLJkhARkEQgIjQULx4/wsvnz+Hz5i283/ogTsopgupItWq1Kljo7oaCtvI/+***REMOVE_SECRET***+bt+5j0ybxO0WmTBmDunW4xwhfvHYPB/***REMOVE_SECRET***+/9/T0wrLl60S/ZwoqC+ZPQfHiRbPF4TRlPpi+***REMOVE_SECRET***/***REMOVE_SECRET***/Whqih41NbP8Hpm/zv4cIwNGh/mfSA/QZHa4iOxkyGbYZZ7TZAQy/WR5hEg/***REMOVE_SECRET***+yGbrpNhj9LLIZk6l+PZ9+M72RYNZ7Gb8X3RH9P/***REMOVE_SECRET***+VEq3Pr2BqQW/R/KkckxCak8gJCgI/t+/wd/3B/x/+iLQ3x8B/***REMOVE_SECRET***/***REMOVE_SECRET***/0/***REMOVE_SECRET***+rS8vnziFDbNs1hb98nm/qjR8+xavWWX88xx4WY/iwWlhb4+uUHDh4Sf7wmU2G+***REMOVE_SECRET***/ESpf0HT2Srnbd2mLcZOm+LeY7ecsS5WFgys/***REMOVE_SECRET***/j86Qt8v/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+kAalIZf7zWz7jeZGuSCD9MdNHNl/M84z9TF8ik+l+medSGd1f8aT+8vFLnokpNTU9toyx5L/8ZOj+ipPJLzVNVCjNzDMNqSL/6XlmZMn4FcWT7u+***REMOVE_SECRET***+8M3VTM2IQxSGKPT2GTD/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+IDvYT1KckZ/***REMOVE_SECRET***+nbpyu6dm3LW6YbN+3GrVsPftmTtLvj9u2H2LBxV678chU/mCa0TDPaPy+mIW2PHpLPAu/***REMOVE_SECRET***/H2eITmR+010Xl39/PoTnz5+wZePX/DB5wO+***REMOVE_SECRET***/zrPaS4mMR8OHlr0KVoM7/***REMOVE_SECRET***/vlzvHop+TiDw8iBaNFCfFNWWen/2ZPFdcls2NkVF2uGq+mtJN/MzhSmoa2k68yZy/hn//Ectzt2/BsDB/SQqNe3X/ouDNtCBdGkaQM0bvw/WFkWkBWBwuTnOs2H55MXrP4nTB+H1p3+VkiMZrYlYWLFz1SNkK8+iIvkeO3nMsuggGBcOHURl85eRliI/***REMOVE_SECRET***/oMHQZDI/56gMmCJ/iTF+JjlGMUtKP9RHz5yN27bOHK+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/4jg34g0v97nu1kNcDsINmzdT+uXWAf3c2rUzJGBIgAESACakWgcsPa+PrtJ2dO+vp6qN+***REMOVE_SECRET***+CyeDXeeEn+***REMOVE_SECRET***/uHClS2Bbu7uzNA+***REMOVE_SECRET***+***REMOVE_SECRET***/vPn+TGDPzfmvU+LHo2LuPUoywFzV/ff9CkCOv0iyk04ipeO/***REMOVE_SECRET***/***REMOVE_SECRET***/OIiYmZw+UMmVLYeH8qelNBnNxrfbYhocPn/***REMOVE_SECRET***++***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+XU5YEiAARyCcEqGii/***REMOVE_SECRET***/fbujSpQ2rrcv3PREWGQNtbS188/LCg/s5G7iKMzBj+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/df87Lkr2Lfv2K9Eu/XvBQ3dvH0Tz0UtJS4W5/89hcSM3S1Z5UePHoxmTRtymch2/+vXn5gxc1G255a6zkGpUuwfzM/eepI+JhkA8w3M/YuX8OULd6+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+zUeOMtYXtGI3Iwxv+mymaOEmXHBWfQyxvumy6bHo/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/OdVq0k9vPuU/YhO2eJF8fzek2yil14/***REMOVE_SECRET***/F3r1HRbaMjY0wb+4klCjB/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/4PMe8zvRY2h058W/SLzA7voiQy9DM3fvhjfmZ+0M33+NpJx3j6j5fSv+7/tp/02/***REMOVE_SECRET***+fX7/i6/tP+OjzDj+/f4f3l9/***REMOVE_SECRET***/ecZobNHIA+gzuxSlHAkSACOQzAlQ0Uf8Fdxw/***REMOVE_SECRET***+nnIe21YuVGPH36UtT/w8TYCM7OU6RSPXLxbg65+KhInDvOPlHnr7/qw3HcUIk+pk5diB8//***REMOVE_SECRET***+***REMOVE_SECRET***/wZn+G0wfjsyr26B+0PhjLGtaahq+vfVCibLlAF3+***REMOVE_SECRET***+7euCPRRMWKZTGfpTDj4uKON2/fZ9NnvtE/sF/8DgxmVwqzO+***REMOVE_SECRET***/iZMPxM/n6fpuyikuFJTUzF28AT8+PojhzTzLd/***REMOVE_SECRET***+bqdYKsy/xbc/v4WRmbkg1CICviEqUHn+***REMOVE_SECRET***+***REMOVE_SECRET***+QX3fnnXQkdA9PtNWdGw8zt3+PW3nTx8+T5/A61V6w7Q/r4I2VljrsVhiWB4eW/***REMOVE_SECRET***+fsGYESfUZwh/92+JSbOEj9RiFOZJwET68IwK1QiV9Z+vn2MtORkqXT/***REMOVE_SECRET***+PoC8+op0mXP8md+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/61GsRFFOOXkKWJYoBwNT9teLOP/***REMOVE_SECRET***+n+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+iDxkyAQmJv0endu7TDdoGOT/YM1s4z+w/mG1UcMlSxVGrqeQpMrLQ++jpiReeOc/crl+3BFZWkj/***REMOVE_SECRET***+***REMOVE_SECRET***+OxCDY21jmeDwgIwsRJ4ifruC2fh+***REMOVE_SECRET***/xiYmuPM95+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+93+Lxg+xj+hi5JUtmorRdSbE+xo6bidDQnDsQli2djZIli+fQ+fz5O2bNXiLWlrv7fBQprLi+H1yvH7b7k0dOwztvbsaLVs9HzTo18+KKF13LEuVhYCr+tS/OQVxkKEK++kjle+***REMOVE_SECRET***+IDYsZ0yKXBjPJy8w12m+***REMOVE_SECRET***/C9+03OluSrdq1gqmN+A/pcaHBOH/***REMOVE_SECRET***+Hr15xjX0eMGIBWLRuzxvTq/Ve8/ZSzKeefSsmJiTh/***REMOVE_SECRET***+Apt5NbVO3BbIH5iUNZYipcqjg171/4eGyt0oFn8FShiByMLG6kiYLYb+/uI3z3yp4ExA8fju5jXKiNXwMoS1z+8kconCREBoQgwjbqZ0dHMIzMamnlk+h6nP5/+mH4v/ddZuyKnZn0+***REMOVE_SECRET***/***REMOVE_SECRET***/LW0GQ0RUq/RoCnR/dbltHRFEWVISPS+W2PySfTLvNvabq6JjTSb2T8MA/M+O+MseEZOiLpDHuiW+mBpj9m5MLkn/V5JubfV8bo8V+***REMOVE_SECRET***+***REMOVE_SECRET***/Do0XOx7nr36ozu3duzhnLvhQ9++HP/g8kY+e7jjcf3H2ezN2Rwb7Rr1yKHDz//QDg5iR+XPGP6ONSsWfX/2DsLsCi3bo//h24QFcUAG7u7W4/***REMOVE_SECRET***/***REMOVE_SECRET***/tW2mUi49BGxy5YeNA78+Kz5vH/O6o927XT+EBivuf8JGC195/***REMOVE_SECRET***/ZMIkmS/***REMOVE_SECRET***/iw6SO3/spdi96c99rc98/lbNiVm6fNfP4es/o8iAIvz9x/***REMOVE_SECRET***/YCj5NCUgLcGwoozIAKygk1I7+***REMOVE_SECRET***/74cfA0PD3f//***REMOVE_SECRET***/***REMOVE_SECRET***+Td/6LBJCA+P+***REMOVE_SECRET***/2Q/k8KHTOH7yPGeMbFQxG1msbF26/xzhkfzu1ybEx+PysRNgp1t+***REMOVE_SECRET***+***REMOVE_SECRET***+T7E7FYJBq/***REMOVE_SECRET***+yf+FehgBUDpH/UswID+/dDT1pkYHYSxdI/4KXFBGmlIPmHHPt5yh/5PwsDUt2fxYsfhQkmIy1W/ChosP/+WdCQ6v34o56dDpD+90+b0q/sdMGPrz+LDz+LBj/***REMOVE_SECRET***/V2A8zIE6I+9H49ff1b60Y1tDIg9uumJ+***REMOVE_SECRET***/m2eMWMx2Njen6tosUIoU7MWZ+Lx4aE4d0K2mVjZcqVQpIL8VRV16fl++***REMOVE_SECRET***/q8j33ziDPL0xO0bt3+J1qheCWPHyvu4cvU2tm3br9Aki5/***REMOVE_SECRET***+IT0aFxZ06ZQi5Fcdz1ruC89+***REMOVE_SECRET***/HovnyPtp82jIyM8MjfC+wkjiaLFdT9P7+***REMOVE_SECRET***//bAldXt1+JWliYo3kX+RMUf5K4fPQ4oqJkT2l07N0DyRr+***REMOVE_SECRET***//wmFOtu2roClJfcf7apY6MJz17uPMG/***REMOVE_SECRET***+***REMOVE_SECRET***+8p4gIwB2bdqDI3uPKVW7/PoxHPLJN6wX4ivwyxvER/0+wSxENy1lZ/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+ZydOrHN7QxzW9nx1+L4OPh/***REMOVE_SECRET***+3fjmq/***REMOVE_SECRET***/7ZfunQTO3YelElU2dhhJihJiMPJ/UdkdPLmzY1qTZpoDZhELMb5w0dl+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+T3Pyef0IkmTue9ufPrhj/CDuk08Va1TF9gtnBKdy7MA+***REMOVE_SECRET***/itH9xynV6DKgF6atWC7A6m/***REMOVE_SECRET***/***REMOVE_SECRET***+GvXrQmHQspn0rtevQrv77J/***REMOVE_SECRET***+LtYtG7tAmTPbv/LDLuWwwogXIvrqs2GDbtw6/YDhWqpCzNCY9Yl+enjZ+***REMOVE_SECRET***/OHNB/***REMOVE_SECRET***+WYnxiRg76G94ff3GK6cBI/qhQ3fuxu28jJAQESACWY8AFU0y/56zppB9eo+SNof8uYq5FEHpGjWUJh/u541rF6/***REMOVE_SECRET***+y1+8/RZhISESn8we/***REMOVE_SECRET***/***REMOVE_SECRET***/aJGUGA9/91eQiH9PGFTpJJ0E1q/YiPMn+F1/***REMOVE_SECRET***+ys2Uvx4cPvTxbMzMzQohv3tA+WqUgiwbHd+***REMOVE_SECRET***/CgoXKiCn98nTB8/e/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+30FVRkpNiqenTBJiJUdDqALdO/ffogF0+V7z3HF9t/***REMOVE_SECRET***+***REMOVE_SECRET***+XB/X1y7kNI4t0f3DmjTpqn0+9SFp9QO8uTNjRXLZiv0O/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+RejQuBMS4pWfCLn2/***REMOVE_SECRET***/Y4+***REMOVE_SECRET***+rE+f/***REMOVE_SECRET***/YUL1/***REMOVE_SECRET***+4/RDzeX7602NAd/Tor/o4cQanpNS9670nmDflX06ZVl3a49/Nsk2F+***REMOVE_SECRET***+DvjcswfIW1B149nIgO8I9+fXK0TjwAUYYB/OTB45DawJO9/***REMOVE_SECRET***+LUgaN8xaVyXbq2QYd2LWR0Lt9/***REMOVE_SECRET***/i/***REMOVE_SECRET***//***REMOVE_SECRET***+eMcV/05byOmejfietW614PCunD+***REMOVE_SECRET***+nQQj0D1Jq5+jdayhSurRSmfiocAR+***REMOVE_SECRET***/ZHffuyE5+adOpLYysbLQK7+3Dh3j/nv8ou7/+aoi+fbr8iuHzNz+4vRXeET51ErEhQbhw+***REMOVE_SECRET***+fhjeO+RSExQ3RTWqUB+rNq2EsYmRvqYKm5fv4clqSZU/ZlI5349Mf2/FYJzu37xPJ6/***REMOVE_SECRET***/***REMOVE_SECRET***/BN+RT1HKlWpAOdSyj+***REMOVE_SECRET***/***REMOVE_SECRET***+7EBWxetRXspA2f1bB5A/w9fSwfUZ2TuXnlFpbNXckZV48h/TBpyWLBcd+***REMOVE_SECRET***+uCtvIL79zFFUrCP/IQ/zzRq/Bri/RGI8v14hmsYrRP/***REMOVE_SECRET***+ifPqOSqMKBJ7cuAkvT373Z0uWLIaZ//tbauXhy4/***REMOVE_SECRET***/***REMOVE_SECRET***/ea/UzPoje1CzSUqT+9Qr2PMDYiNCNA1D6/***REMOVE_SECRET***+***REMOVE_SECRET***/tKJCw/F+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***//Q/aPxIjJo1U3BI925eg+***REMOVE_SECRET***+maMX4Wnj+RfZ+X2ubK3VvQoI18T7uoYD+E+***REMOVE_SECRET***/B31/1qRHWkHbWv9M0npbzZwJx0dE4f+***REMOVE_SECRET***/gdfbz+ZyLr27YxPb93x9DG/P/7ZGOLVO1bC1FR5rx1dSv/***REMOVE_SECRET***+***REMOVE_SECRET***/yn8MhB9gYYr5r/sq5KFdZxXtfvsZIjggQgcxPgIommX+***REMOVE_SECRET***+***REMOVE_SECRET***+vbW6gRH+***REMOVE_SECRET***+eswK2rt3mnULN+DUybpz9Thc4cO4dN/8n2C/oz2VFT/8GgyZN45/9T8PH9O7hzX/***REMOVE_SECRET***+4qFZ27Zina9O4jI+***REMOVE_SECRET***+LAmGSJABLIQASqaZKHN/***REMOVE_SECRET***/08ZdXr/CMRw+***REMOVE_SECRET***/AtVS8aI2NjrN2xUjpK+N+pC/HwrrA//kf8PRQt2v+lq2nLxHXi4ClsW7eDM9Zxs6ag3/jxgnN56nofN++ontwk2DApEAEiQASIgM4RaF2/CsxNTTSKa9XCNSp7ii3ZuhZNO/***REMOVE_SECRET***/***REMOVE_SECRET***+gko9oQKR/r64wuPER4c+PQElV2OE+r197hyCApU3QOvQrgXYtRq+a/KU+fDkaG47edJIVKhQhq8pnZNjn/***REMOVE_SECRET***+ylQoxUc0Q2WO7T+***REMOVE_SECRET***/D08hTvj9nlCjALSg/***REMOVE_SECRET***+mLEBuj/***REMOVE_SECRET***+wjOX5CdbtK0ZVNY5VT+***REMOVE_SECRET***/nTArtKwKzVC1pChExHB8Yt/9uwJKO6i+YhBIfFoU3bSiCl4+0q+S3+J0sWxdMMiqav4+Hh0bCx7d5pvDKzL/fJNS+***REMOVE_SECRET***+fN5K3Lh8S6mNHWePoELtuim/o6MjEOih+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/F375nV4iMNTvK+jNwX/***REMOVE_SECRET***/g5NTXq2zSw+DK+evxrWL1+***REMOVE_SECRET***+GmYNXdbuXmZTo8H3L/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+Jf3LmDz5+//gqwZCkXFK+i/***REMOVE_SECRET***/OHjyH+jytLfzplV2jYVRqhKzQ0DMNHcI/JW7duIbLbZxNqNsPlTx4+ja1rtiuMY+***REMOVE_SECRET***+KQqI/P+***REMOVE_SECRET***+dMW4sEd5T3ETjy4joIlUq6++r57giQx9/***REMOVE_SECRET***/***REMOVE_SECRET***/GoKWlJZp1aqf0uk1UoD8un7v8S8/AQIR2bPqOtq/oAPD/***REMOVE_SECRET***+fnBXaMfZOS/***REMOVE_SECRET***/WKHk1lJ8+eoaZ/***REMOVE_SECRET***//HRzTdZbav34XjB05w+***REMOVE_SECRET***+aOBduD58qtXH+***REMOVE_SECRET***+7JBhEgApmRABVNMuOu8s/pv/8246Gr7C/***REMOVE_SECRET***+***REMOVE_SECRET***+f4mfq+EoPHfaGZnDXYQrH/zkXcsaiNf/C2iblSCxbj+4/wdzJ/2ottGatm2L0pBFas6ctQ+zUDTt9w7UWbV6N5l2E93Xx+PQBJ0+***REMOVE_SECRET***+F509eKM3y6ls35MiTD+F+***REMOVE_SECRET***/QIwfvxMGW1TM1O07NQeMOI+WfHq/j18+***REMOVE_SECRET***+8XXEJcHB7fvAV/vwCFto1NjDFvzkQUKOCkdl7Xr9/***REMOVE_SECRET***+7KVymLavElybzZYLxPW00Sbq8+QnujS+/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/YKTOHCBVG+***REMOVE_SECRET***/o5QkxOPk/***REMOVE_SECRET***+***REMOVE_SECRET***/+***REMOVE_SECRET***/ivi+9cvcmNGjTTrDt71+/***REMOVE_SECRET***/DJ2ED2+Vf1hx3+sjLGxsEeD+***REMOVE_SECRET***/auIING/T9NdzNplndP+***REMOVE_SECRET***+2fG8TVo0gbVD7jQB6vHiOZ4/***REMOVE_SECRET***+***REMOVE_SECRET***/CsbFxGNRliNbuJyvKu/+IfujYXXghIi0Yrlq0BlfOcU+5Wb1vG+***REMOVE_SECRET***/KFuO+Hs0n+DEDxsPj0xeloq6+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/kN795+***REMOVE_SECRET***+***REMOVE_SECRET***+G19dvSm24BX6DobEJvr/ibrSvURBKlI/tP4EdG3allXk5u3OXz0LFqhV+/fzDmw/4Z9hkpf7X714Np4LqX81Ot+***REMOVE_SECRET***/Mn3L/***REMOVE_SECRET***/f3h/ukzAgM1n9iias+***REMOVE_SECRET***+***REMOVE_SECRET***+nCiZMlc5bj9tU73EWTw7tRs+nvMcx82QQH+***REMOVE_SECRET***+***REMOVE_SECRET***/cFzOcJGihVG2Vk25n4tjonH6sKx84+aNYJM7j1aCY5Nznt+/j8+fv3Laq1GzKgyNjOD51QvfvL5rxa+***REMOVE_SECRET***+Y/***REMOVE_SECRET***/yf2J3cYje1C9ye971ary+***REMOVE_SECRET***/***REMOVE_SECRET***/r2ZPn+N/***REMOVE_SECRET***+7VjaxZuUlIQxY/+***REMOVE_SECRET***++jkrGFSsX0+***REMOVE_SECRET***+PsqnlSoUbI8ldt0boUhYwbJSI8d+Dc+/***REMOVE_SECRET***/iTg5vYSS5etVwilSu0ayF+kiMyzzy9e4MWzlzI/a9+rG0RKxhVzEpckIczfD0/uP0JEZMZ0c9e1V0N2+***REMOVE_SECRET***+***REMOVE_SECRET***+EJx1hslsDm4/***REMOVE_SECRET***/hHIaW+LBlVKaxR4l+Y9ERMdzWnDpXRJHLqbckXG+/***REMOVE_SECRET***+vT/f2EprmSPhEgAmlEgIomaQRWj83On/8fXr1+L5cB6y/SoEVz2ObI8etZTEgwLp4+LyPboEl9ZMvLb2SeiI3/DQuBp/tnvH/3CRKJRI/***REMOVE_SECRET***/Ag7ZbFC/***REMOVE_SECRET***+djnIxMXF4+VC1bh3o37fMTTRWbJuoUoWbbEL1/sFO3QHiPg892X0/+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+uzKSKO2rSBOTnl88fBRuT+w2/fsCpGxSYoAK5LExyEqNAT+Pn74+***REMOVE_SECRET***/Ji3YjZyOKT9tabJo6bhzQvFE54Yl+***REMOVE_SECRET***+kUgPYomXfr3xLSVK6Rggr0+***REMOVE_SECRET***+***REMOVE_SECRET***/ofwcMWfQOTN54jaTRojMRl46+qK9+8+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+S/PnzYMG/U2FsYizNu3+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+evoy1SxX38mPPR/w9FC3a/6WtEMgOESAC+kqAiib6unNpH/fNW/exceNuTke5c+dE7WZN4Pv1C+***REMOVE_SECRET***+qF2rKmrXrory5YU1lEvd/DV1jqwwM3XKaGmRiq1TR85gy+ptWsenTYPsStn/Fk1D+cqppj9p0YmqLvw7zx9D+ZpUNNEicjJFBIgAEch0BByy26J+ZWG/t/+EEB0Vja5/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/wwH66nyc/Vp15/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/0ll2PuQgM+v1Aa1d9t+HNx5WG399Fa0z54Nu0/ukHN7+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+sp87KFSkN+***REMOVE_SECRET***+7fkXTRhN3/***REMOVE_SECRET***/+***REMOVE_SECRET***/hKVTIGTNn/gMz0x+TkH6kd+HUJaxbtiFtk01D64ZGRug/rDfadW2rFS8DOg1BgH8Ap639V8+***REMOVE_SECRET***/***REMOVE_SECRET***+2LJrGVw//BZpawuCxQvVRzLNi6SC5E1+B/***REMOVE_SECRET***/***REMOVE_SECRET***/mIU5vMVUcG+***REMOVE_SECRET***+ekPqZKMRMBIqAtAlQ00RbJzGfn/Qd37Nt7DJ/cv/BOLleunKhavQpsHR0RE8f/uCdvBySokICRoSFiwkLg6/***REMOVE_SECRET***/xaszjQ7YW5hjoEj+qF522Zq5pSMbi16c96FZkYPXD+***REMOVE_SECRET***+DRrDBAcHo23Gg0tS7DeqDKcuW/pKJCvZDmI/i93mvnr/B+mUblfbs0kfOk+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+Efp2UX8+p37wR/ju4/***REMOVE_SECRET***+S/gx/***REMOVE_SECRET***+xP+kEEuAXctZu2aB9GvqxT59YZ/CZNZlamqKgaP6oUW7v3inGB4agZ5t+iiVP3zrEoqVK8/b5k9BsViM1f/9J1iPFIgAESACRED/***REMOVE_SECRET***+zXtMGDZF7lnPAd3RvX9X/XtRUcREgAhohwAVTbTDUd+***REMOVE_SECRET***/***REMOVE_SECRET***/1UkVH7E4Eav/o+***REMOVE_SECRET***/uaTGVCqzGHtzlUoUNhZTo4Vizo0lp+uw0YOs9HDtIgAEciiBKhokkU3/o+0IyIisWjxGrBTJnxWnjy5Ub1+bcBE/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+7u2LhQvXIDiYe/***REMOVE_SECRET***/fSwccis+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+KU75OSUp4lJ0uQmCiGmD0XJ0m/ipPEUlusNwT77/***REMOVE_SECRET***+04SO37+GQiVLC86f/d/***REMOVE_SECRET***+GNw16Fq62clxbz582DT/***REMOVE_SECRET***/***REMOVE_SECRET***/Qj+fPrhj/KAJWolBn43YZrNFt75d0KxV01/Fk+***REMOVE_SECRET***+GNpthN7mn96BHzy/***REMOVE_SECRET***/RIAIZDQBKppk9A5kjP/Dh07j+***REMOVE_SECRET***/ctXvHn1ltfJFrWdZVLF7Nnt4ZgnN+xz5oC1nS1MLKwgMjISnG24ry+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+ObD+JZMmzUWQioagDZs1hp2jI3/***REMOVE_SECRET***/***REMOVE_SECRET***//sCtWqYC5K2YpdDy6/zh8cf+q8FnBIgWwZsd/***REMOVE_SECRET***/j5+***REMOVE_SECRET***+***REMOVE_SECRET***/i4WKxbu04Dz6RKBIgAESAC+kJA06LJd8/vGNZrlL6km+Fxsn5yB87tURjHwplLcO/***REMOVE_SECRET***+dm3e0ZoaGyH4+***REMOVE_SECRET***+Y+vbHJPsnRCj4RN60lmz5IgSfopk4S4+ARdTEsuJtZ4Nioq+tfP2TWfjRsWc8b+v/Gz8ezJc73ITVeDPOt2D/***REMOVE_SECRET***/b7Tu8Cu2qZeqnq5rdiyFMWKq3+FXXikpEEEiECGEqCiSYbiT1fnT5++***REMOVE_SECRET***+***REMOVE_SECRET***/YAeQoWEswmLi4W6+***REMOVE_SECRET***+cu4aVi3ibsQ+***REMOVE_SECRET***/IYKDQtXKxskpL/I55YeFlRVMTE1haGICESuICDjm+Mb1IT68+***REMOVE_SECRET***/42QkTdtKElmYELjx/CMcCiicTKbMcFxOD9evXa+***REMOVE_SECRET***+***REMOVE_SECRET***/OBZxgn8sBFjZ2kIh+***REMOVE_SECRET***/DCaLE/***REMOVE_SECRET***+PrBy/MbIiOieOkqElq5ci4cczso1D+w4xD2bT+***REMOVE_SECRET***+HQZyGhowoh86dG/H3xFJEgEioN8EqGii3/***REMOVE_SECRET***+DV0fHXHByzo/***REMOVE_SECRET***+zdv+***REMOVE_SECRET***+ikCb20iAARIAJZgoBjzmyoU1H+***REMOVE_SECRET***+***REMOVE_SECRET***+756w2LmKJg0a10e2fPnljElio/***REMOVE_SECRET***+qNm7EV1wrcuF+***REMOVE_SECRET***/***REMOVE_SECRET***//***REMOVE_SECRET***/***REMOVE_SECRET***/Fi+ZMNX16+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+/eKG9s6OeVD6QrlYJbNXu2YAj2/***REMOVE_SECRET***/Q/***REMOVE_SECRET***/tXjO4/Th9Tz9CYNx/***REMOVE_SECRET***/59/p56dITE244zMUJyAY/***REMOVE_SECRET***+v3uLR65uco+nTx+***REMOVE_SECRET***+***REMOVE_SECRET***/PPqMAXrZmP0uVLyblfPGsp7ly/***REMOVE_SECRET***+nTl7H/***REMOVE_SECRET***/HM7YVWXVrbWKFJh/***REMOVE_SECRET***/***REMOVE_SECRET***/4oJCXRsbG+w/t5uQEgEikFUIUNEkq+***REMOVE_SECRET***/Z8so3lU0rynFhITh/***REMOVE_SECRET***+6sJ7xhf3b+HTx895Ezt2L4S5uaK+9Eou8urdeCZ3ODl10/***REMOVE_SECRET***/***REMOVE_SECRET***+Y8UBw3+***REMOVE_SECRET***/C+***REMOVE_SECRET***/J5dUtmsRERmIjFU0y+***REMOVE_SECRET***+***REMOVE_SECRET***/Q9YS0wNRInAkRAWwSoaKItkvph5+***REMOVE_SECRET***+/j08TPvPPgIFilSEGVr1+***REMOVE_SECRET***/e3FixbLbC+CPCI9GjVW+t5paVjV16/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/XBtUvXtG6/Q58egEHaxa0oYK+3r/Hk0TPBuTRq1hC2ShqNHt+5R85mqVLF8b8Zirvsf3z/***REMOVE_SECRET***/cvqG8MWzqEEuXLoGyVSshTqL9u5+***REMOVE_SECRET***+VnJyUhBN79svZrF27GkaN7K/QF+***REMOVE_SECRET***/hNNJE/V2Pa9TXmzat05O+***REMOVE_SECRET***+0Fe2Zc1cRa6S4ASgfH34en3H/9n0+ojIy5SqUQcny5RCfrN3iyb0LF+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/ulrWiDQiNw/dErjcx9e/8Ojx8+UctGpcrlUaBoERhZWqsceczHgf/***REMOVE_SECRET***/4J9++ql0u+fI6o2rixTChJcbE4dTClj82fq1mz+ujfr5vCsNct24ALpy5pK6Usb+***REMOVE_SECRET***/zF/***REMOVE_SECRET***+***REMOVE_SECRET***/lp8VfjdCnT2eFZmf+PQdPHwvvrcI3xqwmd/75A+***REMOVE_SECRET***/SOQN6c9alVU/3oOFU3U3/***REMOVE_SECRET***+***REMOVE_SECRET***/vrmDZ4+fqpxzNZWVihRygV5CzjB0MIakmT+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/w1dcTq5Np7YwsrKR/jzM+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/iQoNx/***REMOVE_SECRET***+***REMOVE_SECRET***/bZs8kEEBsbh85NFfd+***REMOVE_SECRET***/+***REMOVE_SECRET***/H6o0aiDVfXnvLtw/***REMOVE_SECRET***+fPTGq31j9S1wHIt5ycCMc8+aWiSRJLEbbBoqvMTPBspXKYsF/***REMOVE_SECRET***/***REMOVE_SECRET***//***REMOVE_SECRET***/ZyO92p1K6TGTj++***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+7d2qNt22Zyz54/eYEZ42dpP8gsbPHUo1tw/***REMOVE_SECRET***+uLF0b0GaO3+***REMOVE_SECRET***+***REMOVE_SECRET***/7kOFz3r27IDWrZrKPXO9+***REMOVE_SECRET***/V/yM/***REMOVE_SECRET***/***REMOVE_SECRET***+/***REMOVE_SECRET***/***REMOVE_SECRET***/+***REMOVE_SECRET***+***REMOVE_SECRET***+nZB8+***REMOVE_SECRET***+B3vUrFBC7Qy+e37DMDppohY/RdNzPn/0wNiBf3Pao54maqEmJSKgnwSoaKKf+6aNqO8+fQufwJSRtp+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/EdSDi7Uc3wyGXg0wkb1+***REMOVE_SECRET***/***REMOVE_SECRET***/A0MkipMg+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+u3dPGvD07ss2dDpaqVYOeYF0kS9c/zuN24AU/P75wpDx3SGw0a1JJ7vn/***REMOVE_SECRET***+98Xg7sM1CyKLau89tRN29nYy2T9+***REMOVE_SECRET***/SNfLNxAXL1zH9Ss3si4EHcrcqUB+***REMOVE_SECRET***/PdF0OoaKLWBhy+uA8WlpYyujcu38Tyef9x2qtRtzqmz+e+***REMOVE_SECRET***+wutXb1XaGjmiP+***REMOVE_SECRET***+02dJ04Rq/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+PbZA0+***REMOVE_SECRET***/bFz1x7BeqRABHSdgK2ZMfasWI+***REMOVE_SECRET***++***REMOVE_SECRET***/***REMOVE_SECRET***+Pv4Y1HWoNkLJUjZKly+***REMOVE_SECRET***+Dp01cER0sEypYrDfuc2SFi/***REMOVE_SECRET***/CPTxxfOnLxDPY7pE0yb10L17e7x9+wFLl21QmMWECcNRuZJ8nw0qmmhp0/8wc+DGeZSoUEmw4eBAf+***REMOVE_SECRET***+EblfNejUw7d/***REMOVE_SECRET***+YExIS4fn1G756fYeX53d4+/***REMOVE_SECRET***/eMiiba39cD18+hREX5q1CqPAX7+***REMOVE_SECRET***/***REMOVE_SECRET***+j0JkZDQiIyLh6fUdAQHBuhFwJo+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+l/z4miSW/jd7HiUt8EQhJiZW4/***REMOVE_SECRET***+dGGdNJE+zu57+oZlKpcVbDhIH8/***REMOVE_SECRET***/vP8QD6/***REMOVE_SECRET***+i4wWjdsaVcbq3qtFOa76iJ/2fvLOCiSt89/***REMOVE_SECRET***+***REMOVE_SECRET***+aN1CxS2seH1+***REMOVE_SECRET***+/xjPr4sZr8eM2aMlPwIRx/ahar0GrA1+***REMOVE_SECRET***+***REMOVE_SECRET***/r5j0kwi8l3og/***REMOVE_SECRET***+***REMOVE_SECRET***+vVrYeKE4bydNuJWv/5jkZcnuEV94QJvlCrlKKC6L+YA1q+QfK9UEoqKBrXt6F5Uq9+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/L/8F3qr/***REMOVE_SECRET***+H2aBRPThUqKj0qLOSk7A/Zo9C4jAxNUGVKpVw5fK/Uvnr3687Oku5JXTMWE98+***REMOVE_SECRET***/IvU+7fxiKCdJqy5kYJqEIi/dx/***REMOVE_SECRET***/EkB5UNGF7D/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+YOfKaB4+QQi/***REMOVE_SECRET***/7cjn798gW4Dx8rslEiA8Hc3Ay+s6fC8bctpJIA+c1Zgvv3HwuIbVi/***REMOVE_SECRET***+Q3hw/bZU0Yz3n4mkLG7NWg10dRA+f6nY/3Z+D6Jlp/YoKceGs1IlR0JEgAUBx+***REMOVE_SECRET***+f/4afnMW8woltWpVg+eM8bwg3r37gJlegUhLEz+xpmGTBrB35v6NiywZZyV/***REMOVE_SECRET***+PhR9GhmExMTXsGkdOmSklwKXF+***REMOVE_SECRET***+***REMOVE_SECRET***+xg+***REMOVE_SECRET***+kGAGTHs5RWIxMSkH+8NGNATri5teP9mdqAEBCyXSKxz7+7QNzWTKCdvgee3b+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+Bo4R5t+iBDzH/Heg/***REMOVE_SECRET***/Y+***REMOVE_SECRET***/E4YaYJq/***REMOVE_SECRET***/m/8Ob6WXC9DQRtl4+f4mxA9w5+yNFQQJciybv4l9j+3YqmtAzpT4EXly/***REMOVE_SECRET***+***REMOVE_SECRET***/Apfkr4jEFdh4o1NnXWZLRq/***REMOVE_SECRET***+LTadZy2awccovtChiZSZ9xYHdkic+SBNL7/69MNFb+FGX+FcvMLBLT6SL+SZj2LB+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+YJDQ3Eb27o27d+6LzLtp0waYMF78Nx3SPGovX7yBhyd/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+2Nb58+QYeMwQ7l/8aa/ny5VC1caOCDJ9nm2kseHBHNNLT0+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/PdeboGRIa0l4GRnjQbVK3DO/+vnr3CjoonU/ERNwFk6Nxgnj50S/***REMOVE_SECRET***+/ah9jYQ2L1/***REMOVE_SECRET***+***REMOVE_SECRET***+QkJ+PU/***REMOVE_SECRET***/DdrQRbkEC7Tm0x8dtkx1+***REMOVE_SECRET***/3cJGzdulzgG0tbWCosXzv7R32TKND/Ev3knMshCFuZo260LoKNbYIk8vXkD/***REMOVE_SECRET***+cE1KpZVS4xfDfi5R2Ap09/***REMOVE_SECRET***/X29UtE7hDcOszGBskSAUUQePi/Czh/4oyAq04DesG+***REMOVE_SECRET***/***REMOVE_SECRET***+cmZjTq10/sV8cDR49EL0GCN+tK61vkiMCREDNCFDRRM1umJqE++***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+JMg9Dm01uHZ3BBq2bss6/fjXL7BjRzRrPVIgAookUNjcFCEz/***REMOVE_SECRET***+***REMOVE_SECRET***+7fQ/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/i+***REMOVE_SECRET***/***REMOVE_SECRET***/b8jFrrm5GQ6dPQNdfb0f9o7t3wt/L1+R9mf5TEHVqtwbwIkL/OixUwgL2yEgUqaME8aMHgRHRwe+a5OGT8XjB0/kwoKMAGuit6Jxu/asUbx5+***REMOVE_SECRET***//Izfeln5mOLUFrODWNlSYv6+***REMOVE_SECRET***+***REMOVE_SECRET***/gtW8YXX/dWrfD+vfAjL82aNcD4cbKPFxYF5P69x/***REMOVE_SECRET***+cHXfEuro7agSfs/***REMOVE_SECRET***/I/4qtwEApw2PrPVpjiM1HA08ThU/***REMOVE_SECRET***/***REMOVE_SECRET***+YrohqxlypZCzWbN5AYx/etnHJLj0ZzFIcFo/***REMOVE_SECRET***/***REMOVE_SECRET***+3iN8+tmEed5IFFHEMDcxwtm9h3DjErv/***REMOVE_SECRET***/***REMOVE_SECRET***/h2n835WKrVGknROz/uasmNSUZPdv+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/1lEsOkowsXrIa//4rXWGof6/OWC+hEZokf3T9J4GQyDA06+***REMOVE_SECRET***/7QfaIgFoQoKKJWtwmjQoy8/+***REMOVE_SECRET***+K9s7FEf0kSM/bL1/***REMOVE_SECRET***+xInYQv+***REMOVE_SECRET***+UVopwlrZKSgBAK3TpzCv/+7JNTzMD9PKoAo4Z6QS/***REMOVE_SECRET***+uiAARUAYBKpoogzr5/PgxAdOm+***REMOVE_SECRET***/CzNezhMwNd+v08TxzgOQOHD/4sovxq748/GvMm1yhqnTt/BStXbpTobsliX5QsaY/***REMOVE_SECRET***/***REMOVE_SECRET***/AYhz87t+NzlZOTw+tnwvQ1EbXchvVDv6F9FBEi+SACREDVCFDRRNXuiPbEc/***REMOVE_SECRET***+fPoFbl+***REMOVE_SECRET***+ddmQ8FbN6BlZ/ZFk1fPnyF6F/***REMOVE_SECRET***+dULnXIhWIkAsokQMdzFEN//Y5Q2Jew43N27/***REMOVE_SECRET***+***REMOVE_SECRET***+qHmOGY3/iWiOyIz3Zcb8Knr17TdGrMsVy+ehWDEbnsyzx88xYYj4iTuKjl9d/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+e0DUyYW3j8+tXOHHsBGu93xWKFC2C/adPQkdHh3fp+***REMOVE_SECRET***+bb3U14QtYeHyQeGhaN3tZ3Ngaa2+evoE0btFj+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+qHz9/AldWrZFdna2gBlmJ0pw8FwU/***REMOVE_SECRET***+Bks9g+Sh2uttrFk02q07cG+UPbq2RNEx9BOE61+eNQk+***REMOVE_SECRET***/Yi7qTRkZGiDocAX0D/p2+***REMOVE_SECRET***+/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***++rpY0TvjuPumDSJgIIIZH78gJ1rN/***REMOVE_SECRET***/BLd7SMihkYY72PYVPqxFm4+nNG/jv6nVpzQuVmz3fD+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/Pz3CvKcjSy58m9vti2j+ZGBggLycb6cnJ+PIhAR/***REMOVE_SECRET***/7r3IVLr27owR7j8b/***REMOVE_SECRET***/vnnLGdb7V3/hJl1/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+PniIQ9E/***REMOVE_SECRET***+JevZU6xVEVnNO/***REMOVE_SECRET***+mePR2/***REMOVE_SECRET***+INLE6eRUEnVa/***REMOVE_SECRET***+SfevH4r1P/gwb3R4c9WEmMraIHLV64jKChUqBv/OR6oUIG/cSNzNMet0yCkpaUXdGgaa3/***REMOVE_SECRET***+35+5QfTQrVC6PoHWLBQKODN+***REMOVE_SECRET***+Ei5AAjI2hS2S/9e0DM0FhvZ+6dPcPbU/2SKPmTjWtRq2OiHjdNH/oL3NE+***REMOVE_SECRET***+Bllh662/gNCg+HSrz/r+J8/eYTdsbTThDU4UlAagexPCYhcE6YU/8O9JiNLT/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+LSyLIq9p/mn/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+PyP1bYGZuxneJ6WPC9DMRt3wX+qB+***REMOVE_SECRET***/***REMOVE_SECRET***+IfvmUANfmoo/eBAX5wcHeThrTCpHZu/***REMOVE_SECRET***+kcxx126GrC0yK/BwD/GuOSe/icewwt4LMdzuR+***REMOVE_SECRET***/ewMNjrtCYWrduipEjBP/ADw5Yib//+***REMOVE_SECRET***/NqxK2CNXVx+***REMOVE_SECRET***/***REMOVE_SECRET***/vW8dJlSmHbPv5v/wd16YInj58J9Td9+ljUrVODUx4FqTRxkg/ev08QcMH0X1m7bimY11/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/60pYF4eYrdEyMRq5NiRGDx+wg8bD+/ewdBe/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+jxvVRvEwZ6PxSOMlM/IoDsdzsfQ8i9thh2NrZ/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+ryaNGYRIBIsCWABVN2BIjeUUSSE/***REMOVE_SECRET***+***REMOVE_SECRET***/Q+O/***REMOVE_SECRET***+dZT7ESACBABqQnIWjTRAeDSrKvU/jRdsHxFZyzbINiU+ua12/By9xGb/rrtq+Hg6KDpiCg/***REMOVE_SECRET***+pM6eh+***REMOVE_SECRET***+hlYWOSmSM6I/uOAXMWmJb0BGYtDUDPESOkV/***REMOVE_SECRET***/dlSQHvFwhAcO/***REMOVE_SECRET***/74LQuFxd22GAm2qP/rt//zH85ggfDWpsbIR165bAyJC/Iey+mANYv4JdjwKl3zglB+CzeD56jRrJOoonD+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+PiL3b4GZuRn3+***REMOVE_SECRET***+G4Gu+***REMOVE_SECRET***/***REMOVE_SECRET***/ibypzVo1gae/h+***REMOVE_SECRET***+vj+I6/zPC3pCHgG+qHfuHHSCf8i9fzxQ+yO28tajxSIABEgAkRA/QjIXjTJg2szGjncqFkD+AQK9pt78zoeo/qOFftg+C/***REMOVE_SECRET***+5COgwvemBx/***REMOVE_SECRET***+EU8fPKCtktfLrEeALt/***REMOVE_SECRET***+Dzg/1Rsy7/***REMOVE_SECRET***/iQf5+***REMOVE_SECRET***/1p4+ew33oJKXHrg4BeMyfDbcJE1iH+***REMOVE_SECRET***/***REMOVE_SECRET***/JpztRpV8S4+Hu/fJ8gFhdvg/***REMOVE_SECRET***+0+***REMOVE_SECRET***+nzZmGAuzvr+***REMOVE_SECRET***/***REMOVE_SECRET***+L06fOSRKV6rr/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+eJt3b9EJmhnYez3Hp1gFjp44WuPH/***REMOVE_SECRET***/AgYPHEREh+Q/JTn164Pi+Q0hLS5PJObNV8+***REMOVE_SECRET***+***REMOVE_SECRET***/5Ctf+***REMOVE_SECRET***+YbhM/pSp/***REMOVE_SECRET***/***REMOVE_SECRET***+MySPE//***REMOVE_SECRET***+vfD38hWpNn7cUDRr1kAasyorM3d+MO7cvi8yvmXL5sLezpbv+pZ127ArgnpviILm7uOB4R6SC32/***REMOVE_SECRET***+Z5o3KKRAOd5XoG4ePaSSP5FLItgS+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+v/***REMOVE_SECRET***/***REMOVE_SECRET***/EQ0s8WLZsPR0YEvZEnj/FQpP0XHMm7mVIyamT+yms16F/***REMOVE_SECRET***+***REMOVE_SECRET***/yI7Bnz1/***REMOVE_SECRET***/6gV6/***REMOVE_SECRET***/44m6fz+***REMOVE_SECRET***/QZzD8VUCk3npwSASKg+***REMOVE_SECRET***+/***REMOVE_SECRET***/UlNT1S95jhGPnjwSnXq4CGgv8V+***REMOVE_SECRET***/gNISPjMKengtatQr2kzeIwahfPnhI/jZQwvXeKLEiXsOflQRaXHT5/***REMOVE_SECRET***/DhHbZs2cZajxSIABEgAkRA/QiULWmHOpXLcA9cB+***REMOVE_SECRET***+tW8CypCNe3b+PS+***REMOVE_SECRET***+0/***REMOVE_SECRET***/***REMOVE_SECRET***/JBRIvVr166GGR7jOdlXZaVXr99g+***REMOVE_SECRET***/O+***REMOVE_SECRET***/MStYeOGoHu/***REMOVE_SECRET***+9XDIzsjB+***REMOVE_SECRET***/***REMOVE_SECRET***/v+***REMOVE_SECRET***/2/cXa0+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+QXAL6K/yW7eEwNBQc8/Gnjt3GStDRP/x3rlTe/***REMOVE_SECRET***+PABABIkAEtIGAPIom/V0GITFR+JccmsLQa+4MNGnZmC+***REMOVE_SECRET***+GQFZ2DtIyMpGdk4Ocbz/zih+***REMOVE_SECRET***++***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/B2eqSmZ/J2g6Qx/85g/s28MkWR3PzCSE4O72dVWf+***REMOVE_SECRET***/n0CJk7yERlCwwa1MXmyYPO1p4+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/ym+7NOzKa4La+***REMOVE_SECRET***+***REMOVE_SECRET***+9APHn6Qmi+Zco4IjDAW+i1icOm4MnDp6w4aYpw/***REMOVE_SECRET***+***REMOVE_SECRET***+fPqED+***REMOVE_SECRET***/7wiWsDV+3FA0a9ZA4NLrF68x2m08GzQaI9t/5BDMWMK+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+PTxwTUaNKYNw2ooJZhdhbq16gA+xJ2BeWCk93g5etx8eK/QnV79XBBj56dhF7zGDsTd2/d4+RTXZV6Dx0A7+***REMOVE_SECRET***/D2zTuMGzQBmRlZYvGs3xkKewfV+***REMOVE_SECRET***+71W5joOQHtXNsUgBfuJpOTUzHdYw6+CGk4V760E+***REMOVE_SECRET***+w1xA0+***REMOVE_SECRET***+***REMOVE_SECRET***+beBIYyMDaGjpwcDfX0YGBjAwFAf+vrfXpl/M+***REMOVE_SECRET***/+9s5jUnB3WaNoSRtTWys3N4Y48zMsV/06BO7C1MjfH4+k0cjtrzI+xWf7bEVJ9JKpfG3bsPMXfeMuTlMR/***REMOVE_SECRET***/jQ+UASBlQz0H9MGvlcimlf4oxz/***REMOVE_SECRET***/GcXu36asyXEqKO5Rw7+***REMOVE_SECRET***+***REMOVE_SECRET***+jBkCkbMz0yRyIApDul9e08f+nq6+e/p6cGQ96rLu56bk4d9O/***REMOVE_SECRET***/090DjPxoJ+GV6mzDnkbVhdR/***REMOVE_SECRET***/eKSmiN9Nw/***REMOVE_SECRET***/4WmXOdhrXR3rUtGrcQ/***REMOVE_SECRET***+7rByS+***REMOVE_SECRET***+J3OWzEbdhnUEHHtPmo0b/96Uf0AqZrFr/***REMOVE_SECRET***+***REMOVE_SECRET***/CYyaHRIAIaDABKppo8M0toNSkGe/***REMOVE_SECRET***/PH/***REMOVE_SECRET***+BkiAgQASJABBRGoLyTPWrK0AiW+ZbHtVk3hcVbUI7KOJfGyjDBLwwu/***REMOVE_SECRET***+***REMOVE_SECRET***+99pmA0dfQM1s+UovOTxV/nPj0wd90aTiaWLWU/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+avD+WU3vKgIOT+***REMOVE_SECRET***/***REMOVE_SECRET***/v+Z4wMjL6cfn44X+***REMOVE_SECRET***+7d3UFhJzLGf5xiBeE/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/+/l/+***REMOVE_SECRET***+***REMOVE_SECRET***/du3cO92w/AnLktqKVORROGwRL/ZTh1/***REMOVE_SECRET***+***REMOVE_SECRET***+Q/vwhcBMFBw/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***//***REMOVE_SECRET***++***REMOVE_SECRET***/0WI/***REMOVE_SECRET***+4/***REMOVE_SECRET***/R8/xKTZqaIuMNp07oClW7kdO9q0fi2+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/q1rt+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+SaiSJPz/dsPMG3MDGlE1VqGKSgxu2+***REMOVE_SECRET***+892+***REMOVE_SECRET***+***REMOVE_SECRET***+cdEmJCBABIkAE1IeArD1NXj5/hbED1GfXRfd+3TBs3GC+G/***REMOVE_SECRET***/HXFy98K9AvvJoUNrfdRASvyaqPUvm+***REMOVE_SECRET***/RPGdh5KFJTU/***REMOVE_SECRET***/x4QhkzjrK1KR6UHC9CL5dX1K+***REMOVE_SECRET***/9ZKdpaBoHnLceLoSbZqCpVn+rIUsSyCwkULo6ilJaxtLGFpXTS/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+FSVT9jKxgqrNi8H0wj+***REMOVE_SECRET***/pMQqs/***REMOVE_SECRET***/***REMOVE_SECRET***+mkwzFSdabMm80ZHz5rqB+abNHVbzdq2RMiunZzC3rUjAi+FPBOcjJESESACRIAIqCwBWY/nPLj3EFNHeqhsft8DC1q7iG9iHvP+Ev8gnDp+RqrY27q0Rt/***REMOVE_SECRET***/***REMOVE_SECRET***+EV+***REMOVE_SECRET***+gpfjzl48uApaz9uw/***REMOVE_SECRET***/sepo+***REMOVE_SECRET***/rSxhZW0JSxtLWFnlv1pa5//***REMOVE_SECRET***/QPgXlVmF2b127g4V+i/FFhqamTNNc5gPXkf1Hceaf/yksdlkdNW7VHGtiuU2I2rc7Go+evpA1BNInAkSACBABFScg6/EcZlrdTHcflc2yZbs/MG32ZL74Th0/jSX+***REMOVE_SECRET***/5l5z9zCHPr6+tDT18t/***REMOVE_SECRET***/y+***REMOVE_SECRET***+***REMOVE_SECRET***+7ZjfuP2O/***REMOVE_SECRET***/***REMOVE_SECRET***+/***REMOVE_SECRET***+W3GHZ5/nWx+***REMOVE_SECRET***+TSuSuY6ym8aMJMOPEJUO3toKp+g4IDV+***REMOVE_SECRET***+X/JImyvm5hwfSbKYwXz1S/OWyDZo2xbn8c6xwZhSP79+***REMOVE_SECRET***/699B98p/***REMOVE_SECRET***/***REMOVE_SECRET***/RzymL4j5TKjNO8i1IwMjIKL+***REMOVE_SECRET***+24z7JmKe4XXAmnElgbsUqii+zsHDyP/***REMOVE_SECRET***/***REMOVE_SECRET***/z3s/Nv8b8rKenC10dXejq6kBPN/***REMOVE_SECRET***++9nI8Nv7+dsgua6ITZHYuTlaQN3B0QHrtq/***REMOVE_SECRET***+3jFNLJY3/h3+***REMOVE_SECRET***/d19eJ/***REMOVE_SECRET***/QD773128ea+***REMOVE_SECRET***/***REMOVE_SECRET***+P4sp/NzjpkhIRIAJEgAioDwFZj+ecPn4Gi/2DVCbhWnVrYl7wnB/xXL9yHT5T/***REMOVE_SECRET***+krZQHzuwRG/i/d5/***REMOVE_SECRET***+PjuI+Z6BeDJQ2pa+jvVWg3qIPzIIU6wz536Bxcu/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+Cy5Isay0BKppo7a1nlfj92/cxbYynSJ31O0Nh72AncP1F/AdcuPGAlS9tEDbQ18OVQ0dx/ZLgDoKmLRtj5twZaoPh2MG/***REMOVE_SECRET***+hCQtWiyL+Yg1q/YoPSEJ3tPRJsOrXhxHD/***REMOVE_SECRET***/dNPv/VQF8fusiDDq93nS6YtnXM/9HlvTIt7Jif8//BvMfI8f6H+TlflNcLj1n5L4wdQJd3NY8n+90O806+xDf9n2+AUWVsMyuH6b3H68UHZDO9+***REMOVE_SECRET***/D63Uc8f/Uez1+9U/r9/***REMOVE_SECRET***+***REMOVE_SECRET***+COMNPNwZLYczh+5qrUuuosWKVWNWw/***REMOVE_SECRET***/***REMOVE_SECRET***/EynimuvMXXpNQCx1C/***REMOVE_SECRET***+DEpZtISctQ23wLKvDn/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+dXCqUcIIoRClPVw+ZOnpIyczB55R0vPmUhIcv3uHGgxd4+***REMOVE_SECRET***/E+0/U3+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/oI7NoWI6U3+Yo5lXHC0rWLYGJijJDFa3Bkv+***REMOVE_SECRET***+***REMOVE_SECRET***+XyVyfv4prBDh07GD36d+Olc/HmAzx/***REMOVE_SECRET***+ug5fKf74XPCF4nMypWyh//YHrDRk/***REMOVE_SECRET***/+G9O9h/***REMOVE_SECRET***+AfxGr+yXSPcXNG7Vkm2aiQvBwL7rj/Hqm3y+***REMOVE_SECRET***+Eoi0e79uGDZuMG4+fIG7T6TbgaAG6colRIPcHMSEhuHrZ+***REMOVE_SECRET***+d5pT6M8eP0RsnOI/***REMOVE_SECRET***+xvfFHWStZQiBdjgT+uf8OCzdwO0YlymWP/***REMOVE_SECRET***/45h6XzliEnW/yuEWMTI6ydPQL2ht/***REMOVE_SECRET***+ePUV0jGYfX+***REMOVE_SECRET***/***REMOVE_SECRET***/N3Asdj9yssQXGXwX+qB+***REMOVE_SECRET***+3bdzORZ2nExsyA+YZSZz1SZE9gTfZ+***REMOVE_SECRET***+***REMOVE_SECRET***+fMWNC1dw97p0E2XcZ4xD+07tVPrp2hgShj3R+***REMOVE_SECRET***/***REMOVE_SECRET***/l+***REMOVE_SECRET***/JLsDdK/***REMOVE_SECRET***/wJeEzPrx7jw+***REMOVE_SECRET***+DmzCkKzpXcwC+***REMOVE_SECRET***+Xz18p8ISZsbKmZqaIf/***REMOVE_SECRET***+OvcTezcJ/kznbx4Tp01Ga3a/***REMOVE_SECRET***/g/9s4DMIri/***REMOVE_SECRET***+vX3ndm9S47kLnsl/Vk97nb3eZ555jO72dlnZ+dRIyA4iL8/***REMOVE_SECRET***+9V3wFBRbvPImlvxbuO9pe+epGqXLVKlh9eJ9XZlNS7mD+***REMOVE_SECRET***+HXqtBgF4Lln2QfzQaaDUqaNXsgRp/tgV7z038bYNV2sC+***REMOVE_SECRET***/zaL8mYT+***REMOVE_SECRET***+E4/LbOu/nUfD2Inv+/5/Bh3/***REMOVE_SECRET***+LXoN7FEnZcgsdNnAkDuz+1614VEQ45nzWGUE23+***REMOVE_SECRET***+eM+jjT/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+DrSpO97AxB3irIYluBDoFS5/***REMOVE_SECRET***/***REMOVE_SECRET***+cgwRIWH4Ic//8GpOOdgUq06NTFp/ng/0/fNXFaWAUP7Dcv3CdU7rz+***REMOVE_SECRET***+Bk0+***REMOVE_SECRET***/t3ZryNM/***REMOVE_SECRET***/8zo6vftmUVeTl5+elo4hfYfj9Mk4t/5M+***REMOVE_SECRET***/***REMOVE_SECRET***+9/qD9R7h29brX+qRIBPxJILZqLEZNHIao6Ch/miVbRKBoCFDQpGi4l/ZSf1q8AovnLXVU8+***REMOVE_SECRET***+***REMOVE_SECRET***+/***REMOVE_SECRET***/sG2v//xSpeUiAARIAJEoOQQqF+jMhrU9D5o8s4r7+Fmgm/Z/UoOLfK0pBB46/***REMOVE_SECRET***+QF8kdbhz+w4+***REMOVE_SECRET***/HTroMtRVKpYlpouYhy2HL2hFfe/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/KeCiUB+BBo3bYQeAz9G+Yox+YnSfiJQvAhQ0KR4tUdp8WbVz2swd+***REMOVE_SECRET***+KTn50iIdw7geGOLdOQRCA0LxbYLp+***REMOVE_SECRET***/***REMOVE_SECRET***/WI77Fakb5sNgkIQN+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+8CM89mRrr/RJiQgUCQEKmhQJ9lJf6Jpf/8DsSdnzeLz9xv/QsVnVUl/v/***REMOVE_SECRET***/b6Akk3kzxVJXkfCASFBGPHJc/***REMOVE_SECRET***/0nZbUoVDFAixWhBQnIaJn+3BpeuJ+bZHKEhwVg4/***REMOVE_SECRET***/***REMOVE_SECRET***+lJxwFg+nKxSsY3OMzet+***REMOVE_SECRET***+***REMOVE_SECRET***+b1a+***REMOVE_SECRET***+7Qi++3WzS/HF3/RCeWX+***REMOVE_SECRET***/***REMOVE_SECRET***/MUcJN9Jdapk14/exv+9+XKBVPz86XMY3GsIMtLTC8Q+GXVPQK3RYF+C50GTTWtX48h/***REMOVE_SECRET***/xzHvOV/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+ooFYq+***REMOVE_SECRET***/VitsNisEmxWwiu/02qwW/***REMOVE_SECRET***/5mCi5djceZC1f4+7pFuShVKhy4edVjF75bMA+3ku94rEcKRIAIEAEiUPII+DLS5Oypc+j9Xj+3le7X9SU8U79CsQBjVOuxaO1u/LL+nzz9GdW/***REMOVE_SECRET***/***REMOVE_SECRET***+ZqHTwVKlehXMXDzVbwfQ8cP/YfjAkcjMzP00Z2ifTmhWLRJaa8EOx/***REMOVE_SECRET***/***REMOVE_SECRET***/R+erUtZVopVg/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/7q1KpsN/***REMOVE_SECRET***+PJ6zq7tu/Hl51+***REMOVE_SECRET***+3bgCBzbdCS6kgYFbrsXTzASxbtS3P+jzU+***REMOVE_SECRET***+vrHbdi667Bjlz5AjwU/***REMOVE_SECRET***+dRwfJ4cHSJR5M9mwUy4kjh/Dnhk1yzJMMESACRIAIlAICvgRNNq/biklfTnFLYdHoj1FJ58jFW+***REMOVE_SECRET***/***REMOVE_SECRET***/74HG3b86zGPg0nXISgUsvU2/***REMOVE_SECRET***+rMW/qAreqP47rhXCheI/YOJ9uQ/dR83K9rtO0UV0Me+***REMOVE_SECRET***+***REMOVE_SECRET***/OsbJ3IbJPQGz2V9FlCo7t5UBaN9/Eqw5Uv1NnDsWtevV9qieO7b+***REMOVE_SECRET***/CRag1Otl6i+***REMOVE_SECRET***+***REMOVE_SECRET***+TMbpm883LE5IzJTZSs4lp+xd29kqV+***REMOVE_SECRET***/s5XBR/***REMOVE_SECRET***/***REMOVE_SECRET***//czxz1y8nUcXo41U88Xu0LO7/u1nHss5+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***++***REMOVE_SECRET***+fBN7Dp/iQRKLxfNJ+***REMOVE_SECRET***/+zFy8Gin+***REMOVE_SECRET***/***REMOVE_SECRET***+UeQuzO9u6rZ6ALlP/***REMOVE_SECRET***/***REMOVE_SECRET***+GVVaXB4s2HsGy187wXbOTygi8/RjTyTlcsGxgJ+o+AQoFUqHE5KQ1HTl3CX3uP4tzF636z/9BjD+***REMOVE_SECRET***/hJPpP6f2o/***REMOVE_SECRET***/+***REMOVE_SECRET***/NQ1bN/***REMOVE_SECRET***+UOEC7r9zB0MnLcvk9Y+***REMOVE_SECRET***+Pq7ov97+Vl83K+bv82SPSIgnwAFTeSzIkn5BA7vP4LP+w51UlgzpR80JprEyx3F8+***REMOVE_SECRET***/dCQ9Vlj/SQVahZVjoeLIJfb+cL5vA2kP/***REMOVE_SECRET***/wzzbXD04iw4Kw7Iu3SiSYeLMK/cYuRmLSHSf/R/V/***REMOVE_SECRET***+bG6xY1tu0/gYU/***REMOVE_SECRET***/Arp/SHnubTyPPYsCmUWLEnDvN+XJ9rvyejTXq/2w9nT5/Ls4xFY3qgktrz90nL/***REMOVE_SECRET***/y/6DsOh/dmZ+O6uVNMGNfHVO0+WuLraHTaoAzBuyTps33/***REMOVE_SECRET***/n3A69KferABOjzfGhX1AgSr+/5nikKH6cs34q+94gMjV8sHvd/DC68+77VPpEgEvCZAQROv0ZGiGwLHD/+HwT0+c5L4ZVI/BFtopMnd2JJsGnwx/WecuXgtT6IVK1XA7GUz+OSa+S1b1/+FCaPzngdl9eS+0JrpHeD8GHqy/***REMOVE_SECRET***+XiFfy4eAW9siOLIgkRASJABEo+***REMOVE_SECRET***/te0RAOxKVX4bW8cZv+wzqkerz/3KLo+1RgKU/Gf5LY4NQCb2jlDocHl5HQcOn0Z2/YcwdkLefdFvfGbTSC+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/C/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+kGHj3DtiuvJN997/Um83rxmqSB6PNmIvl86p1du+cC9GNL5KahN9HDIVSNbVBokZlkRd/UW9hyJw4Zt+wrleJgxrBtqBef/4M/uzC2zAiQdBEcAACAASURBVB0+***REMOVE_SECRET***/***REMOVE_SECRET***+lY2+UuWKmL1splO6R1fKPy7+GUvmfe+0u3xUOSwe/Ibs8khQPoEbZiU6fzJdlsK/***REMOVE_SECRET***+ubZmqW0z+I+***REMOVE_SECRET***+***REMOVE_SECRET***/UzV0vtlmsj8NvKa21uM4221Nhi/r82LNa+bfNyjLIWsW03eybpfF2/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+7YwAM41qZlDS2SiS2xk4HHeFp/w9e/***REMOVE_SECRET***+Rc3Hn06trXqd4Lv+***REMOVE_SECRET***+xlJKSgjef6+wkd1+***REMOVE_SECRET***/***REMOVE_SECRET***+VOrN6y1+GzXq/***REMOVE_SECRET***/lX+***REMOVE_SECRET***+***REMOVE_SECRET***/0KRk9L77Z/***REMOVE_SECRET***/fD8+fblF2YJfiLVNhgZvDJiSb4lvffQu+o/5yq0ce9Xm2gn/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+eOBXsFjhYiUKAEKGhSoHjLrPHLFy/jo049neo/+Yv3UT8s/1cTSjQ0hRKpghqXbqbg0MmL+***REMOVE_SECRET***/ka2HX1DPSBrlM/mzLTEX/mSL52SIAIEAEiQASIACOQdDMJnV/u6hJGSKAOK0Z0KdWwTqVY0HOk8+scYwe+jcYxASW+3lalCilWBS4mpGDff2excfu/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+Q3YmjJqErRu28SZ4v+PzeK1JwV8My/I5ka7U4uW+***REMOVE_SECRET***/74YZZjc6fOE+43u/dl/***REMOVE_SECRET***/34k4nJA+J0+dcdSj2X118OkT8h7mxdu0eGug+/7VR/264bmXn/WZExkgAi4JUNCEDo6CIHD96g283/***REMOVE_SECRET***+***REMOVE_SECRET***/5yTnaZ+CHr+***REMOVE_SECRET***+zBbH6pBqkSACBABIlCCCJw6fhL9P/***REMOVE_SECRET***+T//tcKH7Zt5Ne+oT8ZmTV6XEzKwKG4S/h77zH8F+d7HyAkJASNmzVEw/sbovnDzVEuIsyfLudp6/Llazhx4jQPkpw+fQ63kpLdlvnKkw+h470xsvzaeDoR4+***REMOVE_SECRET***+***REMOVE_SECRET***+8LdXqwRJTRRavLz//Gru278bI/m+***REMOVE_SECRET***+9BDO0/***REMOVE_SECRET***/I2bjho3bVIXo99+Ggpz8ZhknSUHOHH1Fjb/cwSbd/o+koRV9N5G9XF/8/***REMOVE_SECRET***+tP4/GK+fdPbSo1vli4DvuOuB6JGxUTiRmLp/***REMOVE_SECRET***/wTDXaAhrWKRsI+fizqFX136YNLQb7g1RyNYjQe8J/BWXgK/***REMOVE_SECRET***+9IE0iQASIABEoKwS2b/obY0dMyLO6o/***REMOVE_SECRET***+v34kzF6/***REMOVE_SECRET***+zu3Krds+ioHD+***REMOVE_SECRET***/lELAFh8FS4z5YtZ5Hz4f2G4EBrz+KSKF4PF2RU9+SLGNWqtFl5CLEJ6fmW40Nx/***REMOVE_SECRET***/jJiV61Nxkhu3Zj825ki/y0YeLx79IUJthgJ30/7azc4jcVixZhuyjGafymQjKBo9cB+aNGuMZg83RRTPauP/***REMOVE_SECRET***+Ex8Ou5bt6YHDR+AR594xJPiSZYI5E+Agib5MyIJzwjs/Wc/***REMOVE_SECRET***+KC5d8j7h75mX+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+qBWI3/5r+zG+ev3Vy5hU3/***REMOVE_SECRET***+AQcOnQcJ0+Ir9r4cxSJXB/vrVEZw15+GCpzPoETQcCUNfvxx9a9Lk3rA/***REMOVE_SECRET***/rrr1GCLv+***REMOVE_SECRET***/***REMOVE_SECRET***+FwObHoDkyZPPzl+BvB85h1g/rZZlbe/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+s/8EAWD/C+wAlI4B6bddnq+***REMOVE_SECRET***/LEDw/6brbN2F4/lHHWSjnNeB+6TeEzyOtiPQale/Jxgu/hxz0QUjjqL5yQ7P+z1F/fzY58d8+wc4/***REMOVE_SECRET***/JPviNuYfk5P2c7/E84otaq2G2+GTp3N+***REMOVE_SECRET***+2WjE76vB3fF/VG+vdLCX7sxCfj39GWs3LDL59duWB+***REMOVE_SECRET***+***REMOVE_SECRET***/1xfxdP2KMiyRiJ3AnhtZGDJ+kUdANGolfvmmB7RWeiXHI3B+FLao1OgzZQVOnc+/***REMOVE_SECRET***/***REMOVE_SECRET***+Df0S77FuM/4iBVRN/***REMOVE_SECRET***/noiydFjkFTjp+e7LaOdhSmKbWouLKQZsP3jaL6/dsJHEjzz+EM9y0/zhps4Rdj81UFpaOg4dPo4jR/7jgZLk5Nt+suxfM3LnNzmbIeCjoTPdFv5+r3fx4mvt/***REMOVE_SECRET***+j3+xYesej+o5f9SHqKLnz+***REMOVE_SECRET***/12wo9dhw9h+9+***REMOVE_SECRET***/hwYGY9WE7aEz5z2+***REMOVE_SECRET***/HzMws9H1/AK5cvJKns+wJzG/***REMOVE_SECRET***+0hBWwaGccfvhtk5PXDe+rg7FdnoSCveeYY7GotTh05TZ+XPs3Dh0/63VNWT+4Vt1aaNmqGR589EFUrhrrtS13iuw1+b37D6IkBUrurs9HL7XBk9VC8+Vj0ejx8fhlOH/***REMOVE_SECRET***+O44c12wu+***REMOVE_SECRET***/***REMOVE_SECRET***/4du2+v1kTNH+kKR5u/SDCI8oVWLNcvHgFu3btxz+***REMOVE_SECRET***+9zOWzP/eZYFv/K8V3m2T/***REMOVE_SECRET***/nbz6Cn/***REMOVE_SECRET***/BHc37IJdLqCfWB49NhJbNr4N/bsPeCVv8VV6fmHGqNr8+qy3NsUl4ixc1a4lZ3z/***REMOVE_SECRET***+Ie4J8v87sbIKJyFZBOJSTNi65z+sWP+***REMOVE_SECRET***/***REMOVE_SECRET***+k4JVK9dj7Z/OqZR9qkgxU57S/TVUVud//***REMOVE_SECRET***/TCxaoixdQZkzYQz/WUN59Jn64v43/***REMOVE_SECRET***+cjR/***REMOVE_SECRET***/lg02xe9f+XL482KgOBjzREIKMB6+pKj1e6TPRbX26D/***REMOVE_SECRET***/LeNtd5gxLdPp+er3qLB+7FyM5tIZjyf/***REMOVE_SECRET***/***REMOVE_SECRET***/xW15/***REMOVE_SECRET***/2YfC/***REMOVE_SECRET***/NYPh//JR773zNcnvlgMpo4c/7NfGF+***REMOVE_SECRET***+j13kb18eCjLfFgqxaIqRDjt+***REMOVE_SECRET***/***REMOVE_SECRET***+GbYOPy9xfX8DA81rovhnR4nVj4Q+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/L5zbYNFn4DLn64Ht/O2FjF7dKNOV+***REMOVE_SECRET***/***REMOVE_SECRET***/F48el6eJdq+/jFFzZ8syn3DlEp5q0Myt7Jqp/XhqTfF8Zuc3O6fZ+SfAKtj4b3YesMPbYhWPa/***REMOVE_SECRET***+***REMOVE_SECRET***+3tT+1x9+w8KZ37lVXTmxD/T0FMQbvA6drpN+x5Wr193amDy0G+***REMOVE_SECRET***/c/I/rFqz1mO9sqRw+cC/***REMOVE_SECRET***/***REMOVE_SECRET***+3oebtQeLxQK5EA/***REMOVE_SECRET***+***REMOVE_SECRET***+6z2EP9F0tUz+9B3Uj9D7VE5ZV85UB+DF3hPcYvigUzu82ji2rKOi+hOBUk1g2LLt2PXv8Tzr2KXnh+***REMOVE_SECRET***+Jl/***REMOVE_SECRET***+zlj+2mNhLHv2/ItJk+cWRlF+***REMOVE_SECRET***/qhlYkIienXph9SUVJfmXn/2Ibz3RCN/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/51ctisO3/6yyaXNF19rh/d7vesXBmSkjBCgoEkZaWg/VLNnlz44f+aCS0sVo8th4ScdKb2wH1j/***REMOVE_SECRET***+5niOlmFS9WLhx47//sOHXP3L5Mnb+NDz16uuyfLx57Sra1r/freyPE/***REMOVE_SECRET***//***REMOVE_SECRET***+pBQKLU6b8w5dLIyM/HP+***REMOVE_SECRET***/4OzFGy7tTp4/odAzH/***REMOVE_SECRET***+/Dhm250zAyn595uR2+XjTfY/f/2bYFu/f967FeWVQIVAqYNSL3SJ/***REMOVE_SECRET***//***REMOVE_SECRET***/iRcu4O+//s7XFJuUfUH3VxCqlN//TYQWHQe4/***REMOVE_SECRET***+WVVftXPazB3qvvO+aB3X0TbemIGB1p8JKBU4/***REMOVE_SECRET***/1zHtODeb74nUr0bBlS4+***REMOVE_SECRET***+n/fCE8+08Zsz8+***REMOVE_SECRET***/***REMOVE_SECRET***/PrIA3UxtAOlF5aJNF+xDHUgXuqd+2bp/***REMOVE_SECRET***+dPYs/fvg1l6X9CZf4jYecZd+2rXj/***REMOVE_SECRET***+FJMkSgMAmYtQHoO+UnnDpzOVex7NwdMWEYmjT1fS6/n1eswS+/***REMOVE_SECRET***+***REMOVE_SECRET***/oLfQ+tr+OpAtGFT74zPmp5BOP3I9Brz0KwUSc/cWZ7BCB4kxg9pZj+HVt3kOWGzRpjKVb13vs/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+DwjAwbkzqam1qjRrMUDiKhQEeqAwh+***REMOVE_SECRET***/2y3tiXyZzf7MmGDlxWH5F0/6yToCCJmX9CHBd/***REMOVE_SECRET***/Ezs/***REMOVE_SECRET***+HPeX7hWj93HMeo1j1y884c/6ix3plXWHt/***REMOVE_SECRET***+rWoD9o/***REMOVE_SECRET***/***REMOVE_SECRET***+284991RD5WpVEBIZAXVAkKeu5it/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+3IYde/OejyokJATzf5qFgMDCH43jLQ/SK2QCFDQpZOAloLi1v6/DzAmu36VnVagSE4G5g9+***REMOVE_SECRET***/3nMN3P+f9+k1U+***REMOVE_SECRET***/qtOB3f+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+r0sXj+***REMOVE_SECRET***/8Rai18l5PvXMzEa1rNnCL88t+***REMOVE_SECRET***+vqvQBmW5s//Hps255+***REMOVE_SECRET***/RketPxmPC/NyTe9srPnbGGNRvWK/IOZADxZAABU2KYaMUoUuDun+K/46ccOvBpx/8Hx6vHVOEXpbeohOgQ6cBk/DO/7XFmw/***REMOVE_SECRET***/QWzZuD5DupHuuRgkgg/***REMOVE_SECRET***+6lH/***REMOVE_SECRET***+***REMOVE_SECRET***/8ESUm3iwqH1+XWrVYJTetW4wGSSiF6BAsWKCwmr+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/7afdg7fS+19HodNDqtUyAmulIFHI1zn7TBy+L8qtawZlU8ULcKaleMRIVgPYJgKrJ+7oH4DHzqZlLYjl07oEOXN/xafzJWCghQ0KQUNKIfqpB86zY+ePMjZGa4ztDC3mf8bUJv6K3+HSrnB/dLjYl5O86gU6v60Ns8m+***REMOVE_SECRET***+mH9z8ZLNtzOfOazB/9EarIe+NHdrkkSASIgP8JZGiD8FJP/***REMOVE_SECRET***/0swx1HYcvxK1k1/OzzFk2E5UqV/Q7IzJYgglQ0KQEN54fXR85eDT2/***REMOVE_SECRET***+7t+***REMOVE_SECRET***/***REMOVE_SECRET***//4e3n8Yn/cd5tZwp3aPojOlF/Y//***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+xZJh2WUYcWIsAJUNCEDoR+***REMOVE_SECRET***+***REMOVE_SECRET***/XUuCV/N/***REMOVE_SECRET***+bp7duzFqE+d39O+***REMOVE_SECRET***+cvXShKKYuurRqXC/OFjnPwbOW0cXnirs2yfD/y9He+2e82t/***REMOVE_SECRET***/N7twG55KKzICFDQpMvTFouAe7/***REMOVE_SECRET***+t3n3aybvZZKSnYdGCBTAY6bU/fx03G779HjeuZAeh2jz7FCb+sES2eTnzmrz4RHN0f/YB2TZJkAgQgaInsGDbf/***REMOVE_SECRET***/***REMOVE_SECRET***/MhJLvUebVoPX7R/***REMOVE_SECRET***+EeX94njL4+KF/sX7TFs8cIWm3BK4cPYYtK/***REMOVE_SECRET***+VffQilsfCH+8uuBAkSASLgRMCkDcDbw+***REMOVE_SECRET***/***REMOVE_SECRET***/Sb7pLBtB++Ratnn/WY0dqVv+***REMOVE_SECRET***+***REMOVE_SECRET***/Od+l+razxxEaEemx+XmzZiI1PcNjPVJwTUCnUmLu8K+dBGYsX4SHn/***REMOVE_SECRET***+77jLp2pUj4Kjz/***REMOVE_SECRET***+K1L/***REMOVE_SECRET***+F1t3HMiz8hViY/***REMOVE_SECRET***/WyUe2qGN/tOdhstgKsDZkmAkTA3wSSrGq0d/G6x5vPt0antk2goldt/I3dJ3sHbmTg0/Hf5Wmj4QMN8dXkkT7ZJ+VSQoCCJqWkIT2oRkZ6Ol5/***REMOVE_SECRET***+xMEjrp92+uZx2dbeu+ZPnDx0zAEhJDQY2y+e8QCKDY3Dyucr//vEPgig1MP5ciIBIlDcCCzaehw//***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/A7/***REMOVE_SECRET***+***REMOVE_SECRET***/d/Uigr/q0R90q5SGA9dXEf/g3BGndBsEGCGw7G5Di2G93wwqw/WwX+4f/zh65wn6zkSxM18b/kexwdRrhIrsxSZAI3EXAqFDh+***REMOVE_SECRET***+aJQP4E+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+Z3DH4esFcy+ICigUApQCAooFQooFAL/FhSAUlBCoZS2CQL/***REMOVE_SECRET***/***REMOVE_SECRET***/OPvxIE/Wl21pxu/2oY2Xab3qZnvh72cb9+GXdzjyPca1ehz3XXaeEd3ViJFy/iqXf/5D/***REMOVE_SECRET***+***REMOVE_SECRET***+I+pXTesnNRlFVApVQ6zl9+TvPzUjqvmY50/tnP8+z9zL50Dkrnv3hui38LxPM++xwWz3Px3Lb7wdb5Ocr+boD9/WBXBvY3Q9zOTlCux/9WK7g+P9/5uZ9t236u87/6Oc995gE/ryVW0nXFfkmy/52w67OC2JWJB6ikaBYPePG/JeIOVq7jcsY9Y38PxYtYdvDMfoWyX+Wk602OA8V+***REMOVE_SECRET***/Hg/***REMOVE_SECRET***+hZDdD8rZ1+ByUn9F7HaI/***REMOVE_SECRET***/iAMnL+***REMOVE_SECRET***/wDx1xOchBrVqIjKVWOh02vFzgy/***REMOVE_SECRET***+eFbef62Tcc9hsS3hlh8vaOh2Rb/***REMOVE_SECRET***/YZX+uPMbTn5jar9ZFbshjptd/kO8EIifHHLcVs5t9ouD/eaZ/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/NBq1Ww/tpKh7EFoNePEDNf7NtNimgJvb/BBZssweguRzr+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/LC6BnpPLfidAQRO/***REMOVE_SECRET***/H7Fv8Gvwq/FlSiXwhQ0MQvGEuMkT079mLUp1+VGH/JUSJABIhAWSWwP/***REMOVE_SECRET***+ehUYfINtQ+***REMOVE_SECRET***+x2V5X/Dh/Euo2bS1htS567hpuJ+***REMOVE_SECRET***+***REMOVE_SECRET***+ksBWCaTRIAIEAEi4C8C837/Ec0ee8xjc+***REMOVE_SECRET***/npoY/t24NOT77gWcEkTQSIABEgAoVKYNGK+***REMOVE_SECRET***+ROm+ixIVJwS0CjVmH+MOdRIo+0aY3pv/4km1za7WQ8Uk3+yBTZhkmQCBABIkAE/EZg9tLpiK0a6zd7ZKiEEqCgSQltOC/d/vLzr7Fr+***REMOVE_SECRET***+2zDMq2NNV8+***REMOVE_SECRET***/CZeH0iNt22D6Cs9TBl+7fBHLf6QJ6wrrHN24+Adcv3TFqbh98Reg1uplu/D4PfWQnJTkUr7760+***REMOVE_SECRET***/W+ClD6X25Py7/IsbaI/***REMOVE_SECRET***+***REMOVE_SECRET***/YU9mJaWFZbnjFP+jBZXg9WhsCy6Ym+2LP/***REMOVE_SECRET***+***REMOVE_SECRET***+bk9FzvbzFOU85bj0m6cpF1OZ29OVi+***REMOVE_SECRET***+Kznm/***REMOVE_SECRET***+ngHX7nXL/7t1xfc0KQquhITyz2NB3/ODqeEgEHE/u63f+***REMOVE_SECRET***/***REMOVE_SECRET***+ip2Xh0d6Lsqmae82H3LkeZZ7ChxF+***REMOVE_SECRET***/***REMOVE_SECRET***+tSLuoc3LL9FjveOdpM6sRzvxwspZ4/d1O6CeH7xM4+l7PrSTdAbIfTMS+***REMOVE_SECRET***/***REMOVE_SECRET***/9h029/***REMOVE_SECRET***/2KYZuv+***REMOVE_SECRET***/paHQFJ+***REMOVE_SECRET***/Z+3XMW14VqX8FG+/tsEgVC8ayMng/***REMOVE_SECRET***/***REMOVE_SECRET***/+***REMOVE_SECRET***+URU77Bi2+/I9vgjj/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+rMW/q/2vvPuCjqPIAjv+3pIFiu8M7G+***REMOVE_SECRET***/8/9/3ds3+s9mZ4nh87333kkmPl/4WNYon/torZIsAAukXWPz9Whk03vlFdffB/***REMOVE_SECRET***/Vf/vHryUnv4argaPRiBy7+***REMOVE_SECRET***+21y3oXnehuU1tVPgKJJ9VvTsjKa9+x8GT/C+e/29q2zr0x81PmJQ40d/PVHCf3En+34a+eQLQIIpEPgzkcXyrtLlzsONeedxbL/Id7PqDLvuTny2fKv0xEiY3gQeP+FefLZh5+U6DH3nYVS5xD3f//e8fKrZfHLzp9xc3mjk+XGc/7tISqaIoAAAgi4FYiGwnJ+GUWTWzrcJE0va+J2ONpVVwGKJtV1ZUvP6+Xn5su44c5Fk/3/***REMOVE_SECRET***+wuC7/***REMOVE_SECRET***+9zvX4cx5+WPp17O7Yfp/***REMOVE_SECRET***/evrRBKZ74aw+RLQIIlE/giw1R6dC/5GdGJY90Q4dbpeOAfp4H/3HF9/LkzFme+9FhxwVyIsUyZUjJ/2ee2fAcGfPk464H/+7zT+WSk85B4zeFAAAgAElEQVQus/2sEe2lVoCiiWtUGiKAAAIuBaLhXDm/k/MvjC9realc1/***REMOVE_SECRET***/***REMOVE_SECRET***+wwuMZDXzzUp3LxJ6v/***REMOVE_SECRET***/7YxXXnxV7h3i/JklhxxxiIy8v+***REMOVE_SECRET***/fSl6Nmp6JZj7xqKz88WfP/***REMOVE_SECRET***/***REMOVE_SECRET***/KvUOdiyaHH3WoDL+v5CkU3QhRNHGjRBsEEPCrwK+SLy3LONXwWRc0lNGPT/***REMOVE_SECRET***/nfuBYcNlwpCRjgHtu+***REMOVE_SECRET***/***REMOVE_SECRET***+s1aGTbR+VTDQyePk/NbtPAs8unS/***REMOVE_SECRET***/***REMOVE_SECRET***+kDldwGKJv7aAan+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/GBkwsq/njCmaeCajAwII+***REMOVE_SECRET***/oO2W7AZ99dJPvVPczVREVbNssJ/9i/***REMOVE_SECRET***+DIIBANRT4dF1UOt/tfKrhlm1aSbeh27/***REMOVE_SECRET***++wevLr6l8c2++/1x4yuYv3P+***REMOVE_SECRET***+OmOX9QrA/J/JkyRRN/rfvCea/***REMOVE_SECRET***/HfRq/LO+x967keH9Aus/f57ee7RmSUGrn/aSTL5uTmuJ7u7fQd5+pEny2z/7MgOks/***REMOVE_SECRET***+***REMOVE_SECRET***/9pslK76QGi7X9tlHHpY+7cs+***REMOVE_SECRET***/***REMOVE_SECRET***/CrFEjLbs6/wap7xKHy1H8XuxssqdWG9etk+***REMOVE_SECRET***/ez9d+***REMOVE_SECRET***/KleWfns+fstfc/ZfKMiakHokX1FqBoUr3Xd9vsXpu/SEbe7fxOk9PPOVW69+vmGYWiiWcyOiCAgA8E5n39h4y6/ynHTO8Y0k+uuPVWzxKffPC+vLLQ+U9+PA9Ihx0WeGvu8/LVJ5+XGKdVh9bSYYC7M9Kt/XW1nFX36DLjOHCf2nJ/p0t3OFYGQAABBBAwAutCBXJZZ+dfbtT+***REMOVE_SECRET***+***REMOVE_SECRET***/X3flIk9P7q95Eac/9wr5QA0QAABBBCIC/wZzJcWXZxfG/2t9t/koacfRMzvAhRN/LUDFi94Q0b03/***REMOVE_SECRET***/f76skFPb+GRUPPzhZ/vhzfTUXzK708iQqD5TyuSYvLV0i/9z/X66SufK0s+TzTz4rs+20Aa1l7xreT0/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/0ex4XRNpfFTqd6S4mpBGCCCAgM8F/***REMOVE_SECRET***/FOk/Obniftbm/***REMOVE_SECRET***+***REMOVE_SECRET***+iKswFjw9S7rdeFuZbQ/Zf28Z166pq/FohAACCCBQtsBvsTy5+***REMOVE_SECRET***+X3Pw8yc1T37mSl5cnOXm5kpubK+***REMOVE_SECRET***+Y7EAxKMBjUl/***REMOVE_SECRET***/fGJrHnV/***REMOVE_SECRET***+7tVnywxdSo1bq00p/+***REMOVE_SECRET***/RXLm2+72OrWrUrClPzXsMR78LUDTx1w54/dU3ZXg/57+***REMOVE_SECRET***+***REMOVE_SECRET***+tG4agUemz9Xjqh/Ysogfl+***REMOVE_SECRET***+gdWRXLmuh3PRRP2i4ekFJT/ku/yz0TNrBSiaZO3SlSvwNxb+***REMOVE_SECRET***+4pgyjcvFHq//PAlO26trpIGh6+***REMOVE_SECRET***/Fzt1fOK++2RYr/7VWK56prbv/vvJnPf+K6Gc3DITVH829J9/7CuFW4vKbFd3/***REMOVE_SECRET***++9oSGVJG0eSylpfKda2v8Tw/RRPPZHRAAIFqKlCUV0Mat3c+tbtKe+xjU+T0xk08CagX1Fee0UC++HiZp340zgyB+Z+8K7X3rZMymGvOOVc++d/HKdvNG9lOgrFIynY0QAABBBBwFvh+a1hu6e1cNFE9n3+***REMOVE_SECRET***/y97328SSw9pfVctYhR3vqQ+***REMOVE_SECRET***/nW62/***REMOVE_SECRET***+AzeX6e86mGVdpL1/4cP2WwW4Zvly2VH1f+ZM78os/oss23Os2wxCQajZY8Fi3ZTp/7RZ2aWLWLmtMUx2JWH+***REMOVE_SECRET***/ez7zdjJ46hj5rYKxLoejSb6qvt1/***REMOVE_SECRET***/5Wx9U4qo2ey+Slvu384/2tXCPRiMT0uGYclU/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+THnxuWqaPWntqMB7i16Vmy++KuUw9Q47UO65sWHKdjRAAAEEEHAW+***REMOVE_SECRET***/Yc1l8ub92mcgNjtqwRWPn1crnw+NNdxTt/5G36XTh8IYAAAgiUT+CLDTHp0N/5XYAFBfkyc/6M8g1Or+ojQNGk+qylm0xS/XmO+***REMOVE_SECRET***+fSnYqVZ1pCCncgr89ecaOXX/w1z1fnzobfK3MEUTV1g0QgABBEoR+***REMOVE_SECRET***/baEs/3S5p8z2O6COXN2mlRx/***REMOVE_SECRET***/1rj+oFQDYIIIBAJQqkKprsXGtneeKF1B/***REMOVE_SECRET***+VyiiZVt0DMjAACWS1QmFsg42e/KfMWvVvuPPbebx9p3PxiOeH0U+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+lH7jnkhbhjV3rin/PuE4ObzekXLQYYfIrnvsIbl5eaI+oC6ck6Ov5+TkSignLDk5ORIKh0UkoM+mY74CEgiob32iGX1I31Ytkm7rA+***REMOVE_SECRET***+ybGMCOrNvb99rHkS/u6njcxpBWHlZk1biLPJHYrx/***REMOVE_SECRET***+***REMOVE_SECRET***+MNKWfHtd/LDN9/JH7/+pr+***REMOVE_SECRET***/***REMOVE_SECRET***/g9miODJ8+WZV+vquaZkl5lCrS44FRpdd5xEixO/***REMOVE_SECRET***+Z0ClA0Sadm5o/***REMOVE_SECRET***/v+***REMOVE_SECRET***+c5Wbq8hI0AAhkq8GssX6bNeU1e/e/SDI2QsDJZoO7+/***REMOVE_SECRET***+jbXSvOrm3nOgj/P8UxGBwQQ8KHA+lCBLPzgS5n0+EsSiUR8KEDKXgSCwaD0aHOZnFH3H/w5jhc42iKAAAIuBT5bH5FOA5yLIv/Ya0958EnnP99xOQ3Nsl2Aokm2r6C3+***REMOVE_SECRET***+***REMOVE_SECRET***/kmZxJFAAEEKlsgVdFk7/32lkmPTajssJgv0wQommTailRsPG+9/rYM6j3UcRKKJhXrz+gIIIBAaQLF4TxZ/VehvL/8B5kz/21Z/cvvQPlQ4G+***REMOVE_SECRET***+/tsgf6zbKz2vWyc+/rJHvV/0qX377gxQV8yc+***REMOVE_SECRET***/9pZ/***REMOVE_SECRET***+***REMOVE_SECRET***+p+***REMOVE_SECRET***/sWq/***REMOVE_SECRET***+RSQUDEp+***REMOVE_SECRET***+oIRCQT2nGiM/Nyy5aoycoOSp+***REMOVE_SECRET***//vaEhnSZ7jj/***REMOVE_SECRET***//***REMOVE_SECRET***+lvat9KLm7R1HN4/***REMOVE_SECRET***+IBjBHUPqyujJju/S78KQ2fqyhSgaFKZ2lU/1+uvvinD+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+I70H96ya4Jg1cwQommTOWlRGJK/OWyijB411Lpp0bSMXXHy+***REMOVE_SECRET***/1Eo3YY4f6bJ6Q1Ok+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+kXiwXUkPq6uk+1MtfVfaZf/EvfVMfVECYW+7qKxbrLxBCf34rDui+***REMOVE_SECRET***+Ogg7fyuuuIy5X+***REMOVE_SECRET***/e4+ZGGJ2OIk2SXPqPaVzSOzA+HUrLjWf2qP629qvessoW7U/k+***REMOVE_SECRET***+MPA3hN6Lm1l1tDEaq+p2cWmr7V/***REMOVE_SECRET***+***REMOVE_SECRET***/+3Cyffr9aVq7+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+gYD6lhIgmE1XkCCAat9MCD16x0sx+yzq4SKClMHSQsEENhhgY9+***REMOVE_SECRET***+gx/DnP/eKjB0+***REMOVE_SECRET***/***REMOVE_SECRET***+jB9RRtGkZ3tRb0Pz+***REMOVE_SECRET***/***REMOVE_SECRET***++***REMOVE_SECRET***+93nE+dUkudWsvrF+808SpGewSMwIOLlslTz79RKRx/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/GZl+S+UZOciyZ3dpKzG57pOWiKJp7J6ICA/BnIlRZd7/UsUVCQJwfs80+ps/ee8vc9aslutWrKrjsVyE41C2Sn/***REMOVE_SECRET***/4oppl/56Vd8+kWmniFgLmP6tvonoKc295kw1I/96Y/GM2WVdzBq5j/qRa9W0S+***REMOVE_SECRET***+YYiAGcB/bykq2QS0w8K87yln4+sjayfl2L285ZIRB1TWz0Wk6j+***REMOVE_SECRET***/VHtVuNHHVHFaFYOSikKqnTqF/OwXnYvo5595vHRpcgKrjAACaRRY+***REMOVE_SECRET***+6mVzf5tpsSIUYK1KAoklF6mbe2C/***REMOVE_SECRET***/Ll9+uLFNi/***REMOVE_SECRET***/dtJ/0MYXAgikQWDpr5ul+/***REMOVE_SECRET***+fgn5/9gtw/+***REMOVE_SECRET***+XJp59FlKtzZ7go5ff/dfC5F+ggggIA/***REMOVE_SECRET***+hbS88apKiIQpMlqAoklGL0/ag3vu6Rdk0hiKJmmHZUAEPAp8+***REMOVE_SECRET***/O1XH16sqQa8/***REMOVE_SECRET***+SdJp7J6OBzgVT/k7644SnS9tx6PlcifQQQQMA/AoWhXGnSOfWHg8+/51b/oJApAhUskOrnsWtuulouv+***REMOVE_SECRET***+PK5AEUTf22AZ2c+***REMOVE_SECRET***+***REMOVE_SECRET***+iiX8WnEwzQuDDXzdJj+***REMOVE_SECRET***/rX/XjKx3UX+***REMOVE_SECRET***+***REMOVE_SECRET***+YKUDTJ3LWpiMieeXKuTBk/***REMOVE_SECRET***/Xo5pnZBtWYgOQQqU+***REMOVE_SECRET***+***REMOVE_SECRET***/q3v1IO/***REMOVE_SECRET***/mQWDG+9/***REMOVE_SECRET***/m6su6S2KBgL5e4j7VX3+r/wYkFlPt1T+***REMOVE_SECRET***+r+***REMOVE_SECRET***+TcW35920CYP00ld13Hp+Kx9aOVmMrHW2s7fNDR7XO/9+EPBynyb9vHMTEM9txnCYCaPb+***REMOVE_SECRET***+zyiSxHuqAMoh/***REMOVE_SECRET***/sZxDxe4+HpWNV9NoS1HtZjVuehrtt7wHo+***REMOVE_SECRET***+6xJDx51RzxRor+TIpBvP8GpDmXZw/6+r4o+rK4OvO8dtTHPkiUKECH/y8Ue64x/***REMOVE_SECRET***+***REMOVE_SECRET***/URMlBBBIo0Cqokm729vK+U3PS+OMDJWVAhRNsnLZyh307Ceekan3OX/YUXmLJjlfvC+BdX+UOy46IuBngXHzl8pz89/***REMOVE_SECRET***/piffny2TJvo/Ba03oN7ykmn/cfzBOEvP5Dg2t8896MDAgiI/***REMOVE_SECRET***+SU9QTIKAj4UWL4+***REMOVE_SECRET***++rQ8POkRx3H6DOkt9U89wfM84a8/***REMOVE_SECRET***/rf6L+***REMOVE_SECRET***/6lw0Gdpb6p9SjqLJN8sk+***REMOVE_SECRET***+3aV0xucVpEhMHY2CFA0yYZVSl+MKYsmw+6U+icf73nC0HefSujXVZ770QEBBEoX+KkwJC+***REMOVE_SECRET***+z/EkXgcoUeH/***REMOVE_SECRET***+mp6bNk+gPO7zTpO+xOOaE8RZMVX0jo5xUVFzgjI+***REMOVE_SECRET***/8ZKtDHNS0/***REMOVE_SECRET***+***REMOVE_SECRET***+SuqvR0wscbxhqXvNWi+***REMOVE_SECRET***+***REMOVE_SECRET***/NI12qlPoeUuqd0Uy+5mvETj5ikJzTrqSY+mt5fVjxJz0KBUsIrudaJzWGumf9u+5QVtScqbZOISIMTj5T9dqsh+cVbSn+y514EEEi7QKqiSa+BPeTkM05K+7wMmGUCFE2ybMF2MNwnp8+***REMOVE_SECRET***+8896MDAggggAACCCCAAAIIIFAVAu//***REMOVE_SECRET***/3j9wLLTqKwn9+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+ul96jnT/v8fa+***REMOVE_SECRET***/***REMOVE_SECRET***/+ffy/PQcS/H21hL/52HM/***REMOVE_SECRET***+/***REMOVE_SECRET***+bVRh+***REMOVE_SECRET***+x8Wq3BYwZIvePKUTRZ+5uEv/***REMOVE_SECRET***/PlmkTpzv2Gzz2bql3zFGexw2s+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/sFuX/0A2UUTQbLkUcf7j2Qws2S++***REMOVE_SECRET***+51/***REMOVE_SECRET***+WI/5djqJJcaHk/u+1Co+fCRBAAAEEEEAAAQQQQACBdAi8s/***REMOVE_SECRET***+Jjefm5+TJu+H2OEw2fOFQOP/***REMOVE_SECRET***/pQ+***REMOVE_SECRET***/***REMOVE_SECRET***+ctlNGDxjoXTe4fKoce4f2dJgERCX/***REMOVE_SECRET***/KMcJRk0aLnUPr1uuAHI+***REMOVE_SECRET***+oI3ZHj/kc5Fk8nDpe5h5SuahD97R4Ib/***REMOVE_SECRET***/rJW+***REMOVE_SECRET***/hZRRNRkjdww4u19jhz9+***REMOVE_SECRET***+wQommTfmu1IxG+98Y4M6jXEcYjRD94jBx9yULmmCH/1kQTX/***REMOVE_SECRET***/cc7DjBmAdHykGH/KtcAYS/***REMOVE_SECRET***+t96V/94HORZMpo+***REMOVE_SECRET***+***REMOVE_SECRET***/gOMHYKaPkwHIWTYI/***REMOVE_SECRET***/***REMOVE_SECRET***+253MHFH/***REMOVE_SECRET***/URWHl7XzE4/RULW4UAgaQ+proGYBKwNpo8od7W/1EXA2nrbbjjrdvISmV2md6zVWQ+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+OYBH7ADsBbK5Gh9WVfspUrO3/***REMOVE_SECRET***/e/1h6d+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/1n2wSC1i8nzB0xe5/GHZMeDXFv+/***REMOVE_SECRET***+YanDSs4gJ3bKNF6n1YImcze+***REMOVE_SECRET***/lQouCf8DezJotZBW/***REMOVE_SECRET***/8ixKyT/***REMOVE_SECRET***/***REMOVE_SECRET***/7YCPP/***REMOVE_SECRET***/0ZDz1oWm0FKJpU26UtNbFlSz+***REMOVE_SECRET***+***REMOVE_SECRET***+gt7iX/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+XdLrmvln8tnW/q5q+***REMOVE_SECRET***+***REMOVE_SECRET***+et9jqo+dVc9ixmeOFWwvTvuC5eTnWmPETI+***REMOVE_SECRET***+e2Y2/jmXTaTx2bfaLZbecqxWXtH2vlx5U/pX1P+HVAdVpdddpTderO/***REMOVE_SECRET***/GMSVRT69NjxkSi1umHo+***REMOVE_SECRET***+***REMOVE_SECRET***/1rLsx/rJz0PCp5lb8+***REMOVE_SECRET***+ZOGbnZcaMr2F8TL8+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+7k0USRVz++JqqeZWg9j/mPFZO+***REMOVE_SECRET***//Mo34W0b/IUL/***REMOVE_SECRET***/***REMOVE_SECRET***/vKXah/TPPuGwurSO65+rEnOGwmY++1uNa4+***REMOVE_SECRET***+***REMOVE_SECRET***+XY2vyAmDZ0BkIAAQQQyFiB0c++LS+9/***REMOVE_SECRET***+LQZ8vjUGWVG+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/vnX+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/NizD8suu+***REMOVE_SECRET***++cjWkRMwIIIIAAAuUSiAWC0rDrBMe+***REMOVE_SECRET***+P7S7eL/++***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+FhW7ibHmOWURGUnn+Rp4ovFh46b2PPpzBNj6fZ6HNs/***REMOVE_SECRET***/qL6MZf8CI8/vO0x1bjWxOZRZz9uzfOi/bCNJj9+***REMOVE_SECRET***/***REMOVE_SECRET***/zhF+Xdj78sdYvNePFR2WnnnTJ/+***REMOVE_SECRET***+XZ1PIxJrlAvGiV1KBzS6+2UUslWJeXq5VlAuKqk+Zop2IuhHU1baABNW3ul+9urQKbQF9yNwXCKq+9gsodZ+6rfqYQk/8H90/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***/+***REMOVE_SECRET***+DEQIIIOBPAYom/***REMOVE_SECRET***/BSia+HftyRwBBLYX+O3X32Tpex/Ld998J6u+/1F++vEn+fmnX6BCAAEEEEDANwJ7/H0PObb+0XLNTVfL7n/***REMOVE_SECRET***+r9kw4a/***REMOVE_SECRET***/YB3Z/1919GWdA+***REMOVE_SECRET***+ktxG90lMk9y/***REMOVE_SECRET***+z3Zhliu30j2SAyjhrGJzWhOX+ZRcEqfcSi52CXWHtd42zpI5JG+***REMOVE_SECRET***+***REMOVE_SECRET***/ysVz6Wus+***REMOVE_SECRET***/***REMOVE_SECRET***//***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***//0flwgymxPJLZcAAAAASUVORK5CYII=',
        '1', NULL, NULL, NULL, NULL, NULL, '2024-10-11 16:59:45.000', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户->机构关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
INSERT INTO `sys_user_org`
VALUES (1, 1, 1, NULL, NULL, NULL, '2024-10-11 16:59:46.731', 1);
INSERT INTO `sys_user_org`
VALUES (18, 1, 1, NULL, '2024-10-11 16:59:45.000', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户->角色关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1, 1, NULL, NULL, NULL, '2024-10-11 16:59:46.738', 1);
INSERT INTO `sys_user_role`
VALUES (14, 1, 1, NULL, '2024-10-11 16:59:45.000', NULL, NULL, 0);

SET
FOREIGN_KEY_CHECKS = 1;