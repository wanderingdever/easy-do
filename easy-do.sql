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

 Date: 18/10/2024 15:52:31
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统参数配置' ROW_FORMAT = DYNAMIC;

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
VALUES (1, 1, '启用', 'true', 1, '', 'success', 1, NULL, NULL, NULL, '2024-09-12 11:41:21.820', 0);
INSERT INTO `sys_dict_data`
VALUES (2, 1, '停用', 'false', 2, '', 'danger', 1, NULL, NULL, NULL, '2024-09-12 11:41:23.887', 0);
INSERT INTO `sys_dict_data`
VALUES (3, 2, '是', 'true', 1, '{font-size: 16px;}', 'success', 1, NULL, '2022-11-02 21:44:07.000', '',
        '2024-09-12 11:41:24.853', 0);
INSERT INTO `sys_dict_data`
VALUES (4, 2, '否', 'false', 2, NULL, 'danger', 1, NULL, '2022-11-02 21:44:07.000', NULL, '2024-09-12 11:41:25.619', 0);
INSERT INTO `sys_dict_data`
VALUES (5, 3, '目录', 'CATALOGUE', 1, NULL, 'success', 1, NULL, '2022-11-02 21:44:07.000', NULL,
        '2024-09-12 11:41:26.367', 0);
INSERT INTO `sys_dict_data`
VALUES (6, 3, '按钮', 'BUTTON', 3, NULL, 'info', 1, NULL, '2022-11-02 21:44:07.000', NULL, '2024-09-12 11:41:27.233',
        0);
INSERT INTO `sys_dict_data`
VALUES (7, 3, '页面', 'PAGE', 2, NULL, 'success', 1, NULL, '2022-11-02 21:44:07.000', NULL, '2024-09-12 11:41:27.970',
        0);
INSERT INTO `sys_dict_data`
VALUES (8, 4, '男', 'MAN', 1, '', 'primary', 1, '1701847090820464641', '2023-11-30 11:25:08.000', NULL,
        '2024-09-12 11:41:28.685', 0);
INSERT INTO `sys_dict_data`
VALUES (9, 4, '女', 'WOMAN', 2, '', 'primary', 1, '1701847090820464641', '2023-11-30 11:25:27.000', NULL,
        '2024-09-12 11:41:29.465', 0);
INSERT INTO `sys_dict_data`
VALUES (10, 4, '其他', 'OTHER', 3, '', 'primary', 1, '1701847090820464641', '2023-11-30 11:26:01.000', NULL,
        '2024-09-12 11:41:32.450', 0);
INSERT INTO `sys_dict_data`
VALUES (11, 5, '未激活', 'INACTIVATED', 1, '', 'warning', 1, '1701847090820464641', '2023-11-30 11:31:12.000', NULL,
        '2024-09-12 11:41:33.213', 0);
INSERT INTO `sys_dict_data`
VALUES (12, 5, '正常', 'NORMAL', 2, '', 'success', 1, '1701847090820464641', '2023-11-30 11:31:24.000', NULL,
        '2024-09-12 11:41:33.894', 0);
INSERT INTO `sys_dict_data`
VALUES (13, 5, '停用', 'STOP', 3, '', 'danger', 1, '1701847090820464641', '2023-11-30 11:31:35.000', NULL,
        '2024-09-12 11:41:34.801', 0);
INSERT INTO `sys_dict_data`
VALUES (14, 6, 'WEB', 'WEB', 2, '', 'default', 1, '1701847090820464641', '2023-11-30 13:52:37.000', NULL,
        '2024-10-09 16:38:57.000', 0);
INSERT INTO `sys_dict_data`
VALUES (15, 6, 'APP', 'APP', 3, '', 'default', 1, '1701847090820464641', '2023-11-30 13:52:44.000', NULL,
        '2024-10-09 16:39:00.000', 0);
