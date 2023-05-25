-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: chatgpt
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
INSERT INTO `admins` VALUES (1,1,'系统管理员','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/avatar/admin1.jpg','admin','$argon2id$v=19$m=65536,t=4,p=1$4d29CZVOdyA6Fb2TWgoP1A$UKZnQ3E4V6hVJq71GuL945Zf2tJUQcshn5ng2f5blYg',NULL,'',1,0,'2023-03-16 00:00:00','2023-05-18 17:56:49',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_sessions`
--

LOCK TABLES `chat_sessions` WRITE;
/*!40000 ALTER TABLE `chat_sessions` DISABLE KEYS */;
INSERT INTO `chat_sessions` VALUES (1,'1eeb6419-0b87-4335-ad00-fdc177a64614',1,'chatcmpl-7HnDdnqMVZzF59Zanyjy2bXZR19JZ','2023-05-19 13:45:31','2023-05-19 13:45:31'),(2,'d2e0a7fd-adf1-4913-9503-b4a91ea7a757',2,'chatcmpl-7HnziHf9tJgajcuJRhbik48hbDSUb','2023-05-19 14:35:38','2023-05-19 14:35:38'),(3,'d2e0a7fd-adf1-4913-9503-b4a91ea7a757',3,'chatcmpl-7HoKjDt6vIuaoKpHEgdOZn8Mrs0zD','2023-05-19 14:57:12','2023-05-19 14:57:12'),(4,'650ad40a-6a05-4f13-9169-0dbc34d92742',4,'','2023-05-19 15:34:55','2023-05-19 15:34:55'),(5,'c12b5b05-176c-4800-b75f-a818a014dcf5',5,'chatcmpl-7HoxqyeipiErrh09KvjJzr5kGQ65J','2023-05-19 15:37:24','2023-05-19 15:37:24'),(6,'c12b5b05-176c-4800-b75f-a818a014dcf5',6,'','2023-05-19 15:37:54','2023-05-19 15:37:54'),(7,'d2e0a7fd-adf1-4913-9503-b4a91ea7a757',7,'chatcmpl-7HoyOGkjtVKprWNRM3kGMtupMLhvS','2023-05-19 15:38:00','2023-05-19 15:38:00'),(8,'50dd66fe-9578-4a90-8103-fa3c746b42b9',8,'','2023-05-19 15:38:28','2023-05-19 15:38:28'),(9,'4da6d610-f4ec-4a2e-9597-197ba70ce49c',9,'chatcmpl-7Hozj6xV6UHW3k3qIGvHWz7Zwlxum','2023-05-19 15:39:22','2023-05-19 15:39:22'),(10,'8d276aea-0619-4a28-bc8a-bc0abc6cc171',10,'','2023-05-19 15:39:55','2023-05-19 15:39:55'),(11,'df4155e8-6cc7-4f5c-86a2-c48b9e4a6b6f',11,'chatcmpl-7HpGOVdnMHlSsTF7dcgLDppTzm2E2','2023-05-19 15:56:37','2023-05-19 15:56:37'),(12,'df4155e8-6cc7-4f5c-86a2-c48b9e4a6b6f',12,'chatcmpl-7HrcPlZQNZw4VTujgBsbCAOL63UAX','2023-05-19 18:27:56','2023-05-19 18:27:56'),(13,'df4155e8-6cc7-4f5c-86a2-c48b9e4a6b6f',13,'chatcmpl-7HrdJHawKPgD8RJ8Gt0DA4VwG83nw','2023-05-19 18:29:19','2023-05-19 18:29:19'),(14,'df4155e8-6cc7-4f5c-86a2-c48b9e4a6b6f',14,'chatcmpl-7I5fj9TcGVjx5Qh2VZtTYVFGUbWVS','2023-05-20 09:27:44','2023-05-20 09:27:44'),(15,'ccee5e87-9fe9-489a-8a0f-2a3c53961d4f',15,'chatcmpl-7IUS9IOMGenDaWEd6YUXnjiuSA91R','2023-05-21 11:55:35','2023-05-21 11:55:35'),(16,'ccee5e87-9fe9-489a-8a0f-2a3c53961d4f',16,'chatcmpl-7IUTPlahfwAnnTCsO4ccjGNg4hkXW','2023-05-21 11:56:52','2023-05-21 11:56:52'),(17,'fa6ebb72-8819-45dc-b109-9c5ff2890d29',17,'chatcmpl-7IUUYZ5QQQblFqmOBrpkjvhOuLBBe','2023-05-21 11:57:54','2023-05-21 11:57:54'),(18,'fa6ebb72-8819-45dc-b109-9c5ff2890d29',18,'chatcmpl-7IUW1MtBVMksbTXAVQioKqkp2r2Yj','2023-05-21 11:59:24','2023-05-21 11:59:24'),(19,'fa6ebb72-8819-45dc-b109-9c5ff2890d29',19,'chatcmpl-7IUXA4mPeAF7whTZ9BhEUdNa4y9tx','2023-05-21 12:00:40','2023-05-21 12:00:40'),(20,'c2760828-0037-4e85-af76-164b7273e55b',20,'chatcmpl-7IUYkNsIew9lOKOkgQGx1mexgJzVp','2023-05-21 12:02:14','2023-05-21 12:02:14'),(21,'c2760828-0037-4e85-af76-164b7273e55b',21,'chatcmpl-7IUZejPvXnvWmD4SSLu3ITUtKT2MA','2023-05-21 12:03:10','2023-05-21 12:03:10'),(22,'c2760828-0037-4e85-af76-164b7273e55b',22,'chatcmpl-7IUZw68MEVDEgvqFhFZyBJpI8dhLT','2023-05-21 12:03:25','2023-05-21 12:03:25'),(23,'c2760828-0037-4e85-af76-164b7273e55b',23,'chatcmpl-7IUa5PqQ9ShivzYZPiVeTya6UX8Cd','2023-05-21 12:03:34','2023-05-21 12:03:34'),(24,'e1e0136c-219f-4e78-ad61-3182148913b0',24,'chatcmpl-7IUafnHosGsqyADS9Mvz7QUVvfY80','2023-05-21 12:04:15','2023-05-21 12:04:15'),(25,'4708baaa-f437-4fe5-9b22-b1ed2e46f7ee',25,'chatcmpl-7IUc0MhhKNPZyUpwGD5cFxGwuUOXS','2023-05-21 12:05:43','2023-05-21 12:05:43'),(26,'4708baaa-f437-4fe5-9b22-b1ed2e46f7ee',26,'chatcmpl-7IUcKKgphQyaSuV2YQQ1YwQxDzcy2','2023-05-21 12:06:10','2023-05-21 12:06:10'),(27,'150a8a66-1d3b-47c7-9d34-f634aacadae9',27,'chatcmpl-7IUcy8T5yIZXq5PbRk254PkHh81YM','2023-05-21 12:06:42','2023-05-21 12:06:42'),(28,'150a8a66-1d3b-47c7-9d34-f634aacadae9',28,'chatcmpl-7IUdFk0alxLh9cIBndbBR0KwSIGCV','2023-05-21 12:06:56','2023-05-21 12:06:56'),(29,'150a8a66-1d3b-47c7-9d34-f634aacadae9',29,'chatcmpl-7IUdj6NIEl1lBONPW8xIuqrXgCfMy','2023-05-21 12:07:34','2023-05-21 12:07:34'),(30,'150a8a66-1d3b-47c7-9d34-f634aacadae9',30,'chatcmpl-7IUeN1E3c0yoLDvo1JlkVlAZM9WAW','2023-05-21 12:08:09','2023-05-21 12:08:09'),(31,'e3956be6-8b78-4f46-ac89-7470085dab08',31,'chatcmpl-7IUesMOUaLtN9p9lNQPkZMHRuPxnn','2023-05-21 12:08:30','2023-05-21 12:08:30'),(32,'e3956be6-8b78-4f46-ac89-7470085dab08',32,'chatcmpl-7IUfMXCC6v0iwZHu03Mm1CjciOJbw','2023-05-21 12:09:10','2023-05-21 12:09:10'),(33,'63c3e7be-f7fe-4ea6-b727-88bfd6a023b0',33,'chatcmpl-7IUfxFwF0z7QYcWZxTewZQosORRxr','2023-05-21 12:09:38','2023-05-21 12:09:38'),(34,'63c3e7be-f7fe-4ea6-b727-88bfd6a023b0',34,'chatcmpl-7IUgOaweHoBAICuSlrtRuPxlX5uho','2023-05-21 12:10:16','2023-05-21 12:10:16'),(35,'223ab431-5716-4fd0-86f8-e0e36f021e41',35,'chatcmpl-7IUhaxM9j8MZKFXiJYYql7GvjKdNF','2023-05-21 12:11:19','2023-05-21 12:11:19'),(36,'223ab431-5716-4fd0-86f8-e0e36f021e41',36,'chatcmpl-7IUi3CtJkQhxN3vtbu7HXbMUdTBlq','2023-05-21 12:11:56','2023-05-21 12:11:56'),(37,'dbe8bd52-efc9-4f92-b9d6-a5fcd0a4a865',37,'chatcmpl-7IUicW6EUEda47VjF6EMeayhbiU7x','2023-05-21 12:12:30','2023-05-21 12:12:30'),(38,'dbe8bd52-efc9-4f92-b9d6-a5fcd0a4a865',38,'chatcmpl-7IUitietpye4EGnqHbbto3QGUc85f','2023-05-21 12:12:55','2023-05-21 12:12:55'),(39,'dbe8bd52-efc9-4f92-b9d6-a5fcd0a4a865',39,'chatcmpl-7IUjNscTx0i3DRsdWj4qKTvCQnODa','2023-05-21 12:13:11','2023-05-21 12:13:11'),(40,'dbe8bd52-efc9-4f92-b9d6-a5fcd0a4a865',40,'chatcmpl-7IUjo4wX0QmrMnxnzecT6f9dTKq5A','2023-05-21 12:13:47','2023-05-21 12:13:47'),(41,'b2eb2f56-2650-4f0b-82a6-cdfb30278c9b',41,'chatcmpl-7IUkC97PmYj1iY8evxJ57eY8lwtkq','2023-05-21 12:14:08','2023-05-21 12:14:08'),(42,'b2eb2f56-2650-4f0b-82a6-cdfb30278c9b',42,'chatcmpl-7IUkmueaVz7brMV8IJcwDBsYGelzk','2023-05-21 12:14:50','2023-05-21 12:14:50'),(43,'b2eb2f56-2650-4f0b-82a6-cdfb30278c9b',43,'chatcmpl-7IUlZ2kncW7bRLmvizAyXaM3hDYit','2023-05-21 12:15:30','2023-05-21 12:15:30'),(44,'b2eb2f56-2650-4f0b-82a6-cdfb30278c9b',44,'chatcmpl-7IUmbL6hp9RT3Xgq0z6BHRFKR2A97','2023-05-21 12:16:32','2023-05-21 12:16:32'),(45,'5b92c86f-4c5a-4791-b312-113869505c32',45,'chatcmpl-7IUo8Hf3JE8gSpnsFjDL2VYJSFBEh','2023-05-21 12:18:07','2023-05-21 12:18:07'),(46,'5b92c86f-4c5a-4791-b312-113869505c32',46,'chatcmpl-7IUoRMpPOPFExMLAePPtIGAFxLy3y','2023-05-21 12:18:27','2023-05-21 12:18:27'),(47,'5b92c86f-4c5a-4791-b312-113869505c32',47,'chatcmpl-7IUoeVVumaIaP25tELaLLgMSKCq6X','2023-05-21 12:18:43','2023-05-21 12:18:43'),(48,'5b92c86f-4c5a-4791-b312-113869505c32',48,'chatcmpl-7IUps6Dczzv3cdOZamU1dWbmiyuxQ','2023-05-21 12:19:57','2023-05-21 12:19:57'),(49,'5b92c86f-4c5a-4791-b312-113869505c32',49,'chatcmpl-7IUrHeAQiy9MntX5JtbB7eCmY5Wv0','2023-05-21 12:21:21','2023-05-21 12:21:21'),(50,'5b92c86f-4c5a-4791-b312-113869505c32',50,'chatcmpl-7IUrTAhfMfwjNMCEBxg3olRGE3ZaF','2023-05-21 12:21:39','2023-05-21 12:21:39'),(51,'5b92c86f-4c5a-4791-b312-113869505c32',51,'chatcmpl-7IUrj2p7sQsmLmgXcxM3KXNVXSuE4','2023-05-21 12:21:51','2023-05-21 12:21:51'),(52,'7896ed59-0d42-46bc-a4e3-23717f94f792',52,'chatcmpl-7IUs2pxVphiWrYBRUGu6jUdI0j6EB','2023-05-21 12:22:14','2023-05-21 12:22:14'),(53,'62d1b3d2-6623-4a18-b77a-4c453975ac57',53,'chatcmpl-7IusPkGzBopLT5v1OAFenPNuLYOEg','2023-05-22 16:08:15','2023-05-22 16:08:15'),(54,'85ba2c19-10b4-45a8-bb8b-5420d81e9ba7',54,'chatcmpl-7IuwO63idk8hXcVQ47AZl3nmUaPZ3','2023-05-22 16:12:21','2023-05-22 16:12:21'),(55,'85ba2c19-10b4-45a8-bb8b-5420d81e9ba7',55,'','2023-05-22 16:13:16','2023-05-22 16:13:16'),(56,'67f425fc-848c-4404-934c-573a7961cde7',56,'chatcmpl-7Iv5J1fON5inl7SWUvMGXtb8VIb6a','2023-05-22 16:22:26','2023-05-22 16:22:26'),(57,'67f425fc-848c-4404-934c-573a7961cde7',57,'','2023-05-22 16:23:27','2023-05-22 16:23:27'),(58,'d560028d-8c1f-473c-a25c-0c395f3cceb4',58,'','2023-05-22 16:23:44','2023-05-22 16:23:44'),(59,'669dcac5-1b33-4807-abe5-0f6b695afcd6',59,'chatcmpl-7Iv7ZBvugbUaftWSbvo3Q4au22Tfv','2023-05-22 16:23:59','2023-05-22 16:23:59'),(60,'669dcac5-1b33-4807-abe5-0f6b695afcd6',60,'','2023-05-22 16:24:05','2023-05-22 16:24:05'),(61,'8166eda4-1f70-4611-b225-dda70999dedd',61,'','2023-05-22 16:29:36','2023-05-22 16:29:36'),(62,'eabf1d6e-6fd7-4baa-935a-2e6df09f6b99',62,'','2023-05-22 16:31:35','2023-05-22 16:31:35'),(63,'2e055ee3-5779-4119-bbe7-83837ae69085',63,'chatcmpl-7IwMLudYVhZDFjkihIHOfCTgEEh22','2023-05-22 17:43:16','2023-05-22 17:43:16'),(64,'2e055ee3-5779-4119-bbe7-83837ae69085',64,'','2023-05-22 17:43:20','2023-05-22 17:43:20'),(65,'3bb0c3fc-6fc3-43e2-99ea-70aef3d4d65f',65,'chatcmpl-7IwManZrXBNhoN5lZSy0uX3npfI1i','2023-05-22 17:43:29','2023-05-22 17:43:29'),(66,'3bb0c3fc-6fc3-43e2-99ea-70aef3d4d65f',66,'','2023-05-22 17:51:03','2023-05-22 17:51:03'),(67,'d2525b08-c5be-4eda-a6f0-7cb66e5705af',67,'chatcmpl-7IwU1WDNVxAUJaBjPifZhlBXL5KIn','2023-05-22 17:51:17','2023-05-22 17:51:17'),(68,'d2525b08-c5be-4eda-a6f0-7cb66e5705af',68,'chatcmpl-7Iwaom33j0qQuTWyhafTdgvzS3zjx','2023-05-22 17:58:20','2023-05-22 17:58:20'),(69,'d2525b08-c5be-4eda-a6f0-7cb66e5705af',69,'chatcmpl-7Iwb0SHDVXGCIPgxTROTJW9kEkdKW','2023-05-22 17:58:25','2023-05-22 17:58:25'),(70,'d2525b08-c5be-4eda-a6f0-7cb66e5705af',70,'chatcmpl-7IwbA2a5Ezhh6A4cN6o4oaqyPaSs9','2023-05-22 17:58:34','2023-05-22 17:58:34'),(71,'d2525b08-c5be-4eda-a6f0-7cb66e5705af',71,'chatcmpl-7IwhM0fHVhaa38elHj5dcyiE6hJVF','2023-05-22 18:04:59','2023-05-22 18:04:59'),(72,'d2525b08-c5be-4eda-a6f0-7cb66e5705af',72,'chatcmpl-7IwhUf7x8bOuqqkFijdmtnSFU9yIm','2023-05-22 18:05:05','2023-05-22 18:05:05'),(73,'7f639a22-7486-4ca0-b600-8b85f2f422b3',73,'chatcmpl-7IwiCfVclrU51S8IlGbNfqse8ClaJ','2023-05-22 18:05:52','2023-05-22 18:05:52'),(74,'cc7b899b-4400-490d-a799-f44950eadaf6',74,'chatcmpl-7IwiGM8z0fTscVKylsQbveCwJUh1I','2023-05-22 18:05:55','2023-05-22 18:05:55'),(75,'7f639a22-7486-4ca0-b600-8b85f2f422b3',75,'chatcmpl-7IwiOwMskWMMFfkceNNTgaLe21JID','2023-05-22 18:06:08','2023-05-22 18:06:08'),(76,'7f639a22-7486-4ca0-b600-8b85f2f422b3',76,'chatcmpl-7IwiYWb4WpEEveH56DNsYb56FKxBp','2023-05-22 18:06:20','2023-05-22 18:06:20'),(77,'7f639a22-7486-4ca0-b600-8b85f2f422b3',77,'chatcmpl-7IwjCtVpZzbOMqNVAmw1CaAMM889m','2023-05-22 18:07:10','2023-05-22 18:07:10'),(78,'7f639a22-7486-4ca0-b600-8b85f2f422b3',78,'chatcmpl-7IwpNvPvDeaxPHSLgnTu296nuLFe8','2023-05-22 18:14:19','2023-05-22 18:14:19'),(79,'1eff7aae-846b-4527-84a4-a7a9fb815636',79,'chatcmpl-7Iy3UDEHoDmGQs5axdB5B3nPzDrwV','2023-05-22 19:31:56','2023-05-22 19:31:56'),(80,'cc3c91a6-64f2-4e8c-8875-86554f241729',80,'chatcmpl-7IyOtgVz7qCUfHl8yuwZ6Q2LBZb87','2023-05-22 19:56:42','2023-05-22 19:56:42'),(81,'cdaae3d0-e4df-46bf-954a-bcb60d2d7d06',81,'chatcmpl-7IypTKFXTgXcpmHoUJOp4KtaXDYqr','2023-05-22 20:21:35','2023-05-22 20:21:35'),(82,'cdaae3d0-e4df-46bf-954a-bcb60d2d7d06',82,'chatcmpl-7IyqDKpgd5zeTF8A5rZQ94hGagJMP','2023-05-22 20:22:22','2023-05-22 20:22:22'),(83,'428fe517-de9d-449e-bcb6-a3db8c4b5f9a',83,'chatcmpl-7Iz1P8898YahmBAGK9bnU36jCYtuE','2023-05-22 20:34:29','2023-05-22 20:34:29'),(84,'428fe517-de9d-449e-bcb6-a3db8c4b5f9a',84,'chatcmpl-7Iz307h0kL7xPsqhPYL10b4HYjvib','2023-05-22 20:35:50','2023-05-22 20:35:50');
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
  KEY `chat_titles_message_id_index` (`message_id`(191)),
  KEY `chat_titles_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='对话窗口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_titles`
--

LOCK TABLES `chat_titles` WRITE;
/*!40000 ALTER TABLE `chat_titles` DISABLE KEYS */;
INSERT INTO `chat_titles` VALUES (1,1,'你好呀','1eeb6419-0b87-4335-ad00-fdc177a64614','chatcmpl-7HnDdnqMVZzF59Zanyjy2bXZR19JZ',10,'2023-05-19 13:45:31','2023-05-19 13:45:31'),(2,1,'死了都要爱','d2e0a7fd-adf1-4913-9503-b4a91ea7a757','chatcmpl-7HnziHf9tJgajcuJRhbik48hbDSUb',10,'2023-05-19 14:35:37','2023-05-19 14:35:37'),(3,3,'2023年河南参加高考','650ad40a-6a05-4f13-9169-0dbc34d92742','',10,'2023-05-19 15:34:54','2023-05-19 15:34:54'),(4,3,'你不会吗？','c12b5b05-176c-4800-b75f-a818a014dcf5','chatcmpl-7HoxqyeipiErrh09KvjJzr5kGQ65J',10,'2023-05-19 15:37:24','2023-05-19 15:37:24'),(5,1,'2023年河南参加高考','50dd66fe-9578-4a90-8103-fa3c746b42b9','',10,'2023-05-19 15:38:27','2023-05-19 15:38:27'),(6,1,'2023年河南高考人数','4da6d610-f4ec-4a2e-9597-197ba70ce49c','chatcmpl-7Hozj6xV6UHW3k3qIGvHWz7Zwlxum',10,'2023-05-19 15:39:22','2023-05-19 15:39:22'),(7,3,'2022年河南参加高考','8d276aea-0619-4a28-bc8a-bc0abc6cc171','',10,'2023-05-19 15:39:55','2023-05-19 15:39:55'),(8,1,'2022年河南参加高考','df4155e8-6cc7-4f5c-86a2-c48b9e4a6b6f','chatcmpl-7HpGOVdnMHlSsTF7dcgLDppTzm2E2',10,'2023-05-19 15:56:36','2023-05-19 15:56:36'),(9,6,'多选题）英国哲学家卡尔','ccee5e87-9fe9-489a-8a0f-2a3c53961d4f','chatcmpl-7IUS9IOMGenDaWEd6YUXnjiuSA91R',10,'2023-05-21 11:55:35','2023-05-21 11:55:35'),(10,6,'（多选题）智能交通系统','fa6ebb72-8819-45dc-b109-9c5ff2890d29','chatcmpl-7IUUYZ5QQQblFqmOBrpkjvhOuLBBe',10,'2023-05-21 11:57:54','2023-05-21 11:57:54'),(11,6,'（多选题）探索机器人包','c2760828-0037-4e85-af76-164b7273e55b','chatcmpl-7IUYkNsIew9lOKOkgQGx1mexgJzVp',10,'2023-05-21 12:02:14','2023-05-21 12:02:14'),(12,6,'(判断题) 如果在负反','e1e0136c-219f-4e78-ad61-3182148913b0','chatcmpl-7IUafnHosGsqyADS9Mvz7QUVvfY80',10,'2023-05-21 12:04:15','2023-05-21 12:04:15'),(13,7,'(判断题) 智能汽车的','4708baaa-f437-4fe5-9b22-b1ed2e46f7ee','chatcmpl-7IUc0MhhKNPZyUpwGD5cFxGwuUOXS',10,'2023-05-21 12:05:43','2023-05-21 12:05:43'),(14,7,'(判断题) 虽然人工智','150a8a66-1d3b-47c7-9d34-f634aacadae9','chatcmpl-7IUcy8T5yIZXq5PbRk254PkHh81YM',10,'2023-05-21 12:06:42','2023-05-21 12:06:42'),(15,7,'(判断题) 动态视觉属','e3956be6-8b78-4f46-ac89-7470085dab08','chatcmpl-7IUesMOUaLtN9p9lNQPkZMHRuPxnn',10,'2023-05-21 12:08:30','2023-05-21 12:08:30'),(16,7,'(判断题) 三元组的基','63c3e7be-f7fe-4ea6-b727-88bfd6a023b0','chatcmpl-7IUfxFwF0z7QYcWZxTewZQosORRxr',10,'2023-05-21 12:09:37','2023-05-21 12:09:37'),(17,8,'(判断题) 最早的人工','223ab431-5716-4fd0-86f8-e0e36f021e41','chatcmpl-7IUhaxM9j8MZKFXiJYYql7GvjKdNF',10,'2023-05-21 12:11:19','2023-05-21 12:11:19'),(18,8,'(判断题) 计算机知识','dbe8bd52-efc9-4f92-b9d6-a5fcd0a4a865','chatcmpl-7IUicW6EUEda47VjF6EMeayhbiU7x',10,'2023-05-21 12:12:30','2023-05-21 12:12:30'),(19,8,'图灵测试最终定义：测试','b2eb2f56-2650-4f0b-82a6-cdfb30278c9b','chatcmpl-7IUkC97PmYj1iY8evxJ57eY8lwtkq',10,'2023-05-21 12:14:07','2023-05-21 12:14:07'),(20,9,'虹膜识别可以应用在哪些','5b92c86f-4c5a-4791-b312-113869505c32','chatcmpl-7IUo8Hf3JE8gSpnsFjDL2VYJSFBEh',10,'2023-05-21 12:18:07','2023-05-21 12:18:07'),(21,9,'(判断题) 某些APP','7896ed59-0d42-46bc-a4e3-23717f94f792','chatcmpl-7IUs2pxVphiWrYBRUGu6jUdI0j6EB',10,'2023-05-21 12:22:14','2023-05-21 12:22:14'),(22,1,'1+1','62d1b3d2-6623-4a18-b77a-4c453975ac57','chatcmpl-7IusPkGzBopLT5v1OAFenPNuLYOEg',10,'2023-05-22 16:08:15','2023-05-22 16:08:15'),(23,1,'1+1','85ba2c19-10b4-45a8-bb8b-5420d81e9ba7','chatcmpl-7IuwO63idk8hXcVQ47AZl3nmUaPZ3',10,'2023-05-22 16:12:21','2023-05-22 16:12:21'),(24,1,'1+1','67f425fc-848c-4404-934c-573a7961cde7','chatcmpl-7Iv5J1fON5inl7SWUvMGXtb8VIb6a',10,'2023-05-22 16:22:25','2023-05-22 16:22:25'),(25,1,'1+1','d560028d-8c1f-473c-a25c-0c395f3cceb4','',10,'2023-05-22 16:23:44','2023-05-22 16:23:44'),(26,1,'你好呀','669dcac5-1b33-4807-abe5-0f6b695afcd6','chatcmpl-7Iv7ZBvugbUaftWSbvo3Q4au22Tfv',10,'2023-05-22 16:23:59','2023-05-22 16:23:59'),(27,1,'1','8166eda4-1f70-4611-b225-dda70999dedd','',10,'2023-05-22 16:29:36','2023-05-22 16:29:36'),(28,1,'3+1','eabf1d6e-6fd7-4baa-935a-2e6df09f6b99','',10,'2023-05-22 16:31:35','2023-05-22 16:31:35'),(29,1,'你好呀','2e055ee3-5779-4119-bbe7-83837ae69085','chatcmpl-7IwMLudYVhZDFjkihIHOfCTgEEh22',10,'2023-05-22 17:43:15','2023-05-22 17:43:15'),(30,1,'1+1','3bb0c3fc-6fc3-43e2-99ea-70aef3d4d65f','chatcmpl-7IwManZrXBNhoN5lZSy0uX3npfI1i',10,'2023-05-22 17:43:29','2023-05-22 17:43:29'),(31,1,'你好呀','d2525b08-c5be-4eda-a6f0-7cb66e5705af','chatcmpl-7IwU1WDNVxAUJaBjPifZhlBXL5KIn',10,'2023-05-22 17:51:17','2023-05-22 17:51:17'),(32,14,'你好','7f639a22-7486-4ca0-b600-8b85f2f422b3','chatcmpl-7IwiCfVclrU51S8IlGbNfqse8ClaJ',10,'2023-05-22 18:05:52','2023-05-22 18:05:52'),(33,15,'你好','cc7b899b-4400-490d-a799-f44950eadaf6','chatcmpl-7IwiGM8z0fTscVKylsQbveCwJUh1I',10,'2023-05-22 18:05:55','2023-05-22 18:05:55'),(34,20,'你好','1eff7aae-846b-4527-84a4-a7a9fb815636','chatcmpl-7Iy3UDEHoDmGQs5axdB5B3nPzDrwV',10,'2023-05-22 19:31:56','2023-05-22 19:31:56'),(35,15,'我正在做一个网站关于虚','cc3c91a6-64f2-4e8c-8875-86554f241729','chatcmpl-7IyOtgVz7qCUfHl8yuwZ6Q2LBZb87',10,'2023-05-22 19:56:42','2023-05-22 19:56:42'),(36,15,'我正在做一个网站需要您','cdaae3d0-e4df-46bf-954a-bcb60d2d7d06','chatcmpl-7IypTKFXTgXcpmHoUJOp4KtaXDYqr',10,'2023-05-22 20:21:35','2023-05-22 20:21:35'),(37,22,'描述一只凶猛的狗，周围','428fe517-de9d-449e-bcb6-a3db8c4b5f9a','chatcmpl-7Iz1P8898YahmBAGK9bnU36jCYtuE',10,'2023-05-22 20:34:29','2023-05-22 20:34:29');
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
  KEY `chats_prompt_index` (`prompt`(191)),
  KEY `chats_total_tokens_index` (`total_tokens`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,1,15,'gpt-3.5-turbo','times',100,NULL,'你好呀','你好！有什么我可以帮你解决的问题吗？',61,20,81,100,'2023-05-19 13:45:31','2023-05-19 13:45:31',NULL),(2,1,15,'gpt-3.5-turbo','times',100,NULL,'死了都要爱','播放列表名称：深情款款的暴击\n\n播放列表描述：这个播放列表包含了一些类似于“死了都要爱”的歌曲，它们都展现了深情和强烈的爱情情感。\n\n歌曲：\n1. 林宥嘉 - 失落沮喪痛苦歌\n2. 詹雅雯 - 不完美的完美\n3. 大壮 - 我们不一样\n4. 杨坤 - 心跳\n5. 张国荣 - 别问我是谁\n6. 周杰伦 - 简单爱\n7. 汪苏泷 - 最好\n8. 薛之谦 - 暧昧\n9. G.E.M.邓紫棋 - 光年之外\n10. 网络歌手江珊 - 明天会更好',154,243,397,100,'2023-05-19 14:35:38','2023-05-19 14:35:38',NULL),(3,1,15,'gpt-3.5-turbo','times',100,NULL,'明天会更好','播放列表名称：深邃吟唱\n\n播放列表描述：这个播放列表里包含 10 首与“Other Lives - Epic”相似的歌曲，它们都有着深邃、神秘的吟唱和有力量的旋律。\n\n歌曲：\n1. The National - Bloodbuzz Ohio\n2. Daughter - Youth\n3. Sufjan Stevens - Futile Devices\n4. Bon Iver - Perth\n5. Fleet Foxes - Helplessness Blues\n6. Grizzly Bear - Two Weeks\n7. Local Natives - Airplanes\n8. Lord Huron - The Night We Met\n9. The Tallest Man On Earth - There’s No Leaving Now\n10. Iron & Wine - Naked As We Came',412,182,594,100,'2023-05-19 14:57:12','2023-05-19 14:57:12',NULL),(4,3,15,'gpt-3.5-turbo','times',100,NULL,'2023年河南参加高考的人数有多少','error, This model\'s maximum context length is 4097 tokens. However, you requested 4097 tokens (73 in the messages, 4024 in the completion). Please reduce the length of the messages or completion.',72,45,117,100,'2023-05-19 15:34:55','2023-05-19 15:34:55',NULL),(5,3,15,'gpt-3.5-turbo','times',100,NULL,'你不会吗？','作为机器人，我没有自己的知识，而是通过训练来学习和回答问题。如果您有任何问题，请随时问我。',63,46,109,100,'2023-05-19 15:37:24','2023-05-19 15:37:24',NULL),(6,3,15,'gpt-3.5-turbo','times',100,NULL,'2023年河南参加高考的人数有多少？','error, This model\'s maximum context length is 4097 tokens. However, you requested 4097 tokens (136 in the messages, 3961 in the completion). Please reduce the length of the messages or completion.',135,45,180,100,'2023-05-19 15:37:54','2023-05-19 15:37:54',NULL),(7,1,15,'gpt-3.5-turbo','times',100,NULL,'2023年河南参加高考的人数有多少','很抱歉，我作为聊天机器人不能通过互联网访问未来的信息。但是，你可以查询2023年河南高考人数的历史数据和趋势以进行预测。',620,62,682,100,'2023-05-19 15:38:00','2023-05-19 15:38:00',NULL),(8,1,14,'gpt-4','tokens',6,NULL,'2023年河南参加高考的人数有多少','error, ',163,3,166,996,'2023-05-19 15:38:28','2023-05-19 15:38:28',NULL),(9,1,15,'gpt-3.5-turbo','times',100,NULL,'2023年河南高考人数的历史数据和趋势','很抱歉，我是一个语言模型，无法访问实时数据或提供未来预测。您可以咨询河南省招生考试院或相关教育部门获取更准确的数据和趋势预测。',167,72,239,100,'2023-05-19 15:39:22','2023-05-19 15:39:22',NULL),(10,3,15,'gpt-3.5-turbo','times',100,NULL,'2022年河南参加高考的人数有多少？','error, This model\'s maximum context length is 4097 tokens. However, you requested 4097 tokens (74 in the messages, 4023 in the completion). Please reduce the length of the messages or completion.',73,45,118,100,'2023-05-19 15:39:55','2023-05-19 15:39:55',NULL),(11,1,15,'gpt-3.5-turbo','times',100,NULL,'2022年河南参加高考的人数有多少？','很抱歉，我无法提供最新的河南省高考报名人数数据。您可以查看河南省教育招生考试院的官方网站或联系相关部门以获取更准确的信息。',164,65,229,100,'2023-05-19 15:56:37','2023-05-19 15:56:37',NULL),(12,1,15,'gpt-3.5-turbo','times',100,NULL,'golang批量导出数据库数据到txt文件','您可以使用 Golang 中的 database/sql 和 bufio 包来批量导出数据库数据到 txt 文件中。下面是一个简单的示例代码：\n\n```go\npackage main\n\nimport (\n	\"bufio\"\n	\"database/sql\"\n	\"fmt\"\n	\"log\"\n	\"os\"\n)\n\nfunc main() {\n	// 连接数据库\n	db, err := sql.Open(\"数据库类型\", \"连接字符串\")\n	if err != nil {\n		log.Fatal(err)\n	}\n	defer db.Close()\n\n	// 查询数据\n	rows, err := db.Query(\"SELECT * FROM 表名\")\n	if err != nil {\n		log.Fatal(err)\n	}\n	defer rows.Close()\n\n	// 创建文件\n	file, err := os.Create(\"data.txt\")\n	if err != nil {\n		log.Fatal(err)\n	}\n	defer file.Close()\n\n	// 写入数据到文件\n	writer := bufio.NewWriter(file)\n	for rows.Next() {\n		var (\n			col1 string\n			col2 int\n			col3 float64\n		)\n\n		err := rows.Scan(&col1, &col2, &col3)\n		if err != nil {\n			log.Fatal(err)\n		}\n\n		_, err = writer.WriteString(fmt.Sprintf(\"%s %d %f\\n\", col1, col2, col3))\n		if err != nil {\n			log.Fatal(err)\n		}\n	}\n	writer.Flush()\n\n	if err := rows.Err(); err != nil {\n		log.Fatal(err)\n	}\n}\n```\n\n请将上述代码中的数据库类型、连接字符串、表名和列名替换为您的实际值，并根据需要自定义文件名和导出格式。',251,352,603,100,'2023-05-19 18:27:56','2023-05-19 18:27:56',NULL),(13,1,15,'gpt-3.5-turbo','times',100,NULL,'golang批量导出数据库数据到txt文件并下载到本地\n','您可以使用 `net/http` 包来将文本文件作为响应发送给浏览器，从而实现以下载方式将导出的数据文件保存到本地。\n\n下面是一个基于上一个回答的代码示例，实现将查询结果写入 txt 文件，并将该文件发送给浏览器下载：\n\n```go\npackage main\n\nimport (\n	\"bufio\"\n	\"database/sql\"\n	\"fmt\"\n	\"log\"\n	\"net/http\"\n	\"os\"\n)\n\nfunc main() {\n	// 连接数据库\n	db, err := sql.Open(\"数据库类型\", \"连接字符串\")\n	if err != nil {\n		log.Fatal(err)\n	}\n	defer db.Close()\n\n	// 查询数据\n	rows, err := db.Query(\"SELECT * FROM 表名\")\n	if err != nil {\n		log.Fatal(err)\n	}\n	defer rows.Close()\n\n	// 创建文件\n	file, err := os.Create(\"data.txt\")\n	if err != nil {\n		log.Fatal(err)\n	}\n	defer file.Close()\n\n	// 写入数据到文件\n	writer := bufio.NewWriter(file)\n	for rows.Next() {\n		var (\n			col1 string\n			col2 int\n			col3 float64\n		)\n\n		err := rows.Scan(&col1, &col2, &col3)\n		if err != nil {\n			log.Fatal(err)\n		}\n\n		_, err = writer.WriteString(fmt.Sprintf(\"%s %d %f\\n\", col1, col2, col3))\n		if err != nil {\n			log.Fatal(err)\n		}\n	}\n	writer.Flush()\n\n	// 设置 HTTP 服务器\n	http.HandleFunc(\"/download\", func(w http.ResponseWriter, r *http.Request) {\n		fileName := \"data.txt\"\n		w.Header().Set(\"Content-Disposition\", fmt.Sprintf(\"attachment; filename=\\\"%s\\\"\", fileName))\n		w.Header().Set(\"Content-Type\", \"text/plain\")\n		http.ServeFile(w, r, fileName)\n	})\n\n	// 启动 HTTP 服务器\n	log.Fatal(http.ListenAndServe(\":8080\", nil))\n}\n```\n\n请将上述代码中的数据库类型、连接字符串、表名和列名替换为您的实际值，根据需要自定义文件名和导出格式，并将 HTTP 服务器端口号改为您需要的值。然后运行代码并访问 `http://localhost:8080/download` 即可下载导出的 txt 文件。',630,523,1153,100,'2023-05-19 18:29:19','2023-05-19 18:29:19',NULL),(14,1,15,'gpt-3.5-turbo','times',100,NULL,'1+1','1+1=2',1167,5,1172,100,'2023-05-20 09:27:43','2023-05-20 09:27:43',NULL),(15,6,15,'gpt-3.5-turbo','times',100,NULL,'多选题）英国哲学家卡尔·波普尔提出“通过证伪而增长的科学发展模式”，他认为（ ）。       A.猜想和反驳是科学发展过程中最基本的环节。  B.科学通过把过去的成果逐渐合并到现在的理论中而不断进化。 C.科学理论不能通过归纳得到证实，但却能被证伪。  D.科学是在从事实出发，用概念去综合事实，使事实上升为定律。','选项A、C正确，选项B、D错误。卡尔·波普尔提出的科学发展模式是基于“经验主义”和“唯证主义”的，他认为科学理论不能被证实，只能被证伪，因此科学是不断进行猜想和反驳的过程。科学通过不断推翻过去的错误理论，建立新的理论来发展。科学理论的形成是从已有的事实中归纳出假设，然后反复通过实验和观察进行反驳和修正，因此科学理论的认识是进化的过程。',222,179,401,100,'2023-05-21 11:55:35','2023-05-21 11:55:35',NULL),(16,6,15,'gpt-3.5-turbo','times',100,NULL,'（多选题）如下属于工业机器人的子系统的是（ ）。       A.人机交互系统  B.生理系统 C.感知系统  D.机械结构系统','选项A、C、D正确，选项B错误。工业机器人的主要组成部分为机器人控制系统、机械结构系统、感知系统和人机交互系统。其中，机器人控制系统是机器人的大脑，控制机器人运动和执行任务，机械结构系统是机器人的骨架，提供动力和力矩，感知系统使机器人感知周围环境和物体，人机交互系统则是机器人与人进行交互的界面。因此，生理系统不属于工业机器人的子系统。',464,172,636,100,'2023-05-21 11:56:52','2023-05-21 11:56:52',NULL),(17,6,15,'gpt-3.5-turbo','times',100,NULL,'（多选题）智能交通系统主要的技术范围包括（ ）。        A.智能化交通信息服务系统  B.智能化交通管理系统 C.智能化公共交通系统  D.智能化车辆控制系统','A.智能化交通信息服务系统  B.智能化交通管理系统 C.智能化公共交通系统  D.智能化车辆控制系统',132,47,179,100,'2023-05-21 11:57:54','2023-05-21 11:57:54',NULL),(18,6,15,'gpt-3.5-turbo','times',100,NULL,'（多选题）人工智能分为哪三大学派？（ ） A.数字主义  B.符号主义 C.行为主义  D.连接主义','B.符号主义  D.连接主义  C.行为主义',236,19,255,100,'2023-05-21 11:59:24','2023-05-21 11:59:24',NULL),(19,6,15,'gpt-3.5-turbo','times',100,NULL,'（多选题）以下属于人工智能孕育期的成就的是（ ）。 A.ENIAC  B.MP神经网络模型 C.控制论  D.图灵机','A.ENIAC C.控制论 D.图灵机 。虽然MP神经网络模型被认为是神经网络发展历史上的重要里程碑，但是它是在20世纪60年代开始开发的，超出了人工智能的孕育期。',319,84,403,100,'2023-05-21 12:00:39','2023-05-21 12:00:39',NULL),(20,6,15,'gpt-3.5-turbo','times',100,NULL,'（多选题）探索机器人包括（ ）。 A.考古机器人  B.室内机器人 C.水下机器人 D.空间机器人','A. 考古机器人\nB. 室内机器人\nC. 水下机器人\nD. 空间机器人\n\n正确答案：ABCD',105,47,152,100,'2023-05-21 12:02:14','2023-05-21 12:02:14',NULL),(21,6,15,'gpt-3.5-turbo','times',100,NULL,'（多选题）服务机器人发展的主要方向有（ ）。 A.全面化  B.智能化 C.安全化 D.市场化','A. 全面化\nB. 智能化\nC. 安全化\nD. 市场化\n\n正确答案：ABCD',204,37,241,100,'2023-05-21 12:03:10','2023-05-21 12:03:10',NULL),(22,6,15,'gpt-3.5-turbo','times',100,NULL,'人工智能诞生于1956年达特茅斯会议。（ ）','正确。',274,2,276,100,'2023-05-21 12:03:25','2023-05-21 12:03:25',NULL),(23,6,15,'gpt-3.5-turbo','times',100,NULL,'(判断题)人工智能诞生于1956年达特茅斯会议。（ ）','正确。',314,2,316,100,'2023-05-21 12:03:34','2023-05-21 12:03:34',NULL),(24,6,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 如果在负反馈系统的建模中加入一个‘人’的子系统模型。那么人在这个系统中不仅是“观察者”更是“行动者”。（ ','正确。在负反馈系统中，人可以被视为一个子系统，不仅作为观察者对系统状态进行监测，而且还可以通过其行动对系统进行干预和调节，从而影响系统的稳定性和行为。',114,73,187,100,'2023-05-21 12:04:15','2023-05-21 12:04:15',NULL),(25,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 智能汽车的正学习是指机器人向事故驾驶员吸取开车教训。（ ）','错误。智能汽车的正向学习通常是指汽车通过自身的学习和优化来提高性能和效率，而不是向事故驾驶员吸取开车教训。智能汽车会通过大量数据的分析和模式识别来学习路况、驾驶行为和交通信号等，以便更好地规划和执行行驶路线，提高行驶效率和安全性。',99,129,228,100,'2023-05-21 12:05:43','2023-05-21 12:05:43',NULL),(26,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 智能驾驶汽车在制动时间和制动距离上均优于人类驾驶，但在安全视距观测方面不如人类灵活。（ ）','正确。智能驾驶汽车在一些方面表现出色，如反应速度、制动时间和距离等，但在提供灵活的安全视距观测方面还需进一步的提高。与人类相比，智能驾驶汽车的传感器可能会被雨、雪、浓雾等天气条件干扰，从而降低其视距。这种情况下，人类驾驶员通常会减速或停车等避免发生危险，但智能驾驶汽车可能需要更高级别的算法和传感器才能在低视距情况下正确识别和避让障碍物。',299,205,504,100,'2023-05-21 12:06:10','2023-05-21 12:06:10',NULL),(27,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 虽然人工智能在医疗卫生领域发展应用迅速，但由于中医看病主要是通过望闻问切，因此人工智能技术并不能用于中医。（ ）','错误。虽然中医诊断主要依赖于望闻问切等非数字化的方法，但是现代医学已经开始研究如何将人工智能技术应用于中医的诊断和治疗。例如，利用人工智能算法对中医经典文献进行分析和归纳，开发中医药智能诊断辅助系统等。',134,125,259,100,'2023-05-21 12:06:42','2023-05-21 12:06:42',NULL),(28,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 交通信息服务系统主要包括异常交通信息及时采集与提供、异常交通救援、二次事故的预防、关联交通的诱导与疏散等。（ ） ','部分正确。交通信息服务系统主要包括交通信息采集、传输、处理和发布等环节，其中包括异常交通信息的采集与提供、交通诱导与疏导等，但并不包括异常交通救援和二次事故预防等。',334,83,417,100,'2023-05-21 12:06:56','2023-05-21 12:06:56',NULL),(29,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 机器人大脑是一个大型运算系统，可以帮助机器人识别各种信息、理解人类的语言和行为。（ ） ','部分正确。机器人大脑不仅是一个大型运算系统，还包括感知模块、控制模块、语言处理模块和决策模块等多个组成部分。大脑通过感知模块获取外界信息、通过语言处理模块理解人类语言、通过控制模块控制机器人运动，最终通过决策模块做出决策。因此，机器人大脑是帮助机器人识别各种信息、理解人类的语言和行为的重要组成部分。',478,169,647,100,'2023-05-21 12:07:34','2023-05-21 12:07:34',NULL),(30,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 人工智能的加入，使得机器人不再是冷冰冰的机器，而具有一定的智能思维。（ ）','正确。人工智能技术的应用，使得机器人具有了一定的智能和自主决策的能力，可以通过学习和实践不断提升自身的智能水平。因此，人工智能的加入可以使机器人不再是一味地执行预设程序，而是可以像人类一样根据情境变化做出灵活的反应。',706,116,822,100,'2023-05-21 12:08:09','2023-05-21 12:08:09',NULL),(31,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 动态视觉属于机器视觉的前沿课题之一。（ ）','是。',88,2,90,100,'2023-05-21 12:08:30','2023-05-21 12:08:30',NULL),(32,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 人工智能可以用于智能客服，帮助我们降低金融风险。（ ）','是的，人工智能可以用于智能客服和金融风险管理。通过聊天机器人和自然语言处理技术，智能客服可以帮助客户快速解决问题。而在金融风险管理方面，人工智能可以分析和预测市场趋势，识别投资机会和潜在风险。',140,114,254,100,'2023-05-21 12:09:10','2023-05-21 12:09:10',NULL),(33,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 三元组的基本形式主要有两种：实体1-关系-实体2，实体-属性-属性值','正确。',95,2,97,100,'2023-05-21 12:09:37','2023-05-21 12:09:37',NULL),(34,7,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 机器人驾驶时，利用搜索匹配引擎，通过驾驶态势以图搜图，实时地在记忆棒中近似搜索，找到符合当前驾驶态势的认知箭头，形成控制指令输出。（ ）','错误。这个描述不太准确。机器人驾驶时，通常采用的技术是感知、规划和控制（perception, planning, and control）三个部分的组合，通过对环境的感知获取信息，进行路径规划和决策，最终输出控制指令。搜索匹配引擎更多地应用于图像检索、搜索排序等领域，不是机器人驾驶单独使用的技术，因此与机器人驾驶的描述不一致。',193,154,347,100,'2023-05-21 12:10:16','2023-05-21 12:10:16',NULL),(35,8,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 最早的人工神经元模型是麦克洛克与W.皮茨于1943年提出的MP神经元模型。（ ）','真的。',108,3,111,100,'2023-05-21 12:11:19','2023-05-21 12:11:19',NULL),(36,8,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 遗传算法控制系统是模拟人脑的智能行为设计对应的学习算法。（ ）','不对。遗传算法是一种优化算法，其灵感来源于自然界中生物遗传演化的过程，而非模拟人脑的智能行为设计。虽然遗传算法可以应用于机器学习算法中，但其本身不是一种学习算法。因此，这个判断题的说法不正确。',162,104,266,100,'2023-05-21 12:11:56','2023-05-21 12:11:56',NULL),(37,8,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 计算机知识表示是将人类知识形式化或者模型化。（ ）','正确。计算机知识表示是一种将人类知识形式化或者模型化的方法，以便计算机可以理解和使用它。计算机知识表示的目的是将人类的知识转换为计算机可处理的形式，使计算机能够对知识进行推理、分类、问题求解等操作。',88,96,184,100,'2023-05-21 12:12:30','2023-05-21 12:12:30',NULL),(38,8,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 机器翻译现状可概括为如下四点：发展很快、译文质量普遍很低、理想与现实之间差距很大、理论研究没有重大突破但性能逐渐提高。（ ） ','部分正确。机器翻译现状的概括可以描述为以下几点：发展很快，取得了很大的进步；机器翻译的译文质量虽然还存在提升空间，但是已经可以满足特定场景下的需求；机器翻译的理想与现实之间差距确实存在，但是该差距逐渐减小；机器翻译的理论研究存在一些突破，但是我们仍然需要更多的研究来进一步提高性能。因此本题应选择“部分正确”。',286,185,471,100,'2023-05-21 12:12:55','2023-05-21 12:12:55',NULL),(39,8,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 机器翻译现状可概括为如下四点：智慧农业是智慧经济形态在农业中的具体表现。（ ）','错误。该描述与题面无关，且回答错误。',539,16,555,100,'2023-05-21 12:13:11','2023-05-21 12:13:11',NULL),(40,8,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 人工智能对于社会的影响远小于互联网对于社会的影响。（ ）','错误。虽然互联网已经给我们带来了巨大的影响，但人工智能的发展将是未来的趋势，对于社会的影响也是十分重要且潜力无限的。随着人工智能技术的不断发展和应用，它将深刻地改变我们的生产方式、生活方式、社会结构、人类方式等方面。因此，本题的判断为错误。',603,132,735,100,'2023-05-21 12:13:47','2023-05-21 12:13:47',NULL),(41,8,15,'gpt-3.5-turbo','times',100,NULL,'图灵测试最终定义：测试者与被测试者（一个人和一台机器）隔开的情况下，通过一些装置（如键盘）向被测试者随意提问。进行多次测试后，如果机器让平均每个参与者做出超过70%的误判，那么这台机器就通过了测试，并被认为具有人类智能。（ ） ','这个定义不完全正确。 图灵测试的最终定义是：如果一个机器能够通过与人类的对话模拟人类到达无法判断其真假的程度，则可以认为它具有人类智能。并没有规定误判率必须达到70%以上，这是一个常见但是错误的误解。',170,94,264,100,'2023-05-21 12:14:08','2023-05-21 12:14:08',NULL),(42,8,15,'gpt-3.5-turbo','times',100,NULL,'虹膜识别相比于指纹识别和人脸识别，最大的优势是（ ）','虹膜识别相比于指纹识别和人脸识别，最大的优势是它的高度准确性和防欺诈性能，因为虹膜图案的几率和模式是唯一且不易伪造的。虹膜识别也不会受到外界光照和环境的影响。虹膜识别需要接近检测仪，但相比于指纹识别，虹膜识别不需要接触，因此它更加卫生和便利。',311,166,477,100,'2023-05-21 12:14:50','2023-05-21 12:14:50',NULL),(43,8,15,'gpt-3.5-turbo','times',100,NULL,'虹膜识别相比于指纹识别和人脸识别，最大的优势是（ ）A.技术更为成熟 B.更容易获取 C.安全性高，基本上无法伪造 D.应用范围更广','C. 安全性高，基本上无法伪造。虹膜图案的几率和模式是唯一且不易伪造的，因此虹膜识别的安全性更高。',565,61,626,100,'2023-05-21 12:15:30','2023-05-21 12:15:30',NULL),(44,8,15,'gpt-3.5-turbo','times',100,NULL,'虹膜识别具有下列哪些特性？（   ）A.安全性 B.稳定性 C.可变性 D.唯一性','虹膜识别具有安全性、稳定性、唯一性的特性，而不具备可变性的特性。',680,38,718,100,'2023-05-21 12:16:32','2023-05-21 12:16:32',NULL),(45,9,15,'gpt-3.5-turbo','times',100,NULL,'虹膜识别可以应用在哪些方面？（    ）A.军事 B.政务 C.安防 D.金融','虹膜识别可以应用在军事、政务、安防和金融等方面。',99,31,130,100,'2023-05-21 12:18:07','2023-05-21 12:18:07',NULL),(46,9,15,'gpt-3.5-turbo','times',100,NULL,'虹膜识别技术是目前发展最好的，应用最广的生物识别技术。','是的，虹膜识别技术是目前生物识别技术中发展最好、应用最广的一种。',174,39,213,100,'2023-05-21 12:18:27','2023-05-21 12:18:27',NULL),(47,9,15,'gpt-3.5-turbo','times',100,NULL,'我国虹膜识别刚刚起步，还处于初级阶段，应用和发展中也还存在不少的问题，需要我们不断探索。','是的，虽然我国虹膜识别技术在近年来得到了快速的发展，但它确实还处于初级阶段，应用和发展中也还存在着一些问题需要我们不断探索和解决。',271,73,344,100,'2023-05-21 12:18:43','2023-05-21 12:18:43',NULL),(48,9,15,'gpt-3.5-turbo','times',100,NULL,'以下日常生活中使用的设备，用到了语音识别技术的有 A.智能音箱 B.手机 C.圆珠笔 D.录音笔','A. 智能音箱和B. 手机用到了语音识别技术。C.圆珠笔和D.录音笔在日常生活中一般没有用到语音识别技术。',402,62,464,100,'2023-05-21 12:19:57','2023-05-21 12:19:57',NULL),(49,9,15,'gpt-3.5-turbo','times',100,NULL,'语音识别技术所具有的（   ）不仅能满足用户多种复杂需求，还可以打破中外语言、地区方言差异的壁垒，实现无障碍交流沟通。 A.快速性 B.无需动手性 C.智能性 D.实时性','B.无需动手性 C.智能性',569,13,582,100,'2023-05-21 12:21:20','2023-05-21 12:21:20',NULL),(50,9,15,'gpt-3.5-turbo','times',100,NULL,'自助下单、智能文本客服、智能语音等智能化应用，方便了我们的生活，不需要太关注伦理问题。','虽然智能化应用可以方便我们的生活，但是我们也需要关注伦理问题。比如，智能化应用是否会侵犯隐私？是否会替代人力从而导致失业率上升？因此，我们需要平衡方便性和道德、伦理方面的考量。',639,95,734,100,'2023-05-21 12:21:39','2023-05-21 12:21:39',NULL),(51,9,15,'gpt-3.5-turbo','times',100,NULL,'(判断题)  自助下单、智能文本客服、智能语音等智能化应用，方便了我们的生活，不需要太关注伦理问题。','错误。虽然智能化应用可以方便我们的生活，但我们仍然需要关注伦理问题，例如隐私权、世界观等问题。',714,47,761,100,'2023-05-21 12:21:51','2023-05-21 12:21:51',NULL),(52,9,15,'gpt-3.5-turbo','times',100,NULL,'(判断题) 某些APP的监听行为，涉嫌侵犯用户隐私。作为用户，应加强网络安全意识，防范隐私泄露。作为相关技术人员，要运用技术手段解决监听问题','这是一道判断题，答案为“是”。某些APP的监听行为可能涉嫌侵犯用户隐私，因此作为用户，应该加强网络安全意识，防范隐私泄露；作为相关技术人员，应该运用技术手段解决监听问题。',136,93,229,100,'2023-05-21 12:22:14','2023-05-21 12:22:14',NULL),(53,1,15,'gpt-3.5-turbo','times',100,'歌曲推荐人','1+1','2 (一加一等于二)',150,9,159,100,'2023-05-22 16:08:15','2023-05-22 16:08:15',NULL),(54,1,15,'gpt-3.5-turbo','times',100,'歌曲推荐人','1+1','2',150,1,151,100,'2023-05-22 16:12:21','2023-05-22 16:12:21',NULL),(55,1,15,'gpt-3.5-turbo','times',100,'歌曲推荐人','proxy_ cache off;','error, status code: 400, message: This model\'s maximum context length is 4097 tokens. However, you requested 4097 tokens (166 in the messages, 3931 in the completion). Please reduce the length of the messages or completion.',0,0,0,0,'2023-05-22 16:13:15','2023-05-22 16:13:15',NULL),(56,1,15,'gpt-4','tokens',6,'歌曲推荐人','1+1','播放列表名称：Epic Indie Adventure\n描述：一场旅行，探索沉浸式的独立音乐风格，感受深刻的非同凡响的旋律。\n\n1. Bon Iver - Holocene\n2. Fleet Foxes - White Winter Hymnal\n3. José González - Heartbeats\n4. Alt-J - Breezeblocks\n5. Sufjan Stevens - Chicago\n6. Tame Impala - Feels Like We Only Go Backwards\n7. Lord Huron - Ends of the Earth\n8. Beirut - Postcards from Italy\n9. Daughter - Youth\n10. Grizzly Bear - Two Weeks',150,157,307,1842,'2023-05-22 16:22:26','2023-05-22 16:22:26',NULL),(57,1,8,'gpt-3.5-turbo','times',100,'无','1+1','error, status code: 400, message: This model\'s maximum context length is 4097 tokens. However, you requested 4097 tokens (230 in the messages, 3867 in the completion). Please reduce the length of the messages or completion.',0,0,0,0,'2023-05-22 16:23:27','2023-05-22 16:23:27',NULL),(58,1,8,'gpt-3.5-turbo','times',100,'无','1+1','error, status code: 400, message: This model\'s maximum context length is 4097 tokens. However, you requested 4097 tokens (60 in the messages, 4037 in the completion). Please reduce the length of the messages or completion.',0,0,0,0,'2023-05-22 16:23:44','2023-05-22 16:23:44',NULL),(59,1,8,'gpt-3.5-turbo','times',100,'无','你好呀','你好！有什么我可以帮你的吗？',61,16,77,100,'2023-05-22 16:23:59','2023-05-22 16:23:59',NULL),(60,1,8,'gpt-3.5-turbo','times',100,'无','1+1','error, status code: 400, message: This model\'s maximum context length is 4097 tokens. However, you requested 4097 tokens (90 in the messages, 4007 in the completion). Please reduce the length of the messages or completion.',0,0,0,0,'2023-05-22 16:24:05','2023-05-22 16:24:05',NULL),(61,1,8,'gpt-3.5-turbo','times',100,'无','1','error, status code: 400, message: This model\'s maximum context length is 4097 tokens. However, you requested 4097 tokens (58 in the messages, 4039 in the completion). Please reduce the length of the messages or completion.',0,0,0,0,'2023-05-22 16:29:36','2023-05-22 16:29:36',NULL),(62,1,8,'gpt-3.5-turbo','times',100,'无','3+1','error, status code: 400, message: This model\'s maximum context length is 4097 tokens. However, you requested 4097 tokens (60 in the messages, 4037 in the completion). Please reduce the length of the messages or completion.',0,0,0,0,'2023-05-22 16:31:35','2023-05-22 16:31:35',NULL),(63,1,8,'gpt-3.5-turbo','times',100,'无','你好呀','你好，有什么我可以帮助你的吗？',12,18,30,100,'2023-05-22 17:43:16','2023-05-22 17:43:16',NULL),(64,1,8,'gpt-3.5-turbo','times',100,'无','1+1','error, This model\'s maximum context length is 4097 tokens. However, you requested 4102 tokens (43 in the messages, 4059 in the completion). Please reduce the length of the messages or completion.\n\n----无水印版本购买请加QQ群：145225165',37,63,100,100,'2023-05-22 17:43:19','2023-05-22 17:43:19',NULL),(65,1,15,'gpt-4','tokens',6,'无','1+1','2',11,1,12,72,'2023-05-22 17:43:29','2023-05-22 17:43:29',NULL),(66,1,8,'gpt-3.5-turbo','times',100,'无','你好呀','error, This model\'s maximum context length is 4097 tokens. However, you requested 4101 tokens (26 in the messages, 4075 in the completion). Please reduce the length of the messages or completion.\n\n----无水印版本购买请加QQ群：145225165',21,63,84,100,'2023-05-22 17:51:03','2023-05-22 17:51:03',NULL),(67,1,15,'gpt-4','tokens',6,'无','你好呀','你好！很高兴和你交流，有什么我可以帮你的吗？',12,26,38,228,'2023-05-22 17:51:17','2023-05-22 17:51:17',NULL),(68,1,15,'gpt-4','tokens',6,'无','你好呀','你好！请问有什么问题我可以为您解答吗？',52,20,72,432,'2023-05-22 17:58:20','2023-05-22 17:58:20',NULL),(69,1,15,'gpt-4','tokens',6,'无','1+1','1+1=2',88,5,93,558,'2023-05-22 17:58:24','2023-05-22 17:58:24',NULL),(70,1,8,'gpt-3.5-turbo','times',100,'无','1+1','1+1=2',64,5,69,100,'2023-05-22 17:58:34','2023-05-22 17:58:34',NULL),(71,1,8,'gpt-3.5-turbo','times',100,'无','你好呀','你好，请问有什么我可以帮忙的吗？',48,18,66,100,'2023-05-22 18:04:59','2023-05-22 18:04:59',NULL),(72,1,8,'gpt-3.5-turbo','times',100,'无','1+1','1+1=2。',63,6,69,100,'2023-05-22 18:05:05','2023-05-22 18:05:05',NULL),(73,14,8,'gpt-3.5-turbo','times',100,'无','你好','您好！有什么需要帮助的吗？',10,16,26,100,'2023-05-22 18:05:52','2023-05-22 18:05:52',NULL),(74,15,8,'gpt-3.5-turbo','times',100,'无','你好','你好！是否有什么能为你效劳的呢？',10,18,28,100,'2023-05-22 18:05:55','2023-05-22 18:05:55',NULL),(75,14,8,'gpt-3.5-turbo','times',100,'Linux 终端','ls','抱歉，我不确定您在这里想执行什么操作。请提供更多上下文或指令，让我更好地理解您的需求。',37,46,83,100,'2023-05-22 18:06:08','2023-05-22 18:06:08',NULL),(76,14,8,'gpt-3.5-turbo','times',100,'Linux 终端','pwd','抱歉，我是一个虚拟助手，无法在您的计算机上执行命令。但是，如果您想知道当前工作目录的路径，您可以在命令行中输入 \"pwd\" 或在 Windows 系统中输入 \"cd\" 和 \"echo %cd%\"。',97,77,174,100,'2023-05-22 18:06:20','2023-05-22 18:06:20',NULL),(77,14,8,'gpt-3.5-turbo','times',100,'无','tar -czvf BGI.tar.gz ./BGI/','这是一个压缩命令，将名为“BGI”的文件夹压缩为一个 gzip 格式的 tarball 文件（即 BGI.tar.gz）。这个命令语法如下：\n\n```\ntar -czvf <压缩后文件名>.tar.gz <要压缩文件夹所在路径>\n```\n\n请注意，这个命令需要在命令行中运行，而不是在聊天窗口中。而且，命令中的路径取决于您的操作系统和文件夹所在位置，您需要根据实际情况进行调整。',168,155,323,100,'2023-05-22 18:07:09','2023-05-22 18:07:09',NULL),(78,14,8,'gpt-3.5-turbo','times',100,'无','画一个猫','我很抱歉，作为一个语言模型AI，我无法直接绘制图像。但是，让我来描述一下如何画一只猫：\n\n1. 首先你需要准备画猫的材料，例如画纸、颜料或色铅笔、橡皮等。\n\n2. 猫的基本形状是一个椭圆形的头部和一个比头部长的身体，身体可以是一些小曲线和圆形线条组成的。\n\n3. 接下来，画出猫的耳朵。猫的耳朵上方应该有一些毛发的细节，注意一定要画出它们的形状和位置。\n\n4. 画上猫的眼睛。猫的眼睛是狭长而且垂直的。瞳孔应该在眼睛的中间，并且是圆形或半圆形的。\n\n5. 接着画出猫的嘴巴。猫的嘴巴应该是三角形的形状，并且向上微微弯曲，就像猫不停地在笑一样。在嘴巴下方画出一个细长的小三角形，表示猫的下巴。\n\n6. 画猫的腿和脚。猫的前腿和后腿应该是不同的形状。前腿比后腿短，但更粗。每只脚都应该有三只爪子。\n\n7. 最后，给猫加上细节。比如，画出猫身上的条纹、花纹甚至眉毛，这些细节可以让猫更具生动感。\n\n以上是关于如何画一只猫的基本步骤，当然这并不是唯一的正确方法，你可以用自己的创意和想象去绘制一只独特的猫。',281,548,829,100,'2023-05-22 18:14:19','2023-05-22 18:14:19',NULL),(79,20,15,'gpt-4','tokens',6,'无','你好','你好！请问有什么我可以帮您的吗？',10,18,28,168,'2023-05-22 19:31:56','2023-05-22 19:31:56',NULL),(80,15,15,'gpt-4','tokens',6,'无','我正在做一个网站关于虚拟币的，您能给我一些建议吗','当然可以！以下是一些建议来帮助你创建一个成功的关于虚拟币的网站：\n\n1. 设计清晰直观的用户界面：一个易于使用的界面可以吸引更多用户。确保你的网站布局清晰易懂，分类和导航直观，以便用户轻松找到他们感兴趣的内容。\n\n2. 提供实时市场信息：用户需要及时了解虚拟币的市场行情。在你的网站上提供实时价格、市值和交易量的更新将增加其吸引力。可以考虑将这些信息以图表和图形的形式展示，以便用户快速了解市场状况。\n\n3. 内容丰富：为你的用户提供有关虚拟币的最新资讯、行业动态和深度分析。可以创建一个博客或新闻部分，以便用户可以了解到最新的虚拟货币项目、技术以及政策法规的变化。\n\n4. 教育资源：对于虚拟币初学者来说，提供教育资源也是非常重要的。你可以创建一个学习中心，提供从基础知识到进阶技巧的各种教程和指南。这将有助于吸引新手用户，提高你的网站知名度。\n\n5. 交流互动：鼓励用户在你的网站上进行互动和交流。可以设计一个论坛或者评论区域，让用户分享他们的经验和见解。这将有助于创建一个活跃的社区，吸引更多用户参与。\n\n6. 投资工具：为用户提供用于管理虚拟资产的工具。例如，可以提供一个加密货币投资组合管理器，帮助用户管理和跟踪其投资。\n\n7. 移动优化：确保你的网站在不同设备上表现良好，特别是在智能手机和平板电脑上。移动设备的浏览量越来越多，因此优化移动体验至关重要。\n\n8. 社交媒体整合：与各大社交媒体平台进行整合，让用户可以轻松地在社交媒体上分享你的内容。此外，还可以通过建立自己的社交媒体页面来增加网站知名度及互动性。\n\n9. 安全性：对于一个涉及虚拟币的网站来说，安全性非常关键。确保你的网站采用了各种安全措施，例如SSL证书，来保障用户数据安全。\n\n10. 可持续更新：虚拟币行业是一个快速发展的领域。确保你的网站能够适应行业的变化，定期更新内容和功能。\n',35,802,837,5022,'2023-05-22 19:56:42','2023-05-22 19:56:42',NULL),(81,15,15,'gpt-4','tokens',6,'无','我正在做一个网站需要您的帮助，域名为aicoin.best是虚拟币官网，请取一个主标题一个副标题','主标题：AICoin 至尊区块链\n副标题：赋能未来的加密货币投资平台',49,34,83,498,'2023-05-22 20:21:35','2023-05-22 20:21:35',NULL),(82,15,15,'gpt-4','tokens',6,'无','它不是区块链，仅仅是虚拟币，请重新命名','主标题：AICoin 虚拟币领袖\n副标题：领跑全球的数字货币投资之选',117,37,154,924,'2023-05-22 20:22:22','2023-05-22 20:22:22',NULL),(83,22,8,'gpt-3.5-turbo','times',100,'无','描述一只凶猛的狗，周围的环境非常的危险','这只凶猛的狗拥有浓密的黑色毛发，眼神凶狠而充满恶意。它身材魁梧，充满肌肉，一看就知道它具备着极强的攻击性和抵御力。在它可怕的口鼻周围，牙齿锋利如刀，透露着它随时都可能发动攻击的威胁。\n\n这只恐怖的狗所处的环境也让人不寒而栗。围栏被它侵蚀了，是可怕的外表所表现出的就是这只凶狠狗狗心灵深处的愤怒和破坏欲。周围充满着破碎的器物和骨头残骸，冰冷的空气中弥漫着血腥和死亡的气息。仿佛在这里，只有这只凶猛的狗，才能统治着周围的一切。\n\n站在这样的环境中，任何人都会感到无比的恐惧和不安。人们不禁开始担心：如果这样的狗逃出来，它将会对周围的生命造成何般的无尽破坏。即便是数量庞大的人类，也恐怕难以全然抵挡住这样的暴力冲击。',35,440,475,100,'2023-05-22 20:34:29','2023-05-22 20:34:29',NULL),(84,22,8,'gpt-3.5-turbo','times',100,'无','翻译成英文','A description of a fierce dog and its extremely dangerous surroundings. \n\nThis fierce dog has dense black fur, with a menacing expression full of malice. Its burly build and muscular physique suggest a strong offensive and defensive capability. Its terrifying jaws are lined with sharp teeth, instilling a constant threat of attack. \n\nThe environment where this terrifying dog resides is also a source of fear and dread. The fence surrounding the area is corroded and damaged, reflecting the anger and destructive desire embedded in its soul. Broken objects and bone fragments litter the ground, while the air is permeated with the scent of blood and death. It\'s as if only this fierce dog reigns over everything in the surrounding area. \n\nStanding in such an environment, one can\'t help but feel immense fear and unease. People start to worry that if this dog were to escape, it would bring endless destruction and harm to all life in its vicinity. Even a large number of humans would likely struggle to withstand such violent attacks.',493,201,694,100,'2023-05-22 20:35:50','2023-05-22 20:35:50',NULL);
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
  `desc` varchar(50) NOT NULL COMMENT '描述信息',
  `name` varchar(60) DEFAULT NULL,
  `value` text,
  `created_at` int(10) unsigned DEFAULT NULL,
  `updated_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name_index` (`name`),
  KEY `type_index` (`type`),
  KEY `type_name_index` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES (1,'register','注册方式','register_way','10',NULL,NULL),(2,'register','注册码','register_code','68823095',NULL,NULL),(3,'register','默认头像','default_avatar','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/avatar/default.png',NULL,NULL),(4,'register','是否启用二维码','enable_ercode','0',NULL,NULL),(5,'register','是否启用验证码','enable_verify_code','0',NULL,NULL),(6,'website','网站名','name','chatgpt管理系统',1660620367,1679191955),(7,'website','图标','favicon','https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230425/avatart.jpg',1660620367,1679191955),(8,'website','官方联系邮箱','email','245629560@qq.com',1660620367,1679191955),(9,'website','','copyright','[{\"name\":\"LikeAdmin开源系统\",\"link\":\"http://www.beian.gov.cn\"}]',1660620367,1660620367),(10,'website','客服QQ','qq','245629560',NULL,NULL),(11,'website','logo','logo','https://gouguoyin.oss-cn-beijing.aliyuncs.com/tools/images/2130706433/20230425/avatart.jpg',1660620367,1679191955),(12,'chatgpt','','baseUrl','https://open2.aiproxy.xyz',NULL,NULL),(13,'chatgpt','','proxyUrl','https://open2.aiproxy.xyz',NULL,NULL),(14,'chatgpt','','model','gpt-3.5-turbo',NULL,NULL),(15,'chatgpt','','topP','20',NULL,NULL),(16,'chatgpt','','memoryMemo','36',NULL,NULL),(17,'chatgpt','','isSerial','1',NULL,NULL),(18,'chatgpt','','timeout','60',NULL,NULL),(19,'storage','','default','local',1660620367,1662620927),(20,'storage','','local','{\"name\":\"本地存储\"}',1660620367,1662620927),(21,'storage','','aliyun','{\"name\":\"阿里云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\"}',1660620367,1662620071),(22,'storage','','qiniu','{\"name\":\"七牛云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\"}',1660620367,1660620367),(23,'storage','','qcloud','{\"name\":\"腾讯云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\",\"region\":\"\"}',1660620367,1660620367),(24,'sms','','default','aliyun',1660620367,1660620367),(25,'sms','阿里云','aliyun','{\"name\":\"阿里云短信\",\"alias\":\"aliyun\",\"sign\":\"\",\"appKey\":\"\",\"secretKey\":\"\"}',1660620367,1660620367),(26,'sms','腾讯','tencent','{\"name\":\"腾讯云短信\",\"alias\":\"tencent\",\"sign\":\"\",\"appId\":\"\",\"secretId\":\"\",\"secretKey\":\"\"}',1660620367,1660620367),(27,'sms','华为','huawei','{\"name\":\"华为云短信\",\"alias\":\"huawei\"}',1660620367,1660620367),(28,'point','注册获取积分','register','100000',NULL,NULL),(29,'point','邀请者获取积分','inviter','120000',NULL,NULL),(30,'point','被邀请者获取积分','invitee','150000',NULL,NULL),(31,'mail','邮箱地址','host','smtp.qq.com',NULL,NULL),(32,'mail','邮箱端口','port','465',NULL,NULL),(33,'mail','邮箱用户名','user_name','service@kuaijinpay.com',NULL,NULL),(34,'mail','邮箱密码或授权码','password','afkfbbwgpykubhce',NULL,NULL),(35,'mail','显示名称','nick_name','chatgpt-web-plus',NULL,NULL),(36,'mail','测试收件人地址','test_email','245629560@qq.com',NULL,NULL);
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

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `key_id` int(11) DEFAULT '0' COMMENT 'key池id',
  `model` varchar(20) DEFAULT NULL COMMENT '所用模型',
  `charge_mode` varchar(10) DEFAULT NULL COMMENT '计费模式',
  `charge_rate` int(11) DEFAULT '0' COMMENT '换算倍数',
  `prompt` varchar(250) DEFAULT NULL COMMENT '提示词',
  `image_url` text COMMENT '图片URL',
  `total_points` int(11) DEFAULT '0' COMMENT '消耗总积分',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,16,'Midjourney','times',500,'a dog --ar 4:3 --q 0.5 --v 4','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_a_dog_ecc63a01-bb3f-4bb4-8a06-55eeedbdc3cb.png',500,'2023-05-22 18:30:21','2023-05-22 18:30:21',NULL),(2,13,16,'Midjourney','times',500,'Cute Cat --ar 16:9 --q 0.5 --v 4','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_Cute_Cat_16d3f6ca-8f93-4a1a-93ca-4ca1e762b59c.png',500,'2023-05-22 18:33:47','2023-05-22 18:33:47',NULL),(3,13,16,'Midjourney','times',500,'Cute Cat','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_Cute_Cat_50189df8-5a28-4de8-87f7-110a56e3c2cd.png',500,'2023-05-22 18:36:42','2023-05-22 18:36:42',NULL),(4,17,16,'Midjourney','times',500,'Create an image that encapsulates the principle of good governance in the Cordillera region. The image should display symbols of transparency, fairness, and community involvement in decision-making, effectively representing the region\'s commitment to','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_Create_an_image_that_encapsulates_the_principle_of_goo_083cc0f5-ad09-45a2-8f46-79e2d7c69105.webp',500,'2023-05-22 18:48:30','2023-05-22 18:48:30',NULL),(5,18,16,'Midjourney','times',500,'一个女生在雨中奔跑 --ar 1:1 --q 0.5 --v 5.1','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk__2c8fe1a8-b477-412e-a85e-f02daf21af00.png',500,'2023-05-22 18:49:09','2023-05-22 18:49:09',NULL),(6,17,16,'Midjourney','times',500,'cat --ar 1:1 --q 1 --v 5.1','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_cat_7b08dd7f-a4da-4afb-bb0c-46ee87f225d3.webp',500,'2023-05-22 18:50:10','2023-05-22 18:50:10',NULL),(7,17,16,'Midjourney','times',500,'cat --ar 4:3 --q 1 --v 5','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_cat_391daf6c-02e9-4f24-bbdf-30cb385d4670.png',500,'2023-05-22 18:52:36','2023-05-22 18:52:36',NULL),(8,17,16,'Midjourney','times',500,'cat --ar 16:9 --q 0.5 --v 4','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_cat_af83ef81-333d-40d0-89a4-1aa8a99f8bdf.png',500,'2023-05-22 18:55:00','2023-05-22 18:55:00',NULL),(9,17,16,'Midjourney','times',500,'cat --ar 16:9 --q 0.5 --v 4','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_cat_286a188f-e0a8-4e83-8a71-4f4ed7d4a191.png',500,'2023-05-22 18:56:30','2023-05-22 18:56:30',NULL),(10,1,16,'Midjourney','times',500,'Create an image that encapsulates the principle of good governance in the Cordillera region. The image should display symbols of transparency, fairness, and community involvement in decision-making, effectively representing the region\'s commitment to','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_Create_an_image_that_encapsulates_the_principle_of_goo_9696b7f4-7e93-4079-b1a6-8d623cb408ba.png',500,'2023-05-22 18:57:58','2023-05-22 18:57:58',NULL),(11,1,16,'Midjourney','times',500,'Create an image that encapsulates the principle of good governance in the Cordillera region. The image should display symbols of transparency, fairness, and community involvement in decision-making, effectively representing the region\'s commitment to','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_Create_an_image_that_encapsulates_the_principle_of_goo_6a5cd285-9f66-4588-994c-01f1e7dd739f.png',500,'2023-05-22 18:59:31','2023-05-22 18:59:31',NULL),(12,12,16,'Midjourney','times',500,'Sure! Here\'s how you can generate a new icon using midjourney bot with the specifications you provided:\nOpen your conversation with midjourney bot on Telegram and type \"/start\" to start the bot.\nType \"/draw\" to start a new drawing session.\nUse the \"T','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_Sure_Heres_how_you_can_generate_a_new_icon_using_midjo_b060c72e-5642-4db4-9470-427f00f21b1f.png',500,'2023-05-22 18:59:42','2023-05-22 18:59:42',NULL),(13,17,16,'Midjourney','times',500,'cyber cat --ar 1:1 --q 2 --v 4','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_cyber_cat_ae50cadf-de24-4564-8f7b-9fc8075923dc.png',500,'2023-05-22 19:01:16','2023-05-22 19:01:16',NULL),(14,12,16,'Midjourney','times',500,'Sure! Here\'s how you can generate a new icon using midjourney bot with the specifications you provided:\nOpen your conversation with midjourney bot on Telegram and type \"/start\" to start the bot.\nType \"/draw\" to start a new drawing session.\nUse the \"T','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_Sure_Heres_how_you_can_generate_a_new_icon_using_midjo_a6b26196-dec2-409d-9bd7-5013a54efa80.png',500,'2023-05-22 19:03:48','2023-05-22 19:03:48',NULL),(15,17,16,'Midjourney','times',500,'cyber dog --ar 1:1 --q 2 --v 4','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_cyber_dog_451a4e5d-5b88-4447-a312-3f184c5888c1.png',500,'2023-05-22 19:04:31','2023-05-22 19:04:31',NULL),(16,12,16,'Midjourney','times',500,'迪斯尼风格，一只狗，在外太空 --ar 1:1 --q 1 --v 5.1','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk__60072d64-9baa-4c1a-ae32-846d1de9f997.png',500,'2023-05-22 19:06:33','2023-05-22 19:06:33',NULL),(17,12,16,'Midjourney','times',500,'迪斯尼风格，一只狗，在外太空','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk__2cd56157-4515-4f98-b5ec-0aa0db80f9cb.png',500,'2023-05-22 19:07:47','2023-05-22 19:07:47',NULL),(18,12,16,'Midjourney','times',500,'American style, Van Gogh\'s starry sky, with a group of cats looking at the starry sky --ar 1:1 --q 1 --v 5.1','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_American_style_Van_Goghs_starry_sky_with_a_group_of_ca_c67b41c3-c9f8-4d5c-a75a-c9399a1d1fef.webp',500,'2023-05-22 19:13:46','2023-05-22 19:13:46',NULL),(19,19,16,'Midjourney','times',500,'雪上上 哈士奇 木屋 温馨 --ar 1:1 --q 0.5 --v 5.1','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_____7e1edaeb-4086-43cd-9e95-ff690c1d7098.webp',500,'2023-05-22 19:24:13','2023-05-22 19:24:13',NULL),(20,1,16,'Midjourney','times',500,'a dog','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_a_dog_a7d4a350-377e-4f54-898a-5b11ce14ad9f.png',500,'2023-05-22 20:16:39','2023-05-22 20:16:39',NULL),(21,15,16,'Midjourney','times',500,'Ai 头像 --ar 1:1 --q 0.5 --v 4','https://chatgpt-web.oss-cn-beijing.aliyuncs.com/4bcdmbkk_Ai__5e5373d4-7dfb-4793-9ffc-4ffb409ddeed.png',500,'2023-05-22 20:17:22','2023-05-22 20:17:22',NULL);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inviters`
--

DROP TABLE IF EXISTS `inviters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inviters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL,
  `invitee_id` int(11) DEFAULT '0' COMMENT '被邀请者id',
  `invitee_name` varchar(50) DEFAULT NULL,
  `user_points` int(11) NOT NULL DEFAULT '0' COMMENT '邀请者获得积分',
  `invitee_points` int(11) NOT NULL DEFAULT '0' COMMENT '被邀请者获得积分',
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keys`
--

LOCK TABLES `keys` WRITE;
/*!40000 ALTER TABLE `keys` DISABLE KEYS */;
INSERT INTO `keys` VALUES (1,'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','gpt-3.5-turbo',NULL,10,0000000000,0,0,1,'2023-03-23 20:51:32','2023-03-23 20:51:37','2023-05-15 13:13:40'),(2,'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','gpt-3.5-turbo','',20,0000000000,0,0,0,NULL,'2023-05-17 16:18:01',NULL),(3,'KWHGDS8435TGKJLHKGLISRETYRIEHKGDIyiouhNF,GFDSHGB','gpt-3.5-turbo',NULL,10,0000000000,0,0,1,NULL,'2023-04-10 20:48:09','2023-04-12 00:22:57'),(8,'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','gpt-3.5-turbo','',10,0000175326,0,0,0,'2023-04-12 00:41:33','2023-05-17 16:17:56',NULL),(9,'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','gpt-4','',10,0000001737,0,1,0,'2023-05-15 09:43:45','2023-05-15 09:43:45','2023-05-15 10:37:28'),(10,'sk-testkey','gpt-3.5-turbo','',10,0000000000,0,1,1,'2023-05-15 12:44:07','2023-05-15 12:44:07','2023-05-15 12:44:12'),(11,'1111','gpt-3.5-turbo','',10,0000000000,0,0,0,'2023-05-15 13:25:28','2023-05-15 13:25:28','2023-05-15 13:25:32'),(12,'bb','gpt-4','',10,0000000000,0,0,0,'2023-05-15 13:25:52','2023-05-15 13:25:52','2023-05-15 13:26:06'),(13,'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','gpt-4','',10,0000000026,0,0,0,'2023-05-15 13:35:17','2023-05-15 13:37:52','2023-05-15 13:39:00'),(14,'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','gpt-4','',10,0000000243,0,0,0,'2023-05-15 13:41:22','2023-05-15 13:41:22','2023-05-15 20:33:13'),(15,'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','gpt-4','',10,0000012245,0,0,0,'2023-05-16 01:06:49','2023-05-18 13:51:33',NULL),(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo4LCJ1c2VybmFtZSI6ImxpeGlhb2h1MSIsImlzcyI6IkNoYXRHUFQtTWlkam91cm5leSIsInN1YiI6InVzZXJfYXV0aGVudGljYXRpb24iLCJhdWQiOlsidXNlciJdLCJleHAiOjE2OTI1NzEyMjh9.vzEaJb2kl0Y81XchsfveqDaAdPubUek3pXffc0MvelU','Midjourney','',10,0000000000,0,0,0,'2023-05-20 22:20:33','2023-05-20 22:20:33',NULL);
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
  `alias` varchar(50) NOT NULL,
  `max_tokens` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,'openai','gpt-3.5-turbo','gpt-3.5-turbo',4096,'times',100,900,0,'2023-05-14 19:22:02','2023-05-22 10:55:46',NULL),(2,'openai','gpt-4','gpt-4',8192,'tokens',6,800,0,'2023-05-14 19:23:16','2023-05-22 14:06:50',NULL),(3,'openai','gpt-4-0314','gpt-4-0314',8192,'tokens',10,700,1,'2023-05-19 00:09:45','2023-05-22 10:03:53',NULL),(4,'midjourney','midjourney','Midjourney',4096,'times',500,100,0,'2023-05-20 21:50:35','2023-05-22 10:39:50',NULL);
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
INSERT INTO `notices` VALUES (1,'测试11','<p>11111330000</p>',0,'2023-05-12','2023-05-12 15:46:50','2023-05-12 19:58:00',NULL);
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
  KEY `cards_card_no_index` (`card_no`(191)),
  KEY `cards_package_id_index` (`package_id`),
  KEY `package_cards_deleted_at_index` (`deleted_at`),
  KEY `package_cards_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COMMENT='卡券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_cards`
