/*
Navicat MySQL Data Transfer

Source Server         : AAAAA
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : wools

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-08-05 14:07:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for food_list
-- ----------------------------
DROP TABLE IF EXISTS `food_list`;
CREATE TABLE `food_list` (
  `food_id` int(11) NOT NULL,
  `hotel_id` int(255) NOT NULL,
  `food_name` varchar(255) NOT NULL,
  `food_price` decimal(10,2) NOT NULL,
  `food_details` varchar(255) DEFAULT NULL,
  `food_pic` varchar(255) NOT NULL,
  `foot_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `food_list_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_list
-- ----------------------------

-- ----------------------------
-- Table structure for food_order
-- ----------------------------
DROP TABLE IF EXISTS `food_order`;
CREATE TABLE `food_order` (
  `food_order_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `vip_id` varchar(255) NOT NULL,
  `food_id` int(11) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `order_time` datetime NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `hotel_room` int(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`food_order_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `food_id` (`food_id`),
  KEY `vip_id` (`vip_id`),
  CONSTRAINT `food_order_ibfk_3` FOREIGN KEY (`vip_id`) REFERENCES `vip_list` (`vip_id`),
  CONSTRAINT `food_order_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  CONSTRAINT `food_order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food_list` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_order
-- ----------------------------

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `hotel_area` varchar(255) NOT NULL,
  `hotel_details` varchar(255) NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1001', 'woolls', '湖南', '湖南最大');
INSERT INTO `hotel` VALUES ('1002', 'wols', '广东', '广东最大');

-- ----------------------------
-- Table structure for rc_case
-- ----------------------------
DROP TABLE IF EXISTS `rc_case`;
CREATE TABLE `rc_case` (
  `rc_caseid` int(11) NOT NULL,
  `rc_a` int(11) DEFAULT NULL,
  `rc_b` int(11) DEFAULT NULL,
  `rc_c` int(11) DEFAULT NULL,
  `rc_a_regiv` int(11) DEFAULT NULL,
  `rc_b_regiv` int(11) DEFAULT NULL,
  `rc_c_regiv` int(11) DEFAULT NULL,
  PRIMARY KEY (`rc_caseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rc_case
-- ----------------------------
INSERT INTO `rc_case` VALUES ('1', '100', '200', '300', '20', '45', '80');

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `rc_id` varchar(255) NOT NULL,
  `vip_id` varchar(255) NOT NULL,
  `vip_tel` varchar(255) DEFAULT NULL,
  `vip_name` varchar(255) DEFAULT NULL,
  `rc_cost` decimal(10,2) NOT NULL,
  `rc_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hotel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rc_id`),
  KEY `vip_id` (`vip_id`),
  CONSTRAINT `recharge_ibfk_1` FOREIGN KEY (`vip_id`) REFERENCES `vip_list` (`vip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recharge
-- ----------------------------
INSERT INTO `recharge` VALUES ('3e640189c6c84341a681ccd2dbf856d0', '22222222', '15856658998', '???', '245.00', '2019-08-05 13:37:11', '1002');
INSERT INTO `recharge` VALUES ('458a0a3ccc61415c9ca51c8af5bb04ea', '22222222', '15856658998', '???', '3800.00', '2019-08-05 13:37:13', '1002');
INSERT INTO `recharge` VALUES ('640b668b58b5410282ee170bedaf5868', '6b17e570ee124e9d8fb24afd8ab1446c', '13973723157', '13973723157', '245.00', '2019-08-05 13:37:19', '1001');
INSERT INTO `recharge` VALUES ('69ede5bb371c4cc497892c24dafcea1e', '22222222', '15856658998', '黄民豪', '580.00', '2019-08-05 13:38:04', '1002');
INSERT INTO `recharge` VALUES ('767464b87c4e4f45b01ff970d66b095c', '22222222', '15856658998', '???', '120.00', '2019-08-05 13:37:14', '1002');
INSERT INTO `recharge` VALUES ('9752e33a318f4f9e8a6439c49fec6315', '22222222', '15856658998', '???', '100.00', '2019-08-05 13:37:15', '1002');
INSERT INTO `recharge` VALUES ('aab5ec338a524fcebf090e61ac8816b4', '22222222', '15856658998', '???', '10.00', '2019-08-05 13:37:15', '1002');
INSERT INTO `recharge` VALUES ('bc59a4e209cd48e3962a6ad36968a5b5', '22222222', '15856658998', '???', '120.00', '2019-08-05 13:37:17', '1002');
INSERT INTO `recharge` VALUES ('d50695e63160455dac139e9eddbe4021', '6b17e570ee124e9d8fb24afd8ab1446c', '13973723157', '13973723157', '120.00', '2019-08-05 13:37:53', '1001');

-- ----------------------------
-- Table structure for vip_list
-- ----------------------------
DROP TABLE IF EXISTS `vip_list`;
CREATE TABLE `vip_list` (
  `vip_id` varchar(255) NOT NULL,
  `openid` int(11) DEFAULT NULL,
  `vip_tel` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `vip_name` varchar(30) DEFAULT NULL,
  `vip_IDcard` varchar(200) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL,
  `vip_money` decimal(10,2) DEFAULT NULL,
  `vip_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hotel_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vip_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `vip_list_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip_list
-- ----------------------------
INSERT INTO `vip_list` VALUES ('11111111', '123456789', '13355556666', '陈洋', '13150419990323621x', '1001', '20000.00', '2019-08-04 11:37:08', 'woolls');
INSERT INTO `vip_list` VALUES ('22222222', '987654321', '13973723157', '黄民豪', '165457199804301201', '1002', '14975.00', '2019-08-05 13:37:39', 'wols');
INSERT INTO `vip_list` VALUES ('33333333', '542165487', '13973723156', '方慕槐', '430981199901176311', '1001', '200000.00', '2019-08-04 11:37:22', 'woolls');
INSERT INTO `vip_list` VALUES ('444444444', null, '13456787978', '黄星华', '1213215464', '1001', '20000.00', '2019-08-04 11:40:09', 'woolls');
INSERT INTO `vip_list` VALUES ('555555555', null, '13458795455', '强哥', '2131235454', '1001', '20.00', '2019-08-04 11:40:32', 'woolls');
INSERT INTO `vip_list` VALUES ('6b17e570ee124e9d8fb24afd8ab1446c', null, '13973723157', '???', '430981', '1001', '365.10', '2019-08-04 11:37:18', 'woolls');
