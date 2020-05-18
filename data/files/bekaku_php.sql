/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50539
 Source Host           : localhost:3306
 Source Schema         : bekaku_php

 Target Server Type    : MySQL
 Target Server Version : 50539
 File Encoding         : 65001

 Date: 18/05/2020 18:03:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access_token
-- ----------------------------
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `api_client` bigint(20) NULL DEFAULT NULL,
  `user` bigint(20) NULL DEFAULT NULL,
  `revoked` tinyint(1) NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  `expires_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5kmvrg6uuo55il7lx84mimu4f`(`api_client`) USING BTREE,
  INDEX `FKjll8aufysmo6yvf124vsqpd81`(`user`) USING BTREE,
  CONSTRAINT `access_token_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `access_token_ibfk_2` FOREIGN KEY (`api_client`) REFERENCES `api_client` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for api_client
-- ----------------------------
DROP TABLE IF EXISTS `api_client`;
CREATE TABLE `api_client`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `api_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `by_pass` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 1,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of api_client
-- ----------------------------
INSERT INTO `api_client` VALUES (1, 'default', '4480b668766262a3eb1a51945ef5cb0e7faba9032eaecebce1d8227e3403ed564b7bea6ba620b34a47492c81cb5cf252bb32', 1, 1, '2020-04-28 22:07:45', '2020-04-28 22:07:45');

-- ----------------------------
-- Table structure for api_client_ip
-- ----------------------------
DROP TABLE IF EXISTS `api_client_ip`;
CREATE TABLE `api_client_ip`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NULL DEFAULT 1,
  `ip_address` char(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `api_client` bigint(20) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5pu9gbj8rvr9gdx27uwua7ug9`(`api_client`) USING BTREE,
  CONSTRAINT `api_client_ip_ibfk_1` FOREIGN KEY (`api_client`) REFERENCES `api_client` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `crud_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'role', 'role list', 'role_list', 1);
