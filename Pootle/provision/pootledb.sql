-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: pootledb
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_e8701ad4` (`user_id`),
  CONSTRAINT `account_emailaddres_user_id_5c85949e40d9a61d_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'admin@admin.com',1,1,4);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_6f1edeac` (`email_address_id`),
  CONSTRAINT `acc_email_address_id_5bcf9f503c32d4d8_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `unit_rows` smallint(6) NOT NULL,
  `rate` double NOT NULL,
  `review_rate` double NOT NULL,
  `hourly_rate` double NOT NULL,
  `score` double NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `is_employee` tinyint(1) NOT NULL,
  `twitter` varchar(15) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `bio` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'!un9tZr7hXggq169ZKQg2Bdo0XYKJGnTGTUOQTIDS','2015-12-04 20:07:33','nobody','','any anonymous user',1,0,'2015-12-04 20:07:33',9,0,0,0,0,NULL,0,NULL,NULL,NULL,NULL),(2,'!puoe46ydh8d9QqdEt5fa5dS9VRlvo4PFhHqU0j55','2015-12-04 20:07:33','default','','any authenticated user',1,0,'2015-12-04 20:07:33',9,0,0,0,0,NULL,0,NULL,NULL,NULL,NULL),(3,'!0OTeYWJlShtTDfPUzzvCBcePnxyMT48glIRhHav7','2015-12-04 20:07:33','system','','system user',1,0,'2015-12-04 20:07:33',9,0,0,0,0,NULL,0,NULL,NULL,NULL,NULL),(4,'pbkdf2_sha256$15000$cUL0dekfeJr5$3EmLYdK/b3xTBSnjeaFNZmNh6+JthN6iMqrWXSk0NgM=','2015-12-04 20:27:37','admin','admin@admin.com','',1,1,'2015-12-04 20:09:56',9,0,0,0,0,NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_alt_src_langs`
--

DROP TABLE IF EXISTS `accounts_user_alt_src_langs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user_alt_src_langs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`language_id`),
  KEY `accounts_user_alt_src_langs_e8701ad4` (`user_id`),
  KEY `accounts_user_alt_src_langs_468679bd` (`language_id`),
  CONSTRAINT `accounts_user_alt_s_user_id_4120817ac5141545_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `accounts__language_id_2e90cd0a28f41cc0_fk_pootle_app_language_id` FOREIGN KEY (`language_id`) REFERENCES `pootle_app_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_alt_src_langs`
--

LOCK TABLES `accounts_user_alt_src_langs` WRITE;
/*!40000 ALTER TABLE `accounts_user_alt_src_langs` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_alt_src_langs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add session',1,'add_session'),(2,'Can change session',1,'change_session'),(3,'Can delete session',1,'delete_session'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add site',5,'add_site'),(14,'Can change site',5,'change_site'),(15,'Can delete site',5,'delete_site'),(16,'Can add user',6,'add_user'),(17,'Can change user',6,'change_user'),(18,'Can delete user',6,'delete_user'),(19,'Can add directory',7,'add_directory'),(20,'Can change directory',7,'change_directory'),(21,'Can delete directory',7,'delete_directory'),(22,'Can add permission set',8,'add_permissionset'),(23,'Can change permission set',8,'change_permissionset'),(24,'Can delete permission set',8,'delete_permissionset'),(25,'Can add quality check',9,'add_qualitycheck'),(26,'Can change quality check',9,'change_qualitycheck'),(27,'Can delete quality check',9,'delete_qualitycheck'),(28,'Can add suggestion',10,'add_suggestion'),(29,'Can change suggestion',10,'change_suggestion'),(30,'Can delete suggestion',10,'delete_suggestion'),(31,'Can add unit',11,'add_unit'),(32,'Can change unit',11,'change_unit'),(33,'Can delete unit',11,'delete_unit'),(34,'Can add store',12,'add_store'),(35,'Can change store',12,'change_store'),(36,'Can delete store',12,'delete_store'),(37,'Can add language',13,'add_language'),(38,'Can change language',13,'change_language'),(39,'Can delete language',13,'delete_language'),(40,'Can add project',14,'add_project'),(41,'Can change project',14,'change_project'),(42,'Can delete project',14,'delete_project'),(43,'Can add translation project',15,'add_translationproject'),(44,'Can change translation project',15,'change_translationproject'),(45,'Can delete translation project',15,'delete_translationproject'),(46,'Can add submission',16,'add_submission'),(47,'Can change submission',16,'change_submission'),(48,'Can delete submission',16,'delete_submission'),(49,'Can add score log',17,'add_scorelog'),(50,'Can change score log',17,'change_scorelog'),(51,'Can delete score log',17,'delete_scorelog'),(52,'Can add paid task',18,'add_paidtask'),(53,'Can change paid task',18,'change_paidtask'),(54,'Can delete paid task',18,'delete_paidtask'),(55,'Can add legal page',19,'add_legalpage'),(56,'Can change legal page',19,'change_legalpage'),(57,'Can delete legal page',19,'delete_legalpage'),(58,'Can add static page',20,'add_staticpage'),(59,'Can change static page',20,'change_staticpage'),(60,'Can delete static page',20,'delete_staticpage'),(61,'Can add agreement',21,'add_agreement'),(62,'Can change agreement',21,'change_agreement'),(63,'Can delete agreement',21,'delete_agreement'),(64,'Can add virtual folder',22,'add_virtualfolder'),(65,'Can change virtual folder',22,'change_virtualfolder'),(66,'Can delete virtual folder',22,'delete_virtualfolder'),(67,'Can add virtual folder tree item',23,'add_virtualfoldertreeitem'),(68,'Can change virtual folder tree item',23,'change_virtualfoldertreeitem'),(69,'Can delete virtual folder tree item',23,'delete_virtualfoldertreeitem'),(70,'Can add email address',24,'add_emailaddress'),(71,'Can change email address',24,'change_emailaddress'),(72,'Can delete email address',24,'delete_emailaddress'),(73,'Can add email confirmation',25,'add_emailconfirmation'),(74,'Can change email confirmation',25,'change_emailconfirmation'),(75,'Can delete email confirmation',25,'delete_emailconfirmation'),(76,'Can add social application',26,'add_socialapp'),(77,'Can change social application',26,'change_socialapp'),(78,'Can delete social application',26,'delete_socialapp'),(79,'Can add social account',27,'add_socialaccount'),(80,'Can change social account',27,'change_socialaccount'),(81,'Can delete social account',27,'delete_socialaccount'),(82,'Can add social application token',28,'add_socialtoken'),(83,'Can change social application token',28,'change_socialtoken'),(84,'Can delete social application token',28,'delete_socialtoken'),(85,'Can access a project',7,'view'),(86,'Cannot access a project',7,'hide'),(87,'Can make a suggestion for a translation',7,'suggest'),(88,'Can submit a translation',7,'translate'),(89,'Can review suggestions',7,'review'),(90,'Can administrate a translation project',7,'administrate');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'session','sessions','session'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'content type','contenttypes','contenttype'),(5,'site','sites','site'),(6,'user','accounts','user'),(7,'pootle','pootle_app','directory'),(8,'permission set','pootle_app','permissionset'),(9,'quality check','pootle_store','qualitycheck'),(10,'suggestion','pootle_store','suggestion'),(11,'unit','pootle_store','unit'),(12,'store','pootle_store','store'),(13,'language','pootle_language','language'),(14,'project','pootle_project','project'),(15,'translation project','pootle_translationproject','translationproject'),(16,'submission','pootle_statistics','submission'),(17,'score log','pootle_statistics','scorelog'),(18,'paid task','reports','paidtask'),(19,'legal page','staticpages','legalpage'),(20,'static page','staticpages','staticpage'),(21,'agreement','staticpages','agreement'),(22,'virtual folder','virtualfolder','virtualfolder'),(23,'virtual folder tree item','virtualfolder','virtualfoldertreeitem'),(24,'email address','account','emailaddress'),(25,'email confirmation','account','emailconfirmation'),(26,'social application','socialaccount','socialapp'),(27,'social account','socialaccount','socialaccount'),(28,'social application token','socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2015-12-04 20:07:22'),(2,'account','0001_initial','2015-12-04 20:07:22'),(3,'account','0002_email_max_length','2015-12-04 20:07:22'),(4,'contenttypes','0001_initial','2015-12-04 20:07:22'),(5,'auth','0001_initial','2015-12-04 20:07:22'),(6,'pootle_app','0001_initial','2015-12-04 20:07:22'),(7,'pootle_language','0001_initial','2015-12-04 20:07:22'),(8,'accounts','0002_user_alt_src_langs','2015-12-04 20:07:22'),(9,'accounts','0003_remove_pootleprofile_id','2015-12-04 20:07:22'),(10,'pootle_project','0001_initial','2015-12-04 20:07:22'),(11,'pootle_translationproject','0001_initial','2015-12-04 20:07:23'),(12,'pootle_store','0001_initial','2015-12-04 20:07:23'),(13,'pootle_app','0002_mark_empty_dirs_as_obsolete','2015-12-04 20:07:23'),(14,'pootle_statistics','0001_initial','2015-12-04 20:07:24'),(15,'pootle_statistics','0002_update_submission_ordering','2015-12-04 20:07:24'),(16,'pootle_store','0002_make_suggestion_user_not_null','2015-12-04 20:07:24'),(17,'pootle_translationproject','0002_remove_translationproject_disabled','2015-12-04 20:07:24'),(18,'reports','0001_initial','2015-12-04 20:07:24'),(19,'sessions','0001_initial','2015-12-04 20:07:24'),(20,'sites','0001_initial','2015-12-04 20:07:24'),(21,'socialaccount','0001_initial','2015-12-04 20:07:24'),(22,'socialaccount','0002_token_max_lengths','2015-12-04 20:07:24'),(23,'staticpages','0001_initial','2015-12-04 20:07:25'),(24,'virtualfolder','0001_initial','2015-12-04 20:07:25');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('umyn0cpi2d90eb1azeghqexr8seek1c6','NDc4OTk2YWYyYzZmM2Q0ZDIzNzcwZjlkMmNkNzY4NDFjODQzOGFkZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNzM1NDYyYmMzYzVlMmIxZjBlYzU5ZjZjMDU0Y2RhN2JiYzE3NTQ2YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2015-12-18 20:27:37');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_app_directory`
--

