/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : mobtops

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-03-11 15:58:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dc_20`
-- ----------------------------
DROP TABLE IF EXISTS `dc_20`;
CREATE TABLE `dc_20` (
  `ad_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ad_level` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ad_id`),
  KEY `parent_id` (`ad_level`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_20
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_addons`
-- ----------------------------
DROP TABLE IF EXISTS `dc_addons`;
CREATE TABLE `dc_addons` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) NOT NULL COMMENT '插件名称',
  `bzname` varchar(50) NOT NULL COMMENT '标识名',
  `desc` text COMMENT '描述',
  `version` varchar(10) NOT NULL COMMENT '版本号',
  `author` varchar(50) NOT NULL COMMENT '作者姓名',
  `logo` varchar(255) NOT NULL COMMENT 'LOGO',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '插件配置',
  `type` varchar(50) DEFAULT NULL COMMENT '插件分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of dc_addons
-- ----------------------------
INSERT INTO `dc_addons` VALUES ('1', '聊天机器人', 'IdouChat', '微信智能聊天机器人插件，可在微信端开启机器人聊天模式', '1.0', '', 'http://www.mobtop.com.cn/Addons/IdouChat/logo.jpg', '1', '{\"respond_rule\":1,\"setting\":1,\"setting_list\":{\"can_voice\":{\"title\":\"\\u662f\\u5426\\u5f00\\u542f\\u8bed\\u97f3\\u804a\\u5929\",\"type\":\"radio\",\"options\":[\"\\u4e0d\\u5f00\\u542f\",\"\\u5f00\\u542f\"],\"value\":0,\"tip\":\"\\u5f00\\u542f\\u8bed\\u97f3\\u804a\\u5929\\uff0c\\u9700\\u8981\\u5728\\u5fae\\u4fe1\\u540e\\u53f0\\u5f00\\u542f\\u8bed\\u97f3\\u8bc6\\u522b\\u529f\\u80fd\"},\"api_url\":{\"title\":\"\\u56fe\\u7075API\\u5730\\u5740\",\"type\":\"text\",\"placeholder\":\"http:\\/\\/www.tuling123.com\\/openapi\\/api\",\"value\":\"\",\"tip\":\"\"},\"api_key\":{\"title\":\"\\u56fe\\u7075API KEY\",\"type\":\"text\",\"placeholder\":\"5b6d54d86d958fe4fabb67883903dbe9\",\"value\":\"\",\"tip\":\"<a href=\\\"http:\\/\\/www.tuling123.com\\/web\\/robot_access!index.action?cur=l_05\\\" target=\\\"_blank\\\">\\u524d\\u5f80\\u56fe\\u7075\\u673a\\u5668\\u4eba\\u5b98\\u7f51\\u7533\\u8bf7API<\\/a>\"},\"enter_tip\":{\"title\":\"\\u8fdb\\u5165\\u804a\\u5929\\u63d0\\u793a\\u8bed\",\"type\":\"textarea\",\"placeholder\":\"\\u4f60\\u60f3\\u804a\\u70b9\\u4ec0\\u4e48\\u5462\",\"value\":\"\",\"tip\":\"\\u7528\\u6237\\u53d1\\u9001\\u5173\\u952e\\u8bcd\\u8fdb\\u5165\\u673a\\u5668\\u4eba\\u804a\\u5929\\u6a21\\u5f0f\\u65f6\\u56de\\u590d\\u7ed9\\u7528\\u6237\\u7684\\u5185\\u5bb9\"},\"keep_time\":{\"title\":\"\\u4f1a\\u8bdd\\u4fdd\\u6301\\u65f6\\u95f4\",\"type\":\"text\",\"placeholder\":\"300\",\"value\":\"\",\"tip\":\"\\u5728\\u6b64\\u65f6\\u95f4\\u8303\\u56f4\\u5185\\uff0c\\u7528\\u6237\\u4e00\\u76f4\\u5904\\u5728\\u673a\\u5668\\u4eba\\u804a\\u5929\\u6a21\\u5f0f\\u4e2d\\uff0c\\u9ed8\\u8ba4300\\u79d2\\uff085\\u5206\\u949f\\uff09\"},\"exit_keyword\":{\"title\":\"\\u9000\\u51fa\\u804a\\u5929\\u5173\\u952e\\u8bcd\",\"type\":\"text\",\"placeholder\":\"\\u9000\\u51fa\",\"value\":\"\",\"tip\":\"\\u7528\\u6237\\u53d1\\u9001\\u6b64\\u5173\\u952e\\u8bcd\\u4e3b\\u52a8\\u9000\\u51fa\\u673a\\u5668\\u4eba\\u804a\\u5929\\u6a21\\u5f0f\"},\"exit_tip\":{\"title\":\"\\u9000\\u51fa\\u804a\\u5929\\u63d0\\u793a\\u8bed\",\"type\":\"textarea\",\"placeholder\":\"\\u4e0b\\u6b21\\u65e0\\u804a\\u7684\\u65f6\\u5019\\u53ef\\u4ee5\\u518d\\u627e\\u6211\\u804a\\u5929\\u54e6\",\"value\":\"\",\"tip\":\"\\u7528\\u6237\\u9000\\u51fa\\u673a\\u5668\\u4eba\\u804a\\u5929\\u6a21\\u5f0f\\u65f6\\u56de\\u590d\\u7ed9\\u7528\\u6237\\u7684\\u5185\\u5bb9\"}}}', 'wechat');
INSERT INTO `dc_addons` VALUES ('2', '留言板', 'IdouGuestbook', '微信端留言板功能', '1.0', '', 'http://www.mobtop.com.cn/Addons/IdouGuestbook/logo.jpg', '1', '{\"index_url\":\"\\/index.php?s=\\/addon\\/IdouGuestbook\\/web\\/messages\",\"setting\":1,\"entry\":1,\"menu\":1,\"entry_list\":{\"index\":\"\\u7559\\u8a00\\u677f\\u9996\\u9875\"},\"menu_list\":{\"messages\":\"\\u7559\\u8a00\\u7ba1\\u7406\"},\"setting_list\":{\"need_audit\":{\"title\":\"\\u7559\\u8a00\\u662f\\u5426\\u9700\\u8981\\u5ba1\\u6838\",\"type\":\"radio\",\"options\":[\"\\u4e0d\\u9700\\u8981\",\"\\u9700\\u8981\"],\"value\":0,\"group\":\"basic\"},\"per\":{\"title\":\"\\u6bcf\\u9875\\u663e\\u793a\\u7559\\u8a00\\u6570\",\"type\":\"number\",\"value\":10,\"group\":\"basic\"},\"share_title\":{\"title\":\"\\u81ea\\u5b9a\\u4e49\\u5206\\u4eab\\u6807\\u9898\",\"type\":\"text\",\"group\":\"share\"},\"share_cover\":{\"title\":\"\\u81ea\\u5b9a\\u4e49\\u5206\\u4eab\\u5c01\\u9762\",\"type\":\"image\",\"group\":\"share\"},\"share_desc\":{\"title\":\"\\u81ea\\u5b9a\\u4e49\\u5206\\u4eab\\u63cf\\u8ff0\",\"type\":\"textarea\",\"group\":\"share\"}},\"setting_list_group\":{\"basic\":{\"title\":\"\\u57fa\\u7840\\u914d\\u7f6e\",\"is_show\":1},\"share\":{\"title\":\"\\u81ea\\u5b9a\\u4e49\\u5206\\u4eab\\u914d\\u7f6e\",\"is_show\":1}}}', 'wechat');
INSERT INTO `dc_addons` VALUES ('5', '投票活动', 'MbkuVote', '微信投票活动 基于豆信3.0版本', '1.0.0', '', 'http://www.mobtop.com.cn/Addons/MbkuVote/logo.jpg', '1', '{\"index_url\":\"\\/index.php?s=\\/addon\\/MbkuVote\\/Web\\/lists\",\"setting\":1,\"entry\":1,\"menu\":1,\"entry_list\":{\"index\":\"\\u5c01\\u9762\\u5165\\u53e3\"},\"menu_list\":{\"lists\":\"\\u6295\\u7968\\u7ba1\\u7406\",\"add\":\"\\u65b0\\u589e\\u9009\\u624b\"},\"setting_list\":{\"per\":{\"title\":\"\\u6bcf\\u9875\\u663e\\u793a\\u6570\\u91cf\",\"type\":\"number\",\"value\":10,\"group\":\"basic\"},\"vote_count\":{\"title\":\"\\u6bcf\\u4eba\\u6295\\u7968\\u603b\\u6570\",\"type\":\"number\",\"value\":10,\"group\":\"basic\"},\"vote_pid_count\":{\"title\":\"\\u6bcf\\u4eba\\u9009\\u624b\\u6295\\u7968\\u603b\\u6570\",\"type\":\"number\",\"value\":1,\"group\":\"basic\"},\"vote_cycle\":{\"title\":\"\\u5468\\u671f\\u591a\\u5c11\\u5929\",\"type\":\"number\",\"value\":1,\"group\":\"basic\"},\"vote_status\":{\"title\":\"\\u662f\\u5426\\u5f00\\u542f\",\"type\":\"radio\",\"options\":[\"\\u5173\\u95ed\",\"\\u5f00\\u542f\"],\"value\":1,\"group\":\"basic\"},\"vote_start_time\":{\"title\":\"\\u6d3b\\u52a8\\u5f00\\u542f\\u65f6\\u95f4\",\"type\":\"text\",\"value\":\"\",\"group\":\"basic\",\"placeholder\":\"\\u683c\\u5f0f\\u5982 2016-10-01 00:00:00\"},\"vote_end_time\":{\"title\":\"\\u6d3b\\u52a8\\u7ed3\\u675f\\u65f6\\u95f4\",\"type\":\"text\",\"value\":\"\",\"group\":\"basic\",\"placeholder\":\"\\u683c\\u5f0f\\u5982 2016-10-01 00:00:00\"},\"vote_guize\":{\"title\":\"\\u6d3b\\u52a8\\u89c4\\u5219\",\"type\":\"textarea\",\"value\":\"\",\"group\":\"basic\"},\"vote_prize_note\":{\"title\":\"\\u5956\\u54c1\\u8bf4\\u660e\",\"type\":\"textarea\",\"value\":\"\",\"group\":\"basic\"},\"share_title\":{\"title\":\"\\u81ea\\u5b9a\\u4e49\\u5206\\u4eab\\u6807\\u9898\",\"type\":\"text\",\"group\":\"share\"},\"share_cover\":{\"title\":\"\\u81ea\\u5b9a\\u4e49\\u5206\\u4eab\\u5c01\\u9762\",\"type\":\"image\",\"group\":\"share\"},\"share_desc\":{\"title\":\"\\u81ea\\u5b9a\\u4e49\\u5206\\u4eab\\u63cf\\u8ff0\",\"type\":\"textarea\",\"group\":\"share\"}},\"setting_list_group\":{\"basic\":{\"title\":\"\\u57fa\\u7840\\u914d\\u7f6e\",\"is_show\":1},\"share\":{\"title\":\"\\u81ea\\u5b9a\\u4e49\\u5206\\u4eab\\u914d\\u7f6e\",\"is_show\":1}}}', 'wechat');
INSERT INTO `dc_addons` VALUES ('6', '意见反馈', 'IdouFeedback', '微信端意见反馈功能', '1.0', '', 'http://www.mobtop.com.cn/Addons/IdouFeedback/logo.jpg', '1', '{\"respond_rule\":0,\"setting\":1,\"setting_list\":{\"top_title\":{\"title\":\"\\u6d4f\\u89c8\\u5668\\u6807\\u9898\",\"type\":\"text\",\"placeholder\":\"\\u610f\\u89c1\\u53cd\\u9988\"},\"page_title\":{\"title\":\"\\u9875\\u9762\\u6807\\u9898\",\"type\":\"text\",\"placeholder\":\"\\u610f\\u89c1\\u53cd\\u9988\"},\"need_name\":{\"title\":\"\\u662f\\u5426\\u9700\\u8981\\u586b\\u5199\\u59d3\\u540d\",\"type\":\"radio\",\"options\":[\"\\u4e0d\\u9700\\u8981\",\"\\u9700\\u8981\"]},\"need_contact\":{\"title\":\"\\u662f\\u5426\\u9700\\u8981\\u586b\\u5199\\u8054\\u7cfb\\u65b9\\u5f0f\",\"type\":\"radio\",\"options\":[\"\\u4e0d\\u9700\\u8981\",\"\\u9700\\u8981\"]},\"contact_type\":{\"title\":\"\\u9700\\u8981\\u586b\\u5199\\u7684\\u8054\\u7cfb\\u65b9\\u5f0f\",\"type\":\"radio\",\"options\":[\"\\u624b\\u673a\\u53f7\",\"QQ\\u53f7\",\"\\u5fae\\u4fe1\\u53f7\",\"\\u90ae\\u7bb1\"],\"tip\":\"\\u5f00\\u542f\\u9700\\u8981\\u586b\\u5199\\u8054\\u7cfb\\u65b9\\u5f0f\\u540e\\u6b64\\u9009\\u9879\\u624d\\u8d77\\u4f5c\\u7528\"}},\"entry\":1,\"entry_list\":{\"index\":\"\\u53cd\\u9988\\u5165\\u53e3\"},\"menu\":1,\"menu_list\":{\"lists\":\"\\u53cd\\u9988\\u5217\\u8868\"}}', null);
INSERT INTO `dc_addons` VALUES ('7', '在线点歌', 'IdouDg', '微信在线点歌插件，实现微信端文字点歌、语音点歌等功能。', '1.0', '', 'http://www.mobtop.com.cn/Addons/IdouDg/logo.png', '1', '{\"respond_rule\":1,\"setting\":0,\"entry\":0,\"menu\":0}', null);
INSERT INTO `dc_addons` VALUES ('8', '微捐赠', 'IdouDonate', '微信捐赠插件', '1.0', '', 'http://www.mobtop.com.cn/Addons/IdouDonate/logo.gif', '1', '{\"setting\":1,\"entry\":1,\"menu\":1,\"entry_list\":{\"index\":\"\\u6350\\u8d60\\u5165\\u53e3\",\"donate_list\":\"\\u6350\\u8d60\\u5217\\u8868\"},\"menu_list\":{\"donations\":\"\\u6350\\u8d60\\u7ba1\\u7406\"},\"setting_list\":{\"money\":{\"title\":\"\\u6350\\u8d60\\u989d\\u8bbe\\u7f6e\",\"type\":\"textarea\",\"placeholder\":\"5\\uff0c10\\uff0c20\\uff0c50\\uff0c100\\uff0c200\",\"tip\":\"\\u5355\\u4f4d\\uff1a\\u5143\\u3002\\u591a\\u4e2a\\u6350\\u8d60\\u989d\\u7528\\u4e2d\\u6587\\u9017\\u53f7\\u5206\\u5f00\"}}}', 'customer');

-- ----------------------------
-- Table structure for `dc_addons_access`
-- ----------------------------
DROP TABLE IF EXISTS `dc_addons_access`;
CREATE TABLE `dc_addons_access` (
  `user_id` int(10) NOT NULL,
  `addon` varchar(50) NOT NULL,
  `mpid` int(10) NOT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_addons_access
-- ----------------------------
INSERT INTO `dc_addons_access` VALUES ('1', 'iot', '16', '1');
INSERT INTO `dc_addons_access` VALUES ('1', 'Distribution', '43', '2');

-- ----------------------------
-- Table structure for `dc_addon_entry`
-- ----------------------------
DROP TABLE IF EXISTS `dc_addon_entry`;
CREATE TABLE `dc_addon_entry` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `addon` varchar(50) NOT NULL COMMENT '插件名称',
  `name` varchar(255) DEFAULT NULL COMMENT '入口名称',
  `act` varchar(50) NOT NULL COMMENT '操作',
  `title` varchar(255) NOT NULL COMMENT '封面标题',
  `desc` text COMMENT '封面描述',
  `cover` varchar(255) NOT NULL DEFAULT '0' COMMENT '封面图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='插件功能入口表';

-- ----------------------------
-- Records of dc_addon_entry
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_addon_setting`
-- ----------------------------
DROP TABLE IF EXISTS `dc_addon_setting`;
CREATE TABLE `dc_addon_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `addon` varchar(50) NOT NULL COMMENT '插件标识',
  `name` varchar(50) NOT NULL COMMENT '配置项',
  `value` text NOT NULL COMMENT '配置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='插件配置参数表';

-- ----------------------------
-- Records of dc_addon_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_address`
-- ----------------------------
DROP TABLE IF EXISTS `dc_address`;
CREATE TABLE `dc_address` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_address
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_address_lists`
-- ----------------------------
DROP TABLE IF EXISTS `dc_address_lists`;
CREATE TABLE `dc_address_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '省市县乡名称',
  `pid` int(11) DEFAULT NULL COMMENT '关联id',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `type` int(11) DEFAULT NULL COMMENT '1.为省 2.市 3.县 4.乡',
  `token` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '是否为省会',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=695 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_address_lists
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_affiche`
-- ----------------------------
DROP TABLE IF EXISTS `dc_affiche`;
CREATE TABLE `dc_affiche` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `affiche_title` varchar(100) DEFAULT NULL,
  `affiche_content` text,
  `affiche_time` int(11) DEFAULT NULL,
  `affiche_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_affiche
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_attach`
-- ----------------------------
DROP TABLE IF EXISTS `dc_attach`;
CREATE TABLE `dc_attach` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) DEFAULT NULL COMMENT '公众号ID',
  `user_id` int(10) DEFAULT NULL COMMENT '上传者的用户ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_extension` varchar(10) DEFAULT NULL COMMENT '附件后缀名',
  `file_size` int(10) DEFAULT NULL COMMENT '附件大小',
  `file_path` varchar(255) DEFAULT NULL COMMENT '附件存储位置',
  `hash` varchar(50) DEFAULT NULL COMMENT '哈希',
  `create_time` int(10) DEFAULT NULL COMMENT '附件创建时间',
  `item_type` varchar(50) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=944 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of dc_attach
-- ----------------------------
INSERT INTO `dc_attach` VALUES ('943', '1', '1', 'IMAX.jpg', 'jpg', '237741', './Uploads/Pictures/20170310/58c260364d348.jpg', '152e63f0f12d4690bf8085523e66e940', '1489133622', 'image');

-- ----------------------------
-- Table structure for `dc_branch`
-- ----------------------------
DROP TABLE IF EXISTS `dc_branch`;
CREATE TABLE `dc_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) DEFAULT NULL,
  `sort` int(5) DEFAULT NULL,
  `content` text,
  `creat_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_branch
-- ----------------------------
INSERT INTO `dc_branch` VALUES ('85', '开发部', null, '', null);
INSERT INTO `dc_branch` VALUES ('84', '测试部', null, '', null);
INSERT INTO `dc_branch` VALUES ('83', '销售部', null, '', null);
INSERT INTO `dc_branch` VALUES ('113', '产品部', null, '', null);
INSERT INTO `dc_branch` VALUES ('114', '设计部', null, '', null);
INSERT INTO `dc_branch` VALUES ('115', '运维部', null, '', null);
INSERT INTO `dc_branch` VALUES ('116', '商务部', null, '', null);
INSERT INTO `dc_branch` VALUES ('117', '财务部', null, '', null);
INSERT INTO `dc_branch` VALUES ('118', '售前部', null, '', null);
INSERT INTO `dc_branch` VALUES ('119', '法务部', null, '', null);
INSERT INTO `dc_branch` VALUES ('120', '业务部', null, '', null);
INSERT INTO `dc_branch` VALUES ('121', '推广部', null, '', null);
INSERT INTO `dc_branch` VALUES ('122', '品牌部', null, '', null);

-- ----------------------------
-- Table structure for `dc_comment_zan`
-- ----------------------------
DROP TABLE IF EXISTS `dc_comment_zan`;
CREATE TABLE `dc_comment_zan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_comment_zan
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_exchange_type`
-- ----------------------------
DROP TABLE IF EXISTS `dc_exchange_type`;
CREATE TABLE `dc_exchange_type` (
  `ty_id` int(11) NOT NULL AUTO_INCREMENT,
  `ty_name` varchar(255) NOT NULL,
  `u_token` varchar(255) NOT NULL,
  `ty_mess` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_exchange_type
-- ----------------------------
INSERT INTO `dc_exchange_type` VALUES ('5', '积分+在线支付', '1', '如果是多种支付方式，请以‘+’分隔，例如：200+20（积分+在线支付）');
INSERT INTO `dc_exchange_type` VALUES ('7', '积分+礼品卡', '1', '');

-- ----------------------------
-- Table structure for `dc_fans`
-- ----------------------------
DROP TABLE IF EXISTS `dc_fans`;
CREATE TABLE `dc_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `group_id` varchar(50) DEFAULT NULL COMMENT '可用套餐ID',
  `name` varchar(50) NOT NULL COMMENT '公众号名称',
  `origin_id` varchar(50) NOT NULL COMMENT '公众号原始ID',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '公众号类型（1：普通订阅号；2：认证订阅号；3：普通服务号；4：认证服务号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常，2：审核中）',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `valid_token` varchar(40) DEFAULT NULL COMMENT '接口验证Token',
  `token` varchar(50) DEFAULT NULL COMMENT '公众号标识',
  `encodingaeskey` varchar(50) DEFAULT NULL COMMENT '消息加解密秘钥',
  `appid` varchar(50) DEFAULT NULL COMMENT 'AppId',
  `appsecret` varchar(50) DEFAULT NULL COMMENT 'AppSecret',
  `mp_number` varchar(50) DEFAULT NULL COMMENT '微信号',
  `desc` text COMMENT '描述',
  `headimg` varchar(255) DEFAULT NULL COMMENT '头像',
  `qrcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  `login_name` varchar(50) DEFAULT NULL COMMENT '公众号登录名',
  `fields` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `member_idcards` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `intergrals` float(10,1) DEFAULT NULL,
  `price` float(10,1) DEFAULT NULL,
  `lingka_time` int(11) DEFAULT NULL,
  `buycounts` int(11) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `balance` float(10,1) DEFAULT NULL,
  `numlists` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='公众号表';

-- ----------------------------
-- Records of dc_fans
-- ----------------------------
INSERT INTO `dc_fans` VALUES ('6', '6', null, '李金龙', 'gh_ad636f6735b5', '5', '1', '1480124217', 'g9FOK4B18dLqWK4ZjnCnwSeGk4RsSn9F', '31026dc52ced6e0689e240ede2b92783', 'B7rWEOvmhf0CW2cFRr8IbgYDf04ouSG01xppN70TQWC', 'wx119e7a4103920196', '80f97ddfc89bc75d82a62520ea0d9570', 'gh_ad636f6735b5', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('8', '8', null, 'gh_a8bf1b456567', 'gh_a8bf1b45655d', '5', '1', '1480124873', 'YtyueFCJy77g1orwP5blfdsog3fSOYWf', 'bbac42d3fc8187abc84cb5b4e8bbd664', 'p85f9fPByg6sweeyoSsywZRD1DtRNDeUb4uzwkYi9we', 'wxe50e0a6402ff04f7', '63385b2ff50a45fa63f7d4ded16399be', 'gh_a8bf1b45656d', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('10', '10', null, 'gh_b04e46826163', 'gh_b04e46826163', '5', '1', '1480137734', 'oxYHWpLqXwG5yAVFzQo7QmyTysrZhqap', '983ec9055f9a844b7f396e53da480425', '9GkmhvhC1AWRiSRj0msFRFg6zQNpu6E6rVIujN4BjHs', 'wx3118b3a6756a2234', 'd19bf3bc0b169a83a8ac4b65004cfc76', 'gh_b04e46826163', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('16', '1', null, '魔派软件', 'gh_636855c05843', '107', '1', '1480385141', '6sIbllRUdTl3jHpuNWjnOEQmv9TLDSm3', 'aeacb1b60ffcf0f120e8e9164d1c10f7', 'pQL90ImsIxdG5Ajy1phDHMpMo2msh2uBi8OAYvoAoZG', 'wx3c3d9d4152897668', 'b2cffba81c31b2795d803c24d814f0d5', 'mobtop_com_cn', null, 'http://www.mobtop.com.cn/Uploads/Pictures/20161221/585a532b5040b.png', '', null, 'vipcard_name,icons,mem_back,custom_back,prompt,inter_send,ex_redpacket,grade,discount,content_use', null, null, null, null, null, null, null, null, null, '0', null, null, 'headimg,name,member_idcards,upgrade_type,grade_name,intergrals,price,balance,buycounts,phone,lingka_time');
INSERT INTO `dc_fans` VALUES ('21', '4', null, '郝云', 'gh_91d03ab65dae', '111', '1', '1480399059', 'u4eaUCvO5vOgRysTisNRUIH9fklz37aP', '51601a79e8dc965f9629274be1277419', 'zEv5d65AaJvwQzxgFzSfFU3X9qsk2Dl25JmR0qBMlvh', 'wx5fb95586e2d8f491', 'aa8e6d602c4407dafc66d2a00f2cd94e', 'gh_91d03ab65dae', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('23', '4', null, '任海峰', 'gh_c0d2ecb399c1', '111', '1', '1480405706', 'hJqxbgDwXySUnoMh40yQtOAeaZf2sJ1O', 'b2972c4aa5d5a5b3db139e0037990d2c', 'heYkVpdwmkWhrltuxbvs9I1mDytsAQ4PxfFdRq3fynQ', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('24', '11', null, 'whui360', 'gh_91d03ab65dww', '107', '1', '1480677419', 'GcaGKq7KsGLRkG7mOwGSAMA0m4O0ecle', '946b7921abe8fcba436004b5f3b0560e', '68aoqJsk9L5F2vSDz5lq1pHNGUWkTDLlofCeYAlI7nR', 'wx5fb95586e2d8f491', 'aa8e6d602c4407dafc66d2a00f2cd94e', 'gh_91d03ab65dww', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('26', '12', null, 'gh_c0d2ecb399cf', 'gh_c0d2ecb311ss', '5', '1', '1480679153', 'tXSo7KKsaHb7VzYofembDjooVKriKudV', '43425c1d7b4f388a327a3775247b8871', 'qhQY4AsVfRkSGjPjh4033Yo3LBeOIbHvzPDs1Ha24M0', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('27', '13', null, 'gh_c0d2ecb3978', 'gh_c0d2ecb3123f', '2', '1', '1480679233', 'dcDQ4MiJk47EcF9CkW63U5zuB22CYSKY', '54def2599976d1774daae926551f0311', '7ArAmsSz60pYBV8nNZRLcnEiXMO896Vgfftbioudscm', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('28', '13', null, 'gh_91d03ab65d', 'gh_91d03ab65ddd', '5', '1', '1480679279', 'IHuLfBxPqcJga4tvvrd6LPNy6LCqamO3', '5cd22c0bcda4a8e9dcee7d2e286387a0', 'hvcYtIBvsARQmwg8QQmLcVlE27hhOMb0OhKsCcnB4BB', 'wx5fb95586e2d8f491', 'aa8e6d602c4407dafc66d2a00f2cd94e', 'gh_91d03ab65dae', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('30', '13', null, '海峰', 'gh_c0d2ecb399cf', '111', '1', '1480679604', 's54ud91CHytpCDTCoe8yif1Q8oqDXYgr', 'c46392a49d59be6adc507ba51894907c', 'oepLcRLNfzQseC26crTG6zeVEpBESGwBeQLXHnqoycf', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('31', '4', null, '郝云订阅号', 'gh_1e26a5421bf5', '106', '1', '1480688536', 'hzUZHSvXXAuROyw95YCrei8jO1UGk2Sw', '5cd40b8ebc12a400b456cf79a3b6a4e8', '6Hz8JftlPpsf7sv6bUhQrfpIUYJU0Rc65popA1URUJQ', 'wxbf7cb55ed3bca7a7', '53df2eeeb0f2a1af12156be0679e14b0', 'gh_1e26a5421bf5', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('32', '4', null, '白通才', 'gh_6ad8ac95b5a9', '111', '1', '1480688662', 'KWoZqFe6DSEblIS3eRpvN5EIwp1Pnp8B', 'bb592f57a5012650de4039da21141773', 'VqilhwYD5wYU8WAWW6VuuMcVbpqfktTxNsQVPbjbIDy', 'wx5168efa0f2e9989d', '7c232ffeebdbaea39c61843a5a21aec1', 'gh_6ad8ac95b5a9', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('34', '4', null, '闫波', 'gh_a8bf1b45656d', '111', '1', '1480847549', '0U0ETvAds5BZgBEH3JOkFAPIHOniXoBl', 'bbac42d3fc8187abc84cb5b4e8bbd664', 'JGM2xIyTJkMXpXmGSPyiVkojYQ4gpnEDZqYyuZUw6ff', 'wxe50e0a6402ff04f7', '63385b2ff50a45fa63f7d4ded16399be', 'gh_a8bf1b45656d', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('35', '4', null, '未知', 'gh_9f05ca41a5c9', '111', '1', '1480847716', 'z9gxRhvv87jXZ2gowXptE9KURplleulg', '55bc01feb17d4e144d0bdbe7d6513312', 'Fbw4fLLH7D4FliTcQmZfwWB1u85Rqgzz8J5m3dbHr0f', 'wx3472c0b020d5a610', 'd4624c36b6795d1d99dcf0547af5443d', 'gh_9f05ca41a5c9', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('36', '15', null, '姻缘天使', 'gh_04df2d3fee5a', '107', '1', '1482206060', '6AjzBHVTydJVOCn2aJlvvSnBaskRdfLq', 'd816a7f1a87b8386bf7728c90eea0820', 'E5f4cPo9BkLKDzyYhj5uPaV36qkuyjDAZrFdkWF2TWy', 'wx6341088ca517af43', 'c1018e589925256c647d487d36ae3c0d', '3131606120@qq.com', null, 'http://www.mobtop.com.cn/Uploads/Pictures/20161220/5858ab62d015b.jpg', 'http://www.mobtop.com.cn/Uploads/Pictures/20161220/5858ab69b756d.jpg', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('38', '26', null, 'G22微勤', 'gh_1364d106c10c', '107', '1', '1483409899', 'njdLiOGh5tiVGTOk2pSa4yVtpmQpgGlr', 'b6f1c1c7ed9324306a465ccd7b9b5658', 'Xi8VClMmVhEmfgs4wmPNCTNEIVnmmib0hRbX5dDkjeh', 'wxdbbeb95773643c4e', '979c07ff8367991999f87721be9d4a8a', 'ggjg22wq', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);
INSERT INTO `dc_fans` VALUES ('39', '29', null, 'gh_c0d2ecb399cf', 'gh_c0d2ecb39123', '111', '1', '1484014965', 'Qw9m4aOsw6LHoxb9pYl29jU7psd7NuSz', '76a4bcfc2e79b2d43f23e5c13e658bff', 'D1yePkfhBAfykLk5sH8igKcolirdFjrQjdBaG3TEMUN', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', null, '', '', null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null);

-- ----------------------------
-- Table structure for `dc_grant`
-- ----------------------------
DROP TABLE IF EXISTS `dc_grant`;
CREATE TABLE `dc_grant` (
  `id` int(10) NOT NULL COMMENT '主键ID',
  `mp_user_id` int(10) NOT NULL COMMENT '公众号ID',
  `access_token` varchar(100) NOT NULL,
  `time` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='授权表';

-- ----------------------------
-- Records of dc_grant
-- ----------------------------
INSERT INTO `dc_grant` VALUES ('1', '1', 'vmQOHaktJrEuyw758nbdBKVSwVpyCnutgm2_ei-JGrGG3kHtN6LtjTbZhBf1rlfaUpyLKNzhdPY0L4mcY-1pW6wQK4osZROvaQIt', '1489026127');
INSERT INTO `dc_grant` VALUES ('2', '26', 'E5ynvjNJF0dzZ0zlVeQxqtQyHFPHL5cWUImgzJ_97zFZnYd5g1LzBDU66BR0QbfeQIbCkkJ2B9GZtOq6TerTMZumVbG92wf78Drn', '1488970879');

-- ----------------------------
-- Table structure for `dc_idou_donate_list`
-- ----------------------------
DROP TABLE IF EXISTS `dc_idou_donate_list`;
CREATE TABLE `dc_idou_donate_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) DEFAULT NULL COMMENT '公众号标识',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `money` float(10,2) DEFAULT NULL COMMENT '捐赠额',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名',
  `pay_status` int(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `create_time` int(10) DEFAULT NULL COMMENT '捐赠时间',
  `content` text COMMENT '留言内容',
  `is_show` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  `orderid` varchar(50) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='微捐赠插件捐赠列表';

-- ----------------------------
-- Records of dc_idou_donate_list
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_idou_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `dc_idou_feedback`;
CREATE TABLE `dc_idou_feedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) NOT NULL COMMENT '用户标识',
  `name` varchar(255) DEFAULT NULL COMMENT '反馈者姓名',
  `contact` varchar(255) NOT NULL COMMENT '联系方式内容',
  `contact_type` tinyint(1) DEFAULT NULL COMMENT '联系方式类型',
  `content` text COMMENT '反馈内容',
  `create_time` int(10) NOT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of dc_idou_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_idou_guestbook_list`
-- ----------------------------
DROP TABLE IF EXISTS `dc_idou_guestbook_list`;
CREATE TABLE `dc_idou_guestbook_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) DEFAULT NULL COMMENT '公众号标识',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `nickname` varchar(50) NOT NULL COMMENT '用户昵称',
  `content` text NOT NULL COMMENT '留言内容',
  `create_time` int(10) NOT NULL COMMENT '留言时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '留言状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='留言板留言表';

-- ----------------------------
-- Records of dc_idou_guestbook_list
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_imgs`
-- ----------------------------
DROP TABLE IF EXISTS `dc_imgs`;
CREATE TABLE `dc_imgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NOT NULL,
  `imgs` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_imgs
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_log`
-- ----------------------------
DROP TABLE IF EXISTS `dc_log`;
CREATE TABLE `dc_log` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `log_content` varchar(255) DEFAULT NULL,
  `log_controller` varchar(100) DEFAULT NULL,
  `log_action` varchar(100) DEFAULT NULL,
  `log_uid` int(11) DEFAULT NULL,
  `log_addtime` int(11) DEFAULT NULL,
  `log_ip` varchar(50) DEFAULT NULL,
  `log_token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_log
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_material_help`
-- ----------------------------
DROP TABLE IF EXISTS `dc_material_help`;
CREATE TABLE `dc_material_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `zhuce_address` varchar(255) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_material_help
-- ----------------------------
INSERT INTO `dc_material_help` VALUES ('1', '010-56219580', '3131606120@qq.com', '131606120@qq.com', '17701056755', 'www.yinyuantianshi.com   aixintianshi.net    姻缘会.com', '爱心天使文化传播（北京）有限公司', '北京市丰台区三路居88号', '北京市门头沟区东大桥东街13号楼', 'd816a7f1a87b8386bf7728c90eea0820');

-- ----------------------------
-- Table structure for `dc_mbku_vote`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mbku_vote`;
CREATE TABLE `dc_mbku_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id编号',
  `mpid` int(10) DEFAULT NULL COMMENT '公众号标识',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `number` int(10) unsigned DEFAULT '0' COMMENT '票数',
  `description` text COMMENT '描述',
  `mobile` varchar(40) NOT NULL COMMENT '手机号码',
  `thumb` varchar(200) DEFAULT '0' COMMENT '展示图',
  `serial_number` int(10) NOT NULL COMMENT '编号',
  `content` text COMMENT '详细',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(100) DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `mpid` (`mpid`,`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_mbku_vote
-- ----------------------------
INSERT INTO `dc_mbku_vote` VALUES ('1', '16', '魔派', '15', '魔派系统网络开发', '13126726903', 'http://www.mobtop.com.cn/Uploads/Pictures/20161221/585a510e151f3.png', '0', '都快来投票吧。', '1482728173', '1482728173', '1');
INSERT INTO `dc_mbku_vote` VALUES ('2', '16', '郝云', '16', '测试专线开发研究', '13456451237', 'http://www.mobtop.com.cn/Uploads/Pictures/20161217/5854ae6bbd461.png', '0', '人生就像一场戏，因为有缘才相见。', '1482728314', '1482728314', '1');

-- ----------------------------
-- Table structure for `dc_mbku_vote_data`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mbku_vote_data`;
CREATE TABLE `dc_mbku_vote_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mpid` int(10) DEFAULT NULL COMMENT '公众号标识',
  `openid` varchar(100) NOT NULL DEFAULT '',
  `pid` int(10) unsigned DEFAULT '0',
  `ip` int(10) unsigned DEFAULT '0' COMMENT '客户端IP地址',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mpid` (`mpid`,`openid`,`pid`,`create_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_mbku_vote_data
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_message`
-- ----------------------------
DROP TABLE IF EXISTS `dc_message`;
CREATE TABLE `dc_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) DEFAULT NULL COMMENT '厂商',
  `p_name` varchar(255) DEFAULT NULL COMMENT '产品',
  `q_name` varchar(255) DEFAULT NULL COMMENT '签约公司',
  `num` int(10) DEFAULT NULL COMMENT '条数',
  `price` varchar(10) DEFAULT NULL COMMENT '价格',
  `type` varchar(32) DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_message
-- ----------------------------
INSERT INTO `dc_message` VALUES ('112', '上海创蓝文化传播有限公司', '短信验证码', '北京泰和志新软件有限公司', '100', '0.08', '3');
INSERT INTO `dc_message` VALUES ('121', '66', '1', '1', '1', '1', '66');

-- ----------------------------
-- Table structure for `dc_more_spec`
-- ----------------------------
DROP TABLE IF EXISTS `dc_more_spec`;
CREATE TABLE `dc_more_spec` (
  `s_g_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL COMMENT '商品ID',
  `g_id` varchar(11) NOT NULL COMMENT '规格ID',
  `m_price` varchar(255) NOT NULL COMMENT '多规格价格',
  `m_num` int(11) NOT NULL COMMENT '多规格库存',
  `m_sore` text NOT NULL,
  PRIMARY KEY (`s_g_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_more_spec
-- ----------------------------
INSERT INTO `dc_more_spec` VALUES ('66', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('65', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('64', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('63', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('62', '45', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('61', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('60', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('59', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('58', '45', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('57', '45', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('56', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('55', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('54', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('53', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('52', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('51', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('50', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('49', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('48', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('47', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('46', '0', '', '', '0', '');
INSERT INTO `dc_more_spec` VALUES ('45', '0', '', '', '0', '');

-- ----------------------------
-- Table structure for `dc_mp`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp`;
CREATE TABLE `dc_mp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `group_id` varchar(50) DEFAULT NULL COMMENT '可用套餐ID',
  `name` varchar(50) NOT NULL COMMENT '公众号名称',
  `origin_id` varchar(50) NOT NULL COMMENT '公众号原始ID',
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '公众号类型（1：普通订阅号；2：认证订阅号；3：普通服务号；4：认证服务号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0：禁用，1：正常，2：审核中）',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `valid_token` varchar(40) DEFAULT NULL COMMENT '接口验证Token',
  `token` varchar(50) DEFAULT NULL COMMENT '公众号标识',
  `encodingaeskey` varchar(50) DEFAULT NULL COMMENT '消息加解密秘钥',
  `appid` varchar(50) DEFAULT NULL COMMENT 'AppId',
  `appsecret` varchar(50) DEFAULT NULL COMMENT 'AppSecret',
  `mp_number` varchar(50) DEFAULT NULL COMMENT '微信号',
  `desc` text COMMENT '描述',
  `headimg` varchar(255) DEFAULT NULL COMMENT '头像',
  `qrcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  `fields` varchar(255) DEFAULT NULL,
  `numlists` varchar(255) DEFAULT NULL,
  `couponcard` varchar(255) DEFAULT NULL,
  `discountcoupon` varchar(255) DEFAULT NULL,
  `setting` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='公众号表';

-- ----------------------------
-- Records of dc_mp
-- ----------------------------
INSERT INTO `dc_mp` VALUES ('6', '6', null, '李金龙', 'gh_ad636f6735b5', '5', '1', '1480124217', 'g9FOK4B18dLqWK4ZjnCnwSeGk4RsSn9F', '31026dc52ced6e0689e240ede2b92783', 'B7rWEOvmhf0CW2cFRr8IbgYDf04ouSG01xppN70TQWC', 'wx119e7a4103920196', '80f97ddfc89bc75d82a62520ea0d9570', 'gh_ad636f6735b5', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('8', '8', null, 'gh_a8bf1b456567', 'gh_a8bf1b45655d', '5', '1', '1480124873', 'YtyueFCJy77g1orwP5blfdsog3fSOYWf', 'bbac42d3fc8187abc84cb5b4e8bbd664', 'p85f9fPByg6sweeyoSsywZRD1DtRNDeUb4uzwkYi9we', 'wxe50e0a6402ff04f7', '63385b2ff50a45fa63f7d4ded16399be', 'gh_a8bf1b45656d', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('10', '10', null, 'gh_b04e46826163', 'gh_b04e46826163', '5', '1', '1480137734', 'oxYHWpLqXwG5yAVFzQo7QmyTysrZhqap', '983ec9055f9a844b7f396e53da480425', '9GkmhvhC1AWRiSRj0msFRFg6zQNpu6E6rVIujN4BjHs', 'wx3118b3a6756a2234', 'd19bf3bc0b169a83a8ac4b65004cfc76', 'gh_b04e46826163', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('21', '4', null, '郝云', 'gh_91d03ab65dae', '111', '1', '1480399059', 'u4eaUCvO5vOgRysTisNRUIH9fklz37aP', '51601a79e8dc965f9629274be1277419', 'zEv5d65AaJvwQzxgFzSfFU3X9qsk2Dl25JmR0qBMlvh', 'wx5fb95586e2d8f491', 'aa8e6d602c4407dafc66d2a00f2cd94e', 'gh_91d03ab65dae', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('24', '11', null, 'whui360', 'gh_91d03ab65dww', '107', '1', '1480677419', 'GcaGKq7KsGLRkG7mOwGSAMA0m4O0ecle', '946b7921abe8fcba436004b5f3b0560e', '68aoqJsk9L5F2vSDz5lq1pHNGUWkTDLlofCeYAlI7nR', 'wx5fb95586e2d8f491', 'aa8e6d602c4407dafc66d2a00f2cd94e', 'gh_91d03ab65dww', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('26', '12', null, 'gh_c0d2ecb399cf', 'gh_c0d2ecb311ss', '5', '1', '1480679153', 'tXSo7KKsaHb7VzYofembDjooVKriKudV', '43425c1d7b4f388a327a3775247b8871', 'qhQY4AsVfRkSGjPjh4033Yo3LBeOIbHvzPDs1Ha24M0', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('27', '13', null, 'gh_c0d2ecb3978', 'gh_c0d2ecb3123f', '2', '1', '1480679233', 'dcDQ4MiJk47EcF9CkW63U5zuB22CYSKY', '54def2599976d1774daae926551f0311', '7ArAmsSz60pYBV8nNZRLcnEiXMO896Vgfftbioudscm', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('28', '13', null, 'gh_91d03ab65d', 'gh_91d03ab65ddd', '5', '1', '1480679279', 'IHuLfBxPqcJga4tvvrd6LPNy6LCqamO3', '5cd22c0bcda4a8e9dcee7d2e286387a0', 'hvcYtIBvsARQmwg8QQmLcVlE27hhOMb0OhKsCcnB4BB', 'wx5fb95586e2d8f491', 'aa8e6d602c4407dafc66d2a00f2cd94e', 'gh_91d03ab65dae', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('30', '13', null, '海峰', 'gh_c0d2ecb399cf', '111', '1', '1480679604', 's54ud91CHytpCDTCoe8yif1Q8oqDXYgr', 'c46392a49d59be6adc507ba51894907c', 'oepLcRLNfzQseC26crTG6zeVEpBESGwBeQLXHnqoycf', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('31', '4', null, '郝云订阅号', 'gh_1e26a5421bf5', '106', '1', '1480688536', 'hzUZHSvXXAuROyw95YCrei8jO1UGk2Sw', '5cd40b8ebc12a400b456cf79a3b6a4e8', '6Hz8JftlPpsf7sv6bUhQrfpIUYJU0Rc65popA1URUJQ', 'wxbf7cb55ed3bca7a7', '53df2eeeb0f2a1af12156be0679e14b0', 'gh_1e26a5421bf5', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('32', '4', null, '白通才', 'gh_6ad8ac95b5a9', '111', '1', '1480688662', 'KWoZqFe6DSEblIS3eRpvN5EIwp1Pnp8B', 'bb592f57a5012650de4039da21141773', 'VqilhwYD5wYU8WAWW6VuuMcVbpqfktTxNsQVPbjbIDy', 'wx5168efa0f2e9989d', '7c232ffeebdbaea39c61843a5a21aec1', 'gh_6ad8ac95b5a9', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('34', '4', null, '闫波', 'gh_a8bf1b45656d', '111', '1', '1480847549', '0U0ETvAds5BZgBEH3JOkFAPIHOniXoBl', 'bbac42d3fc8187abc84cb5b4e8bbd664', 'JGM2xIyTJkMXpXmGSPyiVkojYQ4gpnEDZqYyuZUw6ff', 'wxe50e0a6402ff04f7', '63385b2ff50a45fa63f7d4ded16399be', 'gh_a8bf1b45656d', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('35', '4', null, '未知', 'gh_9f05ca41a5c9', '111', '1', '1480847716', 'z9gxRhvv87jXZ2gowXptE9KURplleulg', '55bc01feb17d4e144d0bdbe7d6513312', 'Fbw4fLLH7D4FliTcQmZfwWB1u85Rqgzz8J5m3dbHr0f', 'wx3472c0b020d5a610', 'd4624c36b6795d1d99dcf0547af5443d', 'gh_9f05ca41a5c9', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('36', '15', '', '姻缘天使', 'gh_04df2d3fee5a', '107', '1', '1482206060', '6AjzBHVTydJVOCn2aJlvvSnBaskRdfLq', 'd816a7f1a87b8386bf7728c90eea0820', 'E5f4cPo9BkLKDzyYhj5uPaV36qkuyjDAZrFdkWF2TWy', 'wx6341088ca517af43', 'c1018e589925256c647d487d36ae3c0d', '3131606120@qq.com', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161220/5858ab62d015b.jpg', 'http://www.mobtop.com.cn/Uploads/Pictures/20161220/5858ab69b756d.jpg', '', '', null, null, null);
INSERT INTO `dc_mp` VALUES ('38', '26', '', 'G22微勤', 'gh_1364d106c10c', '107', '1', '1483409899', 'njdLiOGh5tiVGTOk2pSa4yVtpmQpgGlr', 'b6f1c1c7ed9324306a465ccd7b9b5658', 'Xi8VClMmVhEmfgs4wmPNCTNEIVnmmib0hRbX5dDkjeh', 'wxdbbeb95773643c4e', '979c07ff8367991999f87721be9d4a8a', 'ggjg22wq', '', '', '', '', '', null, null, null);
INSERT INTO `dc_mp` VALUES ('39', '29', '', 'gh_c0d2ecb399cf', 'gh_c0d2ecb39123', '111', '1', '1484014965', 'Qw9m4aOsw6LHoxb9pYl29jU7psd7NuSz', '76a4bcfc2e79b2d43f23e5c13e658bff', 'D1yePkfhBAfykLk5sH8igKcolirdFjrQjdBaG3TEMUN', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', '', '', '', '', '', null, null, null);
INSERT INTO `dc_mp` VALUES ('40', '30', null, '上海外服北京服务', 'gh_e77a460255d9', '107', '1', '1487733554', 'BPdF5IonnZtG5u1EVXoLSX308QUg7RPg', 'be3f6790b79c6880837841f665aa9805', 'QevSHmZD3HugPbSbMDBciZ8M8OFKzvtLMpM04A2aCno', 'wxd1af227728939407', '282fac6c59b3bd66d4d5903abbb4c5e8', 'efesco-bj', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('41', '31', null, '筑达劳务', 'gh_42918da1e400', '107', '1', '1488953000', '33NNQryEop8c8j4pnb6R0BOHt5XhBtx5', '3b7a29be7aa0b11ee68bdf4aecc453c4', 'pqKBtjq7dBMzyuday5sJIyUh9DsaPRur5iFvLTP0nWc', 'wx56be05be2509c24c', 'f06ebb7d73072b58f8086f591dbf8b68', 'gzzdlw', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('42', '32', null, '小狗满满', 'gh_41f76cc74205', '2', '1', '1488963848', 'DkSAhTUuyPwGhlTLhTdCBWQ5IBdzFZs7', 'aac1e83ec0fb7525abf9ae21efc19edf', 'tHZOHLMNWgqtHIcfhfN13cYSh4CUz7lYR1li4IlfObK', 'wx9a9e015126616cbe', 'eca8c0e4862c0d6c26576211e86a19ba', 'gh_41f76cc74205', null, '', '', null, null, null, null, null);
INSERT INTO `dc_mp` VALUES ('43', '1', null, '测试号', 'gh_c0d2ecb39912', '111', '1', '1489039194', 'ZHJo4fH7OyLNyCcLsh3NWhYHFF9IxPxn', '35a493b7df9ef1a720c6e97c3f649fbe', '9jO8UP5YWNGczwOGtIf8CYJzgovcfjXTBxYzpgx0meG', 'wxcf0bd813d573cf6c', 'd7c7cc59de57ad4cca0460dc853afd48', 'gh_c0d2ecb399cf', null, '', '', null, null, null, null, null);

-- ----------------------------
-- Table structure for `dc_mp_auto_reply`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_auto_reply`;
CREATE TABLE `dc_mp_auto_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `type` varchar(50) DEFAULT NULL COMMENT '回复场景',
  `reply_type` varchar(50) DEFAULT NULL COMMENT '回复类型',
  `material_id` int(10) DEFAULT NULL COMMENT '回复素材ID',
  `keyword` varchar(50) DEFAULT NULL COMMENT '绑定的关键词',
  `addon` varchar(50) DEFAULT NULL COMMENT '处理消息的插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='公众号自动回复表';

-- ----------------------------
-- Records of dc_mp_auto_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_mp_fans`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_fans`;
CREATE TABLE `dc_mp_fans` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) NOT NULL COMMENT '粉丝标识',
  `is_subscribe` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关注',
  `subscribe_time` int(10) DEFAULT NULL COMMENT '关注时间',
  `unsubscribe_time` int(10) DEFAULT NULL COMMENT '取消关注时间',
  `nickname` varchar(50) DEFAULT NULL COMMENT '粉丝昵称',
  `sex` tinyint(1) DEFAULT NULL COMMENT '粉丝性别',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '粉丝头像',
  `relname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `signature` text COMMENT '个性签名',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号',
  `is_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定',
  `language` varchar(50) DEFAULT NULL COMMENT '使用语言',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '身份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `groupid` int(10) DEFAULT NULL COMMENT '分组ID',
  `tagid_list` varchar(255) DEFAULT NULL COMMENT '标签',
  `score` float(10,2) DEFAULT '0.00' COMMENT '积分',
  `money` float(10,2) DEFAULT '0.00' COMMENT '金钱',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `location_precision` varchar(50) DEFAULT NULL COMMENT '精度',
  `fopenid` varchar(200) NOT NULL COMMENT '父级',
  `yopenid` varchar(200) NOT NULL COMMENT '爷级',
  `member` int(11) DEFAULT NULL COMMENT '会员账号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `update_time` int(11) DEFAULT NULL,
  `member_idcards` int(11) DEFAULT NULL COMMENT '会员卡号',
  `grade` int(11) DEFAULT NULL COMMENT '等级',
  `lingka_time` int(11) DEFAULT NULL COMMENT '领卡时间',
  `buycounts` int(11) DEFAULT '0' COMMENT '购买次数',
  `balance` float(10,1) DEFAULT '0.0' COMMENT '余额',
  `numlists` varchar(255) DEFAULT NULL,
  `couponcard` varchar(255) DEFAULT NULL,
  `discountcoupon` varchar(255) DEFAULT NULL,
  `setting` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member` (`member`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COMMENT='公众号粉丝表';

-- ----------------------------
-- Records of dc_mp_fans
-- ----------------------------
INSERT INTO `dc_mp_fans` VALUES ('1', '2', 'oHc_mwMN6KJsBrsLwexWCL2M8SDA', '1', '1480049596', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/3fb9pS95B0t3BAOttqEaCTtYsJ5MlZRF6TCaOEZxKSibn744esiaEHbtUXDWib9TbVefw69tAbuIh9nCTYxHS5O2cC4u0icIwJNu/0', '郝云云', '天下掉下五个字：那都不是事', '13126726903', '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('2', '3', 'ozsUCwKTPJ4fLzyKnSFbExExsntE', '1', '1480056521', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/NJR97SoHvuHfN5DA4icicIotJnyyyqQFLuuK4AFoNfZbHiaEuPHIHD5NHX33Lo7MZRznsCsSYGu7e26COwkw38C4tVhslKaQJr6/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('3', '4', 'odNdUwfLsY4FXm-vFTHC9J_QaeQU', '0', '1480077646', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/xy8GiaiaAzhibjJ7Sz9lj98vvLJbibjavWEBJo69nXNQvgC7MHqicAK1O5HAxTQm8cpanU6eDkic1YvbXjThDRNIV0Kb9au5FQhEsa/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('4', '6', 'oEcZxwBxhtjmRfuAgB01B3bi21t0', '0', '1480124339', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/feZDHulVTj7rpvemUicicPP79Cu0pu04dXUTgvOmXcCLRKGlIKozkQfNX9egNKibia20JFtmibj5cYq5JgZ6cWTydibcdEfCdhibEOu/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('5', '7', 'ozsUCwKTPJ4fLzyKnSFbExExsntE', '1', '1480124547', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/NJR97SoHvuHfN5DA4icicIotJnyyyqQFLuuK4AFoNfZbHiaEuPHIHD5NHX33Lo7MZRznsCsSYGu7e26COwkw38C4tVhslKaQJr6/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('6', '9', 'oHc_mwMN6KJsBrsLwexWCL2M8SDA', '1', '1480131777', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/3fb9pS95B0t3BAOttqEaCTtYsJ5MlZRF6TCaOEZxKSibn744esiaEHbtUXDWib9TbVefw69tAbuIh9nCTYxHS5O2cC4u0icIwJNu/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('7', '11', 'oHfHEvr3lNjw3d5gvhI8HtoJh83Y', '0', '1480146464', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/wD2c7XV3FBMhuSwPIM06kEv31cgUUZoicqUEgT8YfyFFAYdJAaJfNfMY02UXOaTEwPacXWPS5RttezE0qJxsnWenscILz8MJo/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('8', '8', 'oumRKv93n0qke3Xg1fnV85EpBH5A', '0', '1480155962', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/Hia7QtY1wtJTrdzZq4LSr1e6c54K5ia9yY2Ze9vhJiaKMMudJWcoIzn9MKwgia3rcickayORBdiaMQeoxCTRwUdxJOicLSRRg2VQ7eV/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('9', '12', 'oHc_mwMN6KJsBrsLwexWCL2M8SDA', '1', '1480301464', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/3fb9pS95B0t3BAOttqEaCTtYsJ5MlZRF6TCaOEZxKSibn744esiaEHbtUXDWib9TbVefw69tAbuIh9nCTYxHS5O2cC4u0icIwJNu/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('10', '16', 'oZ89xwGHJmxVSMpUmZCpmJYdnwCI', '1', '1482746520', null, '陈少云-公众号、小程序、企信、网', '1', 'http://wx.qlogo.cn/mmopen/YCOL3hU8ffWVk4LRkr417hBHkia1SudzhC3F7Q6ic1SmiadtCSYWhiaBQUczlZZA88afriaTicMRgjpqq1u2Ncc5NlZCsm84DEIyde/0', null, null, null, '0', 'zh_CN', '英国', '英格兰', '伦敦', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('11', '21', 'oHc_mwMN6KJsBrsLwexWCL2M8SDA', '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('12', '23', 'ozsUCwKTPJ4fLzyKnSFbExExsntE', '1', '1480406201', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/NJR97SoHvuHfN5DA4icicIotJnyyyqQFLuuK4AFoNfZbHiaEuPHIHD5NHX33Lo7MZRznsCsSYGu7e26COwkw38C4tVhslKaQJr6/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('14', '16', 'oZ89xwM-_OxRtTB8aZalXqj76N2Y', '1', '1483926685', null, '振振', '1', 'http://wx.qlogo.cn/mmopen/B4MicFMvejVFHY3diaibUibpxOJSYhsib7C3vusazjP5bX8sLUPicNp9VCcSv4fWERzxZxqsARKBrCvBNrGALYIwBOZrgYkTvkKtlW/0', null, null, null, '0', 'zh_CN', '澳大利亚', '维多利亚', '墨尔本', '', '0', '[]', '0.00', '0.00', null, null, null, 'oZ89xwOoLWJORgD7ZAW2jxl3yjHU', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('15', '16', 'oZ89xwLjSloVvRBpA2xJcRxs4F7s', '1', '1488867630', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/B4MicFMvejVGVFevqicPj1qRXWbW5WkFuzSZqDMEVMFtkyHgEIebMPNPNcZqDl78yicDZXxaUO8OAkv5Ra2AjmADCUuDdt1Pmht/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('16', '16', 'oZ89xwLWVzUYT0Xi6UsQT5pIu93w', '1', '1480845530', null, 'null', '1', 'http://wx.qlogo.cn/mmopen/GIQP5XPV4CZ5iaUIEqtv3UibqFPtFw6gqNSks7ibUAG2qmwDuGBZmhTTYqZIiaKyzUb7elBs0icQbdE5Zib5wOGxiaxchgqgxicfdvMI/0', null, null, null, '0', 'zh_CN', '中国', '河南', '许昌', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('17', '16', 'oZ89xwOiIfe74xe8nzmr_H1umt_g', '0', '1480904101', null, '龙行天下', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM48SGxpTV9HAQnDPcPwP2diaX4UrmL1JUt1ziat4GHg2bztdm09jyvtqxwbKmpT0e5jQ76pCGnIV7U7dVV34t3VsAjFBX6P9icMq0/0', null, null, null, '0', 'zh_CN', '中国', '湖北', '孝感', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('19', '16', 'oZ89xwOoLWJORgD7ZAW2jxl3yjHU', '1', '1487649353', null, '梦在深巷', '1', 'http://wx.qlogo.cn/mmopen/GIQP5XPV4CZ5iaUIEqtv3U9VhVodKRAPpVVT5ArNw9dbM8QfkyR9iaKrxkcUS44P3F9YjS1NerZohibWsLY195dZklDzVUeZ124/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', 'oZ89xwOoLWJORgD7ZAW2jxl3yjHU', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('20', '16', 'oZ89xwLcTJTR0PV0g6zy90wrj8p4', '1', '1488943247', null, '雷影', '1', 'http://wx.qlogo.cn/mmopen/B4MicFMvejVGVFevqicPj1qSIbqF7wVQ2RV1CSnOiagyKOff7iaF1FFdHs0zQwOIic8oK5LzNzK5LOBEtibv09v1u076MOHuNklnzh/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('21', '16', 'oZ89xwCiODJRrAhS_2zTlFptqB8g', '1', '1480991033', null, '王永超', '2', 'http://wx.qlogo.cn/mmopen/B4MicFMvejVGVFevqicPj1qTP2fjsdB1peIg8KARiaTpZ45ctkflD2g9nqVsjuJiczCwVsHDG5iaLhUfULibbHiaficnauVoPUOmQ0fv/0', null, null, null, '0', 'zh_CN', '所罗门群岛', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('22', '32', 'odNdUwUmaeEbdMQMLihyxs6fpPq4', '0', '1473209010', null, 'Z z m', '1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELJoTicvWfMt7mibCc0iaGFENuJxmFibXD0pjCQgibbhOYnTW17xtibyjdwNM12VfmQKOMC4o82D7ic7icaoA/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('23', '16', 'oZ89xwEPN2k0PCbHD4WrKuQO_0eU', '1', '1487816296', null, '韩冰', '2', 'http://wx.qlogo.cn/mmopen/GIQP5XPV4CZ5iaUIEqtv3U5kE70XYjfmnibfongc6GLLTplFDVEYbtvp06GmaP2F62odFzz2KhL8iaV9Bu8kSBrRUttJLOK43oI/0', null, null, null, '0', 'zh_CN', '中非共和国', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('24', '16', 'oZ89xwARBbtaBc7OG7t5kJQbTTso', '1', '1488801112', null, '阿夏PM', '2', 'http://wx.qlogo.cn/mmopen/GIQP5XPV4CZ5iaUIEqtv3Uyjo2P9WgL38dkeZebqYQD0k14aKohurHPebp8hjUZ06pUQibMeER4FPm7v8tQ7aVKJhULV9hCMdc/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('25', '21', 'oHc_mwB1TwLEb25UQQWFZpF_sFD8', '1', '1481108784', null, 'AAAAAAAAAAAAAAAAAAAAAAAAAAAA雷影', '1', 'http://wx.qlogo.cn/mmopen/3fb9pS95B0t3BAOttqEaCV0DpvCkECWHnfRX7UV64tVV6heI4SYvPkrkG2kuOVSl3y1n8n9WiceTjcgfNkMIlicyETsBJXYTxP/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', '40.026260', '116.290314', '65.000000', '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('26', '16', 'oZ89xwOPIYU1C9AwOGnVoKcSzKwI', '1', '1481551037', null, '田亭亭', '1', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0s4YcTTOatyaLfiboMoGzQ7AWDNNp1wdAqXmHWiaVHic5dNt2znr2mjQXHzMibUmBjLKVluian3Rud9zR0XvPINIwlyP/0', null, null, null, '0', 'zh_CN', '中国', '山东', '德州', '', '0', '[]', '0.00', '0.00', null, null, null, 'oZ89xwOoLWJORgD7ZAW2jxl3yjHU', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('28', '16', 'oZ89xwFamoFG56Sx0PMQ9iNZFtSM', '1', '1481871206', null, 'A_杨晓宇、', '1', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0s4YcTTOatyaKic37ticzZPnWaTzVWl07icWg5Vhds5bSPDqx0o8I1synDrLOJaV9VXq7xoQibjlj1P7voFueibBrCqB/0', null, null, null, '0', 'zh_CN', '中国', '黑龙江', '哈尔滨', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('29', '16', 'oZ89xwFC85KY_4_HlkSYKIaGAAng', '1', '1488962965', null, '安好', '2', 'http://wx.qlogo.cn/mmopen/GIQP5XPV4CYGvOfuTsw7x3M2iaGnM3HMQ9NIehxuYxYJvtPLGDmM7ADicXicXSCY4ZOz6mPg7wZnv5ZtXQXB5icsiam8XFNeLbsxf/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('30', '32', 'odNdUwfLsY4FXm-vFTHC9J_QaeQU', '0', '1480077646', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/xy8GiaiaAzhibjJ7Sz9lj98vvLJbibjavWEBJo69nXNQvgC7MHqicAK1O5HAxTQm8cpanU6eDkic1YvbXjThDRNIV0Kb9au5FQhEsa/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('31', '35', 'oHfHEvr3lNjw3d5gvhI8HtoJh83Y', '0', '1480146464', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/wD2c7XV3FBMhuSwPIM06kEv31cgUUZoicqUEgT8YfyFFAYdJAaJfNfMY02UXOaTEwPacXWPS5RttezE0qJxsnWenscILz8MJo/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('32', '16', 'oZ89xwDuD6VwBnU-bWQ1y1FwaRII', '1', '1482113540', null, '阳光男孩', '1', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0sCzQfDI5vaaxXOicE6ShVtl7XpPkibphzR2XurQnhowia03qxwPbialRdapXXaRVDagDoc8ZV8UOn5cUicfwcVVosFd/0', null, null, null, '0', 'zh_CN', '中国', '河北', '沧州', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('33', '16', 'oZ89xwGuH44hh12JuY6aPjoP8Se4', '1', '1482127451', null, '杨永丽', '2', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKOO3BJceL92hdV7Ticml0tI9aHr2po83XG2YXNniaa3hoRUibKgUHqydklItuhzjQarruoZXgBkLaibQ/0', null, null, null, '0', 'zh_CN', '中国', '山东', '临沂', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('34', '36', 'oi69PwLCJKaZtmRQ1bQH1u_DrxkI', '1', '1486533881', null, 'null', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtTFyiaLowV97W4uIUdbtNHcS5hLhAiaBHoUDQWLTO2aM1V44IhAjlickOFxgcQAGicXkhuia5GibGqny0W2CwZjWXpkM/0', null, null, null, '0', 'zh_CN', '中国', '河南', '许昌', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('35', '36', 'oi69PwKdpMppxGxA2E3xLunjcBRA', '0', '1482223411', null, '龙行天下', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6huGgWftwK5A0gNPy4JjicKFAqvAyu2MBcp3qYXZ8gzAo8ZvlCo9kRmysVp2GOS6m1NXkncMWdnZq9EVjy33tjUAmg4XTchibNk/0', null, null, null, '0', 'zh_CN', '中国', '湖北', '孝感', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('36', '36', 'oi69PwIQ8x66i0l81wHq1b5BmXWs', '1', '1482223475', null, '阳光男孩', '1', 'http://wx.qlogo.cn/mmopen/QAGf8zrFicgtPnxD7BOgk484pLkJmQ8ZLkZEHg8LuumgibicibcibHqpUSlXPvqwVwicQRPiam8bLXvjUAcFwncyia2WicCPu7dpNsVnR/0', null, null, null, '0', 'zh_CN', '中国', '河北', '沧州', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('37', '16', 'oZ89xwBL7-7v99pM6yu41bEagUl0', '1', '1482377308', null, '有爱有波哥', '1', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0s4YcTTOatyaEicVFBVvBKbD9fHcH2eaT7bDPaicqL2ajCic6Vj2mt68iaT2jOUBKaq2iacYibRZuhbPbgUicECtah0hmh/0', null, null, null, '0', 'zh_CN', '中国', '河北', '张家口', '', '0', '[]', '0.00', '0.00', null, null, null, 'oZ89xwOoLWJORgD7ZAW2jxl3yjHU', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('38', '16', 'oZ89xwGQiwKq2GdItvjx-9IUpz4E', '1', '1483585899', null, '吉祥', '1', 'http://wx.qlogo.cn/mmopen/B4MicFMvejVGVFevqicPj1qbIDwusLkXh34WWokqCfYibm6oGE6cIqXThuIZM0W63bQzOsF7lHOSIUb8rQI2CLTUOPML6vfUFsa/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('39', '16', 'oZ89xwPDOeiWOwUvRIRE9xT6J1K0', '0', '1482630847', null, '郑燕', '2', 'http://wx.qlogo.cn/mmopen/B4MicFMvejVGVFevqicPj1qQRF9BKjLgjJKKEiaYKQa8ialVzGXCffVHe3ekRmY7D8HxCybHSJ7uX1x9VKt7d5utkuHBHb2ibXR2W/0', null, null, null, '0', 'zh_CN', '澳大利亚', '维多利亚', '墨尔本', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('40', '16', 'oZ89xwBhyq1-t5NDhL1d9Eg5BD3k', '1', '1482723742', null, 'zero', '1', 'http://wx.qlogo.cn/mmopen/GIQP5XPV4CbybxLicHBFpibiaSLYLecvsV43yz9qOyZkHeQd9qWupn7RjrmJf6026pykOmxpbGcFGGmDu1vYzUnpkAHG82RvWWN/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('41', '16', 'oZ89xwAS2_A6SGTCrA-SYKuaTLIY', '1', '1482808430', null, 'Mr.思', '1', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBteezgzkFMw7WJP2aqm9ZqrTOrFXDyW6K3r4q4DibGiccpNIx8T01Txmgd2eA7mLLBJ2PbYRxOVZvg/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('42', '36', 'oi69PwJxwzDDAuKEe0XN8PZS3Ess', '1', '1482896965', null, '安好', '2', 'http://wx.qlogo.cn/mmopen/LPNwOFicAGfibhzB5sng2aAyjtB9jibbjzE8z61Bcm4nuYFEfIGF4ymxNHIfXo2icpxfK328mxciaEX4s8fDjoOOCSdwPGI8Gktyc/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('43', '36', 'oi69PwJx9JDf6m9oTi5y7AwNMbGo', '0', '1482896967', null, '陈少云-公众号、小程序、企信、网', '1', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OPP9ibap3m44fHzM2zjjYufe4mWhN8uQOEAPvYYeGK3bzjHPwODzTlXsGmPiaddaPIF7HBO4BQWySWdrSaicOpfBVia/0', null, null, null, '0', 'zh_CN', '英国', '英格兰', '伦敦', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('44', '36', 'oi69PwJM1Jowp927kNWOGuXw2WIs', '0', '1482896981', null, '大蛇', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtTFyiaLowV97XymwWtgZYUvXCau9PX1tXxuGnkS4OYibn9OCPl82sO4db8ictRg0d7a0jVeI8SqEGicsmpMXnrFIj4/0', null, null, null, '0', 'zh_CN', '中国', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('45', '36', 'oi69PwFebFKTyt2iiQKRTjyNUQwQ', '1', '1488367772', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtTFyiaLowV97eiar5Ye1oNNfd6sTopLjSQnsbJMDiaoJ6sYQjEepsBmATOdTojOGrsTicKFsak3NAWQvFj0icJaKBks/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('46', '36', 'oi69PwKjPZwZfHLlA_-DZmwHtSqk', '0', '1482897397', null, '王建', '1', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCwmAhEogGWI16LPWlM9KdlCl7jkLK1BDRlB6ScPbNMU7uxW1KNopREjFKe3Ygbn0WzNiaI4ia4AGXw/0', null, null, null, '0', 'zh_CN', '中国', '山东', '菏泽', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('47', '36', 'oi69PwMpMZf919cyxSAhqxSLelDw', '1', '1482899005', null, '振振', '1', 'http://wx.qlogo.cn/mmopen/QAGf8zrFicgtPnxD7BOgk450FiaFGcPza5ltYHrfV1tOfkzqDAkJhWlH3zyFYR137PrIXbB1TwicQia3OibVDMNianTicbK8ic1YjgTl/0', null, null, null, '0', 'zh_CN', '澳大利亚', '维多利亚', '墨尔本', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('48', '36', 'oi69PwENnXsHDLz55oq3sobQE52c', '1', '1487753462', null, '有爱有波哥', '1', 'http://wx.qlogo.cn/mmopen/QAGf8zrFicgtoAE0z5NezaObvH1rXaRwx6jFLFqRbr7enF4yYWVu2U5iaLaAPjXJLucRhDeGYvzJzSnbdzHXFicXCnqkSmM5UUM/0', null, null, null, '0', 'zh_CN', '中国', '河北', '张家口', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('49', '36', 'oi69PwCaVUiokiovAiyasFkwy5L0', '0', '1483112875', null, '玩世#不恭', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtqb7kT1rJpL8JLZXRIpaub2BSVB6YuRM5Eg2EmlzP5439o61VkuM8alUrBxMfS4bibXHsFq4YXpuH21ymYLK7eu/0', null, null, null, '0', 'zh_CN', '中国', '广东', '东莞', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('50', '36', 'oi69PwPjGnuvengASqPZdxwZorvo', '1', '1488283267', null, '爱心美姐', '2', 'http://wx.qlogo.cn/mmopen/eIicnwpOBfQbda1J68yXqSjBo0wKwLQ17LFkvBNzEFg4rIXserlFLjGpUG1nQcjVOm3X0keAj5G53p3sWf4MkPsbM3qxI1t2E/0', null, null, null, '0', 'zh_CN', '中国', '北京', '丰台', '爱心天使美姐17701056755', '2', '[2,100]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('51', '38', 'oowpPxM3YAQQiU_8RNYpdCPzGAts', '1', '1484823666', null, '振振', '1', 'http://wx.qlogo.cn/mmopen/Gx53CYJ8bNu2lMZqhgyF4ByGCGyf782tI7y0BM5cqjn0GibaicAxDkWudCcqnrmcDX7ZEZ9xz4TQNGI9fxqdVm3RiaySGgD95oe/0', null, null, null, '0', 'zh_CN', '澳大利亚', '维多利亚', '墨尔本', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('52', '16', 'oZ89xwNjWkIrlIO35aHDDx9hL_4M', '1', '1483412330', null, 'Boy、', '1', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0uohiaTZibHGtURZmfGxVJPms9hOT7hTTQ6NP4qNjjYnwMlZhKh0bH0kTgnMIHr4QBlLzuk9scXgSicja1mf2S2LkT/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('53', '38', 'oowpPxL0dhUEqtjsBVGIRXYhHYBw', '1', '1483927563', null, '郝云', '1', 'http://wx.qlogo.cn/mmopen/Gx53CYJ8bNuwmtJU7jf0LL3mYWbmibkJXWdS9m9UR6pxf8P7uw0VUZwyKl4AvWT6ibLNKVPjFK7QbxbSErxpNxKjYABW34U4qz/0', null, null, null, '0', 'zh_CN', '中国', '山西', '临汾', '', '0', '[]', '0.00', '0.00', null, null, null, 'oowpPxL0dhUEqtjsBVGIRXYhHYBw', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('54', '36', 'oi69PwDYWwx6aI1LQX_WULB8a9k8', '1', '1483420413', null, 'zero', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtqb7kT1rJpL56gNFrmbTT4wmpt1Dibxh7WxHaHHkKMsD5YXTsMasQQz4T0bogKnJ4EFBARrcdyACQY1Ks7hsoV5/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('55', '38', 'oowpPxID7IKm7yhGLb7CFFpftIuI', '1', '1483424307', null, '雷影 ', '1', 'http://wx.qlogo.cn/mmopen/Gx53CYJ8bNuwmtJU7jf0LN3ULKhOficApyEVApDU0DQPbBzEvOq7KHytBBKriaKTiakzUUONdQUbTVoV3J2NXwz4Q34o4dtHXJM/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('57', '38', 'oowpPxEiK4arLVpG0fNsmEhBu6O4', '1', '1483437023', null, 'zero', '1', 'http://wx.qlogo.cn/mmopen/XVXP17LlKpemGrzLAbRXcic25lEOa3z8xQp9bTH3dzmz1m0dib9ibs30iaKvNUjCWkDRSljicyuyMLEibGUCfCiafAQ0cJGRpWO4ibjV/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('58', '38', 'oowpPxHQGWakfMhozI93JdqFVB6w', '1', '1487841699', null, 'null', '1', 'http://wx.qlogo.cn/mmopen/XVXP17LlKpfRFTWGmlhB0uMBPr5WETWCS6v5mf9lpelxzBHtia1elZhbl1MCJM3Ohjs4yaJX80iaFicshhgBdojrGGLM0dicADibl/0', null, null, null, '0', 'zh_CN', '中国', '河南', '许昌', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('59', '38', 'oowpPxGDNr0VehUuyFGrqOx0gkG8', '1', '1483440526', null, '梦在深巷', '1', 'http://wx.qlogo.cn/mmopen/XVXP17LlKpfRFTWGmlhB0qKsJLbia3mrKOTxCEYnWJeQnq69dJEbUibp1EFcLuylbsZg1tXhqBWnB44tVjr36ft96I9J988CW4/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('60', '36', 'oi69PwNGmPzlVbVHNqKY0zu8fDCw', '1', '1488358854', null, '夏夏', '2', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtTFyiaLowV97dxogoagb6OqHS0BVP6zO7NBgMX1kvWk4ML4fO9BAY4BDrKJl7iaiajIEc0tWlnaxicEOIk3cyYhOic8/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('61', '36', 'oi69PwAcuXZn1Z5ScsdH1opeU5Oo', '0', '1483493652', null, '', '1', 'http://wx.qlogo.cn/mmopen/QAGf8zrFicgvE9uIhDPNcvjXlZYW8F6ibbv2L0ibT4gVW0vnXGPGzIYhVzgIvlP0NTe3cxZovHicbO4shEs5y7rgONIr4OOA66WC/0', null, null, null, '0', 'zh_CN', '中国', '河南', '郑州', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('62', '38', 'oowpPxPtCdTsdJ94CzpNBOcY9BAY', '1', '1483616005', null, '陈少云-公众号、小程序、企信、网', '1', 'http://wx.qlogo.cn/mmopen/LPLYlyQ5GApjUHfgC3icZXJG1ocmhFhibkeRmSy73XcRV4ZTCJxKwzsgJqPd1PSibbLr0YKO1NrCEx8klmek1PbIWmCZSqttaPg/0', null, null, null, '0', 'zh_CN', '英国', '英格兰', '伦敦', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('63', '38', 'oowpPxAkTg5nmXx5irJ-Grkqymok', '1', '1481698427', null, 'Mr.Shadow', '1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELDjXS3vp0nvYNOKU4Py3A7HVcdYPuMgiacLuXJmtm3oX9hB2WpBicBBNm24YwaCqLlUOPIsysTMyAw/0', null, null, null, '0', 'zh_CN', '美国', '夏威夷', '檀香山', '', '100', '[100,101]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('64', '38', 'oowpPxPIEp7-fQ39bU2NUMoK8JIw', '1', '1487837164', null, 'Winterreise', '1', 'http://wx.qlogo.cn/mmopen/drWXChXqfibSiahdL6fleXmHLuuhJkic7yWKeskVyqiczL6YQOiayibHHJpEhxv2uyMPDvToQC1mjzsc2tfUTcbkynQw/0', null, null, null, '0', 'zh_CN', '中国', '北京', '西城', '王彤', '100', '[100]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('65', '16', 'oZ89xwEe-4SeGv6C9cfobsEcaTwY', '0', '1484015697', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('66', '36', 'oi69PwM8z8R4rhlRelUmhFJMntr8', '1', '1472146383', null, '爱心大姐13671281593', '2', 'http://wx.qlogo.cn/mmopen/eIicnwpOBfQbda1J68yXqSpWdvpICC4tdVlZBiaqOa3OJgTgZicFGUeYRGPIQstvySsbxCibSS1eoFHK2D2QHNP4nVGxar3kpJeG/0', null, null, null, '0', 'zh_CN', '中国', '', '', '', '2', '[2,100]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('67', '38', 'oowpPxIzuoG_CKooRBABwQYYguCc', '1', '1484655142', null, '乌乐吉', '1', 'http://wx.qlogo.cn/mmopen/Gx53CYJ8bNuwmtJU7jf0LLZ830iahWIjsPicsjcCYvGVKSON7zsO98YStUOKcI2wlzWc9MvOibo8100mHVYodpycKY2IX5Pf7H0/0', null, null, null, '0', 'zh_CN', '中国', '北京', '西城', '李季祥', '100', '[100,101]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('68', '38', 'oowpPxETM9rzPhjLXvACTTsZ8M-4', '1', '1484054815', null, '峎', '1', 'http://wx.qlogo.cn/mmopen/LPLYlyQ5GArv0OlWMOszPKNpCfiaOxTyBmfQ1fP2FuP5Ba187WoTosyvu5D22BdKSDTeibbvVuETWdCxhmfDaGeL30iakqSBZCo/0', null, null, null, '0', 'zh_CN', '中国', '河南', '周口', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('69', '38', 'oowpPxPvnWdNJ-Ur2PSVuku6IYv4', '1', '1484055049', null, '阿夏PM', '2', 'http://wx.qlogo.cn/mmopen/XVXP17LlKpfRFTWGmlhB0py9byHsQQ6BLtg7ibOpD5egjRoxc1qHqldjohM1qTKl9dzOb4Cf5Aia3kzCnXsnYqAoO4Wb4licWsd/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '中科微汇项目主任', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('70', '38', 'oowpPxLynaUQR3gzpjBFC_rpBYtI', '1', '1484056927', null, 'Da•哒哒', '2', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIF3woZVAw2MtGicnj3rxA2Xra4AlKRxVeUevYVvP7CC55k8VTic6BVlh616lyWl695LEgnEwzFVlnQ/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('71', '38', 'oowpPxD8eHjVWL8L6N499wh2Mdj4', '1', '1478591995', null, '明峰', '1', 'http://wx.qlogo.cn/mmopen/Gx53CYJ8bNuwmtJU7jf0LFn5xHNEibxYJNeBK3dibHE9KJiaeey1hOtqGwwpNqBiaPUrWFXZS8dYLcy197kibib7lA3DPNvicT8mUKic/0', null, null, null, '0', 'zh_CN', '中国', '北京', '西城', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('72', '38', 'oowpPxHytaIuNPzkh_UuOlHZ3zEw', '1', '1484117769', null, 'wjhalison', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM60RIOw2xIuzdSFCTIYJrjXRzTzVLctc15qEI25Uq5Hf31aZOobus0puWprvDoSynB0QKvgp3oMaQ/0', null, null, null, '0', 'zh_CN', '中国', '北京', '西城', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('73', '38', 'oowpPxOLrw19xq4uPlE7mcQ9GzsQ', '1', '1484644498', null, 'pencil', '2', 'http://wx.qlogo.cn/mmopen/drWXChXqfibQEIG7MIjSzQnFLTiaoXau9Y2IK14ic6ogRgNyNibs8gam5owhDe345ia6fGP7cJsykibFic0rzHoM7eibXv9uTYvL1mDW/0', null, null, null, '0', 'zh_CN', '中国', '北京', '西城', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('74', '38', 'oowpPxLcF2taU4yzoM1_3G9ag9Z8', '1', '1487142523', null, '韩冰', '2', 'http://wx.qlogo.cn/mmopen/XVXP17LlKpfRFTWGmlhB0ujI3Q7DXnxwrMRweVGtfJzYjWJQEsxIX62KnKCVc9BARAKTxVxkw4HVZ8LsYuLjPnSoyj23Fr9c/0', null, null, null, '0', 'zh_CN', '中非共和国', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('75', '36', 'oi69PwJAWYOmOuGpPlt-lYlk0ayM', '1', '1484284723', null, '刘', '0', 'http://wx.qlogo.cn/mmopen/QAGf8zrFicgvf4ga6u5T27IDic8K0XgmMsSq5U1icsnmNaI9VlsCiaia2lw2zQJy9xjw1X7qELyG2ASdbVVicXP82ib6LSibkMvRtRHW/0', null, null, null, '0', 'zh_CN', '', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('76', '16', 'oZ89xwJRnhTO3gJKu6sOfEgOIOog', '0', '1484456473', null, '娶~倪 喲', '1', 'http://wx.qlogo.cn/mmopen/GIQP5XPV4CaSRXodbyjuPe31FpQibs1OS0accyFy8pdHYIiahXGPiac2w0zQYQfCMM3qtIX2sPCxWaQaC7OhxbWA6RIKoVm8L9h/0', null, null, null, '0', 'zh_CN', '中国', '广东', '清远', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('77', '38', 'oowpPxOMb8JRomg56ccw9It3v4lw', '1', '1484640758', null, '小娜', '2', 'http://wx.qlogo.cn/mmopen/LPLYlyQ5GAribXqkicg01kXoyGGicDpDu3QqfnHnic9R8wZ9XI1U7tV7jHhImPDtkLia6YOfItM8w88NInYhuUbHXd3j78Dma5deb/0', null, null, null, '0', 'zh_CN', '安哥拉', '莫希科', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('78', '38', 'oowpPxK0DDmWs-NpZemSdl7HgSSA', '1', '1484643116', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('79', '16', 'oZ89xwKftpeqzfDaVICg9f2Zr9Oo', '1', '1486460865', null, '小娜', '2', 'http://wx.qlogo.cn/mmopen/YCOL3hU8ffUE2XFMSnKheXzlUubBdlxbiaMXK8xbLxfBK1rBqrMNicE7nwQUcT0kibCMBhKDgoKo5P6w82YV0sB5KzJAd6Zh7Lo/0', null, null, null, '0', 'zh_CN', '安哥拉', '莫希科', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('80', '16', 'oZ89xwPfrx6PhqZQYCT171S6ia0g', '1', '1484816455', null, '焦糖玛奇朵', '2', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELEqKDg7AdkbjqCkKicic3sJb265d74cVbvvFUESCl1jwnvQAtgvwsz4nmuZHV07lfVwOyGNAcmButVQK9Qp5XZC3qrickxyUb98M/0', null, null, null, '0', 'zh_CN', '中国', '吉林', '长春', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('81', '36', 'oi69PwByHQSuPe4NOxvNmk1-VXxo', '1', '1488335275', null, '焦糖玛奇朵', '2', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIIszoFH4JjCbXUaqzmbF9mia2tvx04NC9lD9cL2jyx8705f76aFsJSImcHQJUUtcmWgKocZSCHpoOBEGibkSFon47WnRgeYEVRo/0', null, null, null, '0', 'zh_CN', '中国', '吉林', '长春', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('83', '38', 'oowpPxMif5caCG-1RUBTaj-3Bwpk', '1', '1484903643', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('85', '36', 'oi69PwGe5ImwXP0uIpU-AATwCZHw', '0', '1485224927', null, '又是一年枫叶红', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTt96ickfkP3ibCttQ6ExJwc4kD4XGriciaibEiaXADxagwxvviaibb5lxlKCRXxyBwym9eLVYPQIlMr2M2jvhGELaSxQP2D/0', null, null, null, '0', 'zh_CN', '中国', '河南', '平顶山', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('86', '38', 'oowpPxPNpzG0CxTGxDmzbsoryexE', '0', '1485342000', null, '鲸', '0', 'http://wx.qlogo.cn/mmopen/Gx53CYJ8bNsASnb29fajkX0I13aQz9krCZFbnFF8eWKF1sOAGAwBhnwEEpWeJJO5JhsGuejpA0yPO44MsuJZTdug2Gv6m9nB/0', null, null, null, '0', 'zh_CN', '', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('87', '36', 'oi69PwDho34gbwT5f6ENXqMctiL4', '1', '1485872381', null, '没有也许', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtTFyiaLowV97XzAPv0x55Csdn9APc0hnUrJQqLuwnqnsIUnm2D2Zjo6tXDCmfg1rhsYNvGTkhAYS5pAZicFU20ba/0', null, null, null, '0', 'zh_CN', '中国', '天津', '滨海新区', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('88', '36', 'oi69PwKjaBjMDpc9kYWReuANaMDo', '1', '1485943107', null, '自由', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM41agBE5QKZbjjCskMdj3FY5ntDXyOzFVc2LK7feicOiamBPKs4WkxMjLkicBkMMbFFEc7CRVtfib6ewA/0', null, null, null, '0', 'zh_CN', '中国', '北京', '顺义', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('89', '36', 'oi69PwDU9dWsnfwGdmGwySbidDaM', '1', '1485961500', null, '小吴', '2', 'http://wx.qlogo.cn/mmopen/QAGf8zrFicgsXrV3czZAm84onib4rB4NUkT9sicm5lJv3zcoONFceINCibWUUXvcqKra8zQ2DydWUDic8M94eQwdYYg/0', null, null, null, '0', 'zh_CN', '中国', '天津', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('90', '36', 'oi69PwLUbq_8vDWw9_PWxMDDtCrM', '0', null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('91', '38', 'oowpPxAjOMR55Inon8zEKmGoTkwo', '1', '1487837253', null, '笨笨', '1', 'http://wx.qlogo.cn/mmopen/Gx53CYJ8bNuwmtJU7jf0LBxuEaiaibxibKxlyYbuiaqYfyu97hDRPRBtnfhFIG9PbAfWBoFgHyVlYUdCExDOiaMusljrRd7TGaXuC/0', null, null, null, '0', 'zh_CN', '中国', '北京', '西城', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('92', '16', 'oZ89xwN0jzymsbSBkeU9ye-lyQOU', '0', '1486436490', null, '峎', '1', 'http://wx.qlogo.cn/mmopen/YCOL3hU8ffXMaaibibJyxaMms3OQicjnsziaKUCuzw8OBiaPfZ1VstLHF7NxAxfLKLXq5SbFclNIHxhKHaJyp5BXgC5rP1m9gaWsg/0', null, null, null, '0', 'zh_CN', '中国', '河南', '周口', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('93', '16', 'oZ89xwJQFPs5JgcMisbjneSUwQw0', '1', '1486716907', null, '语笑嫣然', '2', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0vYVVoyc1Tt5vSdFCGSLJZsotbqjWHib2tTO0gG7GUdqMRibZL7Sep16TicDWc5WnnBlLq6tbAJ2qmvvebwwiaH7STq/0', null, null, null, '0', 'zh_CN', '中国', '北京', '昌平', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('94', '36', 'oi69PwCG0a7MvITbB7W_WROAFz0E', '1', '1487644775', null, '雷影', '1', 'http://wx.qlogo.cn/mmopen/eIicnwpOBfQbda1J68yXqSncTa7iaVd9icTOzYDliagBL1FsEW87EUegBkDmhY7pQP8tK1ljDLZ9hZ523H6GmloPFV3j0nicoK6sia/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('95', '16', 'oZ89xwDMxHtd6Eh29qCd_kaGxlOU', '1', '1487061662', null, 'A卢宁', '1', 'http://wx.qlogo.cn/mmopen/YCOL3hU8ffWFtH5FwGu9UcSap2oTWyhDicjKJic2atZyp5EWJOlTyydfen1joopXKBgWo1cPJGcwB9Tw3BVaVpCA/0', null, null, null, '0', 'zh_CN', '中国', '河南', '郑州', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('96', '38', 'oowpPxKdMmZHihy0y7wm9DaUWBqY', '1', '1487076994', null, '依旧别来无恙', '1', 'http://wx.qlogo.cn/mmopen/drWXChXqfibQEIG7MIjSzQocOKEkqnED7NGwes0pm1MOpZicZg5WuFOibmSybIicicAWkib6cx9tibgxb02ibupZXHUHZ9TYdm6UrQBR/0', null, null, null, '0', 'zh_CN', '中国', '山东', '济南', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('99', '36', 'oi69PwCj6m2CBV55G3MNt_ptshCk', '1', '1487830210', null, '韩冰', '2', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtTFyiaLowV97XTfQsMCoqNapj344X2UiaXSsdog3mHtFqr3OhA1iakBqyicXwV8MCQUZ6ml8Bcw5gicbSBicJeD3PjlL/0', null, null, null, '0', 'zh_CN', '中非共和国', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('100', '36', 'oi69PwF7BVhhH1MClkvQ_h3I0t6w', '1', '1487327324', null, '@@@@@', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtqb7kT1rJpLicDsecYMh6Rsn5k3Pyfb3gNJw6MTTMhUgjBRIRYNcIAt8U4zlibsrfpOD02NaAPFtTgKPesFoY3ZW/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('101', '38', 'oowpPxASvaw3yi8Ob9b4NO621vqk', '1', '1483427551', null, '@@@@@', '1', 'http://wx.qlogo.cn/mmopen/drWXChXqfibQic1eBC9rJZzyUia9RA5jzu3BNiaBOrDrpaibCKQ3uw4HfYILLOzkklkXb2Vv5dzvaJf9DaFfGjia5NElk2nKlLevibB/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('102', '38', 'oowpPxDKXxmbTXmnfWquTfN1VXdg', '1', '1487222907', null, '杨永丽', '2', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJdnRd0wuoH7Dxp6c5YbQxKZSV3sVmZZ37qSxD4pDQ67wJ657cfQHgQNTFX8E4Gb6VYoYS23E4iazw/0', null, null, null, '0', 'zh_CN', '中国', '山东', '临沂', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('104', '36', 'oi69PwD18bjGtZBttc3GYpMAmWYU', '1', '1487308685', null, '梦在深巷', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtTFyiaLowV97ZbqKoK9bw8Z6XbaEYXL6kFU18VgyrOn87YiabEhDfdqicdJKvNmytHE6Wx3laT0tMjXwBOsOeOxG2/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('105', '36', 'oi69PwOPEqEKjs4xyhMBm3rbeH5U', '1', '1487341140', null, '筱筱', '2', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCIYq1CRJkSrlNibhFNic1mRicAKUpvFgKTticUpXVTmGdvtdtialjahibqvnricZW9GOk4iaJf5YFomqIZbw/0', null, null, null, '0', 'zh_CN', '爱尔兰', '凯里', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('106', '36', 'oi69PwMsLgkmqUa1sfcTG9XePj4E', '1', '1487628824', null, '榕春自费开创新鲜绿实验实践自愿者', '1', 'http://wx.qlogo.cn/mmopen/eIicnwpOBfQZDrUvNdhqqMvkYCjKNdRjB2mcUdBib5InVqNuM8FfibApicIn8cqj99VYjxMqAITvIPamO8hu7y4fVQ/0', null, null, null, '0', 'zh_CN', '中国', '广东', '韶关', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('107', '38', 'oowpPxJcT-Cnal61Lj4fF3N06_9s', '0', '1487646975', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('108', '38', 'oowpPxA9FhoIFEt9ZdDULLsyk440', '1', '1487840602', null, 'A_杨晓宇、', '1', 'http://wx.qlogo.cn/mmopen/drWXChXqfibQEIG7MIjSzQia3DrUBeCicf2AcA3ZzTySiavLOcGSbAweX7qlXf88cicP2ea3RV9wS2ibK5BjRMdP9d7WYmyNmUibDTX/0', null, null, null, '0', 'zh_CN', '中国', '黑龙江', '哈尔滨', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('109', '16', 'oZ89xwP5m14TNmpiKmtWJh4L_snc', '1', '1487821043', null, '娟', '1', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0s4YcTTOatyaD3n7LU6W6FUpURVXibibed8U4CJNWtgfnZ9icr2mlFT1qMUClQ03yFbG4a4pDp88Frb2Spo4RHFaK3/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('110', '38', 'oowpPxF_hsIbB4FBg997bCjRmlJc', '0', '1487833068', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('111', '36', 'oi69PwAnSjhHDjTi8SQvSYV2amKI', '1', '1488946390', null, '李俊霞', '2', 'http://wx.qlogo.cn/mmopen/QAGf8zrFicgtoAE0z5NezaJX01lorXicrhnEkNrBqibOa0jPlAWbLB9YfqlibWgKmxZzPeDLgAgLwtlOsYzyX1SvjFPIMbmHibOAF/0', null, null, null, '0', 'zh_CN', '中国', '北京', '朝阳', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('112', '36', 'oi69PwIT3oCb2E_xuKhsFBF4TpuQ', '0', '1487923581', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('113', '36', 'oi69PwDf1nXSK0exKv4lgu_BGx58', '1', '1487934672', null, 'RedRose', '2', '', null, null, null, '0', 'zh_CN', '中国', '湖北', '随州', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('114', '36', 'oi69PwDTzIGxdPKqF-2jimPJ6wow', '1', '1487988999', null, '莫失莫忘', '1', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtTFyiaLowV97f10PMwHayTBUibmZL4picic64H92XEWdOOwzmSzm0mfjPUbohIbaZyMVAgQDrWlpLaEblHvEweNicic9/0', null, null, null, '0', 'zh_CN', '中国', '北京', '朝阳', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('115', '36', 'oi69PwGkmzcK1JZEgTbtlQBi4_VU', '1', '1488178852', null, '李', '1', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6ONUE2P13fRrUiaLiatia3joCTwHIMcR5ol6UyJsFnmzYMbRMKA55qL6vM585txw2aDlnl9w436hA5Oteo3NQc1ZZu0/0', null, null, null, '0', 'zh_CN', '中国', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('117', '16', 'oZ89xwO9Mrh8Eqjsfz7CogLH3i-Y', '1', '1488263483', null, 'Bai', '1', 'http://wx.qlogo.cn/mmopen/B4MicFMvejVHhibLfLG8dHu2W3xZftk2aHZE41BJmVsibpzPBxmscc0cJMfvOsZ87KdnrB6iavicqjhcASppwxhKB64C5YIAO9X1s/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('118', '16', 'oZ89xwI_4v1H3vPv9kaX8D7I_dew', '1', '1488283783', null, '୧(﹒︠ᴗ﹒︡)୨', '1', 'http://wx.qlogo.cn/mmopen/GIQP5XPV4CZ5iaUIEqtv3U1IbAVf0GvDN9JuXicfDX5Y13WfmBZ0TUzHNnSmpNBHjpYmJ3EhjPiaOAib4AQd4O0EQENY1DbmQqibK/0', null, null, null, '0', 'zh_CN', '中国', '河北', '张家口', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('119', '16', 'oZ89xwOrGvea0gr20Wr3ZcG7QjjI', '1', '1488337862', null, '刘晓峰', '1', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0s4YcTTOatyaCEWSNl8HoINQjS8bNb5QtcfTP12I0KEHjIqeZcEm4WU0FtxibL1Oqho71JoncvOibQ2kaP4Xvka0R/0', null, null, null, '0', 'zh_CN', '中国', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('120', '38', 'oowpPxBR2xS7UuyqXiL8AVATN3OQ', '0', '1488365855', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('121', '38', 'oowpPxK6O3gDPB7cxxe-hT9-TAsY', '1', '1488373958', null, '雨丝逐梦', '1', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDibwWqsuaBrRXoqvovp1qd7bsgriaeib4Rmlax4rfdI9vFec5sY5cmOAMZ9F91vjhNWmDsUbv6qIUFQ/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('122', '16', 'oZ89xwFOdRSzHhXdARPW7N0qwfik', '0', '1488943768', null, '李俊霞', '2', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0s4YcTTOatyaKt1U1gzXDXYWCpibJfpcMWgf5NLMA25URL729DaBvia65uCJkENSkgjBl8Uobh1ibAWJnoLRrOYFC1/0', null, null, null, '0', 'zh_CN', '中国', '北京', '朝阳', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('123', '36', 'oi69PwOl_1suuyEbgOgZCqTd2YqU', '1', '1488507562', null, '金玉天使', '0', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTtqb7kT1rJpL4kj6C870dyIJN9GupIFXQynguqD3l7B8XVD7WMNWlG3bOkPNtibQdNW9CBibARaa9ybqQV7CMicCpq/0', null, null, null, '0', 'zh_CN', '', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('124', '38', 'oowpPxNubDx6-LC7OL1QHus54brU', '1', '1488532140', null, '冬\'凉', '1', 'http://wx.qlogo.cn/mmopen/Gx53CYJ8bNuwmtJU7jf0LH1pCTr3gZnFQXMiaItI92ibxibgwUu8GiaoQrJLfzyuvP75IiaaeseWFgibRn4vyeeRIxuSwxUUSQtibYO/0', null, null, null, '0', 'zh_CN', '中国', '北京', '通州', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('125', '36', 'oi69PwBg7-3Qk78fm8ZTG11f9ibc', '1', '1488532162', null, '冬\'凉', '1', 'http://wx.qlogo.cn/mmopen/eIicnwpOBfQbda1J68yXqStcTbuic0aruNezoEgHaHRkdZFwicKFmSc56HiaNtLSWeN0WKTqdYabYfG83Rd9AiazNricia4QnzWic3yc/0', null, null, null, '0', 'zh_CN', '中国', '北京', '通州', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('126', '36', 'oi69PwB2RBqFnzSBhbqY_Vxwosuk', '0', '1488639706', null, '陈星', '2', 'http://wx.qlogo.cn/mmopen/DCe8pjicmLTuIwick3NGgxCIZcwwdoREnvbQODFj19ibEXzicuta1Fgj494n7CnpqML37CTuXhQscicM5SF7iay0D0AZJa4iaJ0C12V/0', null, null, null, '0', 'zh_CN', '中国', '四川', '绵阳', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('127', '16', 'oZ89xwGmpKk8d1fuhLIScwc9Ly7o', '1', '1488797033', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('128', '16', 'oZ89xwLOIm9dR6UdikX1UDOVXTXw', '1', '1488797050', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('130', '38', 'oowpPxKnPE-8_6jX5E7I48EGAlaU', '0', '1488867441', null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('134', '16', 'oZ89xwKscWCgqZSOdCQylOAzwqYw', '1', '1488875805', null, '花开若相惜♣', '1', 'http://wx.qlogo.cn/mmopen/YCOL3hU8ffXMaaibibJyxaMmZYAF1N0FsicSVqaXbthvdS3ibibbFEF8LxD5y8TekLJBZbzBiawYdkx3YvN90XsJ3yberq6RF3bLRia/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('136', '16', 'oZ89xwCUCKp2vPIghpj2SDOH1SkE', '1', '1488878833', null, '郭岚', '2', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCDBknOUBpqUYbV9gia72gJ9d4FpLm27X4LS0ib3DhFATDODMUeyG1NdhtsXkmVT0d02vE2icibU03yGA/0', null, null, null, '0', 'zh_CN', '马达加斯加', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('140', '16', 'oZ89xwGXaSMDMZnl0SOd3e_8nQ90', '1', '1488942125', null, '天天向上', '1', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIibAKrDpPrLbbibTfG1pcWwoJTK4Q0JcHFWWicxNicKL3SKA2yRmC1qkgZkzAZxPGW3BkNeBweqic3TLg/0', null, null, null, '0', 'zh_CN', '中国澳门', '', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('141', '16', 'oZ89xwFqF7VU2Q0g15uhxtkS_Giw', '1', '1488969352', null, '@@@@@', '1', 'http://wx.qlogo.cn/mmopen/1DYrlJcCz0sCzQfDI5vaaib8M7YITFwAR82rHKlRCXNMfSVZFr9HDROr883icdWGke8fI1zuvm6en5Jy4S1hs7MiaRg2ic7UNicne/0', null, null, null, '0', 'zh_CN', '中国', '北京', '', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('142', '16', 'oZ89xwD0ijE694SDUiq7rLPHhHbc', '1', '1488936985', null, '王新', '1', 'http://wx.qlogo.cn/mmopen/GIQP5XPV4CZ5iaUIEqtv3UicWOEeYmmr55JWkoBME4VicEcnbdvATR9oYribN0fXUz7TQQwH3SF2B145nicgAwhmS6d5pNBhMnHQh/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);
INSERT INTO `dc_mp_fans` VALUES ('143', '38', 'oowpPxLYnV7ZdiQe_1eBaRLm-9xY', '1', '1488959416', null, '王新', '1', 'http://wx.qlogo.cn/mmopen/XVXP17LlKpfRFTWGmlhB0qQytibZaoz97zpEPCGic5Y7OeZgr8smquQlsZ59FWcbOcVd9kHWIiaFToiab3JNCSKXKBZvWNWGd2TQ/0', null, null, null, '0', 'zh_CN', '中国', '北京', '海淀', '', '0', '[]', '0.00', '0.00', null, null, null, '', '', null, null, null, null, null, null, '0', '0.0', null, null, null, null);

-- ----------------------------
-- Table structure for `dc_mp_group`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_group`;
CREATE TABLE `dc_mp_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) NOT NULL COMMENT '套餐名称',
  `addons` text COMMENT '可管理的插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公众号套餐表';

-- ----------------------------
-- Records of dc_mp_group
-- ----------------------------
INSERT INTO `dc_mp_group` VALUES ('1', '1', '[\"IdouDonate\",\"IdouGuestbook\"]');

-- ----------------------------
-- Table structure for `dc_mp_login`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_login`;
CREATE TABLE `dc_mp_login` (
  `uid` int(50) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) DEFAULT NULL,
  `upwd` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT '3',
  `time` datetime DEFAULT NULL,
  `cooid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_mp_login
-- ----------------------------
INSERT INTO `dc_mp_login` VALUES ('1', 'admin', '5678tyui', '3', '2016-12-05 00:00:00', '');

-- ----------------------------
-- Table structure for `dc_mp_material`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_material`;
CREATE TABLE `dc_mp_material` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `type` varchar(50) DEFAULT NULL COMMENT '素材类型',
  `content` text COMMENT '文本素材内容',
  `image` varchar(255) DEFAULT NULL COMMENT '图片素材路径',
  `title` varchar(255) DEFAULT NULL COMMENT '图文素材标题',
  `picurl` varchar(255) DEFAULT NULL COMMENT '图文素材封面',
  `url` varchar(255) DEFAULT NULL COMMENT '图文链接',
  `description` text COMMENT '图文素材描述',
  `detail` text COMMENT '图文素材详情',
  `create_time` int(10) DEFAULT NULL COMMENT '素材创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='公众号素材表';

-- ----------------------------
-- Records of dc_mp_material
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_mp_message`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_message`;
CREATE TABLE `dc_mp_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(50) NOT NULL COMMENT '用户标识',
  `msgid` varchar(50) DEFAULT NULL COMMENT '消息ID',
  `msgtype` varchar(10) NOT NULL COMMENT '消息类型',
  `content` text COMMENT '消息内容',
  `create_time` int(10) NOT NULL COMMENT '消息发送时间',
  `picurl` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `mediaid` varchar(255) DEFAULT NULL COMMENT '媒体ID',
  `format` varchar(50) DEFAULT NULL COMMENT '语音格式',
  `recognition` text COMMENT '语音识别结果',
  `thumb_mediaid` varchar(255) DEFAULT NULL COMMENT '视频消息缩略图ID',
  `location_x` float DEFAULT NULL COMMENT '地理位置纬度',
  `location_y` float DEFAULT NULL COMMENT '地理位置精度',
  `scale` int(5) DEFAULT NULL COMMENT '地图缩放大小',
  `label` varchar(50) DEFAULT NULL COMMENT '地理位置信息',
  `title` varchar(255) DEFAULT NULL COMMENT '链接消息标题',
  `description` varchar(255) DEFAULT NULL COMMENT '链接消息描述',
  `url` varchar(255) DEFAULT NULL COMMENT '链接消息地址',
  `reply_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '回复状态',
  `save_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '保存为素材状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of dc_mp_message
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_mp_payment`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_payment`;
CREATE TABLE `dc_mp_payment` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户标识',
  `orderid` varchar(255) DEFAULT NULL COMMENT '订单号',
  `create_time` int(10) DEFAULT NULL COMMENT '支付时间',
  `detail` text COMMENT '支付详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号支付配置';

-- ----------------------------
-- Records of dc_mp_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_mp_rbac_node`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_rbac_node`;
CREATE TABLE `dc_mp_rbac_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `folder` varchar(255) DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `is_show` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `attr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_mp_rbac_node
-- ----------------------------
INSERT INTO `dc_mp_rbac_node` VALUES ('3', '基本设置', 'javascript:;', '2', '', '2', '1', '0', '1483611623', '', 'data=\"icon\"');
INSERT INTO `dc_mp_rbac_node` VALUES ('4', '自动回复', 'AutoReply/keyword', '2', 'Mp', '3', '1', '1', '1480311533', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('5', '自定义菜单', 'CustomMenu/publish', '2', 'Mp', '3', '1', '1', '1480328991', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('6', '场景二维码', 'SceneQrcode/lists', '2', 'Mp', '3', '1', '1', '1480311631', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('11', '行业应用', 'javascript:;', '2', 'Mp', '0', '1', '0', '1480500661', 'icon icon-signup', 'data=\"icon\"');
INSERT INTO `dc_mp_rbac_node` VALUES ('18', '粉丝管理', 'Fans/lists', '0', 'Mp', '3', '1', '2', '1480661026', 'icon icon-job', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('19', '消息管理', 'Message/lists', '0', 'Mp', '3', '1', '2', '1480661017', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('20', '素材管理', 'Material/text', '0', 'Mp', '3', '1', '2', '1480661008', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('21', '微信支付', 'Payment/wechat', '0', 'Mp', '3', '1', '2', '1480660981', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('23', '基本设置', 'javascript:;', '0', 'Mp', '0', '1', '2', '1483671526', 'icon icon-job', 'data=\"icon\"');
INSERT INTO `dc_mp_rbac_node` VALUES ('24', '自动回复', 'AutoReply/keyword', '0', 'Mp', '23', '1', '2', '1483671565', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('25', '自定义菜单', 'CustomMenu/publish', '0', 'Mp', '23', '1', '2', '1483671608', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('26', '场景二维码', 'SceneQrcode/lists', '0', 'Mp', '23', '1', '2', '1483671635', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('27', '粉丝管理', 'Fans/lists', '0', 'Mp', '23', '1', '2', '1483671659', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('28', '消息管理', 'Message/lists', '0', 'Mp', '23', '1', '2', '1483671687', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('29', '素材管理', 'Material/text', '0', 'Mp', '23', '1', '2', '1483671717', '', null);
INSERT INTO `dc_mp_rbac_node` VALUES ('30', '微信支付', 'Payment/wechat', '0', 'Mp', '23', '1', '2', '1483671742', '', null);

-- ----------------------------
-- Table structure for `dc_mp_rule`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_rule`;
CREATE TABLE `dc_mp_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号ID',
  `addon` varchar(50) DEFAULT NULL COMMENT '插件标识',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词内容',
  `type` varchar(50) DEFAULT NULL COMMENT '触发类型',
  `entry_id` int(10) DEFAULT NULL COMMENT '功能入口ID',
  `reply_id` int(10) DEFAULT NULL COMMENT '自动回复ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='公众号响应规则';

-- ----------------------------
-- Records of dc_mp_rule
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_mp_score_record`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_score_record`;
CREATE TABLE `dc_mp_score_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号标识',
  `openid` varchar(255) NOT NULL COMMENT '粉丝openid',
  `type` varchar(50) DEFAULT 'score' COMMENT '积分类型，socre、money等',
  `source` varchar(50) DEFAULT 'system' COMMENT '积分来源，system，addon',
  `value` int(10) NOT NULL COMMENT '积分值',
  `flag` varchar(50) DEFAULT NULL COMMENT '标识，fans_bind，IdouChat',
  `remark` text COMMENT '积分说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分记录表';

-- ----------------------------
-- Records of dc_mp_score_record
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_mp_setting`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_setting`;
CREATE TABLE `dc_mp_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mpid` int(10) NOT NULL COMMENT '公众号ID',
  `name` varchar(255) NOT NULL COMMENT '配置项',
  `value` text COMMENT '配置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='公众号配置';

-- ----------------------------
-- Records of dc_mp_setting
-- ----------------------------
INSERT INTO `dc_mp_setting` VALUES ('1', '21', 'fans_init_integral', '');
INSERT INTO `dc_mp_setting` VALUES ('2', '21', 'fans_init_money', '');
INSERT INTO `dc_mp_setting` VALUES ('3', '21', 'fans_bind_on', '0');
INSERT INTO `dc_mp_setting` VALUES ('4', '16', 'appid', 'wx3c3d9d4152897668');
INSERT INTO `dc_mp_setting` VALUES ('5', '16', 'appsecret', 'b2cffba81c31b2795d803c24d814f0d5');
INSERT INTO `dc_mp_setting` VALUES ('6', '16', 'mchid', '1417759502');
INSERT INTO `dc_mp_setting` VALUES ('7', '16', 'paysignkey', 'b2cffba81c31b2795d803c24d814f0d6');
INSERT INTO `dc_mp_setting` VALUES ('8', '38', 'appid', 'wxdbbeb95773643c4e');
INSERT INTO `dc_mp_setting` VALUES ('9', '38', 'appsecret', '979c07ff8367991999f87721be9d4a8a');
INSERT INTO `dc_mp_setting` VALUES ('10', '38', 'mchid', '1406316502');
INSERT INTO `dc_mp_setting` VALUES ('11', '38', 'paysignkey', '979c07ff8367991999f87721be9d1a9a');
INSERT INTO `dc_mp_setting` VALUES ('12', '36', 'appid', 'wx6341088ca517af43');
INSERT INTO `dc_mp_setting` VALUES ('13', '36', 'appsecret', 'c1018e589925256c647d487d36ae3c0d');
INSERT INTO `dc_mp_setting` VALUES ('14', '36', 'mchid', '1382714302');
INSERT INTO `dc_mp_setting` VALUES ('15', '36', 'paysignkey', 'c1018e589925256c647d487d36ae3c6x');

-- ----------------------------
-- Table structure for `dc_mp_setting_name`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_setting_name`;
CREATE TABLE `dc_mp_setting_name` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `mpid` int(10) DEFAULT NULL COMMENT '公众号授权id',
  `settingname` varchar(255) DEFAULT NULL COMMENT '公众号设置功能',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_mp_setting_name
-- ----------------------------
INSERT INTO `dc_mp_setting_name` VALUES ('1', '16', 'headimgurl,sex');

-- ----------------------------
-- Table structure for `dc_mp_user`
-- ----------------------------
DROP TABLE IF EXISTS `dc_mp_user`;
CREATE TABLE `dc_mp_user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `nickname` varchar(200) NOT NULL COMMENT '微信名称',
  `headimgurl` varchar(200) NOT NULL COMMENT '微信头像',
  `openid` varchar(50) NOT NULL COMMENT 'openid',
  `inter_nums` int(11) DEFAULT '0' COMMENT '积分',
  `telephone` varchar(20) DEFAULT NULL,
  `mp_userid` int(10) NOT NULL COMMENT '公众号区分',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of dc_mp_user
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `dc_navigation`;
CREATE TABLE `dc_navigation` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `nav_title` varchar(100) DEFAULT NULL,
  `nav_url` varchar(100) DEFAULT NULL,
  `nav_folder` varchar(100) DEFAULT NULL,
  `nav_class` varchar(100) DEFAULT NULL,
  `nav_times` int(10) DEFAULT NULL,
  `nav_status` tinyint(1) DEFAULT NULL,
  `nav_controller` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_navigation
-- ----------------------------
INSERT INTO `dc_navigation` VALUES ('5', '网站管理', 'Wang/choose', 'Website', '', '1484826333', '1', 'Index');

-- ----------------------------
-- Table structure for `dc_newleft`
-- ----------------------------
DROP TABLE IF EXISTS `dc_newleft`;
CREATE TABLE `dc_newleft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `img1` varchar(255) DEFAULT NULL,
  `newleft` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `content` text,
  `seotitle` varchar(100) DEFAULT NULL,
  `seotextarea` varchar(255) DEFAULT NULL,
  `seonews` varchar(255) DEFAULT NULL,
  `newsname` varchar(50) DEFAULT NULL,
  `times` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_newleft
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_peerpay_config`
-- ----------------------------
DROP TABLE IF EXISTS `dc_peerpay_config`;
CREATE TABLE `dc_peerpay_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `peerpay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1代表开启代付,2代表关闭代付',
  `help_content` varchar(100) NOT NULL COMMENT '发起人求助',
  `message` varchar(100) NOT NULL COMMENT '代付人留言',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_peerpay_config
-- ----------------------------
INSERT INTO `dc_peerpay_config` VALUES ('1', '2', '突突突', '不不不不');

-- ----------------------------
-- Table structure for `dc_peerpay_content`
-- ----------------------------
DROP TABLE IF EXISTS `dc_peerpay_content`;
CREATE TABLE `dc_peerpay_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(2) NOT NULL COMMENT '1.求助者留言 2.代付者留言',
  `content` varchar(50) NOT NULL COMMENT '系统默认留言内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代付留言表';

-- ----------------------------
-- Records of dc_peerpay_content
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_privileges`
-- ----------------------------
DROP TABLE IF EXISTS `dc_privileges`;
CREATE TABLE `dc_privileges` (
  `pid` int(50) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `pcontroller` varchar(50) DEFAULT NULL,
  `paction` varchar(50) DEFAULT NULL,
  `p_fid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_privileges
-- ----------------------------
INSERT INTO `dc_privileges` VALUES ('1', '公众号管理', null, null, '0');
INSERT INTO `dc_privileges` VALUES ('2', '角色管理', null, null, '0');
INSERT INTO `dc_privileges` VALUES ('3', '权限管理', null, null, '0');
INSERT INTO `dc_privileges` VALUES ('4', '支付管理', null, null, '0');
INSERT INTO `dc_privileges` VALUES ('5', '网站管理', null, null, '0');
INSERT INTO `dc_privileges` VALUES ('12', '基本设置', 'Wang', 'options', '5');
INSERT INTO `dc_privileges` VALUES ('72', '选择模板', 'Wang', 'choose', '5');
INSERT INTO `dc_privileges` VALUES ('73', '支付管理', 'Payments', 'payments', '4');
INSERT INTO `dc_privileges` VALUES ('74', '商家管理', 'Merchat', 'lists', '4');
INSERT INTO `dc_privileges` VALUES ('75', '用户管理', 'People', 'lists', '4');
INSERT INTO `dc_privileges` VALUES ('76', '订单管理', 'Payment', 'payments', '4');
INSERT INTO `dc_privileges` VALUES ('77', '优惠管理', 'Payment', 'payments', '4');
INSERT INTO `dc_privileges` VALUES ('78', '广告管理', 'Payments', 'payments', '4');
INSERT INTO `dc_privileges` VALUES ('79', '财务管理', 'Payments', 'payments', '4');
INSERT INTO `dc_privileges` VALUES ('80', '视频直播', '', '', '0');
INSERT INTO `dc_privileges` VALUES ('81', '路演视频', 'Explain', 'lists', '80');
INSERT INTO `dc_privileges` VALUES ('82', '直播视频', 'Explain', 'lists', '80');
INSERT INTO `dc_privileges` VALUES ('83', '在线教育', 'Explain', 'lists', '80');
INSERT INTO `dc_privileges` VALUES ('84', '企信管理', null, null, '0');
INSERT INTO `dc_privileges` VALUES ('85', '工作任务', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('86', '公共信息', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('87', '客户', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('88', '销售', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('89', '服务', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('90', '合同', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('91', '人力', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('92', '行政', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('93', '会议', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('94', '物流', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('95', '档案', 'Qi', 'lists', '84');
INSERT INTO `dc_privileges` VALUES ('96', '财务', 'Qi', 'lists', '84');

-- ----------------------------
-- Table structure for `dc_rbac_access`
-- ----------------------------
DROP TABLE IF EXISTS `dc_rbac_access`;
CREATE TABLE `dc_rbac_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态',
  `own_read` tinyint(1) DEFAULT '0',
  `own_edit` tinyint(1) DEFAULT '0',
  `own_delete` tinyint(1) DEFAULT '0',
  `group_read` tinyint(1) DEFAULT '0',
  `group_edit` tinyint(1) DEFAULT '0',
  `group_delete` tinyint(1) DEFAULT '0',
  `all_read` tinyint(1) DEFAULT '0',
  `all_edit` tinyint(1) DEFAULT '0',
  `all_delete` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_rbac_access
-- ----------------------------
INSERT INTO `dc_rbac_access` VALUES ('1', '1', '0', null, '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_rbac_access` VALUES ('1', '2', '0', null, '1', '1', '1', '1', '0', '0', '0', '0', '0', '1');
INSERT INTO `dc_rbac_access` VALUES ('1', '7', '0', null, '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `dc_rbac_access` VALUES ('1', '9', '0', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `dc_rbac_access` VALUES ('1', '23', '0', null, '1', '1', '0', '0', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `dc_rbac_mp_access`
-- ----------------------------
DROP TABLE IF EXISTS `dc_rbac_mp_access`;
CREATE TABLE `dc_rbac_mp_access` (
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `mp_groups` varchar(255) DEFAULT NULL COMMENT '可使用的公众号套餐',
  `mp_count` int(5) DEFAULT NULL COMMENT '可创建公众号数',
  `register_invite_count` int(10) DEFAULT NULL COMMENT '注册邀请数',
  `addons` varchar(255) DEFAULT NULL COMMENT '插件权限'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公众号权限表';

-- ----------------------------
-- Records of dc_rbac_mp_access
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_rbac_nav`
-- ----------------------------
DROP TABLE IF EXISTS `dc_rbac_nav`;
CREATE TABLE `dc_rbac_nav` (
  `role_id` smallint(6) unsigned NOT NULL,
  `nav_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_rbac_nav
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_rbac_node`
-- ----------------------------
DROP TABLE IF EXISTS `dc_rbac_node`;
CREATE TABLE `dc_rbac_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `is_show` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `attr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_rbac_node
-- ----------------------------
INSERT INTO `dc_rbac_node` VALUES ('1', '设置管理', 'javascript:;', '2', null, '0', '1', '0', '1479382313', 'icon icon-shezhi', 'data=\"icon\"');
INSERT INTO `dc_rbac_node` VALUES ('3', '菜单管理', 'Node/lists', '2', null, '1', '1', '0', '1481351957', '', null);
INSERT INTO `dc_rbac_node` VALUES ('4', '导航管理', 'Navigation/lists', '0', null, '1', '1', '2', '1480314458', null, null);
INSERT INTO `dc_rbac_node` VALUES ('7', '权限管理', 'javascript:;', '0', null, '0', '1', '0', null, 'icon icon-user', 'data=\"icon\"');
INSERT INTO `dc_rbac_node` VALUES ('8', '公共模块', 'javascript:;', '0', null, '0', '1', '0', '1488246144', 'icon icon-job', 'data=\"icon\"');
INSERT INTO `dc_rbac_node` VALUES ('9', '角色管理', 'Role/lists', '2', null, '7', '1', '0', '1478927815', null, null);
INSERT INTO `dc_rbac_node` VALUES ('22', '用户管理', 'User/lists', '2', null, '7', '1', '0', '1478927856', null, null);
INSERT INTO `dc_rbac_node` VALUES ('64', '已安装应用', 'Addons/lists', '2', null, '63', '1', '0', '1478927884', null, null);
INSERT INTO `dc_rbac_node` VALUES ('65', '未安装应用', 'Addons/not_install', '2', null, '63', '1', '0', '1478927900', null, null);
INSERT INTO `dc_rbac_node` VALUES ('66', '设计新应用', 'Addons/add', '2', null, '63', '1', '0', '1478927911', null, null);
INSERT INTO `dc_rbac_node` VALUES ('70', '日志管理', 'javascript:;', '2', null, '0', '1', '0', '1479287002', 'icon icon-job', 'data=\"icon\"');
INSERT INTO `dc_rbac_node` VALUES ('86', '消息管理', 'javascript:;', '2', null, '0', '1', '0', '1480342011', 'icon icon-job', 'data=\"icon\"');
INSERT INTO `dc_rbac_node` VALUES ('87', '公告中心', 'Content/content', '2', null, '86', '1', '2', '1480297413', '', null);
INSERT INTO `dc_rbac_node` VALUES ('106', '引用插件', 'Addons/quote', '0', null, '63', '1', '0', '1481531729', '', null);
INSERT INTO `dc_rbac_node` VALUES ('108', '公共弹框', 'Help/phpcode', '0', null, '8', '1', '2', '1488246179', '', null);
INSERT INTO `dc_rbac_node` VALUES ('110', '公共列表', 'Help/lists', '0', null, '8', '1', '2', '1488246224', '', null);
INSERT INTO `dc_rbac_node` VALUES ('111', '公共添加', 'Help/add', '0', null, '8', '1', '2', '1488246270', '', null);
INSERT INTO `dc_rbac_node` VALUES ('112', '公共时间', 'Help/times', '0', null, '8', '1', '2', '1488267025', '', null);

-- ----------------------------
-- Table structure for `dc_rbac_nodes`
-- ----------------------------
DROP TABLE IF EXISTS `dc_rbac_nodes`;
CREATE TABLE `dc_rbac_nodes` (
  `nid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) NOT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `radio` varchar(255) DEFAULT NULL,
  `checkbox` varchar(255) DEFAULT NULL,
  `select` varchar(255) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_rbac_nodes
-- ----------------------------
INSERT INTO `dc_rbac_nodes` VALUES ('59', '卖东西1', '56', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('73', '公众号管理', '0', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('76', '角色管理', '0', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('77', '超级管理员', '76', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('78', '系统管理员', '76', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('79', '公众号管理员', '76', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('80', '网站管理员', '76', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('81', '企信管理员', '76', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('103', '1', '82', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('104', '类型', '73', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('105', '服务号', '104', null, null, null, null, null, 'Payment/add');
INSERT INTO `dc_rbac_nodes` VALUES ('106', '订阅号', '104', null, null, null, null, null, 'Payment/add');
INSERT INTO `dc_rbac_nodes` VALUES ('107', '认证服务号', '104', null, null, null, null, null, 'Payment/add');
INSERT INTO `dc_rbac_nodes` VALUES ('108', '认证订阅号', '104', null, null, null, null, null, 'Payment/add');
INSERT INTO `dc_rbac_nodes` VALUES ('109', '企业号', '104', null, null, null, null, null, 'Payment/add');
INSERT INTO `dc_rbac_nodes` VALUES ('110', '小程序', '104', null, null, null, null, null, 'Payment/add');
INSERT INTO `dc_rbac_nodes` VALUES ('111', '测试号', '104', null, null, null, null, null, 'Payment/add');
INSERT INTO `dc_rbac_nodes` VALUES ('114', '类型', '113', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('115', '服装', '114', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('116', '家具', '114', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('118', '帽子', '114', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('119', '鞋子', '114', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('122', '视频直播', '76', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('123', '工单服务', '76', null, null, null, null, null, null);
INSERT INTO `dc_rbac_nodes` VALUES ('133', '创蓝国际短信平台', '132', null, null, null, null, null, 'Payment/add');
INSERT INTO `dc_rbac_nodes` VALUES ('134', '短信接口', '0', null, null, null, null, null, 'Payment/add');
INSERT INTO `dc_rbac_nodes` VALUES ('135', '创蓝国际短信平台', '134', null, null, null, null, null, 'Payment/add');

-- ----------------------------
-- Table structure for `dc_rbac_role`
-- ----------------------------
DROP TABLE IF EXISTS `dc_rbac_role`;
CREATE TABLE `dc_rbac_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_rbac_role
-- ----------------------------
INSERT INTO `dc_rbac_role` VALUES ('1', '超级管理员', '0', '1', '拥有系统管理所有权限', 'system_manager');
INSERT INTO `dc_rbac_role` VALUES ('2', '系统管理员', '0', '1', '拥有系统后台管理权限', 'admin_manager');
INSERT INTO `dc_rbac_role` VALUES ('3', '公众号管理员', '0', '1', '拥有公众号管理权限', 'mp_manager');
INSERT INTO `dc_rbac_role` VALUES ('4', '网站管理员', '0', '1', '拥有网站管理权限', 'wangzhan_manager');
INSERT INTO `dc_rbac_role` VALUES ('5', '视频管理员', '0', '1', '拥有视频管理权限', 'explain_manager');
INSERT INTO `dc_rbac_role` VALUES ('6', '支付管理员', '0', '1', '拥有支付管理权限', 'payments_manager');
INSERT INTO `dc_rbac_role` VALUES ('7', '企信管理员', '0', '1', '拥有企信管理权限', 'project_manager');

-- ----------------------------
-- Table structure for `dc_rbac_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `dc_rbac_role_user`;
CREATE TABLE `dc_rbac_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_rbac_role_user
-- ----------------------------
INSERT INTO `dc_rbac_role_user` VALUES ('1', '1');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '4');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '7');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '8');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '9');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '10');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '11');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '12');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '13');
INSERT INTO `dc_rbac_role_user` VALUES ('1', '14');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '15');
INSERT INTO `dc_rbac_role_user` VALUES ('2', '16');
INSERT INTO `dc_rbac_role_user` VALUES ('4', '17');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '18');
INSERT INTO `dc_rbac_role_user` VALUES ('4', '19');
INSERT INTO `dc_rbac_role_user` VALUES ('4', '20');
INSERT INTO `dc_rbac_role_user` VALUES ('6', '21');
INSERT INTO `dc_rbac_role_user` VALUES ('5', '22');
INSERT INTO `dc_rbac_role_user` VALUES ('7', '23');
INSERT INTO `dc_rbac_role_user` VALUES ('7', '24');
INSERT INTO `dc_rbac_role_user` VALUES ('2', '25');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '26');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '6');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '27');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '28');
INSERT INTO `dc_rbac_role_user` VALUES ('2', '29');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '30');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '31');
INSERT INTO `dc_rbac_role_user` VALUES ('3', '32');

-- ----------------------------
-- Table structure for `dc_recommends`
-- ----------------------------
DROP TABLE IF EXISTS `dc_recommends`;
CREATE TABLE `dc_recommends` (
  `re_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_openid` varchar(255) NOT NULL COMMENT '推荐人的openid',
  `r_openid` varchar(255) NOT NULL COMMENT '被推荐的人的openid',
  PRIMARY KEY (`re_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_recommends
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_role`
-- ----------------------------
DROP TABLE IF EXISTS `dc_role`;
CREATE TABLE `dc_role` (
  `rid` int(50) NOT NULL AUTO_INCREMENT,
  `rname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_role
-- ----------------------------
INSERT INTO `dc_role` VALUES ('1', '超级管理员');
INSERT INTO `dc_role` VALUES ('2', '系统管理员');
INSERT INTO `dc_role` VALUES ('3', '公众号管理员');
INSERT INTO `dc_role` VALUES ('4', '网站管理员');

-- ----------------------------
-- Table structure for `dc_role_privileges`
-- ----------------------------
DROP TABLE IF EXISTS `dc_role_privileges`;
CREATE TABLE `dc_role_privileges` (
  `r_qid` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`r_qid`)
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_role_privileges
-- ----------------------------
INSERT INTO `dc_role_privileges` VALUES ('100', '4', '12');
INSERT INTO `dc_role_privileges` VALUES ('228', '4', '72');
INSERT INTO `dc_role_privileges` VALUES ('229', '5', '81');
INSERT INTO `dc_role_privileges` VALUES ('230', '5', '82');
INSERT INTO `dc_role_privileges` VALUES ('231', '5', '83');
INSERT INTO `dc_role_privileges` VALUES ('232', '7', '85');
INSERT INTO `dc_role_privileges` VALUES ('233', '7', '86');
INSERT INTO `dc_role_privileges` VALUES ('234', '7', '87');
INSERT INTO `dc_role_privileges` VALUES ('235', '7', '88');
INSERT INTO `dc_role_privileges` VALUES ('236', '7', '89');
INSERT INTO `dc_role_privileges` VALUES ('237', '7', '90');
INSERT INTO `dc_role_privileges` VALUES ('238', '7', '91');
INSERT INTO `dc_role_privileges` VALUES ('239', '7', '92');
INSERT INTO `dc_role_privileges` VALUES ('240', '7', '93');
INSERT INTO `dc_role_privileges` VALUES ('241', '7', '94');
INSERT INTO `dc_role_privileges` VALUES ('242', '7', '95');
INSERT INTO `dc_role_privileges` VALUES ('243', '7', '96');

-- ----------------------------
-- Table structure for `dc_system_setting`
-- ----------------------------
DROP TABLE IF EXISTS `dc_system_setting`;
CREATE TABLE `dc_system_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(255) NOT NULL COMMENT '配置项',
  `value` text COMMENT '配置值',
  `type` varchar(50) DEFAULT NULL COMMENT '配置类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='全局配置表';

-- ----------------------------
-- Records of dc_system_setting
-- ----------------------------
INSERT INTO `dc_system_setting` VALUES ('1', 'site_name', '', null);
INSERT INTO `dc_system_setting` VALUES ('2', 'site_intro', '', null);
INSERT INTO `dc_system_setting` VALUES ('3', 'site_keywords', '', null);
INSERT INTO `dc_system_setting` VALUES ('4', 'site_copyright', '', null);
INSERT INTO `dc_system_setting` VALUES ('5', 'site_icp_beian', '', null);
INSERT INTO `dc_system_setting` VALUES ('6', 'register_on', '0', null);
INSERT INTO `dc_system_setting` VALUES ('7', 'register_default_role_id', '3', null);

-- ----------------------------
-- Table structure for `dc_user`
-- ----------------------------
DROP TABLE IF EXISTS `dc_user`;
CREATE TABLE `dc_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `headimg` varchar(255) DEFAULT NULL COMMENT '头像',
  `default_mpid` int(10) DEFAULT NULL COMMENT '默认管理的公众号ID',
  `email` varchar(255) DEFAULT NULL COMMENT '用户邮箱',
  `group_id` int(11) DEFAULT NULL COMMENT '用户组',
  `register_time` int(10) NOT NULL COMMENT '注册时间',
  `industry` varchar(255) DEFAULT NULL COMMENT '行业应用',
  `primary_service` varchar(50) DEFAULT NULL COMMENT '主要业务',
  `url` varchar(100) DEFAULT NULL COMMENT '网址',
  `workname` varchar(255) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `facsimile` varchar(100) DEFAULT NULL COMMENT '传真',
  `phone` varchar(11) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  `qqnum` varchar(20) DEFAULT NULL,
  `weixinnum` varchar(50) DEFAULT NULL COMMENT '微信号',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `postal` varchar(20) DEFAULT NULL COMMENT '邮编',
  `linkman` varchar(50) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `position` tinyint(1) DEFAULT '1',
  `province` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `county` int(11) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT '0',
  `yuming` varchar(25) DEFAULT '123',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of dc_user
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_user_afficheread`
-- ----------------------------
DROP TABLE IF EXISTS `dc_user_afficheread`;
CREATE TABLE `dc_user_afficheread` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_user_afficheread
-- ----------------------------
INSERT INTO `dc_user_afficheread` VALUES ('10', '5', '1', '1');
INSERT INTO `dc_user_afficheread` VALUES ('3', '9', '1', '1');
INSERT INTO `dc_user_afficheread` VALUES ('4', '9', '3', '0');
INSERT INTO `dc_user_afficheread` VALUES ('5', '9', '4', '0');
INSERT INTO `dc_user_afficheread` VALUES ('6', '9', '6', '0');
INSERT INTO `dc_user_afficheread` VALUES ('7', '9', '7', '0');
INSERT INTO `dc_user_afficheread` VALUES ('8', '9', '8', '0');
INSERT INTO `dc_user_afficheread` VALUES ('9', '9', '9', '0');
INSERT INTO `dc_user_afficheread` VALUES ('11', '5', '3', '0');
INSERT INTO `dc_user_afficheread` VALUES ('12', '5', '4', '0');
INSERT INTO `dc_user_afficheread` VALUES ('13', '5', '6', '0');
INSERT INTO `dc_user_afficheread` VALUES ('14', '5', '7', '0');
INSERT INTO `dc_user_afficheread` VALUES ('15', '5', '8', '0');
INSERT INTO `dc_user_afficheread` VALUES ('16', '5', '9', '0');
INSERT INTO `dc_user_afficheread` VALUES ('17', '10', '1', '1');
INSERT INTO `dc_user_afficheread` VALUES ('18', '10', '4', '1');
INSERT INTO `dc_user_afficheread` VALUES ('19', '10', '6', '0');
INSERT INTO `dc_user_afficheread` VALUES ('20', '10', '7', '0');
INSERT INTO `dc_user_afficheread` VALUES ('21', '10', '8', '0');
INSERT INTO `dc_user_afficheread` VALUES ('22', '10', '9', '0');
INSERT INTO `dc_user_afficheread` VALUES ('23', '10', '10', '0');
INSERT INTO `dc_user_afficheread` VALUES ('24', '11', '1', '1');
INSERT INTO `dc_user_afficheread` VALUES ('25', '11', '4', '1');
INSERT INTO `dc_user_afficheread` VALUES ('26', '11', '6', '0');
INSERT INTO `dc_user_afficheread` VALUES ('27', '11', '7', '0');
INSERT INTO `dc_user_afficheread` VALUES ('28', '11', '8', '0');
INSERT INTO `dc_user_afficheread` VALUES ('29', '11', '9', '0');
INSERT INTO `dc_user_afficheread` VALUES ('30', '11', '10', '0');
INSERT INTO `dc_user_afficheread` VALUES ('31', '11', '11', '0');
INSERT INTO `dc_user_afficheread` VALUES ('32', '11', '12', '0');
INSERT INTO `dc_user_afficheread` VALUES ('33', '11', '13', '0');
INSERT INTO `dc_user_afficheread` VALUES ('34', '11', '14', '0');
INSERT INTO `dc_user_afficheread` VALUES ('35', '12', '1', '1');
INSERT INTO `dc_user_afficheread` VALUES ('36', '12', '4', '0');
INSERT INTO `dc_user_afficheread` VALUES ('37', '12', '6', '0');
INSERT INTO `dc_user_afficheread` VALUES ('38', '12', '7', '0');
INSERT INTO `dc_user_afficheread` VALUES ('39', '12', '8', '0');
INSERT INTO `dc_user_afficheread` VALUES ('40', '12', '11', '0');
INSERT INTO `dc_user_afficheread` VALUES ('41', '12', '12', '0');
INSERT INTO `dc_user_afficheread` VALUES ('42', '12', '13', '0');
INSERT INTO `dc_user_afficheread` VALUES ('43', '12', '14', '0');
INSERT INTO `dc_user_afficheread` VALUES ('44', '12', '15', '0');
INSERT INTO `dc_user_afficheread` VALUES ('45', '12', '16', '0');
INSERT INTO `dc_user_afficheread` VALUES ('46', '12', '19', '0');
INSERT INTO `dc_user_afficheread` VALUES ('47', '12', '20', '0');
INSERT INTO `dc_user_afficheread` VALUES ('48', '12', '21', '0');
INSERT INTO `dc_user_afficheread` VALUES ('49', '12', '22', '0');
INSERT INTO `dc_user_afficheread` VALUES ('50', '12', '23', '0');
INSERT INTO `dc_user_afficheread` VALUES ('51', '12', '24', '0');
INSERT INTO `dc_user_afficheread` VALUES ('52', '12', '25', '0');
INSERT INTO `dc_user_afficheread` VALUES ('53', '12', '26', '0');
INSERT INTO `dc_user_afficheread` VALUES ('54', '12', '27', '0');
INSERT INTO `dc_user_afficheread` VALUES ('55', '12', '28', '0');
INSERT INTO `dc_user_afficheread` VALUES ('56', '12', '29', '0');
INSERT INTO `dc_user_afficheread` VALUES ('57', '12', '30', '0');
INSERT INTO `dc_user_afficheread` VALUES ('58', '12', '31', '0');
INSERT INTO `dc_user_afficheread` VALUES ('59', '12', '32', '0');
INSERT INTO `dc_user_afficheread` VALUES ('60', '13', '1', '1');
INSERT INTO `dc_user_afficheread` VALUES ('61', '13', '4', '0');

-- ----------------------------
-- Table structure for `dc_video`
-- ----------------------------
DROP TABLE IF EXISTS `dc_video`;
CREATE TABLE `dc_video` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_path` varchar(255) NOT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_video
-- ----------------------------
INSERT INTO `dc_video` VALUES ('1', 'pre_30a237d18c50f563cba4531f1db44acf1481282124.mp4');
INSERT INTO `dc_video` VALUES ('2', 'pre_c3daba8ba04565423e12eb8cb6237b461481282142.mp4');
INSERT INTO `dc_video` VALUES ('3', 'pre_ff7a2112f8c3e3224ce8e3e26de1d9321481282154.mp4');
INSERT INTO `dc_video` VALUES ('4', 'pre_b197ffdef2ddc3308584dce7afa3661b1481789303.mp4');
INSERT INTO `dc_video` VALUES ('5', 'pre_b1300291698eadedb559786c809cc5921481790349.mp4');
INSERT INTO `dc_video` VALUES ('6', 'pre_cfa3a0bc94975cb9c346a585ccb3ad9e1481791781.mp4');
INSERT INTO `dc_video` VALUES ('7', 'pre_ef16eb9ad9476987857bb5e38d3930a31481791815.mp4');
INSERT INTO `dc_video` VALUES ('8', 'pre_f1298750ed09618717f9c10ea8d1d3b01482824105.mp4');

-- ----------------------------
-- Table structure for `dc_wang_aboutus`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_aboutus`;
CREATE TABLE `dc_wang_aboutus` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `content` text,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_aboutus
-- ----------------------------
INSERT INTO `dc_wang_aboutus` VALUES ('1', '<p>北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长夏春华女士带领团队专注移动互联网应用领域软件开发。旗下品牌“中科微汇”公司专注移动互联网创新商业模式输出，软件产品规划及移动端整体解决方案为核心，拥有一批软件开发领域10+从业经验的专业研发团队。</p><p>旗下移动端互联网开源开发平台：IOS &nbsp;\r\nMobTop，中文名称（魔派）于2016年5月上线，此云端开源平台上线，用户的开发时间缩短了30%，开创了移动领域首次模块化开发的技术革命！\r\n &nbsp; \r\n在“互联网+”战略成为企业经济增长新引擎的形式下，中科微汇洞察创业者与企业在“互联网+”进程中的不同需求，以移动互联网新商业模式创新、传统企业转型策略、企业营销互联网化与信息化指导等，依托16+年多的软件开发技术沉淀，为创业者与企业提供符合企业“移动互联网+”战略的商业模式定位，软件产品设计规划、品牌策划、软件开发以及提供线上运营的云服务，以技术创新驱动企业“互联网+”战略的落地。\r\n &nbsp; 未来，中科微汇将继续围绕以移动互联网为核心的战略目标，在移动互联网创新商业模式，产品设计、粉丝营销、大数据等业务领域做全方位快速的布局。</p><p><br/></p>', 'admin');
INSERT INTO `dc_wang_aboutus` VALUES ('4', '<p>北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。旗下品牌“中科微汇”公司专注移动互联网创新商业模式输出，软件产品规划及移动端整体解决方案为核心，拥有一批软件开发领域10+从业经验的专业研发团队。</p><p>旗下移动端互联网开源开发平台：IOS\r\n &nbsp;\r\nMobTop，中文名称（魔派）于2016年5月上线，此云端开源平台上线，用户的开发时间缩短了30%，开创了移动领域首次模块化开发的技术革命！\r\n &nbsp; \r\n在“互联网+”战略成为企业经济增长新引擎的形式下，中科微汇洞察创业者与企业在“互联网+”进程中的不同需求，以移动互联网新商业模式创新、传统企业转型策略、企业营销互联网化与信息化指导等，依托16+年多的软件开发技术沉淀，为创业者与企业提供符合企业“移动互联网+”战略的商业模式定位，软件产品设计规划、品牌策划、软件开发以及提供线上运营的云服务，以技术创新驱动企业“互联网+”战略的落地。\r\n &nbsp; 未来，中科微汇将继续围绕以移动互联网为核心的战略目标，在移动互联网创新商业模式，产品设计、粉丝营销、大数据等业务领域做全方位快速的布局。</p><p><br/></p>', 'wangzhan');
INSERT INTO `dc_wang_aboutus` VALUES ('5', '<p>张三李四王五赵六<br/></p>', 'admin');
INSERT INTO `dc_wang_aboutus` VALUES ('6', '<p>北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....</p>', 'admin');
INSERT INTO `dc_wang_aboutus` VALUES ('7', '<p>北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....北京泰和志新软件有限公司，成立于2014年5月，注册资本1000万。有董事长�....</p>', 'admin');

-- ----------------------------
-- Table structure for `dc_wang_abstracts`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_abstracts`;
CREATE TABLE `dc_wang_abstracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` text NOT NULL,
  `xiaoguo_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_abstracts
-- ----------------------------
INSERT INTO `dc_wang_abstracts` VALUES ('8', '<p>1、作为一个真正的程序员，首先应该尊重编程，热爱你所写下的程序，他是你的伙伴，而不是工具。<br/>　　2、程序员可以让步，却不可以退缩，可以羞涩，却不可以软弱，总之，程序员必须是勇敢的。<br/>　　3、编程是一种单调的生活，因此程序员比普通人需要更多的关怀，更多的友情。<br/>　　4、程序不是年轻的专利，但是，他属于年轻。<br/>　　5、没有情调，不懂浪漫，也许这是程序员的一面，但拥有朴实无华的爱是他们的另一面。<br/>　　6、一个好汉三个帮，程序员同样如此。<br/>　　7、一个100行的代码调试都可能会让程序员遇到很多挫折，所以，面对挫折，我们永远不能低头。<br/>　　8、调试完一个动态连接函数，固然值得兴奋，但真正的成功远还在无数个函数之后。<br/>　　9、程序是我的生命，但我相信爱她甚过爱我的生命。<br/>　　10、信念和目标，必须永远洋溢在程序员内心。<br/>　　11、就算我们站在群山之颠，也别忘记雄鹰依旧能从我们头顶飞过。骄傲是比用JAVA进行底层开发更可笑的东西。<br/>　　12、这句话不是很文雅，彻底鄙视那些害怕别人超越自己而拒绝回答别人问题的程序员。</p>', '0', '程序猿名言简介', 'aeacb1b60ffcf0f120e8e9164d1c10f7');
INSERT INTO `dc_wang_abstracts` VALUES ('7', '<p><strong style=\"font-size:14px\">浅谈微信营销四大实用技巧</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><table width=\"100%\"><tbody><tr class=\"firstRow\"><td><br/></td></tr><tr><td style=\"border: 1px solid rgb(233, 233, 233)\" width=\"80%\">发布时间:2016-09-21 17:38:16| &nbsp;浏览次数：<span style=\"color:#FF0000\">23</span></td></tr><tr><td><p style=\"text-align:center;text-indent:2em\"><img src=\"/ueditor/php/upload/image/20161206/1481020978123587.jpg\" alt=\"\"/> &nbsp;</p><p style=\"text-align:center;text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">随着移动互联网的发展和微信使用人数的增长，微信营销成为企业新媒体营销的首选，传统意义上的微信营销软件已经难以满足企业级用户对手机和微信管理操作的需求。顺应移动端发展趋势，微信营销手机给大家分享四大微信营销实用技巧。</span> &nbsp;</p><p style=\"text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">1.</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">主打官方大号，小号助推加粉</span> &nbsp;</p><p style=\"text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\"> 之前很多企业在尝试做微信营销的时候都是采用小号，修改签名为广告语，然后再寻找附近的人进行推广的方式。这种方式在一定时期内还是有用的，而企业用微信公众平台可以打造自己的品牌和</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">CRM</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">。而在粉丝达到</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">500</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">之后申请认证的方式进行营销更有利于企业品牌的建设，也方便企业推送信息和解答消费者的疑问，更重要的是可以借此免费搭建一个订餐平台。小号则可以通过主动寻找附近的消费者来推送大号的引粉信息，以此将粉丝导入到大号中统一管理。</span> &nbsp;</p><p style=\"text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">2.</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">打造品牌公众帐号</span> &nbsp;</p><p style=\"text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\"> 获得公众帐号登陆公众平台网站注册即可。申请了公众帐号之后在设置页面对公众帐号的头像进行更换，建议更换为店铺的招牌或者</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">logo</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">，大小以不变形可正常辨认为准。此外，微信用户信息填写店铺的相关介绍。回复设置的添加分为被添加自动回复、用户消息回复、自定义回复三种，企业可以根据自身的需要进行添加。同时建议企业需要对每天群发的信息做一个安排表，准备好文字素材和图片素材。以餐饮企业为例。一般推送的信息可以是最新的菜式推荐、饮食文化、优惠打折方面的内容。粉丝的分类管理可以针对新老顾客推送不同的信息，同时也方便回复新老顾客的提问。一旦这种人性化的贴心服务受到顾客的欢迎，触发顾客使用微信分享自己的就餐体验进而形成口碑效应，对提升企业品牌的知名度和美誉度效果极佳。</span> &nbsp;</p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\"><br/> </span> </p><p style=\"text-align:center;text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\"><img src=\"/ueditor/php/upload/image/20161206/1481020979708733.jpg\" alt=\"\"/><br/> </span> </p><p style=\"text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">3.</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">实体店面同步营销</span> &nbsp;</p><p style=\"text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\"> &nbsp;店面也是充分发挥微信营销优势的重要场地。在菜单的设计中添加二维码并采用会员制或者优惠的方式，鼓励到店消费的顾客使用手机扫描。一来可以为公众帐号增加精准的粉丝，二来也积累了一大批实际消费群体，对后期微信营销的顺利开展至关重要。店面能够使用到的宣传推广材料都可以附上二维码，当然也可以独立制作</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">x</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">架、海报、</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">DM</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">传单等材料进行宣传。</span> &nbsp;</p><p style=\"text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">4.</span><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">签到打折活动举例</span> &nbsp;</p><p style=\"text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">微信营销比较常用的就是以活动的方式吸引目标消费者参与，从而达到预期的推广目的。</span> &nbsp;</p><p style=\"text-indent:2em\"><br/> </p><p style=\"text-indent:2em\"><span style=\"font-family:&#39;Microsoft YaHei&#39;;font-size:14px\">如何根据自身情况策划一场成功的活动，前提在于企业愿不愿意为此投入一定的经费。当然，餐饮类企业借助线下店面的平台优势开展活动，所需的广告耗材成本和人力成本相对来说并没有达到不可接受的地步，相反有了缜密的计划和预算之后完全可以以小成本打造一场效果显著的活动。以签到打折活动为例，企业只需制作附有二维码和微信号的宣传海报和展架，配置专门的营销人员现场指导到店消费者使用手机扫描二维码。消费者扫描二维码并关注企业公众帐号即可收到一条确认信息，在此之前企业需要提前设置好被添加自动回复。凭借信息在埋单的时候享受优惠。为以防顾客消费之后就取消关注的情况出现，企业还可以在第一条确认信息中说明后续的优惠活动，使得顾客能够持续关注并且经常光顾。</span> &nbsp;</p></td></tr></tbody></table><p><br/></p>', '0', '兴天海园', 'aeacb1b60ffcf0f120e8e9164d1c10f7');

-- ----------------------------
-- Table structure for `dc_wang_computer`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_computer`;
CREATE TABLE `dc_wang_computer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(255) NOT NULL COMMENT '网站名称',
  `station_yuming` varchar(255) DEFAULT NULL COMMENT '网站域名',
  `img` varchar(255) DEFAULT NULL COMMENT '网站Logo',
  `station_quan` varchar(255) DEFAULT NULL COMMENT '底部版权',
  `commany_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `commany_tel` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `commany_email` varchar(255) DEFAULT NULL COMMENT '公司邮箱',
  `commany_address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `seo_name` varchar(255) DEFAULT NULL COMMENT 'SEO标题',
  `seo_guanjian` varchar(255) DEFAULT NULL COMMENT 'SEO关键词',
  `seo_info` varchar(255) DEFAULT NULL COMMENT 'SEO描述',
  `station_biean` varchar(255) DEFAULT NULL COMMENT '备案信息',
  `commany_qq` varchar(255) DEFAULT NULL,
  `token` varchar(50) NOT NULL,
  `cnzznames` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_computer
-- ----------------------------
INSERT INTO `dc_wang_computer` VALUES ('2', '中科微汇', 'www.baidu.com', 'http://www.mobtop.com.cn/Uploads/Pictures/20161223/585cf96d42f26.jpg', '', '泰和志新', '13425124521', '132412541213@com', '农大南路33号', '标题seo', '关键词', 'seo描述', '微信公众号开发', '1431042362', 'aeacb1b60ffcf0f120e8e9164d1c10f7', null, 'admin');
INSERT INTO `dc_wang_computer` VALUES ('6', '郝云云', '郝云云', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', '', '泰和志新12333333333333333333333333333333', '', '', '', '', '', '', '', '', 'asdfsdfsadfsddddddddddddddsdfdf', '', 'wangzhan');

-- ----------------------------
-- Table structure for `dc_wang_daohang`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_daohang`;
CREATE TABLE `dc_wang_daohang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `guanjian` varchar(255) NOT NULL,
  `paixu` int(11) DEFAULT NULL,
  `name_two` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `username` varchar(222) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_daohang
-- ----------------------------
INSERT INTO `dc_wang_daohang` VALUES ('1', '首页', 'index.php?s=/Station/station/indexs', '1482393418', '首页', '1', 'indexs2', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('2', '新闻', 'index.php?s=/Station/station/news', '1481594467', 'news', '2', 'news', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('3', '品牌', 'index.php?s=/Station/station/brand', '1481680469', '品牌', '3', 'brand', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('4', '产品', 'index.php?s=/Station/station/app', '1481680480', 'app', '4', 'app', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('5', '案例', 'index.php?s=/Station/station/cases', '1481680538', 'cases', '5', 'cases', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('6', '加盟', 'index.php?s=/Station/station/join', '1481680547', 'join', '7', 'join', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('7', '联系', 'index.php?s=/Station/station/call', '1481680558', 'call', '8', 'call', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('8', 'App开发', 'index.php?s=/Station/station/app', '1481680490', 'app', '8', 'App', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('9', '微信开发', 'index.php?s=/Station/station/weixin', '1481680500', 'weixin', '9', 'weixin', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('10', '网站开发', 'index.php?s=/Station/station/website', '1481680508', 'website', '10', 'website', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('11', '运营推广', 'index.php?s=/Station/station/operate', '1481680519', 'operate', '11', 'operate', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('12', '登录', 'http://wh.whui360.com/index.php?g=Home&amp;m=Index&amp;a=login', '1481680616', 'login', '12', 'login', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('13', '微信支付', 'index.php?s=/Station/station/payment', '1481680528', 'payment', '12', 'payment', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('14', '优势', 'index.php?s=/Station/station/advantage', '1481680576', 'advantage', '6', 'advantage', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'wangzhan');
INSERT INTO `dc_wang_daohang` VALUES ('15', '1', '1', '1482393554', '1', '1', '1', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', '123456');
INSERT INTO `dc_wang_daohang` VALUES ('16', '首页', 'index.php?s=/Station/station/indexs', '1482827460', '首页', '1', 'indexs', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'admin');
INSERT INTO `dc_wang_daohang` VALUES ('18', '案例', 'index.php?s=/Station/station/cases', '1482978052', '案例', '2', 'cases', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'admin');
INSERT INTO `dc_wang_daohang` VALUES ('19', '购买', 'javascript:void(0)', '1482978014', '购买', '3', 'goumai', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1', 'admin');
INSERT INTO `dc_wang_daohang` VALUES ('20', '下载', 'javascript:void(0)', '1482978085', '下载', '4', 'downland', '0', null, '1', 'admin');
INSERT INTO `dc_wang_daohang` VALUES ('21', '开发', 'javascript:void(0)', '1482978111', '开发', '5', 'begin', '0', null, '1', 'admin');
INSERT INTO `dc_wang_daohang` VALUES ('22', '社区', 'http://ask.mobtop.com.cn/', '1482982740', '社区', '6', 'shequ', '0', null, '1', 'admin');
INSERT INTO `dc_wang_daohang` VALUES ('23', '开发手册', 'javascript:void(0)', '1482978336', '开发手册', '7', 'kaifa', '0', null, '1', 'admin');

-- ----------------------------
-- Table structure for `dc_wang_daohang_copy`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_daohang_copy`;
CREATE TABLE `dc_wang_daohang_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `guanjian` varchar(255) NOT NULL,
  `paixu` int(11) DEFAULT NULL,
  `name_two` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_daohang_copy
-- ----------------------------
INSERT INTO `dc_wang_daohang_copy` VALUES ('96', '首页', 'http://www.mobtop.com.cn/index.php?s=/Station/station/indexs', '1481164165', '关于我们', '1', 'index', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('117', '新闻', 'http://www.mobtop.com.cn/index.php?s=/Station/station/news', '1481176096', '新闻中心', '5', 'news', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('89', '产品中心', 'http://www.mobtop.com.cn/index.php?s=/Station/station/news', '1481337516', '产品中心', '2', 'cpcz', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('90', 'App开发', 'http://www.mobtop.com.cn/index.php?s=/Station/station/news', '1481334584', 'app开发', '2', 'app', '89', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('86', '案例', 'http://www.mobtop.com.cn/index.php?s=/Station/station/cases', '1481176388', '案例', '7', 'cases', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('87', '品牌', 'http://www.mobtop.com.cn/index.php?s=/Station/station/brand', '1481176215', '经典案例', '8', 'jdal', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('97', '优势', 'http://www.mobtop.com.cn/index.php?s=/Station/station/advantage', '1481177325', '优势', '10', 'advantage', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('98', '加盟', 'http://www.mobtop.com.cn/index.php?s=/Station/station/join', '1481178522', '加盟', '11', 'gywm', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('116', '联系我们', 'http://www.mobtop.com.cn/index.php?s=/Station/station/call', '1481179217', '联系我们', '12', 'call me', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('120', '微信开发', 'http://www.mobtop.com.cn/index.php?s=/Station/station/weixin', '1481334622', '微信开发', '0', 'weixin', '89', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('121', '运营推广', 'http://www.mobtop.com.cn/index.php?s=/Station/station/operate', '1481337026', '运营推广', '0', 'operate', '89', null, '1');
INSERT INTO `dc_wang_daohang_copy` VALUES ('118', '网站开发', 'http://www.mobtop.com.cn/index.php?s=/Station/station/website', '1481335299', '网站开发', '0', 'website', '89', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '1');

-- ----------------------------
-- Table structure for `dc_wang_fenlei`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_fenlei`;
CREATE TABLE `dc_wang_fenlei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_fenlei
-- ----------------------------
INSERT INTO `dc_wang_fenlei` VALUES ('2', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '教育培训');
INSERT INTO `dc_wang_fenlei` VALUES ('3', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '餐饮娱乐');
INSERT INTO `dc_wang_fenlei` VALUES ('4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '母婴用品');
INSERT INTO `dc_wang_fenlei` VALUES ('5', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '贸易电商');
INSERT INTO `dc_wang_fenlei` VALUES ('6', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '美容护肤');
INSERT INTO `dc_wang_fenlei` VALUES ('7', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '新鲜水果');
INSERT INTO `dc_wang_fenlei` VALUES ('8', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '酒店旅游');
INSERT INTO `dc_wang_fenlei` VALUES ('9', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '汽车配件');
INSERT INTO `dc_wang_fenlei` VALUES ('10', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '饮品甜品');
INSERT INTO `dc_wang_fenlei` VALUES ('11', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '保险理财');
INSERT INTO `dc_wang_fenlei` VALUES ('12', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '活动票务');
INSERT INTO `dc_wang_fenlei` VALUES ('13', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '文化玩乐');
INSERT INTO `dc_wang_fenlei` VALUES ('15', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '中外名酒');
INSERT INTO `dc_wang_fenlei` VALUES ('16', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '玩具乐器');
INSERT INTO `dc_wang_fenlei` VALUES ('17', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '运动户外');
INSERT INTO `dc_wang_fenlei` VALUES ('18', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '服装鞋包');
INSERT INTO `dc_wang_fenlei` VALUES ('19', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '美妆饰品');
INSERT INTO `dc_wang_fenlei` VALUES ('20', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '家居建材');
INSERT INTO `dc_wang_fenlei` VALUES ('21', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '电脑办公');
INSERT INTO `dc_wang_fenlei` VALUES ('22', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '数码配件');
INSERT INTO `dc_wang_fenlei` VALUES ('23', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '家用电器');
INSERT INTO `dc_wang_fenlei` VALUES ('24', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '黄金珠宝');
INSERT INTO `dc_wang_fenlei` VALUES ('25', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '美容美发');
INSERT INTO `dc_wang_fenlei` VALUES ('26', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '休闲食品');
INSERT INTO `dc_wang_fenlei` VALUES ('27', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '营养辅食');
INSERT INTO `dc_wang_fenlei` VALUES ('32', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '手机数码');
INSERT INTO `dc_wang_fenlei` VALUES ('33', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '游戏话费');
INSERT INTO `dc_wang_fenlei` VALUES ('34', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '百货食品');
INSERT INTO `dc_wang_fenlei` VALUES ('35', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '生活服务');
INSERT INTO `dc_wang_fenlei` VALUES ('36', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '汽配摩托');
INSERT INTO `dc_wang_fenlei` VALUES ('37', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '包装服务');
INSERT INTO `dc_wang_fenlei` VALUES ('38', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '运输服务');
INSERT INTO `dc_wang_fenlei` VALUES ('39', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '畜牧养殖');
INSERT INTO `dc_wang_fenlei` VALUES ('40', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '到家服务');
INSERT INTO `dc_wang_fenlei` VALUES ('41', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '农机物资');
INSERT INTO `dc_wang_fenlei` VALUES ('42', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '智能设备');
INSERT INTO `dc_wang_fenlei` VALUES ('43', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '服务商品');
INSERT INTO `dc_wang_fenlei` VALUES ('44', 'd816a7f1a87b8386bf7728c90eea0820', '111');
INSERT INTO `dc_wang_fenlei` VALUES ('45', 'd816a7f1a87b8386bf7728c90eea0820', '111111');

-- ----------------------------
-- Table structure for `dc_wang_history`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_history`;
CREATE TABLE `dc_wang_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_history
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_wang_img`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_img`;
CREATE TABLE `dc_wang_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL COMMENT '图片',
  `time` int(11) NOT NULL COMMENT '时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `fenlei_id` int(11) DEFAULT NULL COMMENT '图片分类',
  `token` varchar(50) DEFAULT NULL,
  `author` varchar(255) NOT NULL COMMENT '作者',
  `dao_id` int(11) DEFAULT NULL,
  `img_name` varchar(255) NOT NULL COMMENT '图片名称',
  `img_one` varchar(255) NOT NULL,
  `img_two` varchar(255) NOT NULL,
  `anli_name` varchar(255) NOT NULL COMMENT '案例名称',
  `url` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `seotitle` varchar(255) DEFAULT NULL,
  `seonews` varchar(255) DEFAULT NULL,
  `seotextarea` varchar(255) DEFAULT NULL,
  `newsname` varchar(255) DEFAULT NULL,
  `img_three` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_img
-- ----------------------------
INSERT INTO `dc_wang_img` VALUES ('24', 'http://mjg.whqwyx.com/Uploads/Pictures/20161124/5836af8a12933.jpg', '1480044373', '0', '1', 'dd24c3bf0e129326b36e15a164bc01e7', '陈少云', '2', '5836af8a12933.jpg', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('25', 'http://mjg.whqwyx.com/Uploads/Pictures/20161124/5836bcdb170db.jpg', '1480044439', '0', '1', 'dd24c3bf0e129326b36e15a164bc01e7', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('26', 'http://mjg.whqwyx.com/Uploads/Pictures/20161124/5836af8a12933.jpg', '1480044562', '0', '3', 'dd24c3bf0e129326b36e15a164bc01e7', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('27', 'http://mjg.whqwyx.com/Uploads/Pictures/20161125/5837afe162a5e.jpg', '1480044522', '0', '2', 'dd24c3bf0e129326b36e15a164bc01e7', '陈少云', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('28', 'http://mjg.whqwyx.com/Uploads/Pictures/20161125/5837b00e5c848.jpg', '1480044561', '0', '2', 'dd24c3bf0e129326b36e15a164bc01e7', '23', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('29', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/5839509367c45.jpg', '1480151455', '0', '1', '5cd40b8ebc12a400b456cf79a3b6a4e8', '中科微汇', '2', '5839509367c45.jpg', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('41', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/58398f44a0c5b.jpg', '1480167238', '0', '2', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('34', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/583950e94c717.jpg', '1480151300', '0', '1', '5cd40b8ebc12a400b456cf79a3b6a4e8', '中科微汇', '2', '首页', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('43', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/58399112c42ae.jpg', '1480167700', '1', '3', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('42', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/583990b5bd5ca.jpg', '1480167607', '1', '3', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('38', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/583958b7513c0.jpg', '1480153278', '0', '3', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('39', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/58398e27285d1.jpg', '1480166952', '0', '2', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('40', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/58398e3b19493.jpg', '1480166972', '0', '2', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('44', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/5839915332072.jpg', '1480167764', '1', '3', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('45', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/583991c15cfda.png', '1480167895', '0', '1', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '品牌', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('64', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/5839509367c45.jpg', '1480841447', '0', '2', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '2', '', '', '', '', '', '测试', null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('53', 'http://101.201.196.201/douxin/Uploads/Pictures/20161126/583934bf755bf.jpg', '1480320952', '1', '3', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('80', 'http://www.mobtop.com.cn/Uploads/Pictures/20161206/584623898df30.jpg', '1481003733', '0', '1', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '郝云', null, '鞋帽天下', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('65', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/58398e27285d1.jpg', '1480943569', '1', '3', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '96', '', '', '', '', '', '横幅中心', null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('66', 'http://www.mobtop.com.cn/Uploads/Pictures/20161129/583d2c708236a.png', '1482289377', '0', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '2', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161129/583d2c7bc053b.png', 'http://www.mobtop.com.cn/Uploads/Pictures/20161129/583d2c884a4d1.png', '玫瑰', 'mgxy.php', null, '', '', '', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161217/5854aea195eb0.png', null);
INSERT INTO `dc_wang_img` VALUES ('67', 'http://www.mobtop.com.cn/Uploads/Pictures/20161206/5846317c8201c.jpg', '1480995202', '0', '1', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '陈少云', '2', '苍茫大海', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('59', 'http://www.mobtop.com.cn/Uploads/Pictures/20161129/583ce468138ec.png', '1480392064', '1', '4', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', '2', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161128/583bbd15dd8e5.jpg', 'http://www.mobtop.com.cn/Uploads/Pictures/20161125/5837f0be8fb46.gif', '中科微汇', 'dltx.php', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('63', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/58398f44a0c5b.jpg', '1481004596', '0', '2', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '2', '', '', '', '', '', '测试2', null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('69', 'http://www.mobtop.com.cn/Uploads/Pictures/20161201/583fbc2b81bd5.jpg', '1482289195', '0', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '5', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161129/583d2c7bc053b.png', 'http://www.mobtop.com.cn/Uploads/Pictures/20161126/58399112c42ae.jpg', '泰和志新', 'http://www.baidu.com', null, '', '', '', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161209/584a0dfe68b05.png', null);
INSERT INTO `dc_wang_img` VALUES ('78', 'http://www.mobtop.com.cn/Uploads/Pictures/20161206/5846317c8201c.jpg', '1480995246', '0', '1', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '郝云', null, '服装天下', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('74', 'http://www.mobtop.com.cn/Uploads/Pictures/20161206/5846317c8201c.jpg', '1480995254', '0', '1', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '郝云云', '2', '魔派软件', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('76', 'http://www.mobtop.com.cn/Uploads/Pictures/20161204/5843dec449208.jpg', '1480904557', '0', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '5', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161129/583d2c7bc053b.png', 'http://www.mobtop.com.cn/Uploads/Pictures/20161204/5843e593155e0.png', '郝云', 'http://www.mobtop.com.cn', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('77', 'http://www.mobtop.com.cn/Uploads/Pictures/20161206/5846317c8201c.jpg', '1480995264', '0', '1', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '郝云', null, '泰和志新', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('81', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', '1481192714', '0', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '5', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/5848ff7f7aee8.jpg', 'http://www.mobtop.com.cn/Uploads/Pictures/20161207/5847cd4d516f1.png', '案例详情', 'http://www.mobtop.com.cn', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('82', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', '1481505687', '0', '1', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '郝云', null, '微信营销', '', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('84', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', '1481509912', '0', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '3', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161209/584a0dfe68b05.png', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/5848ff7f7aee8.jpg', '测试案例', 'www.baidu.com', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('85', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', '1481700022', '0', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '2', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/58492bf5a262a.jpg', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', '专线数据', 'http：//www.baidu.com', null, null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('86', 'http://www.mobtop.com.cn/Uploads/Pictures/20161209/584a152b3d90a.jpg', '1482289257', '0', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '3', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/58492cf74e188.png', '风一样的男子', 'http://www.baidu.com', null, '', '', '', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161217/5854aea195eb0.png', null);
INSERT INTO `dc_wang_img` VALUES ('87', 'http://www.mobtop.com.cn/Uploads/Pictures/20161212/584e63fd4f39b.gif', '1481700321', '0', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '2', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/58493033cb884.jpg', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', '787897', 'http://www.baidu.com', null, null, 'aaaa', null, 'aaaaaa ', null, null);
INSERT INTO `dc_wang_img` VALUES ('88', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', '1481700583', '0', '4', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '2', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/5848ffaf2468b.jpg', '', 'bbbbbbb', 'http://www.baidu.com', null, null, '123', '12', '12', null, null);
INSERT INTO `dc_wang_img` VALUES ('90', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', '1482398407', '0', '1', null, '1', null, '223', '', '', '', '', null, null, null, null, null, null, 'wangzhan');
INSERT INTO `dc_wang_img` VALUES ('91', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', '1482398696', '0', '1', null, '1134234', null, '123423', '', '', '', '', null, null, null, null, null, null, 'wangzhan');
INSERT INTO `dc_wang_img` VALUES ('94', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', '1482399078', '0', '2', null, '', null, '', '', '', '', '', '网站幻灯片', null, null, null, null, null, 'wangzhan');
INSERT INTO `dc_wang_img` VALUES ('95', 'http://www.mobtop.com.cn/Uploads/Pictures/20161212/584e640f5a400.gif', '1482399393', '1', '3', 'aeacb1b60ffcf0f120e8e9164d1c10f7', '', '16', '', '', '', '', '', '阿萨德', null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('96', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', '1482400489', '1', '3', null, '', '1', '', '', '', '', '', '123123', null, null, null, null, null, null);
INSERT INTO `dc_wang_img` VALUES ('97', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585ba3904ab52.jpg', '1482400658', '1', '3', null, '', '1', '', '', '', '', '', '北京泰和志新科技有限公司', null, null, null, null, null, 'wangzhan');
INSERT INTO `dc_wang_img` VALUES ('100', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585ba3904ab52.jpg', '1482402219', '0', '4', null, '', '0', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585ba3904ab52.jpg', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaa', null, '', '', '', '', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585ba3904ab52.jpg', 'wangzhan');
INSERT INTO `dc_wang_img` VALUES ('101', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', '1482402287', '0', '4', null, '', '0', '', '', '', '222222222222222222', '', null, '', '', '', '', '', 'wangzhan');
INSERT INTO `dc_wang_img` VALUES ('112', 'http://localhost/mobtop2/Uploads/Pictures/20170310/58c260364d348.jpg', '1489133628', '0', '1', null, '郝云', null, '巨幕', '', '', '', '', null, null, null, null, null, null, 'admin');
INSERT INTO `dc_wang_img` VALUES ('111', 'http://www.mobtop.com.cn/Uploads/Pictures/20170103/586b4e53442ca.jpg', '0', '1', null, null, '', null, '轮播一', '', '', '', '', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `dc_wang_investment`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_investment`;
CREATE TABLE `dc_wang_investment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(10) DEFAULT NULL,
  `content` text,
  `pid` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_investment
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_wang_kaifa`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_kaifa`;
CREATE TABLE `dc_wang_kaifa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_kaifa
-- ----------------------------
INSERT INTO `dc_wang_kaifa` VALUES ('4', '成交型', null);
INSERT INTO `dc_wang_kaifa` VALUES ('3', '展示型', null);
INSERT INTO `dc_wang_kaifa` VALUES ('5', '互动型', null);
INSERT INTO `dc_wang_kaifa` VALUES ('6', '推广型', null);
INSERT INTO `dc_wang_kaifa` VALUES ('7', '服务型', null);
INSERT INTO `dc_wang_kaifa` VALUES ('8', '其他', null);

-- ----------------------------
-- Table structure for `dc_wang_link`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_link`;
CREATE TABLE `dc_wang_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) NOT NULL COMMENT '链接名称',
  `link_url` varchar(255) NOT NULL COMMENT '链接地址',
  `status` int(10) NOT NULL COMMENT '显示状态',
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '唯一标识',
  `img` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_link
-- ----------------------------
INSERT INTO `dc_wang_link` VALUES ('10', '微汇支付', 'www.dllm.cn', '0', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', null);
INSERT INTO `dc_wang_link` VALUES ('9', '中科微汇', 'www.whui360.com', '0', '5cd40b8ebc12a400b456cf79a3b6a4e8', '', null);
INSERT INTO `dc_wang_link` VALUES ('13', '关于我们', 'http://www.mobtop.com.cn/index.php?s=/Station/station/all', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', 'http://www.mobtop.com.cn/Uploads/Pictures/20161206/5846224c7fab8.jpg', null);
INSERT INTO `dc_wang_link` VALUES ('14', '隐私条款', 'http://www.mobtop.com.cn/index.php?s=/Station/station/privacy', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', 'http://www.mobtop.com.cn/Uploads/Pictures/20161205/584508a325ea8.jpg', null);
INSERT INTO `dc_wang_link` VALUES ('15', '联系我们', 'http://www.mobtop.com.cn/index.php?s=/Station/station/call', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', null);
INSERT INTO `dc_wang_link` VALUES ('16', '法律声明', 'http://www.mobtop.com.cn/index.php?s=/Station/station/law', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/5848ffaf2468b.jpg', null);
INSERT INTO `dc_wang_link` VALUES ('17', '技术支持', 'http://www.mobtop.com.cn/index.php?s=/Station/station/support', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/5848ffaf2468b.jpg', null);
INSERT INTO `dc_wang_link` VALUES ('18', '加入我们', 'http://www.mobtop.com.cn/index.php?s=/Station/station/joinus', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/584906ae68c8c.jpg', null);
INSERT INTO `dc_wang_link` VALUES ('20', 'aaaaa', 'aaaaaaaaaaaa', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', 'http://www.mobtop.com.cn/Uploads/Pictures/20161211/584cf4aeb5050.jpg', null);
INSERT INTO `dc_wang_link` VALUES ('21', 'asssssssssssssss123', 'aaaaaaaaaaaaaaaa', '0', 'aeacb1b60ffcf0f120e8e9164d1c10f7', 'http://www.mobtop.com.cn/Uploads/Pictures/20161212/584e63d2d9612.gif', 'admin');
INSERT INTO `dc_wang_link` VALUES ('22', 'asdfsdf', 'aaaaaaaaaaaaaaaa', '0', '12314564545', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', 'wangzhan');
INSERT INTO `dc_wang_link` VALUES ('23', '122222222222222', '1111111111111111111', '0', 'asdfsdfsadfsdf', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', 'wangzhan');

-- ----------------------------
-- Table structure for `dc_wang_message`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_message`;
CREATE TABLE `dc_wang_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT '0',
  `names` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_message
-- ----------------------------
INSERT INTO `dc_wang_message` VALUES ('1', '郝云云', '13126726903@163.com', '13126726903', '郝云云测试', '0', 'admin');
INSERT INTO `dc_wang_message` VALUES ('2', '郝云云', '13126726903@163.com', '13126726903', '郝云云测试', '1', 'admin');
INSERT INTO `dc_wang_message` VALUES ('3', '任海峰', 'renhaifeng@163.com', '13126726903', '北京泰和志新科技有限公司', '0', 'admin');
INSERT INTO `dc_wang_message` VALUES ('4', '柴振兴', 'chaizhengxing@163.com', '13126726903', '柴振兴信息提交测试\r\n北京泰和志新科技有限公司', '1', 'admin');
INSERT INTO `dc_wang_message` VALUES ('5', '董蕾', 'donglei@163.com', '13126726903', '董蕾测试专线联系', '0', 'admin');
INSERT INTO `dc_wang_message` VALUES ('6', '闫波', '13126726903@163.com', '13126726903', 'mobtop积分商城模块开发', '1', 'admin');

-- ----------------------------
-- Table structure for `dc_wang_moban`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_moban`;
CREATE TABLE `dc_wang_moban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jibenshezhi_id` varchar(255) NOT NULL,
  `daohang_id` varchar(255) NOT NULL,
  `sucai_id` varchar(255) NOT NULL,
  `gongneng_id` varchar(255) DEFAULT NULL,
  `shouye_id` varchar(255) DEFAULT NULL,
  `hengfu_id` varchar(255) DEFAULT NULL,
  `jingdian_id` varchar(255) DEFAULT NULL,
  `youqing_id` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `panduan` int(11) DEFAULT '2' COMMENT '1-模板',
  `moban_title` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `sucai_id` (`sucai_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_moban
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_wang_newcentersetting`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_newcentersetting`;
CREATE TABLE `dc_wang_newcentersetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_newcentersetting
-- ----------------------------
INSERT INTO `dc_wang_newcentersetting` VALUES ('1', '最新公告', null, null);
INSERT INTO `dc_wang_newcentersetting` VALUES ('2', '公司新闻', null, null);
INSERT INTO `dc_wang_newcentersetting` VALUES ('3', '行业新闻', null, null);
INSERT INTO `dc_wang_newcentersetting` VALUES ('4', '联系我们', null, null);
INSERT INTO `dc_wang_newcentersetting` VALUES ('5', '展会直达', null, null);
INSERT INTO `dc_wang_newcentersetting` VALUES ('6', '众筹计划', null, null);
INSERT INTO `dc_wang_newcentersetting` VALUES ('7', '区域试用', null, null);
INSERT INTO `dc_wang_newcentersetting` VALUES ('8', '展示型', null, null);
INSERT INTO `dc_wang_newcentersetting` VALUES ('9', '成交型', null, null);

-- ----------------------------
-- Table structure for `dc_wang_news`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_news`;
CREATE TABLE `dc_wang_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(255) NOT NULL COMMENT '新闻标题',
  `news_jieshao` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `news_info` text NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `seotitle` varchar(255) DEFAULT NULL,
  `seotextarea` varchar(255) DEFAULT NULL,
  `seonews` varchar(255) DEFAULT NULL,
  `newsname` varchar(255) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_news
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_wang_question`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_question`;
CREATE TABLE `dc_wang_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `question` text,
  `time` int(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_question
-- ----------------------------
INSERT INTO `dc_wang_question` VALUES ('15', '在购买儿童座椅时，我需要注意哪些?', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/5848ffaf2468b.jpg', '<p style=\"margin-left:0;text-indent:0;text-align:left;background:#FFFFFF\"><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">考虑到种类繁多的儿童座椅安装系统，您需要从零售商那里寻求专业的指导。</span><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">斯迪姆/SIDM</span><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">以其多年的技能，高技术的人才，尖端的科技，深受新老客户的喜爱。</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">1.儿童座椅的必须适合小孩的重量和大小（座椅的高度和宽度）</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">2.座椅必须经过测试并且通过</span><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">3C/</span><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">ECE规定的标准（查看座椅上的标签）</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">3.尽量在购买座椅前在您车内试安装，以确保购买到合适的座椅。</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">4.宝宝坐在座椅上应该是舒适的，如果宝宝在座椅内不舒服，并且转移您开车注意力的话，那么再漂亮的座椅也没用</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">5.座椅最好是能用车内安全带轻易地安装，从而节省您的时间和精力</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">6.座椅最好是方便小孩上下座椅的</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">7.座椅是否经过</span><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">国内或欧洲的</span><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">机构测试</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">8.座椅是否配件详细的使用说明？</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">座椅必须强制使用-您孩子的安全高于一切。座椅可以有效预防车祸对孩子的伤害，同时也可以培养孩子正确的坐姿。</span></p><p><br/></p>', '1481609120', null);
INSERT INTO `dc_wang_question` VALUES ('16', '对宝宝来说，车内的哪个位置是最安全的?', 'http://www.mobtop.com.cn/Uploads/Pictures/20161208/5848ff7f7aee8.jpg', '<p style=\"margin-left:0;text-indent:0;text-align:left;background:#FFFFFF\"><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">基本上是第二排的座位，如果可能的话，中间的位置最好，为什么呢？这个位置是碰撞到概率最少的。</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">第二安全的位置是正驾的后面。请注意：</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">1）许多车内第二排中间位置只有两点式安全带，</span><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">斯迪姆</span><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">/SIDM</span><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">产品是绝对不能用两点式安全带来安装的。</span> &nbsp;</p><p><span style=\"font-family:Microsoft YaHei;font-weight:normal;font-style:normal;font-size:12px;background:#FFFFFF none repeat scroll 0% 0%\">2）在新型的车中，ISOFIX系统通常是在第二排座位的两侧，极少数的车子中中间的座位也带isofix系统。</span><br/></p>', '1481614773', null);
INSERT INTO `dc_wang_question` VALUES ('18', 'aaaaaaaa', 'http://www.mobtop.com.cn/Uploads/Pictures/20161212/584e63d2d9612.gif', '<p>aaaaaaaaaaaaaaaaaa<br/></p>', '1482402435', 'admin');
INSERT INTO `dc_wang_question` VALUES ('19', 'aaaaaaaaaaaaaaaasdfdsdfsdf', 'http://www.mobtop.com.cn/Uploads/Pictures/20161222/585b98dc8bd2f.jpg', '<p>aaaaaaaaaaaaasdfsdddddddddddddddd</p>', '1482402456', 'wangzhan');
INSERT INTO `dc_wang_question` VALUES ('20', '123412342', 'http://www.mobtop.com.cn/Uploads/Pictures/20161227/586220c82d465.jpg', '<p>123423423423<br/></p>', '1482840727', 'admin');

-- ----------------------------
-- Table structure for `dc_wang_wangzhan`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_wangzhan`;
CREATE TABLE `dc_wang_wangzhan` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `content` text,
  `time` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `message` text,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_wangzhan
-- ----------------------------
INSERT INTO `dc_wang_wangzhan` VALUES ('65', '<div class=\"container-fluid\">\n	<div class=\"row\">\n		<div class=\"span12\">\n			<div class=\"navbar\">\n				<div class=\"container\">\n					<div class=\"navbar-header\">\n						 <button class=\"navbar-toggle collapsed\" type=\"button\" data-toggle=\"collapse\" data-target=\".navbar-collapse\"> <span class=\"sr-only\">Toggle navigation</span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button><a class=\"navbar-brand logo-warp\" href=\"/\"></a>\n					</div>\n					<div class=\"navbar-collapse collapse\" role=\"navigation\">\n						<ul class=\"nav navbar-nav nav-right\">\n							<li>\n								 <a href=\"/\">首页</a>\n							</li>\n							<li>\n								 <a href=\"/\">案例</a>\n							</li>\n							<li>\n								 <a href=\"/\">购买</a>\n							</li>\n							<li>\n								 <a href=\"/\">下载</a>\n							</li>\n							<li>\n								 <a href=\"/\">开发</a>\n							</li>\n							<li>\n								 <a href=\"/\">社区</a>\n							</li>\n						</ul>\n					</div>\n				</div>\n			</div>\n			<div class=\"jumbotron IMAX-warp\">\n				<div class=\"container-fluid\">\n					<img src=\"http://localhost/mobtop2/Uploads/Pictures/20170310/58c260364d348.jpg\" alt=\"\" class=\"IMAX-warp-img\" />\n				</div>\n			</div>\n			<div class=\"container\">\n				<div class=\"row\">\n					<div class=\"col-md-12 col-sm-12 col-xs-12 steps step1\">\n						<h3>\n							<strong>01</strong>选择您要的功能模块\n						</h3>\n						<ul class=\"step1-list\">\n							<li class=\"clearfix\">\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n									<input type=\"checkbox\" />Mobtop框架\n								</div>\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n									免费\n								</div>\n							</li>\n							<li class=\"clearfix\">\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n									<input type=\"checkbox\" />商城模块授权\n								</div>\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n									 <strong>30000</strong>元\n								</div>\n							</li>\n							<li class=\"clearfix\">\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n									<input type=\"checkbox\" />支付模块授权\n								</div>\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n									 <strong>25000</strong>元\n								</div>\n							</li>\n							<li class=\"clearfix\">\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n									<input type=\"checkbox\" />视频模块授权\n								</div>\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n									 <strong>20000</strong>元\n								</div>\n							</li>\n							<li class=\"clearfix\">\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n									<input type=\"checkbox\" />网站模块授权\n								</div>\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n									 <strong>15000</strong>元\n								</div>\n							</li>\n							<li class=\"clearfix\">\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n									<input type=\"checkbox\" />企信模块授权\n								</div>\n								<div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n									 <strong>58000</strong>元\n								</div>\n							</li>\n						</ul>\n					</div>\n				</div>\n			</div>\n			<div class=\"container\">\n				<div class=\"row\">\n					<div class=\"col-md-12 col-sm-12 col-xs-12 steps step2\">\n						<h3>\n							<strong>02</strong>选择您要的服务\n						</h3>\n						<ul class=\"col-md-12 col-sm-12 col-xs-12 choose-list clearfix\">\n							<li class=\"active-items\">\n								<p>\n									基础支持服务<br />邮件，电话\n								</p>\n								<p>\n									<span>5000</span>元 / 年\n								</p>\n							</li>\n							<li>\n								<p>\n									高级支持服务<br />高级工程师\n								</p>\n								<p>\n									<span>8000</span>元 / 年\n								</p>\n							</li>\n							<li>\n								<p>\n									金牌支持服务<br />使用培训，环境设置\n								</p>\n								<p>\n									<span>10000</span>元 / 年\n								</p>\n							</li>\n						</ul>\n						<h2 class=\"col-md-12 col-sm-12 col-xs-12 top-head\">\n							提供服务方式\n						</h2>\n						<ul class=\"col-md-12 col-sm-12 col-xs-12 show-list clearfix\">\n							<li>\n								<p>\n									<span>√</span>高级支持（电话／QQ/ 微信）等\n								</p>\n							</li>\n							<li>\n								<p>\n									<span>√</span>产品使用和维护培训\n								</p>\n							</li>\n						</ul>\n						<h2 class=\"col-md-12 col-sm-12 col-xs-12 top-head\">\n							服务内容\n						</h2>\n						<ul class=\"col-md-12 col-sm-12 col-xs-12 show-list\">\n							<li>\n								<p>\n									<span>√</span>产品所需环境安装\n								</p>\n								<p>\n									<span>√</span>产品升级指导\n								</p>\n								<p>\n									<span>√</span>产品本身安全预警\n								</p>\n								<p>\n									<span>√</span>产品自身bug反馈及响应\n								</p>\n								<p>\n									<span>√</span>数据库标准校验\n								</p>\n								<p>\n									<span>√</span>网络及系统安全防护策略\n								</p>\n								<p>\n									<span>√</span>运行环境优化\n								</p>\n								<p>\n									<span>√</span>移动版本（3G/WAP）\n								</p>\n							</li>\n							<li>\n								<p>\n									<span>√</span>产品安装\n								</p>\n								<p>\n									<span>√</span>数据安全备份解决方案\n								</p>\n								<p>\n									<span>√</span>安装配置FTP服务\n								</p>\n								<p>\n									<span>√</span>数据修复\n								</p>\n								<p>\n									<span>√</span>服务器性能检测\n								</p>\n								<p>\n									<span>√</span>官方插件安装\n								</p>\n								<p>\n									<span>√</span>系统负载优化\n								</p>\n								<p>\n									<span>√</span>二次开发咨询\n								</p>\n							</li>\n						</ul>\n					</div>\n				</div>\n			</div>\n			\n			<div class=\"container-fluid our-friends-warp\">\n				<div class=\"container\">\n					<div class=\"row\">\n						<div class=\"col-md-12 col-sm-12 col-xs-12 our-friends-content\">\n							<h3>\n								我们的朋友\n							</h3>\n							<p>\n								在我们成长路上，那些帮助我们的人\n							</p>\n							<p>\n								<em class=\"icos\"></em>贡献者：魔派Mobtop研发部 ／ 产品部 ／ 视觉部等部门\n							</p>\n						</div>\n					</div>\n				</div>\n			</div>\n			<footer class=\"container-fluid footer-warp\">\n				<div class=\"container\">\n					<div class=\"row\">\n						<div class=\"col-md-12 col-sm-12 col-xs-12 footer-content\">\n							<p class=\"col-md-4 col-sm-4 col-xs-12\">\n								 <a href=\"#\">关于我们</a> | <a href=\"#\">授权协议</a> | <a href=\"#\">联系我们</a>\n							</p>\n							<p class=\"col-md-6 col-sm-6 col-xs-12 col-md-offset-2 col-sm-offset-2\">\n								Copyright ©2016 -2017 mobtop.cn All Rights Reserved (京ICP备14050839号-1)\n							</p>\n						</div>\n					</div>\n				</div>\n			</footer>\n		</div>\n	</div>\n</div>', '1489133784', 'admin', '<div class=\"lyrow ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span>\n                                <div class=\"preview\">\n                                    <input value=\"12\" type=\"text\">\n                                </div>\n                                <div class=\"view\">\n                                    <div class=\"row-fluid clearfix\">\n                                        <div class=\"span12 column ui-sortable\"><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span> <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button> <a class=\"btn btn-mini\" href=\"#\" rel=\"navbar-inverse\">Inverse</a>\n                            <!--a class=\"btn btn-mini\" href=\"#\" rel=\"navbar-fixed-top\">Navbar fixed top</a-->\n              </span>\n                                <div class=\"preview\">导航栏</div>\n                                <div class=\"view\">\n                                    <!--导航-->\n                                    <!--navbar-fixed-top-->\n                                    <div class=\"navbar\">\n                                        <div class=\"container\">\n                                            <div class=\"navbar-header\">\n                                                <button class=\"navbar-toggle collapsed\" type=\"button\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n                                                    <span class=\"sr-only\">Toggle navigation</span>\n                                                    <span class=\"icon-bar\"></span>\n                                                    <span class=\"icon-bar\"></span>\n                                                    <span class=\"icon-bar\"></span>\n                                                </button>\n                                                <a class=\"navbar-brand logo-warp\" href=\"/\"></a>\n                                            </div>\n                                            <div class=\"navbar-collapse collapse\" role=\"navigation\">\n                                                <ul class=\"nav navbar-nav nav-right\">\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">首页</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">案例</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">购买</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">下载</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">开发</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">社区</a>\n                                                    </li>\n                                                </ul>\n                                            </div>\n                                        </div>\n                                    </div>\n\n\n                                </div>   \n                            </div><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span> <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">对齐 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-left\">靠左</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-center\">居中</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-right\">靠右</a></li>\n                                </ul>\n                                </span> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">标记 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"muted\">禁用</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-warning\">警告</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-error\">错误</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-info\">提示</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-success\">成功</a></li>\n                                </ul>\n                                </span> <a class=\"btn btn-mini\" href=\"#\" rel=\"lead\">Lead</a> </span>\n                                <div class=\"preview\">巨幕</div>\n                                <div class=\"view\" contenteditable=\"true\">\n                                   <div class=\"jumbotron IMAX-warp\">\n                                        <div class=\"container-fluid\">\n                                            <img src=\"http://localhost/mobtop2/Uploads/Pictures/20170310/58c260364d348.jpg\" alt=\"\" class=\"IMAX-warp-img\">                                        </div>\n                                    </div>\n                                </div>\n                            </div><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span>\n                                <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button></span>\n                                <div class=\"preview\">描述-1</div>\n                                <div class=\"view\">\n                                    <div class=\"container\">\n                                        <div class=\"row\">\n                                            <div class=\"col-md-12 col-sm-12 col-xs-12 steps step1\">\n                                                <h3><strong>01</strong>选择您要的功能模块</h3>\n                                                <ul class=\"step1-list\">\n                                                    <li class=\"clearfix\">\n                                                        <!--col-md-12 col-sm-12 col-xs-12-->\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n                                                            <input type=\"checkbox\">Mobtop框架\n                                                        </div>\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n                                                            免费\n                                                        </div>\n                                                    </li>\n                                                    <li class=\"clearfix\">\n                                                        <!--col-md-12 col-sm-12 col-xs-12-->\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n                                                            <input type=\"checkbox\">商城模块授权\n                                                        </div>\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n                                                            <strong>30000</strong>元\n                                                        </div>\n                                                    </li>\n                                                    <li class=\"clearfix\">\n                                                        <!--col-md-12 col-sm-12 col-xs-12-->\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n                                                            <input type=\"checkbox\">支付模块授权\n                                                        </div>\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n                                                            <strong>25000</strong>元\n                                                        </div>\n                                                    </li>\n                                                    <li class=\"clearfix\">\n                                                        <!--col-md-12 col-sm-12 col-xs-12-->\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n                                                            <input type=\"checkbox\" checked=\"\">视频模块授权\n                                                        </div>\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n                                                            <strong>20000</strong>元\n                                                        </div>\n                                                    </li>\n                                                    <li class=\"clearfix\">\n                                                        <!--col-md-12 col-sm-12 col-xs-12-->\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n                                                            <input type=\"checkbox\" checked=\"\">网站模块授权\n                                                        </div>\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n                                                            <strong>15000</strong>元\n                                                        </div>\n                                                    </li>\n                                                    <li class=\"clearfix\">\n                                                        <!--col-md-12 col-sm-12 col-xs-12-->\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-left\">\n                                                            <input type=\"checkbox\" checked=\"\">企信模块授权\n                                                        </div>\n                                                        <div class=\"col-md-6 col-sm-6 col-xs-6 text-right\">\n                                                            <strong>58000</strong>元\n                                                        </div>\n                                                    </li>\n                                                </ul>\n                                            </div>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span>\n                                <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button></span>\n                                <div class=\"preview\">描述-2</div>\n                                <div class=\"view\">\n                                    <div class=\"container\">\n                                        <div class=\"row\">\n                                            <div class=\"col-md-12 col-sm-12 col-xs-12 steps step2\">\n                <h3><strong>02</strong>选择您要的服务</h3>\n                <ul class=\"col-md-12 col-sm-12 col-xs-12 choose-list clearfix\">\n                    <li class=\"active-items\">\n                        <p>基础支持服务<br>邮件，电话</p>\n                        <p><span>5000</span>元 / 年</p>\n                    </li>\n                    <li class=\"\">\n                        <p>高级支持服务<br>高级工程师</p>\n                        <p><span>8000</span>元 / 年</p>\n                    </li>\n                    <li class=\"\">\n                        <p>金牌支持服务<br>使用培训，环境设置</p>\n                        <p><span>10000</span>元 / 年</p>\n                    </li>\n                </ul>\n                <h2 class=\"col-md-12 col-sm-12 col-xs-12 top-head\">提供服务方式</h2>\n                <ul class=\"col-md-12 col-sm-12 col-xs-12 show-list clearfix\">\n                    <li>\n                        <p><span>√</span>高级支持（电话／QQ/ 微信）等</p>\n                    </li>\n                    <li>\n                        <p><span>√</span>产品使用和维护培训</p>\n                    </li>\n                </ul>\n                <h2 class=\"col-md-12 col-sm-12 col-xs-12 top-head\">服务内容</h2>\n                <ul class=\"col-md-12 col-sm-12 col-xs-12 show-list\">\n                    <li>\n                        </li><li>\n                            <p><span>√</span>产品所需环境安装</p>\n                            <p><span>√</span>产品升级指导</p>\n                            <p><span>√</span>产品本身安全预警</p>\n                            <p><span>√</span>产品自身bug反馈及响应</p>\n                            <p><span>√</span>数据库标准校验</p>\n                            <p><span>√</span>网络及系统安全防护策略</p>\n                            <p><span>√</span>运行环境优化</p>\n                            <p><span>√</span>移动版本（3G/WAP）</p>\n                        </li>\n                        <li>\n                            <p><span>√</span>产品安装</p>\n                            <p><span>√</span>数据安全备份解决方案</p>\n                            <p><span>√</span>安装配置FTP服务</p>\n                            <p><span>√</span>数据修复</p>\n                            <p><span>√</span>服务器性能检测</p>\n                            <p><span>√</span>官方插件安装</p>\n                            <p><span>√</span>系统负载优化</p>\n                            <p><span>√</span>二次开发咨询</p>\n                        </li>\n                    \n                </ul>\n            </div>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span> <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">对齐 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-left\">靠左</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-center\">居中</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-right\">靠右</a></li>\n                                </ul>\n                                </span> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">标记 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"muted\">禁用</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-warning\">警告</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-error\">错误</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-info\">提示</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-success\">成功</a></li>\n                                </ul>\n                                </span> <a class=\"btn btn-mini\" href=\"#\" rel=\"lead\">Lead</a> </span>\n                                <div class=\"preview\">概述</div>\n                                <div class=\"view\" contenteditable=\"true\">\n                                    <!--概述-->\n                                    <div class=\"container-fluid our-friends-warp\">\n                                        <div class=\"container\">\n                                            <div class=\"row\">\n                                                <div class=\"col-md-12 col-sm-12 col-xs-12 our-friends-content\">\n                                                    <h3>我们的朋友</h3>\n                                                    <p>在我们成长路上，那些帮助我们的人</p>\n                                                    <p><i class=\"icos\"></i>贡献者：魔派Mobtop研发部 ／ 产品部 ／ 视觉部等部门</p>\n                                                </div>\n                                            </div>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span> <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">对齐 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-left\">靠左</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-center\">居中</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-right\">靠右</a></li>\n                                </ul>\n                                </span> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">标记 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"muted\">禁用</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-warning\">警告</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-error\">错误</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-info\">提示</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-success\">成功</a></li>\n                                </ul>\n                                </span> <a class=\"btn btn-mini\" href=\"#\" rel=\"lead\">Lead</a> </span>\n                                <div class=\"preview\">footer</div>\n                                <div class=\"view\" contenteditable=\"true\">\n                                    <footer class=\"container-fluid footer-warp\">\n                                        <div class=\"container\">\n                                            <div class=\"row\">\n                                                <div class=\"col-md-12 col-sm-12 col-xs-12 footer-content\">\n                                                    <p class=\"col-md-4 col-sm-4 col-xs-12\">\n                                                        <a href=\"#\">关于我们</a>    |   <a href=\"#\">授权协议</a>    |    <a href=\"#\">联系我们</a>\n                                                    </p>\n                                                    <p class=\"col-md-6 col-sm-6 col-xs-12 col-md-offset-2 col-sm-offset-2\">\n                                                        Copyright ©2016 -2017 mobtop.cn All Rights Reserved (京ICP备14050839号-1)\n                                                    </p>\n                                                </div>\n                                            </div>\n                                        </div>\n                                    </footer>\n                                </div>\n                            </div></div>\n                                    </div>\n                                </div>\n                            </div>', '数据');
INSERT INTO `dc_wang_wangzhan` VALUES ('64', '<div class=\"container-fluid\">\n	<div class=\"row\">\n		<div class=\"span12\">\n			<div class=\"navbar\">\n				<div class=\"container\">\n					<div class=\"navbar-header\">\n						 <button class=\"navbar-toggle collapsed\" type=\"button\" data-toggle=\"collapse\" data-target=\".navbar-collapse\"> <span class=\"sr-only\">Toggle navigation</span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span><span class=\"icon-bar\"></span></button><a class=\"navbar-brand logo-warp\" href=\"/\"></a>\n					</div>\n					<div class=\"navbar-collapse collapse\" role=\"navigation\">\n						<ul class=\"nav navbar-nav nav-right\">\n							<li>\n								 <a href=\"/\">首页</a>\n							</li>\n							<li>\n								 <a href=\"/\">案例</a>\n							</li>\n							<li>\n								 <a href=\"/\">购买</a>\n							</li>\n							<li>\n								 <a href=\"/\">下载</a>\n							</li>\n							<li>\n								 <a href=\"/\">开发</a>\n							</li>\n							<li>\n								 <a href=\"/\">社区</a>\n							</li>\n						</ul>\n					</div>\n				</div>\n			</div>\n			<div class=\"jumbotron IMAX-warp\">\n				<div class=\"container-fluid\">\n					<img src=\"http://localhost/mobtop2/Uploads/Pictures/20170310/58c260364d348.jpg\" alt=\"\" class=\"IMAX-warp-img\" />\n				</div>\n			</div>\n			<div class=\"container why-choose-warp-w\">\n				<div class=\"row\">\n					<div class=\"col-md-12 col-sm-12 col-xs-12 why-choose-warp\">\n						<h2>\n							 为什么选择MOBTOP\n						</h2>\n						<p>\n							让您的社区更智能地运作，强劲动力，睿智驾驭\n						</p>\n					</div>\n					<ul class=\"col-md-12 col-sm-12 col-xs-12 img-list-show\">\n						<li class=\"col-md-6 col-sm-6 col-xs-12  img-list-item\">\n							<div class=\"img-warp\">\n								<img src=\"/mobtop2/Public/Website/imgs/tupian.png\" alt=\"\" />\n							</div>\n							<h3>\n								管理中心，一手掌控\n							</h3>\n							<p>\n								管理中心为您建立起快速通道，所有功能开关，只需轻点一下，即可轻松完成配置，如此众多的操控，任您一挥而就。\n							</p>\n						</li>\n						<li class=\"col-md-6 col-sm-6 col-xs-12 img-list-item\">\n							<div class=\"img-warp\">\n								<img src=\"/mobtop2/Public/Website/imgs/tupian1.png\" alt=\"\" />\n							</div>\n							<h3>\n								开放源码，便捷开发\n							</h3>\n							<p>\n								mobtop 含有多项创新功能，遵循 MVC 架构，充分利用当下最新技术，对于开发者来说都会大有帮助，二次开发，更强定制，更易上手\n							</p>\n						</li>\n					</ul>\n					<ul class=\"col-md-12 col-sm-12 col-xs-12 img-list-show\">\n						<li class=\"col-md-6 col-sm-6 col-xs-12  img-list-item\">\n							<div class=\"img-warp\">\n								<img src=\"/mobtop2/Public/Website/imgs/tupian3.png\" alt=\"\" />\n							</div>\n							<h3>\n								个性路由，个性定制\n							</h3>\n							<p>\n								mobtop 让你用你喜欢的方式，更灵活地定制 URL 路由，URL 地址不再是千篇一律的样式，在 SEO 优化上助你一臂之力\n							</p>\n						</li>\n						<li class=\"col-md-6 col-sm-6 col-xs-12 img-list-item\">\n							<div class=\"img-warp\">\n								<img src=\"/mobtop2/Public/Website/imgs/homepage_bootstrap.png\" alt=\"\" />\n							</div>\n							<h3>\n								设计之妙，上手即知\n							</h3>\n							<p>\n								我们创造的每一件产品，从来都不仅仅追求设计的美观。我们在考虑设计的同时，更希望用户更能容易定制模板，最终我们选择了 Bootstrap，定制模板时你会发现一切都是那么的方便，简易\n							</p>\n						</li>\n					</ul>\n				</div>\n			</div>\n			\n			<div class=\"container-fluid our-friends-warp\">\n				<div class=\"container\">\n					<div class=\"row\">\n						<div class=\"col-md-12 col-sm-12 col-xs-12 our-friends-content\">\n							<h3>\n								我们的朋友\n							</h3>\n							<p>\n								在我们成长路上，那些帮助我们的人\n							</p>\n							<p>\n								<em class=\"icos\"></em>贡献者：魔派Mobtop研发部 ／ 产品部 ／ 视觉部等部门\n							</p>\n						</div>\n					</div>\n				</div>\n			</div>\n			<footer class=\"container-fluid footer-warp\">\n				<div class=\"container\">\n					<div class=\"row\">\n						<div class=\"col-md-12 col-sm-12 col-xs-12 footer-content\">\n							<p class=\"col-md-4 col-sm-4 col-xs-12\">\n								 <a href=\"#\">关于我们</a> | <a href=\"#\">授权协议</a> | <a href=\"#\">联系我们</a>\n							</p>\n							<p class=\"col-md-6 col-sm-6 col-xs-12 col-md-offset-2 col-sm-offset-2\">\n								Copyright ©2016 -2017 mobtop.cn All Rights Reserved (京ICP备14050839号-1)\n							</p>\n						</div>\n					</div>\n				</div>\n			</footer>\n		</div>\n	</div>\n</div>', '1489133707', 'admin', '<div class=\"lyrow ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span>\n                                <div class=\"preview\">\n                                    <input value=\"12\" type=\"text\">\n                                </div>\n                                <div class=\"view\">\n                                    <div class=\"row-fluid clearfix\">\n                                        <div class=\"span12 column ui-sortable\"><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span> <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button> <a class=\"btn btn-mini\" href=\"#\" rel=\"navbar-inverse\">Inverse</a>\n                            <!--a class=\"btn btn-mini\" href=\"#\" rel=\"navbar-fixed-top\">Navbar fixed top</a-->\n              </span>\n                                <div class=\"preview\">导航栏</div>\n                                <div class=\"view\">\n                                    <!--导航-->\n                                    <!--navbar-fixed-top-->\n                                    <div class=\"navbar\">\n                                        <div class=\"container\">\n                                            <div class=\"navbar-header\">\n                                                <button class=\"navbar-toggle collapsed\" type=\"button\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n                                                    <span class=\"sr-only\">Toggle navigation</span>\n                                                    <span class=\"icon-bar\"></span>\n                                                    <span class=\"icon-bar\"></span>\n                                                    <span class=\"icon-bar\"></span>\n                                                </button>\n                                                <a class=\"navbar-brand logo-warp\" href=\"/\"></a>\n                                            </div>\n                                            <div class=\"navbar-collapse collapse\" role=\"navigation\">\n                                                <ul class=\"nav navbar-nav nav-right\">\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">首页</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">案例</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">购买</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">下载</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">开发</a>\n                                                    </li>\n                                                    <li>\n                                                        <a href=\"/\" target=\"_self\">社区</a>\n                                                    </li>\n                                                </ul>\n                                            </div>\n                                        </div>\n                                    </div>\n\n\n                                </div>   \n                            </div><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span> <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">对齐 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-left\">靠左</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-center\">居中</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-right\">靠右</a></li>\n                                </ul>\n                                </span> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">标记 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"muted\">禁用</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-warning\">警告</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-error\">错误</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-info\">提示</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-success\">成功</a></li>\n                                </ul>\n                                </span> <a class=\"btn btn-mini\" href=\"#\" rel=\"lead\">Lead</a> </span>\n                                <div class=\"preview\">巨幕</div>\n                                <div class=\"view\" contenteditable=\"true\">\n                                   <div class=\"jumbotron IMAX-warp\">\n                                        <div class=\"container-fluid\">\n                                            <img src=\"http://localhost/mobtop2/Uploads/Pictures/20170310/58c260364d348.jpg\" alt=\"\" class=\"IMAX-warp-img\">                                        </div>\n                                    </div>\n                                </div>\n                            </div><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span> <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">对齐 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-left\">靠左</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-center\">居中</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-right\">靠右</a></li>\n                                </ul>\n                                </span> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">标记 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"muted\">禁用</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-warning\">警告</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-error\">错误</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-info\">提示</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-success\">成功</a></li>\n                                </ul>\n                                </span> <a class=\"btn btn-mini\" href=\"#\" rel=\"lead\">Lead</a> </span>\n                                <div class=\"preview\">网站核心</div>\n                                <div class=\"view\">\n                                    <div class=\"container why-choose-warp-w\">\n                                    <div class=\"row\">\n                                        <div class=\"col-md-12 col-sm-12 col-xs-12 why-choose-warp\">\n                                            <h2><span></span> 为什么选择MOBTOP <span></span></h2>\n                                            <p>让您的社区更智能地运作，强劲动力，睿智驾驭</p>\n                                        </div>\n                                        <ul class=\"col-md-12 col-sm-12 col-xs-12 img-list-show\">\n                                            <li class=\"col-md-6 col-sm-6 col-xs-12  img-list-item\">\n                                            <div class=\"img-warp\" style=\"width: 100%;\">\n                                                <img src=\"/mobtop2/Public/Website/imgs/tupian.png\" alt=\"\" style=\"width: 100%;\">\n                                            </div>\n                                            <h3>管理中心，一手掌控</h3>\n                                            <p>管理中心为您建立起快速通道，所有功能开关，只需轻点一下，即可轻松完成配置，如此众多的操控，任您一挥而就。</p>\n                                        </li>\n                                        <li class=\"col-md-6 col-sm-6 col-xs-12 img-list-item\">\n                                            <div class=\"img-warp\" style=\"width: 100%;\">\n                                                <img src=\"/mobtop2/Public/Website/imgs/tupian1.png\" alt=\"\" style=\"width: 100%;\">\n                                            </div>\n                                            <h3>开放源码，便捷开发</h3>\n                                            <p>mobtop 含有多项创新功能，遵循 MVC 架构，充分利用当下最新技术，对于开发者来说都会大有帮助，二次开发，更强定制，更易上手</p>\n                                        </li>\n                                        </ul>\n                                        <ul class=\"col-md-12 col-sm-12 col-xs-12 img-list-show\">\n                                            <li class=\"col-md-6 col-sm-6 col-xs-12  img-list-item\">\n                                            <div class=\"img-warp\" style=\"width: 100%;\">\n                                                <img src=\"/mobtop2/Public/Website/imgs/tupian3.png\" alt=\"\" style=\"width: 100%;\">\n                                            </div>\n                                            <h3>个性路由，个性定制</h3>\n                                            <p>mobtop 让你用你喜欢的方式，更灵活地定制 URL 路由，URL 地址不再是千篇一律的样式，在 SEO 优化上助你一臂之力</p>\n                                        </li>\n                                        <li class=\"col-md-6 col-sm-6 col-xs-12 img-list-item\">\n                                            <div class=\"img-warp\" style=\"width: 100%;\">\n                                                <img src=\"/mobtop2/Public/Website/imgs/homepage_bootstrap.png\" alt=\"\" style=\"width: 100%;\">\n                                            </div>\n                                            <h3>设计之妙，上手即知</h3>\n                                            <p>我们创造的每一件产品，从来都不仅仅追求设计的美观。我们在考虑设计的同时，更希望用户更能容易定制模板，最终我们选择了 Bootstrap，定制模板时你会发现一切都是那么的方便，简易</p>\n                                        </li>\n                                        </ul>\n                                    </div>\n                                </div>\n                                </div>\n                            </div><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span> <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">对齐 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-left\">靠左</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-center\">居中</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-right\">靠右</a></li>\n                                </ul>\n                                </span> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">标记 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"muted\">禁用</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-warning\">警告</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-error\">错误</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-info\">提示</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-success\">成功</a></li>\n                                </ul>\n                                </span> <a class=\"btn btn-mini\" href=\"#\" rel=\"lead\">Lead</a> </span>\n                                <div class=\"preview\">概述</div>\n                                <div class=\"view\" contenteditable=\"true\">\n                                    <!--概述-->\n                                    <div class=\"container-fluid our-friends-warp\">\n                                        <div class=\"container\">\n                                            <div class=\"row\">\n                                                <div class=\"col-md-12 col-sm-12 col-xs-12 our-friends-content\">\n                                                    <h3>我们的朋友</h3>\n                                                    <p>在我们成长路上，那些帮助我们的人</p>\n                                                    <p><i class=\"icos\"></i>贡献者：魔派Mobtop研发部 ／ 产品部 ／ 视觉部等部门</p>\n                                                </div>\n                                            </div>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div><div class=\"box box-element ui-draggable\" style=\"display: block;\"> <a href=\"#close\" class=\"remove label label-important\"><i class=\"icon-remove icon-white\"></i>删除</a>                                <span class=\"drag label\"><i class=\"icon-move\"></i>拖动</span> <span class=\"configuration\"><button type=\"button\" class=\"btn btn-mini\" data-target=\"#editorModal\" role=\"button\" data-toggle=\"modal\">编辑</button> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">对齐 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-left\">靠左</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-center\">居中</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-right\">靠右</a></li>\n                                </ul>\n                                </span> <span class=\"btn-group\"> <a class=\"btn btn-mini dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">标记 <span class=\"caret\"></span></a>\n                                <ul class=\"dropdown-menu\">\n                                    <li class=\"active\"><a href=\"#\" rel=\"\">默认</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"muted\">禁用</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-warning\">警告</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-error\">错误</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-info\">提示</a></li>\n                                    <li class=\"\"><a href=\"#\" rel=\"text-success\">成功</a></li>\n                                </ul>\n                                </span> <a class=\"btn btn-mini\" href=\"#\" rel=\"lead\">Lead</a> </span>\n                                <div class=\"preview\">footer</div>\n                                <div class=\"view\" contenteditable=\"true\">\n                                    <footer class=\"container-fluid footer-warp\">\n                                        <div class=\"container\">\n                                            <div class=\"row\">\n                                                <div class=\"col-md-12 col-sm-12 col-xs-12 footer-content\">\n                                                    <p class=\"col-md-4 col-sm-4 col-xs-12\">\n                                                        <a href=\"#\">关于我们</a>    |   <a href=\"#\">授权协议</a>    |    <a href=\"#\">联系我们</a>\n                                                    </p>\n                                                    <p class=\"col-md-6 col-sm-6 col-xs-12 col-md-offset-2 col-sm-offset-2\">\n                                                        Copyright ©2016 -2017 mobtop.cn All Rights Reserved (京ICP备14050839号-1)\n                                                    </p>\n                                                </div>\n                                            </div>\n                                        </div>\n                                    </footer>\n                                </div>\n                            </div></div>\n                                    </div>\n                                </div>\n                            </div>', '首页');

-- ----------------------------
-- Table structure for `dc_wang_weixin`
-- ----------------------------
DROP TABLE IF EXISTS `dc_wang_weixin`;
CREATE TABLE `dc_wang_weixin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `img1` varchar(255) DEFAULT NULL,
  `fenlei` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `content` text,
  `seotitle` varchar(255) DEFAULT NULL,
  `sotextarea` varchar(255) DEFAULT NULL,
  `newsname` varchar(255) DEFAULT NULL,
  `seonews` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_wang_weixin
-- ----------------------------
INSERT INTO `dc_wang_weixin` VALUES ('3', '微官网', 'http://www.mobtop.com.cn/Uploads/Pictures/20161217/5854ae6bbd461.png', 'http://www.mobtop.com.cn/Uploads/Pictures/20161217/5854aea195eb0.png', '展示型', '快速打造超炫微信移动网站，让您的品牌效应', '<p>简单设置，快速生成专属微官网；丰富精美的模板，提供更多组合，打造商家个性风格，让您的粉丝忍不住“在人群中多看你一眼”。微官网为有心打造专属微网站商户提供了便捷途径</p>', '快速打造超炫微信移动网站，让您的品牌效应', null, '快速打造超炫微信移动网站，让您的品牌效应', '快速打造超炫微信移动网站，让您的品牌效应', '1481944772');
INSERT INTO `dc_wang_weixin` VALUES ('4', '微商城', 'http://www.mobtop.com.cn/Uploads/Pictures/20161217/5854ae6bbd461.png', 'http://www.mobtop.com.cn/Uploads/Pictures/20161211/584cf4c19244d.jpg', '成交型', '连锁店可以单独设置商品分类', '<p>1、支持连锁商城功能，每个分支机构和连锁商城都可以独立开店<br/>　　连锁店可以单独设置商品分类、上架商品、实现单独的订单管理和界面选择。<br/>2、商品分类支持二级分类<br/>　　对于复杂门类的商家，该功能的推出能让商城的商品分类更加合理，更有层次</p>', '连锁店可以单独设置商品分类', null, '连锁店可以单独设置商品分类', '连锁店可以单独设置商品分类', '1481945042');
INSERT INTO `dc_wang_weixin` VALUES ('5', '微社区', 'http://www.mobtop.com.cn/Uploads/Pictures/20161217/5854ae6bbd461.png', 'http://www.mobtop.com.cn/Uploads/Pictures/20161209/584a0dfe68b05.png', '互动型', '微社区', '<p>微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区微社区</p>', '微社区', null, '微社区', '微社区', '1481945096');
