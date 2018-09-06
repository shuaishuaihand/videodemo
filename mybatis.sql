/*
Navicat MySQL Data Transfer

Source Server         : nishuai
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : mybatis

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-09-06 08:49:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  `empStatus` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38252 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('38222', '张三', '2714763867@qq.com', '男', null, null);
INSERT INTO `employee` VALUES ('38223', '李四', '213414', '男', null, null);
INSERT INTO `employee` VALUES ('38224', '丽丽', '213541345', '女', null, null);
INSERT INTO `employee` VALUES ('38225', 'jim', '21341234', '男', null, null);
INSERT INTO `employee` VALUES ('38226', 'Tom', '32441345', '男', null, null);
INSERT INTO `employee` VALUES ('38227', 'jack', '52462476567', 'man', null, null);
INSERT INTO `employee` VALUES ('38228', 'rose', '345315415', 'woman', null, null);
INSERT INTO `employee` VALUES ('38229', '杨明', '24·234', '男', null, null);
INSERT INTO `employee` VALUES ('38230', '张丽', '233434', '女', null, null);
INSERT INTO `employee` VALUES ('38231', '503cd', 'b', '1', null, null);
INSERT INTO `employee` VALUES ('38232', '张三', '2714763867@qq.com', '男', null, null);
INSERT INTO `employee` VALUES ('38233', '李四', '213414', '男', null, null);
INSERT INTO `employee` VALUES ('38234', '丽丽', '213541345', '女', null, null);
INSERT INTO `employee` VALUES ('38235', 'jim', '21341234', '男', null, null);
INSERT INTO `employee` VALUES ('38236', 'Tom', '32441345', '男', null, null);
INSERT INTO `employee` VALUES ('38237', 'jack', '52462476567', 'man', null, null);
INSERT INTO `employee` VALUES ('38238', 'rose', '345315415', 'woman', null, null);
INSERT INTO `employee` VALUES ('38239', '杨明', '24·234', '男', null, null);
INSERT INTO `employee` VALUES ('38240', '张丽', '233434', '女', null, null);
INSERT INTO `employee` VALUES ('38241', '503cd', 'b', '1', null, null);
INSERT INTO `employee` VALUES ('38242', '张三', '2714763867@qq.com', '男', null, null);
INSERT INTO `employee` VALUES ('38243', '李四', '213414', '男', null, null);
INSERT INTO `employee` VALUES ('38244', '丽丽', '213541345', '女', null, null);
INSERT INTO `employee` VALUES ('38245', 'jim', '21341234', '男', null, null);
INSERT INTO `employee` VALUES ('38246', 'Tom', '32441345', '男', null, null);
INSERT INTO `employee` VALUES ('38247', 'jack', '52462476567', 'man', null, null);
INSERT INTO `employee` VALUES ('38248', 'rose', '345315415', 'woman', null, null);
INSERT INTO `employee` VALUES ('38249', '杨明', '24·234', '男', null, null);
INSERT INTO `employee` VALUES ('38250', '张丽', '233434', '女', null, null);
INSERT INTO `employee` VALUES ('38251', '503cd', 'b', '1', null, null);

-- ----------------------------
-- Table structure for f_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `f_advertisement`;
CREATE TABLE `f_advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_type` int(11) DEFAULT NULL COMMENT '广告类型：0视频，1图片',
  `adv_size` varchar(255) DEFAULT NULL COMMENT '广告占用空间',
  `adv_time` int(11) DEFAULT '0' COMMENT '广告时长—视频（s）',
  `create_time` datetime DEFAULT NULL COMMENT '上传日期',
  `adv_resolving_power` varchar(255) DEFAULT NULL COMMENT '广告分辨率（备用）(kb/s)',
  `adv_url` varchar(255) DEFAULT NULL COMMENT '广告地址(视频帧地址，图片地址)',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件格式',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件地址（视频地址）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1408 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of f_advertisement
-- ----------------------------
INSERT INTO `f_advertisement` VALUES ('1391', '0', '31.17MB', '410', '2018-08-31 16:40:39', '1280x800', '/screenvideo/videoimage/f5721799bfef4966857fae5555d5d263.png', '04-springé¡¹ç® - å¯æ¬ - å¯æ¬', '.flv', '/videofile/f5721799bfef4966857fae5555d5d263.flv');
INSERT INTO `f_advertisement` VALUES ('1392', '0', '31.17MB', '410', '2018-08-31 17:19:10', '1280x800', '/screenvideo/videoimage/248ac192f052428c9efd252570be629d.png', '04-springé¡¹ç® - å¯æ¬ (2)', '.flv', '/videofile/248ac192f052428c9efd252570be629d.flv');
INSERT INTO `f_advertisement` VALUES ('1393', '0', '31.17MB', '410', '2018-08-31 17:19:10', '1280x800', '/screenvideo/videoimage/197b18e00ece4fb7960c23d18ed72ed7.png', '04-springé¡¹ç®', '.flv', '/videofile/197b18e00ece4fb7960c23d18ed72ed7.flv');
INSERT INTO `f_advertisement` VALUES ('1394', '0', '31.17MB', '410', '2018-08-31 17:19:11', '1280x800', '/screenvideo/videoimage/6db4edc8ae56445ea2a8b560034e4db5.png', '04-springé¡¹ç® - å¯æ¬', '.flv', '/videofile/6db4edc8ae56445ea2a8b560034e4db5.flv');
INSERT INTO `f_advertisement` VALUES ('1395', '0', '31.17MB', '410', '2018-09-02 10:49:48', '1280x800', '/screenvideo/videoimage/0483c3f68c2f49159ee7c9228bf268d5.png', '04-springé¡¹ç® - å¯æ¬ - å¯æ¬(1)', '.flv', '/videofile/0483c3f68c2f49159ee7c9228bf268d5.flv');
INSERT INTO `f_advertisement` VALUES ('1396', '0', '20.28MB', '280', '2018-09-02 10:49:48', '1280x800', '/screenvideo/videoimage/cd0638030bf049bd983a2e4f4792a196.png', '03ä¸1', '.flv', '/videofile/cd0638030bf049bd983a2e4f4792a196.flv');
INSERT INTO `f_advertisement` VALUES ('1397', '0', '28.01MB', '561', '2018-09-03 11:02:01', '1280x800', '/screenvideo/videoimage/5cbe57d1682a4f9490accd4197afd8d4.png', '05-springé¡¹ç® - å¯æ¬ - å¯æ¬', '.flv', '/videofile/5cbe57d1682a4f9490accd4197afd8d4.flv');
INSERT INTO `f_advertisement` VALUES ('1398', '0', '27.20MB', '358', '2018-09-03 11:02:01', '1280x800', '/screenvideo/videoimage/0546eb32e7214ec1942086b001929b67.png', '10-springéç½®è¯¦è§£-åå§å', '.flv', '/videofile/0546eb32e7214ec1942086b001929b67.flv');
INSERT INTO `f_advertisement` VALUES ('1399', '0', '31.17MB', '410', '2018-09-03 11:02:01', '1280x800', '/screenvideo/videoimage/193bff6aaef745108a741404cb6a8d79.png', '04-springé¡¹ç® - å¯æ¬(1)', '.flv', '/videofile/193bff6aaef745108a741404cb6a8d79.flv');
INSERT INTO `f_advertisement` VALUES ('1400', '0', '28.01MB', '561', '2018-09-03 11:02:10', '1280x800', '/screenvideo/videoimage/6323e8a19dc643a8be7ddf9a3179f895.png', '05-springé¡¹ç® - å¯æ¬', '.flv', '/videofile/6323e8a19dc643a8be7ddf9a3179f895.flv');
INSERT INTO `f_advertisement` VALUES ('1401', '0', '28.01MB', '561', '2018-09-03 11:02:10', '1280x800', '/screenvideo/videoimage/61cd34c5cc084ddcb94113fb1b6a89b3.png', '05-springé¡¹ç®', '.flv', '/videofile/61cd34c5cc084ddcb94113fb1b6a89b3.flv');
INSERT INTO `f_advertisement` VALUES ('1402', '0', '39.19MB', '667', '2018-09-03 11:02:10', '1280x800', '/screenvideo/videoimage/2278c335d3f24de1bccce6a497ad269f.png', '06-springé¡¹ç®æ¦å¿µ - å¯æ¬', '.flv', '/videofile/2278c335d3f24de1bccce6a497ad269f.flv');
INSERT INTO `f_advertisement` VALUES ('1403', '0', '29.93MB', '369', '2018-09-03 11:02:12', '1280x800', '/screenvideo/videoimage/769fed24f1d1450c99efddc18876aab6.png', '07-springéç½®è¯¦è§£-Beanåç´ _', '.flv', '/videofile/769fed24f1d1450c99efddc18876aab6.flv');
INSERT INTO `f_advertisement` VALUES ('1404', '0', '39.19MB', '667', '2018-09-03 11:02:12', '1280x800', '/screenvideo/videoimage/3e5ab6e961d742dc8bbcb39cad7627d9.png', '06-springé¡¹ç®æ¦å¿µ', '.flv', '/videofile/3e5ab6e961d742dc8bbcb39cad7627d9.flv');
INSERT INTO `f_advertisement` VALUES ('1405', '0', '27.20MB', '358', '2018-09-03 11:02:15', '1280x800', '/screenvideo/videoimage/30ac267cf7e14d55b78b91cbd1beefa7.png', '10-springéç½®è¯¦è§£-åå§å - å¯æ¬', '.flv', '/videofile/30ac267cf7e14d55b78b91cbd1beefa7.flv');
INSERT INTO `f_advertisement` VALUES ('1406', '0', '35.66MB', '547', '2018-09-03 11:02:16', '1280x800', '/screenvideo/videoimage/e33114fa92d546b5a4cd6735d103b002.png', '09-springéç½®è¯¦è§£-scopeå±æ§_', '.flv', '/videofile/e33114fa92d546b5a4cd6735d103b002.flv');
INSERT INTO `f_advertisement` VALUES ('1407', '0', '64.60MB', '761', '2018-09-03 11:02:16', '1280x800', '/screenvideo/videoimage/110ff7f506054ce98d82a7a024c60930.png', '08-springéç½®è¯¦è§£', '.flv', '/videofile/110ff7f506054ce98d82a7a024c60930.flv');

-- ----------------------------
-- Table structure for f_adv_plan
-- ----------------------------
DROP TABLE IF EXISTS `f_adv_plan`;
CREATE TABLE `f_adv_plan` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_id` int(11) DEFAULT NULL COMMENT '广告ID',
  `plan_id` int(11) DEFAULT NULL COMMENT '发布计划',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发布计划与广告关联表';

-- ----------------------------
-- Records of f_adv_plan
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `111` varchar(255) DEFAULT NULL,
  `22` varchar(255) DEFAULT NULL,
  `333` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '111', '22', '333');
INSERT INTO `test` VALUES ('2', '222', '22', '333');
INSERT INTO `test` VALUES ('3', '111', '22', '333');
INSERT INTO `test` VALUES ('4', '222', '22', '333');