DROP TABLE IF EXISTS `pootle_app_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_app_directory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pootle_path` varchar(255) NOT NULL,
  `obsolete` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pootle_path` (`pootle_path`),
  KEY `pootle_app_directory_6be37982` (`parent_id`),
  CONSTRAINT `pootle_app_d_parent_id_47b3c90b35f15f_fk_pootle_app_directory_id` FOREIGN KEY (`parent_id`) REFERENCES `pootle_app_directory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_app_directory`
--

LOCK TABLES `pootle_app_directory` WRITE;
/*!40000 ALTER TABLE `pootle_app_directory` DISABLE KEYS */;
INSERT INTO `pootle_app_directory` VALUES (1,'','/',0,NULL),(2,'projects','/projects/',0,1),(3,'templates','/templates/',0,1),(4,'en','/en/',0,1),(5,'terminology','/projects/terminology/',0,2),(6,'tutorial','/projects/tutorial/',0,2),(7,'tutorial','/templates/tutorial/',0,3),(8,'son','/son/',0,1),(9,'terminology','/son/terminology/',0,8),(10,'gu','/gu/',0,1),(11,'sat','/sat/',0,1),(12,'ff','/ff/',0,1),(13,'terminology','/ff/terminology/',0,12),(14,'nqo','/nqo/',0,1),(15,'brx','/brx/',0,1),(16,'ca','/ca/',0,1),(17,'terminology','/ca/terminology/',0,16),(18,'gnome','/ca/terminology/gnome/',0,17),(19,'sco','/sco/',0,1),(20,'gun','/gun/',0,1),(21,'mni','/mni/',0,1),(22,'ca@valencia','/ca@valencia/',0,1),(23,'gd','/gd/',0,1),(24,'ga','/ga/',0,1),(25,'terminology','/ga/terminology/',0,24),(26,'cs','/cs/',0,1),(27,'terminology','/cs/terminology/',0,26),(28,'gnome','/cs/terminology/gnome/',0,27),(29,'gl','/gl/',0,1),(30,'terminology','/gl/terminology/',0,29),(31,'pms','/pms/',0,1),(32,'mfe','/mfe/',0,1),(33,'ps','/ps/',0,1),(34,'or','/or/',0,1),(35,'terminology','/or/terminology/',0,34),(36,'lb','/lb/',0,1),(37,'pt','/pt/',0,1),(38,'terminology','/pt/terminology/',0,37),(39,'gnome','/pt/terminology/gnome/',0,38),(40,'ln','/ln/',0,1),(41,'terminology','/ln/terminology/',0,40),(42,'lo','/lo/',0,1),(43,'tt','/tt/',0,1),(44,'nso','/nso/',0,1),(45,'terminology','/nso/terminology/',0,44),(46,'tr','/tr/',0,1),(47,'terminology','/tr/terminology/',0,46),(48,'uk','/uk/',0,1),(49,'terminology','/uk/terminology/',0,48),(50,'gnome','/uk/terminology/gnome/',0,49),(51,'lv','/lv/',0,1),(52,'lt','/lt/',0,1),(53,'terminology','/lt/terminology/',0,52),(54,'pa','/pa/',0,1),(55,'terminology','/pa/terminology/',0,54),(56,'gnome','/pa/terminology/gnome/',0,55),(57,'sw','/sw/',0,1),(58,'terminology','/sw/terminology/',0,57),(59,'tg','/tg/',0,1),(60,'th','/th/',0,1),(61,'terminology','/th/terminology/',0,60),(62,'gnome','/th/terminology/gnome/',0,61),(63,'es_AR','/es_AR/',0,1),(64,'su','/su/',0,1),(65,'te','/te/',0,1),(66,'ia','/ia/',0,1),(67,'is','/is/',0,1),(68,'terminology','/is/terminology/',0,67),(69,'en_GB','/en_GB/',0,1),(70,'ta','/ta/',0,1),(71,'hy','/hy/',0,1),(72,'pt_BR','/pt_BR/',0,1),(73,'terminology','/pt_BR/terminology/',0,72),(74,'gnome','/pt_BR/terminology/gnome/',0,73),(75,'hr','/hr/',0,1),(76,'de','/de/',0,1),(77,'terminology','/de/terminology/',0,76),(78,'ht','/ht/',0,1),(79,'da','/da/',0,1),(80,'terminology','/da/terminology/',0,79),(81,'gnome','/da/terminology/gnome/',0,80),(82,'hi','/hi/',0,1),(83,'terminology','/hi/terminology/',0,82),(84,'gnome','/hi/terminology/gnome/',0,83),(85,'dz','/dz/',0,1),(86,'st','/st/',0,1),(87,'ha','/ha/',0,1),(88,'he','/he/',0,1),(89,'so','/so/',0,1),(90,'mg','/mg/',0,1),(91,'fur','/fur/',0,1),(92,'uz','/uz/',0,1),(93,'ml','/ml/',0,1),(94,'mn','/mn/',0,1),(95,'mi','/mi/',0,1),(96,'cy','/cy/',0,1),(97,'en_ZA','/en_ZA/',0,1),(98,'ur','/ur/',0,1),(99,'terminology','/ur/terminology/',0,98),(100,'zh_HK','/zh_HK/',0,1),(101,'terminology','/zh_HK/terminology/',0,100),(102,'gnome','/zh_HK/terminology/gnome/',0,101),(103,'mt','/mt/',0,1),(104,'mnk','/mnk/',0,1),(105,'fil','/fil/',0,1),(106,'ms','/ms/',0,1),(107,'terminology','/ms/terminology/',0,106),(108,'gnome','/ms/terminology/gnome/',0,107),(109,'mr','/mr/',0,1),(110,'terminology','/mr/terminology/',0,109),(111,'gnome','/mr/terminology/gnome/',0,110),(112,'ug','/ug/',0,1),(113,'my','/my/',0,1),(114,'el','/el/',0,1),(115,'eo','/eo/',0,1),(116,'terminology','/eo/terminology/',0,115),(117,'gnome','/eo/terminology/gnome/',0,116),(118,'tk','/tk/',0,1),(119,'af','/af/',0,1),(120,'terminology','/af/terminology/',0,119),(121,'tutorial','/af/tutorial/',0,119),(122,'ve','/ve/',0,1),(123,'oc','/oc/',0,1),(124,'ak','/ak/',0,1),(125,'terminology','/ak/terminology/',0,124),(126,'am','/am/',0,1),(127,'terminology','/am/terminology/',0,126),(128,'gnome','/am/terminology/gnome/',0,127),(129,'it','/it/',0,1),(130,'terminology','/it/terminology/',0,129),(131,'gnome','/it/terminology/gnome/',0,130),(132,'an','/an/',0,1),(133,'eu','/eu/',0,1),(134,'terminology','/eu/terminology/',0,133),(135,'gnome','/eu/terminology/gnome/',0,134),(136,'tutorial','/eu/tutorial/',0,133),(137,'as','/as/',0,1),(138,'ar','/ar/',0,1),(139,'terminology','/ar/terminology/',0,138),(140,'gnome','/ar/terminology/gnome/',0,139),(141,'tutorial','/ar/tutorial/',0,138),(142,'anp','/anp/',0,1),(143,'mk','/mk/',0,1),(144,'terminology','/mk/terminology/',0,143),(145,'gnome','/mk/terminology/gnome/',0,144),(146,'zu','/zu/',0,1),(147,'tutorial','/zu/tutorial/',0,146),(148,'ay','/ay/',0,1),(149,'et','/et/',0,1),(150,'az','/az/',0,1),(151,'terminology','/az/terminology/',0,150),(152,'gnome','/az/terminology/gnome/',0,151),(153,'id','/id/',0,1),(154,'arn','/arn/',0,1),(155,'bn_IN','/bn_IN/',0,1),(156,'pap','/pap/',0,1),(157,'terminology','/pap/terminology/',0,156),(158,'ru','/ru/',0,1),(159,'rw','/rw/',0,1),(160,'terminology','/rw/terminology/',0,159),(161,'gnome','/rw/terminology/gnome/',0,160),(162,'nl','/nl/',0,1),(163,'terminology','/nl/terminology/',0,162),(164,'gnome','/nl/terminology/gnome/',0,163),(165,'yo','/yo/',0,1),(166,'nn','/nn/',0,1),(167,'terminology','/nn/terminology/',0,166),(168,'gnome','/nn/terminology/gnome/',0,167),(169,'nah','/nah/',0,1),(170,'ne','/ne/',0,1),(171,'zh_CN','/zh_CN/',0,1),(172,'terminology','/zh_CN/terminology/',0,171),(173,'gnome','/zh_CN/terminology/gnome/',0,172),(174,'csb','/csb/',0,1),(175,'wo','/wo/',0,1),(176,'nap','/nap/',0,1),(177,'es','/es/',0,1),(178,'terminology','/es/terminology/',0,177),(179,'gnome','/es/terminology/gnome/',0,178),(180,'rm','/rm/',0,1),(181,'zh_TW','/zh_TW/',0,1),(182,'terminology','/zh_TW/terminology/',0,181),(183,'gnome','/zh_TW/terminology/gnome/',0,182),(184,'ro','/ro/',0,1),(185,'terminology','/ro/terminology/',0,184),(186,'ro','/ro/terminology/ro/',0,185),(187,'gnome','/ro/terminology/ro/gnome/',0,186),(188,'sah','/sah/',0,1),(189,'jv','/jv/',0,1),(190,'be','/be/',0,1),(191,'fr','/fr/',0,1),(192,'terminology','/fr/terminology/',0,191),(193,'gnome','/fr/terminology/gnome/',0,192),(194,'tutorial','/fr/tutorial/',0,191),(195,'bg','/bg/',0,1),(196,'terminology','/bg/terminology/',0,195),(197,'sv','/sv/',0,1),(198,'terminology','/sv/terminology/',0,197),(199,'gnome','/sv/terminology/gnome/',0,198),(200,'wa','/wa/',0,1),(201,'terminology','/wa/terminology/',0,200),(202,'gnome','/wa/terminology/gnome/',0,201),(203,'ast','/ast/',0,1),(204,'terminology','/ast/terminology/',0,203),(205,'vi','/vi/',0,1),(206,'terminology','/vi/terminology/',0,205),(207,'gnome','/vi/terminology/gnome/',0,206),(208,'fy','/fy/',0,1),(209,'bn','/bn/',0,1),(210,'bo','/bo/',0,1),(211,'cgg','/cgg/',0,1),(212,'fa','/fa/',0,1),(213,'terminology','/fa/terminology/',0,212),(214,'gnome','/fa/terminology/gnome/',0,213),(215,'br','/br/',0,1),(216,'bs','/bs/',0,1),(217,'mai','/mai/',0,1),(218,'fi','/fi/',0,1),(219,'hu','/hu/',0,1),(220,'terminology','/hu/terminology/',0,219),(221,'gnome','/hu/terminology/gnome/',0,220),(222,'ja','/ja/',0,1),(223,'terminology','/ja/terminology/',0,222),(224,'gnome','/ja/terminology/gnome/',0,223),(225,'fo','/fo/',0,1),(226,'ka','/ka/',0,1),(227,'doi','/doi/',0,1),(228,'hne','/hne/',0,1),(229,'kk','/kk/',0,1),(230,'sr','/sr/',0,1),(231,'sq','/sq/',0,1),(232,'terminology','/sq/terminology/',0,231),(233,'gnome','/sq/terminology/gnome/',0,232),(234,'ach','/ach/',0,1),(235,'ko','/ko/',0,1),(236,'terminology','/ko/terminology/',0,235),(237,'kn','/kn/',0,1),(238,'terminology','/kn/terminology/',0,237),(239,'gnome','/kn/terminology/gnome/',0,238),(240,'km','/km/',0,1),(241,'terminology','/km/terminology/',0,240),(242,'kl','/kl/',0,1),(243,'sk','/sk/',0,1),(244,'terminology','/sk/terminology/',0,243),(245,'gnome','/sk/terminology/gnome/',0,244),(246,'si','/si/',0,1),(247,'pl','/pl/',0,1),(248,'terminology','/pl/terminology/',0,247),(249,'gnome','/pl/terminology/gnome/',0,248),(250,'kw','/kw/',0,1),(251,'ku','/ku/',0,1),(252,'terminology','/ku/terminology/',0,251),(253,'gnome','/ku/terminology/gnome/',0,252),(254,'sl','/sl/',0,1),(255,'jbo','/jbo/',0,1),(256,'ti','/ti/',0,1),(257,'ky','/ky/',0,1),(258,'nb','/nb/',0,1),(259,'terminology','/nb/terminology/',0,258),(260,'gnome','/nb/terminology/gnome/',0,259),(261,'se','/se/',0,1),(262,'sd','/sd/',0,1);
/*!40000 ALTER TABLE `pootle_app_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_app_language`
--

DROP TABLE IF EXISTS `pootle_app_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_app_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `specialchars` varchar(255) NOT NULL,
  `nplurals` smallint(6) NOT NULL,
  `pluralequation` varchar(255) NOT NULL,
  `directory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `directory_id` (`directory_id`),
  CONSTRAINT `pootle__directory_id_19582408e085153f_fk_pootle_app_directory_id` FOREIGN KEY (`directory_id`) REFERENCES `pootle_app_directory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_app_language`
--

LOCK TABLES `pootle_app_language` WRITE;
/*!40000 ALTER TABLE `pootle_app_language` DISABLE KEYS */;
INSERT INTO `pootle_app_language` VALUES (1,'templates','Templates','',0,'',3),(2,'en','English','',2,'(n != 1)',4),(3,'son','Songhai languages','ɲŋšžãõẽĩƝŊŠŽÃÕẼĨ',2,'(n != 1)',8),(4,'gu','Gujarati','',2,'(n != 1)',10),(5,'sat','Santali','',2,'(n != 1)',11),(6,'ff','Fulah','',2,'(n != 1)',12),(7,'nqo','N\'Ko','',2,'(n > 1)',14),(8,'brx','Bodo','',2,'(n != 1)',15),(9,'ca','Catalan; Valencian','',2,'(n != 1)',16),(10,'sco','Scots','',2,'(n != 1)',19),(11,'gun','Gun','',2,'(n > 1)',20),(12,'mni','Manipuri','',2,'(n != 1)',21),(13,'ca@valencia','Catalan; Valencian','',2,'(n != 1)',22),(14,'gd','Gaelic; Scottish Gaelic','àòùèìÀÈÌÒÙ',4,'(n==1 || n==11) ? 0 : (n==2 || n==12) ? 1 : (n > 2 && n < 20) ? 2 : 3',23),(15,'ga','Irish','',5,'n==1 ? 0 : n==2 ? 1 : (n>2 && n<7) ? 2 :(n>6 && n<11) ? 3 : 4',24),(16,'cs','Czech','',3,'(n==1) ? 0 : (n>=2 && n<=4) ? 1 : 2',26),(17,'gl','Galician','',2,'(n != 1)',29),(18,'pms','Piemontese','',2,'(n != 1)',31),(19,'mfe','Morisyen','',2,'(n > 1)',32),(20,'ps','Pushto; Pashto','',2,'(n != 1)',33),(21,'or','Oriya','',2,'(n != 1)',34),(22,'lb','Luxembourgish; Letzeburgesch','',2,'(n != 1)',36),(23,'pt','Portuguese','',2,'(n != 1)',37),(24,'ln','Lingala','',2,'(n > 1)',40),(25,'lo','Lao','',1,'0',42),(26,'tt','Tatar','',1,'0',43),(27,'nso','Pedi; Sepedi; Northern Sotho','šŠ',2,'(n != 1)',44),(28,'tr','Turkish','',1,'0',46),(29,'uk','Ukrainian','',3,'(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)',48),(30,'lv','Latvian','',3,'(n%10==1 && n%100!=11 ? 0 : n != 0 ? 1 : 2)',51),(31,'lt','Lithuanian','',3,'(n%10==1 && n%100!=11 ? 0 : n%10>=2 && (n%100<10 || n%100>=20) ? 1 : 2)',52),(32,'pa','Panjabi; Punjabi','',2,'(n != 1)',54),(33,'sw','Swahili','',2,'(n != 1)',57),(34,'tg','Tajik','',2,'(n != 1)',59),(35,'th','Thai','',1,'0',60),(36,'es_AR','Argentinean Spanish','',2,'(n != 1)',63),(37,'su','Sundanese','',1,'0',64),(38,'te','Telugu','',2,'(n != 1)',65),(39,'ia','Interlingua (International Auxiliary Language Association)','',2,'(n != 1)',66),(40,'is','Icelandic','',2,'(n != 1)',67),(41,'en_GB','English (United Kingdom)','',2,'(n != 1)',69),(42,'ta','Tamil','',2,'(n != 1)',70),(43,'hy','Armenian','',1,'0',71),(44,'pt_BR','Portuguese (Brazil)','',2,'(n > 1)',72),(45,'hr','Croatian','',3,'(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)',75),(46,'de','German','',2,'(n != 1)',76),(47,'ht','Haitian; Haitian Creole','',2,'(n != 1)',78),(48,'da','Danish','',2,'(n != 1)',79),(49,'hi','Hindi','',2,'(n != 1)',82),(50,'dz','Dzongkha','',1,'0',85),(51,'st','Sotho, Southern','',2,'(n != 1)',86),(52,'ha','Hausa','',2,'(n != 1)',87),(53,'he','Hebrew','',2,'(n != 1)',88),(54,'so','Somali','',2,'(n != 1)',89),(55,'mg','Malagasy','',2,'(n > 1)',90),(56,'fur','Friulian','',2,'(n != 1)',91),(57,'uz','Uzbek','',2,'(n > 1)',92),(58,'ml','Malayalam','',2,'(n != 1)',93),(59,'mn','Mongolian','',2,'(n != 1)',94),(60,'mi','Maori','',2,'(n > 1)',95),(61,'cy','Welsh','',2,'(n==2) ? 1 : 0',96),(62,'en_ZA','English (South Africa)','',2,'(n != 1)',97),(63,'ur','Urdu','',2,'(n != 1)',98),(64,'zh_HK','Chinese (Hong Kong)','←→↔×÷©…—‘’“”「」『』【】《》',1,'0',100),(65,'mt','Maltese','',4,'(n==1 ? 0 : n==0 || ( n%100>1 && n%100<11) ? 1 : (n%100>10 && n%100<20 ) ? 2 : 3)',103),(66,'mnk','Mandinka','',3,'(n==0 ? 0 : n==1 ? 1 : 2)',104),(67,'fil','Filipino; Pilipino','',2,'(n > 1)',105),(68,'ms','Malay','',1,'0',106),(69,'mr','Marathi','',2,'(n != 1)',109),(70,'ug','Uighur; Uyghur','',1,'0',112),(71,'my','Burmese','',1,'0',113),(72,'el','Greek, Modern (1453-)','',2,'(n != 1)',114),(73,'eo','Esperanto','',2,'(n != 1)',115),(74,'tk','Turkmen','',2,'(n != 1)',118),(75,'af','Afrikaans','ëïêôûáéíóúý',2,'(n != 1)',119),(76,'ve','Venda','ḓṋḽṱ ḒṊḼṰ ṅṄ',2,'(n != 1)',122),(77,'oc','Occitan (post 1500)','',2,'(n > 1)',123),(78,'ak','Akan','ɛɔƐƆ',2,'n > 1',124),(79,'am','Amharic','',2,'n > 1',126),(80,'it','Italian','',2,'(n != 1)',129),(81,'an','Aragonese','',2,'(n != 1)',132),(82,'eu','Basque','',2,'(n != 1)',133),(83,'as','Assamese','',2,'(n != 1)',137),(84,'ar','Arabic','',6,'n==0 ? 0 : n==1 ? 1 : n==2 ? 2 : n%100>=3 && n%100<=10 ? 3 : n%100>=11 ? 4 : 5',138),(85,'anp','Angika','',2,'(n != 1)',142),(86,'mk','Macedonian','',2,'n==1 || n%10==1 ? 0 : 1',143),(87,'zu','Zulu','',2,'(n != 1)',146),(88,'ay','Aymará','',1,'0',148),(89,'et','Estonian','',2,'(n != 1)',149),(90,'az','Azerbaijani','',2,'(n != 1)',150),(91,'id','Indonesian','',1,'0',153),(92,'arn','Mapudungun; Mapuche','',2,'n > 1',154),(93,'bn_IN','Bengali (India)','',2,'(n != 1)',155),(94,'pap','Papiamento','',2,'(n != 1)',156),(95,'ru','Russian','',3,'(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)',158),(96,'rw','Kinyarwanda','',2,'(n != 1)',159),(97,'nl','Dutch; Flemish','',2,'(n != 1)',162),(98,'yo','Yoruba','',2,'(n != 1)',165),(99,'nn','Norwegian Nynorsk; Nynorsk, Norwegian','',2,'(n != 1)',166),(100,'nah','Nahuatl languages','',2,'(n != 1)',169),(101,'ne','Nepali','',2,'(n != 1)',170),(102,'zh_CN','Chinese (China)','←→↔×÷©…—‘’“”【】《》',1,'0',171),(103,'csb','Kashubian','',3,'n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2',174),(104,'wo','Wolof','',2,'(n != 1)',175),(105,'nap','Neapolitan','',2,'(n != 1)',176),(106,'es','Spanish; Castilian','',2,'(n != 1)',177),(107,'rm','Romansh','',2,'(n != 1)',180),(108,'zh_TW','Chinese (Taiwan)','←→↔×÷©…—‘’“”「」『』【】《》',1,'0',181),(109,'ro','Romanian','',3,'(n==1 ? 0 : (n==0 || (n%100 > 0 && n%100 < 20)) ? 1 : 2);',184),(110,'sah','Yakut','',1,'0',188),(111,'jv','Javanese','',2,'(n != 1)',189),(112,'be','Belarusian','',3,'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2',190),(113,'fr','French','',2,'(n > 1)',191),(114,'bg','Bulgarian','',2,'(n != 1)',195),(115,'sv','Swedish','',2,'(n != 1)',197),(116,'wa','Walloon','',2,'(n > 1)',200),(117,'ast','Asturian; Bable; Leonese; Asturleonese','',2,'(n != 1)',203),(118,'vi','Vietnamese','',1,'0',205),(119,'fy','Frisian','',2,'(n != 1)',208),(120,'bn','Bengali','',2,'(n != 1)',209),(121,'bo','Tibetan','',1,'0',210),(122,'cgg','Chiga','',1,'0',211),(123,'fa','Persian','',1,'0',212),(124,'br','Breton','',2,'n > 1',215),(125,'bs','Bosnian','',3,'n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2',216),(126,'mai','Maithili','',2,'(n != 1)',217),(127,'fi','Finnish','',2,'(n != 1)',218),(128,'hu','Hungarian','',2,'(n != 1)',219),(129,'ja','Japanese','',1,'0',222),(130,'fo','Faroese','',2,'(n != 1)',225),(131,'ka','Georgian','',1,'0',226),(132,'doi','Dogri','',2,'(n != 1)',227),(133,'hne','Chhattisgarhi','',2,'(n != 1)',228),(134,'kk','Kazakh','',1,'0',229),(135,'sr','Serbian','',3,'(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)',230),(136,'sq','Albanian','',2,'(n != 1)',231),(137,'ach','Acholi','',2,'n > 1',234),(138,'ko','Korean','',1,'0',235),(139,'kn','Kannada','',2,'(n != 1)',237),(140,'km','Central Khmer','',1,'0',240),(141,'kl','Greenlandic','',2,'(n != 1)',242),(142,'sk','Slovak','',3,'(n==1) ? 0 : (n>=2 && n<=4) ? 1 : 2',243),(143,'si','Sinhala; Sinhalese','',2,'(n != 1)',246),(144,'pl','Polish','',3,'(n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)',247),(145,'kw','Cornish','',4,'(n==1) ? 0 : (n==2) ? 1 : (n == 3) ? 2 : 3',250),(146,'ku','Kurdish','',2,'(n != 1)',251),(147,'sl','Slovenian','',4,'(n%100==1 ? 0 : n%100==2 ? 1 : n%100==3 || n%100==4 ? 2 : 3)',254),(148,'jbo','Lojban','',1,'0',255),(149,'ti','Tigrinya','',2,'(n > 1)',256),(150,'ky','Kirghiz; Kyrgyz','',1,'0',257),(151,'nb','Bokmål, Norwegian; Norwegian Bokmål','',2,'(n != 1)',258),(152,'se','Northern Sami','',2,'(n != 1)',261),(153,'sd','Sindhi','',2,'(n != 1)',262);
/*!40000 ALTER TABLE `pootle_app_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_app_permissionset`
--

DROP TABLE IF EXISTS `pootle_app_permissionset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_app_permissionset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directory_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pootle_app_permissionset_user_id_1f3b8a995751b754_uniq` (`user_id`,`directory_id`),
  KEY `pootle_app_permissionset_0a37f8e3` (`directory_id`),
  KEY `pootle_app_permissionset_e8701ad4` (`user_id`),
  CONSTRAINT `pootle_app_permissi_user_id_14836757a5c2b38a_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `pootle__directory_id_6122a919df398699_fk_pootle_app_directory_id` FOREIGN KEY (`directory_id`) REFERENCES `pootle_app_directory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_app_permissionset`
