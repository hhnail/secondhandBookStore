/*
Navicat MySQL Data Transfer

Source Server         : eb1828
Source Server Version : 50723
Source Host           : 172.24.192.18:3306
Source Database       : db1828

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2021-01-15 19:05:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for booklist
-- ----------------------------
DROP TABLE IF EXISTS `booklist`;
CREATE TABLE `booklist` (
  `ISBN` varchar(255) NOT NULL,
  `b_name` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `b_date` date DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booklist
-- ----------------------------
INSERT INTO `booklist` VALUES ('1234', 'test', 'test', '11', '2020-01-19', null);
INSERT INTO `booklist` VALUES ('2-1-1', '月亮与六便士', 'ee', 'ee', '2020-11-11', 'static/img/55.jpg');
INSERT INTO `booklist` VALUES ('2-2', '2', '2', '2', '2021-02-02', 'static/img/default.jpg');
INSERT INTO `booklist` VALUES ('2-2-2', 'php', 'cy', 'cy', '2020-12-19', 'static/img/O1CN01PEP1Io1TZry61whsM_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `booklist` VALUES ('978-1-1', '忽然七日', '劳伦·奥利弗', '湖南文艺出版社', '2011-01-01', 'static/img/d53f8794a4c27d1ecc18ba011bd5ad6eddc4383c.jpg');
INSERT INTO `booklist` VALUES ('978-1-10', '写给儿童的中国历史', '陈卫平', '新世界出版社', '2014-04-17', 'static/img/QQ_20210114151326.png');
INSERT INTO `booklist` VALUES ('978-1-11', '祈念守护人', '东野圭吾', '南海出版公司', '2020-06-27', 'static/img/QQ_20210114151638.png');
INSERT INTO `booklist` VALUES ('978-1-12', '恶意', '东野圭吾', '南海出版公司', '2016-11-06', 'static/img/QQ_20210114151917.png');
INSERT INTO `booklist` VALUES ('978-1-13', '悲剧人偶', '东野圭吾', '北京十月文艺出版社', '2018-08-18', 'static/img/QQ_20210114152153.png');
INSERT INTO `booklist` VALUES ('978-1-14', '白夜行', '东野圭吾', '北京十月文艺出版社', '2018-08-23', 'static/img/QQ_20210114152401.png');
INSERT INTO `booklist` VALUES ('978-1-15', '禁断的魔术', '东野圭吾', '南海出版公司', '2018-12-05', 'static/img/QQ_20210114152858.png');
INSERT INTO `booklist` VALUES ('978-1-16', '从你的全世界路过', '张嘉佳', '湖南文艺出版社', '2013-11-25', 'static/img/QQ_20210114153109.png');
INSERT INTO `booklist` VALUES ('978-1-17', '岛上书店', '(美)加·泽文', '江苏文艺出版社', '2015-05-12', 'static/img/QQ_20210114153309.png');
INSERT INTO `booklist` VALUES ('978-1-18', '繁星春水', '冰心', '北京师范大学出版社', '2014-09-25', 'static/img/QQ_20210114153543.png');
INSERT INTO `booklist` VALUES ('978-1-19', '哈佛家训', '苏豫', '南京出版社', '2018-06-12', 'static/img/QQ_20210114153756.png');
INSERT INTO `booklist` VALUES ('978-1-2', '为奴十二年', '所罗门·诺瑟普', '新星出版社', '2014-09-15', 'static/img/为奴.jpg');
INSERT INTO `booklist` VALUES ('978-1-20', '走遍中国', '霍晨昕', '四川人民出版社', '2019-02-03', 'static/img/QQ_20210114154042.png');
INSERT INTO `booklist` VALUES ('978-1-21', ' 三体：全三册', '刘慈欣', '重庆出版社', '2010-11-17', 'static/img/QQ_20210114154322.png');
INSERT INTO `booklist` VALUES ('978-1-22', '杀死一只知更鸟', '哈珀·李', '译林出版社', '2017-02-01', 'static/img/QQ_20210114154522.png');
INSERT INTO `booklist` VALUES ('978-1-23', '流金岁月（精装版）', '亦舒 ', '湖南文艺出版社', '2018-04-19', 'static/img/QQ_20210114154749.png');
INSERT INTO `booklist` VALUES ('978-1-24', '小王子', '（法）安托万·德·圣埃克苏佩里', '天津人民出版社', '2018-06-23', 'static/img/QQ_20210114155152.png');
INSERT INTO `booklist` VALUES ('978-1-25', '边城', '沈从文', '江苏人民出版社', '2014-01-06', 'static/img/QQ_20210114155405.png');
INSERT INTO `booklist` VALUES ('978-1-26', '围城', '钱钟书', '人民文学出版社', '1991-02-28', 'static/img/QQ_20210114155600.png');
INSERT INTO `booklist` VALUES ('978-1-27', ' 双城记', '（英）查尔斯·狄更斯', '台海出版社', '2020-07-22', 'static/img/QQ_20210114155833.png');
INSERT INTO `booklist` VALUES ('978-1-28', '月亮与六便士', '（英）毛姆', '时代文艺出版社', '2019-06-15', 'static/img/QQ_20210114160040.png');
INSERT INTO `booklist` VALUES ('978-1-29', '放学后', '东野圭吾', '南海出版公司', '2017-09-14', 'static/img/QQ_20210114160212.png');
INSERT INTO `booklist` VALUES ('978-1-3', '给孩子的诗', '北岛', '中信出版社', '2014-07-01', 'static/img/9e3df8dcd100baa11daf807c4510b912c9fc2e72.jpg');
INSERT INTO `booklist` VALUES ('978-1-30', '红楼梦原著版（上、下册）', '曹雪芹', '人民文学出版社', '2013-01-05', 'static/img/QQ_20210114160400.png');
INSERT INTO `booklist` VALUES ('978-1-31', '儒林外史', '吴敬梓', '花山文艺出版社', '2015-07-22', 'static/img/QQ_20210114160604.png');
INSERT INTO `booklist` VALUES ('978-1-32', '富爸爸穷爸爸', '（美）罗伯特·清崎', '四川人民出版社', '2019-08-14', 'static/img/QQ_20210114161206.png');
INSERT INTO `booklist` VALUES ('978-1-33', '指数基金投资指南', '银行螺丝钉', '中信出版社', '2017-11-22', 'static/img/QQ_20210114161436.png');
INSERT INTO `booklist` VALUES ('978-1-34', ' 聪明的投资者', '（美）本杰明·格雷厄姆', '人民邮电出版社', '2016-03-02', 'static/img/QQ_20210114161648.png');
INSERT INTO `booklist` VALUES ('978-1-35', '定投十年财务自由：钉大新作', '银行螺丝钉', '中信出版社', '2019-10-10', 'static/img/QQ_20210114161901.png');
INSERT INTO `booklist` VALUES ('978-1-36', '股票大作手回忆录', '（美）埃德温·勒菲弗', '中华工商联合出版社', '2017-11-17', 'static/img/QQ_20210114162102.png');
INSERT INTO `booklist` VALUES ('978-1-37', '文明、现代化、价值投资与中国', '李录', '中信出版社', '2020-04-21', 'static/img/QQ_20210114162243.png');
INSERT INTO `booklist` VALUES ('978-1-38', '我把活着欢喜过了', '梁实秋', '江苏凤凰文艺出版社', '2017-11-02', 'static/img/QQ_20210114162555.png');
INSERT INTO `booklist` VALUES ('978-1-39', '心安即是归处', '季羡林', '古吴轩出版社', '2020-08-12', 'static/img/QQ_20210114162740.png');
INSERT INTO `booklist` VALUES ('978-1-4', '你当像鸟飞往你的山', '塔拉 · 韦斯特弗', '南海出版公司', '2019-11-17', 'static/img/QQ_20210114114844.png');
INSERT INTO `booklist` VALUES ('978-1-40', '龙猫的家', '（日）宫崎骏 ', '南海出版公司', '2021-01-02', 'static/img/QQ_20210114162938.png');
INSERT INTO `booklist` VALUES ('978-1-5', '百年孤独（50周年纪念版）', '马尔克斯', '南海出版公司', '2017-08-23', 'static/img/QQ_20210114115143.png');
INSERT INTO `booklist` VALUES ('978-1-6', '一个人就一个人', '刘同', '北京联合出版有限公司', '2020-07-18', 'static/img/QQ_20210114115351.png');
INSERT INTO `booklist` VALUES ('978-1-7', '中华人民共和国民法典（实用版）', '中国法制出版社', '中国法制出版社', '2020-06-23', 'static/img/QQ_20210114115538.png');
INSERT INTO `booklist` VALUES ('978-1-8', '蛤蟆先生去看心理医生', '罗伯特·戴博德', '天津人民出版社', '2020-07-09', 'static/img/QQ_20210114150508.png');
INSERT INTO `booklist` VALUES ('978-1-9', '神奇校车·图画书版', '（美）乔安娜柯尔', '贵州人民出版社', '2018-05-24', 'static/img/QQ_20210114151030.png');
INSERT INTO `booklist` VALUES ('999-999-999', '社会学', '人', '额', '2020-01-19', 'static/img/demo.jpg');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `c_id` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `c_name` varchar(30) DEFAULT NULL,
  `gender` enum('Male','Female','Unknown') DEFAULT 'Unknown',
  `address` varchar(100) DEFAULT NULL,
  `credit` double DEFAULT '6',
  KEY `c_id` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('001', '123456', '张三', 'Male', '集美大学ee', '5');
INSERT INTO `client` VALUES ('002', '123456', 'ld', 'Female', '集美大学', '7');
INSERT INTO `client` VALUES ('003', '123456', 'phw', 'Male', '集美大学', '8');
INSERT INTO `client` VALUES ('004', '123456', 'cjx', 'Female', '集美大学', '4');
INSERT INTO `client` VALUES ('005', '123456', 'hgl', 'Female', '集美大学', '3');
INSERT INTO `client` VALUES ('009', '123456', '789', 'Male', '111', '10');
INSERT INTO `client` VALUES ('test', 'test', '哈哈哈', 'Unknown', 'testAddress', '5');
INSERT INTO `client` VALUES ('13', '123456', '?', 'Male', '小高', '10');
INSERT INTO `client` VALUES ('1', '1', '1', 'Male', '1', '6');
INSERT INTO `client` VALUES ('admin', 'admin', '管理员', 'Unknown', null, '10');
INSERT INTO `client` VALUES ('13003995671', '123456', 'cy', 'Male', '小高', '10');
INSERT INTO `client` VALUES ('13003995677', '123456', 'cy', 'Male', '小高', '10');
INSERT INTO `client` VALUES ('13003995678', '123456', 'cy', 'Male', '小高', '10');
INSERT INTO `client` VALUES ('13003995679', '123456', 'cy', 'Male', '小高', '10');

-- ----------------------------
-- Table structure for need
-- ----------------------------
DROP TABLE IF EXISTS `need`;
CREATE TABLE `need` (
  `n_id` varchar(255) CHARACTER SET gbk NOT NULL,
  `max_price` double(10,2) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `min_credit` double(10,2) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET gbk DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `state` enum('待审核','审核通过','审核未通过') DEFAULT '待审核',
  `ISBN` varchar(255) NOT NULL,
  `c_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of need
-- ----------------------------
INSERT INTO `need` VALUES ('001', '50.20', '2020-12-16', '5.00', '急求！啊圣诞节卡省的喀什的夸奖哈数据库的哈桑啊九十年代就卡死的', '5', '待审核', '978-1-10', '001');
INSERT INTO `need` VALUES ('002', '32.80', '2020-12-15', '5.00', '急求！', '1', '待审核', '978-1-12', '001');
INSERT INTO `need` VALUES ('003', '74.00', '2020-12-16', '5.00', '急求！', '1', '审核通过', '978-1-12', '002');
INSERT INTO `need` VALUES ('004', '20.00', '2021-01-16', '5.00', '急求！', '1', '待审核', '978-1-12', '003');
INSERT INTO `need` VALUES ('005', '50.00', '2021-01-14', '4.00', '急求！', '2', '审核未通过', '978-1-11', '003');
INSERT INTO `need` VALUES ('006', '1000.00', '2021-01-14', '1.00', null, '100', '待审核', '978-1-15', '003');
INSERT INTO `need` VALUES ('1610632779186', '9.90', '2021-02-01', '5.00', '急需！', '2', null, '1-1-1', 'test');
INSERT INTO `need` VALUES ('1610632823883', '19.90', '2021-02-01', '5.00', '急需！', '2', '待审核', '1-1-1', 'test');
INSERT INTO `need` VALUES ('1610633110477', '19.90', '2021-02-01', '5.00', '急需！', '2', '待审核', '1-1-9', 'test');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `o_id` varchar(30) NOT NULL,
  `o_time` datetime DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price_total` double(10,2) DEFAULT NULL,
  `o_state` enum('交易完成','交易中') DEFAULT '交易中',
  `c_id` varchar(30) NOT NULL,
  `post_address` varchar(255) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1610326118197test', '2021-01-11 08:48:38', '1', '5.00', '交易中', '001', null, null, null);
INSERT INTO `order` VALUES ('1610326139125test', '2021-01-11 08:48:59', '4', '70.00', '交易中', '001', null, null, null);
INSERT INTO `order` VALUES ('1610347479901test', '2021-01-11 14:44:39', '4', '160.50', '交易中', '001', null, null, null);
INSERT INTO `order` VALUES ('1610593970989test', '2021-01-14 11:12:50', '6', '360.00', '交易中', '001', null, null, null);
INSERT INTO `order` VALUES ('1610594414477test', '2021-01-14 11:20:14', '3', '65.00', '交易中', '001', null, null, null);
INSERT INTO `order` VALUES ('1610594586778test', '2021-01-14 11:23:06', '1', '100.00', '交易中', 'test', null, null, null);
INSERT INTO `order` VALUES ('1610596438982001', '2021-01-14 11:53:58', '1', '20.00', '交易中', 'test', null, null, null);
INSERT INTO `order` VALUES ('1610610517598001', '2021-01-14 15:48:37', '4', '215.00', '交易中', '001', null, null, null);
INSERT INTO `order` VALUES ('1610680119741001', '2021-01-15 11:08:39', '1', '55.00', '交易中', '001', '集美大学endtest', '张三', '001');
INSERT INTO `order` VALUES ('1610680224170001', '2021-01-15 11:10:24', '3', '165.00', '交易中', '001', '集美大学end2', '张三', '001');
INSERT INTO `order` VALUES ('1610683958784001', '2021-01-15 12:12:38', '4', '220.00', '交易中', '001', '集美大学ee', '张三', '001');
INSERT INTO `order` VALUES ('1610684861698001', '2021-01-15 12:27:41', '5', '275.00', '交易中', '001', '集美大学ee', '张三', '001');
INSERT INTO `order` VALUES ('1610685346007001', '2021-01-15 12:35:46', '5', '275.00', '交易中', '001', '集美大学ee', '张三', '001');
INSERT INTO `order` VALUES ('1610685514912001', '2021-01-15 12:38:34', '5', '275.00', '交易中', '001', '集美大学ed3', '张三', '001');
INSERT INTO `order` VALUES ('1610686071618001', '2021-01-15 12:47:51', '1', '55.00', '交易中', '001', '集美大学test22', '张三', '001');
INSERT INTO `order` VALUES ('161070575848413003995671', '2021-01-15 18:15:58', '6', '281.00', '交易中', '13003995671', '小高', 'cy', '13003995671');
INSERT INTO `order` VALUES ('161070774861213003995679', '2021-01-15 18:49:08', '6', '231.00', '交易中', '13003995679', '小高', 'cy', '13003995679');

-- ----------------------------
-- Table structure for orderline
-- ----------------------------
DROP TABLE IF EXISTS `orderline`;
CREATE TABLE `orderline` (
  `ol_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double(10,2) DEFAULT NULL,
  `state` enum('交易完成','交易中') DEFAULT '交易中',
  `o_id` varchar(50) NOT NULL,
  `p_id` varchar(50) NOT NULL,
  PRIMARY KEY (`ol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderline
-- ----------------------------
INSERT INTO `orderline` VALUES ('7', '10.00', '交易中', 'change', '978-1-1');
INSERT INTO `orderline` VALUES ('8', '10.00', '交易中', 'change', '978-1-1');
INSERT INTO `orderline` VALUES ('9', '10.00', '交易中', 'change', '978-1-1');
INSERT INTO `orderline` VALUES ('10', '5.00', null, '1610284790486test', '3');
INSERT INTO `orderline` VALUES ('11', '5.00', null, '1610290666806test', '3');
INSERT INTO `orderline` VALUES ('12', '45.50', null, '1610323127208test', '2');
INSERT INTO `orderline` VALUES ('13', '5.00', '交易中', '1610326118197test', '3');
INSERT INTO `orderline` VALUES ('14', '5.00', '交易中', '1610326139125test', '1');
INSERT INTO `orderline` VALUES ('15', '5.00', '交易中', '1610326139125test', '3');
INSERT INTO `orderline` VALUES ('16', '55.00', '交易中', '1610326139125test', '4');
INSERT INTO `orderline` VALUES ('17', '45.50', '交易中', '1610347479901test', '2');
INSERT INTO `orderline` VALUES ('18', '5.00', '交易中', '1610347479901test', '3');
INSERT INTO `orderline` VALUES ('19', '55.00', '交易中', '1610347479901test', '4');
INSERT INTO `orderline` VALUES ('20', '55.00', '交易中', '1610347479901test', '6');
INSERT INTO `orderline` VALUES ('21', '10.00', '交易中', 'change', '978-1-1');
INSERT INTO `orderline` VALUES ('22', '360.00', '交易中', '1610593970989test', '47');
INSERT INTO `orderline` VALUES ('23', '360.00', '交易中', '1610593970989test', '49');
INSERT INTO `orderline` VALUES ('24', '360.00', '交易中', '1610593970989test', '47');
INSERT INTO `orderline` VALUES ('25', '360.00', '交易中', '1610593970989test', '49');
INSERT INTO `orderline` VALUES ('26', '360.00', '交易中', '1610593970989test', '68');
INSERT INTO `orderline` VALUES ('27', '360.00', '交易中', '1610593970989test', '70');
INSERT INTO `orderline` VALUES ('28', '10.00', '交易中', '1610594414477test', '35');
INSERT INTO `orderline` VALUES ('29', '10.00', '交易中', '1610594414477test', '35');
INSERT INTO `orderline` VALUES ('30', '55.00', '交易中', '1610594414477test', '36');
INSERT INTO `orderline` VALUES ('31', '100.00', '交易中', '1610594586778test', '47');
INSERT INTO `orderline` VALUES ('32', '20.00', '交易中', '1610596438982001', '118');
INSERT INTO `orderline` VALUES ('33', '5.00', '交易中', '1610610517598001', '33');
INSERT INTO `orderline` VALUES ('34', '55.00', '交易中', '1610610517598001', '34');
INSERT INTO `orderline` VALUES ('35', '55.00', '交易中', '1610610517598001', '44');
INSERT INTO `orderline` VALUES ('36', '100.00', '交易中', '1610610517598001', '47');
INSERT INTO `orderline` VALUES ('37', '5.00', '交易中', '1610671550201001', '33');
INSERT INTO `orderline` VALUES ('38', '55.00', '交易中', '1610671550201001', '34');
INSERT INTO `orderline` VALUES ('39', '20.00', '交易中', '1610671550201001', '49');
INSERT INTO `orderline` VALUES ('40', '40.00', '交易中', '1610671550201001', '50');
INSERT INTO `orderline` VALUES ('41', '40.00', '交易中', '1610671550201001', '51');
INSERT INTO `orderline` VALUES ('42', '300.00', '交易中', '1610671550201001', '48');
INSERT INTO `orderline` VALUES ('43', '300.00', '交易中', '1610671550201001', '48');
INSERT INTO `orderline` VALUES ('44', '300.00', '交易中', '1610671550201001', '48');
INSERT INTO `orderline` VALUES ('45', '55.00', '交易中', '1610680015792001', '38');
INSERT INTO `orderline` VALUES ('46', '55.00', '交易中', '1610680119741001', '38');
INSERT INTO `orderline` VALUES ('47', '165.00', '交易中', '1610680224170001', '40');
INSERT INTO `orderline` VALUES ('48', '165.00', '交易中', '1610680224170001', '61');
INSERT INTO `orderline` VALUES ('49', '165.00', '交易中', '1610680224170001', '83');
INSERT INTO `orderline` VALUES ('50', '220.00', '交易中', '1610683958784001', '42');
INSERT INTO `orderline` VALUES ('51', '220.00', '交易中', '1610683958784001', '63');
INSERT INTO `orderline` VALUES ('52', '220.00', '交易中', '1610683958784001', '85');
INSERT INTO `orderline` VALUES ('53', '220.00', '交易中', '1610683958784001', '106');
INSERT INTO `orderline` VALUES ('54', '275.00', '交易中', '1610684861698001', '42');
INSERT INTO `orderline` VALUES ('55', '275.00', '交易中', '1610684861698001', '63');
INSERT INTO `orderline` VALUES ('56', '275.00', '交易中', '1610684861698001', '85');
INSERT INTO `orderline` VALUES ('57', '275.00', '交易中', '1610684861698001', '106');
INSERT INTO `orderline` VALUES ('58', '275.00', '交易中', '1610684861698001', '12');
INSERT INTO `orderline` VALUES ('59', '275.00', '交易中', '1610685346007001', '42');
INSERT INTO `orderline` VALUES ('60', '275.00', '交易中', '1610685346007001', '63');
INSERT INTO `orderline` VALUES ('61', '275.00', '交易中', '1610685346007001', '85');
INSERT INTO `orderline` VALUES ('62', '275.00', '交易中', '1610685346007001', '106');
INSERT INTO `orderline` VALUES ('63', '275.00', '交易中', '1610685346007001', '12');
INSERT INTO `orderline` VALUES ('64', '275.00', '交易中', '1610685514912001', '42');
INSERT INTO `orderline` VALUES ('65', '275.00', '交易中', '1610685514912001', '63');
INSERT INTO `orderline` VALUES ('66', '275.00', '交易中', '1610685514912001', '85');
INSERT INTO `orderline` VALUES ('67', '275.00', '交易中', '1610685514912001', '106');
INSERT INTO `orderline` VALUES ('68', '275.00', '交易中', '1610685514912001', '12');
INSERT INTO `orderline` VALUES ('69', '55.00', '交易中', '1610686071618001', '34');
INSERT INTO `orderline` VALUES ('70', '226.00', '交易中', '161070575848413003995671', '41');
INSERT INTO `orderline` VALUES ('71', '226.00', '交易中', '161070575848413003995671', '62');
INSERT INTO `orderline` VALUES ('72', '226.00', '交易中', '161070575848413003995671', '84');
INSERT INTO `orderline` VALUES ('73', '226.00', '交易中', '161070575848413003995671', '105');
INSERT INTO `orderline` VALUES ('74', '226.00', '交易中', '161070575848413003995671', '11');
INSERT INTO `orderline` VALUES ('75', '55.00', '交易中', '161070575848413003995671', '79');
INSERT INTO `orderline` VALUES ('76', '221.00', '交易中', '161070774861213003995679', '41');
INSERT INTO `orderline` VALUES ('77', '221.00', '交易中', '161070774861213003995679', '62');
INSERT INTO `orderline` VALUES ('78', '221.00', '交易中', '161070774861213003995679', '84');
INSERT INTO `orderline` VALUES ('79', '221.00', '交易中', '161070774861213003995679', '105');
INSERT INTO `orderline` VALUES ('80', '10.00', '交易中', '161070774861213003995679', '56');
INSERT INTO `orderline` VALUES ('81', '10.00', '交易中', '161070774861213003995679', '78');

-- ----------------------------
-- Table structure for returnmessage
-- ----------------------------
DROP TABLE IF EXISTS `returnmessage`;
CREATE TABLE `returnmessage` (
  `r_id` varchar(255) NOT NULL,
  `r_time` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `state` enum('') DEFAULT NULL,
  `ol_id` varchar(255) NOT NULL,
  KEY `ol_id` (`ol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of returnmessage
-- ----------------------------
INSERT INTO `returnmessage` VALUES ('01', '2021-01-28 16:53:35', '不喜欢', null, '9');
INSERT INTO `returnmessage` VALUES ('02', '2021-01-05 17:02:28', '书缺页', null, '10');
INSERT INTO `returnmessage` VALUES ('03', '2020-12-28 17:04:34', '书缺页', null, '8');
INSERT INTO `returnmessage` VALUES ('04', '2020-12-07 17:05:05', '不喜欢', null, '7');
INSERT INTO `returnmessage` VALUES ('05', '2020-10-14 17:05:34', '书缺页', null, '6');
INSERT INTO `returnmessage` VALUES ('06', '2020-10-15 17:06:13', '书缺页', null, '11');

-- ----------------------------
-- Table structure for storepersonal
-- ----------------------------
DROP TABLE IF EXISTS `storepersonal`;
CREATE TABLE `storepersonal` (
  `p_id` int(50) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `degree` double DEFAULT NULL,
  `des` varchar(50) DEFAULT NULL,
  `state` enum('待售','已售','待审核','审核未通过') DEFAULT '待审核',
  `ISBN` varchar(50) NOT NULL,
  `c_id` varchar(50) NOT NULL,
  KEY `ISBN2` (`ISBN`),
  KEY `c_id2` (`c_id`),
  KEY `p_id` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storepersonal
-- ----------------------------
INSERT INTO `storepersonal` VALUES ('31', '5', '9', '九成新', '待售', '978-1-1', '002');
INSERT INTO `storepersonal` VALUES ('34', '55', '8', '八eeee', '待售', '978-1-9', '001');
INSERT INTO `storepersonal` VALUES ('35', '5', '9', '九成新', '已售', '978-1-3', '002');
INSERT INTO `storepersonal` VALUES ('36', '55', '8', '八成新', '已售', '978-1-10', '001');
INSERT INTO `storepersonal` VALUES ('37', '5', '9', '九成新', '待售', '978-1-4', '002');
INSERT INTO `storepersonal` VALUES ('38', '55', '8', '？？？？？', '待售', '978-1-11', '001');
INSERT INTO `storepersonal` VALUES ('39', '5', '9', '九成新', '待售', '978-1-5', '002');
INSERT INTO `storepersonal` VALUES ('40', '55', '8', '八成新', '待售', '978-1-12', '001');
INSERT INTO `storepersonal` VALUES ('41', '78', '7', '买了换钱 买馒头', '已售', '978-1-6', '003');
INSERT INTO `storepersonal` VALUES ('42', '55', '8', '八成新', '待售', '978-1-13', '001');
INSERT INTO `storepersonal` VALUES ('43', '5', '9', '九成新', '待售', '978-1-7', '002');
INSERT INTO `storepersonal` VALUES ('44', '55', '8', '八成新', '待售', '978-1-14', '001');
INSERT INTO `storepersonal` VALUES ('45', '5', '9', 'sd', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('50', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('51', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('52', '5', '9', '九成新', '待售', '978-1-1', '002');
INSERT INTO `storepersonal` VALUES ('53', '45.5', '8', '八成新', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('55', '55', '8', '八成新', '待售', '978-1-9', '001');
INSERT INTO `storepersonal` VALUES ('56', '5', '9', '九成新', '已售', '978-1-3', '002');
INSERT INTO `storepersonal` VALUES ('57', '55', '8', '八成新', '已售', '978-1-10', '001');
INSERT INTO `storepersonal` VALUES ('58', '5', '9', '九成新', '待售', '978-1-4', '002');
INSERT INTO `storepersonal` VALUES ('59', '55', '8', '八成新', '待售', '978-1-11', '001');
INSERT INTO `storepersonal` VALUES ('60', '5', '9', '九成新', '待售', '978-1-5', '002');
INSERT INTO `storepersonal` VALUES ('61', '55', '8', '八成新', '待售', '978-1-12', '001');
INSERT INTO `storepersonal` VALUES ('62', '71', '9', '卡萨丁喀什角动量喀什角动量开机速度加啊', '已售', '978-1-6', '004');
INSERT INTO `storepersonal` VALUES ('63', '55', '8', '八成新', '待售', '978-1-13', '001');
INSERT INTO `storepersonal` VALUES ('64', '5', '9', '九成新', '待售', '978-1-7', '002');
INSERT INTO `storepersonal` VALUES ('65', '55', '8', '八成新', '待售', '978-1-14', '001');
INSERT INTO `storepersonal` VALUES ('72', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('73', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('74', '5', '9', '九成新', '待售', '978-1-1', '002');
INSERT INTO `storepersonal` VALUES ('75', '45.5', '8', '八成新', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('77', '55', '8', '八成新', '待售', '978-1-9', '001');
INSERT INTO `storepersonal` VALUES ('78', '5', '9', '九成新', '已售', '978-1-3', '002');
INSERT INTO `storepersonal` VALUES ('79', '55', '8', '八成新', '已售', '978-1-10', '001');
INSERT INTO `storepersonal` VALUES ('80', '5', '9', '九成新', '待售', '978-1-4', '002');
INSERT INTO `storepersonal` VALUES ('81', '55', '8', '八成新', '待售', '978-1-11', '001');
INSERT INTO `storepersonal` VALUES ('82', '5', '9', '九成新', '待售', '978-1-5', '002');
INSERT INTO `storepersonal` VALUES ('83', '55', '8', '八成新', '待售', '978-1-12', '001');
INSERT INTO `storepersonal` VALUES ('84', '12', '7', '看过一次就 觉得非常好', '已售', '978-1-6', '002');
INSERT INTO `storepersonal` VALUES ('85', '55', '8', '八成新', '待售', '978-1-13', '001');
INSERT INTO `storepersonal` VALUES ('86', '5', '9', '九成新', '待售', '978-1-7', '002');
INSERT INTO `storepersonal` VALUES ('87', '55', '8', '八成新', '待售', '978-1-14', '001');
INSERT INTO `storepersonal` VALUES ('92', '20', '8', '急需！', '待售', '1-1-1', '002');
INSERT INTO `storepersonal` VALUES ('93', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('94', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('95', '5', '9', '九成新', '待售', '978-1-1', '002');
INSERT INTO `storepersonal` VALUES ('969', '45.5', '8', '八成新', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('97', '5', '9', '九成新', '待售', '978-1-2', '002');
INSERT INTO `storepersonal` VALUES ('98', '55', '8', '八成新', '待售', '978-1-9', '001');
INSERT INTO `storepersonal` VALUES ('99', '5', '9', '九成新', '已售', '978-1-3', '002');
INSERT INTO `storepersonal` VALUES ('100', '55', '8', '八成新', '已售', '978-1-10', '001');
INSERT INTO `storepersonal` VALUES ('101', '5', '9', '九成新', '待售', '978-1-4', '002');
INSERT INTO `storepersonal` VALUES ('108', '55', '8', '八成新', '待售', '978-1-11', '001');
INSERT INTO `storepersonal` VALUES ('103', '5', '9', '九成新', '待售', '978-1-5', '002');
INSERT INTO `storepersonal` VALUES ('104', '55', '8', '八成新', '待售', '978-1-12', '001');
INSERT INTO `storepersonal` VALUES ('105', '60', '4', '好书好书好书好书好书googdd', '已售', '978-1-6', '002');
INSERT INTO `storepersonal` VALUES ('106', '55', '8', '八成新', '待售', '978-1-13', '001');
INSERT INTO `storepersonal` VALUES ('107', '5', '9', '九成新', '待售', '978-1-7', '002');
INSERT INTO `storepersonal` VALUES ('108', '55', '8', '八成新', '待售', '978-1-14', '001');
INSERT INTO `storepersonal` VALUES ('109', '5', '9', 'sd', '待售', '8-12', '001');
INSERT INTO `storepersonal` VALUES ('110', '5', '9', 'sd', '待售', '8-1', '001');
INSERT INTO `storepersonal` VALUES ('111', '100', '8', 'vue 前端开发好助手', '待售', '1-1-1', '001');
INSERT INTO `storepersonal` VALUES ('114', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('115', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('1', '5', '9', '九成新', '待售', '978-1-1', '002');
INSERT INTO `storepersonal` VALUES ('2', '45.5', '8', '八成新', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('3', '5', '9', '九成新', '待售', '978-1-2', '002');
INSERT INTO `storepersonal` VALUES ('4', '55', '8', '八成新', '待售', '978-1-9', '001');
INSERT INTO `storepersonal` VALUES ('5', '5', '9', '九成新', '已售', '978-1-3', '002');
INSERT INTO `storepersonal` VALUES ('6', '55', '8', '八成新', '已售', '978-1-10', '001');
INSERT INTO `storepersonal` VALUES ('7', '5', '9', '九成新', '待售', '978-1-4', '002');
INSERT INTO `storepersonal` VALUES ('8', '55', '8', '八成新', '待售', '978-1-11', '001');
INSERT INTO `storepersonal` VALUES ('9', '5', '9', '九成新', '待售', '978-1-5', '002');
INSERT INTO `storepersonal` VALUES ('10', '55', '8', '八成新', '待售', '978-1-12', '001');
INSERT INTO `storepersonal` VALUES ('11', '5', '4', '九成新', '已售', '978-1-6', '001');
INSERT INTO `storepersonal` VALUES ('12', '55', '8', '八成新', '待售', '978-1-13', '001');
INSERT INTO `storepersonal` VALUES ('13', '5', '9', '九成新', '待售', '978-1-7', '002');
INSERT INTO `storepersonal` VALUES ('14', '55', '8', '八成新', '待售', '978-1-14', '001');
INSERT INTO `storepersonal` VALUES ('15', '5', '9', 'sd', '待售', '8-12', '001');
INSERT INTO `storepersonal` VALUES ('16', '5', '9', 'sd', '待售', '8-1', '001');
INSERT INTO `storepersonal` VALUES ('25', '100', '8', 'vue 前端开发好助手', '待售', '1-1-1', '001');
INSERT INTO `storepersonal` VALUES ('27', '20', '8', '急需！', '待售', '1-1-1', '002');
INSERT INTO `storepersonal` VALUES ('28', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('29', '20', '8', '急需！', '待售', '978-1-1', '001');
INSERT INTO `storepersonal` VALUES ('116', null, null, null, '待售', '1-1-1', '003');
INSERT INTO `storepersonal` VALUES ('119', '20', '9', 'eeeeeeeeeeee', '待售', '1-1-3', '001');
INSERT INTO `storepersonal` VALUES ('122', '20', '8', '7呃呃呃呃呃呃呃呃呃呃呃', '待售', '1-1-3', '001');
INSERT INTO `storepersonal` VALUES ('125', '12', '10', '5+5+6+65+65+63', '待售', '1-2-3', 'admin');
INSERT INTO `storepersonal` VALUES ('126', '1', '1', '111111', '待售', '1-2-3', 'admin');
INSERT INTO `storepersonal` VALUES ('131', '20', '9', '好书好书好书', '待售', '999-999-999', '13003995679');

-- ----------------------------
-- View structure for 2020total_return
-- ----------------------------
DROP VIEW IF EXISTS `2020total_return`;
CREATE ALGORITHM=UNDEFINED DEFINER=`eb1828`@`%` SQL SECURITY DEFINER VIEW `2020total_return` AS select count(`returnmessage`.`r_id`) AS `total_return`,count(`orderline`.`ol_id`) AS `total_order` from (`returnmessage` join `orderline`) where (`returnmessage`.`r_time` < ((2020 - 1) - 1)) ;

-- ----------------------------
-- View structure for book_information
-- ----------------------------
DROP VIEW IF EXISTS `book_information`;
CREATE ALGORITHM=UNDEFINED DEFINER=`eb1828`@`%` SQL SECURITY DEFINER VIEW `book_information` AS select `booklist`.`ISBN` AS `ISBN`,`booklist`.`b_name` AS `b_name`,`booklist`.`author` AS `author`,`booklist`.`publisher` AS `publisher` from `booklist` ;

-- ----------------------------
-- View structure for book_shortage
-- ----------------------------
DROP VIEW IF EXISTS `book_shortage`;
CREATE ALGORITHM=UNDEFINED DEFINER=`eb1828`@`%` SQL SECURITY DEFINER VIEW `book_shortage` AS select `booklist`.`ISBN` AS `ISBN`,`booklist`.`b_name` AS `书名` from (`storepersonal` join `booklist`) where ((`booklist`.`ISBN` = `storepersonal`.`ISBN`) and (`storepersonal`.`state` = '已售')) group by `storepersonal`.`ISBN`,`storepersonal`.`state` having (count(`storepersonal`.`p_id`) = count((`storepersonal`.`state` = '已售'))) ;

-- ----------------------------
-- View structure for book_store
-- ----------------------------
DROP VIEW IF EXISTS `book_store`;
CREATE ALGORITHM=UNDEFINED DEFINER=`eb1828`@`%` SQL SECURITY DEFINER VIEW `book_store` AS select `booklist`.`ISBN` AS `ISBN`,`booklist`.`b_name` AS `b_name`,count(`storepersonal`.`p_id`) AS `store` from (`storepersonal` join `booklist`) where ((`booklist`.`ISBN` = `storepersonal`.`ISBN`) and (`storepersonal`.`state` = '待售')) group by `storepersonal`.`ISBN` ;

-- ----------------------------
-- View structure for bookSaleAmount
-- ----------------------------
DROP VIEW IF EXISTS `bookSaleAmount`;
CREATE ALGORITHM=UNDEFINED DEFINER=`eb1828`@`%` SQL SECURITY DEFINER VIEW `bookSaleAmount` AS select `booklist`.`ISBN` AS `ISBN`,`booklist`.`b_name` AS `书名`,count(`orderline`.`ol_id`) AS `总销量` from ((`storepersonal` join `orderline`) join `booklist`) where ((`orderline`.`p_id` = `storepersonal`.`p_id`) and (`storepersonal`.`ISBN` = `booklist`.`ISBN`)) group by `booklist`.`ISBN` ;

-- ----------------------------
-- View structure for storepersonal_client
-- ----------------------------
DROP VIEW IF EXISTS `storepersonal_client`;
CREATE ALGORITHM=UNDEFINED DEFINER=`eb1828`@`%` SQL SECURITY DEFINER VIEW `storepersonal_client` AS select `client`.`c_name` AS `client_name`,`booklist`.`b_name` AS `book_name`,`storepersonal`.`price` AS `sc_price`,`storepersonal`.`degree` AS `sc_degree`,`storepersonal`.`des` AS `sc_des`,`storepersonal`.`state` AS `sc_state` from (((`storepersonal` join `client`) join `need`) join `booklist`) where (((`storepersonal`.`ISBN` = `booklist`.`ISBN`) = `need`.`ISBN`) and (`need`.`c_id` = `client`.`c_id`)) ;

-- ----------------------------
-- View structure for sumByMonth
-- ----------------------------
DROP VIEW IF EXISTS `sumByMonth`;
CREATE ALGORITHM=UNDEFINED DEFINER=`eb1828`@`%` SQL SECURITY DEFINER VIEW `sumByMonth` AS select date_format(`order`.`o_time`,'%Y-%m') AS `月份`,sum(`order`.`price_total`) AS `销售额` from `order` group by date_format(`order`.`o_time`,'%Y-%m') ;

-- ----------------------------
-- View structure for 各月退单比率
-- ----------------------------
DROP VIEW IF EXISTS `各月退单比率`;
CREATE ALGORITHM=UNDEFINED DEFINER=`eb1828`@`%` SQL SECURITY DEFINER VIEW `各月退单比率` AS select count(`returnmessage`.`r_id`) AS `total_return`,count(`orderline`.`ol_id`) AS `total_order` from (`returnmessage` join `orderline`) where (`returnmessage`.`r_time` < ((2020 - 1) - 1)) group by date_format(`returnmessage`.`r_time`,'%Y-%m') ;

-- ----------------------------
-- Procedure structure for PREC28x3
-- ----------------------------
DROP PROCEDURE IF EXISTS `PREC28x3`;
DELIMITER ;;
CREATE DEFINER=`eb1828`@`%` PROCEDURE `PREC28x3`(IN B CHAR(12),IN C CHAR(5))
BEGIN 
DECLARE n SMALLINT;
DECLARE H DATE;
DECLARE I SMALLINT;
DECLARE s SMALLINT;
DECLARE f enum('S','T','U','Q');
SELECT 借书编号 INTO s FROM borrow ORDER BY 借书编号 DESC LIMIT 1;
SELECT 类别 INTO f FROM reader WHERE 读者编号=B;
IF f='S' THEN
SELECT DATE_ADD(NOW(),INTERVAL 1 MONTH) INTO H;
ELSE
SELECT DATE_ADD(NOW(),INTERVAL 3 MONTH) INTO H;
END IF;
SELECT 剩余数量 INTO n FROM book WHERE 图书号=C;
IF n>0 THEN
INSERT INTO borrow VALUES(s+1,C,B,NOW(),H,NULL,'F');
ELSE
SELECT '库存不够！' AS '提示';
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PROC28x1
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC28x1`;
DELIMITER ;;
CREATE DEFINER=`eb1828`@`%` PROCEDURE `PROC28x1`(INOUT d CHAR(12))
BEGIN
SELECT COUNT(*) FROM borrow WHERE 读者编号=d;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PROC28x2
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC28x2`;
DELIMITER ;;
CREATE DEFINER=`eb1828`@`%` PROCEDURE `PROC28x2`(OUT y char(10))
BEGIN
SELECT reader.读者姓名 INTO y FROM reader,borrow WHERE reader.读者编号=borrow.读者编号
GROUP BY reader.读者编号 ORDER BY COUNT(reader.读者编号) DESC limit 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PROC28X4
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC28X4`;
DELIMITER ;;
CREATE DEFINER=`eb1828`@`%` PROCEDURE `PROC28X4`(IN A SMALLINT,IN B INT,IN C INT,IN E SMALLINT,OUT GETMONEY DECIMAL(10,2))
BEGIN
DECLARE G_NUM INT;
DECLARE G_PRICE DECIMAL(10,2);
SELECT 单价,库存量 INTO G_PRICE,G_NUM FROM goods WHERE 商品号=C;
IF G_NUM<E THEN
SET GETMONEY=0;
SELECT '库存不够！' AS '提示';
ELSE 
SET GETMONEY=G_PRICE*E;
INSERT INTO sell VALUES((SELECT 序号+1 FROM sell ORDER BY 序号 DESC LIMIT 1),
NOW(),B,C,E,GETMONEY,A);
UPDATE goods SET 库存量=库存量-E WHERE 商品号=C;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PROC28xx2
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC28xx2`;
DELIMITER ;;
CREATE DEFINER=`eb1828`@`%` PROCEDURE `PROC28xx2`(OUT y char(10))
BEGIN
SELECT reader.读者姓名 INTO y FROM reader,borrow WHERE reader.读者编号=borrow.读者编号 
AND borrow.借书日期 BETWEEN  '2016-12-6' AND '2019-12-6'
GROUP BY reader.读者编号 ORDER BY COUNT(reader.读者编号) DESC limit 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for PROC28XX4
-- ----------------------------
DROP PROCEDURE IF EXISTS `PROC28XX4`;
DELIMITER ;;
CREATE DEFINER=`eb1828`@`%` PROCEDURE `PROC28XX4`(IN A SMALLINT,IN B INT,IN C INT,IN E SMALLINT,OUT GETMONEY DECIMAL(10,2))
BEGIN
DECLARE x SMALLINT;
DECLARE G_NUM INT;
DECLARE G_PRICE DECIMAL(10,2);
SELECT 单价,库存量 INTO G_PRICE,G_NUM FROM goods WHERE 商品号=C;
IF G_NUM<E THEN
SET GETMONEY=0;
SELECT '库存不够！' AS '提示';
ELSE 
SET GETMONEY=G_PRICE*E;
SELECT 序号+1 INTO x FROM sell ORDER BY 序号 DESC LIMIT 1;
INSERT INTO sell VALUES(x,NOW(),B,C,E,GETMONEY,A);
UPDATE goods SET 库存量=库存量-E WHERE 商品号=C;
END IF;
END
;;
DELIMITER ;
