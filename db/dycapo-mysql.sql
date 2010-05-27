# Sequel Pro dump
# Version 2210
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: dycapo
# Generation Time: 2010-05-27 16:19:43 +0200
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_a7792de1` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table auth_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_message`;

CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`,`name`,`content_type_id`,`codename`)
VALUES
	(1,'Can add permission',1,'add_permission'),
	(2,'Can change permission',1,'change_permission'),
	(3,'Can delete permission',1,'delete_permission'),
	(4,'Can add group',2,'add_group'),
	(5,'Can change group',2,'change_group'),
	(6,'Can delete group',2,'delete_group'),
	(7,'Can add user',3,'add_user'),
	(8,'Can change user',3,'change_user'),
	(9,'Can delete user',3,'delete_user'),
	(10,'Can add message',4,'add_message'),
	(11,'Can change message',4,'change_message'),
	(12,'Can delete message',4,'delete_message'),
	(13,'Can add content type',5,'add_contenttype'),
	(14,'Can change content type',5,'change_contenttype'),
	(15,'Can delete content type',5,'delete_contenttype'),
	(16,'Can add session',6,'add_session'),
	(17,'Can change session',6,'change_session'),
	(18,'Can delete session',6,'delete_session'),
	(19,'Can add site',7,'add_site'),
	(20,'Can change site',7,'change_site'),
	(21,'Can delete site',7,'delete_site'),
	(22,'Can add log entry',8,'add_logentry'),
	(23,'Can change log entry',8,'change_logentry'),
	(24,'Can delete log entry',8,'delete_logentry'),
	(25,'Can add location',9,'add_location'),
	(26,'Can change location',9,'change_location'),
	(27,'Can delete location',9,'delete_location'),
	(28,'Can add mode',10,'add_mode'),
	(29,'Can change mode',10,'change_mode'),
	(30,'Can delete mode',10,'delete_mode'),
	(31,'Can add prefs',11,'add_prefs'),
	(32,'Can change prefs',11,'change_prefs'),
	(33,'Can delete prefs',11,'delete_prefs'),
	(34,'Can add trip',12,'add_trip'),
	(35,'Can change trip',12,'change_trip'),
	(36,'Can delete trip',12,'delete_trip'),
	(37,'Can add participation',13,'add_participation'),
	(38,'Can change participation',13,'change_participation'),
	(39,'Can delete participation',13,'delete_participation'),
	(40,'Can add person',14,'add_person'),
	(41,'Can change person',14,'change_person'),
	(42,'Can delete person',14,'delete_person'),
	(43,'Can perform XML-RPC to Dycapo',14,'can_xmlrpc'),
	(44,'Can register to the System using XML-RPC',14,'can_register');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`,`username`,`first_name`,`last_name`,`email`,`password`,`is_staff`,`is_active`,`is_superuser`,`last_login`,`date_joined`)
VALUES
	(1,'admin','','','admin@admins.com','sha1$87563$0256aa7efc79ecff237039e66ca390d58aa8e76e',1,1,1,'2010-05-27 15:16:16','2010-05-27 15:16:10'),
	(2,'register','REGISTRATION','REGISTRATION','','sha1$6988e$41bc55889f81cf1f00aa16005887f89951c89d73',0,1,0,'2010-05-27 15:30:11','2010-05-27 15:19:47'),
	(3,'blahhhh','','','blah@blah.com','sha1$eebb0$222b57aa0269f1d83158a28234526695d02db79e',0,1,0,'2010-05-27 15:23:12','2010-05-27 15:23:12'),
	(5,'rider1','','','rider1@riders.com','sha1$cfd38$8db46cc45b8ce6988a316b01a7dddcd73bd2fd7d',0,1,0,'2010-05-27 15:30:12','2010-05-27 15:26:04'),
	(6,'driver1','','','driver@drivers.com','sha1$4dc7c$86d5ba499b7be56d41e06c0e753a3f77a8c141d8',0,1,0,'2010-05-27 15:30:12','2010-05-27 15:29:54'),
	(7,'dio','','','dio@ronniejamesdio.com','sha1$232d2$97357209482562acdb1666b1388e1b840181eede',0,1,0,'2010-05-27 15:30:11','2010-05-27 15:29:54'),
	(8,'rob','','','rob@judaspriest.com','sha1$e4590$0f07c21aad018241e1055b4b6ec10a2363eade81',0,1,0,'2010-05-27 15:30:11','2010-05-27 15:29:54'),
	(9,'ozzy','','','ozzy@acdcd.com','sha1$07df4$cdf3b3b00beab98c5cba747af416e52c299b7453',0,1,0,'2010-05-27 15:30:11','2010-05-27 15:29:54'),
	(10,'angela','','','angela@archenemy.com','sha1$2548e$9cfbacb9749ea59840a6f9e2ae7d2e8337b19d00',0,1,0,'2010-05-27 15:30:11','2010-05-27 15:29:54');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f0ee9890` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` (`id`,`user_id`,`permission_id`)
VALUES
	(2,2,44),
	(3,3,43),
	(4,5,43),
	(5,6,43),
	(6,7,43),
	(7,8,43),
	(8,9,43),
	(9,10,43);