--

LOCK TABLES `pootle_app_permissionset` WRITE;
/*!40000 ALTER TABLE `pootle_app_permissionset` DISABLE KEYS */;
INSERT INTO `pootle_app_permissionset` VALUES (1,1,1),(3,3,1),(2,1,2),(4,3,2);
/*!40000 ALTER TABLE `pootle_app_permissionset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_app_permissionset_negative_permissions`
--

DROP TABLE IF EXISTS `pootle_app_permissionset_negative_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_app_permissionset_negative_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionset_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissionset_id` (`permissionset_id`,`permission_id`),
  KEY `pootle_app_permissionset_negative_permissions_b36f10ba` (`permissionset_id`),
  KEY `pootle_app_permissionset_negative_permissions_8373b171` (`permission_id`),
  CONSTRAINT `permissionset_id_d3693cb72a2fa41_fk_pootle_app_permissionset_id` FOREIGN KEY (`permissionset_id`) REFERENCES `pootle_app_permissionset` (`id`),
  CONSTRAINT `pootle_app__permission_id_2d0508b63eb9550c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_app_permissionset_negative_permissions`
--

LOCK TABLES `pootle_app_permissionset_negative_permissions` WRITE;
/*!40000 ALTER TABLE `pootle_app_permissionset_negative_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pootle_app_permissionset_negative_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_app_permissionset_positive_permissions`
--

DROP TABLE IF EXISTS `pootle_app_permissionset_positive_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_app_permissionset_positive_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionset_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissionset_id` (`permissionset_id`,`permission_id`),
  KEY `pootle_app_permissionset_positive_permissions_b36f10ba` (`permissionset_id`),
  KEY `pootle_app_permissionset_positive_permissions_8373b171` (`permission_id`),
  CONSTRAINT `D1982448903494983ae76d35807b74b7` FOREIGN KEY (`permissionset_id`) REFERENCES `pootle_app_permissionset` (`id`),
  CONSTRAINT `pootle_app__permission_id_54207c912d5924c8_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_app_permissionset_positive_permissions`
--

LOCK TABLES `pootle_app_permissionset_positive_permissions` WRITE;
/*!40000 ALTER TABLE `pootle_app_permissionset_positive_permissions` DISABLE KEYS */;
INSERT INTO `pootle_app_permissionset_positive_permissions` VALUES (1,1,85),(2,1,87),(4,2,85),(5,2,87),(3,2,88);
/*!40000 ALTER TABLE `pootle_app_permissionset_positive_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_app_project`
--

DROP TABLE IF EXISTS `pootle_app_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_app_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `checkstyle` varchar(50) NOT NULL,
  `localfiletype` varchar(50) NOT NULL,
  `treestyle` varchar(20) NOT NULL,
  `ignoredfiles` varchar(255) NOT NULL,
  `report_email` varchar(254) NOT NULL,
  `screenshot_search_prefix` varchar(200) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL,
  `directory_id` int(11) NOT NULL,
  `source_language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `directory_id` (`directory_id`),
  KEY `pootle_app_project_184e36bb` (`creation_time`),
  KEY `pootle_app_project_14b0bcfb` (`source_language_id`),
  CONSTRAINT `pootle__directory_id_1224285990a97871_fk_pootle_app_directory_id` FOREIGN KEY (`directory_id`) REFERENCES `pootle_app_directory` (`id`),
  CONSTRAINT `po_source_language_id_4b5bfccd0b6c60da_fk_pootle_app_language_id` FOREIGN KEY (`source_language_id`) REFERENCES `pootle_app_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_app_project`
--

LOCK TABLES `pootle_app_project` WRITE;
/*!40000 ALTER TABLE `pootle_app_project` DISABLE KEYS */;
INSERT INTO `pootle_app_project` VALUES (1,'terminology','Terminology','terminology','po','auto','','',NULL,'2015-12-04 20:07:33',0,5,2),(2,'tutorial','Tutorial','standard','po','auto','','',NULL,'2015-12-04 20:07:33',0,6,2);
/*!40000 ALTER TABLE `pootle_app_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_app_submission`
--

DROP TABLE IF EXISTS `pootle_app_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_app_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_time` datetime NOT NULL,
  `field` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `old_value` longtext NOT NULL,
  `new_value` longtext NOT NULL,
  `similarity` double DEFAULT NULL,
  `mt_similarity` double DEFAULT NULL,
  `quality_check_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `submitter_id` int(11) DEFAULT NULL,
  `suggestion_id` int(11) DEFAULT NULL,
  `translation_project_id` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pootle_app_submission_184e36bb` (`creation_time`),
  KEY `pootle_app_submission_06e3d36f` (`field`),
  KEY `pootle_app_submission_599dcce2` (`type`),
  KEY `pootle_app_submission_0e9ed9de` (`quality_check_id`),
  KEY `pootle_app_submission_7473547c` (`store_id`),
  KEY `pootle_app_submission_a8919bbb` (`submitter_id`),
  KEY `pootle_app_submission_869f1423` (`suggestion_id`),
  KEY `pootle_app_submission_8da1619a` (`translation_project_id`),
  KEY `pootle_app_submission_e8175980` (`unit_id`),
  CONSTRAINT `D2c4c13452bb94303e8f15a6842559ba` FOREIGN KEY (`translation_project_id`) REFERENCES `pootle_app_translationproject` (`id`),
  CONSTRAINT `f025cd07fdff0f27c40516f07bda6baa` FOREIGN KEY (`quality_check_id`) REFERENCES `pootle_store_qualitycheck` (`id`),
  CONSTRAINT `pootle_app_subm_unit_id_49a0bb7e5924f7fd_fk_pootle_store_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `pootle_store_unit` (`id`),
  CONSTRAINT `pootle_app_sub_submitter_id_38964ded2f97579d_fk_accounts_user_id` FOREIGN KEY (`submitter_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `pootle_app_su_store_id_698daad0d529d805_fk_pootle_store_store_id` FOREIGN KEY (`store_id`) REFERENCES `pootle_store_store` (`id`),
  CONSTRAINT `poo_suggestion_id_5bebaf99a959eec1_fk_pootle_store_suggestion_id` FOREIGN KEY (`suggestion_id`) REFERENCES `pootle_store_suggestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_app_submission`
--

LOCK TABLES `pootle_app_submission` WRITE;
/*!40000 ALTER TABLE `pootle_app_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `pootle_app_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_app_translationproject`
--

DROP TABLE IF EXISTS `pootle_app_translationproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_app_translationproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_path` varchar(100) NOT NULL,
  `pootle_path` varchar(255) NOT NULL,
  `creation_time` datetime DEFAULT NULL,
  `directory_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pootle_path` (`pootle_path`),
  UNIQUE KEY `directory_id` (`directory_id`),
  UNIQUE KEY `pootle_app_translationproject_language_id_174ebd806b10b84d_uniq` (`language_id`,`project_id`),
  KEY `pootle_app_translationproject_184e36bb` (`creation_time`),
  KEY `pootle_app_translationproject_468679bd` (`language_id`),
  KEY `pootle_app_translationproject_b098ad43` (`project_id`),
  CONSTRAINT `pootle_app__project_id_2f755353c46378ef_fk_pootle_app_project_id` FOREIGN KEY (`project_id`) REFERENCES `pootle_app_project` (`id`),
  CONSTRAINT `pootle_ap_language_id_2d790c5f71e878b3_fk_pootle_app_language_id` FOREIGN KEY (`language_id`) REFERENCES `pootle_app_language` (`id`),
  CONSTRAINT `pootle__directory_id_68a6cbc543daba8d_fk_pootle_app_directory_id` FOREIGN KEY (`directory_id`) REFERENCES `pootle_app_directory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_app_translationproject`
--

LOCK TABLES `pootle_app_translationproject` WRITE;
/*!40000 ALTER TABLE `pootle_app_translationproject` DISABLE KEYS */;
INSERT INTO `pootle_app_translationproject` VALUES (1,'tutorial/templates','/templates/tutorial/','2015-12-04 20:07:33',7,1,2),(2,'terminology/son','/son/terminology/','2015-12-04 20:07:33',9,3,1),(3,'terminology/ff','/ff/terminology/','2015-12-04 20:07:33',13,6,1),(4,'terminology/ca','/ca/terminology/','2015-12-04 20:07:33',17,9,1),(5,'terminology/ga','/ga/terminology/','2015-12-04 20:07:33',25,15,1),(6,'terminology/cs','/cs/terminology/','2015-12-04 20:07:33',27,16,1),(7,'terminology/gl','/gl/terminology/','2015-12-04 20:07:33',30,17,1),(8,'terminology/or','/or/terminology/','2015-12-04 20:07:33',35,21,1),(9,'terminology/pt','/pt/terminology/','2015-12-04 20:07:33',38,23,1),(10,'terminology/ln','/ln/terminology/','2015-12-04 20:07:33',41,24,1),(11,'terminology/nso','/nso/terminology/','2015-12-04 20:07:33',45,27,1),(12,'terminology/tr','/tr/terminology/','2015-12-04 20:07:33',47,28,1),(13,'terminology/uk','/uk/terminology/','2015-12-04 20:07:33',49,29,1),(14,'terminology/lt','/lt/terminology/','2015-12-04 20:07:33',53,31,1),(15,'terminology/pa','/pa/terminology/','2015-12-04 20:07:33',55,32,1),(16,'terminology/sw','/sw/terminology/','2015-12-04 20:07:33',58,33,1),(17,'terminology/th','/th/terminology/','2015-12-04 20:07:33',61,35,1),(18,'terminology/is','/is/terminology/','2015-12-04 20:07:33',68,40,1),(19,'terminology/pt_BR','/pt_BR/terminology/','2015-12-04 20:07:33',73,44,1),(20,'terminology/de','/de/terminology/','2015-12-04 20:07:33',77,46,1),(21,'terminology/da','/da/terminology/','2015-12-04 20:07:33',80,48,1),(22,'terminology/hi','/hi/terminology/','2015-12-04 20:07:33',83,49,1),(23,'terminology/ur','/ur/terminology/','2015-12-04 20:07:33',99,63,1),(24,'terminology/zh_HK','/zh_HK/terminology/','2015-12-04 20:07:33',101,64,1),(25,'terminology/ms','/ms/terminology/','2015-12-04 20:07:33',107,68,1),(26,'terminology/mr','/mr/terminology/','2015-12-04 20:07:33',110,69,1),(27,'terminology/eo','/eo/terminology/','2015-12-04 20:07:33',116,73,1),(28,'terminology/af','/af/terminology/','2015-12-04 20:07:34',120,75,1),(29,'tutorial/af','/af/tutorial/','2015-12-04 20:07:34',121,75,2),(30,'terminology/ak','/ak/terminology/','2015-12-04 20:07:34',125,78,1),(31,'terminology/am','/am/terminology/','2015-12-04 20:07:34',127,79,1),(32,'terminology/it','/it/terminology/','2015-12-04 20:07:34',130,80,1),(33,'terminology/eu','/eu/terminology/','2015-12-04 20:07:34',134,82,1),(34,'tutorial/eu','/eu/tutorial/','2015-12-04 20:07:34',136,82,2),(35,'terminology/ar','/ar/terminology/','2015-12-04 20:07:34',139,84,1),(36,'tutorial/ar','/ar/tutorial/','2015-12-04 20:07:34',141,84,2),(37,'terminology/mk','/mk/terminology/','2015-12-04 20:07:34',144,86,1),(38,'tutorial/zu','/zu/tutorial/','2015-12-04 20:07:34',147,87,2),(39,'terminology/az','/az/terminology/','2015-12-04 20:07:34',151,90,1),(40,'terminology/pap','/pap/terminology/','2015-12-04 20:07:34',157,94,1),(41,'terminology/rw','/rw/terminology/','2015-12-04 20:07:34',160,96,1),(42,'terminology/nl','/nl/terminology/','2015-12-04 20:07:34',163,97,1),(43,'terminology/nn','/nn/terminology/','2015-12-04 20:07:34',167,99,1),(44,'terminology/zh_CN','/zh_CN/terminology/','2015-12-04 20:07:34',172,102,1),(45,'terminology/es','/es/terminology/','2015-12-04 20:07:34',178,106,1),(46,'terminology/zh_TW','/zh_TW/terminology/','2015-12-04 20:07:34',182,108,1),(47,'terminology/ro','/ro/terminology/','2015-12-04 20:07:34',185,109,1),(48,'terminology/fr','/fr/terminology/','2015-12-04 20:07:34',192,113,1),(49,'tutorial/fr','/fr/tutorial/','2015-12-04 20:07:34',194,113,2),(50,'terminology/bg','/bg/terminology/','2015-12-04 20:07:34',196,114,1),(51,'terminology/sv','/sv/terminology/','2015-12-04 20:07:34',198,115,1),(52,'terminology/wa','/wa/terminology/','2015-12-04 20:07:34',201,116,1),(53,'terminology/ast','/ast/terminology/','2015-12-04 20:07:34',204,117,1),(54,'terminology/vi','/vi/terminology/','2015-12-04 20:07:34',206,118,1),(55,'terminology/fa','/fa/terminology/','2015-12-04 20:07:34',213,123,1),(56,'terminology/hu','/hu/terminology/','2015-12-04 20:07:34',220,128,1),(57,'terminology/ja','/ja/terminology/','2015-12-04 20:07:34',223,129,1),(58,'terminology/sq','/sq/terminology/','2015-12-04 20:07:34',232,136,1),(59,'terminology/ko','/ko/terminology/','2015-12-04 20:07:34',236,138,1),(60,'terminology/kn','/kn/terminology/','2015-12-04 20:07:34',238,139,1),(61,'terminology/km','/km/terminology/','2015-12-04 20:07:34',241,140,1),(62,'terminology/sk','/sk/terminology/','2015-12-04 20:07:34',244,142,1),(63,'terminology/pl','/pl/terminology/','2015-12-04 20:07:35',248,144,1),(64,'terminology/ku','/ku/terminology/','2015-12-04 20:07:35',252,146,1),(65,'terminology/nb','/nb/terminology/','2015-12-04 20:07:35',259,151,1);
/*!40000 ALTER TABLE `pootle_app_translationproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_statistics_scorelog`
--

DROP TABLE IF EXISTS `pootle_statistics_scorelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_statistics_scorelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_time` datetime NOT NULL,
  `rate` double NOT NULL,
  `review_rate` double NOT NULL,
  `wordcount` int(10) unsigned NOT NULL,
  `similarity` double NOT NULL,
  `score_delta` double NOT NULL,
  `action_code` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pootle_statistics_scorelog_submission_id_1bce51e2ef679486_uniq` (`submission_id`,`action_code`),
  KEY `pootle_statistics_scorelog_184e36bb` (`creation_time`),
  KEY `pootle_statistics_scorelog_1dd9cfcc` (`submission_id`),
  KEY `pootle_statistics_scorelog_e8701ad4` (`user_id`),
  CONSTRAINT `pootle_statistics_s_user_id_250937bf157a7df1_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `pootle_submission_id_5d2b67ff7f9b468_fk_pootle_app_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `pootle_app_submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_statistics_scorelog`
--

LOCK TABLES `pootle_statistics_scorelog` WRITE;
/*!40000 ALTER TABLE `pootle_statistics_scorelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pootle_statistics_scorelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_store_qualitycheck`
--

DROP TABLE IF EXISTS `pootle_store_qualitycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_store_qualitycheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `category` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `false_positive` tinyint(1) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pootle_store_qualitycheck_b068931c` (`name`),
  KEY `pootle_store_qualitycheck_a4bcd9c6` (`false_positive`),
  KEY `pootle_store_qualitycheck_e8175980` (`unit_id`),
  CONSTRAINT `pootle_store_qu_unit_id_1f02b45813da04c8_fk_pootle_store_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `pootle_store_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_store_qualitycheck`
--

LOCK TABLES `pootle_store_qualitycheck` WRITE;
/*!40000 ALTER TABLE `pootle_store_qualitycheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `pootle_store_qualitycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_store_store`
--

DROP TABLE IF EXISTS `pootle_store_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_store_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `pootle_path` varchar(255) NOT NULL,
  `name` varchar(128) NOT NULL,
  `file_mtime` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `creation_time` datetime DEFAULT NULL,
  `last_sync_revision` int(11) DEFAULT NULL,
  `obsolete` tinyint(1) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `translation_project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pootle_path` (`pootle_path`),
  UNIQUE KEY `pootle_store_store_parent_id_31edd88451e93337_uniq` (`parent_id`,`name`),
  KEY `pootle_store_store_8c7dd922` (`file`),
  KEY `pootle_store_store_9ed39e2e` (`state`),
  KEY `pootle_store_store_184e36bb` (`creation_time`),
  KEY `pootle_store_store_02c4ad78` (`last_sync_revision`),
  KEY `pootle_store_store_6be37982` (`parent_id`),
  KEY `pootle_store_store_8da1619a` (`translation_project_id`),
  CONSTRAINT `D5380a8dfa9f1386a51d743476cfc6de` FOREIGN KEY (`translation_project_id`) REFERENCES `pootle_app_translationproject` (`id`),
  CONSTRAINT `pootle_stor_parent_id_6420f4407f337df_fk_pootle_app_directory_id` FOREIGN KEY (`parent_id`) REFERENCES `pootle_app_directory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_store_store`
--

LOCK TABLES `pootle_store_store` WRITE;
/*!40000 ALTER TABLE `pootle_store_store` DISABLE KEYS */;
INSERT INTO `pootle_store_store` VALUES (1,'tutorial/templates/tutorial.pot','/templates/tutorial/tutorial.pot','tutorial.pot','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,7,1),(2,'terminology/son/essential.po','/son/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,9,2),(3,'terminology/son/glossmaster.po','/son/terminology/glossmaster.po','glossmaster.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,9,2),(4,'terminology/ff/essential.po','/ff/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,13,3),(5,'terminology/ca/essential.po','/ca/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,17,4),(6,'terminology/ca/gnome/ca.po','/ca/terminology/gnome/ca.po','ca.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,18,4),(7,'terminology/ga/essential.po','/ga/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,25,5),(8,'terminology/cs/gnome/cs.po','/cs/terminology/gnome/cs.po','cs.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,28,6),(9,'terminology/gl/essential.po','/gl/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,30,7),(10,'terminology/or/fuel_or.po','/or/terminology/fuel_or.po','fuel_or.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,35,8),(11,'terminology/pt/gnome/pt.po','/pt/terminology/gnome/pt.po','pt.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,39,9),(12,'terminology/ln/GM_ln_20090916.po','/ln/terminology/GM_ln_20090916.po','GM_ln_20090916.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,41,10),(13,'terminology/nso/essential.po','/nso/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,45,11),(14,'terminology/tr/essential.po','/tr/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,47,12),(15,'terminology/uk/gnome/uk.po','/uk/terminology/gnome/uk.po','uk.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,50,13),(16,'terminology/lt/essential.po','/lt/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,53,14),(17,'terminology/pa/gnome/pa.po','/pa/terminology/gnome/pa.po','pa.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,56,15),(18,'terminology/sw/essential.po','/sw/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,58,16),(19,'terminology/th/gnome/th.po','/th/terminology/gnome/th.po','th.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,62,17),(20,'terminology/is/essential.po','/is/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,68,18),(21,'terminology/pt_BR/gnome/pt_BR.po','/pt_BR/terminology/gnome/pt_BR.po','pt_BR.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,74,19),(22,'terminology/de/essential.po','/de/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,77,20),(23,'terminology/da/essential.po','/da/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,80,21),(24,'terminology/da/gnome/da.po','/da/terminology/gnome/da.po','da.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,81,21),(25,'terminology/hi/fuel_hi.po','/hi/terminology/fuel_hi.po','fuel_hi.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,83,22),(26,'terminology/hi/gnome/hi.po','/hi/terminology/gnome/hi.po','hi.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,84,22),(27,'terminology/ur/essential.po','/ur/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,99,23),(28,'terminology/zh_HK/gnome/zh_HK.po','/zh_HK/terminology/gnome/zh_HK.po','zh_HK.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,102,24),(29,'terminology/ms/gnome/ms.po','/ms/terminology/gnome/ms.po','ms.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,108,25),(30,'terminology/mr/gnome/mr.po','/mr/terminology/gnome/mr.po','mr.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,111,26),(31,'terminology/eo/gnome/eo.po','/eo/terminology/gnome/eo.po','eo.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:33',NULL,0,117,27),(32,'terminology/af/gnome-terminologie.po','/af/terminology/gnome-terminologie.po','gnome-terminologie.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,120,28),(33,'tutorial/af/tutorial.po','/af/tutorial/tutorial.po','tutorial.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,121,29),(34,'terminology/ak/Glossmaster_ak.po','/ak/terminology/Glossmaster_ak.po','Glossmaster_ak.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,125,30),(35,'terminology/am/gnome/am.po','/am/terminology/gnome/am.po','am.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,128,31),(36,'terminology/it/gnome/it.po','/it/terminology/gnome/it.po','it.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,131,32),(37,'terminology/eu/gnome/eu.po','/eu/terminology/gnome/eu.po','eu.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,135,33),(38,'tutorial/eu/tutorial.po','/eu/tutorial/tutorial.po','tutorial.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,136,34),(39,'terminology/ar/essential.po','/ar/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,139,35),(40,'terminology/ar/gnome/ar.po','/ar/terminology/gnome/ar.po','ar.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,140,35),(41,'tutorial/ar/tutorial.po','/ar/tutorial/tutorial.po','tutorial.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,141,36),(42,'terminology/mk/gnome/mk.po','/mk/terminology/gnome/mk.po','mk.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,145,37),(43,'tutorial/zu/tutorial.po','/zu/tutorial/tutorial.po','tutorial.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,147,38),(44,'terminology/az/gnome/az.po','/az/terminology/gnome/az.po','az.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,152,39),(45,'terminology/pap/essential.po','/pap/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,157,40),(46,'terminology/rw/gnome/rw.po','/rw/terminology/gnome/rw.po','rw.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,161,41),(47,'terminology/nl/gnome/nl.po','/nl/terminology/gnome/nl.po','nl.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,164,42),(48,'terminology/nn/gnome/nn.po','/nn/terminology/gnome/nn.po','nn.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,168,43),(49,'terminology/zh_CN/gnome/zh_CN.po','/zh_CN/terminology/gnome/zh_CN.po','zh_CN.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,173,44),(50,'terminology/es/essential.po','/es/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,178,45),(51,'terminology/es/gnome/es.po','/es/terminology/gnome/es.po','es.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,179,45),(52,'terminology/zh_TW/gnome/zh_TW.po','/zh_TW/terminology/gnome/zh_TW.po','zh_TW.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,183,46),(53,'terminology/ro/essential.po','/ro/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,185,47),(54,'terminology/ro/ro/gnome/ro.po','/ro/terminology/ro/gnome/ro.po','ro.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,187,47),(55,'terminology/fr/gnome/fr.po','/fr/terminology/gnome/fr.po','fr.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,193,48),(56,'tutorial/fr/tutorial.po','/fr/tutorial/tutorial.po','tutorial.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,194,49),(57,'terminology/bg/essential.po','/bg/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,196,50),(58,'terminology/sv/gnome/sv.po','/sv/terminology/gnome/sv.po','sv.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,199,51),(59,'terminology/wa/gnome/wa.po','/wa/terminology/gnome/wa.po','wa.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,202,52),(60,'terminology/ast/essential.po','/ast/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,204,53),(61,'terminology/vi/essential.po','/vi/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,206,54),(62,'terminology/vi/gnome/vi.po','/vi/terminology/gnome/vi.po','vi.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,207,54),(63,'terminology/fa/gnome/fa.po','/fa/terminology/gnome/fa.po','fa.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,214,55),(64,'terminology/hu/gnome/hu.po','/hu/terminology/gnome/hu.po','hu.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,221,56),(65,'terminology/ja/gnome/ja.po','/ja/terminology/gnome/ja.po','ja.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,224,57),(66,'terminology/sq/gnome/sq.po','/sq/terminology/gnome/sq.po','sq.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,233,58),(67,'terminology/ko/essential.po','/ko/terminology/essential.po','essential.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,236,59),(68,'terminology/kn/gnome/kn.po','/kn/terminology/gnome/kn.po','kn.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,239,60),(69,'terminology/km/GlossaryV3_2Computer.csv.po','/km/terminology/GlossaryV3_2Computer.csv.po','GlossaryV3_2Computer.csv.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:34',NULL,0,241,61),(70,'terminology/sk/gnome/sk.po','/sk/terminology/gnome/sk.po','sk.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:35',NULL,0,245,62),(71,'terminology/pl/gnome/pl.po','/pl/terminology/gnome/pl.po','pl.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:35',NULL,0,249,63),(72,'terminology/ku/gnome/ku.po','/ku/terminology/gnome/ku.po','ku.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:35',NULL,0,253,64),(73,'terminology/nb/gnome/nb.po','/nb/terminology/gnome/nb.po','nb.po','0001-01-01 00:00:00',0,'2015-12-04 20:07:35',NULL,0,260,65);
/*!40000 ALTER TABLE `pootle_store_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_store_suggestion`
--

DROP TABLE IF EXISTS `pootle_store_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_store_suggestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_f` longtext NOT NULL,
  `target_hash` varchar(32) NOT NULL,
  `translator_comment_f` longtext,
  `state` varchar(16) NOT NULL,
  `creation_time` datetime DEFAULT NULL,
  `review_time` datetime DEFAULT NULL,
  `unit_id` int(11) NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pootle_store_suggestion_f87c1787` (`target_hash`),
  KEY `pootle_store_suggestion_9ed39e2e` (`state`),
  KEY `pootle_store_suggestion_184e36bb` (`creation_time`),
  KEY `pootle_store_suggestion_15936461` (`review_time`),
  KEY `pootle_store_suggestion_e8175980` (`unit_id`),
  KEY `pootle_store_suggestion_071d8141` (`reviewer_id`),
  KEY `pootle_store_suggestion_e8701ad4` (`user_id`),
  CONSTRAINT `pootle_store_sugges_user_id_31aa04396e7abd18_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `pootle_store_su_reviewer_id_5fc785e9bdafea7c_fk_accounts_user_id` FOREIGN KEY (`reviewer_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `pootle_store_su_unit_id_25ea3655b3b52033_fk_pootle_store_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `pootle_store_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_store_suggestion`
--

LOCK TABLES `pootle_store_suggestion` WRITE;
/*!40000 ALTER TABLE `pootle_store_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `pootle_store_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pootle_store_unit`
--

DROP TABLE IF EXISTS `pootle_store_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pootle_store_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) NOT NULL,
  `unitid` longtext NOT NULL,
  `unitid_hash` varchar(32) NOT NULL,
  `source_f` longtext,
  `source_hash` varchar(32) NOT NULL,
  `source_wordcount` smallint(6) NOT NULL,
  `source_length` smallint(6) NOT NULL,
  `target_f` longtext,
  `target_wordcount` smallint(6) NOT NULL,
  `target_length` smallint(6) NOT NULL,
  `developer_comment` longtext,
  `translator_comment` longtext,
  `locations` longtext,
  `context` longtext,
  `state` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `creation_time` datetime DEFAULT NULL,
  `mtime` datetime NOT NULL,
  `submitted_on` datetime DEFAULT NULL,
  `commented_on` datetime DEFAULT NULL,
  `reviewed_on` datetime DEFAULT NULL,
  `commented_by_id` int(11) DEFAULT NULL,
  `reviewed_by_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `submitted_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pootle_store_unit_store_id_1f16b986f8b3b0db_uniq` (`store_id`,`unitid_hash`),
  KEY `pootle_store_unit_6a992d55` (`index`),
  KEY `pootle_store_unit_c72a2c70` (`unitid_hash`),
  KEY `pootle_store_unit_ef3e68f7` (`source_hash`),
  KEY `pootle_store_unit_0580d095` (`source_length`),
  KEY `pootle_store_unit_49e01d49` (`target_length`),
  KEY `pootle_store_unit_9ed39e2e` (`state`),
  KEY `pootle_store_unit_b5f927ba` (`revision`),
  KEY `pootle_store_unit_184e36bb` (`creation_time`),
  KEY `pootle_store_unit_7076b27a` (`mtime`),
  KEY `pootle_store_unit_33556236` (`submitted_on`),
  KEY `pootle_store_unit_6cd8e5e0` (`commented_on`),
  KEY `pootle_store_unit_57c82401` (`reviewed_on`),
  KEY `pootle_store_unit_4e81b95f` (`commented_by_id`),
  KEY `pootle_store_unit_efa412ac` (`reviewed_by_id`),
  KEY `pootle_store_unit_7473547c` (`store_id`),
  KEY `pootle_store_unit_31174c9a` (`submitted_by_id`),
  CONSTRAINT `pootle_store_reviewed_by_id_3465d83979f55a11_fk_accounts_user_id` FOREIGN KEY (`reviewed_by_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `pootle_store_submitted_by_id_d9706a6e0cbd854_fk_accounts_user_id` FOREIGN KEY (`submitted_by_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `pootle_store__store_id_3f45721b38b4a5bd_fk_pootle_store_store_id` FOREIGN KEY (`store_id`) REFERENCES `pootle_store_store` (`id`),
  CONSTRAINT `pootle_stor_commented_by_id_76f0bdbeae8b3595_fk_accounts_user_id` FOREIGN KEY (`commented_by_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pootle_store_unit`
--

LOCK TABLES `pootle_store_unit` WRITE;
/*!40000 ALTER TABLE `pootle_store_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `pootle_store_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_paidtask`
--

DROP TABLE IF EXISTS `reports_paidtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_paidtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` smallint(5) unsigned NOT NULL,
  `amount` double NOT NULL,
  `rate` double NOT NULL,
  `datetime` datetime NOT NULL,
  `description` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_paidtask_5361aa34` (`task_type`),
  KEY `reports_paidtask_dfeaaeb4` (`datetime`),
  KEY `reports_paidtask_e8701ad4` (`user_id`),
  CONSTRAINT `reports_paidtask_user_id_4206b32e235d6242_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_paidtask`
--

LOCK TABLES `reports_paidtask` WRITE;
/*!40000 ALTER TABLE `reports_paidtask` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_paidtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_36eec1734f431f56_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_e8701ad4` (`user_id`),
  CONSTRAINT `socialaccount_socia_user_id_3fd78aac97693583_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialapp_id` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_fe95b0a0` (`socialapp_id`),
  KEY `socialaccount_socialapp_sites_9365d6e7` (`site_id`),
  CONSTRAINT `socialaccount_socialap_site_id_a859406a22be3fe_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `soci_socialapp_id_7b02380b6127b1b8_fk_socialaccount_socialapp_id` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_697928748c2e1968_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_socialtoken_8a089c2a` (`account_id`),
  KEY `socialaccount_socialtoken_f382adfe` (`app_id`),
  CONSTRAINT `socialaccou_app_id_2125549785bd662_fk_socialaccount_socialapp_id` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `so_account_id_3fc809e243dd8c0a_fk_socialaccount_socialaccount_id` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staticpages_agreement`
--

DROP TABLE IF EXISTS `staticpages_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staticpages_agreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreed_on` datetime NOT NULL,
  `document_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staticpages_agreement_user_id_26f0568b2f8d7f1e_uniq` (`user_id`,`document_id`),
  KEY `staticpages_agreement_e7fafc10` (`document_id`),
  KEY `staticpages_agreement_e8701ad4` (`user_id`),
  CONSTRAINT `staticpages_agreeme_user_id_46ee8f824d46ba2f_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `staticp_document_id_1de59a1236db4adf_fk_staticpages_legalpage_id` FOREIGN KEY (`document_id`) REFERENCES `staticpages_legalpage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staticpages_agreement`
--

LOCK TABLES `staticpages_agreement` WRITE;
/*!40000 ALTER TABLE `staticpages_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `staticpages_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staticpages_legalpage`
--

DROP TABLE IF EXISTS `staticpages_legalpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staticpages_legalpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `virtual_path` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `url` varchar(200) NOT NULL,
  `modified_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtual_path` (`virtual_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staticpages_legalpage`
--

LOCK TABLES `staticpages_legalpage` WRITE;
/*!40000 ALTER TABLE `staticpages_legalpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `staticpages_legalpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staticpages_staticpage`
--

DROP TABLE IF EXISTS `staticpages_staticpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staticpages_staticpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `virtual_path` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `url` varchar(200) NOT NULL,
  `modified_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtual_path` (`virtual_path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staticpages_staticpage`
--

LOCK TABLES `staticpages_staticpage` WRITE;
/*!40000 ALTER TABLE `staticpages_staticpage` DISABLE KEYS */;
INSERT INTO `staticpages_staticpage` VALUES (1,1,'announcements/projects/tutorial','Project instructions','<div dir=\"ltr\" lang=\"en\">Tutorial project where users can play with Pootle and learn more about translation and localisation.<br />For more help on localisation, visit the <a href=\"http://docs.translatehouse.org/projects/localization-guide/en/latest/guide/start.html\">localisation guide</a>.</div>','','2015-12-04 20:07:33');
/*!40000 ALTER TABLE `staticpages_staticpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualfolder_virtualfolder`
--

DROP TABLE IF EXISTS `virtualfolder_virtualfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualfolder_virtualfolder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `location` varchar(255) NOT NULL,
  `filter_rules` longtext NOT NULL,
  `priority` double NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtualfolder_virtualfolder_name_3a8c70ebf46b2104_uniq` (`name`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualfolder_virtualfolder`
--

LOCK TABLES `virtualfolder_virtualfolder` WRITE;
/*!40000 ALTER TABLE `virtualfolder_virtualfolder` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualfolder_virtualfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualfolder_virtualfolder_units`
--

DROP TABLE IF EXISTS `virtualfolder_virtualfolder_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualfolder_virtualfolder_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtualfolder_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtualfolder_id` (`virtualfolder_id`,`unit_id`),
  KEY `virtualfolder_virtualfolder_units_88d242b5` (`virtualfolder_id`),
  KEY `virtualfolder_virtualfolder_units_e8175980` (`unit_id`),
  CONSTRAINT `f21bf43d0fa44a209ecb09e3587324c4` FOREIGN KEY (`virtualfolder_id`) REFERENCES `virtualfolder_virtualfolder` (`id`),
  CONSTRAINT `virtualfolder_v_unit_id_65a2b52cf92948f8_fk_pootle_store_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `pootle_store_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualfolder_virtualfolder_units`
--

LOCK TABLES `virtualfolder_virtualfolder_units` WRITE;
/*!40000 ALTER TABLE `virtualfolder_virtualfolder_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualfolder_virtualfolder_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualfolder_virtualfoldertreeitem`
--

DROP TABLE IF EXISTS `virtualfolder_virtualfoldertreeitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualfolder_virtualfoldertreeitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pootle_path` varchar(255) NOT NULL,
  `directory_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `vfolder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pootle_path` (`pootle_path`),
  UNIQUE KEY `virtualfolder_virtualfoldertre_directory_id_e030ea86bbbcb6c_uniq` (`directory_id`,`vfolder_id`),
  KEY `virtualfolder_virtualfoldertreeitem_0a37f8e3` (`directory_id`),
  KEY `virtualfolder_virtualfoldertreeitem_6be37982` (`parent_id`),
  KEY `virtualfolder_virtualfoldertreeitem_62619014` (`vfolder_id`),
  CONSTRAINT `D07fa3b473342bf298e57cbabf788a31` FOREIGN KEY (`parent_id`) REFERENCES `virtualfolder_virtualfoldertreeitem` (`id`),
  CONSTRAINT `virtual_directory_id_1d872723675582bd_fk_pootle_app_directory_id` FOREIGN KEY (`directory_id`) REFERENCES `pootle_app_directory` (`id`),
  CONSTRAINT `vi_vfolder_id_7214bf6e367eb790_fk_virtualfolder_virtualfolder_id` FOREIGN KEY (`vfolder_id`) REFERENCES `virtualfolder_virtualfolder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualfolder_virtualfoldertreeitem`
--

LOCK TABLES `virtualfolder_virtualfoldertreeitem` WRITE;
/*!40000 ALTER TABLE `virtualfolder_virtualfoldertreeitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualfolder_virtualfoldertreeitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtualfolder_virtualfoldertreeitem_stores`
--

DROP TABLE IF EXISTS `virtualfolder_virtualfoldertreeitem_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtualfolder_virtualfoldertreeitem_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtualfoldertreeitem_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtualfoldertreeitem_id` (`virtualfoldertreeitem_id`,`store_id`),
  KEY `virtualfolder_virtualfoldertreeitem_stores_8492130a` (`virtualfoldertreeitem_id`),
  KEY `virtualfolder_virtualfoldertreeitem_stores_7473547c` (`store_id`),
  CONSTRAINT `D34c8423f8770f970927153122f2d124` FOREIGN KEY (`virtualfoldertreeitem_id`) REFERENCES `virtualfolder_virtualfoldertreeitem` (`id`),
  CONSTRAINT `virtualfolder__store_id_633c770116223cf_fk_pootle_store_store_id` FOREIGN KEY (`store_id`) REFERENCES `pootle_store_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtualfolder_virtualfoldertreeitem_stores`
--

LOCK TABLES `virtualfolder_virtualfoldertreeitem_stores` WRITE;
/*!40000 ALTER TABLE `virtualfolder_virtualfoldertreeitem_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtualfolder_virtualfoldertreeitem_stores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-04 21:02:19
