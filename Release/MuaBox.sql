CREATE DATABASE  IF NOT EXISTS `muabox` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `muabox`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: muabox
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `user_guid` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `album_title` varchar(100) NOT NULL,
  `album_description` text,
  `album_price` int(11) NOT NULL,
  `id_artist` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `album_audition` varchar(21) NOT NULL,
  `album_cover` varchar(21) NOT NULL,
  `album_cover_thumbnail` varchar(21) NOT NULL,
  `album_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_album`),
  UNIQUE KEY `album__album_title_UNIQUE` (`album_title`),
  UNIQUE KEY `album__album_audition_UNIQUE` (`album_audition`),
  UNIQUE KEY `album__album_cover_UNIQUE` (`album_cover`),
  UNIQUE KEY `album__album_cover_thumbnail_UNIQUE` (`album_cover_thumbnail`),
  KEY `album__user_guid_INDEX` (`user_guid`),
  KEY `album__id_artist_INDEX` (`id_artist`),
  KEY `album__id_genre_INDEX` (`id_genre`),
  KEY `album__album_date_INDEX` (`album_date`),
  CONSTRAINT `album__id_artist_foreign` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id_artist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `album__id_genre_foreign` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `album__user_guid_foreign` FOREIGN KEY (`user_guid`) REFERENCES `user_info` (`user_guid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'ujziEz2J6ITjs7fRT3tJjCqp','范特西','范特西专辑',10,16,17,'nMplSwYcLlOs9XJV.txt','3JgtWxeEnZTkzLUp.jpg','4E_VHT-G7H80k-37.jpg','2015-01-01 10:56:56');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `id_artist` int(11) NOT NULL AUTO_INCREMENT,
  `artist_name` text NOT NULL,
  PRIMARY KEY (`id_artist`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (16,'周杰伦');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `id_genre` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` text NOT NULL,
  `genre_description` text NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (16,'摇滚','摇滚乐'),(17,'流行','流行乐');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_exception_log`
--

DROP TABLE IF EXISTS `muabox_exception_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_exception_log` (
  `id_exception_log` int(11) NOT NULL AUTO_INCREMENT,
  `exception_message` text NOT NULL,
  `exception_source` text NOT NULL,
  `exception_stacktrace` text NOT NULL,
  `exception_web_httpcontext` text NOT NULL,
  `exception_box_defined_message` text NOT NULL,
  `exception_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_exception_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_exception_log`
--

LOCK TABLES `muabox_exception_log` WRITE;
/*!40000 ALTER TABLE `muabox_exception_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `muabox_exception_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_groups`
--

DROP TABLE IF EXISTS `muabox_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_groups` (
  `group_guid` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_groups`
--

LOCK TABLES `muabox_groups` WRITE;
/*!40000 ALTER TABLE `muabox_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `muabox_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_model_authority`
--

DROP TABLE IF EXISTS `muabox_model_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_model_authority` (
  `id_model_authority` int(11) NOT NULL AUTO_INCREMENT,
  `data_select` bit(1) NOT NULL,
  `data_insert` bit(1) NOT NULL,
  `data_update` bit(1) NOT NULL,
  `data_delete` bit(1) NOT NULL,
  PRIMARY KEY (`id_model_authority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_model_authority`
--

LOCK TABLES `muabox_model_authority` WRITE;
/*!40000 ALTER TABLE `muabox_model_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `muabox_model_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_roles`
--

DROP TABLE IF EXISTS `muabox_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_roles` (
  `role_guid` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_roles`
--

LOCK TABLES `muabox_roles` WRITE;
/*!40000 ALTER TABLE `muabox_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `muabox_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_roles_and_group`
--

DROP TABLE IF EXISTS `muabox_roles_and_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_roles_and_group` (
  `group_guid` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role_guid` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`group_guid`,`role_guid`),
  UNIQUE KEY `muabox_roles_and_group__group_guid_UNIQUE` (`group_guid`),
  UNIQUE KEY `muabox_roles_and_group__role_guid_UNIQUE` (`role_guid`),
  CONSTRAINT `muabox_roles_and_group__group_guid_foreign` FOREIGN KEY (`group_guid`) REFERENCES `muabox_groups` (`group_guid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `muabox_roles_and_group__role_guid_foreign` FOREIGN KEY (`role_guid`) REFERENCES `muabox_roles` (`role_guid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_roles_and_group`
--

LOCK TABLES `muabox_roles_and_group` WRITE;
/*!40000 ALTER TABLE `muabox_roles_and_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `muabox_roles_and_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_roles_and_model`
--

DROP TABLE IF EXISTS `muabox_roles_and_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_roles_and_model` (
  `role_guid` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `columns_hash` varchar(32) NOT NULL,
  `id_model_authority` int(11) NOT NULL,
  PRIMARY KEY (`role_guid`,`columns_hash`),
  UNIQUE KEY `muabox_roles_and_model__role_guid_UNIQUE` (`role_guid`),
  UNIQUE KEY `muabox_roles_and_model__columns_hash_UNIQUE` (`columns_hash`),
  UNIQUE KEY `muabox_roles_and_model__id_model_authority_UNIQUE` (`id_model_authority`),
  CONSTRAINT `muabox_roles_and_model__columns_hash_foreign` FOREIGN KEY (`columns_hash`) REFERENCES `muabox_tablecolumns_hash` (`columns_hash`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `muabox_roles_and_model__id_model_authority_foreign` FOREIGN KEY (`id_model_authority`) REFERENCES `muabox_model_authority` (`id_model_authority`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `muabox_roles_and_model__role_guid_foreign` FOREIGN KEY (`role_guid`) REFERENCES `muabox_roles` (`role_guid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_roles_and_model`
--

LOCK TABLES `muabox_roles_and_model` WRITE;
/*!40000 ALTER TABLE `muabox_roles_and_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `muabox_roles_and_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_tablecolumns_hash`
--

DROP TABLE IF EXISTS `muabox_tablecolumns_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_tablecolumns_hash` (
  `id_tablecolumns_hash` int(11) NOT NULL AUTO_INCREMENT,
  `model_extra` decimal(10,0) NOT NULL,
  `databasename` text NOT NULL,
  `tablename` text NOT NULL,
  `modelname` text NOT NULL,
  `columns_hash` varchar(32) NOT NULL,
  PRIMARY KEY (`columns_hash`),
  UNIQUE KEY `muabox_tablecolumns_hash__id_tablecolumns_hash_UNIQUE` (`id_tablecolumns_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_tablecolumns_hash`
--

LOCK TABLES `muabox_tablecolumns_hash` WRITE;
/*!40000 ALTER TABLE `muabox_tablecolumns_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `muabox_tablecolumns_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_uploadfile_default_property_album`
--

DROP TABLE IF EXISTS `muabox_uploadfile_default_property_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_uploadfile_default_property_album` (
  `field_name` text NOT NULL,
  `file_name` varchar(21) NOT NULL,
  `file_path` text NOT NULL,
  `file_source_name` text NOT NULL,
  `content_type` text NOT NULL,
  `content_length` int(11) NOT NULL,
  PRIMARY KEY (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_uploadfile_default_property_album`
--

LOCK TABLES `muabox_uploadfile_default_property_album` WRITE;
/*!40000 ALTER TABLE `muabox_uploadfile_default_property_album` DISABLE KEYS */;
INSERT INTO `muabox_uploadfile_default_property_album` VALUES ('album_audition','nMplSwYcLlOs9XJV.txt','2015/01/01','test.txt','text/plain',2);
/*!40000 ALTER TABLE `muabox_uploadfile_default_property_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_uploadfile_image_property_album`
--

DROP TABLE IF EXISTS `muabox_uploadfile_image_property_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_uploadfile_image_property_album` (
  `field_name` text NOT NULL,
  `file_name` varchar(21) NOT NULL,
  `file_path` text NOT NULL,
  `file_source_name` text NOT NULL,
  `content_type` text NOT NULL,
  `content_length` int(11) NOT NULL,
  `image_width` int(11) NOT NULL,
  `image_height` int(11) NOT NULL,
  PRIMARY KEY (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_uploadfile_image_property_album`
--

LOCK TABLES `muabox_uploadfile_image_property_album` WRITE;
/*!40000 ALTER TABLE `muabox_uploadfile_image_property_album` DISABLE KEYS */;
INSERT INTO `muabox_uploadfile_image_property_album` VALUES ('album_cover','3JgtWxeEnZTkzLUp.jpg','2015/01/01','8e6cb447gw1em88c9ovapj20a00fddhf.jpg','image/jpeg',69020,360,553);
/*!40000 ALTER TABLE `muabox_uploadfile_image_property_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muabox_uploadfile_thumbnailimage_property_album`
--

DROP TABLE IF EXISTS `muabox_uploadfile_thumbnailimage_property_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `muabox_uploadfile_thumbnailimage_property_album` (
  `field_name` text NOT NULL,
  `file_name` varchar(21) NOT NULL,
  `file_path` text NOT NULL,
  `image_width` int(11) NOT NULL,
  `image_height` int(11) NOT NULL,
  PRIMARY KEY (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muabox_uploadfile_thumbnailimage_property_album`
--

LOCK TABLES `muabox_uploadfile_thumbnailimage_property_album` WRITE;
/*!40000 ALTER TABLE `muabox_uploadfile_thumbnailimage_property_album` DISABLE KEYS */;
INSERT INTO `muabox_uploadfile_thumbnailimage_property_album` VALUES ('album_cover_thumbnail','4E_VHT-G7H80k-37.jpg','2015/01/01',65,100);
/*!40000 ALTER TABLE `muabox_uploadfile_thumbnailimage_property_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id_userinfo` int(11) NOT NULL AUTO_INCREMENT,
  `user_guid` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_login_name` varchar(32) NOT NULL,
  `user_login_password` varchar(32) NOT NULL,
  `user_reg_ip` varchar(39) NOT NULL,
  `user_reg_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_login_count` int(11) NOT NULL,
  `user_last_login_ip` varchar(39) NOT NULL,
  `user_last_login_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_login_name`),
  UNIQUE KEY `user_info__id_userinfo_UNIQUE` (`id_userinfo`),
  UNIQUE KEY `user_info__user_guid_UNIQUE` (`user_guid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'ujziEz2J6ITjs7fRT3tJjCqp','user002','385f4e514b5a3f3e1d25afa9a3c1560b','127.0.0.1','2015-01-01 10:48:35',3,'127.0.0.1','2015-01-02 02:47:15');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log` (
  `id_user_login_log` int(11) NOT NULL AUTO_INCREMENT,
  `user_guid` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_login_count` int(11) NOT NULL,
  `user_last_login_ip` varchar(39) NOT NULL,
  `user_last_login_log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user_login_log`),
  KEY `user_login_log__user_guid_INDEX` (`user_guid`),
  CONSTRAINT `user_login_log__user_guid_foreign` FOREIGN KEY (`user_guid`) REFERENCES `user_info` (`user_guid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_log`
--

LOCK TABLES `user_login_log` WRITE;
/*!40000 ALTER TABLE `user_login_log` DISABLE KEYS */;
INSERT INTO `user_login_log` VALUES (1,'ujziEz2J6ITjs7fRT3tJjCqp',0,'127.0.0.1','2015-01-01 10:54:45'),(2,'ujziEz2J6ITjs7fRT3tJjCqp',1,'127.0.0.1','2015-01-01 11:05:01'),(3,'ujziEz2J6ITjs7fRT3tJjCqp',2,'127.0.0.1','2015-01-02 02:47:15');
/*!40000 ALTER TABLE `user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_password_log`
--

DROP TABLE IF EXISTS `user_password_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_password_log` (
  `id_user_password_log` int(11) NOT NULL AUTO_INCREMENT,
  `user_guid` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_login_password` varchar(32) NOT NULL,
  `user_last_password_log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user_password_log`),
  KEY `user_password_log__user_guid_INDEX` (`user_guid`),
  CONSTRAINT `user_password_log__user_guid_foreign` FOREIGN KEY (`user_guid`) REFERENCES `user_info` (`user_guid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_password_log`
--

LOCK TABLES `user_password_log` WRITE;
/*!40000 ALTER TABLE `user_password_log` DISABLE KEYS */;
INSERT INTO `user_password_log` VALUES (1,'ujziEz2J6ITjs7fRT3tJjCqp','385f4e514b5a3f3e1d25afa9a3c1560b','2015-01-01 10:48:35');
/*!40000 ALTER TABLE `user_password_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-02 10:56:56