/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`,`action_time`,`user_id`,`content_type_id`,`object_id`,`object_repr`,`action_flag`,`change_message`)
VALUES
	(1,'2010-05-27 15:22:36',1,14,'2','registration',1,''),
	(2,'2010-05-27 15:23:09',1,3,'2','register',2,'Changed username.'),
	(3,'2010-05-27 15:25:43',1,3,'4','rider1',3,'');

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`,`name`,`app_label`,`model`)
VALUES
	(1,'permission','auth','permission'),
	(2,'group','auth','group'),
	(3,'user','auth','user'),
	(4,'message','auth','message'),
	(5,'content type','contenttypes','contenttype'),
	(6,'session','sessions','session'),
	(7,'site','sites','site'),
	(8,'log entry','admin','logentry'),
	(9,'location','server','location'),
	(10,'mode','server','mode'),
	(11,'prefs','server','prefs'),
	(12,'trip','server','trip'),
	(13,'participation','server','participation'),
	(14,'person','server','person');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`,`session_data`,`expire_date`)
VALUES
	('1b09a0fa976cd9d2e709a378d3a5cf03','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:23:12'),
	('54c392fa505e825dba1678a2203dc6c9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS43ODI2YTQ1Mjk4MWZmMmUy\nMzVmZDQ0ZWM3OGUxZGE1ZA==\n','2010-06-10 15:16:16'),
	('07f3d7c96096694ebefd7f19c18ed940','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:23:36'),
	('35d4c5303d005b8916b7dac5159b421c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:23:36'),
	('42e7d8d4c4734236df70a297c458f537','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:24:38'),
	('826219989abd3696cdc5c8eff2dd6008','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:24:38'),
	('bf8fc269c76ac116c31c22adb32c3730','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:26:04'),
	('a9cfdcc8b75dc71999b252fca52f9af8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:26:04'),
	('64b1599211b57fdd95900313a127fe97','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:29:54'),
	('2fd38be42539b20dc52672340bdda5db','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:29:54'),
	('72bd4a10afca7864fe7cdeddde63fd78','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:29:54'),
	('3f4e700540969893ba649df3c467947f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:29:54'),
	('1299d6898e12d2b34ace7d599ad9aa2f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:29:54'),
	('cf5f451ecd2c3995f89de9d62760ca94','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:29:54'),
	('b30629bffcd9f559afe57e9e8bfefb00','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:29:54'),
	('a5ab0e8b35b98359679d20d7a8e1f777','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('37e7372d83d4b578a615be83740287e7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('b51e617ed5f752213fb2f8376c492d88','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('8098068f7e31b80276fadfc77f878e2d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('88a35a9b7a1dadb1080eb210a92f612b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('7dd9a13f3de0df19f9e6e4c860562b1a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('b9f02d26c6bee38e6ce1f1bb75234f53','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('5e729da157df455ac31297631a6386df','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('7ccee9be526db0ca287ec4d0c39359f8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('f2e109bef37e665daa6bd215945cb3b3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('867e198be1acb82869b0c7014d9631ee','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('e0232abf9855d13690b64c25942455bd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:06'),
	('0a3f2376793ec01e1be96e8c848dc26c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:06'),
	('804561c1bb494c13f055e0613d77160e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:06'),
	('a8cd74ed2dcf83af97b95ef44a4901cc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('8cc9dc78ecfc028fcf63d761e19d15b1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('a2bc580193cae848ac71b2a09137c610','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('efb8e8af2b66b8f65f7778139e5a87bb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('e54e806529b276d60962e236a58c8b94','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('951a48a2082225f295bcbc48bc10c786','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('3a94a8b4ec0338326cc4022f4267860d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('5f207da2b76f13130c3c479d854d8fb5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('51b7a92885518e81bd0e17aaa116fdb1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('115326635d30ad98bb2be36f50012b8e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('fa8ba36894ac8680c9c696ce322f041e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('9b25effdcfb223f2ae894a02f93e48d7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('8ce8e3f3681ba3c096f57cccb03ea38d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('16ba03f9c6bff5054deb515afce17214','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('5eaa254926f4b0e8af6b599823892eb4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('0b905edf73b26596534c2a09aba4cee7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('10a2775f55ee74bd590e307362194a38','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('6f879e28152ee73be10cdb55a8f3a080','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('c556ae2d8b2c0e36da12f6dbe7dcc875','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('ef22ff26f200ef3e1c0ec051ba780a4d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('c14d725debb6a8088b6fcef2d7a8b0ea','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('c7a21e518533605ed379f78b2a1623c3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('30e73857947486f2391ad4fdf7be02e1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:07'),
	('7b63c097fb8f99eb6a406900ad335647','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:07'),
	('c42f1c3ae02c29155f628f75a596e51a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('c7f6bd97f986a010c9f70715a95170d8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('72e753b0069a7e2a314aa2d4ca4b95da','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('25e6c044723d306336cc39f776a7d178','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('668dd66ab4e03361ebe8244f251928b1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('91e59b7b9adcdab133edd6cc986c7d0a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('977defe6353b745a22bd933527e9fa84','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('84ac235ca762dddfa241a5656f966ab2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('f2d36869f8a12d2b889debc4c0281262','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('2a7303af38f943f0892e4e5cd3fe661d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('e55aa69808a00699d45581dc331fa5e8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('c29daa09042365661115ae9af9458cd9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('7df73dfab3902f40dd87b955791459c5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('590a1c3dd3b3a308732366a88d629241','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('be0aa609ef025dd7d78c86b082ebf75b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('0b40aa139ee067233ce31d67da66b2bb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('420a89405ef71194ae1fe27455bb6190','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('29224fdec29b0c1b617644f41fba46a3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('baee19f6c0caa99e26aaadfcb574fb11','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('12684e4c0270a39f285aa7c4c9f69c69','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('b5b020b2844bbe692f4b3d3a1b815c3a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('1f3185702e947ae27e6c810ab625c63e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:08'),
	('326ea794184f7ade6d63d8ae1f9f6458','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('af3cf60a185caac1799be02aed4180c4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:08'),
	('f8dbd629c43bedc0e9c376e70b66f74a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('8805fa7fc0e427883e3de61ae155f71a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('da664b874fb0508acbc5f84e8fef1385','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('ffcaf2d41fd779bd259908fe44645c1e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('bd885751cea3f1bf51a9aa51b1e70e2c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('c3b6e0d4c4cb7a2c6f36d306b4b49912','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('f0036a50765facb2bebfb541de96d58a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('d702e9dac36a68b45376eef9aee86829','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('1e48cd7c0fa01d8c965056ef8b12e1e9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('94c42cf5b152840eb1be84c1d2649807','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('c8adbd3d665031bf8ef62b8bfae9effd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('7c9b12f09baf858b9926c23dfba0d01e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('ab06b4ddb03241869f779eb2a5820781','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('0139d0f66cfc85b0ab18d7031a136014','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('9e2de7c39d4578bceaac1e0c837b74b9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('7c1eec8459147821d26eb2e98b6b6473','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('ed52b3357c3c7cd32b2275f6f25c74bc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('d7b4271a1804bcc6f45547a763ff0c1e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('4b2646b99fa205cbed050d94d733ac9f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('b60f687b01fdc60e55c6f7b29c704831','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:09'),
	('495474b6ef2a94f40dfe4c8254e64a8f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('c326b950d237631b2afe6e5bf173a2a0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('664628c449ab6cb8507807046f00c926','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:09'),
	('d1241c26edf75f738352d3791527f5ba','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:09'),
	('48bc7261e0d4a1f373ed3373a39d2de8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:09'),
	('accd9ce2bc0d41588a9ed157f481befb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEIdS4wY2VkMTI5YTE5MTg2NDhi\nYTFlM2Y0ODQyZTgxNTM5ZA==\n','2010-06-10 15:30:09'),
	('45b1d60656a49871737fd847052b241b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEIdS4wY2VkMTI5YTE5MTg2NDhi\nYTFlM2Y0ODQyZTgxNTM5ZA==\n','2010-06-10 15:30:09'),
	('953687acd0ce3f775d0fcd55d837e495','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEHdS43MjUyNTE5OWRkM2VhOTg1\nYWUwODg1MjAxZjBkOTkxNw==\n','2010-06-10 15:30:09'),
	('ea7b03aebec09f12f5e7597f1485a40e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEHdS43MjUyNTE5OWRkM2VhOTg1\nYWUwODg1MjAxZjBkOTkxNw==\n','2010-06-10 15:30:09'),
	('66b8b096a395ce0b0c0d92502f4a7268','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-10 15:30:09'),
	('c2cff10ed9622c503137ce2ad1a62e3b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-10 15:30:10'),
	('a3828d5850fc14ddb8f8adc7035165de','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEJdS4yNzIzZmI1ZDAxMTM1MzQ0\nZWUyZjk3NWIwMzE2OWNmOQ==\n','2010-06-10 15:30:10'),
	('0cb8dc6ee3b3d86e78559e00b0dc6dec','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEJdS4yNzIzZmI1ZDAxMTM1MzQ0\nZWUyZjk3NWIwMzE2OWNmOQ==\n','2010-06-10 15:30:10'),
	('a9754eb998a2c201ab20818576c9ddbb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('adcd77ea0a7c1c751ab629566b78e146','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEIdS4wY2VkMTI5YTE5MTg2NDhi\nYTFlM2Y0ODQyZTgxNTM5ZA==\n','2010-06-10 15:30:10'),
	('da9c20f110dd17eaeaf16e2e95bdfd2e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEHdS43MjUyNTE5OWRkM2VhOTg1\nYWUwODg1MjAxZjBkOTkxNw==\n','2010-06-10 15:30:10'),
	('a46ff15495eb0e97528da0a248e9ff7b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-10 15:30:10'),
	('15ea4b2bbbc529095c992be4250108be','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEJdS4yNzIzZmI1ZDAxMTM1MzQ0\nZWUyZjk3NWIwMzE2OWNmOQ==\n','2010-06-10 15:30:10'),
	('6abaf4816fd4653d4083ae7dcc36a741','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('6b526125346a17288a7ccc5eb7c9b73b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEIdS4wY2VkMTI5YTE5MTg2NDhi\nYTFlM2Y0ODQyZTgxNTM5ZA==\n','2010-06-10 15:30:10'),
	('164b9d7881837b03c92070c526e2c3ee','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEHdS43MjUyNTE5OWRkM2VhOTg1\nYWUwODg1MjAxZjBkOTkxNw==\n','2010-06-10 15:30:10'),
	('2290376525bb17879bacf939974c0bfe','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-10 15:30:10'),
	('49541569043a7040848564870bd9e83f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEJdS4yNzIzZmI1ZDAxMTM1MzQ0\nZWUyZjk3NWIwMzE2OWNmOQ==\n','2010-06-10 15:30:10'),
	('694b543a4742c7fcdd76759487845f7e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('3068b69faf8ebf14bfdefa24352f133a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEIdS4wY2VkMTI5YTE5MTg2NDhi\nYTFlM2Y0ODQyZTgxNTM5ZA==\n','2010-06-10 15:30:10'),
	('ab9eb1883f1d2f2caa8cb9c71e5551b8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('164ce8bfa202d09c508c7f06b8d9df39','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('095e7202d5de7b8ea23ad3f925f93844','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEIdS4wY2VkMTI5YTE5MTg2NDhi\nYTFlM2Y0ODQyZTgxNTM5ZA==\n','2010-06-10 15:30:10'),
	('8d826f37b60437a2e8dca9f5b734a334','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEHdS43MjUyNTE5OWRkM2VhOTg1\nYWUwODg1MjAxZjBkOTkxNw==\n','2010-06-10 15:30:10'),
	('4d1dfa223cc09d01558d07ce9757989d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-10 15:30:10'),
	('f375e5b7072afe16a6ba80401c1097e8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEJdS4yNzIzZmI1ZDAxMTM1MzQ0\nZWUyZjk3NWIwMzE2OWNmOQ==\n','2010-06-10 15:30:10'),
	('1e05e6ff68f915f4e1dd6edad243dda8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('364c1b456723bd4d33c915e7e2722a39','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('89a6486e357fe64958adb1f299fdf7f9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('3cbb82296ce8a2f011533c6a85fe9619','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('1bf6b6b0106cb369f74cbb38ce88bd20','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('6699c9574c0dc0589cc7f9f0594d41d0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('bd7b9ec4cf05702e22a1a390c2506133','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:10'),
	('1b3841a143dff791086c7adab16d0a53','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:11'),
	('08603dc02a37e6ddbe4ca6b61a10f9a9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEIdS4wY2VkMTI5YTE5MTg2NDhi\nYTFlM2Y0ODQyZTgxNTM5ZA==\n','2010-06-10 15:30:11'),
	('b49ac95409dd18175fdf4356e34fd9cb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEHdS43MjUyNTE5OWRkM2VhOTg1\nYWUwODg1MjAxZjBkOTkxNw==\n','2010-06-10 15:30:11'),
	('57572a77bf05bd5a668b147f66900e03','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-10 15:30:11'),
	('c79727c6877bc1c492ecf2bcff831e15','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEJdS4yNzIzZmI1ZDAxMTM1MzQ0\nZWUyZjk3NWIwMzE2OWNmOQ==\n','2010-06-10 15:30:11'),
	('99eece336dde420b4adcc8a169daa519','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('1053fdb3d7484f6a346fef1617e279c5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEJdS4yNzIzZmI1ZDAxMTM1MzQ0\nZWUyZjk3NWIwMzE2OWNmOQ==\n','2010-06-10 15:30:11'),
	('3f034589b8d2cfe97cf731ea6d088371','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('20067f9201101750981cfd48ddb4d5c0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEIdS4wY2VkMTI5YTE5MTg2NDhi\nYTFlM2Y0ODQyZTgxNTM5ZA==\n','2010-06-10 15:30:11'),
	('8365fb944227992efaf9dd183c424c9e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEHdS43MjUyNTE5OWRkM2VhOTg1\nYWUwODg1MjAxZjBkOTkxNw==\n','2010-06-10 15:30:11'),
	('ce10b5c64104f372f9083bd096af45a2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-10 15:30:11'),
	('39e4df7a6f85855798f4df98fb2e08a0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEJdS4yNzIzZmI1ZDAxMTM1MzQ0\nZWUyZjk3NWIwMzE2OWNmOQ==\n','2010-06-10 15:30:11'),
	('5fcba691d557157e12b9e53ed2bede15','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:11'),
	('82de3a17bef04adebca614f52b608eb4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('65ccb50adbf5a10a04433a9b6a8ca1e7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('e36e5d32cdcbd10102d254b3af651360','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:30:11'),
	('5effa4e3e7279b6584f69e7a9efd4042','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:30:11'),
	('aedc19a16849577c695ee032ef0d5456','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:30:11'),
	('21dc7eb9ee24ac2d443c770064c98b0f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:30:11'),
	('c3810697919ce2e32c50161590c25a19','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:30:11'),
	('6e848a09978c7a55b62c716b9c038633','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:30:11'),
	('7301b3c9ad963ff32698c556b5be258f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-10 15:30:11'),
	('9e8c57d9149d34d4e5f65af130dbc75e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('fc58978904ab46da1e4706ff55a31d03','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('354b6a15faa360ef343e65d6d72fc5bb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('d77fa464a9a94429b3695aec0a1838b8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('b449a8df3db871c78c2c3b6666b4e1eb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('ec659f967cab06a222d4c1a16eb4b9d1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:11'),
	('1617fcb6062badc2f0ccaf8e941fa09d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:11'),
	('4a390ab17b452d9bee923c26ef15ced9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:12'),
	('f7ed86c18aea975baa773bf46f606c21','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:12'),
	('73539d76d2d5b167ed7e4d186eda2f58','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:12'),
	('f76031811430d011b013a338eec229a2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:12'),
	('7c9a922bcf2a42a43b098e1891a28440','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:12'),
	('78b03cff5a3975d8a6bf5f5214addf57','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:12'),
	('a49d4e68005a1c32fd74387fcf345cbd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:12'),
	('35091119f542490ebbf39b3ffd4379d3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:12'),
	('899a4049916cbfed18d7040b85157eb6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:12'),
	('c797086ba5b706317bf7814cb0667874','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:12'),
	('7cd0a28afb7820ac47f8bf10ceb31cfc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:12'),
	('1e4e4488e56d1c3d85cc5eb9f57478e2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:12'),
	('f48a78c4e3a3bbc5ab21679ed679b978','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:12'),
	('694c39054efa56b510899ef91bd0ac60','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:12'),
	('058aa5b1f77ef8972666853824dd4da9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-06-10 15:30:12'),
	('a43e60853f09b4bdfbfc2eba5348e24a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-06-10 15:30:12');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_site`;

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` (`id`,`domain`,`name`)
VALUES
	(1,'example.com','example.com');

/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table server_location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_location`;

