/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : operate_platform

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-03-28 17:41:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for contact_detail
-- ----------------------------
DROP TABLE IF EXISTS `contact_detail`;
CREATE TABLE `contact_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，递增',
  `contact_mobile` varchar(20) DEFAULT NULL COMMENT '拨打的手机号',
  `contact_area` varchar(20) DEFAULT NULL COMMENT '省市',
  `call_count_6month` int(11) DEFAULT NULL COMMENT '6个月拨打的次数',
  `main_data_id` char(32) DEFAULT NULL COMMENT '主数据id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact_detail
-- ----------------------------
INSERT INTO `contact_detail` VALUES ('1', '12345678900', '省市1', '1', '94b135f3a593459a8f5a9fa69114c881');
INSERT INTO `contact_detail` VALUES ('2', '12345678901', '省市2', '2', '94b135f3a593459a8f5a9fa69114c881');

-- ----------------------------
-- Table structure for main_data
-- ----------------------------
DROP TABLE IF EXISTS `main_data`;
CREATE TABLE `main_data` (
  `sensor_data_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据主键id',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `zhima_score` int(11) DEFAULT NULL COMMENT '芝麻分',
  `source_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sensor_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of main_data
-- ----------------------------
INSERT INTO `main_data` VALUES ('94b135f3a593459a8f5a9fa69114c881', 'qxl', '18767116386', '330501199110208656', '750', '1', '26', '2018-03-28 16:03:19');

-- ----------------------------
-- Table structure for operate_auth
-- ----------------------------
DROP TABLE IF EXISTS `operate_auth`;
CREATE TABLE `operate_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `id_card` varchar(20) DEFAULT NULL COMMENT '身份证',
  `provider` varchar(30) DEFAULT NULL COMMENT '运营商',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `open_time` varchar(20) DEFAULT NULL COMMENT '入网时间',
  `level` varchar(20) DEFAULT NULL COMMENT '星级',
  `package_name` varchar(50) DEFAULT NULL COMMENT '套餐名称',
  `balance` double DEFAULT NULL COMMENT '余额',
  `main_data_id` char(32) DEFAULT NULL COMMENT '主数据id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operate_auth
-- ----------------------------
INSERT INTO `operate_auth` VALUES ('1', '实名姓名', '手机号', '实名身份证号', '运营商', '省份', '城市', '入网时间(格式 1984-01-02)', '星级', '套餐名称', '55', null);

-- ----------------------------
-- Table structure for phone_book
-- ----------------------------
DROP TABLE IF EXISTS `phone_book`;
CREATE TABLE `phone_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '联系人昵称',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系人手机号',
  `main_data_id` char(32) DEFAULT NULL COMMENT '主数据id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phone_book
-- ----------------------------
INSERT INTO `phone_book` VALUES ('1', '姓名1', '12345678900', '94b135f3a593459a8f5a9fa69114c881');
INSERT INTO `phone_book` VALUES ('2', '姓名2', '12345678901', '94b135f3a593459a8f5a9fa69114c881');

-- ----------------------------
-- Table structure for source
-- ----------------------------
DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `real_source_name` varchar(30) DEFAULT NULL COMMENT '渠道真实名称',
  `nick_source_name` varchar(30) DEFAULT NULL COMMENT '渠道昵称（如，渠道1）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of source
-- ----------------------------
INSERT INTO `source` VALUES ('1', 'qxl渠道', '渠道1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号，用作登录名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '邱小良', '123456', '1', '18767116386');
