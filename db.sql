-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: chatgpt-plus
-- ------------------------------------------------------
-- Server version	5.7.31-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `root` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否超级管理员 0-否 1-是',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `multipoint_login` tinyint(1) unsigned DEFAULT '1' COMMENT '是否支持多处登录：1-是；0-否；',
  `disable` tinyint(1) unsigned DEFAULT '0' COMMENT '是否禁用：0-否；1-是；',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_index` (`account`),
  KEY `root_index` (`root`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,1,'系统管理员','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/avatar/admin1.jpg','admin','$argon2id$v=19$m=65536,t=4,p=1$TrpXzTvAj5aLDHGl/2TmaA$9LUNiHdegkYzBwnags3RF/8E4mDbMKCnEJu9JPxe4tE',NULL,'',1,0,'2023-03-16 00:00:00','2023-05-10 13:58:57',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_sessions`
--

DROP TABLE IF EXISTS `chat_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_uuid` varchar(64) DEFAULT NULL,
  `chat_id` int(10) unsigned DEFAULT NULL,
  `parent_message_id` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_sessions`
--

LOCK TABLES `chat_sessions` WRITE;
/*!40000 ALTER TABLE `chat_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_titles`
--

DROP TABLE IF EXISTS `chat_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` varchar(255) DEFAULT NULL,
  `session_uuid` varchar(255) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_titles_message_id_index` (`message_id`),
  KEY `chat_titles_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对话窗口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_titles`
--