CREATE TABLE `server_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `point` varchar(50) NOT NULL,
  `country` varchar(2) NOT NULL,
  `region` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `postcode` int(10) unsigned DEFAULT NULL,
  `subregion` varchar(255) NOT NULL,
  `georss_point` varchar(255) NOT NULL,
  `georss_point_latitude` double DEFAULT NULL,
  `georss_point_longitude` double DEFAULT NULL,
  `offset` int(10) unsigned DEFAULT NULL,
  `recurs` varchar(255) NOT NULL,
  `days` varchar(255) NOT NULL,
  `leaves` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

LOCK TABLES `server_location` WRITE;
/*!40000 ALTER TABLE `server_location` DISABLE KEYS */;
INSERT INTO `server_location` (`id`,`label`,`street`,`point`,`country`,`region`,`town`,`postcode`,`subregion`,`georss_point`,`georss_point_latitude`,`georss_point_longitude`,`offset`,`recurs`,`days`,`leaves`)
VALUES
	(1,'Work','','posi','','','',0,'','46.000 11.000',46,11,150,'','','2010-05-27 15:30:06'),
	(2,'Work','','posi','','','',0,'','46.490200 11.342294',46.4902,11.342294,150,'','','2010-05-27 15:30:06'),
	(3,'Work','','orig','','','',0,'','46.490200 11.342294',46.4902,11.342294,150,'','','2010-05-27 15:30:06'),
	(4,'Work','','dest','','','',0,'','46.500740 11.345073',46.50074,11.345073,150,'','','2010-05-27 15:30:06'),
	(5,'Work','','posi','','','',0,'','46.500000  11.340000',46.5,11.34,150,'','','2010-05-27 15:30:06'),
	(6,'Work','','posi','','','',0,'','46.502000  11.340000',46.502,11.34,150,'','','2010-05-27 15:30:06'),
	(7,'Work','','orig','','','',0,'','46.500000  11.340000',46.5,11.34,150,'','','2010-05-27 15:30:06'),
	(8,'Work','','dest','','','',0,'','46.505000  11.340000',46.505,11.34,150,'','','2010-05-27 15:30:06'),
	(9,'Work','','posi','','','',0,'','46.5001 11.34',46.5001,11.34,150,'','','2010-05-27 15:30:06'),
	(10,'Work','','posi','','','',0,'','46.5002 11.34',46.5002,11.34,150,'','','2010-05-27 15:30:06'),
	(11,'Work','','posi','','','',0,'','46.5003 11.34',46.5003,11.34,150,'','','2010-05-27 15:30:06'),
	(12,'Work','','posi','','','',0,'','46.5004 11.34',46.5004,11.34,150,'','','2010-05-27 15:30:06'),
	(13,'Work','','posi','','','',0,'','46.5005 11.34',46.5005,11.34,150,'','','2010-05-27 15:30:06'),
	(14,'Work','','posi','','','',0,'','46.5006 11.34',46.5006,11.34,150,'','','2010-05-27 15:30:06'),
	(15,'Work','','posi','','','',0,'','46.5007 11.34',46.5007,11.34,150,'','','2010-05-27 15:30:06'),
	(16,'Work','','posi','','','',0,'','46.5008 11.34',46.5008,11.34,150,'','','2010-05-27 15:30:06'),
	(17,'Work','','posi','','','',0,'','46.5009 11.34',46.5009,11.34,150,'','','2010-05-27 15:30:06'),
	(18,'Work','','posi','','','',0,'','46.501 11.34',46.501,11.34,150,'','','2010-05-27 15:30:06'),
	(19,'Work','','posi','','','',0,'','46.5011 11.34',46.5011,11.34,150,'','','2010-05-27 15:30:06'),
	(20,'Work','','posi','','','',0,'','46.5012 11.34',46.5012,11.34,150,'','','2010-05-27 15:30:06'),
	(21,'Work','','posi','','','',0,'','46.5013 11.34',46.5013,11.34,150,'','','2010-05-27 15:30:06'),
	(22,'Work','','posi','','','',0,'','46.5014 11.34',46.5014,11.34,150,'','','2010-05-27 15:30:06'),
	(23,'Work','','posi','','','',0,'','46.5015 11.34',46.5015,11.34,150,'','','2010-05-27 15:30:06'),
	(24,'Work','','posi','','','',0,'','46.5016 11.34',46.5016,11.34,150,'','','2010-05-27 15:30:06'),
	(25,'Work','','posi','','','',0,'','46.5017 11.34',46.5017,11.34,150,'','','2010-05-27 15:30:06'),
	(26,'Work','','posi','','','',0,'','46.5018 11.34',46.5018,11.34,150,'','','2010-05-27 15:30:06'),
	(27,'Work','','posi','','','',0,'','46.5019 11.34',46.5019,11.34,150,'','','2010-05-27 15:30:06'),
	(28,'Work','','posi','','','',0,'','46.502 11.34',46.502,11.34,150,'','','2010-05-27 15:30:06'),
	(29,'Work','','posi','','','',0,'','46.503 11.34',46.503,11.34,150,'','','2010-05-27 15:30:06'),
	(30,'Work','','posi','','','',0,'','46.5029 11.34',46.5029,11.34,150,'','','2010-05-27 15:30:06'),
	(31,'Work','','posi','','','',0,'','46.5028 11.34',46.5028,11.34,150,'','','2010-05-27 15:30:06'),
	(32,'Work','','posi','','','',0,'','46.5027 11.34',46.5027,11.34,150,'','','2010-05-27 15:30:06'),
	(33,'Work','','posi','','','',0,'','46.5026 11.34',46.5026,11.34,150,'','','2010-05-27 15:30:06'),
	(34,'Work','','posi','','','',0,'','46.5025 11.34',46.5025,11.34,150,'','','2010-05-27 15:30:06'),
	(35,'Work','','posi','','','',0,'','46.5024 11.34',46.5024,11.34,150,'','','2010-05-27 15:30:06'),
	(36,'Work','','posi','','','',0,'','46.5023 11.34',46.5023,11.34,150,'','','2010-05-27 15:30:06'),
	(37,'Work','','posi','','','',0,'','46.5022 11.34',46.5022,11.34,150,'','','2010-05-27 15:30:06'),
	(38,'Work','','posi','','','',0,'','46.5021 11.34',46.5021,11.34,150,'','','2010-05-27 15:30:06'),
	(39,'Work','','posi','','','',0,'','46.502 11.34',46.502,11.34,150,'','','2010-05-27 15:30:06'),
	(40,'Work','','posi','','','',0,'','46.5019 11.34',46.5019,11.34,150,'','','2010-05-27 15:30:06'),
	(41,'Work','','posi','','','',0,'','46.5018 11.34',46.5018,11.34,150,'','','2010-05-27 15:30:06'),
	(42,'Work','','posi','','','',0,'','46.5017 11.34',46.5017,11.34,150,'','','2010-05-27 15:30:06'),
	(43,'Work','','posi','','','',0,'','46.5016 11.34',46.5016,11.34,150,'','','2010-05-27 15:30:06'),
	(44,'Work','','posi','','','',0,'','46.5015 11.34',46.5015,11.34,150,'','','2010-05-27 15:30:06'),
	(45,'Work','','posi','','','',0,'','46.5014 11.34',46.5014,11.34,150,'','','2010-05-27 15:30:06'),
	(46,'Work','','posi','','','',0,'','46.5013 11.34',46.5013,11.34,150,'','','2010-05-27 15:30:06'),
	(47,'Work','','posi','','','',0,'','46.5012 11.34',46.5012,11.34,150,'','','2010-05-27 15:30:06'),
	(48,'Work','','posi','','','',0,'','46.5011 11.34',46.5011,11.34,150,'','','2010-05-27 15:30:06'),
	(49,'Work','','posi','','','',0,'','46.501 11.34',46.501,11.34,150,'','','2010-05-27 15:30:06'),
	(50,'Work','','posi','','','',0,'','46.490200 11.342294',46.4902,11.342294,150,'','','2010-05-27 15:30:06'),
	(51,'Work','','posi','','','',0,'','46.494957  11.340239',46.494957,11.340239,150,'','','2010-05-27 15:30:06'),
	(52,'Work','','posi','','','',0,'','46.494957  11.340239',46.494957,11.340239,150,'','','2010-05-27 15:30:06'),
	(53,'Work','','posi','','','',0,'','46.494957  11.340239',46.494957,11.340239,150,'','','2010-05-27 15:30:06'),
	(54,'Work','','posi','','','',0,'','46.494957  11.340239',46.494957,11.340239,150,'','','2010-05-27 15:30:06'),
	(55,'Work','','posi','','','',0,'','46.494957  11.340239',46.494957,11.340239,150,'','','2010-05-27 15:30:06'),
	(56,'Work','','orig','','','',0,'','46.490200 11.342294',46.4902,11.342294,150,'','','2010-05-27 15:30:06'),
	(57,'Work','','dest','','','',0,'','46.500740 11.345073',46.50074,11.345073,150,'','','2010-05-27 15:30:06'),
	(58,'Work','','posi','','','',0,'','46.500730 11.345070',46.50073,11.34507,150,'','','2010-05-27 15:30:06'),
	(59,'Work','','posi','','','',0,'','46.490200 11.342294',46.4902,11.342294,150,'','','2010-05-27 15:30:06'),
	(60,'Work','','posi','','','',0,'','46.000 11.000',46,11,150,'','','2010-05-27 15:30:06'),
	(61,'Work','','posi','','','',0,'','46.494957  11.340239',46.494957,11.340239,150,'','','2010-05-27 15:30:06'),
	(62,'Work','','posi','','','',0,'','46.490200 11.342294',46.4902,11.342294,150,'','','2010-05-27 15:30:06'),
	(63,'Work','','posi','','','',0,'','46.494957  11.340239',46.494957,11.340239,150,'','','2010-05-27 15:30:06'),
	(64,'Work','','orig','','','',0,'','46.490200 11.342294',46.4902,11.342294,150,'','','2010-05-27 15:30:06'),
	(65,'Work','','dest','','','',0,'','46.500740 11.345073',46.50074,11.345073,150,'','','2010-05-27 15:30:06'),
	(66,'Work','','posi','','','',0,'','46.500730 11.345070',46.50073,11.34507,150,'','','2010-05-27 15:30:06'),
	(67,'Work','','posi','','','',0,'','46.490200 11.342294',46.4902,11.342294,150,'','','2010-05-27 15:30:06');

/*!40000 ALTER TABLE `server_location` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table server_mode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_mode`;