INSERT INTO `sys_dict_data`
VALUES (16, 6, '管理端', 'ADMIN', 1, '', 'default', 1, '1701847090820464641', '2023-11-30 13:53:14.000', NULL,
        '2024-10-09 16:38:52.000', 0);
INSERT INTO `sys_dict_data`
VALUES (17, 7, '本级', 'ONESELF', 1, '', 'primary', 1, '1701847090820464641', '2023-12-06 09:21:38.000', NULL,
        '2024-09-12 11:41:38.742', 0);
INSERT INTO `sys_dict_data`
VALUES (18, 7, '本级及以下', 'LOWER', 2, '', 'primary', 1, '1701847090820464641', '2023-12-06 09:21:55.000', NULL,
        '2024-09-12 11:41:39.678', 0);
INSERT INTO `sys_dict_data`
VALUES (19, 8, '公告', 'NOTICE', 1, '', 'default', 1, '1701847090820464641', '2023-12-12 16:46:53.000', NULL,
        '2024-09-12 11:41:40.805', 0);
INSERT INTO `sys_dict_data`
VALUES (20, 9, '草稿', 'DRAFT', 1, NULL, 'warning', 1, '1701847090820464641', '2023-12-25 16:54:11.000', NULL,
        '2024-09-12 11:41:41.644', 0);
INSERT INTO `sys_dict_data`
VALUES (21, 9, '已发布', 'UNREAD', 2, NULL, 'primary', 1, '1701847090820464641', '2023-12-25 16:54:34.000', NULL,
        '2024-09-12 11:41:42.452', 0);
