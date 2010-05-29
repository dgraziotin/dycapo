# Sequel Pro dump
# Version 2210
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: dycapo
# Generation Time: 2010-05-29 19:07:19 +0200
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
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table auth_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_message`;

CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_fbfc09f1` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



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
  KEY `auth_permission_e4470c6e` (`content_type_id`)
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
	(31,'Can add person',11,'add_person'),
	(32,'Can change person',11,'change_person'),
	(33,'Can delete person',11,'delete_person'),
	(34,'Can add prefs',12,'add_prefs'),
	(35,'Can change prefs',12,'change_prefs'),
	(36,'Can delete prefs',12,'delete_prefs'),
	(37,'Can add trip',13,'add_trip'),
	(38,'Can change trip',13,'change_trip'),
	(39,'Can delete trip',13,'delete_trip'),
	(40,'Can add participation',14,'add_participation'),
	(41,'Can change participation',14,'change_participation'),
	(42,'Can delete participation',14,'delete_participation'),
	(43,'Can perform XML-RPC to Dycapo',11,'can_xmlrpc'),
	(44,'Can register to the System using XML-RPC',11,'can_register');

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`,`username`,`first_name`,`last_name`,`email`,`password`,`is_staff`,`is_active`,`is_superuser`,`last_login`,`date_joined`)
VALUES
	(1,'admin','','','admin@admins.com','sha1$62b77$be8a6ccb057dc723181c5e76b101925ed46075cd',1,1,1,'2010-05-29 18:34:21','2010-05-29 18:32:43'),
	(2,'register','REGISTER','REGISTER','register@dycapo.org','sha1$64774$29b5552b08521768a07c02b737259c84fba3ca04',0,1,0,'2010-05-29 18:59:54','2010-05-29 18:44:19'),
	(11,'rider1','John','Doe','rider@riders.com','sha1$c809f$68b87f3d6f4cb3e4b8c4f6546d3bd76441a73d08',0,1,0,'2010-05-29 18:59:55','2010-05-29 18:50:33'),
	(10,'driver1','Pamela','Doe','driver@drivers.com','sha1$98aa6$f8223c98cba60a75acc42b85e5adbdd0043d89c0',0,1,0,'2010-05-29 18:59:55','2010-05-29 18:50:33'),
	(9,'blahhhh','','','blah@blah.com','sha1$ce267$18f571f248de40bfa1d1656b1235664881e10c00',0,1,0,'2010-05-29 18:50:33','2010-05-29 18:50:33'),
	(12,'dio','Ronald James','Padavona','dio@ronniejamesdio.com','sha1$a8552$cebd56c1f13e1f55ee35d044e35977afdb0e19b5',0,1,0,'2010-05-29 18:59:53','2010-05-29 18:50:33'),
	(13,'rob','Robert John Arthur','Halford','rob@judaspriest.com','sha1$49a5a$3628023f6385b9b525fae62f3aae8ac40189d9d9',0,1,0,'2010-05-29 18:59:53','2010-05-29 18:50:33'),
	(14,'ozzy','John Michael','Osbourne','ozzy@acdcd.com','sha1$232ef$fe45ed6c8104da2467d3c72aec5371a21bb61910',0,1,0,'2010-05-29 18:59:53','2010-05-29 18:50:33'),
	(15,'angela','Angela','Gossow','angela@archenemy.com','sha1$6ffd8$3a33188d2599dbd80f3246ac57f49d8b15badc40',0,1,0,'2010-05-29 18:59:53','2010-05-29 18:50:33');

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
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
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
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` (`id`,`user_id`,`permission_id`)
VALUES
	(1,2,44),
	(2,3,43),
	(3,4,43),
	(4,6,43),
	(5,7,43),
	(6,9,43),
	(7,10,43),
	(8,11,43),
	(17,12,43),
	(14,13,43),
	(19,14,43),
	(16,15,43);

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
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`,`action_time`,`user_id`,`content_type_id`,`object_id`,`object_repr`,`action_flag`,`change_message`)
VALUES
	(1,'2010-05-29 18:44:58',1,11,'2','register',1,''),
	(2,'2010-05-29 19:00:57',1,3,'13','rob',2,'Changed first_name and last_name.'),
	(3,'2010-05-29 19:01:29',1,11,'13','rob',2,'Changed age and gender.'),
	(4,'2010-05-29 19:01:59',1,3,'15','angela',2,'Changed first_name and last_name.'),
	(5,'2010-05-29 19:02:16',1,11,'15','angela',2,'Changed age, gender and smoker.'),
	(6,'2010-05-29 19:03:21',1,3,'12','dio',2,'Changed first_name and last_name.'),
	(7,'2010-05-29 19:03:56',1,3,'14','ozzy',2,'Changed first_name and last_name.'),
	(8,'2010-05-29 19:04:14',1,11,'14','ozzy',2,'Changed age, gender and smoker.');

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
	(11,'person','server','person'),
	(12,'prefs','server','prefs'),
	(13,'trip','server','trip'),
	(14,'participation','server','participation');

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
	('78e90bafa29b9500eea56d66ad9543f4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:45:23'),
	('ca3482847b10b1a566150ce1d5e11c93','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS43ODI2YTQ1Mjk4MWZmMmUy\nMzVmZDQ0ZWM3OGUxZGE1ZA==\n','2010-06-12 18:34:21'),
	('3c66a0cf9ac3beb7f86c1e041fcf44cb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:45:23'),
	('10503a2e79219658e20e8c2a20f3e78a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:45:23'),
	('0d2be4b07f1ef281ec1b7b482dfafcf6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:48:39'),
	('a3fb33abb1e74f9e45141c520bef2e76','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:48:39'),
	('30402eda77ec9d7f017ca96b65124027','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:48:39'),
	('4e34cea77d71591a52ae6854acda4dd2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:49:27'),
	('2970b54cc9ee842176ad95bcce38c9e2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:49:27'),
	('d072e98550fba6a2ffec3f371405fff0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:49:27'),
	('e8b97cb3cd7de1c71c9e391411d2f92e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:50:33'),
	('f958f04c6de12e90d71c12d51a6b4eba','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:50:33'),
	('c05b9c28a5920c5dd4d6b8403fe6ddbd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:50:33'),
	('b9798310cf93f77d5db4ed4d1f6bcd97','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:50:33'),
	('b797d929d4936e9a9f8a301a3e3f938a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:50:33'),
	('ef54dfc36c0fcd82fd9233efaa57f98f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:50:33'),
	('ee087d5eae9398dbbdd3a867b6486b8d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:50:34'),
	('f2c41e55fe0d699d28d2f8d7f34da374','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:51:17'),
	('0fab403d945bba744d7a6ac232afb52b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:51:17'),
	('f089cc8ee1c684b16d26a81fdafce143','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:51:17'),
	('6b2ba41d24c8a1b8cd634909e8170343','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:51:17'),
	('b966edae157cd2ea019d6258db18e4bc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:51:17'),
	('a8a7fc932b38c9ffdf4f0e348df0bd66','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:51:17'),
	('3d16c2000e70e4f80f3314b94ebf735f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:51:17'),
	('8e28306b6d86e800cf889153a4ea3b6c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:52:26'),
	('71162f378e5336fbebf38d2b578f4973','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:52:26'),
	('f057ffbe52064ec29926ebb2b34f3059','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:52:26'),
	('3b19de6821f570d6f3bf0f3ea554be64','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:52:26'),
	('4caaf2f8c4ee15be761231271dc5ce31','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:52:26'),
	('223c3ef0a8d8ab004e67446190ade59d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:52:26'),
	('fc2fd39433a4ac11dbe3b6335136c742','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:52:26'),
	('89bff9983b1fe6f1cc9bbba0598a3364','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:54:38'),
	('3f34f0aa3f41d884903ca6a36b75d2e8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:54:38'),
	('ef3ae1ade35782640a9ce85c8145a96d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:54:38'),
	('a1a135736511f6f35e6b1c40970c2ddb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:54:38'),
	('381526b86f22bb2d45a43a338aea3def','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:54:38'),
	('45b1a21d593025fec663626b1a8241c9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:54:38'),
	('fec925cf9d4f3d3294768fa6d9ef1b83','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:54:38'),
	('0020ea2d9ca97535361901768309e35b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:58:09'),
	('d37cbfe91afd1c0c57624a1553288f95','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:58:09'),
	('7a05ae3a7782e0a7bbe53515d8cc9de7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:58:09'),
	('883a056576f77f7bf3f11b72132c3d14','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:58:09'),
	('18b5cdd60e6f382fbd0bce2393aa4c2b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:58:09'),
	('76e743b00f4800ae181cc973b097e758','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:58:09'),
	('f7b4c5e5321d5b4d18d11c08366fd5f9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:58:09'),
	('2798378fa43aa5201b487a62f62dc92d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:58:09'),
	('c593604297c82c1089548ed1d0f36301','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:07'),
	('c747bdaac6092bb4b0c19b24d9c6964d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:07'),
	('e1190f6d8d1a9f24c8088ba793c36adc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:07'),
	('d9380bec76ba511fe81663f6a7563507','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:07'),
	('fb28c584ed496cf2d4101bd64a0da56a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:07'),
	('cd7361e4a118a6a38a44c99924469c47','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:07'),
	('781f7ea0cf7439e452e8a4aab047f855','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:07'),
	('cdce6a6aeb49a52449d94f827cf5f17a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:34'),
	('e56637997d6216707341d69c183756a1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:34'),
	('ae8c47f7c94f21d536ebe05219e50ca8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:35'),
	('ed9197ff65fe925d9fa0fe90152fd5d1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:35'),
	('1cf98462bf854c6d2efc2b33d0586775','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:35'),
	('46f1396266a5801c4fcd35dfc00b3ae1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:35'),
	('48255073b7deb15261a8268a7132558d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:35'),
	('bd9bdea9deafbd466ca2a497259756d0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:35'),
	('957c18ce760ffb4e1d1573f4387e1281','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:47'),
	('02679e99862433e58a3a1764d4e5904e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:47'),
	('a9a9df7b180c31ddba236b9a7d5cdf3d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:47'),
	('83051ebea5942af015414ab06222163c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:47'),
	('bae4a9d3dba9039842013b9ccd6b2716','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:47'),
	('6c8bf86ef5e9a266eac28457a55ad665','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:47'),
	('378b37d9f0946961819061739aedbd7a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:47'),
	('26445befa03315fd4c13e11db546f9d6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('3e95e9ee239957dd2595b3d93154b4d9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('f4aaeb95161b5793d0028894abc6ffb0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('777036c37422a3bd39bb1c4a6d72a2c5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('e00191170db6188d9184b4e258f8d9f1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:48'),
	('e05e548db1f98d765aa07667b50ca1fe','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:48'),
	('035f9dea93e1e45dcb9738e9d05db674','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('94648d7e762bc55295fb859a994dcc4c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('4464bb4bc0051e8081e9bf1bcdab893c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:48'),
	('8963b7dce2ccbf89389dc3735f287b6e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('2b2f6055a6f5b4f46c3137533bdd0912','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:48'),
	('df1ea934e35fbaa627fa50ac7b094e22','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('ea07d36e338e1c4319d9088257df35da','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:48'),
	('b697aec8d1be418b6c7564ac8ad192fa','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('6047dfa75cfa8056bb1526a21e4742bd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:48'),
	('925e969143f43ed68c58a58df867fb27','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('efa2dc2aa5f8495560751e241084255c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:48'),
	('b6eabca2aa07c0fca555c94c62a04e88','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:48'),
	('293cdc22b0fe309ba0dbfae4d8e64d61','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('0eb5110572747148dab570d149fa016d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('8a1d9a29847b4cf27ef3a0777afba11d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('57936eb9fcd61ef5f4550fd2b0e7f41f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('76f6966f55eda8958e9ed9eb4b04e0d0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('c61ee4cc80217237934d38245ad578b6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('41932c2067931b0b4f576093a93555f7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('1fd56db06a59d85d7de269a7bed4a4ad','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('8e1c3a771e6d6135dcdb2dc07b8bc54c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('e52e55fad0343d678cc215bbd1813829','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('927428949d2565433ba22638406bd01f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('6046bac449c8998e61e9f081f93789d5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('4d90f573aa6e207244544ee67210bfcd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('f69094a2856890af2d6d50b48d28e054','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('f4a8f0476fbaf1799e79021bf770ef17','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('efde9c8298146d138f11def87d0c188a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('f8e7ce9abe0a49945faa1191960ea7d8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('6c9f6e05fd0089766da18439216861fb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('565fc9c140b36c51c7217d08e2a5a9c5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:49'),
	('b750b282f160a8c4d81cd2fab5e55829','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:49'),
	('de1e1a9e56b9332bdca3b67f8356b1f7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:50'),
	('999fd3dcd57d03e2af873075c6f117cd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('242fffd7de54659efc425314dec675af','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:50'),
	('addfbbbf3c3c1b5c560a3a5cf26cfdb4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('e0bf954a4a9a1c8863ca8fd84c58c0b8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:50'),
	('341cf11ce70c4d7abb4144bf8ad72e35','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('9afe2187144f067ba6240fe7dbc63559','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:50'),
	('8c9eab8b8bff98ec389bb460179fece0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('bc290ac5ad7b8281018190dfc0754e43','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:50'),
	('50efc2704a3da3956506a58df051e89c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('a789f3ce849b51d557ddbcfa691a8d6a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:50'),
	('4a5a17b4e72752d167cac577b534b472','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('2d3c8f9beb13cab990a73df1c09b494c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:50'),
	('89fd4dfe4bd8803afac9b0d296cc936c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('f33a3060876609e691d64be0ab46f61b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:50'),
	('b110f6bb52fd01a5d5a55be49fded27a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('a9c63c21708a9f3c0617caec3b41b351','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('4f7d9313e79b02305902bd759015270c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('aa11090e819ec1a527a9bb6a38282164','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('6419f1042333ce86efbd1afe21a6e436','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('e318d3b3b42fa0a9bd778f41c44efdd5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:50'),
	('402cc84eb22e6bf8490b40a6d355763c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('1a17c89ea54a2f35a2fc0ddbf3661b53','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('3723e4ee910d752dcbcc676b21e66aa2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('a2751af04e4327d62c03d694aba5a184','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('7c66d4af74c6a1376dd9221d7092e036','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('9f49016c9123fda4d0556e9ed145d454','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('a076b3b27f59aed1025919da19677b7a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('6e11b5d5a2179bd9aa276ddb9a727851','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('d6589d4225e675d57a3e6e07de1dd928','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('22b927fa36155b24053bcf157ec774e6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('d9ef203cefc0de567583bf92775e2dd9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('fd5afd4682a54551e9e27487ef14f129','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('bdd96e8209400d521c387319b7419695','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('90f2b76ff914238291a2a317e4ace56b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('8632db9f362d077eda86e51ce801c1d4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('77b339db34263ac3cb2e322414647c81','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:51'),
	('9c5a460b418ea8f912ad77644a7d0757','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('8b887d2ea42598a5c12b02d231c9c5f7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('86c808ef961c7b72acd1262a5ce231c3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:51'),
	('38d0f1a9704f4203a5a777549d411f54','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:51'),
	('76ed892c43a32cacdd83bdb3027580b5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:51'),
	('8b374aa5981e8d2a20b95dee68c0af1a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigENdS43NTQ0OGMwMWU1Mjg0NmEx\nMGU4NGYwMmQxYzZkMGEzYg==\n','2010-06-12 18:59:51'),
	('860f20d65f72581807da16586f3fe424','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigENdS43NTQ0OGMwMWU1Mjg0NmEx\nMGU4NGYwMmQxYzZkMGEzYg==\n','2010-06-12 18:59:52'),
	('bd7adf04ad8c0b8c70535f93e824adfd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEMdS4xYTFlYWMyNDcxZjdhYjI2\nNWI2ZjZhZTllYWYyYzk1Mw==\n','2010-06-12 18:59:52'),
	('849eb4a4f1445e7d76dbd6f280de5cca','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEMdS4xYTFlYWMyNDcxZjdhYjI2\nNWI2ZjZhZTllYWYyYzk1Mw==\n','2010-06-12 18:59:52'),
	('db4d379c6ee346c614bdf462d74f6d39','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEPdS4zZTVhYmEzN2M1ZGU2YjBk\nZjM5MTdkM2ZkYzRlNGZkNA==\n','2010-06-12 18:59:52'),
	('59d86a3eacf84f062ebc580fc526c8b5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEPdS4zZTVhYmEzN2M1ZGU2YjBk\nZjM5MTdkM2ZkYzRlNGZkNA==\n','2010-06-12 18:59:52'),
	('3855374a01ff2210e90dd3115b8cd93c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEOdS43MjQ5MThiYTM4MTFjM2Fi\nY2Y4NzVhNWJlYThjOTVlOQ==\n','2010-06-12 18:59:52'),
	('c34544a731363c647966430c08ee1236','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEOdS43MjQ5MThiYTM4MTFjM2Fi\nY2Y4NzVhNWJlYThjOTVlOQ==\n','2010-06-12 18:59:52'),
	('0a2a34e53e27838bb27862a77908faae','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:52'),
	('7d1d677f7d2dd09403f388e98629bb6a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigENdS43NTQ0OGMwMWU1Mjg0NmEx\nMGU4NGYwMmQxYzZkMGEzYg==\n','2010-06-12 18:59:52'),
	('a3fb7b0a3a3a3189af309d3ac5336154','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEMdS4xYTFlYWMyNDcxZjdhYjI2\nNWI2ZjZhZTllYWYyYzk1Mw==\n','2010-06-12 18:59:52'),
	('cdad50f4c1df56c1ed357c7971367093','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEPdS4zZTVhYmEzN2M1ZGU2YjBk\nZjM5MTdkM2ZkYzRlNGZkNA==\n','2010-06-12 18:59:52'),
	('e30bcfa05a095161cc9d53050919f592','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEOdS43MjQ5MThiYTM4MTFjM2Fi\nY2Y4NzVhNWJlYThjOTVlOQ==\n','2010-06-12 18:59:52'),
	('5d9aa1d90d89e7350055e05fbf7c7908','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:52'),
	('87e6b937ac0004eb096bc919c5aeda17','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigENdS43NTQ0OGMwMWU1Mjg0NmEx\nMGU4NGYwMmQxYzZkMGEzYg==\n','2010-06-12 18:59:52'),
	('ea29ea977f5f928468eb5c853e5c206a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEMdS4xYTFlYWMyNDcxZjdhYjI2\nNWI2ZjZhZTllYWYyYzk1Mw==\n','2010-06-12 18:59:52'),
	('279a94b930cd94720163768985505f94','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEPdS4zZTVhYmEzN2M1ZGU2YjBk\nZjM5MTdkM2ZkYzRlNGZkNA==\n','2010-06-12 18:59:52'),
	('fa1e9ca50b88a1777fb5aa2ae8643848','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEOdS43MjQ5MThiYTM4MTFjM2Fi\nY2Y4NzVhNWJlYThjOTVlOQ==\n','2010-06-12 18:59:52'),
	('63c4a930400e3ef99c6e0229c28c58a0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:52'),
	('c91aaecb7e4872fc45459e2454524da6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigENdS43NTQ0OGMwMWU1Mjg0NmEx\nMGU4NGYwMmQxYzZkMGEzYg==\n','2010-06-12 18:59:52'),
	('61b3c27c18766ea535a7bd39bef50991','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:52'),
	('c85e01c99a5f8cffb166ed546a8e98d1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:52'),
	('adca2b3de73125e9072aab78a069c2e4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigENdS43NTQ0OGMwMWU1Mjg0NmEx\nMGU4NGYwMmQxYzZkMGEzYg==\n','2010-06-12 18:59:52'),
	('0e9fd39777a39a8c2be80ccb7063d3f5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEMdS4xYTFlYWMyNDcxZjdhYjI2\nNWI2ZjZhZTllYWYyYzk1Mw==\n','2010-06-12 18:59:52'),
	('a5732ef46a891066907674a25a380b4f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEPdS4zZTVhYmEzN2M1ZGU2YjBk\nZjM5MTdkM2ZkYzRlNGZkNA==\n','2010-06-12 18:59:52'),
	('1fd6ed23eca3bc3a5c63a4d0acfb9a80','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEOdS43MjQ5MThiYTM4MTFjM2Fi\nY2Y4NzVhNWJlYThjOTVlOQ==\n','2010-06-12 18:59:53'),
	('8faeddf3b0d32e22f0bb64a111709ba8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:53'),
	('092b9b0e5b923c494585ded36f5adae8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:53'),
	('6a75eaffdd5947db98be3df72b4963d8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:53'),
	('ab9dd2eeeca51778614b0757faebf181','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:53'),
	('5fdf814aeab2de35e2ef5ef98dbc38c2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:53'),
	('34054218f0847db928c5f171951e7584','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:53'),
	('ae4197b7debc16af6f9d0c2b0b6f8165','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:53'),
	('a4d235b2b3a6694a3451fdf174cf9de7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:53'),
	('d47990db74b001bd42953f78f9e78036','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigENdS43NTQ0OGMwMWU1Mjg0NmEx\nMGU4NGYwMmQxYzZkMGEzYg==\n','2010-06-12 18:59:53'),
	('fa20f1fbb374836cf2c355acfbe872f6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEMdS4xYTFlYWMyNDcxZjdhYjI2\nNWI2ZjZhZTllYWYyYzk1Mw==\n','2010-06-12 18:59:53'),
	('17c3aff20dd789584439a4e2e3bb6963','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEPdS4zZTVhYmEzN2M1ZGU2YjBk\nZjM5MTdkM2ZkYzRlNGZkNA==\n','2010-06-12 18:59:53'),
	('21293b82cfbe66850225c0508f884e20','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEOdS43MjQ5MThiYTM4MTFjM2Fi\nY2Y4NzVhNWJlYThjOTVlOQ==\n','2010-06-12 18:59:53'),
	('e1bb89ded92bb85e247e1a0f0ba50afc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:53'),
	('aab9aeb80210601eb6657747798153ba','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEOdS43MjQ5MThiYTM4MTFjM2Fi\nY2Y4NzVhNWJlYThjOTVlOQ==\n','2010-06-12 18:59:53'),
	('284c19bbd2d6682e8cb44d4187013053','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:53'),
	('706aa76ce710c15e384fef146992d78e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigENdS43NTQ0OGMwMWU1Mjg0NmEx\nMGU4NGYwMmQxYzZkMGEzYg==\n','2010-06-12 18:59:53'),
	('815bd5ab299b2d7d9a4aebe8db65387c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEMdS4xYTFlYWMyNDcxZjdhYjI2\nNWI2ZjZhZTllYWYyYzk1Mw==\n','2010-06-12 18:59:53'),
	('41a51adc12ad5debd5b96968f1e175e8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEPdS4zZTVhYmEzN2M1ZGU2YjBk\nZjM5MTdkM2ZkYzRlNGZkNA==\n','2010-06-12 18:59:53'),
	('5aee9df9692430ddb6c3c8860c6cde5c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEOdS43MjQ5MThiYTM4MTFjM2Fi\nY2Y4NzVhNWJlYThjOTVlOQ==\n','2010-06-12 18:59:53'),
	('63cc1875c32c7bf6befd3045480ef3a6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:53'),
	('b33ca34b13e78d7083f7009ce5677cb2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:53'),
	('5c50f353495ccc53e1d0366ea0940c64','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('7a891bc189d322ce6d7d1cc8b3735b7c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:54'),
	('a97a7a9d354a252f3e469c425b550b81','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:54'),
	('4cae7576d62f0206feb3e38d68e06547','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:54'),
	('ee802e50ff20f33a94734fb45d5829e5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:54'),
	('a7625beef1f10288f24d9f16a0735328','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:54'),
	('f9a5da7a67f67976d609690ff237f5a2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:54'),
	('d91bf3346e9f3dbe1cb2614b615acf58','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:54'),
	('754a1634de123daf96976b33cbbf33ac','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-06-12 18:59:54'),
	('6fb84536688db6b34de284d250eeebb6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('4bad898bface72ee097417e62b79ce7d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('785db1e2098eed7112db2ac6276c8127','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('d75027f1f3ec1ade803f1092c73d2378','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('87532e946684d2a126ed523ed6513789','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('4da19e57f9a4f260e93984ca52f313cd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('beb79fded16ac9a5b9253df0714df65a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:54'),
	('02b6e13088cd70f4dfc089c2732b854a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:54'),
	('ec5e07bcbeaff8602baf98e59756123f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('6008e618a322b6e43319047f2895cbd1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('b98f06397f67b7735ffa5f2470ea37d2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:54'),
	('0130a1bef9c8ded13e305fe7df02e7d3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:54'),
	('61b2b19ab19b1e6ffad4c0a331c08c93','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('5a594ab9300cbd672f48e2c0e5fb852a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:54'),
	('e53f448763efd3fc2135ba5d1b056f20','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:54'),
	('3768f7105cae5188b987189e4facda34','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:55'),
	('2d29ba2008612811c5b5caf6fc31ff1f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:55'),
	('6735044ba2e4696a175b378cf0094481','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:55'),
	('b6235818cc5744d39b513a3cd117c9cd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:55'),
	('15c9a95628107e0d3885bd2b70c58231','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:55'),
	('20411adb366cd7f14d28375b35e92eeb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:55'),
	('bc701ac93bcc149ba67a39e1a1f69bd5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigELdS5jMjM4NjUyYjM1N2ViMzUz\nNDYyOGEyODM4NGU3NDdhNA==\n','2010-06-12 18:59:55'),
	('cbaa55513c12d104458ca11db25b5a8a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEKdS4wYjQwYzBjMDIwNzYyYWU4\nNGEwZjI5M2Y5NTk1MjVhOQ==\n','2010-06-12 18:59:55');

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
  KEY `server_mode_21b911c5` (`person_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



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
  KEY `server_participation_21b911c5` (`person_id`),
  KEY `server_participation_ab5488a7` (`trip_id`),
  KEY `server_participation_6d876e44` (`requested_position_id`),
  KEY `server_participation_f0424aca` (`accepted_position_id`),
  KEY `server_participation_624bc54d` (`started_position_id`),
  KEY `server_participation_9edd96f9` (`finished_position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



# Dump of table server_participation_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_participation_locations`;

CREATE TABLE `server_participation_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participation_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `participation_id` (`participation_id`,`location_id`),
  KEY `server_participation_locations_3c980c0e` (`participation_id`),
  KEY `server_participation_locations_319d859` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;



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
  KEY `server_person_80180135` (`position_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `server_person` WRITE;
/*!40000 ALTER TABLE `server_person` DISABLE KEYS */;
INSERT INTO `server_person` (`user_ptr_id`,`uri`,`phone`,`position_id`,`age`,`gender`,`smoker`,`blind`,`deaf`,`dog`)
VALUES
	(2,'http://dycapo.org','REGISTER',NULL,99,'F',0,0,0,0),
	(10,'','123456',NULL,29,'M',0,0,0,0),
	(9,'','12345',NULL,31,'F',0,0,0,0),
	(11,'','1234567',NULL,0,'M',0,0,0,0),
	(12,'','12345678',NULL,68,'M',0,0,0,0),
	(13,'','123456789',NULL,59,'M',0,0,0,0),
	(14,'','1234567890',NULL,62,'M',1,0,0,0),
	(15,'','12345678901',NULL,35,'F',1,0,0,0);

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
  KEY `server_person_locations_21b911c5` (`person_id`),
  KEY `server_person_locations_319d859` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;



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
  KEY `server_trip_cc846901` (`author_id`),
  KEY `server_trip_66b6026f` (`mode_id`),
  KEY `server_trip_18f7c5f3` (`prefs_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



# Dump of table server_trip_locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_trip_locations`;

CREATE TABLE `server_trip_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trip_id` (`trip_id`,`location_id`),
  KEY `server_trip_locations_ab5488a7` (`trip_id`),
  KEY `server_trip_locations_319d859` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;






/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