INSERT INTO `permission` VALUES (2, 'role', 'role add', 'role_add', 1);
INSERT INTO `permission` VALUES (3, 'role', 'role view', 'role_view', 1);
INSERT INTO `permission` VALUES (4, 'role', 'role edit', 'role_edit', 1);
INSERT INTO `permission` VALUES (5, 'role', 'role delete', 'role_delete', 1);
INSERT INTO `permission` VALUES (6, 'permission', 'permission list', 'permission_list', 1);
INSERT INTO `permission` VALUES (7, 'permission', 'permission add', 'permission_add', 1);
INSERT INTO `permission` VALUES (8, 'permission', 'permission view', 'permission_view', 1);
INSERT INTO `permission` VALUES (9, 'permission', 'permission edit', 'permission_edit', 1);
INSERT INTO `permission` VALUES (10, 'permission', 'permission delete', 'permission_delete', 1);
INSERT INTO `permission` VALUES (11, 'api_client', 'api_client list', 'api_client_list', 1);
INSERT INTO `permission` VALUES (12, 'api_client', 'api_client add', 'api_client_add', 1);
INSERT INTO `permission` VALUES (13, 'api_client', 'api_client view', 'api_client_view', 1);
INSERT INTO `permission` VALUES (14, 'api_client', 'api_client edit', 'api_client_edit', 1);
INSERT INTO `permission` VALUES (15, 'api_client', 'api_client delete', 'api_client_delete', 1);
INSERT INTO `permission` VALUES (16, 'api_client_ip', 'api_client_ip list', 'api_client_ip_list', 1);
INSERT INTO `permission` VALUES (17, 'api_client_ip', 'api_client_ip add', 'api_client_ip_add', 1);
INSERT INTO `permission` VALUES (18, 'api_client_ip', 'api_client_ip view', 'api_client_ip_view', 1);
INSERT INTO `permission` VALUES (19, 'api_client_ip', 'api_client_ip edit', 'api_client_ip_edit', 1);
INSERT INTO `permission` VALUES (20, 'api_client_ip', 'api_client_ip delete', 'api_client_ip_delete', 1);
INSERT INTO `permission` VALUES (21, 'access_token', 'access_token list', 'access_token_list', 1);
INSERT INTO `permission` VALUES (22, 'access_token', 'access_token add', 'access_token_add', 1);
INSERT INTO `permission` VALUES (23, 'access_token', 'access_token view', 'access_token_view', 1);
INSERT INTO `permission` VALUES (24, 'access_token', 'access_token edit', 'access_token_edit', 1);
INSERT INTO `permission` VALUES (25, 'access_token', 'access_token delete', 'access_token_delete', 1);
INSERT INTO `permission` VALUES (26, 'user', 'user list', 'user_list', 1);
INSERT INTO `permission` VALUES (27, 'user', 'user add', 'user_add', 1);
INSERT INTO `permission` VALUES (28, 'user', 'user view', 'user_view', 1);
INSERT INTO `permission` VALUES (29, 'user', 'user edit', 'user_edit', 1);
INSERT INTO `permission` VALUES (30, 'user', 'user delete', 'user_delete', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Dev role', 'dev', 1);
INSERT INTO `role` VALUES (2, 'Admin role', 'admin', 1);
INSERT INTO `role` VALUES (3, 'User', 'user', 1);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `permission` bigint(20) NOT NULL,
  `role` bigint(20) NOT NULL,
  PRIMARY KEY (`permission`, `role`) USING BTREE,
  INDEX `FKgi97nqcoshtqa28hiy11fc8ho`(`role`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (2, 1);
INSERT INTO `role_permission` VALUES (3, 1);
INSERT INTO `role_permission` VALUES (4, 1);
INSERT INTO `role_permission` VALUES (5, 1);
INSERT INTO `role_permission` VALUES (6, 1);
INSERT INTO `role_permission` VALUES (7, 1);
INSERT INTO `role_permission` VALUES (8, 1);
INSERT INTO `role_permission` VALUES (9, 1);
INSERT INTO `role_permission` VALUES (10, 1);
INSERT INTO `role_permission` VALUES (11, 1);
INSERT INTO `role_permission` VALUES (12, 1);
INSERT INTO `role_permission` VALUES (13, 1);
INSERT INTO `role_permission` VALUES (14, 1);
INSERT INTO `role_permission` VALUES (15, 1);
INSERT INTO `role_permission` VALUES (16, 1);
INSERT INTO `role_permission` VALUES (17, 1);
INSERT INTO `role_permission` VALUES (18, 1);
INSERT INTO `role_permission` VALUES (19, 1);
INSERT INTO `role_permission` VALUES (20, 1);
INSERT INTO `role_permission` VALUES (21, 1);
INSERT INTO `role_permission` VALUES (22, 1);
INSERT INTO `role_permission` VALUES (23, 1);
INSERT INTO `role_permission` VALUES (24, 1);
INSERT INTO `role_permission` VALUES (25, 1);
INSERT INTO `role_permission` VALUES (26, 1);
INSERT INTO `role_permission` VALUES (27, 1);
INSERT INTO `role_permission` VALUES (28, 1);
INSERT INTO `role_permission` VALUES (29, 1);
INSERT INTO `role_permission` VALUES (30, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `created_user` bigint(20) NULL DEFAULT NULL,
  `updated_user` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `k_created_user`(`created_user`) USING BTREE,
  INDEX `k_updated_user`(`updated_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin@gmail.com', NULL, '2b80c2a4acbfbb1dd8d289f92e8193750ceadfd2bbc8b5a5d842f7aa6cfe223f4c321c6530e8df74d0bf1abe7a0c2c21f1671d356775113583ce4cdf949e277c', '01bf5d6e94a31637ddfb7c02e2fc54c08e8e73bd7088f5fe0b6995e2f0ed7d0d9e474e8a8144cd8b8e61800c5652bc46c6e5a50bc7cc74b2dbdbd36331c85414', 1, '2020-04-27 11:23:19', '2020-04-27 11:23:19', NULL, NULL);

-- ----------------------------
-- Table structure for user_login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `user_login_attempts`;
CREATE TABLE `user_login_attempts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) NOT NULL,
  `time` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `k_app_user`(`user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_login_attempts
-- ----------------------------
INSERT INTO `user_login_attempts` VALUES (7, 1, '1588591612', '::1', '2020-05-04 18:26:52');

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loged_in_date` datetime NULL DEFAULT NULL,
  `loged_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `k_app_user`(`user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_login_log
-- ----------------------------
INSERT INTO `user_login_log` VALUES (6, '2020-05-04 16:13:09', '::1', 1);
INSERT INTO `user_login_log` VALUES (7, '2020-05-04 16:13:39', '::1', 1);
INSERT INTO `user_login_log` VALUES (8, '2020-05-04 16:14:39', '::1', 1);
INSERT INTO `user_login_log` VALUES (9, '2020-05-04 17:28:00', '::1', 11);
INSERT INTO `user_login_log` VALUES (10, '2020-05-04 17:29:06', '::1', 11);
INSERT INTO `user_login_log` VALUES (11, '2020-05-04 18:08:27', '::1', 11);
INSERT INTO `user_login_log` VALUES (12, '2020-05-04 18:14:33', '::1', 11);
INSERT INTO `user_login_log` VALUES (13, '2020-05-04 18:20:56', '::1', 11);
INSERT INTO `user_login_log` VALUES (14, '2020-05-04 18:21:40', '::1', 11);
INSERT INTO `user_login_log` VALUES (15, '2020-05-04 18:25:05', '::1', 11);
INSERT INTO `user_login_log` VALUES (16, '2020-05-04 18:25:40', '::1', 11);
INSERT INTO `user_login_log` VALUES (17, '2020-05-04 18:25:59', '::1', 11);
INSERT INTO `user_login_log` VALUES (18, '2020-05-04 18:26:08', '::1', 11);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `role` bigint(20) NOT NULL,
  `user` bigint(20) NOT NULL,
  PRIMARY KEY (`role`, `user`) USING BTREE,
  INDEX `FKmnacayuqabmejp7e23rvitaol`(`user`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);

SET FOREIGN_KEY_CHECKS = 1;