--

LOCK TABLES `package_cards` WRITE;
/*!40000 ALTER TABLE `package_cards` DISABLE KEYS */;
INSERT INTO `package_cards` VALUES (1,'a5e2436c-9a3c-4102-a22c-401f8c5e504f',5,'年卡',300.00,360,400000,78081,1,'',1,'2023-05-19 14:34:57','2024-05-13 14:34:57','2023-05-19 14:34:52','2023-05-19 14:34:57',NULL),(2,'4305253e-23a5-442b-803d-17054bb537a7',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(3,'fe4f40c6-f209-42e9-ad24-b56f1c07a753',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(4,'4ca70d9b-2b20-4d65-963b-c933cc2a15f9',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(5,'e4888366-b050-4e5d-93de-cb43c902b3e8',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(6,'51dcb990-c07b-4e1d-bff5-441983f4d530',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(7,'5d875008-9e35-478d-b79c-c961cbfba20e',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(8,'e1222f9e-0934-49f1-a112-821b9a1a3278',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(9,'64d64743-e1a7-491c-88ff-b76e6ec27543',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(10,'ac6d789f-6ee1-48fe-8c8c-41c443416fe2',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(11,'c93a55dd-2699-4378-992b-83cb52869b5d',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(12,'512bf438-5bbf-4ac2-860b-70364de35481',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(13,'ffab4e75-2b67-4138-8435-ee1b6c200189',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(14,'9ebb8810-f0c4-4455-b6cd-4813953e6eb5',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(15,'b72eb1bf-003d-4a19-8239-68b22524947b',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(16,'8383df6f-2b3b-4e10-8eab-b6b27338b48d',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(17,'f6d4a306-f2a5-4858-ba16-b33bf58d0a37',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(18,'5882024a-2c06-4078-9caf-ab71a9e59bb5',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(19,'3e7f6163-3e1e-4422-8efe-145993bc80f9',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(20,'17016619-bf83-4140-abaf-6ad707fcdc1b',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(21,'fe69de22-e8a1-4061-ac58-8dadcd74c0af',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(22,'caeb21cb-d587-4c8b-a56e-85793ca4de69',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(23,'158b474c-dace-46f3-b804-232b32842837',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(24,'3b02b658-7b6f-43cd-b014-d713540bc21a',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(25,'b03dff32-af51-4d29-b6e6-880224e754b3',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(26,'aa806625-5ae8-4a28-b385-790f33d30385',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(27,'8f4b5866-fca8-446b-bfef-c7b449548ba7',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(28,'5ebc2dd1-27a6-44f7-bc52-e0cb3018c85d',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(29,'2b903bfa-d768-4b62-88a5-2e5715619c4d',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(30,'3637ab0d-e883-42f0-91b3-4da0a0956647',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(31,'36538445-cb0c-493f-9bec-0b90b737db90',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(32,'08fb9bb5-d883-4bb6-b944-75ec8566c15e',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(33,'2275f4ba-2dad-4a02-91e9-a1b405ff3ea4',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(34,'662044f0-0b78-4df6-ab44-f305ff17eda9',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(35,'a18b7369-5633-4a43-b6f4-ca6c1f5d6766',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(36,'08193ec2-3f69-4937-bab9-59e6aacc2d3e',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(37,'22d46401-59d4-4a9f-8ad6-a94b52cba910',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(38,'f4030632-40c9-4c2b-8b3b-794aec54ff37',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(39,'fa5444a6-43d9-4a34-a919-6f17910ac89a',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(40,'b8924268-fddf-44bf-ac5b-bcc37c3be91b',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(41,'670d9de4-86f0-4b72-bb8c-00d654c25476',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(42,'57d02b67-b9a6-4023-8bff-12f4259e1daf',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(43,'b23b0b37-3402-4167-b072-19d0fb870c5f',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(44,'ca965135-f830-4d45-a2c6-34f0a2523c45',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(45,'3e441231-4857-410e-bed9-d7d0634be087',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(46,'5f869184-0752-4cd3-9edd-22802abc36c0',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(47,'c8581053-32b6-4e77-8a10-3439dc29021a',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(48,'e7ff5148-5e52-4cb9-a9ab-dfa73ca2e6f3',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(49,'e60e684c-db46-4333-ad5a-1b18b7eb7e1b',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(50,'62021f5a-a036-4659-80ee-3646410510f8',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(51,'9b44835b-abd7-4073-b624-cb7fb425cbed',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(52,'c162ed41-dde5-42e7-b6a1-a281306f8363',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(53,'b61ea509-7ee6-43f6-94bc-4b13ac3c5a99',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(54,'27d9d49d-1c6f-4d09-98b8-d971b8d288f4',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(55,'75a46e69-f831-42a9-9d83-f900af78ce83',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(56,'63df27b7-2d9d-46a4-b3b4-9a045655d693',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(57,'f4b957bc-903b-4725-b59a-2af8e804df17',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(58,'46a15d41-d634-49e6-a1cd-17570f416b2a',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(59,'aef9ec54-5908-4b38-81b8-37b282579821',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(60,'8f347d0b-1600-4513-9571-688c8ae62de3',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(61,'35dba6b0-5c92-4757-aff2-d078d4a03c1b',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(62,'3b513493-4c77-4fd6-bb85-bda08d2b9b23',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(63,'adb51b58-d439-4884-9541-99360796c3c4',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(64,'5ab8d60b-e191-4eed-9976-d912c7777d0f',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(65,'2dacfea6-637f-44a3-950a-2792aa0b151d',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(66,'b4f19dea-2a88-44a8-84fe-5cf7d541efff',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(67,'8dc9f5ed-94b4-4d7d-9c25-8ac8464ee8ed',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(68,'12e1b63d-7e0d-437e-b5b6-6142a690f77e',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(69,'4f1d8566-f26b-4de0-91c1-9a021d8bdfa8',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(70,'645471b6-a9ae-4947-9ee0-40b83dd22f82',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(71,'c083f122-7688-47ee-8b6a-0ca370030ad3',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(72,'3317e854-91a7-4bf8-bf13-95372c8c8716',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(73,'d283f8f6-6978-4a23-b114-549536a14376',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(74,'5e121f37-3e4e-4a82-86c2-843dd282accf',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(75,'df3fa20e-01dd-4c71-8218-4efb5cc6a114',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(76,'20f2b946-6693-4411-b7db-8f2b0c3758fc',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(77,'e7152ac1-dc62-4d4e-b635-ad116574bc03',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(78,'73b1fa47-db1f-4b75-8894-7ee2e71c48a8',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(79,'73db4620-d920-468b-9845-eca69fb9f8f0',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(80,'b0830585-974c-4d04-b04e-bea58afd2a56',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(81,'e004d771-5b44-40da-b627-5e16dd3d8861',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(82,'c6ead82c-d104-4eb8-abcf-69fb73db1097',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(83,'05e2ff6e-0921-4a9c-9ae5-9537cdd325e7',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(84,'3cbd2bc9-d995-43dc-ad12-55249dc26cb9',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(85,'8df343d7-581e-40a2-b125-8cbee942feb8',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(86,'7af27064-b4d1-4806-91fd-c3f1f66cd8af',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(87,'720106b5-abeb-4e6f-9c45-cf88ca951d1e',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(88,'89de8f60-38dd-444b-99bd-5bd44a06b24c',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(89,'c952cf41-56bd-4512-acb0-79c06ff04477',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(90,'d9c6f228-3b65-46f9-9e68-dc6d92bef1f8',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(91,'7f4fd0b8-3d48-4b65-ba07-7c12d46cf37f',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(92,'76ad3628-7319-48cc-b2e0-3a8f2eec36ee',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(93,'bf2666e6-21e4-4291-9221-aa8f6032d35c',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(94,'4a9a823a-3b61-405b-97c7-e6d07766cea0',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(95,'5dfc90a6-5193-455c-841b-f054a3209ba2',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(96,'587764f4-74b0-4a91-a9a1-259e47fce67f',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(97,'5be40c2a-e9d1-48cc-8de3-800b441ccd1d',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(98,'2cbcd25a-9d82-4fcd-b8fc-8d270f4d30f6',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(99,'d4980019-909d-4889-8243-3698f419481d',5,'年卡',300.00,360,400000,78081,100,'',0,NULL,NULL,'2023-05-19 15:32:47','2023-05-19 15:32:47',NULL),(100,'580227d0-68cb-469f-bb79-c7aa605318e1',5,'年卡',300.00,360,400000,78081,100,'',3,'2023-05-19 15:33:17','2024-05-13 15:33:17','2023-05-19 15:32:47','2023-05-19 15:33:17',NULL),(101,'05d9e3d1-02e0-4876-be56-7598feb6440d',5,'年卡',300.00,360,400000,78081,100,'',3,'2023-05-19 15:33:10','2024-05-13 15:33:10','2023-05-19 15:32:47','2023-05-19 15:33:10',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'tokens','日卡',NULL,6.00,5.00,'无使用期限',1000,1,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',444,0,NULL,'2023-03-30 20:17:49',NULL),(2,'tokens','周卡','',31.00,30.00,'不限次数',8000,7,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',555,0,NULL,'2023-05-12 11:57:26',NULL),(3,'tokens','月卡',NULL,105.00,100.00,'不限次数',31000,30,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',777,0,NULL,'2023-03-30 20:17:40',NULL),(4,'tokens','季卡','',152.00,150.00,'不限时间',94000,90,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',666,0,NULL,'2023-05-12 11:57:21',NULL),(5,'tokens','年卡','',310.00,300.00,'不限时间',400000,360,'jump','http://element-plus.org/zh-CN/component/text.html#%E5%9F%BA%E7%A1%80%E7%94%A8%E6%B3%95',888,0,NULL,'2023-05-15 09:59:20',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COMMENT='积分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
INSERT INTO `points` VALUES (1,1,'register',100,'永久有效','2023-05-18 17:55:23','2023-05-18 17:55:23',NULL,NULL),(2,2,'register',1000,'永久有效','2023-05-18 20:29:29','2023-05-18 20:29:29',NULL,NULL),(3,1,'chat',-100,'对话消耗','2023-05-19 13:45:31','2023-05-19 13:45:31',NULL,NULL),(4,1,'buy',400000,'后台激活','2023-05-19 14:34:57','2023-05-19 14:34:57',NULL,'2024-05-13 14:34:57'),(5,1,'chat',-100,'对话消耗','2023-05-19 14:35:38','2023-05-19 14:35:38',NULL,NULL),(6,1,'chat',-100,'对话消耗','2023-05-19 14:57:12','2023-05-19 14:57:12',NULL,NULL),(7,3,'register',1000,'永久有效','2023-05-19 15:30:16','2023-05-19 15:30:16',NULL,NULL),(8,3,'buy',400000,'后台激活','2023-05-19 15:33:10','2023-05-19 15:33:10',NULL,'2024-05-13 15:33:10'),(9,3,'buy',400000,'后台激活','2023-05-19 15:33:17','2023-05-19 15:33:17',NULL,'2024-05-13 15:33:17'),(10,3,'chat',-100,'对话消耗','2023-05-19 15:34:55','2023-05-19 15:34:55',NULL,NULL),(11,3,'chat',-100,'对话消耗','2023-05-19 15:37:24','2023-05-19 15:37:24',NULL,NULL),(12,3,'chat',-100,'对话消耗','2023-05-19 15:37:54','2023-05-19 15:37:54',NULL,NULL),(13,1,'chat',-100,'对话消耗','2023-05-19 15:38:00','2023-05-19 15:38:00',NULL,NULL),(14,1,'chat',-996,'对话消耗','2023-05-19 15:38:28','2023-05-19 15:38:28',NULL,NULL),(15,1,'chat',-100,'对话消耗','2023-05-19 15:39:22','2023-05-19 15:39:22',NULL,NULL),(16,3,'chat',-100,'对话消耗','2023-05-19 15:39:55','2023-05-19 15:39:55',NULL,NULL),(17,1,'chat',-100,'对话消耗','2023-05-19 15:56:37','2023-05-19 15:56:37',NULL,NULL),(18,4,'register',1000,'永久有效','2023-05-19 17:29:55','2023-05-19 17:29:55',NULL,NULL),(19,1,'chat',-100,'对话消耗','2023-05-19 18:27:56','2023-05-19 18:27:56',NULL,NULL),(20,1,'chat',-100,'对话消耗','2023-05-19 18:29:19','2023-05-19 18:29:19',NULL,NULL),(21,1,'chat',-100,'对话消耗','2023-05-20 09:27:44','2023-05-20 09:27:44',NULL,NULL),(22,5,'register',1000,'永久有效','2023-05-21 00:50:39','2023-05-21 00:50:39',NULL,NULL),(23,6,'register',1000,'永久有效','2023-05-21 11:55:02','2023-05-21 11:55:02',NULL,NULL),(24,6,'chat',-100,'对话消耗','2023-05-21 11:55:36','2023-05-21 11:55:36',NULL,NULL),(25,6,'chat',-100,'对话消耗','2023-05-21 11:56:52','2023-05-21 11:56:52',NULL,NULL),(26,6,'chat',-100,'对话消耗','2023-05-21 11:57:54','2023-05-21 11:57:54',NULL,NULL),(27,6,'chat',-100,'对话消耗','2023-05-21 11:59:24','2023-05-21 11:59:24',NULL,NULL),(28,6,'chat',-100,'对话消耗','2023-05-21 12:00:40','2023-05-21 12:00:40',NULL,NULL),(29,6,'chat',-100,'对话消耗','2023-05-21 12:02:14','2023-05-21 12:02:14',NULL,NULL),(30,6,'chat',-100,'对话消耗','2023-05-21 12:03:10','2023-05-21 12:03:10',NULL,NULL),(31,6,'chat',-100,'对话消耗','2023-05-21 12:03:25','2023-05-21 12:03:25',NULL,NULL),(32,6,'chat',-100,'对话消耗','2023-05-21 12:03:34','2023-05-21 12:03:34',NULL,NULL),(33,6,'chat',-100,'对话消耗','2023-05-21 12:04:16','2023-05-21 12:04:16',NULL,NULL),(34,7,'register',1000,'永久有效','2023-05-21 12:05:23','2023-05-21 12:05:23',NULL,NULL),(35,7,'chat',-100,'对话消耗','2023-05-21 12:05:43','2023-05-21 12:05:43',NULL,NULL),(36,7,'chat',-100,'对话消耗','2023-05-21 12:06:10','2023-05-21 12:06:10',NULL,NULL),(37,7,'chat',-100,'对话消耗','2023-05-21 12:06:42','2023-05-21 12:06:42',NULL,NULL),(38,7,'chat',-100,'对话消耗','2023-05-21 12:06:56','2023-05-21 12:06:56',NULL,NULL),(39,7,'chat',-100,'对话消耗','2023-05-21 12:07:34','2023-05-21 12:07:34',NULL,NULL),(40,7,'chat',-100,'对话消耗','2023-05-21 12:08:09','2023-05-21 12:08:09',NULL,NULL),(41,7,'chat',-100,'对话消耗','2023-05-21 12:08:31','2023-05-21 12:08:31',NULL,NULL),(42,7,'chat',-100,'对话消耗','2023-05-21 12:09:10','2023-05-21 12:09:10',NULL,NULL),(43,7,'chat',-100,'对话消耗','2023-05-21 12:09:38','2023-05-21 12:09:38',NULL,NULL),(44,7,'chat',-100,'对话消耗','2023-05-21 12:10:16','2023-05-21 12:10:16',NULL,NULL),(45,8,'register',1000,'永久有效','2023-05-21 12:11:00','2023-05-21 12:11:00',NULL,NULL),(46,8,'chat',-100,'对话消耗','2023-05-21 12:11:19','2023-05-21 12:11:19',NULL,NULL),(47,8,'chat',-100,'对话消耗','2023-05-21 12:11:56','2023-05-21 12:11:56',NULL,NULL),(48,8,'chat',-100,'对话消耗','2023-05-21 12:12:30','2023-05-21 12:12:30',NULL,NULL),(49,8,'chat',-100,'对话消耗','2023-05-21 12:12:55','2023-05-21 12:12:55',NULL,NULL),(50,8,'chat',-100,'对话消耗','2023-05-21 12:13:11','2023-05-21 12:13:11',NULL,NULL),(51,8,'chat',-100,'对话消耗','2023-05-21 12:13:48','2023-05-21 12:13:48',NULL,NULL),(52,8,'chat',-100,'对话消耗','2023-05-21 12:14:08','2023-05-21 12:14:08',NULL,NULL),(53,8,'chat',-100,'对话消耗','2023-05-21 12:14:50','2023-05-21 12:14:50',NULL,NULL),(54,8,'chat',-100,'对话消耗','2023-05-21 12:15:30','2023-05-21 12:15:30',NULL,NULL),(55,8,'chat',-100,'对话消耗','2023-05-21 12:16:32','2023-05-21 12:16:32',NULL,NULL),(56,9,'register',1000,'永久有效','2023-05-21 12:17:59','2023-05-21 12:17:59',NULL,NULL),(57,9,'chat',-100,'对话消耗','2023-05-21 12:18:07','2023-05-21 12:18:07',NULL,NULL),(58,9,'chat',-100,'对话消耗','2023-05-21 12:18:27','2023-05-21 12:18:27',NULL,NULL),(59,9,'chat',-100,'对话消耗','2023-05-21 12:18:43','2023-05-21 12:18:43',NULL,NULL),(60,9,'chat',-100,'对话消耗','2023-05-21 12:19:57','2023-05-21 12:19:57',NULL,NULL),(61,9,'chat',-100,'对话消耗','2023-05-21 12:21:21','2023-05-21 12:21:21',NULL,NULL),(62,9,'chat',-100,'对话消耗','2023-05-21 12:21:39','2023-05-21 12:21:39',NULL,NULL),(63,9,'chat',-100,'对话消耗','2023-05-21 12:21:51','2023-05-21 12:21:51',NULL,NULL),(64,9,'chat',-100,'对话消耗','2023-05-21 12:22:14','2023-05-21 12:22:14',NULL,NULL),(65,10,'register',1000,'永久有效','2023-05-22 11:04:21','2023-05-22 11:04:21',NULL,NULL),(66,1,'chat',-100,'对话消耗','2023-05-22 16:08:15','2023-05-22 16:08:15',NULL,NULL),(67,1,'chat',-100,'对话消耗','2023-05-22 16:12:22','2023-05-22 16:12:22',NULL,NULL),(68,1,'chat',-1842,'对话消耗','2023-05-22 16:22:26','2023-05-22 16:22:26',NULL,NULL),(69,1,'chat',-100,'对话消耗','2023-05-22 16:23:59','2023-05-22 16:23:59',NULL,NULL),(70,11,'register',100000,'永久有效','2023-05-22 16:46:53','2023-05-22 16:46:53',NULL,NULL),(71,1,'chat',-100,'对话消耗','2023-05-22 17:43:16','2023-05-22 17:43:16',NULL,NULL),(72,1,'chat',-100,'对话消耗','2023-05-22 17:43:20','2023-05-22 17:43:20',NULL,NULL),(73,1,'chat',-72,'对话消耗','2023-05-22 17:43:29','2023-05-22 17:43:29',NULL,NULL),(74,1,'chat',-100,'对话消耗','2023-05-22 17:51:03','2023-05-22 17:51:03',NULL,NULL),(75,1,'chat',-228,'对话消耗','2023-05-22 17:51:17','2023-05-22 17:51:17',NULL,NULL),(76,1,'chat',-432,'对话消耗','2023-05-22 17:58:20','2023-05-22 17:58:20',NULL,NULL),(77,1,'chat',-558,'对话消耗','2023-05-22 17:58:25','2023-05-22 17:58:25',NULL,NULL),(78,1,'chat',-100,'对话消耗','2023-05-22 17:58:35','2023-05-22 17:58:35',NULL,NULL),(79,12,'register',100000,'永久有效','2023-05-22 18:01:37','2023-05-22 18:01:37',NULL,NULL),(80,13,'register',100000,'永久有效','2023-05-22 18:04:33','2023-05-22 18:04:33',NULL,NULL),(81,1,'chat',-100,'对话消耗','2023-05-22 18:04:59','2023-05-22 18:04:59',NULL,NULL),(82,1,'chat',-100,'对话消耗','2023-05-22 18:05:05','2023-05-22 18:05:05',NULL,NULL),(83,14,'register',100000,'永久有效','2023-05-22 18:05:42','2023-05-22 18:05:42',NULL,NULL),(84,15,'register',100000,'永久有效','2023-05-22 18:05:45','2023-05-22 18:05:45',NULL,NULL),(85,14,'chat',-100,'对话消耗','2023-05-22 18:05:52','2023-05-22 18:05:52',NULL,NULL),(86,15,'chat',-100,'对话消耗','2023-05-22 18:05:55','2023-05-22 18:05:55',NULL,NULL),(87,14,'chat',-100,'对话消耗','2023-05-22 18:06:08','2023-05-22 18:06:08',NULL,NULL),(88,14,'chat',-100,'对话消耗','2023-05-22 18:06:20','2023-05-22 18:06:20',NULL,NULL),(89,14,'chat',-100,'对话消耗','2023-05-22 18:07:10','2023-05-22 18:07:10',NULL,NULL),(90,13,'Midjourney',-500,'绘图消耗','2023-05-22 18:08:13','2023-05-22 18:08:13',NULL,NULL),(91,15,'Midjourney',-500,'绘图消耗','2023-05-22 18:09:12','2023-05-22 18:09:12',NULL,NULL),(92,14,'chat',-100,'对话消耗','2023-05-22 18:14:19','2023-05-22 18:14:19',NULL,NULL),(93,14,'Midjourney',-500,'绘图消耗','2023-05-22 18:15:54','2023-05-22 18:15:54',NULL,NULL),(94,13,'Midjourney',-500,'绘图消耗','2023-05-22 18:19:19','2023-05-22 18:19:19',NULL,NULL),(95,16,'register',100000,'永久有效','2023-05-22 18:19:29','2023-05-22 18:19:29',NULL,NULL),(96,16,'Midjourney',-500,'绘图消耗','2023-05-22 18:23:21','2023-05-22 18:23:21',NULL,NULL),(97,1,'Midjourney',-500,'绘图消耗','2023-05-22 18:24:02','2023-05-22 18:24:02',NULL,NULL),(98,1,'Midjourney',-500,'绘图消耗','2023-05-22 18:30:21','2023-05-22 18:30:21',NULL,NULL),(99,13,'Midjourney',-500,'绘图消耗','2023-05-22 18:33:47','2023-05-22 18:33:47',NULL,NULL),(100,13,'Midjourney',-500,'绘图消耗','2023-05-22 18:36:42','2023-05-22 18:36:42',NULL,NULL),(101,17,'register',100000,'永久有效','2023-05-22 18:40:48','2023-05-22 18:40:48',NULL,NULL),(102,18,'register',100000,'永久有效','2023-05-22 18:46:42','2023-05-22 18:46:42',NULL,NULL),(103,17,'Midjourney',-500,'绘图消耗','2023-05-22 18:48:30','2023-05-22 18:48:30',NULL,NULL),(104,18,'Midjourney',-500,'绘图消耗','2023-05-22 18:49:09','2023-05-22 18:49:09',NULL,NULL),(105,17,'Midjourney',-500,'绘图消耗','2023-05-22 18:50:10','2023-05-22 18:50:10',NULL,NULL),(106,17,'Midjourney',-500,'绘图消耗','2023-05-22 18:52:36','2023-05-22 18:52:36',NULL,NULL),(107,17,'Midjourney',-500,'绘图消耗','2023-05-22 18:55:00','2023-05-22 18:55:00',NULL,NULL),(108,17,'Midjourney',-500,'绘图消耗','2023-05-22 18:56:31','2023-05-22 18:56:31',NULL,NULL),(109,1,'Midjourney',-500,'绘图消耗','2023-05-22 18:57:58','2023-05-22 18:57:58',NULL,NULL),(110,1,'Midjourney',-500,'绘图消耗','2023-05-22 18:59:31','2023-05-22 18:59:31',NULL,NULL),(111,12,'Midjourney',-500,'绘图消耗','2023-05-22 18:59:42','2023-05-22 18:59:42',NULL,NULL),(112,17,'Midjourney',-500,'绘图消耗','2023-05-22 19:01:16','2023-05-22 19:01:16',NULL,NULL),(113,12,'Midjourney',-500,'绘图消耗','2023-05-22 19:03:48','2023-05-22 19:03:48',NULL,NULL),(114,17,'Midjourney',-500,'绘图消耗','2023-05-22 19:04:31','2023-05-22 19:04:31',NULL,NULL),(115,12,'Midjourney',-500,'绘图消耗','2023-05-22 19:06:33','2023-05-22 19:06:33',NULL,NULL),(116,12,'Midjourney',-500,'绘图消耗','2023-05-22 19:07:47','2023-05-22 19:07:47',NULL,NULL),(117,12,'Midjourney',-500,'绘图消耗','2023-05-22 19:13:46','2023-05-22 19:13:46',NULL,NULL),(118,19,'register',100000,'永久有效','2023-05-22 19:21:58','2023-05-22 19:21:58',NULL,NULL),(119,19,'Midjourney',-500,'绘图消耗','2023-05-22 19:24:14','2023-05-22 19:24:14',NULL,NULL),(120,20,'register',100000,'永久有效','2023-05-22 19:25:04','2023-05-22 19:25:04',NULL,NULL),(121,20,'chat',-168,'对话消耗','2023-05-22 19:31:56','2023-05-22 19:31:56',NULL,NULL),(122,15,'chat',-5022,'对话消耗','2023-05-22 19:56:42','2023-05-22 19:56:42',NULL,NULL),(123,1,'Midjourney',-500,'绘图消耗','2023-05-22 20:16:39','2023-05-22 20:16:39',NULL,NULL),(124,15,'Midjourney',-500,'绘图消耗','2023-05-22 20:17:22','2023-05-22 20:17:22',NULL,NULL),(125,15,'chat',-498,'对话消耗','2023-05-22 20:21:35','2023-05-22 20:21:35',NULL,NULL),(126,15,'chat',-924,'对话消耗','2023-05-22 20:22:23','2023-05-22 20:22:23',NULL,NULL),(127,21,'register',100000,'永久有效','2023-05-22 20:27:03','2023-05-22 20:27:03',NULL,NULL),(128,22,'register',100000,'永久有效','2023-05-22 20:32:11','2023-05-22 20:32:11',NULL,NULL),(129,22,'chat',-100,'对话消耗','2023-05-22 20:34:29','2023-05-22 20:34:29',NULL,NULL),(130,22,'chat',-100,'对话消耗','2023-05-22 20:35:50','2023-05-22 20:35:50',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'riogwmgqzsff','18301331513','18301331513','','','18301331513','$argon2id$v=19$m=65536,t=4,p=1$k765nEzHNrbIC7xv9zIcpQ$ezmYLaZgaq7ZNfb1f8bFwitOzjtgrtQByuj4HvvBzcw',30,'',0,10,'2023-05-18 09:55:23','2023-05-18 09:55:23',NULL),(2,'riokdfbwuoui','catchlife6@163.com','catchlife6@163.com','','catchlife6@163.com','','$argon2id$v=19$m=65536,t=4,p=1$6EiQwaG0ptoXd4MFu+xXow$PWtxp8XpQER7/PFg/Uk1s3cu/gxFPP97AK8YDDuV2Xw',30,'',0,10,'2023-05-18 12:29:29','2023-05-18 12:29:29',NULL),(3,'ripjlwnsqzsc','18337103072','18337103072','','','18337103072','$argon2id$v=19$m=65536,t=4,p=1$D3EUqFn4KKswEAwJxPBXqA$kZuqWUYcLS9pDwpAESk4OMlDlbzDkudLVRQqkR9jBUo',30,'',0,10,'2023-05-19 07:30:16','2023-05-19 07:30:16',NULL),(4,'ripzocgrtukw','1353743034@qq.com','1353743034@qq.com','','1353743034@qq.com','','$argon2id$v=19$m=65536,t=4,p=1$50HBa95kFSfMMd4+yz/hrA$jzyg3yHDMobzVfQWXpTS2vMOYrgjfMHQ/Qs2dfOmrNQ',30,'',0,10,'2023-05-19 09:29:55','2023-05-19 09:29:55',NULL),(5,'risobgzdebri','shontwarface@gmail.com','shontwarface@gmail.com','','shontwarface@gmail.com','','$argon2id$v=19$m=65536,t=4,p=1$bD392yYjOdFasYo51iOYpw$J5RumZ31z9jj7UB8liD6TBZVJAnR00N8z6W8Anfjq8o',30,'',0,10,'2023-05-20 16:50:39','2023-05-20 16:50:39',NULL),(6,'risbhpyqifjs','18679193601','18679193601','','','18679193601','$argon2id$v=19$m=65536,t=4,p=1$/kkJClvd6fPOwfBOLbp55g$cyjl4PTndNULTiFKoZsrLSeIxkxJ/Fw/1dykqNFLO3E',30,'',0,10,'2023-05-21 03:55:02','2023-05-21 03:55:02',NULL),(7,'risbcizokpbs','18679193201','18679193201','','','18679193201','$argon2id$v=19$m=65536,t=4,p=1$oP/UBR9em4L4YF7QFC2gEA$abVxuhvIVE5OV3Jeud4R0x0pEKG/MY3fxf10XiQx8M8',30,'',0,10,'2023-05-21 04:05:23','2023-05-21 04:05:23',NULL),(8,'risbnfzopgsq','18679193633','18679193633','','','18679193633','$argon2id$v=19$m=65536,t=4,p=1$GzYf6sXoZywPxAa0vByqOQ$rJ0DLNE68dC5Sosk/AF9/HZ/68ovYoSRWnBpk1b4j6Q',30,'',0,10,'2023-05-21 04:11:00','2023-05-21 04:11:00',NULL),(9,'risnefbviwjk','15938485983','15938485983','','','15938485983','$argon2id$v=19$m=65536,t=4,p=1$3Ij0OcN/pQDVvHPZ1FuxLA$JNv7nOKstxObmfRPu60uXTsBUMbH0YMT5BwAjiQfQN0',30,'',0,10,'2023-05-21 04:17:58','2023-05-21 04:17:58',NULL),(10,'rifeilylcphk','15244892366','15244892366','','','15244892366','$argon2id$v=19$m=65536,t=4,p=1$DGBvYuOEIgRRJDfRPdfsMA$7cQyou92mx+IfdINvodOIDBrEFWr+KE03T9c0JUJkco',30,'',0,10,'2023-05-22 03:04:20','2023-05-22 03:04:20',NULL),(11,'rifpvgqlwgis','ycifxinddk@iubridge.com','ycifxinddk@iubridge.com','','ycifxinddk@iubridge.com','','$argon2id$v=19$m=65536,t=4,p=1$u06uAfQUHe3ZhBPgk2LNZQ$f/FbrVm9kQtsN9lmsDmCnltktb5s48bmkx8l/Czgk14',30,'',0,10,'2023-05-22 08:46:53','2023-05-22 08:46:53',NULL),(12,'rifsfdhaghjw','89188196@qq.com','89188196@qq.com','','89188196@qq.com','','$argon2id$v=19$m=65536,t=4,p=1$zHaHom/Mw1HkHbY3WvEG8w$yVraoQXNi0D9P2tlDwT+l2UJiMH5nlx5w1a4bMDEQdI',30,'',0,10,'2023-05-22 10:01:37','2023-05-22 10:01:37',NULL),(13,'rifshtpaknbq','408640449@qq.com','408640449@qq.com','','408640449@qq.com','','$argon2id$v=19$m=65536,t=4,p=1$98Ex2r9D9vB7Es/OeDqH/Q$qNMXBW7dPo5KCYdqtYHXsR1qpkFl190qzwqlPp0ycdU',30,'',0,10,'2023-05-22 10:04:33','2023-05-22 10:04:33',NULL),(14,'rifshcfzptgf','1343793768@qq.com','1343793768@qq.com','','1343793768@qq.com','','$argon2id$v=19$m=65536,t=4,p=1$qkswvLKgf+mE+lKu0HxFRg$R8kcESlXG96eswvABt2sIAUKG9Ec/+K4OJUCpFd4BFw',30,'',0,10,'2023-05-22 10:05:42','2023-05-22 10:05:42',NULL),(15,'rifshvpdvnvs','18984353301','18984353301','','','18984353301','$argon2id$v=19$m=65536,t=4,p=1$JzXWRlFmRR+RVJMZy8idNw$onMvnwoWHS701twHULTx4mbTpfNTvkDzAgGw6VOUCg8',30,'',0,10,'2023-05-22 10:05:45','2023-05-22 10:05:45',NULL),(16,'rifsbzsiniew','gortex@qq.com','gortex@qq.com','','gortex@qq.com','','$argon2id$v=19$m=65536,t=4,p=1$qopijMwnhLtMDZF8ukXFBQ$qG31l4wdeQOO8z2QS42XTIC1kvVX22Lvn/cr6HHCMWY',30,'',0,10,'2023-05-22 10:19:29','2023-05-22 10:19:29',NULL),(17,'rifdpmmtdbrw','3305715731@qq.com','3305715731@qq.com','','3305715731@qq.com','','$argon2id$v=19$m=65536,t=4,p=1$9UK6bob+7vd5SzC9/ptPFQ$iFTpAe7EEPXP/N92hD2n94FHsaCOGOxQUo8CiMrFZYg',30,'',0,10,'2023-05-22 10:40:48','2023-05-22 10:40:48',NULL),(18,'rifdfartnnqh','273078666@qq.com','273078666@qq.com','','273078666@qq.com','','$argon2id$v=19$m=65536,t=4,p=1$g6JGuQA5xjOja0zRPrr7wQ$zdtSuQPdvBUqSgv7WI95/n53INrsIJL4BO4VUT9DxH0',30,'',0,10,'2023-05-22 10:46:42','2023-05-22 10:46:42',NULL),(19,'riffijmdpmvd','17611646099','17611646099','','','17611646099','$argon2id$v=19$m=65536,t=4,p=1$bqT8hMQjqQ5Ld2HqDAYeJA$0BmY6EusANCiBYGEcXTQPqnQOqhi98b2o8M1ZmrIxWk',30,'',0,10,'2023-05-22 11:21:58','2023-05-22 11:21:58',NULL),(20,'riffpsuvcwzd','3151368623@qq.com','3151368623@qq.com','','3151368623@qq.com','','$argon2id$v=19$m=65536,t=4,p=1$3v2kH6qCLlxD944Ty8/nJw$URlokcqEkLfxLKyyBTjQflV4fh4qD7HSW+u84AN5cZs',30,'',0,10,'2023-05-22 11:25:04','2023-05-22 11:25:04',NULL),(21,'rifgzwanitrs','13710388824','13710388824','','','13710388824','$argon2id$v=19$m=65536,t=4,p=1$XO3gSybAADcnDaMihBL92Q$rC8T0pbMPEkOWDLxy9KKQYNFCv4AFXTiLtQY8+BQmtE',30,'',0,10,'2023-05-22 12:27:03','2023-05-22 12:27:03',NULL),(22,'rifgvqyxbpei','1103716874@qq.com','1103716874@qq.com','','1103716874@qq.com','','$argon2id$v=19$m=65536,t=4,p=1$QeEUfds51uY/2/IrxS2B1g$zvhU7GMCkfWd8+1uMKSXWIpBhriy2HfnVNWnQWRflxM',30,'',0,10,'2023-05-22 12:32:11','2023-05-22 12:32:11',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'chatgpt'
--

--
-- Dumping routines for database 'chatgpt'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22 20:37:41
