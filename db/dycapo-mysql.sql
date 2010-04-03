# USE THIS DUMP TO TEST DYCAPO WITH MYSQL
# Sequel Pro dump
# Version 1630
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: dycapo
# Generation Time: 2010-03-18 16:14:25 +0100
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
	(1,'admin','','','admin@admins.com','sha1$71a04$7446e1fae5a9b7e9e16d6c37d29abbc0f92c9970',1,1,1,'2010-03-18 08:10:54','2010-03-18 08:10:37'),
	(2,'rider1','John','Rider','rider@riders.com','sha1$a6660$2e2f222a983d0b03bac70a62db48883578681c2c',0,1,0,'2010-03-18 08:11:09','2010-03-18 08:11:09'),
	(3,'driver1','Pamela','Driver','','sha1$f8857$6ba0b6324ebff0f87cdf58ddfd325886307c4156',0,1,0,'2010-03-18 08:11:54','2010-03-18 08:11:54');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` (`id`,`user_id`,`permission_id`)
VALUES
	(1,2,31),
	(2,3,31);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`,`action_time`,`user_id`,`content_type_id`,`object_id`,`object_repr`,`action_flag`,`change_message`)
VALUES
	(1,'2010-03-18 08:11:54',1,10,'2','rider1',1,''),
	(2,'2010-03-18 08:12:26',1,10,'3','driver1',1,'');

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
	('1f8a1fff75b14eedbe5a3cf2a0714c09','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUsZHljYXBvLmF1dGhfYmFja2VuZHMuRHljYXBv\nUmVtb3RlVXNlckJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS43ODI2YTQ1Mjk4MWZmMmUy\nMzVmZDQ0ZWM3OGUxZGE1ZA==\n','2010-04-01 08:10:54');

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
  `intersection` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `georss_point` varchar(255) NOT NULL,
  `georss_point_latitude` double DEFAULT NULL,
  `georss_point_longitude` double DEFAULT NULL,
  `georss_radius` int(10) unsigned DEFAULT NULL,
  `georss_box` varchar(255) NOT NULL,
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
  `accepted` tinyint(1) NOT NULL,
  `accepted_timestamp` datetime DEFAULT NULL,
  `started` tinyint(1) NOT NULL,
  `started_timestamp` datetime DEFAULT NULL,
  `finished` tinyint(1) NOT NULL,
  `finished_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `server_participation_person_id` (`person_id`),
  KEY `server_participation_trip_id` (`trip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table server_person
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_person`;

CREATE TABLE `server_person` (
  `user_ptr_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `alias` varchar(200) NOT NULL,
  `userid` varchar(200) NOT NULL,
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
INSERT INTO `server_person` (`user_ptr_id`,`name`,`alias`,`userid`,`uri`,`phone`,`position_id`,`age`,`gender`,`smoker`,`blind`,`deaf`,`dog`)
VALUES
	(2,'John Rider','','rider1','','123123123',NULL,34,'M',1,0,0,0),
	(3,'Pamela Driver','','driver1','','234324234',NULL,24,'F',0,0,0,0);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table server_trip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `server_trip`;

CREATE TABLE `server_trip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `published` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `expires` datetime NOT NULL,
  `content` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `author_id` int(11) NOT NULL,
  `mode_id` int(11) NOT NULL,
  `prefs_id` int(11) NOT NULL,
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
