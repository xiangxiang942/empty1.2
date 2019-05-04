/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50715
 Source Host           : localhost:3306
 Source Schema         : empty

 Target Server Type    : MySQL
 Target Server Version : 50715
 File Encoding         : 65001

 Date: 26/04/2019 15:48:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `permissions_id` int(11) NOT NULL AUTO_INCREMENT,
  `permissions_value` varchar(100) DEFAULT NULL COMMENT '权限值，如upload、download、deleteUser',
  `permissions_desc` varchar(100) DEFAULT NULL COMMENT '显示给用户的值，如上传、下载、删除用户',
  PRIMARY KEY (`permissions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
INSERT INTO `permissions` VALUES (1, 'addUser', '添加用户');
INSERT INTO `permissions` VALUES (2, 'deleteUser', '删除用户');
INSERT INTO `permissions` VALUES (3, 'changePassword', '修改密码');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_value` varchar(100) NOT NULL COMMENT '角色值，如admin、student、teacher',
  `role_desc` varchar(100) NOT NULL COMMENT '角色详情，展示给用户看，如管理员、学生、教师',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'admin', '管理员');
INSERT INTO `role` VALUES (2, 'student', '学生');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role` (`role_id`),
  CONSTRAINT `user_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 1, '16626423431', '123');
INSERT INTO `user` VALUES (2, 2, '18027638302', '123');

COMMIT;

-- ----------------------------
-- Table structure for user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_permissions`;
CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permissions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_id` (`permissions_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `permissions_id` FOREIGN KEY (`permissions_id`) REFERENCES `permissions` (`permissions_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_permissions
-- ----------------------------
BEGIN;
INSERT INTO `user_permissions` VALUES (1, 1, 1);
INSERT INTO `user_permissions` VALUES (3, 1, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
