# Sequel Pro dump
# Version 1630
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: dycapo
# Generation Time: 2010-04-17 19:01:19 +0200
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

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
	(28,'Can add person',10,'add_person'),
	(29,'Can change person',10,'change_person'),
	(30,'Can delete person',10,'delete_person'),
	(31,'Can perform XML-RPC to Dycapo',10,'can_xmlrpc'),
	(32,'Can add mode',11,'add_mode'),
	(33,'Can change mode',11,'change_mode'),
	(34,'Can delete mode',11,'delete_mode'),
	(35,'Can add prefs',12,'add_prefs'),
	(36,'Can change prefs',12,'change_prefs'),
	(37,'Can delete prefs',12,'delete_prefs'),
	(38,'Can add trip',13,'add_trip'),
	(39,'Can change trip',13,'change_trip'),
	(40,'Can delete trip',13,'delete_trip'),
	(41,'Can add participation',14,'add_participation'),
	(42,'Can change participation',14,'change_participation'),
	(43,'Can delete participation',14,'delete_participation');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`,`username`,`first_name`,`last_name`,`email`,`password`,`is_staff`,`is_active`,`is_superuser`,`last_login`,`date_joined`)
VALUES
	(1,'admin','','','admin@admins.com','sha1$de73b$20d52a554a8564deaca930d34754c472cc71685e',1,1,1,'2010-04-13 04:34:25','2010-04-09 04:00:06'),
	(2,'driver1','John','Driver','driver1@drivers.com','sha1$a62af$db4bc3984f81c872bb66adaba5337bf969217c30',0,1,0,'2010-04-17 08:39:01','2010-04-09 04:00:51'),
	(3,'rider1','Lorena','Rider','rider1@riders.com','sha1$3688c$31af2df5aebe9937101b61ca780615547fd0fdb3',0,1,0,'2010-04-15 07:45:02','2010-04-09 04:01:49');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` (`id`,`user_id`,`permission_id`)