INSERT INTO `sys_dict_data`
VALUES (22, 9, '已读', 'READ', 3, NULL, 'success', 1, '1701847090820464641', '2023-12-25 16:54:46.000', NULL,
        '2024-09-12 11:41:43.634', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_record
-- ----------------------------
INSERT INTO `sys_file_record`
VALUES (19, '熊猫上班.png', '2024/10/10/102301_熊猫上班.png', 'png', '151121', NULL, '2024-10-10 10:23:02.000', NULL,
        NULL, 0);
INSERT INTO `sys_file_record`
VALUES (20, 'WechatIMG883.jpg', '2024/10/17/095625_WechatIMG883.jpg', 'jpg', '1518746', NULL, '2024-10-17 09:56:25.000',
        NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1928 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_login_logs`
VALUES (1855, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:59:01.000', '1', NULL, '2024-10-12 10:59:01.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1856, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 10:59:02.000', '1', NULL, '2024-10-12 10:59:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1857, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 11:03:07.000', '1', NULL, '2024-10-12 11:03:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1858, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:03:41.000', '1', NULL, '2024-10-12 11:03:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1859, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:03:41.000', '1', NULL, '2024-10-12 11:03:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1860, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 11:04:29.000', '1', NULL, '2024-10-12 11:04:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1861, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 11:04:29.000', '1', NULL, '2024-10-12 11:04:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1862, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:08:24.000', '1', NULL, '2024-10-12 11:08:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1863, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:09:09.000', '1', NULL, '2024-10-12 11:09:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1864, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:09:29.000', '1', NULL, '2024-10-12 11:09:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1865, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:12:00.000', '1', NULL, '2024-10-12 11:12:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1866, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:12:10.000', '1', NULL, '2024-10-12 11:12:10.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1867, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 11:14:13.000', '1', NULL, '2024-10-12 11:14:13.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1868, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 11:14:14.000', '1', NULL, '2024-10-12 11:14:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1869, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:15:55.000', '1', NULL, '2024-10-12 11:15:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1870, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:15:55.000', '1', NULL, '2024-10-12 11:15:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1871, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 11:17:31.000', '1', NULL, '2024-10-12 11:17:31.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1872, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:18:00.000', '1', NULL, '2024-10-12 11:18:00.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1873, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 11:19:09.000', '1', NULL, '2024-10-12 11:19:09.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1874, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 11:20:02.000', '1', NULL, '2024-10-12 11:20:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1875, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 11:20:45.000', '1', NULL, '2024-10-12 11:20:45.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1876, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:34:12.000', '1', NULL, '2024-10-12 11:34:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1877, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:35:11.000', '1', NULL, '2024-10-12 11:35:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1878, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:38:02.000', '1', NULL, '2024-10-12 11:38:02.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1879, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:41:23.000', '1', NULL, '2024-10-12 11:41:23.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1880, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:41:52.000', '1', NULL, '2024-10-12 11:41:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1881, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:42:28.000', '1', NULL, '2024-10-12 11:42:28.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1882, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:42:48.000', '1', NULL, '2024-10-12 11:42:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1883, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:43:11.000', '1', NULL, '2024-10-12 11:43:11.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1884, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:43:22.000', '1', NULL, '2024-10-12 11:43:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1885, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:44:35.000', '1', NULL, '2024-10-12 11:44:35.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1886, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:44:46.000', '1', NULL, '2024-10-12 11:44:46.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1887, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:50:22.000', '1', NULL, '2024-10-12 11:50:22.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1888, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:51:19.000', '1', NULL, '2024-10-12 11:51:19.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1889, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:51:50.000', '1', NULL, '2024-10-12 11:51:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1890, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:53:03.000', '1', NULL, '2024-10-12 11:53:03.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1891, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:53:33.000', '1', NULL, '2024-10-12 11:53:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1892, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 11:55:50.000', '1', NULL, '2024-10-12 11:55:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1893, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 12:01:59.000', '1', NULL, '2024-10-12 12:01:59.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1894, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-12 12:36:48.000', '1', NULL, '2024-10-12 12:36:48.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1895, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 12:48:40.000', '1', NULL, '2024-10-12 12:48:40.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1896, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 12:48:55.000', '1', NULL, '2024-10-12 12:48:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1897, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 12:48:55.000', '1', NULL, '2024-10-12 12:48:55.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1898, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 12:55:15.000', '1', NULL, '2024-10-12 12:55:15.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1899, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 13:26:17.000', '1', NULL, '2024-10-12 13:26:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1900, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 13:36:41.000', '1', NULL, '2024-10-12 13:36:41.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1901, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-12 15:04:36.000', '1', NULL, '2024-10-12 15:04:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1902, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-15 13:57:21.000', '1', NULL, '2024-10-15 13:57:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1903, 1, 'admin', '192.168.5.11', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0',
        '2024-10-15 13:57:21.000', '1', NULL, '2024-10-15 13:57:21.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1904, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 09:56:11.000', '1', NULL, '2024-10-17 09:56:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1905, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 09:56:11.000', '1', NULL, '2024-10-17 09:56:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1906, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 09:56:54.000', '1', NULL, '2024-10-17 09:56:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1907, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 09:58:50.000', '1', NULL, '2024-10-17 09:58:50.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1908, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 09:58:54.000', '1', NULL, '2024-10-17 09:58:54.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1909, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 09:59:12.000', '1', NULL, '2024-10-17 09:59:12.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1910, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 09:59:14.000', '1', NULL, '2024-10-17 09:59:14.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1911, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:00:18.000', '1', NULL, '2024-10-17 10:00:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1912, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:02:53.000', '1', NULL, '2024-10-17 10:02:53.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1913, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:03:07.000', '1', NULL, '2024-10-17 10:03:07.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1914, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:04:42.000', '1', NULL, '2024-10-17 10:04:42.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1915, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:04:52.000', '1', NULL, '2024-10-17 10:04:52.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1916, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:04:57.000', '1', NULL, '2024-10-17 10:04:57.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1917, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:09:08.000', '1', NULL, '2024-10-17 10:09:08.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1918, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:09:17.000', '1', NULL, '2024-10-17 10:09:17.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1919, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:10:24.000', '1', NULL, '2024-10-17 10:10:24.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1920, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:10:29.000', '1', NULL, '2024-10-17 10:10:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1921, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:10:36.000', '1', NULL, '2024-10-17 10:10:36.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1922, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:11:26.000', '1', NULL, '2024-10-17 10:11:26.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1923, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:11:39.000', '1', NULL, '2024-10-17 10:11:39.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1924, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:17:18.000', '1', NULL, '2024-10-17 10:17:18.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1925, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:20:33.000', '1', NULL, '2024-10-17 10:20:33.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1926, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:22:29.000', '1', NULL, '2024-10-17 10:22:29.000', NULL, 0);
INSERT INTO `sys_login_logs`
VALUES (1927, 1, 'admin', '192.168.5.105', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
        '2024-10-17 10:23:25.000', '1', NULL, '2024-10-17 10:23:25.000', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账号信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 'admin', '$2a$10$ctagQJswnSwUyl/akFuFFeLyRO/ffMxuK2HhnzM29w9lfBLoZCU82', NULL, '13300006666', 'ADMIN',
        'NORMAL', NULL, '2022-10-07 10:16:26.000', NULL, '2024-09-12 12:38:41.941', 0);
INSERT INTO `sys_user`
VALUES (2, '测试', '$2a$10$ZQa8WPa7xyioBXDM.pI/***REMOVE_SECRET***', NULL, '15399999999', 'WEB',
        'INACTIVATED', NULL, '2024-10-17 10:24:02.000', NULL, '2024-10-17 10:24:14.000', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info`
VALUES (1, 1, '超级管理员',
        'data:image/png;base64,***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/lVViTLLUUAAAAgdFJOUwBsBPH2+***REMOVE_SECRET***/U3aVpl5LQWFRKnV+WaNPCIvdGeBHqm/***REMOVE_SECRET***+Y28QM+4KWGXsiCCHA7wc9tByWMPIYQv7h/B0+WS/BH8BHwyn1zDN5fpteHJaDB+BSwmef3BNG/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***',
        '1', NULL, NULL, NULL, NULL, NULL, '2024-10-17 10:17:17.000', 0);
INSERT INTO `sys_user_info`
VALUES (10, 2, '测试1',
        'data:image/png;base64,***REMOVE_SECRET***/***REMOVE_SECRET***/T0//d2//Ny//h3//c2f/Y1v/Nyv/T0P/l4//PzP/k4f/a2P/PzP/W1v/Z1//Z1//l4//l4//Py//Qy//k4v/l4//PzP/l4v/l4//Oyv/h4f/Rzv/S0P/i4v/l4/+wqv/k4v/V0v/j4f/T0P/c2v/U0f/Rz//i4P/W0//Sz//h3//Qzf/f3f/Pzf/e3P/X1f/Z1//OzP/g3v+0r//Ny//d2//FwP/Dv//W1P60sf/Y1v/a1/6yrv+2s//a2PzAvf+1sf/Y1f+/uv/Fwv/Nyf+yrP+vqf/g3f/V0//b2f+8uP/U0v/AvP7Ixvy+uv+zrv+voP/d2v2uq/2wrP/T0f/CvfaZlP+xq/y7uPuzsP/q6P/Kxvacl/ysqP6vqf/Qzv+7tv/IxPu2s/yuqf+tp/+4tfaYkv+snvuqp/uinv7Avv+wrP/t7P7Gw/6+u//MyP+xqv/Cvv3Ewf/n5v6wqvukofeemfzCv/3Ny/aWkfy5tvywrf+ik/+mmP/k4f3S0P2ppP2moPzGxP3X1f/z8v/***REMOVE_SECRET***/b89vb29/b28+YUX3Lk7oUqifOztsXEKsj6LDy+***REMOVE_SECRET***+KCoIghIBC6KgvCY+xrEqFYPJiPWX+2fPWmvvfV6cc6C5mdVzQPtD+8l3rb0OarNh/f7x08Sb/2+9+7Wa+PTxd5uo9x8+T7y5Nq0t01oSr8GtYHBpKWhQPh/ePuXb4fLKL/***REMOVE_SECRET***/***REMOVE_SECRET***/EBzgfn6+H2hcUMS3x22y2glYsH7+HsyIR+***REMOVE_SECRET***/***REMOVE_SECRET***+SEXwz7SiVUuVnRuwCaJwVd+4szZSRRZeXEoEhmVAAcHiveP6/F8eMucx8FZN3GkioojS+***REMOVE_SECRET***+/0SgTn5NdJjGVWDo0WsO+LC+***REMOVE_SECRET***/***REMOVE_SECRET***/n9Q0A4JG9VzRt1/***REMOVE_SECRET***+i37lxbwScCU48K/***REMOVE_SECRET***/NTOYgh/***REMOVE_SECRET***/***REMOVE_SECRET***/7PkkGdc4jylHCJKQYODLn+***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***+EyJP+PTT4g++pjr9V07GVCMVWBkrYBJW+sAFBj5he8p3OPwFxI9zOWTAAOH+5w/G4nmCwa3+K9swOnM+v3exsHaYuPmyA0tpvCsdAQR72jCP+t4w9cq4NB5w++***REMOVE_SECRET***/***REMOVE_SECRET***+GjjR5TbQLZEoW0FfZ6SBIYX5/***REMOVE_SECRET***/sZJJeBs3p/m2gEHZ7d+/***REMOVE_SECRET***/***REMOVE_SECRET***+/f2+***REMOVE_SECRET***+du2uN1B9ZDs1MLruz1VT9vhzZiL+***REMOVE_SECRET***+PLwA02Z84g5LDW/***REMOVE_SECRET***/pNr5/***REMOVE_SECRET***+***REMOVE_SECRET***+ubhouLfItDoCZjBjiNwy3d3aWc+nh82tgu5QWjneK3GH17mXS/S9f19TTnNds0MhsNH+/Mj0po3LgRmDBYojmEUtuDW1t3q5Vc+gHg0CnXM7RyDGyzfPrn+/PPF17jtxa/i3/***REMOVE_SECRET***/***REMOVE_SECRET***/d35/J+***REMOVE_SECRET***+***REMOVE_SECRET***/vje3FMYGdGALjDTzEDjgtT+WSg/***REMOVE_SECRET***+EKcEFE48KY1SvbK+Mn4HQZADiDBIQIyw+D+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/bvquuZ+dVmpdW6+***REMOVE_SECRET***/ftQ4MJ0NegXw8bH1A4D9veVm9SH+ECoc9lut6s/+***REMOVE_SECRET***/1a7e62s5s+O1SALQCiL1m+5EBq8QUAR0QlULoyB+***REMOVE_SECRET***/***REMOVE_SECRET***/IMlgkIe/CGDsnC1Dh5DZcREHc6NHl/***REMOVE_SECRET***/***REMOVE_SECRET***/e9JSA7usxfCz6dqa0uKL8MzULM3UL+Cm4Jr6BwIN1joC1w0SJOC/***REMOVE_SECRET***//I91sn9LIsjA+***REMOVE_SECRET***/***REMOVE_SECRET***/lpwBIYywHPqqs3toJskmTocL+dZ4C0n9m/***REMOVE_SECRET***+3D/***REMOVE_SECRET***+UxYC/MfM+***REMOVE_SECRET***/***REMOVE_SECRET***+PNr/K0B53poAtMsXg6xWYoUgB+TbLW4xAOoIeMotdgF+fpMRgJASbNTQaD7OApQdrvl8CDgz+qQg9Jmg3s/***REMOVE_SECRET***/***REMOVE_SECRET***+8Q8NgNGM/***REMOVE_SECRET***+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+PcAaBMCWA3hDNSgAM0zB+GE2n+VF+HH/***REMOVE_SECRET***/c+EvjAXBmuLAVkoJ+***REMOVE_SECRET***/XL28GoG4EAoWB1cspAg4DWNYnzpA+fiTAoBkXD3zCyHyuuucU91NFKm+t/CgFiEEdj0+/3KVd4bkgbV4MAOyYA1ageQQvJye/f3d+8+Z/J4dNo9O1LFc1/aHq97OZWR3X0WBQTClTIABsDi/BWfJF/o+WDjst8RCkpg8QQgegwOv8zsvnv5+ffP29ixs/***REMOVE_SECRET***/KsQAFQ5ICva/ugGHpxL0wa4b8FdsMxSST/***REMOVE_SECRET***/***REMOVE_SECRET***+D4FAT/9+v59Taqs9Nvth3Y/***REMOVE_SECRET***+8cuLWc6TgniucxS0ARt12+IbyV2DAjDz73+9e/36+/dm0Dw/b513/***REMOVE_SECRET***+/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***/wRj10QiLZKX50FBx7FCTAV/geEVcJCLf0YNgfCGhYd+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***+e6r+***REMOVE_SECRET***/AHfxbFLQa+***REMOVE_SECRET***/***REMOVE_SECRET***/***REMOVE_SECRET***/ha+6EyY+7vF/gOfHoqll4p4sbBoP2A3E+***REMOVE_SECRET***/QclGl+***REMOVE_SECRET***/mw1omrfFBwu6NH2h+***REMOVE_SECRET***+qJCCOVIQQ3Jf/TgJ2HAB9sji4tFDIMjuuwfoRqc/YA2uf3559OMFzR4B7kHPBsA/Fwccsf2gL5x21+***REMOVE_SECRET***+6AJwFa/***REMOVE_SECRET***+***REMOVE_SECRET***/YgONpQOWVmeAWJ2mTYBiCsZD++r+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+6z64bxDgW8DamQcINcgB1a4NmNxjH/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+ukUK1jngSeNyMFGD1+4+***REMOVE_SECRET***+***REMOVE_SECRET***+OV+***REMOVE_SECRET***+A1SeAagIwFcCEG9gzgDs+DDFX21ApwbDXEEEDHg+***REMOVE_SECRET***/3wz2FxAWIeb70KJh1ALsOoM/***REMOVE_SECRET***+***REMOVE_SECRET***+fzFn+***REMOVE_SECRET***/Jvb71X3dyOk0k2vBjp5gg/***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+waAd9cW7OJq+***REMOVE_SECRET***+***REMOVE_SECRET***+CNFwigZZdMY5vZ/***REMOVE_SECRET***/***REMOVE_SECRET***+6nXue8c/XSqLgfaHCZHwHBPkj5/n0k3w18Ai/***REMOVE_SECRET***/oCAjRu+***REMOVE_SECRET***/q+***REMOVE_SECRET***/X7iUTyjLQeEQK4I6DwJzrjsHof/tdp06+v/***REMOVE_SECRET***/WPu/kb/iiUO4lfuTFCl+***REMOVE_SECRET***/k//nRA9ahSIPBq/wdibHOiwG+***REMOVE_SECRET***/M5+***REMOVE_SECRET***+***REMOVE_SECRET***+nQg6TtcWH24zX6YXgDTZquMQU+YsVx+***REMOVE_SECRET***/***REMOVE_SECRET***+***REMOVE_SECRET***+***REMOVE_SECRET***+KEEWFhY+/EHkI5FPVD5//jQpo8/***REMOVE_SECRET***',
        '1', '测试1', NULL, NULL, '2024-10-17 10:24:02.000', NULL, '2024-10-17 10:24:15.512', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户->机构关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
INSERT INTO `sys_user_org`
VALUES (1, 1, 1, NULL, NULL, NULL, '2024-10-11 16:59:46.731', 1);
INSERT INTO `sys_user_org`
VALUES (18, 1, 1, NULL, '2024-10-11 16:59:45.000', NULL, '2024-10-17 09:58:52.485', 1);
INSERT INTO `sys_user_org`
VALUES (19, 1, 1, NULL, '2024-10-17 09:58:51.000', NULL, '2024-10-17 10:03:04.279', 1);
INSERT INTO `sys_user_org`
VALUES (20, 1, 1, NULL, '2024-10-17 10:03:03.000', NULL, '2024-10-17 10:04:54.870', 1);
INSERT INTO `sys_user_org`
VALUES (21, 1, 1, NULL, '2024-10-17 10:04:54.000', NULL, '2024-10-17 10:09:14.948', 1);
INSERT INTO `sys_user_org`
VALUES (22, 1, 1, NULL, '2024-10-17 10:09:14.000', NULL, '2024-10-17 10:10:31.692', 1);
INSERT INTO `sys_user_org`
VALUES (23, 1, 1, NULL, '2024-10-17 10:10:31.000', NULL, '2024-10-17 10:11:41.933', 1);
INSERT INTO `sys_user_org`
VALUES (24, 1, 1, NULL, '2024-10-17 10:11:41.000', NULL, '2024-10-17 10:16:21.532', 1);
INSERT INTO `sys_user_org`
VALUES (25, 1, 1, NULL, '2024-10-17 10:16:20.000', NULL, '2024-10-17 10:16:32.877', 1);
INSERT INTO `sys_user_org`
VALUES (26, 1, 1, NULL, '2024-10-17 10:16:32.000', NULL, '2024-10-17 10:17:18.400', 1);
INSERT INTO `sys_user_org`
VALUES (27, 1, 1, NULL, '2024-10-17 10:17:17.000', NULL, NULL, 0);
INSERT INTO `sys_user_org`
VALUES (28, 2, 1, NULL, '2024-10-17 10:24:02.000', NULL, '2024-10-17 10:24:15.517', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户->角色关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1, 1, NULL, NULL, NULL, '2024-10-11 16:59:46.738', 1);
INSERT INTO `sys_user_role`
VALUES (14, 1, 1, NULL, '2024-10-11 16:59:45.000', NULL, '2024-10-17 09:58:52.491', 1);
INSERT INTO `sys_user_role`
VALUES (15, 1, 1, NULL, '2024-10-17 09:58:51.000', NULL, '2024-10-17 10:03:04.283', 1);
INSERT INTO `sys_user_role`
VALUES (16, 1, 1, NULL, '2024-10-17 10:03:03.000', NULL, '2024-10-17 10:04:54.877', 1);
INSERT INTO `sys_user_role`
VALUES (17, 1, 1, NULL, '2024-10-17 10:04:54.000', NULL, '2024-10-17 10:09:14.962', 1);
INSERT INTO `sys_user_role`
VALUES (18, 1, 1, NULL, '2024-10-17 10:09:14.000', NULL, '2024-10-17 10:10:31.698', 1);
INSERT INTO `sys_user_role`
VALUES (19, 1, 1, NULL, '2024-10-17 10:10:31.000', NULL, '2024-10-17 10:11:41.937', 1);
INSERT INTO `sys_user_role`
VALUES (20, 1, 1, NULL, '2024-10-17 10:11:41.000', NULL, '2024-10-17 10:16:21.536', 1);
INSERT INTO `sys_user_role`
VALUES (21, 1, 1, NULL, '2024-10-17 10:16:20.000', NULL, '2024-10-17 10:16:32.881', 1);
INSERT INTO `sys_user_role`
VALUES (22, 1, 1, NULL, '2024-10-17 10:16:32.000', NULL, '2024-10-17 10:17:18.450', 1);
INSERT INTO `sys_user_role`
VALUES (23, 1, 1, NULL, '2024-10-17 10:17:17.000', NULL, NULL, 0);
INSERT INTO `sys_user_role`
VALUES (24, 2, 1, NULL, '2024-10-17 10:24:02.000', NULL, '2024-10-17 10:24:15.523', 1);

SET
FOREIGN_KEY_CHECKS = 1;