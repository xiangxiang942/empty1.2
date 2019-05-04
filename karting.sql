/*
Navicat MySQL Data Transfer

Source Server         : db_karting
Source Server Version : 50720
Source Host           : starcc.cc:3305
Source Database       : karting

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-04-29 13:41:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_username` varchar(255) DEFAULT NULL,
  `admin_phone` char(11) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_create_time` varchar(255) DEFAULT NULL,
  `admin_status` int(1) DEFAULT NULL,
  `admin_role` int(1) DEFAULT NULL,
  `admin_platform_type` int(1) DEFAULT NULL,
  `merchant_id` varchar(255) DEFAULT NULL COMMENT '（商户平台需要此id）',
  PRIMARY KEY (`admin_id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) DEFAULT NULL,
  `article_description` mediumtext,
  `article_category_id` int(11) DEFAULT NULL,
  `article_remark` text,
  `article_create_time` varchar(255) DEFAULT NULL,
  `article_url` varchar(255) DEFAULT NULL,
  `ariticle_platform_type` int(1) DEFAULT NULL,
  `merchant_id` varchar(255) DEFAULT NULL COMMENT '（商户平台需要此id）',
  `locking` int(1) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_media_type` int(1) DEFAULT NULL,
  `carousel_media_url` varchar(255) DEFAULT NULL,
  `carousel_content_type` int(1) DEFAULT NULL,
  `carousel_content_id` int(11) DEFAULT NULL,
  `carousel_play_time` varchar(255) DEFAULT NULL,
  `carousel_title` varchar(255) DEFAULT NULL,
  `carousel_remark` text,
  `carousel_status` int(1) DEFAULT NULL,
  `carousel_putaway` int(1) DEFAULT NULL,
  `carousel_create_time` varchar(255) DEFAULT NULL,
  `carousel_putaway_time` varchar(255) DEFAULT NULL,
  `carousel_soldout_time` varchar(255) DEFAULT NULL,
  `carousel_last_edit_time` varchar(255) DEFAULT NULL,
  `carousel_content_url` varchar(255) DEFAULT NULL,
  `carousel_sort` int(11) DEFAULT NULL,
  `carousel_location` int(1) DEFAULT NULL,
  `carousel_platform_type` int(1) DEFAULT NULL,
  `carousel_platform_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`carousel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of carousel
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_quantity` int(11) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `cart_create_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `commodity_id` (`commodity_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_type` int(1) DEFAULT NULL,
  `category_remark` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for club
-- ----------------------------
DROP TABLE IF EXISTS `club`;
CREATE TABLE `club` (
  `club_id` int(11) NOT NULL AUTO_INCREMENT,
  `club_name` varchar(255) DEFAULT NULL,
  `club_area` varchar(255) DEFAULT NULL,
  `club_address` varchar(255) DEFAULT NULL,
  `club_create_time` varchar(255) DEFAULT NULL,
  `club_cover_path` varchar(255) DEFAULT NULL,
  `club_location` varchar(255) DEFAULT NULL,
  `club_description` mediumtext,
  `club_contact_name` varchar(255) DEFAULT NULL,
  `club_contact_phone` char(11) DEFAULT NULL,
  `club_status` int(1) DEFAULT NULL,
  `club_acreage` varchar(255) DEFAULT NULL,
  `merchant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`club_id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `club_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of club
-- ----------------------------

-- ----------------------------
-- Table structure for club_feature
-- ----------------------------
DROP TABLE IF EXISTS `club_feature`;
CREATE TABLE `club_feature` (
  `club_feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`club_feature_id`),
  KEY `club_id` (`club_id`),
  KEY `feature_id` (`feature_id`),
  CONSTRAINT `club_feature_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`),
  CONSTRAINT `club_feature_ibfk_2` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of club_feature
-- ----------------------------

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `commodity_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(255) DEFAULT NULL,
  `commodity_intro` mediumtext,
  `commodity_cover_path` varchar(255) DEFAULT NULL,
  `commodity_create_time` varchar(255) DEFAULT NULL,
  `commodity_category_id` int(11) DEFAULT NULL,
  `commodity_price` decimal(10,2) DEFAULT NULL,
  `commodity_stock` int(11) DEFAULT NULL,
  `commodity_sales` int(11) DEFAULT NULL,
  `commodity_check_status` int(1) DEFAULT NULL,
  `commodity_status` int(1) DEFAULT NULL,
  `commodity_belong` int(1) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL COMMENT '（俱乐部商城需要此id）',
  PRIMARY KEY (`commodity_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `commodity_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of commodity
-- ----------------------------

-- ----------------------------
-- Table structure for commodity_appreciation
-- ----------------------------
DROP TABLE IF EXISTS `commodity_appreciation`;
CREATE TABLE `commodity_appreciation` (
  `commodity_appreciation_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_appreciation_name` varchar(255) DEFAULT NULL,
  `commodity_appreciation_cover_path` varchar(255) DEFAULT NULL,
  `commodity_appreciation_price` decimal(10,2) DEFAULT NULL,
  `commodity_appreciation_create_time` varchar(255) DEFAULT NULL,
  `is_required` int(1) DEFAULT NULL,
  PRIMARY KEY (`commodity_appreciation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of commodity_appreciation
-- ----------------------------

-- ----------------------------
-- Table structure for commodity_appreciation_item
-- ----------------------------
DROP TABLE IF EXISTS `commodity_appreciation_item`;
CREATE TABLE `commodity_appreciation_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) DEFAULT NULL,
  `commodity_appreciation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `commodity_id` (`commodity_id`),
  KEY `commodity_appreciation_id` (`commodity_appreciation_id`),
  CONSTRAINT `commodity_appreciation_item_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`),
  CONSTRAINT `commodity_appreciation_item_ibfk_2` FOREIGN KEY (`commodity_appreciation_id`) REFERENCES `commodity_appreciation` (`commodity_appreciation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of commodity_appreciation_item
-- ----------------------------

-- ----------------------------
-- Table structure for commodity_property
-- ----------------------------
DROP TABLE IF EXISTS `commodity_property`;
CREATE TABLE `commodity_property` (
  `commodity_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) DEFAULT NULL,
  `commodity_property_name` varchar(255) DEFAULT NULL,
  `commodity_property_description` text,
  PRIMARY KEY (`commodity_property_id`),
  KEY `commodity_id` (`commodity_id`),
  CONSTRAINT `commodity_property_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of commodity_property
-- ----------------------------

-- ----------------------------
-- Table structure for feature
-- ----------------------------
DROP TABLE IF EXISTS `feature`;
CREATE TABLE `feature` (
  `feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(255) DEFAULT NULL,
  `feature_remark` text,
  PRIMARY KEY (`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of feature
-- ----------------------------

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_content_type` int(1) DEFAULT NULL,
  `image_content_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `image_remark` text,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant` (
  `merchant_id` varchar(255) NOT NULL,
  `merchant_name` varchar(255) DEFAULT NULL,
  `merchant_business_license_path` varchar(255) DEFAULT NULL,
  `merchant_phone` char(11) DEFAULT NULL,
  `merchant_password` varchar(255) DEFAULT NULL,
  `merchant_contact_name` varchar(255) DEFAULT NULL,
  `merchant_contact_email` varchar(255) DEFAULT NULL,
  `merchant_bank_username` varchar(255) DEFAULT NULL,
  `merchant_opening_bank` varchar(255) DEFAULT NULL,
  `merchant_bank_account` varchar(255) DEFAULT NULL,
  `merchant_procedure_rate` varchar(255) DEFAULT NULL,
  `merchant_create_time` varchar(255) DEFAULT NULL,
  `wx_openid` varchar(255) DEFAULT NULL,
  `unionid` varchar(255) DEFAULT NULL,
  `merchant_available_balance` decimal(10,2) DEFAULT NULL,
  `merchant_block_balance` decimal(10,2) DEFAULT NULL,
  `merchant_deal_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of merchant
-- ----------------------------

-- ----------------------------
-- Table structure for order_commodity
-- ----------------------------
DROP TABLE IF EXISTS `order_commodity`;
CREATE TABLE `order_commodity` (
  `order_commodity_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `commodity_total_money` decimal(10,2) DEFAULT NULL,
  `commodity_discount_total_money` decimal(10,2) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_commodity_id`),
  KEY `commodity_id` (`commodity_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_commodity_ibfk_1` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`),
  CONSTRAINT `order_commodity_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_commodity
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `order_pay_id` varchar(255) DEFAULT NULL,
  `order_pay_pattern` int(1) DEFAULT NULL,
  `order_type` int(1) DEFAULT NULL,
  `order_status` int(1) DEFAULT NULL,
  `order_create_time` varchar(255) DEFAULT NULL,
  `order_pay_time` varchar(255) DEFAULT NULL,
  `order_total_money` decimal(10,2) DEFAULT NULL,
  `order_discount_total_money` decimal(10,2) DEFAULT NULL,
  `order_actual_pay_money` decimal(10,2) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '(终端机没有所属用户id)',
  `order_source` int(1) DEFAULT NULL,
  `order_consignee_address` varchar(255) DEFAULT NULL,
  `order_consignee_phone` char(11) DEFAULT NULL,
  `order_consignee_name` varchar(255) DEFAULT NULL,
  `order_store_type` int(1) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for period
-- ----------------------------
DROP TABLE IF EXISTS `period`;
CREATE TABLE `period` (
  `period_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_date` varchar(255) DEFAULT NULL COMMENT '（默认场次的日期为null）（新增场次就得设置日期）',
  `period_time` varchar(255) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `period_price` decimal(10,2) DEFAULT NULL,
  `period_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`period_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `period_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of period
-- ----------------------------

-- ----------------------------
-- Table structure for playday_record
-- ----------------------------
DROP TABLE IF EXISTS `playday_record`;
CREATE TABLE `playday_record` (
  `playday_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) DEFAULT NULL,
  `playday` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`playday_record_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `playday_record_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of playday_record
-- ----------------------------

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(255) DEFAULT NULL,
  `room_icon` varchar(255) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `room_play_date` varchar(255) DEFAULT NULL,
  `room_period` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `room_create_time` varchar(255) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  `room_current_number` int(11) DEFAULT NULL,
  `room_restrict _number` int(11) DEFAULT NULL,
  `room_discount` varchar(255) DEFAULT NULL,
  `room_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `club_id` (`club_id`),
  KEY `user_id` (`user_id`),
  KEY `commodity_id` (`commodity_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `room_ibfk_3` FOREIGN KEY (`commodity_id`) REFERENCES `commodity` (`commodity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of room
-- ----------------------------

-- ----------------------------
-- Table structure for room_discount
-- ----------------------------
DROP TABLE IF EXISTS `room_discount`;
CREATE TABLE `room_discount` (
  `room_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `people_number` int(11) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_discount_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `room_discount_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of room_discount
-- ----------------------------

-- ----------------------------
-- Table structure for terminal
-- ----------------------------
DROP TABLE IF EXISTS `terminal`;
CREATE TABLE `terminal` (
  `terminal_id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_name` varchar(255) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `terminal_remark` text,
  PRIMARY KEY (`terminal_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `terminal_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of terminal
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_create_time` varchar(255) DEFAULT NULL,
  `user_avator` varchar(255) DEFAULT NULL,
  `user_phone` char(11) DEFAULT NULL,
  `user_location` varchar(255) DEFAULT NULL,
  `user_integral` varchar(255) DEFAULT NULL,
  `user_vip_level` int(1) DEFAULT NULL,
  `vip_create_time` varchar(255) DEFAULT NULL,
  `vip_expire_time` varchar(255) DEFAULT NULL,
  `wx_openid` varchar(255) DEFAULT NULL,
  `user_balance` decimal(10,2) DEFAULT NULL,
  `user_charge` decimal(10,2) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_last_login_time` varchar(255) DEFAULT NULL,
  `user_status` int(1) DEFAULT NULL,
  `user_real_name_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_club
-- ----------------------------
DROP TABLE IF EXISTS `user_club`;
CREATE TABLE `user_club` (
  `user_club_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_club_id`),
  KEY `user_id` (`user_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `user_club_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_club_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_club
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` varchar(255) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_real_name` varchar(255) DEFAULT NULL,
  `user_identity_card` varchar(255) DEFAULT NULL,
  `identity_card _type` int(1) DEFAULT NULL,
  `user_gender` int(1) DEFAULT NULL,
  `user_real_photo` varchar(255) DEFAULT NULL,
  `user_birthday` varchar(255) DEFAULT NULL,
  `user_blood_type` int(1) DEFAULT NULL,
  `user_weight` varchar(255) DEFAULT NULL,
  `user_height` varchar(255) DEFAULT NULL,
  `user_illness_history` mediumtext,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` char(11) DEFAULT NULL,
  `contact_relationship` varchar(255) DEFAULT NULL,
  `consignee_name` varchar(255) DEFAULT NULL,
  `consignee_phone` char(11) DEFAULT NULL,
  `consignee_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_info
-- ----------------------------

-- ----------------------------
-- Table structure for user_room
-- ----------------------------
DROP TABLE IF EXISTS `user_room`;
CREATE TABLE `user_room` (
  `user_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_room_id`),
  KEY `room_id` (`room_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_room_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `user_room_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_room
-- ----------------------------

-- ----------------------------
-- Table structure for withdraw
-- ----------------------------
DROP TABLE IF EXISTS `withdraw`;
CREATE TABLE `withdraw` (
  `withdraw_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` varchar(255) DEFAULT NULL,
  `withdraw_cash` decimal(10,2) DEFAULT NULL,
  `service_charge` decimal(10,2) DEFAULT NULL,
  `withdraw_create_time` varchar(255) DEFAULT NULL,
  `withdraw_finish_time` varchar(255) DEFAULT NULL,
  `withdraw_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`withdraw_id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `withdraw_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of withdraw
-- ----------------------------