LOCK TABLES `chat_titles` WRITE;
/*!40000 ALTER TABLE `chat_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `key_id` int(11) NOT NULL DEFAULT '0' COMMENT 'key池id',
  `model` varchar(20) NOT NULL COMMENT '所用模型',
  `charge_mode` varchar(10) DEFAULT NULL COMMENT '计费模式',
  `charge_rate` int(11) DEFAULT '0' COMMENT '换算倍数',
  `role` varchar(20) DEFAULT NULL COMMENT '角色',
  `prompt` varchar(250) NOT NULL COMMENT '问题',
  `content` text COMMENT '回答',
  `prompt_tokens` int(11) NOT NULL DEFAULT '0',
  `completion_tokens` int(11) DEFAULT '0',
  `total_tokens` int(11) NOT NULL DEFAULT '0' COMMENT '消耗总tokens',
  `total_points` int(11) NOT NULL DEFAULT '0' COMMENT '消耗总积分',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chats_user_id_index` (`user_id`),
  KEY `chats_key_id_index` (`key_id`),
  KEY `chats_model_index` (`model`),
  KEY `chats_prompt_index` (`prompt`),
  KEY `chats_total_tokens_index` (`total_tokens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL COMMENT '名字',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述信息',
  `value` text,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_index` (`type`),
  KEY `name_index` (`name`),
  KEY `type_name_index` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb4 COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES (90,'register','register_way','注册方式','10',NULL,NULL),(94,'register','register_code','注册码','68823095',NULL,NULL),(95,'register','default_avatar','默认头像','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/avatar/default.png',NULL,NULL),(96,'register','enable_ercode','是否启用二维码','0',NULL,NULL),(97,'register','enable_verify_code','是否启用验证码','0',NULL,NULL),(100,'website','name','网站名','plus管理系统',1660620367,1679191955),(102,'register','free_points','注册免费赠送积分','400',NULL,NULL),(120,'website','favicon','图标','https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230425/avatart.jpg',1660620367,1679191955),(130,'website','backdrop',NULL,'/api/static/backend_backdrop.png',1660620367,1679191955),(150,'website','copyright',NULL,'[{\"name\":\"LikeAdmin开源系统\",\"link\":\"http://www.beian.gov.cn\"}]',1660620367,1660620367),(160,'website','qq','客服QQ','购买卡密后请在下面进行核销，如遇问题请联系客服QQ：245629560~',NULL,NULL),(170,'website','logo','logo','https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230425/avatart.jpg',1660620367,1679191955),(200,'chatgpt','baseUrl',NULL,'https://open2.aiproxy.xyz',NULL,NULL),(210,'chatgpt','proxyUrl',NULL,'https://open2.aiproxy.xyz',NULL,NULL),(220,'chatgpt','model',NULL,'gpt-3.5-turbo',NULL,NULL),(230,'chatgpt','topP',NULL,'20',NULL,NULL),(240,'chatgpt','memoryMemo',NULL,'36',NULL,NULL),(250,'chatgpt','isSerial',NULL,'1',NULL,NULL),(260,'chatgpt','timeout',NULL,'60',NULL,NULL),(300,'storage','default',NULL,'local',1660620367,1662620927),(310,'storage','local',NULL,'{\"name\":\"本地存储\"}',1660620367,1662620927),(320,'storage','aliyun',NULL,'{\"name\":\"阿里云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\"}',1660620367,1662620071),(330,'storage','qiniu',NULL,'{\"name\":\"七牛云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\"}',1660620367,1660620367),(340,'storage','qcloud',NULL,'{\"name\":\"腾讯云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\",\"region\":\"\"}',1660620367,1660620367),(400,'sms','default',NULL,'aliyun',1660620367,1660620367),(410,'sms','aliyun','阿里云','{\"name\":\"阿里云短信\",\"alias\":\"aliyun\",\"sign\":\"\",\"appKey\":\"\",\"secretKey\":\"\"}',1660620367,1660620367),(420,'sms','tencent','腾讯','{\"name\":\"腾讯云短信\",\"alias\":\"tencent\",\"sign\":\"\",\"appId\":\"\",\"secretId\":\"\",\"secretKey\":\"\"}',1660620367,1660620367),(430,'sms','huawei','华为','{\"name\":\"华为云短信\",\"alias\":\"huawei\"}',1660620367,1660620367),(500,'point','register','注册获取积分','100',NULL,NULL),(510,'point','inviter','邀请者获取积分','120',NULL,NULL),(520,'point','invitee','被邀请者获取积分','150',NULL,NULL);
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diy_reply`
--

DROP TABLE IF EXISTS `diy_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diy_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(50) NOT NULL,
  `content` text,
  `is_disable` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `diy_reply_keywords_uindex` (`keywords`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diy_reply`
--

LOCK TABLES `diy_reply` WRITE;
/*!40000 ALTER TABLE `diy_reply` DISABLE KEYS */;
INSERT INTO `diy_reply` VALUES (3,'你是谁','我是一个聊天机器人，被用来与用户交互并回答各种问题。我使用自然语言处理技术来理解用户的问题，并尽可能准确和有用地回答它们。我可以讨论各种主题，包括科学、历史、文化、娱乐等等。',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `diy_reply` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `inviters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL,
  `invitee_id` int(11) DEFAULT '0' COMMENT '被邀请者id',
  `invitee_name` varchar(50) DEFAULT NULL,
  `user_points`    int default 0 not null comment '邀请者获得积分',
  `invitee_points` int default 0 not null comment '被邀请者获得积分',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inviters_id_uindex` (`id`),
  UNIQUE KEY `inviters_invitee_id_uindex` (`invitee_id`),
  KEY `inviters_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邀请者表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inviters`
--

LOCK TABLES `inviters` WRITE;
/*!40000 ALTER TABLE `inviters` DISABLE KEYS */;
/*!40000 ALTER TABLE `inviters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keys`
--

DROP TABLE IF EXISTS `keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(250) NOT NULL COMMENT '密钥内容',
  `model` varchar(50) DEFAULT NULL COMMENT '所属模型',
  `proxy_url` varchar(250) DEFAULT NULL COMMENT '代理地址',
  `status` tinyint(3) NOT NULL DEFAULT '10' COMMENT '状态{10:正常, 20:余额或次数不足, 30:被封禁 40:已过期}',
  `tokens` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `times` int(11) DEFAULT '0' COMMENT '有效次数',
  `is_plus` tinyint(2) DEFAULT '0' COMMENT '是否是plus{0:否, 1:是}',
  `is_disable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否禁用 {0:否,1:是}',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keys_id_uindex` (`id`),
  KEY `type_index` (`is_plus`),
  KEY `keys_status_index` (`status`),
  KEY `keys_is_disable_index` (`is_disable`),
  KEY `keys_model_index` (`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keys`
--

LOCK TABLES `keys` WRITE;
/*!40000 ALTER TABLE `keys` DISABLE KEYS */;
INSERT INTO `keys` VALUES (1,'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','gpt-3.5-turbo',NULL,10,0000000000,0,0,1,'2023-03-23 20:51:32','2023-03-23 20:51:37','2023-05-15 13:13:40'),(2,'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','gpt-3.5-turbo','',20,0000000000,0,0,1,NULL,'2023-05-12 12:31:21',NULL),(3,'KWHGDS8435TGKJLHKGLISRETYRIEHKGDIyiouhNF,GFDSHGB','gpt-3.5-turbo',NULL,10,0000000000,0,0,1,NULL,'2023-04-10 20:48:09','2023-04-12 00:22:57'),(8,'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','gpt-3.5-turbo','',10,0000114292,0,0,0,'2023-04-12 00:41:33','2023-05-15 10:11:12',NULL),(9,'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','gpt-4','',10,0000001737,0,1,0,'2023-05-15 09:43:45','2023-05-15 09:43:45','2023-05-15 10:37:28'),(10,'sk-testkey','gpt-3.5-turbo','',10,0000000000,0,1,1,'2023-05-15 12:44:07','2023-05-15 12:44:07','2023-05-15 12:44:12'),(11,'1111','gpt-3.5-turbo','',10,0000000000,0,0,0,'2023-05-15 13:25:28','2023-05-15 13:25:28','2023-05-15 13:25:32'),(12,'bb','gpt-4','',10,0000000000,0,0,0,'2023-05-15 13:25:52','2023-05-15 13:25:52','2023-05-15 13:26:06'),(13,'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','gpt-4','',10,0000000026,0,0,0,'2023-05-15 13:35:17','2023-05-15 13:37:52','2023-05-15 13:39:00'),(14,'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','gpt-4','',10,0000000179,0,0,0,'2023-05-15 13:41:22','2023-05-15 13:41:22',NULL);
/*!40000 ALTER TABLE `keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `driver` varchar(50) NOT NULL COMMENT 'AI驱动',
  `name` varchar(50) DEFAULT NULL COMMENT '模型',
  `max_tokens`  int  default 0 not null,
  `charge_mode` varchar(10) NOT NULL COMMENT '计费模式，times:次数 tokens:流量',
  `charge_rate` int(11) DEFAULT '1' COMMENT '计费比率',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_disable` tinyint(3) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `package_models_id_uindex` (`id`),
  KEY `models_deleted_at_index` (`deleted_at`),
  KEY `models_driver_index` (`driver`),
  KEY `models_name_index` (`name`),
  KEY `models_charge_mode_index` (`charge_mode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'openai','gpt-3.5-turbo',4096,'times',100,100,0,'2023-05-14 19:22:02','2023-05-15 11:39:34',NULL),(2,'openai','gpt-4',8192,'tokens',6,200,0,'2023-05-14 19:23:16','2023-05-15 14:29:02',NULL);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '公告标题',
  `content` text COMMENT '公告内容',
  `is_disable` tinyint(3) DEFAULT '0' COMMENT '使用禁用',
  `expired_at` date DEFAULT NULL COMMENT '失效日期',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notices_id_uindex` (`id`),
  KEY `notices_deleted_at_index` (`deleted_at`),
  KEY `notices_is_disable_index` (`is_disable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (1,'公告标题','<p>这里是公告内容</p>',0,'2023-05-12','2023-05-12 15:46:50','2023-05-12 19:58:00',NULL);
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_cards`
--

DROP TABLE IF EXISTS `package_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(250) NOT NULL COMMENT '卡密号',
  `package_id` int(11) DEFAULT '0' COMMENT '套餐id',
  `package_name` varchar(50) DEFAULT NULL COMMENT '套餐名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '卡券价格',
  `duration` int(11) DEFAULT '0' COMMENT '有效时长，单位天，0代表永久',
  `total_points` int(11) NOT NULL DEFAULT '0' COMMENT '包含总积分',
  `batch_id` int(11) DEFAULT '0' COMMENT '批次ID',
  `batch_size` int(11) DEFAULT '0' COMMENT '批次导出数量',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述信息',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `binded_at` datetime DEFAULT NULL COMMENT '绑定时间',
  `expired_at` datetime DEFAULT NULL COMMENT '失效时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  UNIQUE KEY `package_cards_id_uindex` (`id`),
  KEY `cards_card_no_index` (`card_no`),
  KEY `cards_package_id_index` (`package_id`),
  KEY `package_cards_deleted_at_index` (`deleted_at`),
  KEY `package_cards_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='卡券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_cards`
--

LOCK TABLES `package_cards` WRITE;
/*!40000 ALTER TABLE `package_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT 'tokens' COMMENT '套餐类型:{times:次数，tokens：流量}',
  `name` varchar(250) DEFAULT NULL COMMENT '套餐名',
  `icon` varchar(250) DEFAULT NULL COMMENT '套餐图标',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `price` decimal(10,2) DEFAULT NULL COMMENT '优惠价',
  `desc` text COMMENT '套餐描述',
  `total_points` int(11) DEFAULT '0' COMMENT '包含总积分',
  `duration` int(11) DEFAULT '0' COMMENT '有效时长，单位天，0代表永久',
  `buy_method` varchar(50) NOT NULL DEFAULT 'jump' COMMENT '购买方式:{online:在线，jump:跳转}',
  `jump_url` varchar(250) NOT NULL DEFAULT '' COMMENT '跳转链接',
  `sort` int(11) DEFAULT '0' COMMENT '排序字段，越大越靠前',
  `is_disable` tinyint(4) DEFAULT '0' COMMENT '是否禁用',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packages_id_uindex` (`id`),
  KEY `packages_is_disable_index` (`is_disable`),
  KEY `packages_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'tokens','日卡',NULL,6.00,5.00,'',1000,1,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',444,0,NULL,'2023-03-30 20:17:49',NULL),(2,'tokens','周卡','',31.00,30.00,'',8000,7,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',555,0,NULL,'2023-05-12 11:57:26',NULL),(3,'tokens','月卡',NULL,105.00,100.00,'',31000,30,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',777,0,NULL,'2023-03-30 20:17:40',NULL),(4,'tokens','季卡','',152.00,150.00,'',94000,90,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',666,0,NULL,'2023-05-12 11:57:21',NULL),(5,'tokens','年卡','',310.00,300.00,'',400000,360,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',888,0,NULL,'2023-05-15 09:59:20',NULL);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户',
  `from` varchar(10) NOT NULL COMMENT '来源',
  `points` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `desc` varchar(250) DEFAULT NULL COMMENT '描述',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `points_id_uindex` (`id`),
  KEY `points_from_index` (`from`),
  KEY `points_points_index` (`points`),
  KEY `points_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='积分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prompt_types`
--

DROP TABLE IF EXISTS `prompt_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prompt_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '场景名',
  `desc` varchar(250) DEFAULT NULL COMMENT '场景描述',
  `icon` varchar(250) DEFAULT NULL COMMENT '场景图标',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否禁用',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prompt_scenes_is_disable_index` (`is_disable`),
  KEY `prompt_scenes_title_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='prompt场景表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prompt_types`
--

LOCK TABLES `prompt_types` WRITE;
/*!40000 ALTER TABLE `prompt_types` DISABLE KEYS */;
INSERT INTO `prompt_types` VALUES (1,'通用','这里是描述信息','',999,0,'2023-05-12 10:46:55','2023-05-14 10:39:04',NULL),(2,'客服','这里是描述信息','',777,0,'2023-05-13 10:47:00','2023-05-14 10:39:18',NULL),(3,'工作','这里是描述信息','',888,0,'2023-05-12 10:47:04','2023-05-14 10:39:12',NULL);
/*!40000 ALTER TABLE `prompt_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prompts`
--

DROP TABLE IF EXISTS `prompts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prompts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT '0' COMMENT '分类id',
  `key` varchar(50) NOT NULL COMMENT 'prompt提示词',
  `value` text NOT NULL COMMENT 'prompt内容',
  `desc` varchar(250) DEFAULT NULL COMMENT '描述信息',
  `icon` varchar(250) DEFAULT NULL COMMENT '图标',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT '0' COMMENT '排序数字，越大越靠前',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prompts_id_uindex` (`id`),
  KEY `prompts_sort_index` (`sort`),
  KEY `prompts_is_disable_index` (`is_disable`),
  KEY `prompts_key_index` (`key`),
  KEY `prompts_scene_id_index` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prompts`
--

LOCK TABLES `prompts` WRITE;
/*!40000 ALTER TABLE `prompts` DISABLE KEYS */;
INSERT INTO `prompts` VALUES (1,1,'歌曲推荐人','我想让你担任歌曲推荐人。我将为您提供一首歌曲，您将创建一个包含 10 首与给定歌曲相似的歌曲的播放列表。您将为播放列表提供播放列表名称和描述。不要选择同名或同名歌手的歌曲。不要写任何解释或其他文字，只需回复播放列表名称、描述和歌曲。我的第一首歌是“Other Lives - Epic”','担任歌曲推荐人','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/1/prompt/ug2ylY6VkT8TWkaTivectDJjwuvT1kNOJrn5OlX2.png',0,200,NULL,'2023-05-13 01:31:33',NULL),(2,1,'Linux 终端','充当 Linux 终端\",\"value\":\"我想让你充当 Linux 终端。我将输入命令，您将回复终端应显示的内容。我希望您只在一个唯一的代码块内回复终端输出，而不是其他任何内容。不要写解释。除非我指示您这样做，否则不要键入命令。当我需要用英语告诉你一些事情时，我会把文字放在中括号内[就像这样]。我的第一个命令是 pwd','充当 Linux 终端','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/1/prompt/9i787jT5UnQoqkpoTu7IvWOsvOpgJghQA2ud953g.png',0,300,NULL,'2023-05-13 01:33:22',NULL);
/*!40000 ALTER TABLE `prompts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sn` varchar(100) DEFAULT NULL COMMENT '用户编号',
  `account` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `name` varchar(255) NOT NULL COMMENT '用户昵称',
  `avatar` varchar(250) DEFAULT NULL COMMENT '用户头像',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `device` tinyint(4) DEFAULT '0' COMMENT '注册设备: [10:微信小程序 20:微信公众号 30:手机H5 40:电脑PC 50:苹果APP 60:安卓APP]',
  `invite_code` varchar(50) DEFAULT NULL COMMENT '邀请码',
  `is_disable` tinyint(1) DEFAULT '0' COMMENT '是否禁用: [0=否, 1=是]',
  `level` int(3) NOT NULL DEFAULT '10' COMMENT '会员等级，备用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_id_uindex` (`id`),
  UNIQUE KEY `users_sn_uindex` (`sn`),
  KEY `users_device_index` (`device`),
  KEY `users_is_disable_index` (`is_disable`),
  KEY `users_level_index` (`level`),
  KEY `users_email_index` (`email`),
  KEY `users_mobile_index` (`mobile`),
  KEY `users_deleted_at_index` (`deleted_at`),
  KEY `users_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'chatgpt-plus'
--

--
-- Dumping routines for database 'chatgpt-plus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15 19:16:02