VALUES
	(1,2,31),
	(3,3,31);

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
	(1,'2010-04-09 04:01:49',1,10,'2','driver1',1,''),
	(2,'2010-04-09 04:02:59',1,10,'3','rider1',1,''),
	(3,'2010-04-09 04:04:43',1,10,'3','rider1',2,'Changed password.');

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
	(10,'person','server','person'),
	(11,'mode','server','mode'),
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
	('6f14f8720c052519975e8a4ce39d8099','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-23 04:07:37'),
	('2b927c566019711b5cc09f5c2c1c1670','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS43ODI2YTQ1Mjk4MWZmMmUy\nMzVmZDQ0ZWM3OGUxZGE1ZA==\n','2010-04-23 04:00:20'),
	('8c55c2fa222a90c261af81d4156da3af','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-23 04:07:44'),
	('f1fc61997d63fb24c7da6f2a7d15fb1f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-23 04:07:47'),
	('4745724f33e3fe2078b4a36f4a5ff416','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-23 04:07:51'),
	('83dca9e17a47eef6e9ed88f2467fcce4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-23 04:07:54'),
	('cd95c8f734e424a74b5ba3b721050bcc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-23 04:07:57'),
	('8b2268ab7032d39efab11c2a439d7131','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-23 04:07:58'),
	('35aa3b0bb2225f58201aca67d8ea670c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-23 04:08:00'),
	('323dbcd70aac7ae9cb13d2b78708f561','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-23 04:08:00'),
	('2f1544d41455d2cd17e45849d765c912','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-23 04:08:00'),
	('072fb30afc5e6cead8e9092aa1e5723f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:25:20'),
	('a91fad0e569c25a347bd152ba96bf0c3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:25:27'),
	('c0eebd9a206685511d07301c5e92f8bd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:25:32'),
	('a640d5ddd35a660e403e685be3cdbc4b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:25:37'),
	('d0cca088c17a07d129c7ed206b4f1db6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:25:42'),
	('9474853892b1b133a0d9cd2ff5021c7a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:25:55'),
	('a2dcff0044033b18d4d7ba35d21183f9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:25:58'),
	('8c3242d33fde5cbdbc50df30c735a02a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:27:32'),
	('fd13642ada7d1217d67fc8e32ff02a05','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:27:46'),
	('2e083dbb90918a90ce878199148037ae','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:28:00'),
	('77d3d55e29b2c5a34fdd132d2e5f382a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:28:15'),
	('819c1e9145f892686734c0617c5f05a7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:28:31'),
	('aa2c434c47cb742a87f37d1c53ae73f0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:28:35'),
	('e95c618d3a3cf71b21152f4e1d0347d6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:28:54'),
	('c837c274a19a3b762cee30962875ebd7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:29:40'),
	('d90288ae8d3434e8d582eb172b8a99d2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:29:47'),
	('ef69091d2f18dc7500679395ed249e88','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:29:54'),
	('2559ea116f5b9c575604652f914085b0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:30:06'),
	('f77716b7537382448d16122dfc5a957d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:30:09'),
	('780b0909a2eb0fa7a6944ac477f6f1df','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:30:19'),
	('21710b9cec8a0baff2986c445040b1d6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:30:20'),
	('98eec0f354e400bc5b7d2d03eee36643','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:36:37'),
	('562fa2b8de896e2e607994d670a9dab0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:36:39'),
	('bab88cf5b94c10f88c1eb377da13e83e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:36:45'),
	('463d61281a4f43cf54590a662d52b6fc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:36:52'),
	('b38faf5790850870f6dcfe5635bba523','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:37:02'),
	('c156622b732cf3e578141d88a2d95fe1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:37:10'),
	('737aabb42c1d80892ac7704517b5ba8f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:37:14'),
	('d282bdbe66dd67ae6d9ab0a166bd9e43','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:37:24'),
	('7b2cc4b3a3ae4c4d8682d851ddaa26d5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:39:02'),
	('5253badfce904298ba4d92adb7d93790','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:39:18'),
	('009c7a458a5f5da0533cbd0f1ad34161','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:39:19'),
	('0889ae347ea58813052bd88ae0e4ebbc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:39:19'),
	('9e91751a9a7e3b7eef52d661871ce18d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:39:20'),
	('eec7790d376e76310269b9d38936a2d4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:39:21'),
	('f39aabe02c1a06151ba2e567a81cf918','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:39:21'),
	('fa6549d60d9aca81133eae7f4df73d63','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:39:22'),
	('a9eb8d644b001df7978e1980a3584072','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:46:36'),
	('bbaf472bd19885c3a5bafec4bf4381ac','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:46:41'),
	('1d92d415920eac1b6fa8f283616d1917','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:46:44'),
	('680e8a7c488cfdcd3effbec05e004fac','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:46:51'),
	('44c6dc15d1f5aa89b2188e2eac63a643','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:46:53'),
	('9f3ad612406ff66cbc79d7b1e332c441','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:46:56'),
	('5e9c0ea5e56b1d9f69a6481c2c047629','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:46:58'),
	('82145aa5d57fb2b3d2db05761ef3ba04','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 03:46:58'),
	('dd1df93b25a30f7992bee2de319149c3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:47:10'),
	('7fabde37b779dcaf2b3aa81384ea2194','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:47:10'),
	('a9eb5bf29c166ead08b985496af2ebfd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 03:47:10'),
	('c9557613a912e696a9bca114cee01f74','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:08:49'),
	('08da8380fdd304ed58decab201894c9d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:09:04'),
	('09f550ea8e044d477b6cf40c24f2eb7f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:09:12'),
	('3f0150fa7457473579f5dab488afb054','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:25:13'),
	('854a5e3a7a98d8c249a53493f164369c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:25:26'),
	('374065ca68f83650034f0580207547ce','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:25:35'),
	('eb1301db9028041cdd376e196e6b7036','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:26:38'),
	('077ab7d5d86fb08c67026510bb715e19','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:26:52'),
	('511407a8c50b1f4c9d4fbbeb8a064e2e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:27:04'),
	('7f28c7c625ecf45a9fb7b2d855c8a9fd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:31:36'),
	('8666a25a07459dbd8d17eb13e6c44205','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:31:42'),
	('5bfc1265a2b624fbf1bf2745953dbbd7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:31:51'),
	('4dd60800e24497a1f6b38b1b04cac56d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:32:44'),
	('8b0d6618feac0bb59ced14bd1f8f78f5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:32:57'),
	('9391127989d401fe71f03b66ed2641c0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:33:01'),
	('4a17ddc9769c0123d98e3cdfed2a5dc7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:33:53'),
	('076839433da15f618432791f9f6383c0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:02'),
	('fe1b568ba4f945fe54c6febbec834241','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:08'),
	('f1956b2de7004979e891f68bfaec9e98','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:08'),
	('861f86d4673bc1e3ea3f0848607e5605','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:13'),
	('d35c627542793e2a67b8703d2eacf124','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:13'),
	('f68a749b7ce53d189b366f98236885a6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:22'),
	('5e115137db6096fdab659c00bef875f8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:22'),
	('2e25d1125cb1721e8b18ccf7f0bedfcf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS43ODI2YTQ1Mjk4MWZmMmUy\nMzVmZDQ0ZWM3OGUxZGE1ZA==\n','2010-04-27 04:34:25'),
	('c5320b0dac53f395072bd6ab090dfa11','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:30'),
	('d4eadf0fbaacee49bfc92052cfaacc29','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:32'),
	('82b79cdc63f5ad1282df94111b3e43ce','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:48'),
	('06d24e8c2550e7b767f1c2458c469e2f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:48'),
	('67edf0c9b67a492179dfdf9f27c6e27d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:51'),
	('1b23120d9fd44873a2867e567c8106ad','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:34:51'),
	('222a3448f5f2ded5614ac353f656a973','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:35:09'),
	('11a8e20b3a6169775d2b6001b29c433c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:35:09'),
	('ad0b7838b1b77a4afe3b3318287c4700','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:35:10'),
	('c8606276f53de799dcc7dcd0ae935976','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:35:10'),
	('7c4a126a7313f6cf8021a5f93b226eb5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:35:10'),
	('e380271cd75d4deca7c1f2b81c9fff2d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:35:20'),
	('c7cab2005889a8067f2e6978a3013ee7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:35:37'),
	('54505ab22f8447320db94309b68ee452','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:35:56'),
	('e3cbae477da19c786a334b05f03500a1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:35:56'),
	('109c106c6ff2d2039b236f81f0981f8e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:01'),
	('acb640d0a5f28c3d9f404d29a831ec37','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:01'),
	('dc4924780dec8a5061d7b727d5b3e4da','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:05'),
	('8963f745eaebf9568d657451500e3b6b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:05'),
	('03441bfe8e9a4eed5d13ae5f4872406c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:20'),
	('aade4576d41f1fddba421e512c3981a7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:20'),
	('201ebb34aa5449259abb7a0f21bb993a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:37'),
	('fca015834620772317f9f0ee8c98f04c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:37'),
	('8426b394f631617418deaf9d0367d13b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:38'),
	('bc85fee435c263f08168c5c747294798','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:38'),
	('0932ee5563d8f9042306082e31639be4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:41'),
	('736098593c084ba799ea2245d642e7da','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:41'),
	('acb91b0a8615aab901c37e83a8f68de0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:57'),
	('cf4c1c4483cce0926da8517ede57abee','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:57'),
	('e067d211e94cb3149aacc8ff6e2e6aea','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:36:57'),
	('d262ebbe56f09b52f7af95ed6117e7a8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:37:13'),
	('6a9a7c967d29d3a40569db54b3a30716','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:37:17'),
	('7369c5cec0d521b6921c64a94abf4be7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:38:06'),
	('2476db5739f1a6e8edd694f30111670d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:38:13'),
	('b84d9335ffdd61efdfb98a213952f3e4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:38:47'),
	('35b7d2160ee15e9577ead9ef2d520bd9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:38:52'),
	('564a0bd025938ebf3720f7b4427442c2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:41:09'),
	('7ad02dd5412f288bbb3df3413b0d454a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:44:27'),
	('297e950d1630276c32863dbfd744acc6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:44:58'),
	('cde375a0c823b180014e68d4ce8012cc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:45:16'),
	('9039df4b9a712664a2c340b62994b48a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:46:07'),
	('9a6a5984e6949ec004a4b4ea7d0d1755','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:51:49'),
	('f50d4e899c5cf52ec63cca81cb8df3b7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:51:49'),
	('099079030cb68bcd58596a27f21200ff','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:52:06'),
	('9bcdd7aa1ae37c6e3b16a720f8f352b3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 04:52:06'),
	('828da1aa53f72ec9eb0888329089bc01','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:13:25'),
	('b0dd6013c811c1ef1efe0f868b0cc83e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:13:26'),
	('aff9b1f91e80341f82687d8f02680c2f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:13:30'),
	('34bdb999d9e01c77270e71425ff2b568','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:13:42'),
	('6e3596f32befc96efe85d3ec2088e7e4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:13:42'),
	('d50fc4979c4c5ca84ffe26cf6967f0ec','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:13:44'),
	('3aa0324239598abe57c8ca0f2e7f6ba2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:13:44'),
	('826b9ce30d9da3f5d357767744bafdbb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:13:45'),
	('4cea9b38436e18a94b965b319b2166c0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:13:45'),
	('d11c36c232dfa37293afd61f8eca4ac5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:13:45'),
	('70f094028cc974509f71e78fe6737622','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:16:02'),
	('b30b3262ea374e3d8383a0894b69f509','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:16:21'),
	('3b98e747f89249f9edba8d78cc45a312','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:16:21'),
	('4d6fbecd561c83f9792c54b0c6484a59','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:16:38'),
	('4a5aedd10f360c5092a6523a5a5424de','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:16:38'),
	('bbc7992dbdefa7a020268d2c58af3b63','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:16:42'),
	('5991c78be5cbc7dec1e7e425b8ce1c90','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:16:42'),
	('3059d82335e5ed0ff447c5de08beec9b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:17:01'),
	('eb2893f5fc0bbc493baccd43e9c7aa8d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:17:01'),
	('d0414870be1c655224f038715d4f9a2d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:17:08'),
	('aa8c1da47d227d86e729c02083a5469b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:17:08'),
	('336e703e30da1838a684af334dd186f4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:18:59'),
	('773ee483ffd2361ee0c70510b236f1d0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:07'),
	('2197455faf163f57bd3c72ccf539449b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:07'),
	('027eac577810c508fb20b3b3eb384127','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:24'),
	('6f15b033cf79d5303ba94f5bbe0ac6a3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:24'),
	('192740710fc47e5e813433eeec224c0a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:26'),
	('261061cd50db77cb849920e67455437c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:26'),
	('43961c0199c240cef58e7183a37e9dee','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:35'),
	('371e0c1fa20dea3c93cbdbb75446bbbb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:36'),
	('ca6d3966b82340c0f9f123eca05419d1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:41'),
	('e3b6d0f4d3389a76f062bf5ae8baf82f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:19:41'),
	('4cfa5516aeed6852401cbbbe9e6d2489','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:35:19'),
	('95bae452a9727885e406f4b50beafdfe','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:19'),
	('9d125d583bbebf0037d6f71020c1949b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:29'),
	('7c2feca846d60f33a0902c5348d0a8f4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:29'),
	('819a7f90f51713a37f562341dd930032','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:37'),
	('78530e6ec10f6108f69cffaa9f3b115e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:37'),
	('2f772c1b112fb2018e5ef26f962b7926','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:40'),
	('405479d34a351563cbe5e1f1e7bddef7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:40'),
	('4c5f4660829f2ea618b69828cbac05b8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:47'),
	('ed70bffa1ef824b7c71196f92489d07e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:47'),
	('b8dde79eec5565b635e9fdf635b623af','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:53'),
	('f73afb4c7ed312f56d4ea8905f64f5f9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:35:53'),
	('003d4105a17361369ad667929bee2e62','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:37:26'),
	('7a98b13e8eb9c7a0e72252b0ec3e9016','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:37:27'),
	('ca3d2d6c645e5748591be11e9b2af075','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:37:44'),
	('9a5667fb18a46a20d993443dab1d3d0d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:37:45'),
	('f3a39bab0efb0d5851dafc1b1a0ebcc1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:37:52'),
	('0a0bdbf6b7c599dcdefe126bf54da674','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:37:52'),
	('9420265bff7947abbd6a93226f8585b3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:38:11'),
	('237a3cf1967927539b232f22f14a6107','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:38:11'),
	('50fdcd57974e2db306e4744709aca96a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:38:12'),
	('71b234ef00a3dafbfc9bfb37da550ac4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:38:13'),
	('8801a198b853a1a8b579dd66ca0fbfe9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:38:24'),
	('6824aa04cfa57f5453ebf40e8060f5e5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:38:24'),
	('48a0f3debeff57a9c8c1ac1cf5cc1f24','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:38:44'),
	('2335c267448bd649891dbb46a8730d47','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:38:49'),
	('023b37560762893bcecffc26a416d6e8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:38:57'),
	('bb23cabbf78c145a75f0af527f497eb1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:38:57'),
	('8342e6637f51a333ef61f20e050ae440','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:39:11'),
	('d8a6edbab75a9dd45f92e8da5b105d6d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:39:11'),
	('8703579cafec956774dfdb576c47a3b7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:39:26'),
	('2223cf8371800a45363c45b45b548d60','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:39:26'),
	('239bd7a8372e83f8d71cfd6d3e185e4f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:39:36'),
	('bb30e17b4d9a8457fbb12b6fa5703cdf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:39:36'),
	('06f030aad7549564b8a8e4808fc03207','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:39:41'),
	('d986b6248813057b646901dabda8077b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:39:41'),
	('2bc7dcd6d0186ea725b3fae810db96d8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:18'),
	('48302fdc602730ce6ad2987a32d8fe24','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:40:21'),
	('08c1282ba90984883993a5f9eeb7e50b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:37'),
	('eadff59c96a9faf31e179af0adb114cb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:38'),
	('0a256ff9affe01bc1142dec41ebc0ac2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:40:39'),
	('43c140dfcaba091f2a4c5c0509e2d80c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:40'),
	('cb82c007b0e8ef84ef4dbac8d8b145d0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:40'),
	('8902b5244f0a8f9ca389e2d25324501a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:40'),
	('f1f875c17bffe0ac1945d52f4500151e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:43'),
	('2f7c94ac45d80e55967be601724fe0cf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:43'),
	('31a08ef99374d3ec707b158affde84cc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:40:46'),
	('a9bb958fb324f5109cf4a81d508c92fd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:47'),
	('96ab04d76fe29c209ec570f300367527','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:47'),
	('19a51f6de1cae30840f257a15bb6b911','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:47'),
	('316feb3dcdae1b190c345d093bad2022','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:47'),
	('436990d24dfda6b6c26cbcb3650e187f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:47'),
	('dba2c7fe11cc1300509857f55af86854','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-27 05:40:48'),
	('ff5ee2cd259073507d82ad0a0eb7a0fe','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:40:48'),
	('96deb52b77a4df1e3fee0ad74acdacec','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:40:48'),
	('02f42cf9b093abe696168b44d8110eab','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:40:49'),
	('70569d7ce1d1f02c33ea0bb752619526','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:40:50'),
	('5892ffa01af19abfb0e46010db922d18','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-27 05:40:51'),
	('4e25f2c6da0b38184100b9b9ade4fcec','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:10'),
	('e924d446c22bc6025f3280e93a584a2f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:05:15'),
	('d1e6d796d7c8235ecb0181001ca808f9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:05:21'),
	('27810de87b79c74bdf0d1bba1c318fef','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:28'),
	('cce34e2c32a5d7619477711eac5210ea','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:28'),
	('35b85a0f915c06d140731933bbbc7466','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:37'),
	('c9521e4a9dfe44b87ba6136cb2b14656','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:37'),
	('d6fd3c68362519f75c829a460167ebff','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:43'),
	('67689d41e89d72335e4f705b22e7ca2b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:43'),
	('a5b85788235d04406f79b7bdb00a505a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:48'),
	('79dcda86bec1f686dc1a61c17e830f01','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:48'),
	('eae78009ed70570f63f3cab143232772','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:57'),
	('0e928c4738ff00556093a58796c63bbe','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:05:58'),
	('67eb9f332be3570fe1f202fe87c34e7b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:13:52'),
	('2c89bd4d6dfb37b8b7ada066719de5de','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:13:53'),
	('067ded8c933a72a0fd34f73084be0a90','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:13:54'),
	('9c8ada5ce9bfbe62b3f5b2d8fefa86e0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:13:55'),
	('af9a28e88828fb82056876a4e2151e66','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:13:56'),
	('f2803f0b2646883dd12e79c80df51fd2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:14:08'),
	('cbee0b0b676c6ec163f3d13c8204f474','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:14:08'),
	('995d414ed2de19258be3ddefb8fe1aa2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:14:22'),
	('f96f0b313d43a734033271e04202c8bb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:14:22'),
	('d27415f6c879d6928b07c90053f52669','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:14:30'),
	('490aced907936583560914e2d33f75b5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:14:30'),
	('0465b384e7711d37917babb9f8389159','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:14:43'),
	('32a3ccf157ab3ad5efad28552b40a0eb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:14:43'),
	('f5e7a9a592b83097fb54e90dbaf2919c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:16:49'),
	('ca8dd6d2ec0bdd8d06c68ebe6c3e3535','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:16:59'),
	('abbe13d0c7207fb2d845dff196385806','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:17:18'),
	('babf3c67fd1f3d783faa72bbf004be86','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:17:21'),
	('8e13c34089bfbd395d5b046c13532d60','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:17:33'),
	('1b58a74a38d0e351d0e8dcde6c110c87','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:17:33'),
	('adba24a293541aef917da0f3a0992195','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:17:34'),
	('84e0e8e23cb3d4bcc648e8c2333a05f2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:17:52'),
	('ea22bfadcdb1815ae4319fb43a8f0d29','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:17:52'),
	('21d5fb3d3f8df84f303c774c2c663825','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 06:17:53'),
	('da5f4590eb074d315f45c3445fc78d82','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:17:53'),
	('d3f1f3455f97ddc4250ff94b8a500ffa','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:17:53'),
	('78942d653404bb0140b6b246245de782','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:17:54'),
	('04a706c972a66cd7dc504cebcc7f4c09','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 06:17:54'),
	('fd18c925de6c20fdda3eb4552c306e4f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:35:19'),
	('20ebba83d576d524a5f3982b2c7f7844','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:35:22'),
	('ae673a184e7d7d682bbbfa96f80c210f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:35:26'),
	('eb932561e953fec33de976552d76bc80','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:35:37'),
	('0c53c4b6b5babebbd72fab666d24c293','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:35:42'),
	('f6801149de29b332c0dbd33e82ff714d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:37:41'),
	('6e3726769e9207147f2180c5344aa6b0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:37:42'),
	('32657273cd03b64a26a9e39a52385ef1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:37:46'),
	('a16af99e8d3fa1f12e7c8e3d929fec02','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:37:46'),
	('914e4adfee1297208341219c19118f21','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:37:46'),
	('7c5aac232455e1b1fb21361ce515777f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:37:47'),
	('5d06c6fe85e676bcca72fb68eccebb47','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:37:58'),
	('e0b6c0cd5051371e56c9332dff165f13','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:37:58'),
	('40a2d82edbaeabb3513ae252b90256db','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:37:58'),
	('996d21301ad17ac048bc9da637211e51','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:37:58'),
	('98420a1c5b3abd02e9d69fa2b5cba206','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:37:59'),
	('14035c96424ee22e2b8dfc1a0f7823e8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:40:01'),
	('1e38670f0d33f302eb26e8a9692fe58a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:40:02'),
	('55f995e27503f58abaf99480b453bcab','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:40:10'),
	('d5cad5ce8e8da06da9da1d61cb8d82fe','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:40:10'),
	('aacdcfbc88037794c848b66177e0e6fc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:40:10'),
	('623b6b17d5a02d134d22489df3a45390','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:40:10'),
	('35db8ff6d039ed61fcbdef3c0947b040','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:40:15'),
	('ebf415b93e4e20025526ed25dedee7bf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:40:15'),
	('8b9794f47d53c566ad2dfec1063b92b6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:40:15'),
	('ccf684f50b4021c942f0ea5249b90e66','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:40:15'),
	('cc16009b37a1cdc7dd99897fa7040724','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:42:19'),
	('3c3c8ef510eeabc2a34ec4962b4afc13','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:42:19'),
	('548c625bacefd11640fbe0918124a0f7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:42:23'),
	('5e199a7821819910fac9c50f45690ff9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:42:23'),
	('27e9a960326a1f0ad90bf68c3b124514','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:42:32'),
	('b956ff0735dd9769b8a8ad1f942e752c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:42:40'),
	('b28f12db3e8f6d1551fee62a550c3251','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:42:40'),
	('77c091287493c5521f0137802f126b3f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:42:43'),
	('25b504348303dc9e265155edf75ef005','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:42:47'),
	('23ea84272681873b5c5b22149c577596','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:42:47'),
	('3911336384ce9942dc51d5c52c4ba162','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:42:47'),
	('6d0f60053b1029f7d5db779d7f4fa14d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:42:55'),
	('5518c810680d617788bb6d68af2b371e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:42:55'),
	('076e3947209365366573e1c90ba7306b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:42:56'),
	('334e1601002bb1294d7859b5e65eaf31','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:42:56'),
	('727b10f53994c6306a44430c12a7d546','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:44:29'),
	('d11e1d4e620927ffadf577bb2663f892','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:44:29'),
	('a8fc339deb518a7598dc94d0e0de4a62','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:44:40'),
	('2e348826e5b2687b4d44fbf672845928','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:44:42'),
	('761966e6b7275d8d0ed7a0cd332cfc9c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:44:43'),
	('11643854eea98da2a05732c3095089ef','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:44:52'),
	('64ef34106bf200fefc6686d1e2a5d6f0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:44:52'),
	('e2bfade1fca474f0f0c49be4be616dc2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:44:56'),
	('d3d426b56799f2cf4aefe843a9c71d38','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:44:56'),
	('7eb735cee62b843839f2105b10b5828d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:45:00'),
	('6ad85193d2e5153cb21a8138633d3e1f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:45:00'),
	('4aae7fbd113bb3186593a73235865e53','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:45:00'),
	('00fd90ea8d08acd7a41ab873d0fe60f3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:45:02'),
	('8fc4a9c8e2cd2060733c0555f64d67f7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:45:02'),
	('f9640d71a3014ef261472624d9b20407','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-04-29 07:45:02'),
	('b3151ce87e38b08f6c9fb0c2ed1b0295','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:45:04'),
	('f50d531cf8c4774807046c14ee547f4f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:45:04'),
	('eacc9a99aecbdf4db31d463b858b19ff','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:45:04'),
	('62cd8664dc4d6b6904cd31e728fad5f1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-04-29 07:45:05'),
	('3dbc9598e4ee57e21129edcd171f3caf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:22:58'),
	('4759cacd7e34a57416c23facc4c93385','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:22:59'),
	('d76ab5056cf8fb429d2769d93ef422e5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:08'),
	('0dc306b8514e2de0927b9f5d3c8727cb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:09'),
	('7ab43a0b7f21d77094e916f1ee815fe6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:09'),
	('21b6cf430d42523de18d932eebb0e532','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:10'),
	('92a49e28017ec2805ad634d580e326be','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:15'),
	('8463f81e219b1e7d78c8a0ba69f49a54','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:15'),
	('7749a25fd20567892cd74561f537a0b5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:16'),
	('f5901968059cb88f53d73ecaa725d62b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:33'),
	('6aa4b442b701283caa0cb78b53a59013','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:33'),
	('97d9a44c110c63ca36df2c3bd1cae50e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:33'),
	('aedb92680e9298d13ebfa1b25eb1b7fd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:35'),
	('2a6f5e9cdbee811af458b4e1cc52d78f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:35'),
	('5543a718068407cea06a9bbd0eba9f3a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:35'),
	('1c509cd102a8410bebb3e1c542ac7007','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:44'),
	('ab391331eb8b33a8a1ee98f349fb9f72','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:44'),
	('38a738fc182d6f0e7ea9869304934eaa','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:44'),
	('16b38615897ddede06f7b128a090f9c5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:47'),
	('e5701c5abc9eff9432ec24a3075d49de','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:48'),
	('bb958a233b9260ae78e8473e30d754af','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:23:48'),
	('4dcfe13864d88a2cae627d7105263ce5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:24:05'),
	('5d3d2733e1193d5396cd7fc8c631a63c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:24:05'),
	('252ba9eb0259a13ef8b4bf1c62354360','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:24:05'),
	('9d22a05ae6e4a756f55a3ef8a674cb7b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:24:20'),
	('37380f2438cd158c5527cad360565a3b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:24:20'),
	('91af6ef61ffc893ce9e3e2a1ff89a17f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:24:20'),
	('4e2dc75e39da2d6afa64867efc1bffea','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:24:20'),
	('e6a201841cefb917b2f14737900fbca4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:29:36'),
	('4e4ba372d2af32e63222926cbb041c98','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:29:36'),
	('de8a780971dcc59b024a7b5837a35947','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:29:51'),
	('0efbb1891c5283737420effd432eb231','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:07'),
	('7634e0ab052ebfd1542615f7fe060926','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:07'),
	('997fd3d206fbc73192600e8a1685b968','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:07'),
	('f6e2b7b0bae4965f13bda5b87cc8ad2e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:17'),
	('bb1ec672521e23ec0638bd095dd7f126','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:17'),
	('c63eae5c800169ac47aed66ee6a59b9d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:18'),
	('fc1cd091583c972e89d2aa756d6002f7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:24'),
	('b7eb1ded8d99799923d63bb71bd01f29','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:24'),
	('e0c061de5ef429777e2ee29daf737d80','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:24'),
	('8478424be568ef9b88d957ea81df128e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:25'),
	('922c94c90815cd7e7d8b25f08330e470','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:26'),
	('ff5eccfb5ef0625d773c8324151588e5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:26'),
	('8341962fa08fc4b12843b0e6acde364a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:36'),
	('e33f2986c86a42cc51cf57931498f0c5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:36'),
	('cd8473e569f79e17cceffd1cafe03315','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:36'),
	('34864062d0850beb519eb3532bcc34bd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:55'),
	('022d01e1ffc4643f12a3e1ee5f34a229','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:55'),
	('6bfb86396bf3e030bfeca1be3ea1068b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:30:55'),
	('a7587ce3b1a466300d1b0c5e2e2aa75d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:31:05'),
	('87fc9a734a6088447ebaf5b52eae3761','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:31:05'),
	('31908a9d2689748354a731239f86d942','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:31:05'),
	('d025a74aa2f72f26e4f3b947abd34c67','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:31:08'),
	('e072f73fcb111e164bf456dd68024b2f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:31:08'),
	('bba98e0659e601631d21c7bbcc8abf9a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:31:08'),
	('a088dc2120b69b7a0262c2c0f4c4b351','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:31:08'),
	('407ef8fa9f4dce560d05be090f1e2179','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:31:53'),
	('e69bbd66159faabd1c2135ffcc75a740','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:31:54'),
	('881223feb429c6a744c26410b0faecce','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:33:04'),
	('ccf9713331f598b3229804243077c40b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:33:05'),
	('f6f0f8325cb70fccdbd78a93263c4087','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:37:27'),
	('2b6ce713ef3612be9dff4e0c959234b9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:37:28'),
	('cff97f218a0dae80f60e05168031d1ce','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:37:36'),
	('8c2427a360098e431c82afd8bc32ccec','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:37:51'),
	('1d5956ee6778de888e5feab7d7c6d0b5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:37:51'),
	('608912c20b7d70e8d37ea6a5af89f771','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:37:51'),
	('e1094248988e2692ad68ed5c7ccc0d0a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:37:57'),
	('3af70038417390c0d9b7a27da45ec015','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:37:57'),
	('2d069b8b978c8f2f39a3c3e8c5c851f1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:37:57'),
	('996cb7a78a244e7b7b3fea8f9ba87a01','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:16'),
	('a729234bcd9db7396d42bbbd4b6e9429','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:16'),
	('94f0d8bf460e50c1b78ee92dd847571a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:16'),
	('42d1654b9dd22fc406231c0784ad98b4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:25'),
	('ceac5a6ac120554579d38091d2548091','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:25'),
	('9c97fa3180b83f8b25fd00f3c464766c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:26'),
	('91b664b95b6bca4803483b59a85b25fc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:34'),
	('f74c720ef8b49acec29b51b0c068a8b0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:34'),
	('850f2cdad28b243e386c45b1982198a4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:34'),
	('0fdb9c25585c6630f690003cdf4adc22','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:45'),
	('e13983bd69bdf850dfe2b6ab698baa3d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:45'),
	('44f72f48266786ed1bb5bb004c143bac','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:45'),
	('2ae73cfd6ccb10df82421b987d418723','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:58'),
	('b4a9204cf24cb60df51f0d2d72fd3f08','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:58'),
	('f908a0398845a36ba60621f8ff73279d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:58'),
	('60130b48f96dc1f8f090df776a333f51','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:38:59'),
	('87fa63cd57f4f96a44aa143ab8c62297','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:39:01'),
	('cf8d551819a7534d240a721caa29fcea','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:39:01'),
	('23e1dac4abb58ce07b6489af1bce1ef6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:39:01');

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
  `leaves` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table server_mode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_mode`;

CREATE TABLE `server_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(255) NOT NULL,
  `capacity` int(10) unsigned NOT NULL,
  `vacancy` int(10) unsigned NOT NULL,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int(10) unsigned NOT NULL,
  `color` varchar(255) NOT NULL,
  `lic` varchar(255) NOT NULL,
  `cost` double DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  KEY `server_participation_person_id` (`person_id`),
  KEY `server_participation_trip_id` (`trip_id`),
  KEY `server_participation_requested_position_id` (`requested_position_id`),
  KEY `server_participation_accepted_position_id` (`accepted_position_id`),
  KEY `server_participation_started_position_id` (`started_position_id`),
  KEY `server_participation_finished_position_id` (`finished_position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



# Dump of table server_person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_person`;

CREATE TABLE `server_person` (
  `user_ptr_id` int(11) NOT NULL,
  `uri` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `position_id` int(11) DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `gender` varchar(1) NOT NULL,
  `smoker` tinyint(1) NOT NULL,
  `blind` tinyint(1) NOT NULL,
  `deaf` tinyint(1) NOT NULL,
  `dog` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `server_person_position_id` (`position_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `server_person` WRITE;
/*!40000 ALTER TABLE `server_person` DISABLE KEYS */;
INSERT INTO `server_person` (`user_ptr_id`,`uri`,`phone`,`position_id`,`age`,`gender`,`smoker`,`blind`,`deaf`,`dog`)
VALUES
	(2,'http://john.drivers.com','555-5924-594',11,29,'M',1,0,0,0),
	(3,'http://lorena.riders.com','44593-21349-3443',0,26,'F',0,0,0,0);

/*!40000 ALTER TABLE `server_person` ENABLE KEYS */;
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



# Dump of table server_trip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_trip`;

CREATE TABLE `server_trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `expires` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `author_id` int(11) NOT NULL,
  `mode_id` int(11) NOT NULL,
  `prefs_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `server_trip_author_id` (`author_id`),
  KEY `server_trip_mode_id` (`mode_id`),
  KEY `server_trip_prefs_id` (`prefs_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;






/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