CREATE TABLE `server_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(255) NOT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `vacancy` int(11) DEFAULT NULL,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int(10) unsigned DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `lic` varchar(255) NOT NULL,
  `cost` double DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_mode_person_id` (`person_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `server_mode` WRITE;
/*!40000 ALTER TABLE `server_mode` DISABLE KEYS */;
INSERT INTO `server_mode` (`id`,`kind`,`capacity`,`vacancy`,`make`,`model`,`year`,`color`,`lic`,`cost`,`person_id`)
VALUES
	(1,'auto',4,4,'Ford','Fiesta',0,'','',0,6);

/*!40000 ALTER TABLE `server_mode` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table server_participation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_participation`;

CREATE TABLE `server_participation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `role` varchar(6) NOT NULL,
  `requested` tinyint(1) NOT NULL,
  `requested_timestamp` datetime DEFAULT NULL,
  `requested_position_id` int(11) DEFAULT NULL,
  `accepted` tinyint(1) NOT NULL,
  `accepted_timestamp` datetime DEFAULT NULL,
  `accepted_position_id` int(11) DEFAULT NULL,
  `started` tinyint(1) NOT NULL,
  `started_timestamp` datetime DEFAULT NULL,
  `started_position_id` int(11) DEFAULT NULL,
  `finished` tinyint(1) NOT NULL,
  `finished_timestamp` datetime DEFAULT NULL,
  `finished_position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_participation_person_id` (`person_id`),
  KEY `server_participation_trip_id` (`trip_id`),
  KEY `server_participation_requested_position_id` (`requested_position_id`),
  KEY `server_participation_accepted_position_id` (`accepted_position_id`),
  KEY `server_participation_started_position_id` (`started_position_id`),
  KEY `server_participation_finished_position_id` (`finished_position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

LOCK TABLES `server_participation` WRITE;
/*!40000 ALTER TABLE `server_participation` DISABLE KEYS */;
INSERT INTO `server_participation` (`id`,`person_id`,`trip_id`,`role`,`requested`,`requested_timestamp`,`requested_position_id`,`accepted`,`accepted_timestamp`,`accepted_position_id`,`started`,`started_timestamp`,`started_position_id`,`finished`,`finished_timestamp`,`finished_position_id`)
VALUES
	(1,6,1,'driver',0,NULL,NULL,0,NULL,NULL,1,'2010-05-27 15:30:06',2,1,'2010-05-27 15:30:06',NULL),
	(2,6,2,'driver',0,NULL,NULL,0,NULL,NULL,1,'2010-05-27 15:30:07',5,1,'2010-05-27 15:30:09',NULL),
	(3,6,3,'driver',0,NULL,NULL,0,NULL,NULL,1,'2010-05-27 15:30:10',50,1,'2010-05-27 15:30:11',NULL),
	(4,8,3,'rider',1,'2010-05-27 15:30:10',52,1,'2010-05-27 15:30:10',52,1,'2010-05-27 15:30:11',52,1,'2010-05-27 15:30:11',52),
	(5,7,3,'rider',1,'2010-05-27 15:30:10',53,1,'2010-05-27 15:30:10',53,1,'2010-05-27 15:30:11',53,1,'2010-05-27 15:30:11',53),
	(6,10,3,'rider',1,'2010-05-27 15:30:10',54,1,'2010-05-27 15:30:10',54,1,'2010-05-27 15:30:11',54,1,'2010-05-27 15:30:11',54),
	(7,9,3,'rider',1,'2010-05-27 15:30:10',55,1,'2010-05-27 15:30:11',55,1,'2010-05-27 15:30:11',55,1,'2010-05-27 15:30:11',55),
	(8,6,4,'driver',0,NULL,NULL,0,NULL,NULL,1,'2010-05-27 15:30:12',62,1,'2010-05-27 15:30:12',NULL),
	(9,5,4,'rider',1,'2010-05-27 15:30:12',63,1,'2010-05-27 15:30:12',63,1,'2010-05-27 15:30:12',63,1,'2010-05-27 15:30:12',63);

/*!40000 ALTER TABLE `server_participation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table server_participation_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_participation_locations`;

CREATE TABLE `server_participation_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participation_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `participation_id` (`participation_id`,`location_id`),
  KEY `location_id_refs_id_a16218b1` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

LOCK TABLES `server_participation_locations` WRITE;
/*!40000 ALTER TABLE `server_participation_locations` DISABLE KEYS */;
INSERT INTO `server_participation_locations` (`id`,`participation_id`,`location_id`)
VALUES
	(1,2,9),
	(2,2,10),
	(3,2,11),
	(4,2,12),
	(5,2,13),
	(6,2,14),
	(7,2,15),
	(8,2,16),
	(9,2,17),
	(10,2,18),
	(11,2,19),
	(12,2,20),
	(13,2,21),
	(14,2,22),
	(15,2,23),
	(16,2,24),
	(17,2,25),
	(18,2,26),
	(19,2,27),
	(20,2,28),
	(21,2,29),
	(22,2,30),
	(23,2,31),
	(24,2,32),
	(25,2,33),
	(26,2,34),
	(27,2,35),
	(28,2,36),
	(29,2,37),
	(30,2,38),
	(31,2,39),
	(32,2,40),
	(33,2,41),
	(34,2,42),
	(35,2,43),
	(36,2,44),
	(37,2,45),
	(38,2,46),
	(39,2,47),
	(40,2,48),
	(41,2,49),
	(42,3,58),
	(43,3,59),
	(44,8,66),
	(45,8,67);

/*!40000 ALTER TABLE `server_participation_locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table server_person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_person`;

CREATE TABLE `server_person` (
  `user_ptr_id` int(11) NOT NULL,
  `uri` varchar(200) NOT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `smoker` tinyint(1) NOT NULL,
  `blind` tinyint(1) NOT NULL,
  `deaf` tinyint(1) NOT NULL,
  `dog` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `server_person_position_id` (`position_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `server_person` WRITE;
/*!40000 ALTER TABLE `server_person` DISABLE KEYS */;
INSERT INTO `server_person` (`user_ptr_id`,`uri`,`phone`,`position_id`,`age`,`gender`,`smoker`,`blind`,`deaf`,`dog`)
VALUES
	(2,'','REGISTRATION',NULL,99,'M',0,0,0,0),
	(3,'','12323123',NULL,0,NULL,0,0,0,0),
	(5,'','123233',63,0,NULL,0,0,0,0),
	(6,'','1232332433',67,0,NULL,0,0,0,0),
	(7,'','1232333242343',53,0,NULL,0,0,0,0),
	(8,'','1232349033',52,0,NULL,0,0,0,0),
	(9,'','12322341433',55,0,NULL,0,0,0,0),
	(10,'','1232332043',54,0,NULL,0,0,0,0);

/*!40000 ALTER TABLE `server_person` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table server_person_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_person_locations`;

CREATE TABLE `server_person_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_id` (`person_id`,`location_id`),
  KEY `location_id_refs_id_834d4e8` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

LOCK TABLES `server_person_locations` WRITE;
/*!40000 ALTER TABLE `server_person_locations` DISABLE KEYS */;
INSERT INTO `server_person_locations` (`id`,`person_id`,`location_id`)
VALUES
	(1,6,1),
	(2,6,2),
	(3,6,5),
	(4,5,6),
	(5,6,9),
	(6,6,10),
	(7,6,11),
	(8,6,12),
	(9,6,13),
	(10,6,14),
	(11,6,15),
	(12,6,16),
	(13,6,17),
	(14,6,18),
	(15,6,19),
	(16,6,20),
	(17,6,21),
	(18,6,22),
	(19,6,23),
	(20,6,24),
	(21,6,25),
	(22,6,26),
	(23,6,27),
	(24,6,28),
	(25,6,29),
	(26,6,30),
	(27,6,31),
	(28,6,32),
	(29,6,33),
	(30,6,34),
	(31,6,35),
	(32,6,36),
	(33,6,37),
	(34,6,38),
	(35,6,39),
	(36,6,40),
	(37,6,41),
	(38,6,42),
	(39,6,43),
	(40,6,44),
	(41,6,45),
	(42,6,46),
	(43,6,47),
	(44,6,48),
	(45,6,49),
	(46,6,50),
	(47,5,51),
	(48,8,52),
	(49,7,53),
	(50,10,54),
	(51,9,55),
	(52,6,58),
	(53,6,59),
	(54,5,60),
	(55,5,61),
	(56,6,62),
	(57,5,63),
	(58,6,66),
	(59,6,67);

/*!40000 ALTER TABLE `server_person_locations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table server_prefs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_prefs`;

CREATE TABLE `server_prefs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` varchar(50) NOT NULL,
  `nonsmoking` tinyint(1) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `drive` tinyint(1) NOT NULL,
  `ride` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `server_prefs` WRITE;
/*!40000 ALTER TABLE `server_prefs` DISABLE KEYS */;
INSERT INTO `server_prefs` (`id`,`age`,`nonsmoking`,`gender`,`drive`,`ride`)
VALUES
	(1,'18-30',0,'',0,0);

/*!40000 ALTER TABLE `server_prefs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table server_trip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_trip`;

CREATE TABLE `server_trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `mode_id` int(11) DEFAULT NULL,
  `prefs_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_trip_author_id` (`author_id`),
  KEY `server_trip_mode_id` (`mode_id`),
  KEY `server_trip_prefs_id` (`prefs_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `server_trip` WRITE;
/*!40000 ALTER TABLE `server_trip` DISABLE KEYS */;
INSERT INTO `server_trip` (`id`,`published`,`updated`,`expires`,`active`,`author_id`,`mode_id`,`prefs_id`)
VALUES
	(1,'2010-05-27 15:30:06','2010-05-27 15:30:06','2010-05-30 15:30:06',0,6,1,1),
	(2,'2010-05-27 15:30:06','2010-05-27 15:30:09','2010-05-30 15:30:06',0,6,1,1),
	(3,'2010-05-27 15:30:10','2010-05-27 15:30:11','2010-05-30 15:30:10',0,6,1,1),
	(4,'2010-05-27 15:30:12','2010-05-27 15:30:12','2010-05-30 15:30:12',0,6,1,1);

/*!40000 ALTER TABLE `server_trip` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table server_trip_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_trip_locations`;

CREATE TABLE `server_trip_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trip_id` (`trip_id`,`location_id`),
  KEY `location_id_refs_id_261ec994` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

LOCK TABLES `server_trip_locations` WRITE;
/*!40000 ALTER TABLE `server_trip_locations` DISABLE KEYS */;
INSERT INTO `server_trip_locations` (`id`,`trip_id`,`location_id`)
VALUES
	(1,1,3),
	(2,1,4),
	(3,2,7),
	(4,2,8),
	(5,3,56),
	(6,3,57),
	(7,4,64),
	(8,4,65);

/*!40000 ALTER TABLE `server_trip_locations` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
