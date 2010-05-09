# Sequel Pro dump
# Version 2210
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: dycapo
# Generation Time: 2010-05-08 18:18:56 +0200
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`,`username`,`first_name`,`last_name`,`email`,`password`,`is_staff`,`is_active`,`is_superuser`,`last_login`,`date_joined`)
VALUES
	(1,'admin','','','admin@admins.com','sha1$de73b$20d52a554a8564deaca930d34754c472cc71685e',1,1,1,'2010-04-28 03:05:57','2010-04-09 04:00:06'),
	(2,'driver1','John','Driver','driver1@drivers.com','sha1$a62af$db4bc3984f81c872bb66adaba5337bf969217c30',0,1,0,'2010-04-30 04:50:34','2010-04-09 04:00:51'),
	(3,'rider1','Lorena','Rider','rider1@riders.com','sha1$3688c$31af2df5aebe9937101b61ca780615547fd0fdb3',0,1,0,'2010-04-30 02:38:05','2010-04-09 04:01:49'),
	(4,'luca','Luca','De Gasperi','luca.degasperi@gmail.com','sha1$5bf7c$9a97497ca16109ca17e9a75b741a6fa41ea5798a',0,1,0,'2010-04-30 02:38:05','2010-04-28 03:06:34'),
	(5,'paola','Paola','Sandreini','paola.sandreini@hotmail.com','sha1$3bbd5$1624316af78b68c0e3589b0012654385aad27f7d',0,1,0,'2010-04-30 02:38:05','2010-04-28 03:08:24'),
	(6,'andrea','Andrea','Ercolini','andrea@ercolini.net','sha1$a74bc$2997f4f7c4814c56fc456ec335ed51807b252a3c',0,1,0,'2010-04-30 02:38:05','2010-04-28 03:09:09'),
	(7,'serena','Serena','Rossi','rossi.s@yahoo.com','sha1$8b91b$4177c7f476932aa8b1b809e6f1c58524c0e84dfc',0,1,0,'2010-04-30 02:38:05','2010-04-28 03:09:42');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` (`id`,`user_id`,`permission_id`)
