/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : gateway_db

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-12-09 18:45:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gateway_app_info
-- ----------------------------
DROP TABLE IF EXISTS `gateway_app_info`;
CREATE TABLE `gateway_app_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_name` varchar(50) NOT NULL DEFAULT '',
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  `token` char(64) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接入应用配置表';

-- ----------------------------
-- Table structure for gateway_re_app_route
-- ----------------------------
DROP TABLE IF EXISTS `gateway_re_app_route`;
CREATE TABLE `gateway_re_app_route` (
  `app_id` int(11) NOT NULL DEFAULT '-1',
  `route_id` int(11) NOT NULL DEFAULT '-1',
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`app_id`,`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用网关路由映射表';

-- ----------------------------
-- Table structure for gateway_route_info
-- ----------------------------
DROP TABLE IF EXISTS `gateway_route_info`;
CREATE TABLE `gateway_route_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `service_id` int(11) NOT NULL DEFAULT '-1',
  `predicates` varchar(300) NOT NULL DEFAULT '',
  `protocol` varchar(10) NOT NULL DEFAULT '',
  `retry` bit(1) NOT NULL DEFAULT b'0',
  `timeout` int(11) NOT NULL DEFAULT '1000',
  `enabled` bit(1) NOT NULL DEFAULT b'0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务创建时间',
  `description` varchar(255) DEFAULT NULL COMMENT '接口描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='路由信息表';

-- ----------------------------
-- Table structure for gateway_service_info
-- ----------------------------
DROP TABLE IF EXISTS `gateway_service_info`;
CREATE TABLE `gateway_service_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(20) NOT NULL DEFAULT '',
  `service_type` varchar(10) NOT NULL DEFAULT '',
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  `host` varchar(50) DEFAULT '',
  `port` int(11) DEFAULT '0',
  `description` varchar(200) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_service_name` (`service_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='网关服务信息表';

-- ----------------------------
-- Table structure for gateway_version_info
-- ----------------------------
DROP TABLE IF EXISTS `gateway_version_info`;
CREATE TABLE `gateway_version_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `version` int(11) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网关信息版本表';