VALUES
	(1,2,31),
	(3,3,31),
	(9,4,31),
	(10,5,31),
	(6,6,31),
	(7,7,31);

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`,`action_time`,`user_id`,`content_type_id`,`object_id`,`object_repr`,`action_flag`,`change_message`)
VALUES
	(1,'2010-04-09 04:01:49',1,10,'2','driver1',1,''),
	(2,'2010-04-09 04:02:59',1,10,'3','rider1',1,''),
	(3,'2010-04-09 04:04:43',1,10,'3','rider1',2,'Changed password.'),
	(4,'2010-04-28 03:08:24',1,10,'4','Luca',1,''),
	(5,'2010-04-28 03:09:09',1,10,'5','Paola',1,''),
	(6,'2010-04-28 03:09:42',1,10,'6','andrea',1,''),
	(7,'2010-04-28 03:10:26',1,10,'7','serena',1,''),
	(8,'2010-04-28 03:11:01',1,3,'4','Luca',2,'Changed password.'),
	(9,'2010-04-28 03:11:13',1,3,'4','luca',2,'Changed username.'),
	(10,'2010-04-28 03:11:22',1,3,'5','paola',2,'Changed username.');

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
	('23e1dac4abb58ce07b6489af1bce1ef6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-01 08:39:01'),
	('d32d099413898c8426403a8c97b2cca7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:07:16'),
	('d1db9db8a9342bf98701d36d75922696','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:07:16'),
	('7f4dec191ac9f96968e9dadb99d96f0b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:08:21'),
	('065fc8910e6d4eeb155e467fba922a48','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:08:22'),
	('0684aa8fc9c448c15523ea96a3a22593','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:09:38'),
	('5488c9667f3af10bf26afe071cc8104c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:09:39'),
	('d09e8e80b33a89a2c25273184096b7c0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:09:41'),
	('97e04daf29fa770379dee5ea5da41a8c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:34:57'),
	('778ab3138c76df4bbd8827cc0088f778','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:34:58'),
	('baa1902ac139e41fa9851628c3f86f0d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:35:16'),
	('360a8fc0cb8bc59414a8fa5a5086830b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:36:16'),
	('5fd8cdcf5e12ea692d7bb4147833b311','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:37:09'),
	('c61e89ad9d369f577a6b70546b5e7c61','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-06 07:37:34'),
	('1494e00dae9cef206a80c5f0b7ec42e0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS43ODI2YTQ1Mjk4MWZmMmUy\nMzVmZDQ0ZWM3OGUxZGE1ZA==\n','2010-05-12 03:05:58'),
	('3959f489c5b0de8969547d1f089203a7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:32:38'),
	('6e3a9e4d8754de61f45f4b97bd0e0768','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:32:39'),
	('320141bee98821dccfab9962781df322','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:32:50'),
	('7e9328036ecdd4d996778e749d7e9cc5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:32:50'),
	('bb938f385ef0cf8b8869657a232715a5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:32:51'),
	('9ec6c9c97dcf5b269f819077146d6208','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:11'),
	('68d2b491ff3c024b6d598faf946aa1f8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:11'),
	('54850ee0050bbc3b3abae2454b782cf1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:11'),
	('85d489a9feb4598d70876c04196eb1f9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:11'),
	('2be702f80e04fd0f7e520422edbf79d5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:12'),
	('c8a04e082a676a4c66e093b760aef4e7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:28'),
	('6344141c12b9ce7d98974d002365714b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:29'),
	('467e512463c83e634a97f97d8dd1345e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:29'),
	('6ab7ae6178cbbf0cebd698926c079cac','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:29'),
	('58f2b0d7fd1c0bd906fa7dfe36b36a20','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:29'),
	('a080c5f89429055f033ee2bacb50e6f8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:31'),
	('64725168b45509ef0d03638a8d35a9ee','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:31'),
	('dbe5b8546a634252df187838b1ef9796','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:31'),
	('403fc38fb468a50f7030cf42ad742c51','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:31'),
	('5e333a786f656f2147ac6912087c3a6a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:31'),
	('5161dca9e60905e4d8dc530087b4f078','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:50'),
	('0d55a78a88d980519398e69e7a9d79a2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:50'),
	('be9dcda22da4310a6fb25b20228230ad','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:50'),
	('9ded5ee04c1bf3e1052c57d444dee806','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:50'),
	('fb303fa6812e41810bc83bea96098da1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:33:50'),
	('fd35ce72a8b022cdadc54dcb81b23856','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:08'),
	('32f708072b4819bec14d5028a9c84a7c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:08'),
	('7be9215a05ebb7ceb32a1c90ebfcb043','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:08'),
	('4e8778cf74eed1d2410c877973471116','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:08'),
	('b05b8de12e364ebcc4433bb5ae9213c8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:08'),
	('d845b96a079af6f3c9873c7391582131','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:22'),
	('2a70b3e48633105cec43321301a6301e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:22'),
	('68289e60c6ca5d1cbd82055b22356010','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:23'),
	('92364e6ef2cd1125f5f05355635794ad','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:23'),
	('f26faa0b6208608d606938dd17b82e89','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:23'),
	('8cfeffa0031011847ddb475f85e420bf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:39'),
	('180645774a34826f7d8f75a51dac4ff2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:39'),
	('eee6d19d699c4ef8a89346cde8e9783a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:39'),
	('59fef326ee81cedfd5677185122e3bb7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:39'),
	('9eb6a0dcb881c036c89c274b5c094bfe','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:39'),
	('32c7835c3eb9fd7628e2204b929ad2af','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:53'),
	('3e036d33b488fba774683f2d7e7363b1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:53'),
	('dd0ccd17214a857e002c3d82963a9095','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:53'),
	('2229e36d3d0735f12ba3fe9b84e11ced','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:53'),
	('13e8b3db89468c80d352e70f6e5ea55a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:53'),
	('2dab6d905fd9aa66f1c4ae5d749b583f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:34:54'),
	('47d9fa3da6e276e22ba4a84ef9e134f1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:35:16'),
	('9ed6c923040a085bb873e26cb6d1a349','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:35:17'),
	('a1cadc9a71ed7145038215c34471bcb7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 07:35:34'),
	('4d1e9ab55b4e4212ef4b0a87aee90932','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 08:55:54'),
	('b13eea3b978b4ea2782604aa780f2d83','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 08:55:54'),
	('730bbdfdbb05275ef516a5d88b3c2a74','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:00:36'),
	('017477e49b77a2a086fdf1b583e418e0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:00:37'),
	('b8e31b6c40274644919bae81a7dd30d3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:00:55'),
	('023525bbf53abc6e0d11c4d396268107','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:00:55'),
	('37d7fff41af37f1937e5703c30c1d7bd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:00:55'),
	('268d3e203503579ca80d9c73d5bbfb51','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:14'),
	('e2087dd3a35ef74c7928e4481019c5a3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:14'),
	('afe8260c56f69d6eddde1f36d8570fd0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:15'),
	('a90520ffb26abde2a1e8b4aca5428139','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:15'),
	('81ee3f425d59e10f8b4720a91ee3350c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:16'),
	('d671dbeb591362708820afea7f965f0b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:32'),
	('1c3a6cf729e6c11adea900b8e9f99db8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:32'),
	('68a180556e21b70977a15c83232b35d8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:33'),
	('4dbde198d0c94809bb3df0c360a90e9e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:33'),
	('777e08c83e2e2ead1cb5494577369007','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:33'),
	('fd257f4b5ab27f016648f8dab0a5cbad','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:37'),
	('858eed6786a129cde585af76ebbd8073','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:37'),
	('18eb6ccebbc9fe6b0e47d80e4031ffae','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:37'),
	('bdb49eb9a8ce99538bc0be7343bc76c6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:37'),
	('bccbb30ad3bd9e57b837836f98cfd4c5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:37'),
	('9d364c4805910559e4cc7daa6d1f0aa6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:42'),
	('552dd5a26806e6ea4af56440f590153e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:42'),
	('a3b89100317bf2f2e1b36442e417202a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:42'),
	('2e06585be0952d2292a053d4b2f63684','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:42'),
	('c09181881eef4c50c7f9fe66f32f7ae3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:01:43'),
	('ebbb13cec8bbb3235d86551a51e854bb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:00'),
	('afd68e40303598bdd667c2e7ed291601','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:00'),
	('c08ad3b7f2218db4d35a808480b9fc7c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:00'),
	('999f9b0ec0d87ab34b03a8040849bed9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:00'),
	('be50312035eb51a58244f50fe23a684c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:00'),
	('4f44a47b7eb22cc3c451376648f86076','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:02'),
	('19a7a7ed7a037a8bd99b1bc7adaa30ae','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:02'),
	('a058f7254ef44b13f8568b64b0be2ce9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:02'),
	('e2b8c2775609c6931e8ecaf16aa24904','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:02'),
	('bf9d2a419ccd068b7a7b5168aaba35d2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:02'),
	('010b2d527214d3a83984de1e40d9c5ce','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:10'),
	('0a90adabcc67d7c99a581355cd893a9f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:10'),
	('7d6c139a98ee8915e9f8db744c98da82','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:11'),
	('d3f8adf490e07e9dbabeba7078f5fba1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:11'),
	('846e695ee04c0033ad8638a4e6e0c7f5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:11'),
	('ea9c3f99b87bc41e44349a91d6936fe4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:22'),
	('3dfc8f5db2c70d2bf6ac4c58499c4678','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:22'),
	('2b25e2179ceef957e2d53a56b67faed7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:22'),
	('a80e99dbdb6c1849454e8fc47a2b872e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:22'),
	('977e394850a2c94fb0a1456c9234fdaf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:22'),
	('8dfde1c09ec82ddcc3a1c0ad95a1abba','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-13 09:02:22'),
	('35f2d4749c8d17d9fe68f65b0f3418e4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:20:58'),
	('2084d4cb69f9cc837d04c767e9ea816a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEEdS4xYjNkMGFkM2EwOWU1NDRi\nNGVlNjc3N2Y4YWY4MzRkMg==\n','2010-05-14 01:20:59'),
	('e5babe30bdeabefb4c86b0d6fdc29934','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-05-14 01:21:00'),
	('07096ba8a9157e13e15215d7e10615f8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEHdS43MjUyNTE5OWRkM2VhOTg1\nYWUwODg1MjAxZjBkOTkxNw==\n','2010-05-14 01:21:00'),
	('6ccccaabfd99474a4112cd442ad23979','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-05-14 01:21:01'),
	('f42b3142a5199cff7aa9edf871c5cc6a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-05-14 01:21:02'),
	('1a843f7bd2e78ead67d2f36329f85534','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:21:02'),
	('2ec3bd005bfa57a5339e914074d24b27','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:10'),
	('30a6a853afb50235ac9478cc57d35f69','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:10'),
	('8e33b52104a4807f5909be2db3112715','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:17'),
	('e36c6b77273fbfadfd7d0353e3c63816','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:17'),
	('d6ce53d27a662d191bbbd813c88ab27e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:17'),
	('becb182749c285018ddc661b37df0326','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:36'),
	('03e75a243c36cb17054df6fcd6ec0274','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:36'),
	('0e90bb7ca062ef9f15b2d87606667f76','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:36'),
	('8f2453493cf218bf86d5b75f47182fce','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:36'),
	('9e2347942c0f8f9b721a567ad84ea849','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:36'),
	('e315160b7064c24db92d65a7e239964e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:51'),
	('cae65862d4fe96c31d25ed0624675091','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:51'),
	('e14d19d5467423b40c2e2e3eb58608e8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:51'),
	('cf2cd1148f4359631b1e04baa1ba61dd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:51'),
	('4006348ef5f96afbf3af2895ae0c9b74','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:29:51'),
	('93c891b2c162c37f2192b8597a28f9f0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:00'),
	('dac44ba3fa07a8b14659a93ea8b0592e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:01'),
	('2052d79eb47afade772ad003d50cfb49','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:01'),
	('51c63659d45324ff0ee635f2bf2d6af4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:01'),
	('64922641142568fedc584e0783eff8a2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:01'),
	('a6527e1ea06313d6b0d6c1acd780592d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:16'),
	('636573576d7539d6238c249d0f98fec7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:16'),
	('f2ab3bf6d3c0ca0a831a7bb93e3f4837','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:16'),
	('3b8380cbd6dd2b5cac0dc0d7c2c0c75e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:16'),
	('b1a0b7dd85b3b9c5daa05a9414c1c329','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:16'),
	('b766ca5bc9203b30741665d49353235e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:34'),
	('c2ab9de17a1a4efce8c97c74b32d3362','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:34'),
	('8ac9ffc28da7f4f292d49aad97136c15','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:34'),
	('f0d91efbc207d60b99ae5a9d010260f7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:35'),
	('e33047cefde3b0d957947479c8cb8db2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:35'),
	('6243c1a99f8f2f81100bd4e0f53c3082','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:36'),
	('062f8cb69184f00d0e88489aab125b0b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:36'),
	('0012c1eb44e61b944dcdd08f17e15b32','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:36'),
	('efdf9dec489651722c26a07758396ad4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:36'),
	('107ca17eca78ff93b2eb1fc0f0248f2d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:36'),
	('4c9259b369ccedc213bebb86bb3e96c2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:37'),
	('1c2c5ec44dc77a71e0d9d85a3bac7205','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:38'),
	('0333b8bd46ecbdc05aa38a6d9e5db235','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:38'),
	('c043d8fc2c7764c5daacdfbbebbc9b32','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:38'),
	('97a1f4526998f3e95149131325d43515','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:39'),
	('7cacfe27854d2dad7ede350a7bd4bff0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:42'),
	('9ea2ac47b99ad9e08f38e667a802c65b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:42'),
	('199d07854a935e820761c0bf1be440bf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:42'),
	('d47e2e0a5576671b983321d96a9009bb','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:42'),
	('142e3925f6c7309f21247e8f880ebbf8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:42'),
	('06c2c6a12872016997a54f4d32350738','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 01:30:42'),
	('07a856a5f12f46ac9fa9f9eb4d2d8e35','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 02:38:05'),
	('4cb59b5407ed06d34f128c6b966c081d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEEdS4xYjNkMGFkM2EwOWU1NDRi\nNGVlNjc3N2Y4YWY4MzRkMg==\n','2010-05-14 02:38:05'),
	('52550c9526de3d2cdce1c5b9c7be7787','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEFdS41MTY3MmY0OGE4OTNmYzM0\nMWIyZTEzMTFmYTRkODdhYQ==\n','2010-05-14 02:38:05'),
	('f3d622c271e130ed2b49c8bad6a1fb75','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEHdS43MjUyNTE5OWRkM2VhOTg1\nYWUwODg1MjAxZjBkOTkxNw==\n','2010-05-14 02:38:05'),
	('dbee95ac513b07152721e362e9988df9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEGdS5hMDBiYTFmMWJiNWVjYmUy\nYzk0M2M3NGYxOTMzNzA3Ng==\n','2010-05-14 02:38:05'),
	('f4cad8cd5d4ab7a3411110c7b8350053','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEDdS4wZDE4NWEwMzhkYjI4NDIy\nYTlmNDdiNjQ5YmIxMjBjZg==\n','2010-05-14 02:38:06'),
	('2a4078a0865407d36a411ba7dcd494a2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 02:38:06'),
	('bca63210fecd1c30bd8f8de1cf729e0d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:29'),
	('61042755d51193e0a967588b247a5e92','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:29'),
	('9228996f0fd0305c15dfe1d347721b62','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:33'),
	('f61d891737debb8f3ba2f76b1105f793','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:33'),
	('5c347a3cab8da26ee8fb8d0a4ac2fbc0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:33'),
	('57bf921b428d8505295daa2913f9e575','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:37'),
	('4649078f8311be518e823d79d2b727fc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:37'),
	('3ccd46e227d2a84d8e0ad9558eb3c368','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:37'),
	('9f96af8ceec06650dc451b92a65daaa8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:37'),
	('1d23448dbdb2370258d0f91dbfd15947','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:37'),
	('b88e57d910b1e4d7667f7d956bbc2ed5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:40'),
	('10952ad5966369ceb1a5e49118fefb5c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:40'),
	('d6eaa4404bc53f0223d9a22b342b4050','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:40'),
	('caa1803a20709967d688b98fd7ad7f94','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:40'),
	('3c5ec5dbe28480ec36356d47ae2e7856','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:40'),
	('bcb8dc00d86916d536c35ed458896bb3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:43'),
	('df116a31690a9b638d9aef27be4bd7d8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:43'),
	('17ff2249dc06e974f44a1f32e288999f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:44'),
	('cb263d379b29921624385f4127950355','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:44'),
	('8a930de8d85133eb064bbb4bea6f8358','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:19:44'),
	('c70fb6a1cb826d963799b398c2bbfc8f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:02'),
	('9d99baf6a652452d439be9a6f9613f04','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:02'),
	('67dcbab4d1c8432238130b276cc47b56','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:02'),
	('c162a91c38f625676c9079d128bd6278','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:02'),
	('a4ae4210c4bcc86f6263df039dbae38f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:02'),
	('e353738722370e75b02041ef84758c2b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:17'),
	('1c177c503a1595652b7e45d8f470a6ac','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:17'),
	('e8106df1c2de32c9c262741499a681a2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:17'),
	('367ae1cf393dfa694473f1a1d276d398','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:17'),
	('a440d3a3f32a57b6c16e6a2bfa7d3afa','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:17'),
	('80521e0a1738ec497287fea565ca91e2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:28'),
	('06c74d023f46d8d8e9c20968ca402adc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:28'),
	('aa63d5913a118d5d44eb846364e40fb7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:28'),
	('950466b14c137f0bcfac84d907c3ffe9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:28'),
	('b4ca770219596c6b0abeeb4595d3a314','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:28'),
	('eb0d0e4749aa6f19fcd685afd809a0f0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:36'),
	('dcb949129c23f7428433fef029783e79','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:36'),
	('a4651d48bc4ae9c0dcf5e45e1a511132','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:37'),
	('5e07f3d7d33b3247fd38791c25ef8a8e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:37'),
	('5f3ffc822b2b850f78551338cf940665','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:37'),
	('4a6b81062992999835ac3640689130a5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:38'),
	('670568df554411e2aa9d32f35584fd0a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:38'),
	('e146498af72338510524766d2a6c8777','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:39'),
	('f0c4c75ae0b89cc1ed0a3cebdfb6f5fc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:39'),
	('2817b6cb3c02c3fa6e0d5b7ab2e3de16','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:39'),
	('33d2e636dbcafce1726d3417f0cd5300','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:20:39'),
	('ec9a1287b9cbca9b6d2c85be7e5e55df','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:13'),
	('b58563cbd4290a82a0bf735c25ef31de','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:14'),
	('c47976ae1f69895ed7f01bcc3a7328d8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:16'),
	('2b2a4a33641099016fc0ea20819202a8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:16'),
	('bc60ffb7c384e380fe2ed4786d5d043e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:16'),
	('5f9ba0be5d389131880a379c174ba5b5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:31'),
	('529f1bcc9ed4002562f56e48ccc9d271','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:31'),
	('806297e88e9cfdeee5f9d91aba9e3703','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:31'),
	('5ab44fffa4ea419360a7b0906695a7b2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:31'),
	('4a98fb0cfa806e211c3f707fe68e77ca','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:31'),
	('fc666078c2b2ea4d31a6e0a688913508','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:35'),
	('3f550780d92b973b7fb48d3d81dd1b8c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:35'),
	('830250138999a980afccd05d7f40ebc1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:35'),
	('f739cc00bf5828af4dd57d218c022a24','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:35'),
	('4c706f0cdbad2c29a3bc3a50706e1481','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:35'),
	('e9fc288bbf5dd65ded73e55f5012cee2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:42'),
	('8d089b5ed3ceb0df28dcd83b324a34cf','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:42'),
	('431daf3454a91e56faba87d746ae54d4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:42'),
	('323cf236a143d04e53b5f5a97b50bdf4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:42'),
	('cbc4e389eb567ad6672f64589e84f6dd','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:42'),
	('f17e58954ec464066a9b0c3673782086','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:50'),
	('27fa4eed9292a094e6e2cfcc6d744f4f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:50'),
	('c8106ce789be4e220e288387020decb0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:51'),
	('d79645abe1c2f40c58748eb706825909','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:51'),
	('b60ce51ab8e13b8b82afed85c8d4a0b4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:51'),
	('0cb84b44530b8e8e9827c3d490ec43a6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:55'),
	('dac3d08e9c03ac838b41ef5b6f1208da','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:55'),
	('7635f668b614a569301f812e88ef1112','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:55'),
	('fd440d379ac4cb1418dd766ecc851718','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:55'),
	('77715387233ff89b2085f86251208335','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:55'),
	('f4533faa2e650202e4aa2c14134876a0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:57'),
	('1881e4b4b60b10c863111261b36320e9','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:57'),
	('02c070e6d52526dbec726bb18ba59e12','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:57'),
	('4638779c51019768dd0d42017f8b054a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:57'),
	('a4142a866afb1f7e8d88faf8bb29377c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:25:58'),
	('0fd389bf7ef8e8d365ea046bbc34ba74','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:07'),
	('228a5bb5e6eed5428a3178c8295eb477','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:07'),
	('4420c66f319fc9e76eae71493ca4834e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:07'),
	('8a05ce61b7322c92840ca4623cc1e39a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:07'),
	('e46fe4cebaff5e6337838d2ff5a3884e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:07'),
	('0bca759db670ea573536f97625a2c5e2','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:08'),
	('58c3db44b299feeb2b742cfcd0f6f167','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:08'),
	('fb0fd1be60f6172bd70d59c62467ccd3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:08'),
	('e4d214936d864881eaf92a311246fa5e','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:09'),
	('fdcad9ff830eeb458cda8cca5c536698','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:26:09'),
	('b074032f2ed9e1192264f16f96097b5c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:12'),
	('50e8ab9d445cebc64ca5b411533ef8c1','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:12'),
	('327d231358a9052d97596da8e0651049','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:16'),
	('1399d1daf562cba882eab14b277b368b','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:16'),
	('8d5eafc2b02812fac2b9ebd356daa31d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:16'),
	('113d7b1080f1b4d7873d90d3e3730c4d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:33'),
	('2d6c0363430b9906561a1cd1d45c6f64','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:33'),
	('42e3790e64fc6aeca4db48a06e42685d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:33'),
	('34a61f388f9b3bcb13d6f75557e213a0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:34'),
	('b7401c71a8ed79a61ed372628899e39f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:34'),
	('115e6c536955820f1fb7d73ad70808d4','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:44'),
	('9f05f212c966335e73c1e792b807ed16','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:44'),
	('188f50a06bf28bcbb6cdfe73a56f62d0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:44'),
	('75458ba7c1a9dec125cef8b0d08c9d35','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:44'),
	('8abcf31f1d83c3547b12b0878cdec2d6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:44'),
	('a92436a4377879f93d386b87b6a43bce','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:48'),
	('5a696480c3e4c0c96ee857db87fa0ed6','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:48'),
	('835959cccef686a3d92a685d037d049d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:48'),
	('36b8eae5aa1c2724698d0c5aaed34491','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:48'),
	('ffcc27d4b516b3327cb8db05742e4b1c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:48'),
	('f253bf675e810e58109c0c028f0fcfc5','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:54'),
	('f9bf24026874442ffe3179bb2c1e44ed','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:54'),
	('7b6fb0cc788aec104ac9200019be0057','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:54'),
	('11ff9afb1032473c48f507365e9b19f8','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:54'),
	('1b3c08385aec73c24e0a34c40e1bd49a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:54'),
	('75b710ce8f905922e28c438c6231bab3','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:59'),
	('50be0734680291a2bc571486a0799c06','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:59'),
	('30875e3dd216441cd277f03485d99277','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:59'),
	('d9b3f6eb9840389cbc9f6efe8763a30d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:59'),
	('9388b45617c54985c8f7adc838eaec0c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:31:59'),
	('1434406de9e4f7a6a4a4321ae61f9f0a','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:14'),
	('99763626fe9f2af3bd42c55560bf23a7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:14'),
	('ee218faa42ba1a51c2e1bc51661a9dc7','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:15'),
	('2e399b9e20beee481048e36cae765071','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:15'),
	('701c26c5ba5dc5256a5bf62c1f37a869','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:15'),
	('d3716fb159f41e4225628f1549304d73','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:22'),
	('e8653c23fe8593f4b8cf2ca3beed7afc','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:22'),
	('2bf0a8d4ec4032b555d570c533da649f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:22'),
	('3f2b9e1e198256ac832bdb34a5ab0c72','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:22'),
	('6db945f82921f96e8362ef36d8d50e03','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:22'),
	('5387301d54b616f4739d72ca04f84370','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:24'),
	('6b5a0309991498437e3e71fdb0f33240','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:24'),
	('2a26c01ddb333df511964d72726a45f0','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:25'),
	('8538341335f293ed72e89d64c183621f','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:25'),
	('688fd16a411678513155105dceb0c27d','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:32:25'),
	('90eade474f1561f55c4faac545af862c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:50:29'),
	('62b7be6054fe51164712ebe29106d995','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigECdS4xOWJhYTUwOWQ0ODU3MDhk\nYTY0NDZjOTNlNzVhZGMxMQ==\n','2010-05-14 04:50:34');

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table server_mode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_mode`;

CREATE TABLE `server_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(255) NOT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `vacancy` int(10) unsigned DEFAULT NULL,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int(10) unsigned DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `lic` varchar(255) NOT NULL,
  `cost` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
	(2,'http://john.drivers.com','555-5924-594',NULL,29,'M',1,0,0,0),
	(3,'http://lorena.riders.com','44593-21349-3443',NULL,26,'F',0,0,0,0),
	(4,'','23394320492',NULL,23,'M',0,0,0,0),
	(5,'','239839024890283',NULL,18,'F',0,0,0,0),
	(6,'','23489238',NULL,45,'M',1,0,0,0),
	(7,'','44494939423',NULL,32,'F',0,0,0,1);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;






/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
