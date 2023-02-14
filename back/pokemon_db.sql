-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for osx10.15 (x86_64)
--
-- Host: localhost    Database: pokemon
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add test_pkm',7,'add_test_pkm'),(26,'Can change test_pkm',7,'change_test_pkm'),(27,'Can delete test_pkm',7,'delete_test_pkm'),(28,'Can view test_pkm',7,'view_test_pkm'),(29,'Can add pokemon',8,'add_pokemon'),(30,'Can change pokemon',8,'change_pokemon'),(31,'Can delete pokemon',8,'delete_pokemon'),(32,'Can view pokemon',8,'view_pokemon'),(33,'Can add battle_item',9,'add_battle_item'),(34,'Can change battle_item',9,'change_battle_item'),(35,'Can delete battle_item',9,'delete_battle_item'),(36,'Can view battle_item',9,'view_battle_item'),(37,'Can add item',10,'add_item'),(38,'Can change item',10,'change_item'),(39,'Can delete item',10,'delete_item'),(40,'Can view item',10,'view_item'),(41,'Can add skill',11,'add_skill'),(42,'Can change skill',11,'change_skill'),(43,'Can delete skill',11,'delete_skill'),(44,'Can view skill',11,'view_skill'),(45,'Can add pkm_item',12,'add_pkm_item'),(46,'Can change pkm_item',12,'change_pkm_item'),(47,'Can delete pkm_item',12,'delete_pkm_item'),(48,'Can view pkm_item',12,'view_pkm_item'),(49,'Can add pkm_ballte_item',13,'add_pkm_ballte_item'),(50,'Can change pkm_ballte_item',13,'change_pkm_ballte_item'),(51,'Can delete pkm_ballte_item',13,'delete_pkm_ballte_item'),(52,'Can view pkm_ballte_item',13,'view_pkm_ballte_item'),(53,'Can add pkm_battle_item',13,'add_pkm_battle_item'),(54,'Can change pkm_battle_item',13,'change_pkm_battle_item'),(55,'Can delete pkm_battle_item',13,'delete_pkm_battle_item'),(56,'Can view pkm_battle_item',13,'view_pkm_battle_item'),(57,'Can add evolution',14,'add_evolution'),(58,'Can change evolution',14,'change_evolution'),(59,'Can delete evolution',14,'delete_evolution'),(60,'Can view evolution',14,'view_evolution'),(61,'Can add news',15,'add_news'),(62,'Can change news',15,'change_news'),(63,'Can delete news',15,'delete_news'),(64,'Can view news',15,'view_news');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$260000$4IcEqNXBd9b5gkduyCuOSl$//Z5Z/P1Bsr9r75ISigYpTQykSoZIOjQTn3PJdLigv4=','2021-09-20 21:43:17.729327',1,'pkmgg','','','',1,1,'2021-09-20 16:18:30.272730');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=791 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (768,'2021-09-20 21:45:05.523853','23','윽우지',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(769,'2021-09-20 21:45:21.010880','22','백솜모카',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(770,'2021-09-20 21:45:42.584838','21','파이어로',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(771,'2021-09-20 21:46:26.781983','20','루카리오',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(772,'2021-09-20 21:46:43.649564','19','앱솔',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(773,'2021-09-20 21:46:57.169341','18','해피너스',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(774,'2021-09-20 21:47:11.758587','17','괴력몬',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(775,'2021-09-20 21:47:35.710695','16','푸크린',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(776,'2021-09-20 21:47:55.910375','15','피카츄',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(777,'2021-09-20 21:48:12.337962','14','거북왕',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(778,'2021-09-20 21:48:28.413190','13','리자몽',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(779,'2021-09-20 21:48:46.760075','12','한카리아스',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(780,'2021-09-20 21:49:03.946379','11','마임맨',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(781,'2021-09-20 21:49:17.170410','10','팬텀',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(782,'2021-09-20 21:49:37.828004','9','에이스번',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(783,'2021-09-20 21:49:52.906397','8','제라오라',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(784,'2021-09-20 21:50:11.072964','7','개굴닌자',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(785,'2021-09-20 21:50:32.244026','6','암팰리스',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(786,'2021-09-20 21:50:44.431323','5','야도란',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(787,'2021-09-20 21:51:09.299674','4','알로라 나인테일',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(788,'2021-09-20 21:51:22.914451','3','이상해꽃',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(789,'2021-09-20 21:51:39.216020','2','잠만보',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2),(790,'2021-09-20 21:51:55.089036','1','가디안',2,'[{\"changed\": {\"fields\": [\"En name\", \"En type\"]}}]',8,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'pokemon','battle_item'),(14,'pokemon','evolution'),(10,'pokemon','item'),(15,'pokemon','news'),(13,'pokemon','pkm_battle_item'),(12,'pokemon','pkm_item'),(8,'pokemon','pokemon'),(11,'pokemon','skill'),(7,'pokemon','test_pkm'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-08-19 04:30:12.159693'),(2,'auth','0001_initial','2021-08-19 04:30:12.461498'),(3,'admin','0001_initial','2021-08-19 04:30:12.523800'),(4,'admin','0002_logentry_remove_auto_add','2021-08-19 04:30:12.532376'),(5,'admin','0003_logentry_add_action_flag_choices','2021-08-19 04:30:12.539198'),(6,'contenttypes','0002_remove_content_type_name','2021-08-19 04:30:12.583640'),(7,'auth','0002_alter_permission_name_max_length','2021-08-19 04:30:12.608226'),(8,'auth','0003_alter_user_email_max_length','2021-08-19 04:30:12.629485'),(9,'auth','0004_alter_user_username_opts','2021-08-19 04:30:12.637102'),(10,'auth','0005_alter_user_last_login_null','2021-08-19 04:30:12.662365'),(11,'auth','0006_require_contenttypes_0002','2021-08-19 04:30:12.664835'),(12,'auth','0007_alter_validators_add_error_messages','2021-08-19 04:30:12.674301'),(13,'auth','0008_alter_user_username_max_length','2021-08-19 04:30:12.693955'),(14,'auth','0009_alter_user_last_name_max_length','2021-08-19 04:30:12.713831'),(15,'auth','0010_alter_group_name_max_length','2021-08-19 04:30:12.733310'),(16,'auth','0011_update_proxy_permissions','2021-08-19 04:30:12.742583'),(17,'auth','0012_alter_user_first_name_max_length','2021-08-19 04:30:12.765553'),(18,'sessions','0001_initial','2021-08-19 04:30:12.796556'),(19,'pokemon','0001_initial','2021-08-19 04:54:52.448590'),(20,'pokemon','0002_test_pkm_img','2021-08-19 04:54:52.473250'),(21,'pokemon','0003_alter_test_pkm_img','2021-08-19 04:54:52.477782'),(22,'pokemon','0004_test_pkm_type','2021-08-19 09:25:05.284628'),(23,'pokemon','0005_alter_test_pkm_type','2021-08-19 09:25:05.288977'),(24,'pokemon','0006_delete_test_pkm','2021-08-24 07:18:29.391844'),(25,'pokemon','0007_pokemon','2021-08-24 07:44:18.948194'),(26,'pokemon','0008_auto_20210824_0725','2021-08-24 07:44:19.001686'),(27,'pokemon','0009_battle_item_item_pkm_ballte_item_pkm_item_skill','2021-08-24 07:44:19.134797'),(28,'pokemon','0010_pokemon_passive_img','2021-08-24 07:52:49.847685'),(29,'pokemon','0011_alter_pokemon_passive_img','2021-08-24 07:52:49.852056'),(30,'pokemon','0012_alter_skill_count','2021-08-24 07:54:54.728697'),(31,'pokemon','0013_skill_description','2021-08-24 07:57:40.560127'),(32,'pokemon','0014_auto_20210830_1233','2021-08-30 12:34:30.045961'),(33,'pokemon','0015_alter_item_effect_description','2021-08-30 12:34:30.050094'),(34,'pokemon','0016_auto_20210830_1235','2021-08-30 12:35:41.648380'),(35,'pokemon','0017_auto_20210830_1259','2021-08-30 13:00:17.028022'),(36,'pokemon','0018_item_img','2021-08-31 04:35:21.669240'),(37,'pokemon','0019_rename_pkm_ballte_item_pkm_battle_item','2021-08-31 08:03:49.261065'),(38,'pokemon','0020_auto_20210901_1049','2021-09-01 10:50:32.400518'),(39,'pokemon','0021_evolution_name','2021-09-02 04:00:16.374144'),(40,'pokemon','0022_auto_20210902_0402','2021-09-02 04:03:05.819146'),(41,'pokemon','0023_auto_20210902_0404','2021-09-02 04:04:33.490446'),(42,'pokemon','0024_item_type','2021-09-03 07:02:51.622545'),(43,'pokemon','0025_news','2021-09-03 09:15:18.318054'),(44,'pokemon','0026_auto_20210908_0226','2021-09-08 02:27:02.092281'),(45,'pokemon','0027_auto_20210908_0229','2021-09-08 02:29:33.842839'),(46,'pokemon','0028_pokemon_detail_img','2021-09-15 05:21:17.817046'),(47,'pokemon','0029_auto_20210916_0630','2021-09-16 06:30:54.510140'),(48,'pokemon','0030_auto_20210918_1008','2021-09-18 10:08:10.202552'),(49,'pokemon','0031_auto_20210918_1036','2021-09-18 10:36:52.265985'),(50,'pokemon','0032_pkm_item_pokemon item','2021-09-20 08:08:21.432620'),(51,'pokemon','0033_auto_20210920_0810','2021-09-20 08:11:04.600432'),(52,'pokemon','0034_auto_20210920_2118','2021-09-20 21:40:14.045385');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4pmy1pasuw2owb72lpusjwerhrrjq8ee','.eJxVjEEOwiAQRe_C2hBApgWX7nsGMsNMpGogKe3KeHdt0oVu_3vvv1TCbS1p67KkmdVFWXX63QjzQ-oO-I711nRudV1m0ruiD9r11Fie18P9OyjYy7f2yAjWZ7KAAOQNs-FxAEd5wOg4RHY2OIo-nznKyGQEMov1AUWsUe8P8ps4fQ:1mIUDU:aZPA_88sss1whieJD1b9gwsNL9YF6NGAAV7MRKvaB7U','2021-09-07 11:03:40.399290'),('847t9d0yose73csibh14z6kqy2t1twwk','.eJxVjEEOwiAQRe_C2hBApgWX7nsGMsNMpGogKe3KeHdt0oVu_3vvv1TCbS1p67KkmdVFWXX63QjzQ-oO-I711nRudV1m0ruiD9r11Fie18P9OyjYy7f2yAjWZ7KAAOQNs-FxAEd5wOg4RHY2OIo-nznKyGQEMov1AUWsUe8P8ps4fQ:1mLdvV:eywrC_Cg5FpPeMBi7hdBjveFhxRw5wKiN0UHYHtFrSQ','2021-09-16 04:02:09.628210'),('ccg7czmrjwzdcpjvl1yyzx15w0adicni','.eJxVjEEOwiAQRe_C2hBApgWX7nsGMsNMpGogKe3KeHdt0oVu_3vvv1TCbS1p67KkmdVFWXX63QjzQ-oO-I711nRudV1m0ruiD9r11Fie18P9OyjYy7f2yAjWZ7KAAOQNs-FxAEd5wOg4RHY2OIo-nznKyGQEMov1AUWsUe8P8ps4fQ:1mSDAA:HnGn52j8e24-O_dMi7LCv4VM0eqgxD3qXq5eqr9ENro','2021-10-04 06:52:26.130804'),('m1mdwwcewvum1k6y740en767vkbqlzdv','.eJxVjEEOwiAQRe_C2hBApgWX7nsGMsNMpGogKe3KeHdt0oVu_3vvv1TCbS1p67KkmdVFWXX63QjzQ-oO-I711nRudV1m0ruiD9r11Fie18P9OyjYy7f2yAjWZ7KAAOQNs-FxAEd5wOg4RHY2OIo-nznKyGQEMov1AUWsUe8P8ps4fQ:1mSCdI:UXU17c_TfwZDR_-MNC6Z62GnHWLwSDPS4qJZ4QlthYA','2021-10-04 06:18:28.808850'),('ndcf52bud47q6cv0bs2xxjymjt7be67j','.eJxVjEEOwiAQRe_C2hBApgWX7nsGMsNMpGogKe3KeHdt0oVu_3vvv1TCbS1p67KkmdVFWXX63QjzQ-oO-I711nRudV1m0ruiD9r11Fie18P9OyjYy7f2yAjWZ7KAAOQNs-FxAEd5wOg4RHY2OIo-nznKyGQEMov1AUWsUe8P8ps4fQ:1mNnK0:rc3uP0DON903xuYUUbejE0BHq-t5X9IJU6ACw0fsHs0','2021-09-22 02:28:20.447357'),('s1dgj42rck56vjypfymczt6wudil31rj','.eJxVjEEOwiAQRe_C2hBApgWX7nsGMsNMpGogKe3KeHdt0oVu_3vvv1TCbS1p67KkmdVFWXX63QjzQ-oO-I711nRudV1m0ruiD9r11Fie18P9OyjYy7f2yAjWZ7KAAOQNs-FxAEd5wOg4RHY2OIo-nznKyGQEMov1AUWsUe8P8ps4fQ:1mRQS1:QEkj9r_X1hmmCxC9TmXP96mVBk1zUpcWWOT7i8zar9g','2021-10-02 02:51:37.601152'),('t5vpa8t97evs9a28exzbn2tnuiuzlplo','.eJxVjEEOwiAQRe_C2hBApgWX7nsGMsNMpGogKe3KeHdt0oVu_3vvv1TCbS1p67KkmdVFWXX63QjzQ-oO-I711nRudV1m0ruiD9r11Fie18P9OyjYy7f2yAjWZ7KAAOQNs-FxAEd5wOg4RHY2OIo-nznKyGQEMov1AUWsUe8P8ps4fQ:1mSDff:pdWrHem-tS7LGm0ZtftrTV2n3OAVFy3Vb1phrMXJL6Y','2021-10-04 07:24:59.216023'),('vypngphln5xyjmraaum0jrwgbpcl58jo','.eJxVjDEOwjAMRe-SGUUoTohhZOcMkWM7pIBSqWknxN1ppQ6w_vfef5tEy1zT0nVKg5iLcebwu2Xip7YNyIPafbQ8tnkast0Uu9Nub6Po67q7fweVel3rjGd1MaCnkiWzhAiA0ZNzQY5YEIhOgiDsPCBGLAzKzMLqV4vEfL7zhjjT:1mSR4H:gm_On-O6kvunpjqrCvzo_B9yNC4LIhLKU2FoB5LlYlU','2021-10-04 21:43:17.731731');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_battle_item`
--

DROP TABLE IF EXISTS `pokemon_battle_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_battle_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `img` varchar(200) NOT NULL,
  `level` int NOT NULL,
  `effect` longtext NOT NULL,
  `cooltime` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_battle_item`
--

LOCK TABLES `pokemon_battle_item` WRITE;
/*!40000 ALTER TABLE `pokemon_battle_item` DISABLE KEYS */;
INSERT INTO `pokemon_battle_item` VALUES (1,'상처약','http://pkm.gg/static/pokemon/img/battle-items/Potion.png',4,'자신의 포켓몬의 HP를 조금 회복한다.','30'),(2,'플러스파워','http://pkm.gg/static/pokemon/img/battle-items/X-Attack.png',7,'자신의 포켓몬의 공격과 특수공격이 잠시 동안 오른다.','40'),(3,'스피드업','http://pkm.gg/static/pokemon/img/battle-items/X-Speed.png',8,'자신의 포켓몬의 이동 속도를 잠시 동안 올린다.\r\n또한 잠시 동안 이동 속도가 떨어지지 않는다.','50'),(4,'에나비꼬리','http://pkm.gg/static/pokemon/img/battle-items/Fluffy-Tail.png',10,'야생 포켓몬을 잠시 동안 행동할 수 없게 만들고 그 포켓몬에게 주는 데미지도 증가한다.','25'),(5,'탈출버튼','http://pkm.gg/static/pokemon/img/battle-items/Eject-Button.png',11,'자신의 포켓몬을 지정한 방향으로 즉시 이동시킨다.','70'),(6,'둔화스모크','http://pkm.gg/static/pokemon/img/battle-items/Slow-Smoke.png',13,'연막을 뿌려서 상대편 포켓몬의 이동 속도를 잠시 동안 크게 떨어뜨린다.','40'),(7,'만병통치제','http://pkm.gg/static/pokemon/img/battle-items/Full-Heal.png',14,'자신의 포켓몬의 상태 이상을 회복한 뒤 잠시 동안 방해받지 않도록 만든다.','40'),(8,'골가속장치','http://pkm.gg/static/pokemon/img/battle-items/Goal-Getter.png',16,'잠시 동안 골 속도가 2배로 증가한다.','90');
/*!40000 ALTER TABLE `pokemon_battle_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_evolution`
--

DROP TABLE IF EXISTS `pokemon_evolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_evolution` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `img` varchar(200) NOT NULL,
  `level` int NOT NULL,
  `pkm_id_id` bigint NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pokemon_evolution_pkm_id_id_f9f02076_fk_pokemon_pokemon_id` (`pkm_id_id`),
  CONSTRAINT `pokemon_evolution_pkm_id_id_f9f02076_fk_pokemon_pokemon_id` FOREIGN KEY (`pkm_id_id`) REFERENCES `pokemon_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_evolution`
--

LOCK TABLES `pokemon_evolution` WRITE;
/*!40000 ALTER TABLE `pokemon_evolution` DISABLE KEYS */;
INSERT INTO `pokemon_evolution` VALUES (1,'http://pkm.gg/static/pokemon/img/pokemon/gardevoir/gardevoir.png',6,1,'랄토스'),(2,'http://pkm.gg/static/pokemon/img/pokemon/gardevoir/gardevoir.png',10,1,'킬리아'),(4,'http://pkm.gg/static/pokemon/img/pokemon/venusaur/evolution-1-bulbasaur.png',5,3,'이상해씨'),(5,'http://pkm.gg/static/pokemon/img/pokemon/venusaur/evolution-2-ivysaur.png',9,3,'이상해풀'),(6,'http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/evolution-1-alolan-vulpix.png',4,4,'알로라 식스테일'),(7,'http://pkm.gg/static/pokemon/img/pokemon/slowbro/evolution-1-slowpoke.png',4,5,'야돈'),(8,'http://pkm.gg/static/pokemon/img/pokemon/crustle/evolution-1-dweeble.png',4,6,'돌살이'),(9,'http://pkm.gg/static/pokemon/img/pokemon/greninja/evolution-1-froakie.png',5,7,'개구마르'),(10,'http://pkm.gg/static/pokemon/img/pokemon/greninja/evolution-2-frogadier.png',7,7,'개굴반장'),(11,'http://pkm.gg/static/pokemon/img/pokemon/cinderace/evolution-1-scorbunny.png',5,9,'염버니'),(12,'http://pkm.gg/static/pokemon/img/pokemon/cinderace/evolution-2-raboot.png',7,9,'래비풋'),(13,'http://pkm.gg/static/pokemon/img/pokemon/gengar/evolution-1-gastly.png',5,10,'고오스'),(14,'http://pkm.gg/static/pokemon/img/pokemon/gengar/evolution-2-haunter.png',9,10,'고우스트'),(15,'http://pkm.gg/static/pokemon/img/pokemon/garchomp/evolution-1-gible.png',6,12,'딥상어둥'),(16,'http://pkm.gg/static/pokemon/img/pokemon/garchomp/evolution-2-gabite.png',10,12,'한바이트'),(17,'http://pkm.gg/static/pokemon/img/pokemon/charizard/evolution-1-charmander.png',5,13,'파이리'),(18,'http://pkm.gg/static/pokemon/img/pokemon/charizard/evolution-2-charmeleon.png',9,13,'리자드'),(19,'http://pkm.gg/static/pokemon/img/pokemon/blastoise/evolution-1-squirtle.png',5,14,'꼬부기'),(20,'http://pkm.gg/static/pokemon/img/pokemon/blastoise/evolution-2-wartortle.png',9,14,'어니부기'),(21,'http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/evolution-1-jigglypuff.png',4,16,'푸린'),(22,'http://pkm.gg/static/pokemon/img/pokemon/machamp/evolution-1-machop.png',5,17,'알통몬'),(23,'http://pkm.gg/static/pokemon/img/pokemon/machamp/evolution-2-machoke.png',9,17,'근육몬'),(24,'http://pkm.gg/static/pokemon/img/pokemon/blissey/evolution-1-chansey.png',4,18,'럭키'),(25,'http://pkm.gg/static/pokemon/img/pokemon/talonflame/evolution-1-fletchling.png',5,21,'화살꼬빈'),(26,'http://pkm.gg/static/pokemon/img/pokemon/talonflame/evolution-2-fletchinder.png',7,21,'불화살빈'),(27,'http://pkm.gg/static/pokemon/img/pokemon/eldegoss/evolution-1-gossifleur.png',4,22,'꼬모카');
/*!40000 ALTER TABLE `pokemon_evolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_item`
--

DROP TABLE IF EXISTS `pokemon_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `effect_1` varchar(10) NOT NULL,
  `effect_2` varchar(10) NOT NULL,
  `effect_3` varchar(10) NOT NULL,
  `effect_description` varchar(10) NOT NULL,
  `status_1` varchar(40) NOT NULL,
  `status_10` varchar(40) NOT NULL,
  `status_11` varchar(40) NOT NULL,
  `status_12` varchar(40) NOT NULL,
  `status_13` varchar(40) NOT NULL,
  `status_14` varchar(40) NOT NULL,
  `status_15` varchar(40) NOT NULL,
  `status_16` varchar(40) NOT NULL,
  `status_17` varchar(40) NOT NULL,
  `status_18` varchar(40) NOT NULL,
  `status_19` varchar(40) NOT NULL,
  `status_2` varchar(40) NOT NULL,
  `status_20` varchar(40) NOT NULL,
  `status_21` varchar(40) NOT NULL,
  `status_22` varchar(40) NOT NULL,
  `status_23` varchar(40) NOT NULL,
  `status_24` varchar(40) NOT NULL,
  `status_25` varchar(40) NOT NULL,
  `status_26` varchar(40) NOT NULL,
  `status_27` varchar(40) NOT NULL,
  `status_28` varchar(40) NOT NULL,
  `status_29` varchar(40) NOT NULL,
  `status_3` varchar(40) NOT NULL,
  `status_30` varchar(40) NOT NULL,
  `status_4` varchar(40) NOT NULL,
  `status_5` varchar(40) NOT NULL,
  `status_6` varchar(40) NOT NULL,
  `status_7` varchar(40) NOT NULL,
  `status_8` varchar(40) NOT NULL,
  `status_9` varchar(40) NOT NULL,
  `img` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_item`
--

LOCK TABLES `pokemon_item` WRITE;
/*!40000 ALTER TABLE `pokemon_item` DISABLE KEYS */;
INSERT INTO `pokemon_item` VALUES (1,'기합의머리띠','HP가 낮아졌을 때 3초 동안 그때까지 줄어든 HP의 8% / 11% / 14%를 매초마다 회복한다.','8%','11%','14%','HP','방어 +2 / 특수방어 +0','방어 +10 / 특수방어 +10','방어 +12 / 특수방어 +10','방어 +12 / 특수방어 +12','방어 +14 / 특수방어 +12','방어 +14 / 특수방어 +14','방어 +16 / 특수방어 +14','방어 +16 / 특수방어 +16','방어 +18 / 특수방어 +16','방어 +18 / 특수방어 +18','방어 +20 / 특수방어 +18','방어 +2 / 특수방어 +2','방어 +20 / 특수방어 +20','방어 +22 / 특수방어 +20','방어 +22 / 특수방어 +22','방어 +24 / 특수방어 +22','방어 +24 / 특수방어 +24','방어 +26 / 특수방어 +24','방어 +26 / 특수방어 +26','방어 +28 / 특수방어 +26','방어 +28 / 특수방어 +28','방어 +30 / 특수방어 +28','방어 +4 / 특수방어 +2','방어 +30 / 특수방어 +30','방어 +4 / 특수방어 +4','방어 +6 / 특수방어 +4','방어 +6 / 특수방어 +6','방어 +8 / 특수방어 +6','방어 +8 / 특수방어 +8','방어 +10 / 특수방어 +8','http://pkm.gg/static/pokemon/img/held-items/Focus-Band.png','방어'),(2,'울퉁불퉁멧','어느 정도 데미지를 받으면 주변에 있는 상대편 포켓몬에게 각 포켓몬 최대 HP의 3% / 4% / 5%에 해당하는 데미지를 준다.','3%','4%','5%','최대 HP','HP +18 / 방어 +0','HP +90 / 방어 +14.0','HP +108 / 방어 +14.0','HP +108 / 방어 +16.8','HP +126 / 방어 +16.8','HP +126 / 방어 +19.6','HP +144 / 방어 +19.6','HP +144 / 방어 +22.4','HP +162 / 방어 +22.4','HP +162 / 방어 +25.2','HP +180 / 방어 +25.2','HP +18 / 방어 +2.8','HP +180 / 방어 +28.0','HP +198 / 방어 +28.0','HP +198 / 방어 +30.8','HP +216 / 방어 +30.8','HP +216 / 방어 +33.6','HP +234 / 방어 +33.6','HP +234 / 방어 +36.4','HP +252 / 방어 +36.4','HP +252 / 방어 +39.2','HP +270 / 방어 +39.2','HP +36 / 방어 +2.8','HP +270 / 방어 +42.0','HP +36 / 방어 +5.6','HP +54 / 방어 +5.6','HP +54 / 방어 +8.4','HP +72 / 방어 +8.4','HP +72 / 방어 +11.2','HP +90 / 방어 +11.2','http://pkm.gg/static/pokemon/img/held-items/Rocky-Helmet.png','방어'),(3,'돌격조끼','전투에서 벗어나 있는 동안 특수공격에 의한 데미지를 무효로 하는 실드를 최대 HP의 9% / 12% / 15% 만큼 얻을 수 있다.','9%','12%','15%','실드','HP +18 / 특수방어 +0','HP +90 / 특수방어 +14.0','HP +108 / 특수방어 +14.0','HP +108 / 특수방어 +16.8','HP +126 / 특수방어 +16.8','HP +126 / 특수방어 +19.6','HP +144 / 특수방어 +19.6','HP +144 / 특수방어 +22.4','HP +162 / 특수방어 +22.4','HP +162 / 특수방어 +25.2','HP +180 / 특수방어 +25.2','HP +18 / 특수방어 +2.8','HP +180 / 특수방어 +28.0','HP +198 / 특수방어 +28.0','HP +198 / 특수방어 +30.8','HP +216 / 특수방어 +30.8','HP +216 / 특수방어 +33.6','HP +234 / 특수방어 +33.6','HP +234 / 특수방어 +36.4','HP +252 / 특수방어 +36.4','HP +252 / 특수방어 +39.2','HP +270 / 특수방어 +39.2','HP +36 / 특수방어 +2.8','HP +270 / 특수방어 +42.0','HP +36 / 특수방어 +5.6','HP +54 / 특수방어 +5.6','HP +54 / 특수방어 +8.4','HP +72 / 특수방어 +8.4','HP +72 / 특수방어 +11.2','HP +90 / 특수방어 +11.2','http://pkm.gg/static/pokemon/img/held-items/Assault-Vest.png','방어'),(4,'학습장치','자신의 경험치가 같은 팀에서 가장 낮은 동안 1초가 지날 때마다 얻는 경험치가 2 / 3 / 4 증가한다.\r\n또한 가까이에 있는 팀원이 야생 포켓몬을 KO 시킬 때 KO 시킨 팀원이 얻는 경험치가 조금 많아진다.','2','3','4','경험치','HP +16 / 이동 속도 +0','HP +80 / 이동 속도 +50','HP +96 / 이동 속도 +50','HP +96 / 이동 속도 +60','HP +112 / 이동 속도 +60','HP +112 / 이동 속도 +70','HP +128 / 이동 속도 +70','HP +128 / 이동 속도 +80','HP +144 / 이동 속도 +80','HP +144 / 이동 속도 +90','HP +160 / 이동 속도 +90','HP +16 / 이동 속도 +10','HP +160 / 이동 속도 +100','HP +176 / 이동 속도 +100','HP +176 / 이동 속도 +110','HP +192 / 이동 속도 +110','HP +192 / 이동 속도 +120','HP +208 / 이동 속도 +120','HP +208 / 이동 속도 +130','HP +224 / 이동 속도 +130','HP +224 / 이동 속도 +140','HP +240 / 이동 속도 +140','HP +32 / 이동 속도 +10','HP +240 / 이동 속도 +150','HP +32 / 이동 속도 +20','HP +48 / 이동 속도 +20','HP +48 / 이동 속도 +30','HP +64 / 이동 속도 +30','HP +64 / 이동 속도 +40','HP +80 / 이동 속도 +40','http://pkm.gg/static/pokemon/img/held-items/Exp-Share.png','그 외'),(5,'진격안경','골을 넣으면 특수공격이 8 /12 / 16 오른다.','8','12','16','특수공격','특수 공격 +0.8','특수 공격 +8.0','특수 공격 +8.8','특수 공격 +9.6','특수 공격 +10.4','특수 공격 +11.2','특수 공격 +12.0','특수 공격 +12.8','특수 공격 +13.6','특수 공격 +14.4','특수 공격 +15.2','특수 공격 +1.6','특수 공격 +16.0','특수 공격 +16.8','특수 공격 +17.6','특수 공격 +18.4','특수 공격 +19.2','특수 공격 +20.0','특수 공격 +20.8','특수 공격 +21.6','특수 공격 +22.4','특수 공격 +23.2','특수 공격 +2.4','특수 공격 +24.0','특수 공격 +3.2','특수 공격 +4.0','특수 공격 +4.8','특수 공격 +5.6','특수 공격 +6.4','특수 공격 +7.2','http://pkm.gg/static/pokemon/img/held-items/Special-Attack-Specs.png','스코어'),(6,'맹공덤벨','골을 넣으면 공격이 6 / 9 / 12 오른다.','6','9','12','공격','공격 +0.6','공격 +6.0','공격 +6.6','공격 +7.2','공격 +7.8','공격 +8.4','공격 +9.0','공격 +9.6','공격 +10.2','공격 +10.8','공격 +11.4','공격 +1.2','공격 +12.0','공격 +12.6','공격 +13.2','공격 +13.8','공격 +14.4','공격 +15.0','공격 +15.6','공격 +16.2','공격 +16.8','공격 +17.4','공격 +1.8','공격 +18.0','공격 +2.4','공격 +3.0','공격 +3.6','공격 +4.2','공격 +4.8','공격 +5.4','http://pkm.gg/static/pokemon/img/held-items/Attack-Weight.png','스코어'),(7,'에오스비스킷','골을 넣으면 최대 HP가 100 / 150 / 200 증가한다.','100','150','200','HP','HP +8','HP +80','HP +88','HP +96','HP +104','HP +112','HP +120','HP +128','HP +136','HP +144','HP +152','HP +16','HP +160','HP +168','HP +176','HP +184','HP +192','HP +200','HP +208','HP +216','HP +224','HP +232','HP +24','HP +240','HP +32','HP +40','HP +48','HP +56','HP +64','HP +72','http://pkm.gg/static/pokemon/img/held-items/Aeos-Cookie.png','스코어'),(8,'골서포터','골을 넣으려고 할 때 최대 HP의 5% / 7.5% / 10%에 해당하는 실드 효과를 얻는다. 실드 효과가 유효한 동안에는 골을 방해받지 않게 된다.','5%','7.5%','10%','실드','HP +15','HP +150','HP +165','HP +180','HP +195','HP +210','HP +225','HP +240','HP +255','HP +270','HP +285','HP +30','HP +300','HP +315','HP +330','HP +345','HP +360','HP +375','HP +390','HP +405','HP +420','HP +435','HP +45','HP +450','HP +60','HP +75','HP +90','HP +105','HP +120','HP +135','http://pkm.gg/static/pokemon/img/held-items/Score-Shield.png','스코어'),(9,'도움배리어','유나이트 기술을 사용하면 자신과 주변에서 HP가 가장 적은 같은 편 포켓몬에게 각각의 최대 HP의 20% / 30% / 40% 에 해당하는 실드 효과를 부여한다.','20%','30%','40%','실드','HP +20','HP +200','HP +220','HP +240','HP +260','HP +280','HP +300','HP +320','HP +340','HP +360','HP +380','HP +40','HP +400','HP +420','HP +440','HP +460','HP +480','HP +500','HP +520','HP +540','HP +560','HP +580','HP +60','HP +600','HP +80','HP +100','HP +120','HP +140','HP +160','HP +180','http://pkm.gg/static/pokemon/img/held-items/Buddy-Barrier.png','그 외'),(10,'가벼운돌','전투에서 벗어나 있는 동안 이동 속도가 10% / 15% / 20% 오른다.','10%','15%','20%','이동속도','공격 +1.6 / 이동 속도 +0','공격 +8.0 / 이동 속도 +40','공격 +9.6 / 이동 속도 +40','공격 +9.6 / 이동 속도 +48','공격 +11.2 / 이동 속도 +48','공격 +11.2 / 이동 속도 +56','공격 +12.8 / 이동 속도 +56','공격 +12.8 / 이동 속도 +64','공격 +14.4 / 이동 속도 +64','공격 +14.4 / 이동 속도 +72','공격 +16.0 / 이동 속도 +72','공격 +1.6 / 이동 속도 +8','공격 +16.0 / 이동 속도 +80','공격 +17.6 / 이동 속도 +80','공격 +17.6 / 이동 속도 +88','공격 +19.2 / 이동 속도 +88','공격 +19.2 / 이동 속도 +96','공격 +20.8 / 이동 속도 +96','공격 +20.8 / 이동 속도 +104','공격 +22.4 / 이동 속도 +104','공격 +22.4 / 이동 속도 +112','공격 +24.0 / 이동 속도 +112','공격 +3.2 / 이동 속도 +8','공격 +24.0 / 이동 속도 +120','공격 +3.2 / 이동 속도 +16','공격 +4.8 / 이동 속도 +16','공격 +4.8 / 이동 속도 +24','공격 +6.4 / 이동 속도 +24','공격 +6.4 / 이동 속도 +32','공격 +8.0 / 이동 속도 +32','http://pkm.gg/static/pokemon/img/held-items/Float-Stone.png','그 외'),(11,'에너지증폭기','유나이트 기술을 사용하면 주는 데미지가 잠시 동안 7% / 14% / 21% 증가한다.','7%','14%','21%','데미지 증가','유나이트 기술 게이지 수집률 +0.4% / 대기 시간 -0.0%','유나이트 기술 게이지 수집률 +2.0% / 대기 시간 -1.5%','유나이트 기술 게이지 수집률 +2.4% / 대기 시간 -1.5%','유나이트 기술 게이지 수집률 +2.4% / 대기 시간 -1.8%','유나이트 기술 게이지 수집률 +2.8% / 대기 시간 -1.8%','유나이트 기술 게이지 수집률 +2.8% / 대기 시간 -2.1%','유나이트 기술 게이지 수집률 +3.2% / 대기 시간 -2.1%','유나이트 기술 게이지 수집률 +3.2% / 대기 시간 -2.4%','유나이트 기술 게이지 수집률 +3.6% / 대기 시간 -2.4%','유나이트 기술 게이지 수집률 +3.6% / 대기 시간 -2.7%','유나이트 기술 게이지 수집률 +4.0% / 대기 시간 -2.7%','유나이트 기술 게이지 수집률 +0.4% / 대기 시간 -0.3%','유나이트 기술 게이지 수집률 +4.0% / 대기 시간 -%3.0','유나이트 기술 게이지 수집률 +4.4% / 대기 시간 -3.0%','유나이트 기술 게이지 수집률 +4.4% / 대기 시간 -3.3%','유나이트 기술 게이지 수집률 +4.8% / 대기 시간 -3.3%','유나이트 기술 게이지 수집률 +4.8% / 대기 시간 -3.6%','유나이트 기술 게이지 수집률 +5.2% / 대기 시간 -3.6%','유나이트 기술 게이지 수집률 +5.2% / 대기 시간 -3.9%','유나이트 기술 게이지 수집률 +5.6% / 대기 시간 -3.9%','유나이트 기술 게이지 수집률 +5.6% / 대기 시간 -4.2%','유나이트 기술 게이지 수집률 +6.0% / 대기 시간 -4.2%','유나이트 기술 게이지 수집률 +0.8% / 대기 시간 -0.3%','유나이트 기술 게이지 수집률 +6.0% / 대기 시간 -4.5%','유나이트 기술 게이지 수집률 +0.8% / 대기 시간 -0.6%','유나이트 기술 게이지 수집률 +1.2% / 대기 시간 -0.6%','유나이트 기술 게이지 수집률 +1.2% / 대기 시간 -0.9%','유나이트 기술 게이지 수집률 +1.6% / 대기 시간 -0.9%','유나이트 기술 게이지 수집률 +1.6% / 대기 시간 -1.2%','유나이트 기술 게이지 수집률 +2.0% / 대기 시간 -1.2%','http://pkm.gg/static/pokemon/img/held-items/Energy-Amplifier.png','공격'),(13,'박식안경','특수공격이 3% / 5% / 7% 오른다.','3%','5%','7%','특수공격','특수공격 +10','특수공격 +19','특수공격 +20','특수공격 +21','특수공격 +22','특수공격 +23','특수공격 +24','특수공격 +25','특수공격 +26','특수공격 +27','특수공격 +28','특수공격 +11','특수공격 +29','특수공격 +30','특수공격 +31','특수공격 +32','특수공격 +33','특수공격 +34','특수공격 +35','특수공격 +36','특수공격 +37','특수공격 +38','특수공격 +12','특수공격 +39','특수공격 +13','특수공격 +14','특수공격 +15','특수공격 +16','특수공격 +17','특수공격 +18','http://pkm.gg/static/pokemon/img/held-items/Wise-Glasses.png','공격'),(14,'조개껍질방울','기술이 명중했을 때 자신의 HP를 45 이상 회복한다. 특수공격이 높을수록 HP회복량이 많아진다.','0','0','0','0','특수공격 +1.6 / 대기 시간 -0.0%','특수공격 +8.0 / 대기 시간 -1.5%','특수공격 +9.6 / 대기 시간 -1.5%','특수공격 +9.6 / 대기 시간 -1.8%','특수공격 +11.2 / 대기 시간 -1.8%','특수공격 +11.2 / 대기 시간 -2.1%','특수공격 +12.8 / 대기 시간 -2.1%','특수공격 +12.8 / 대기 시간 -2.4%','특수공격 +14.4 / 대기 시간 -2.4%','특수공격 +14.4 / 대기 시간 -2.7%','특수공격 +16.0 / 대기 시간 -2.7%','특수공격 +1.6 / 대기 시간 -0.3%','특수공격 +16.0 / 대기 시간 -3.0%','특수공격 +17.6 / 대기 시간 -3.0%','특수공격 +17.6 / 대기 시간 -3.3%','특수공격 +19.2 / 대기 시간 -3.3%','특수공격 +19.2 / 대기 시간 -3.6%','특수공격 +20.8 / 대기 시간 -3.6%','특수공격 +20.8 / 대기 시간 -3.9%','특수공격 +22.4 / 대기 시간 -3.9%','특수공격 +22.4 / 대기 시간 -4.2%','특수공격 +24.0 / 대기 시간 -4.2%','특수공격 +3.2 / 대기 시간 -0.3%','특수공격 +24.0 / 대기 시간 -4.5%','특수공격 +3.2 / 대기 시간 -0.6%','특수공격 +4.8 / 대기 시간 -0.6%','특수공격 +4.8 / 대기 시간 -0.9%','특수공격 +6.4 / 대기 시간 -0.9%','특수공격 +6.4 / 대기 시간 -1.2%','특수공격 +8.0 / 대기 시간 -1.2%','http://pkm.gg/static/pokemon/img/held-items/Shell-Bell.png','공격'),(15,'초점렌즈','일반 공격이 급소에 명중했을 때 데미지가 증가한다. 공격이 높을수록 데미지의 증가량이 증가한다.','0','0','0','0','급소율 +0.4% / 급소 데미지 증가 0.0%','급소율 +2.0% / 급소 데미지 증가 4.0%','급소율 +2.4% / 급소 데미지 증가 4.0%','급소율 +2.4% / 급소 데미지 증가 4.8%','급소율 +2.8% / 급소 데미지 증가 4.8%','급소율 +2.8% / 급소 데미지 증가 5.6%','급소율 +3.2% / 급소 데미지 증가 5.6%','급소율 +3.2% / 급소 데미지 증가 6.4%','급소율 +3.6% / 급소 데미지 증가 6.4%','급소율 +3.6% / 급소 데미지 증가 7.2%','급소율 +4.0% / 급소 데미지 증가 7.2%','급소율 +0.4% / 급소 데미지 증가 0.8%','급소율 +4.0% / 급소 데미지 증가 8.0%','급소율 +4.4% / 급소 데미지 증가 8.0%','급소율 +4.4% / 급소 데미지 증가 8.8%','급소율 +4.8% / 급소 데미지 증가 등 8.8%','급소율 +4.8% / 급소 데미지 증가 9.6%','급소율 +5.2% / 급소 데미지 증가 9.6%','급소율 +5.2% / 급소 데미지 증가 10.4%','급소율 +5.6% / 급소 데미지 증가 10.4%','급소율 +5.6% / 급소 데미지 증가 11.2%','급소율 +6.0% / 급소 데미지 증가 11.2%','급소율 +0.8% / 급소 데미지 증가 0.8%','급소율 +6.0% / 급소 데미지 증가 12.0%','급소율 +0.8% / 급소 데미지 증가 1.6%','급소율 +1.2% / 급소 데미지 증가 1.6%','급소율 +1.2% / 급소 데미지 증가 2.4%','급소율 +1.6% / 급소 데미지 증가 2.4%','급소율 +1.6% / 급소 데미지 증가 3.2%','급소율 +2.0% / 급소 데미지 증가 3.2%','http://pkm.gg/static/pokemon/img/held-items/Scope-Lens.png','공격'),(16,'힘의머리띠','일반 공격이 명중했을 때 데미지가 상대편 포켓몬의 남은 HP의 1% / 2% / 3% 만큼 증가한다.','1%','2%','3%','HP','공격 +1/일반 공격의 속도 + 0.0%','공격 +5/일반 공격의 속도 + 2.5%','공격 +6/일반 공격의 속도 + 2.5%','공격 +6/일반 공격의 속도 + 3.0%','공격 +7/일반 공격의 속도 + 3.0%','공격 +7/일반 공격의 속도 + 3.5%','공격 +8/일반 공격의 속도 +3.5%','공격 +8/일반 공격의 속도 + 4.0%','공격 +9/일반 공격의 속도 + 4.0%','공격 +9/일반 공격의 속도 + 4.5%','공격 +10/일반 공격의 속도 + 4.5%','공격 +1/일반 공격의 속도 + 0.5%','공격 +10/일반 공격의 속도 + 5.0%','공격 +11/일반 공격의 속도 + 5.0%','공격 +11/일반 공격의 속도 + 5.5%','공격 +12/일반 공격의 속도 +5.5%','공격 +12/일반 공격의 속도 + 6.0%','공격 +13/일반 공격의 속도 + 6.0%','공격 +13/일반 공격의 속도 + 6.5%','공격 +14/일반 공격의 속도 + 6.5%','공격 +14/일반 공격의 속도 + 7.0%','공격 +15/일반 공격의 속도 + 7.0%','공격 +2/일반 공격의 속도 + 0.5%','공격 +15/일반 공격의 속도 + 7.5%','공격 +2/일반 공격의 속도 + 1.0%','공격 +3/일반 공격의 속도 + 1.0%','공격 +3/일반 공격의 속도 + 1.5%','공격 +4/일반 공격의 속도 + 1.5%','공격 +4/일반 공격의 속도 + 2.0%','공격 +5/일반 공격의 속도 + 2.0%','http://pkm.gg/static/pokemon/img/held-items/Muscle-Band.png','공격'),(17,'먹다남은음식','전투에서 벗어나 있는 동안 최대 HP의 1% / 1.5% / 2% 를 매초 회복한다.','1%','1.5%','2%','HP','HP +16 HP 회복 +0','HP +80 HP 회복 +3.0','HP +96 HP 회복 +3.0','HP +96 HP 회복 +3.6','HP +112 HP 회복 +3.6','HP +112 HP 회복 +4.2','HP +128 HP 회복 +4.2','HP +128 HP 회복 +4.8','HP +144 HP 회복 +4.8','HP +144 HP 회복 +5.4','HP +160 HP 회복 +5.4','HP +16 HP 회복 +0.6','HP +160 HP 회복 +6.0','HP +176 HP 회복 +6.0','HP +176 HP 회복 +6.6','HP +192 HP 회복 +6.6','HP +192 HP 회복 +7.2','HP +208 HP 회복 +7.2','HP +208 HP 회복 +7.8','HP +224 HP 회복 +7.8','HP +224 HP 회복 +8.4','HP +240 HP 회복 +8.4','HP +32 HP 회복 +0.6','HP +240 HP 회복 +9.0','HP +32 HP 회복 +1.2','HP +48 HP 회복 +1.2','HP +48 HP 회복 +1.8','HP +64 HP 회복 +1.8','HP +64 HP 회복 +2.4','HP +80 HP 회복 +2.4','http://pkm.gg/static/pokemon/img/held-items/Leftovers.png','방어');
/*!40000 ALTER TABLE `pokemon_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_news`
--

DROP TABLE IF EXISTS `pokemon_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_news` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `img` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(20) NOT NULL,
  `contents` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_news`
--

LOCK TABLES `pokemon_news` WRITE;
/*!40000 ALTER TABLE `pokemon_news` DISABLE KEYS */;
INSERT INTO `pokemon_news` VALUES (1,'8월 18일(수) 업데이트 내용 알림','0','2021-08-17','업데이트','2021년 8월 18일 16:00(KST)부터 서버 업데이트를 진행합니다.\r\n\r\n\r\n\r\n【반영 방법】\r\n\r\n앱을 재시작하면 업데이트가 반영됩니다.\r\n\r\n\r\n\r\n【업데이트 내용】\r\n\r\n・오류 수정\r\n\r\n・텍스트 수정\r\n\r\n・숍 갱신\r\n\r\n・배틀 밸런스 조정\r\n\r\n\r\n\r\n유나이트배틀의 밸런스를 조정하기 위해 포켓몬의 능력 및 기술의 내용을 일부 변경했습니다.\r\n\r\n\r\n\r\n▼조정 내용\r\n\r\n・암팰리스\r\n\r\n스텔스록: 기술 대기 시간이 짧아지고 상대편 포켓몬에게 주는 데미지가 증가되었습니다.\r\n\r\n암석봉인: 상대편 포켓몬에게 주는 데미지가 증가되었습니다.\r\n\r\n\r\n\r\n・한카리아스\r\n\r\n스테이터스: 이동 속도가 증가되었습니다.\r\n\r\n땅고르기: 상대편 포켓몬에게 주는 데미지가 증가되었습니다.\r\n\r\n드래곤다이브: 기술 대기 시간이 짧아졌습니다.\r\n\r\n\r\n\r\n・야도란\r\n\r\n파도타기: 상대편 포켓몬에게 주는 효과의 지속 시간이 짧아졌습니다.\r\n\r\n열탕: 상대편 포켓몬에게 주는 데미지가 증가되었습니다.\r\n\r\n         또한 증기에 의한 데미지에 따라 「특성 둔감」의 효과가 발동하지 않던 오류를 수정했습니다.\r\n\r\n\r\n\r\n・잠만보\r\n\r\n헤비봄버: 상대편 포켓몬에게 주는 데미지가 감소되었습니다.\r\n\r\n블록: 상대편 포켓몬에게 주는 효과의 지속 시간이 짧아졌습니다.\r\n\r\n바둥바둥: 기술 효과가 상향되었습니다.\r\n\r\n유나이트 기술: 폭풍수면임팩트: HP 회복량이 감소되었습니다.\r\n\r\n\r\n\r\n・개굴닌자\r\n\r\n연막: 기술 효과가 하향되었으며 기술 대기 시간이 길어졌습니다.\r\n\r\n물수리검: 기술 대기 시간이 짧아졌으며 상대편 포켓몬에게 주는 데미지가 증가되었습니다.\r\n\r\n그림자분신: 기술 대기 시간이 짧아졌습니다.\r\n\r\n\r\n\r\n・푸크린\r\n\r\n유나이트 기술: 스타☆리사이틀: 사용 후 유나이트 기술 게이지를 능동적으로 모을 수 없었던 오류를 수정했습니다.\r\n\r\n\r\n\r\n・에이스번\r\n\r\n일반 공격: 강화 공격이 준비되어 있는 동안 이동 속도가 오르던 오류를 수정했습니다.\r\n\r\n\r\n\r\n・알로라 나인테일\r\n\r\n특성 눈퍼뜨리기: 풀숲에 있는 보이지 않는 상대편 포켓몬에게도 효과가 발동되던 오류를 수정했습니다.\r\n\r\n오로라베일: 범위 안에 있는 동안 「특성 눈퍼뜨리기」의 발동 빈도가 증가하던 오류를 수정했습니다.\r\n\r\n\r\n\r\n・가디안\r\n\r\n일반 공격: 강화 공격이 명중한 상대편 포켓몬의 특수방어가 떨어지지 않던 오류를 수정했습니다.\r\n\r\n사이코키네시스: 명중한 상대편 포켓몬의 특수방어가 떨어지는 효과를 추가했습니다.\r\n\r\n\r\n\r\n・윽우지\r\n\r\n폭풍: 일부 야생 포켓몬에게 데미지를 주지 못하던 오류를 수정했습니다.\r\n\r\n\r\n\r\n・야생 포켓몬: 크레베이스\r\n\r\n스테이터스 : 체력이 감소되었습니다.\r\n\r\n철벽: 방어, 특수방어의 증가량이 감소되었습니다.\r\n\r\n\r\n\r\n・그 외\r\n\r\nKO당한 포켓몬이 배틀에 복귀할 때 짧은 시간 동안 상대편 포켓몬의 공격에 영향을 받지 않는 상태가 되도록 조정하였습니다.\r\n\r\n\r\n\r\n・배틀 아이템\r\n\r\n▼조정 내용\r\n\r\n・탈출버튼: 대기 시간이 증가되었습니다.\r\n\r\n・골가속장치: 대기 시간이 감소되었습니다.\r\n\r\n・에나비꼬리: 효과가 강해졌습니다.\r\n\r\n・플러스파워: 효과가 강해졌습니다.');
/*!40000 ALTER TABLE `pokemon_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_pkm_battle_item`
--

DROP TABLE IF EXISTS `pokemon_pkm_battle_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_pkm_battle_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` bigint NOT NULL,
  `battle_item_id_id` bigint NOT NULL,
  `pkm_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pokemon battle item` (`pkm_id_id`,`battle_item_id_id`),
  KEY `pokemon_pkm_ballte_i_battle_item_id_id_4fed2b1a_fk_pokemon_b` (`battle_item_id_id`),
  KEY `pokemon_pkm_ballte_item_pkm_id_id_5cdfb75f_fk_pokemon_pokemon_id` (`pkm_id_id`),
  CONSTRAINT `pokemon_pkm_ballte_i_battle_item_id_id_4fed2b1a_fk_pokemon_b` FOREIGN KEY (`battle_item_id_id`) REFERENCES `pokemon_battle_item` (`id`),
  CONSTRAINT `pokemon_pkm_ballte_item_pkm_id_id_5cdfb75f_fk_pokemon_pokemon_id` FOREIGN KEY (`pkm_id_id`) REFERENCES `pokemon_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_pkm_battle_item`
--

LOCK TABLES `pokemon_pkm_battle_item` WRITE;
/*!40000 ALTER TABLE `pokemon_pkm_battle_item` DISABLE KEYS */;
INSERT INTO `pokemon_pkm_battle_item` VALUES (1,10,5,1),(2,1,7,1),(3,1,8,2),(4,10,5,2),(5,1,5,3),(6,1,5,4),(7,1,5,5),(8,1,5,6),(9,1,5,7),(10,1,5,8),(11,1,5,9),(12,1,5,10),(13,1,5,11),(14,1,5,12),(15,1,5,13),(16,1,5,14),(17,1,5,15),(18,1,5,16),(19,1,5,17),(20,1,5,18),(21,1,5,19),(22,1,5,20),(23,1,5,21),(25,1,5,22),(26,1,5,23);
/*!40000 ALTER TABLE `pokemon_pkm_battle_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_pkm_item`
--

DROP TABLE IF EXISTS `pokemon_pkm_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_pkm_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` bigint NOT NULL,
  `item_id_id` bigint NOT NULL,
  `pkm_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pokemon item` (`pkm_id_id`,`item_id_id`),
  KEY `pokemon_pkm_item_item_id_id_4b805f55_fk_pokemon_item_id` (`item_id_id`),
  KEY `pokemon_pkm_item_pkm_id_id_c33727b6_fk_pokemon_pokemon_id` (`pkm_id_id`),
  CONSTRAINT `pokemon_pkm_item_item_id_id_4b805f55_fk_pokemon_item_id` FOREIGN KEY (`item_id_id`) REFERENCES `pokemon_item` (`id`),
  CONSTRAINT `pokemon_pkm_item_pkm_id_id_c33727b6_fk_pokemon_pokemon_id` FOREIGN KEY (`pkm_id_id`) REFERENCES `pokemon_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_pkm_item`
--

LOCK TABLES `pokemon_pkm_item` WRITE;
/*!40000 ALTER TABLE `pokemon_pkm_item` DISABLE KEYS */;
INSERT INTO `pokemon_pkm_item` VALUES (1,10,1,1),(2,10,16,1),(3,10,9,1),(4,1,2,1),(5,10,9,2),(6,10,1,2),(7,1,4,2),(8,10,2,2),(9,1,9,3),(10,1,16,3),(11,1,1,3),(12,1,9,4),(13,1,1,4),(14,1,16,4),(15,1,9,5),(16,1,16,5),(17,1,8,5),(18,1,15,6),(19,1,9,6),(20,1,8,6),(21,1,15,7),(22,1,9,7),(23,1,16,7),(24,1,9,8),(25,1,16,8),(26,1,1,8),(27,1,15,9),(28,1,9,9),(29,1,1,9),(30,1,8,10),(31,1,5,10),(32,1,13,10),(33,1,9,11),(34,1,16,11),(35,1,8,11),(36,1,15,12),(37,1,16,12),(38,1,1,12),(39,1,15,13),(41,1,9,13),(42,1,1,13),(43,1,9,14),(44,1,16,14),(45,1,1,14),(46,1,9,15),(47,1,11,15),(48,1,1,15),(49,1,9,16),(50,1,16,16),(51,1,8,16),(52,1,9,17),(53,1,16,17),(54,1,1,17),(55,1,9,18),(56,1,4,18),(57,1,16,18),(58,1,15,19),(59,1,16,19),(60,1,1,19),(61,1,6,20),(62,1,16,20),(63,1,8,20),(64,1,16,21),(65,1,1,21),(66,1,8,21),(67,1,9,22),(68,1,4,22),(69,1,1,22),(70,1,9,23),(71,1,11,23),(72,1,16,23);
/*!40000 ALTER TABLE `pokemon_pkm_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_pokemon`
--

DROP TABLE IF EXISTS `pokemon_pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_pokemon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `img` varchar(200) NOT NULL,
  `type` varchar(8) NOT NULL,
  `passive_name` varchar(20) NOT NULL,
  `passive_effect` longtext NOT NULL,
  `attack_effect` longtext NOT NULL,
  `offense` int NOT NULL,
  `endurance` int NOT NULL,
  `mobility` int NOT NULL,
  `scoring` int NOT NULL,
  `support` int NOT NULL,
  `passive_img` varchar(200) NOT NULL,
  `difficulty` varchar(10) NOT NULL,
  `type2` varchar(10) NOT NULL,
  `type3` varchar(10) NOT NULL,
  `detail_img` varchar(200) NOT NULL,
  `en_name` varchar(50) NOT NULL,
  `en_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_pokemon`
--

LOCK TABLES `pokemon_pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon_pokemon` DISABLE KEYS */;
INSERT INTO `pokemon_pokemon` VALUES (1,'가디안','http://pkm.gg/static/pokemon/img/pokemon/gardevoir/gardevoir.png','어택형','싱크로','이동 속도가 떨어뜨려지거나 지속 데미지 효과를 받으면 그 효과를 준 상대도 같은 상태로 만든다. 한번 이 특성이 발동되면 다음에 발동될 때까지 일정 시간이 필요하다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 잠시 동안 특수방어도 떨어뜨린다.',9,3,3,6,3,'http://pkm.gg/static/pokemon/img/pokemon/gardevoir/Synchronize.png','중급자','원거리','특수','http://pkm.gg/static/pokemon/img/pokemon/gardevoir/gardevoir.png','Gardevoir','Attacker'),(2,'잠만보','http://pkm.gg/static/pokemon/img/pokemon/snorlax/snorlax.png','디펜스형','먹보','나무열매를 먹을 때 그 효과가 상승한다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때 주변에 있는 상대편 포켓몬에게 데미지를 주고 이동 속도를 잠시 동안 떨어뜨린다.',3,10,4,3,5,'http://pkm.gg/static/pokemon/img/pokemon/snorlax/Gluttony.png','초급자','근거리','물리','http://pkm.gg/static/pokemon/img/pokemon/snorlax/snorlax.png','Snorlax','Defender'),(3,'이상해꽃','http://pkm.gg/static/pokemon/img/pokemon/venusaur/venusaur.png','원거리','심록','HP가 적을 때 주는 데미지가 증가한다.','3번째 일반 공격은 강화 공격이 되며 주는 데미지가 증가한다. 또한 상대편 포켓몬을 덩굴 중심으로 강제적으로 이동시킨다.',9,4,4,5,2,'http://pkm.gg/static/pokemon/img/pokemon/venusaur/Overgrow.png','중급자','어택형','특수','http://pkm.gg/static/pokemon/img/pokemon/venusaur/evolution-3-venusaur.png','Venusaur','Attacker'),(4,'알로라 나인테일','http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/alolan-ninetales.png','원거리','눈퍼뜨리기','눈을 내려 상대편 포켓몬에게 데미지를 주고 이동 속도를 잠시 동안 떨어뜨린다. \"오로라베일\" 이외의 기술 또는 강화 공격을 사용하면 눈을 던지며, 같은 상대를 여러 번 맞추면 상대를 짧은 시간 동안 얼음 상태로 만들 수 있다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때 주변에 있는 상대편 포켓몬에게 데미지를 주고 이동 속도를 잠시 동안 떨어뜨린다.',8,3,3,5,6,'http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/Snow Warning.png','중급자','어택형','특수','http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/evolution-2-alolan-ninetales.png','Alolan-ninetales','Attacker'),(5,'야도란','http://pkm.gg/static/pokemon/img/pokemon/slowbro/slowbro.png','원거리','둔감','데미지를 받더라도 HP가 서서히 줄어든다. 기술을 상대편 포켓몬에게 명중시키면 아직 받지 않은 데미지의 일부를 없앤 뒤, 상대편 포켓몬의 특수방어도 잠시 동안 떨어뜨린다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때 주변에 있는 상대편 포켓몬에게 데미지를 주고 이동 속도를 잠시 동안 떨어뜨린다.',3,8,3,3,8,'http://pkm.gg/static/pokemon/img/pokemon/slowbro/Oblivious.png','중급자','디펜스형','특수','http://pkm.gg/static/pokemon/img/pokemon/slowbro/evolution-2-slowbro.png','Slowbro','Defender'),(6,'암팰리스','http://pkm.gg/static/pokemon/img/pokemon/crustle/crustle.png','근거리','옹골참','HP가 어느 정도 떨어질 때마다 방어와 특수방어가 오른다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 이동 속도도 잠시 동안 떨어뜨린다.',3,8,3,4,6,'http://pkm.gg/static/pokemon/img/pokemon/crustle/Sturdy.png','초급자','디펜스형','물리','http://pkm.gg/static/pokemon/img/pokemon/crustle/evolution-2-crustle.png','Crustle','Defender'),(7,'개굴닌자','http://pkm.gg/static/pokemon/img/pokemon/greninja/greninja.png','원거리','급류','HP가 절반 이하일 때 공격과 이동 속도가 오른다.','3번째 일반 공격은 강화 공격이 된다. 강화 공격을 멀리서 명중시키면 상대편 포켓몬에게 주는 데미지가 증가하고 이동 속도도 잠시 동안 떨어뜨린다. 반대로 가까이에서 명중시키면 상대편 포켓몬의 이동 속도는 변화하지 않지만, 상대편 포켓몬의 남은 HP가 적을수록 주는 데미지가 증가한다.',8,4,6,6,1,'http://pkm.gg/static/pokemon/img/pokemon/greninja/Torrent.png','상급자','어택형','물리','http://pkm.gg/static/pokemon/img/pokemon/greninja/evolution-3-greninja.png','Greninja','Attacker'),(8,'제라오라','http://pkm.gg/static/pokemon/img/pokemon/zeraora/zeraora.png','근거리','축전','받은 데미지를 모아 일부를 자신의 공격으로 바꾼다.','3번째 일반 공걱은 강화 공격이 되며 명중했을 때 주는 데미지가 증가한다. 동시에 상대편 포켓몬을 마비 상태로 만들고 자신의 HP를 회복한다.',7,3,8,3,1,'http://pkm.gg/static/pokemon/img/pokemon/zeraora/Volt Absorb.png','상급자','스피드형','물리','http://pkm.gg/static/pokemon/img/pokemon/zeraora/zeraora.png','Zeraora','Speedster'),(9,'에이스번','http://pkm.gg/static/pokemon/img/pokemon/cinderace/cinderace.png','원거리','맹화','기술을 사용하면 다음 일반 공격이 강화 공격이 된다. 일반 공격이나 기술을 상대편 포켓몬에게 명중시키면 상대편 포켓몬에게 불이 붙는다. 불이 붙은 상대편 포켓몬에게 공격을 일정 횟수 명중시키면 추가 데미지를 준다. HP가 절반 이하일 때 잠시 동안 급소율이 오르며 일반 공격이 빨라진다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때 주는 데미지가 증가한다.',8,3,6,5,1,'http://pkm.gg/static/pokemon/img/pokemon/cinderace/Blaze.png','초급자','어택형','물리','http://pkm.gg/static/pokemon/img/pokemon/cinderace/evolution-3-cinderace.png','Cinderace','Attacker'),(10,'팬텀','http://pkm.gg/static/pokemon/img/pokemon/gengar/gengar.png','근거리','부유','전투에서 벗어나 있는 동안 이동 속도가 오른다.','3번째 일반 공격은 강화 공격이 되며 상대편 포켓몬에게 덤벼들어 데미지를 준다.',7,4,8,6,1,'http://pkm.gg/static/pokemon/img/pokemon/gengar/Levitate.png','상급자','스피드형','특수','http://pkm.gg/static/pokemon/img/pokemon/gengar/evolution-3-gengar.png','Gengar','Speedster'),(11,'마임맨','http://pkm.gg/static/pokemon/img/pokemon/mr-mime/mr-mime.png','근거리','필터','기술을 사용한 뒤 잠시 동안 받는 데미지가 감소한다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때의 데미지가 증가하고 상대편 포켓몬을 날려버린다.',3,8,2,3,8,'http://pkm.gg/static/pokemon/img/pokemon/mr-mime/Filter.png','중급자','서포트형','특수','http://pkm.gg/static/pokemon/img/pokemon/mr-mime/mr-mime.png','Mr-mime','Supporter'),(12,'한카리아스','http://pkm.gg/static/pokemon/img/pokemon/garchomp/garchomp.png','근거리','까칠한피부','근거리 기술로 공격을 받으면 그 데미지 중 일부를 상대에게 되받아친다.','5번째 일반 공격은 강화 공격이 되며 주는 데미지가 증가하고 자신의 HP를 회복한다. 강화 공격이 명중한 뒤 잠시 동안 일반 공격이나 기술이 상대편 포켓몬에게 명중할 때마다 일반 공격이 빨라진다.',7,7,5,5,1,'http://pkm.gg/static/pokemon/img/pokemon/garchomp/Rough Skin.png','중급자','밸런스형','물리','http://pkm.gg/static/pokemon/img/pokemon/garchomp/evolution-3-garchomp.png','Garchomp','All-Rounder'),(13,'리자몽','http://pkm.gg/static/pokemon/img/pokemon/charizard/charizard.png','근거리','맹화','HP가 절반 이하일 때 급소율이 오른다.','일반 공격으로 연속 데미지를 준다. 진화하면 일반 공격의 거리가 길어진다. 상대편 포켓몬이 화상 상태일 때는 일반 공격으로 주는 데미지가 증가한다.',7,6,5,6,1,'http://pkm.gg/static/pokemon/img/pokemon/charizard/Blaze.png','초급자','밸런스형','물리','http://pkm.gg/static/pokemon/img/pokemon/charizard/evolution-3-charizard.png','Charizard','All-Rounder'),(14,'거북왕','http://pkm.gg/static/pokemon/img/pokemon/blastoise/blastoise.png','원거리','급류','HP가 절반 이하일 때 공격과 특수공격이 오른다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때 연속 데미지를 주고 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.',4,7,4,4,6,'http://pkm.gg/static/pokemon/img/pokemon/blastoise/Torrent.png','중급자','디펜스형','특수','http://pkm.gg/static/pokemon/img/pokemon/blastoise/evolution-3-blastoise.png','Blastoise','Defender'),(15,'피카츄','http://pkm.gg/static/pokemon/img/pokemon/pikachu/pikachu.png','원거리','정전기','데미지를 받으면 범위 내에 있는 상대편 포켓몬을 잠시 동안 마비 상태로 만든다. 한번 이 특성이 발동되면 다음에 발동될 때까지 일정 시간이 필요하다.','3번째 일반 공격은 강화 공격이 되며 주는 데미지가 증가한다. 또한 명중했을 때 상대편 포켓몬을 잠시 동안 마비 상태로 만든다.',9,3,5,4,3,'http://pkm.gg/static/pokemon/img/pokemon/pikachu/Static.png','초급자','어택형','특수','http://pkm.gg/static/pokemon/img/pokemon/pikachu/pikachu.png','Pikachu','Attacker'),(16,'푸크린','http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/wigglytuff.png','근거리','헤롱헤롱바디','상대편 포켓몬의 공격을 가까이에서 맞았을 때 그 상대편 포켓몬을 잠시 동안 헤롱헤롱 상태로 만든다. 헤롱헤롱 상태가 된 상대편 포켓몬은 매료되어 제멋대로 다가온다. 같은 상대편 포켓몬에게 다시 효과를 주기 위해서는 일정 시간이 필요하다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때 상대편 포켓몬에게 데미지를 주고 회전시킨다.',2,5,5,4,9,'http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/Cute Charm.png','중급자','서포트형','스페셜','http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/evolution-2-wigglytuff.png','Wigglytuff','Supporter'),(17,'괴력몬','http://pkm.gg/static/pokemon/img/pokemon/machamp/machamp.png','근거리','근성','상태 이상이 되었을 때 공격이 오른다.','3번째 일반 공격은 강화 공격이 되며 명중했을 때의 데미지가 증가한다. 또한 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.',8,5,5,5,2,'http://pkm.gg/static/pokemon/img/pokemon/machamp/Guts.png','중급자','밸런스형','물리','http://pkm.gg/static/pokemon/img/pokemon/machamp/evolution-3-machamp.png','Machamp','All-Rounder'),(18,'해피너스','http://pkm.gg/static/pokemon/img/pokemon/blissey/blissey.png','근거리','자연회복','자신의 상태 이상을 모두 회복한다. 한번 이 특성이 발동되면 다음에 발동될 때까지 일정 시간이 필요하다.','일정 시간이 지날 때마다 일반 공격은 강화 공격이 되며 주는 데미지가 증가한다.',2,7,3,3,9,'http://pkm.gg/static/pokemon/img/pokemon/blissey/Natural Cure.png','초급자','서포트형','특수','http://pkm.gg/static/pokemon/img/pokemon/blissey/evolution-2-blissey.png','Blissey','Supporter'),(19,'앱솔','http://pkm.gg/static/pokemon/img/pokemon/absol/absol.png','근거리','대운','급소율이 오른다.','3번째 일반 공격은 강화 공격이 되며 명중하면 상대편 포켓몬에게 데미지를 주고 방어를 떨어뜨린다. 명중한 상대편 포켓몬이 1마리뿐인 경우에는 주는 데미지가 증가한다.',7,4,8,5,1,'http://pkm.gg/static/pokemon/img/pokemon/absol/Super Luck.png','상급자','스피드형','물리','http://pkm.gg/static/pokemon/img/pokemon/absol/absol.png','Absol','Speedster'),(20,'루카리오','http://pkm.gg/static/pokemon/img/pokemon/lucario/lucario.png','근거리','불굴의마음','HP가 적을 때 이동 속도가 올라가며 실드 효과를 얻는다.','3번째 일반 공격은 강화 공격이 되며 뼈를 사용해 연속 공격을 한다. 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 날려버린다.',6,5,7,6,1,'http://pkm.gg/static/pokemon/img/pokemon/lucario/Steadfast.png','상급자','밸런스형','물리','http://pkm.gg/static/pokemon/img/pokemon/lucario/lucario.png','Lucario','All-Rounder'),(21,'파이어로','http://pkm.gg/static/pokemon/img/pokemon/talonflame/talonflame.png','근거리','질풍날개','HP가 많을 때 이동 속도가 오른다.','3번째 일반 공격은 강화 공격이 되며 불꽃의 칼바람을 일으켜 범위 안에 있는 상대편 포켓몬에게 데미지를 준다. 일반 공격을 2번 반복한 뒤에 전투에서 긴 시간 이탈하더라도 강화 공격의 준비 상태는 취소되지 않는다.',5,3,10,7,1,'http://pkm.gg/static/pokemon/img/pokemon/talonflame/Gale Wings.png','초급자','스피드형','물리','http://pkm.gg/static/pokemon/img/pokemon/talonflame/evolution-3-talonflame.png','Talonflame','Speedster'),(22,'백솜모카','http://pkm.gg/static/pokemon/img/pokemon/eldegoss/eldegoss.png','원거리','솜털','일정 데미지 이상을 받으면 상대에게도 데미지를 주고 상대의 이동 속도를 잠시 동안 떨어뜨린다. 그와 동시에 자신의 HP는 회복되며 이동 속도가 잠시 동안 오른다.','3번째 일반 공격은 강화 공격이 되며 솜털을 상대편 포켓몬에게 붙인다. 솜털이 붙어 있는 상대편 포켓몬에게 일반 공격을 하면 주는 데미지가 증가하며 이동 속도도 잠시 동안 떨어뜨린다.',3,4,5,5,8,'http://pkm.gg/static/pokemon/img/pokemon/eldegoss/Cotton Down.png','초급자','서포트형','특수','http://pkm.gg/static/pokemon/img/pokemon/eldegoss/evolution-2-eldegoss.png','Eldegoss','Supporter'),(23,'윽우지','http://pkm.gg/static/pokemon/img/pokemon/cramorant/cramorant.png','원거리','그대로꿀꺽미사일','특정 기술을 사용하면 먹이를 물고 있는 상태가 된다. 그 상태에서 데미지를 받으면 물고 있는 먹이를 토해 내서 상대편  포켓몬에게 반격한다. 물고 있는 먹이와 그 효과는 자신의 남은 HP에 따라 달라진다.','4번째 일반 공격은 강화 공격이 되며 찌로꼬치 등을 상대편 포켓몬에게 토해 내어 공격한다. 명중했을 때 그 포켓몬의 주변에 있는 상대편 포켓몬에게도 데미지를 준다.',8,6,6,3,2,'http://pkm.gg/static/pokemon/img/pokemon/cramorant/Gulp Missile.png','상급자','어택형','특수','http://pkm.gg/static/pokemon/img/pokemon/cramorant/cramorant.png','Cramorant','Attacker');
/*!40000 ALTER TABLE `pokemon_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemon_skill`
--

DROP TABLE IF EXISTS `pokemon_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemon_skill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cooltime` varchar(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `img` varchar(200) NOT NULL,
  `level` int NOT NULL,
  `count` bigint NOT NULL,
  `pkm_id_id` bigint NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pokemon skill` (`pkm_id_id`,`name`),
  KEY `pokemon_skill_pkm_id_id_c048b914_fk_pokemon_pokemon_id` (`pkm_id_id`),
  CONSTRAINT `pokemon_skill_pkm_id_id_c048b914_fk_pokemon_pokemon_id` FOREIGN KEY (`pkm_id_id`) REFERENCES `pokemon_pokemon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_skill`
--

LOCK TABLES `pokemon_skill` WRITE;
/*!40000 ALTER TABLE `pokemon_skill` DISABLE KEYS */;
INSERT INTO `pokemon_skill` VALUES (1,'4.5','염동력','원거리','http://pkm.gg/static/pokemon/img/pokemon/gardevoir/Confusion.png',1,0,1,'지정한 방향을 직선으로 공격한다.'),(2,'11','순간이동','대시','http://pkm.gg/static/pokemon/img/pokemon/gardevoir/Teleport.png',1,0,1,'지정한 장소까지 워프한다. 워프한 뒤 일반 공격으로 주는 데미지가 1번만 증가한다.'),(3,'7','사이코키네시스','원거리','http://pkm.gg/static/pokemon/img/pokemon/gardevoir/Psychic.png',8,10,1,'기술이 상대편 포켓몬에게 명중한 시점 또는 최대 거리에 도달한 시점에서 범위 안에 있는 상대편 포켓몬에게 지속 데미지를 주고 이동 속도도 잠시 동안 떨어뜨린다.\r\n업그레이드 후에는 기술 대기 시간이 짧아진다.'),(4,'6','문포스','원거리','http://pkm.gg/static/pokemon/img/pokemon/gardevoir/Moonblast.png',8,5,1,'뒤쪽으로 거리를 벌리며 공격한다. 기술이 명중했을 때 부채꼴 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 자신에게서 가장 가까운 상대편 포켓몬을 잠시 동안 행동할 수 없게 만든다.\r\n업그레이드 후에는 기술을 사용하면 실드 효과를 얻는다.'),(5,'10','사이코쇼크','범위','http://pkm.gg/static/pokemon/img/pokemon/gardevoir/Psyshock.png',6,2,1,'지정한 장소를 3번 공격한다. 상대편 포켓몬에게 명중할 때마다 기술의 대기 시간이 짧아진다.\r\n업그레이드 후에는 공격이 명중할 때마다 주는 데미지가 증가한다.'),(6,'9','미래예지','범위','http://pkm.gg/static/pokemon/img/pokemon/gardevoir/Future Sight.png',6,3,1,'시간차로 폭발하는 공격을 설치한다. 폭발이 상대 팀의 포켓몬에게 명중하면 기술 대기 시간이 짧아진다.\r\n업그레이드 후에는 폭발이 상대편 포켓몬에게 명중하면 기술 대기 시간이 0초가 된다.'),(7,'0','유나이트 기술: 페어리보이드','방해','http://pkm.gg/static/pokemon/img/pokemon/gardevoir/Fairy Singularity.png',10,0,1,'지정한 장소의 공간을 뒤틀어 상대편 포켓몬을 끌어들인다. 뒤틀린 공간이 사라지는 순간 데미지를 주고 밀쳐낸다.'),(8,'6','몸통박치기','대시','http://pkm.gg/static/pokemon/img/pokemon/snorlax/Tackle.png',1,1,2,'배로 돌진해서 공격한다. 기술이 명중했을 때 데미지를 주고 가장 처음 맞은 상대편 포켓몬을 밀쳐낸다. 기술을 사용한 뒤 다음 일반 공격이 강화 공격이 된다.'),(9,'10초','잠자기','회복','http://pkm.gg/static/pokemon/img/pokemon/snorlax/Rest.png',1,0,2,'제자리에서 잠들어 HP를 회복한다. 기술을 사용하는 동안 같은 편 이외의 포켓몬의 이동을 방해한다.'),(10,'7초','헤비봄버','대시','http://pkm.gg/static/pokemon/img/pokemon/snorlax/Heavy Slam.png',6,1,2,'무거운 몸을 부딪혀 공격한다. 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 날려버린다.\r\n레벨 12가 되면 헤비봄버+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(11,'6.5','바둥바둥','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/snorlax/Flail.png',6,0,2,'바둥바둥 상태가 된다. 자신의 HP가 낮을수록 일반 공격으로 주는 데미지가 증가한다. 일반 공격이 명중하면 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.\r\n레벨 12가 되면 바둥바둥+로 업그레이드 된다.\r\n업그레이드 후에는 기술로 주는 데미지가 증가한다. 기술을 사용하는 동안 자신의 HP가 적을 때 일반 공격을 상대편 포켓몬에게 명중시키면 자신의 HP를 회복한다.'),(12,'11','블록','방해','http://pkm.gg/static/pokemon/img/pokemon/snorlax/Block.png',8,1,2,'양손을 펼쳐 벽을 만들어 실드 효과를 얻는다. 벽은 통과할 수 없으며 부딪힌 상대편 포켓몬을 밀쳐낸다.\r\n레벨 14가 되면 블록+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 사용하는 동안 받는 데미지가 감소한다.'),(13,'12','하품','방해','http://pkm.gg/static/pokemon/img/pokemon/snorlax/Yawn.png',8,0,2,'큰 하품으로 상대편 포켓몬의 졸음을 유도한다. 기술을 받은 상대편 포켓몬은 잠듦 상태가 된다.\r\n레벨 14가 되면 하품+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중했을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(14,'0','유나이트 기술: 폭풍수면임팩트','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/snorlax/Power Nap.png',10,0,2,'잠들어 코를 곤다. 범위 안에 있는 상대편 포켓몬에게 반복해서 데미지를 주고 날려버린다. 동시에 자신의 HP를 지속해서 회복한다. 또한 잠들어 있는 동안은 방해받지 않게 된다.'),(15,'6초','씨폭탄','원거리','http://pkm.gg/static/pokemon/img/pokemon/venusaur/Seed Bomb.png',1,0,3,'지정한 장소로 큰 씨앗을 던져 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.'),(16,'9','잎날가르기','범위','http://pkm.gg/static/pokemon/img/pokemon/venusaur/Razor Leaf.png',1,0,3,'날카로운 잎사귀를 다수 날려 연속 공격하고 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.'),(17,'6','오물폭탄','원거리','http://pkm.gg/static/pokemon/img/pokemon/venusaur/Sludge Bomb.png',5,0,3,'지정한 장소로 더러운 오물을 던져 공격한다. 기술의 범위 안에 있는 상대편 포켓몬은 데미지를 받고 독 상태가 되며 이동 속도와 특수방어가 잠시 동안 떨어진다.\r\n레벨 11이 되면 오물폭탄+로 업그레이드 된다.\r\n업그레이드 후에는 기술의 범위가 넓어진다.'),(18,'7','기가드레인','회복','http://pkm.gg/static/pokemon/img/pokemon/venusaur/Giga Drain.png',5,0,3,'범위 안에 있는 상대편 포켓몬의 HP를 흡수한다. 기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고 자신의 HP를 회복한다. 또한 잠시 동안 자신이 받는 데미지를 감소시킨다.\r\n레벨 11이 되면 기가드레인+로 업그레이드 된다.\r\n업그레이드 후에는 기술에 따른 HP 회복량이 증가한다.'),(19,'10','솔라빔','범위','http://pkm.gg/static/pokemon/img/pokemon/venusaur/Solar Beam.png',7,0,3,'강력한 빛의 다발을 발사해서 공격하고 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n레벨 13이 되면 솔라빔+로 업그레이드 된다.\r\n업그레이드 후에는 기술 대기 시간이 짧아진다.'),(20,'11','꽃잎댄스','범위','http://pkm.gg/static/pokemon/img/pokemon/venusaur/Petal Dance.png',7,0,3,'주변에 꽃잎을 흩뿌리며 이동 속도가 잠시 동안 오른다. 범위 안에 있는 상대편 포켓몬에게 계속해서 데미지를 준다.\r\n레벨 13이 되면 꽃잎댄스+로 업그레이드 된다.\r\n업그레이드 후에는 기술의 범위가 넓어진다.'),(21,'0','유나이트 기술: 그린레이지','범위','http://pkm.gg/static/pokemon/img/pokemon/venusaur/Verdant Anger.png',9,0,3,'지정한 장소로 거대한 씨앗을 던진다. 씨앗은 분열하여 범위 안에 있는 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨리고 데미지를 준다.'),(22,'5','눈싸라기','범위','http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/Powder Snow.png',1,0,4,'차가운 숨결을 내뿜어 공격한다. 기술이 명중했을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(23,'8','얼다바람','원거리','http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/Icy Wind.png',1,0,4,'얼어붙는 냉기를 내뿜어 공격한다. 기술이 명중했을 때 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 이동 속도도 잠시 동안 떨어뜨린다.'),(24,'7','눈사태','범위','http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/Avalanche.png',4,0,4,'지정한 장소로 차가운 얼음을 뿜어내 공격한다.\r\n얼음은 벽을 만들며 지상에서는 지나갈 수 없게 된다. 시간이 지나면 녹아 부서지며 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n레벨 11이 되면 눈사태+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중했을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(25,'7.5','매지컬샤인','방해','http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/Dazzling Gleam.png',4,0,4,'강력한 빛을 부채꼴로 쏘아 공격한다. 기술이 명중했을 때 상대편 포켓몬을 행동할 수 없게 만든다.\r\n레벨 11이 되면 매지컬샤인+로 업그레이드 된다.\r\n업그레이드 후에는 주는 데미지가 증가하며 상대편 포켓몬이 행동할 수 없는 시간이 길어진다.'),(26,'11','눈보라','원거리','http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/Blizzard.png',6,0,4,'격렬한 눈보라를 전방에 2번 내뿜어 공격한다. 1번째 눈보라로는 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 이동 속도도 잠시 동안 떨어뜨린다.\r\n2번째 눈보라에서도 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 밀쳐낸다. 또한 2번째 눈보라가 장애물에 닿으면 그 장소 주변에 있는 상대편 포켓몬에게도 데미지를 준다.\r\n레벨 13이 되면 눈보라+로 업그레이드 된다.\r\n업그레이드 후에는 기술로 주는 데미지가 증가한다.'),(27,'13','오로라베일','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/Aurora Veil.png',6,0,4,'주변에 오로라를 만들어 자신과 범위 안에 있는 같은 편 포켓몬이 받는 데미지가 감소한다. 또한 기술의 범위 안에 있는 동안 자신의 이동 속도가 오르며 일반 공격이 모두 강화 공격이 된다.\r\n레벨 13이 되면 오로라베일+로 업그레이드 된다.\r\n업그레이드 후에는 같은 편 포켓몬이 받는 데미지가 더욱 감소한다.'),(28,'0','유나이트 기술: 서클네주','범위','http://pkm.gg/static/pokemon/img/pokemon/alolan-ninetales/Snow Globe.png',9,0,4,'차가운 눈과 얼음으로 공격한다. 기술이 명중했을 때 범위 안에 있는 상대편 포켓몬에게 데미지를 준다. 상대편 포켓몬이 얼음 상태가 되어 있다면 주는 데미지가 증가한다.'),(29,'5','물대포','원거리','http://pkm.gg/static/pokemon/img/pokemon/slowbro/Water Gun.png',1,0,5,'물을 기세 좋게 뿜어내 공격한다. 기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고 이동 속도를 잠시 동안 떨어뜨린다. 기술 버튼을 길게 눌러 공격하면 기술 범위가 넓어지고 주는 데미지가 증가한다.'),(30,'11','태만함','회복','http://pkm.gg/static/pokemon/img/pokemon/slowbro/Slack Off.png',1,0,5,'게으름 피우며 쉰다. 잠시 동안 HP를 지속해서 회복한다. 쉬는 동안 방해받으면 HP의 회복 효과가 저하된다.'),(31,'5','열탕','원거리','http://pkm.gg/static/pokemon/img/pokemon/slowbro/Scald.png',4,0,5,'뜨겁게 끓어오르는 물을 발사해서 공격한다. 기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고 증기를 발생시킨다. 증기의 범위 안에 있는 상대편 포켓몬은 화상 상태가 되며 잠시 동안 이동 속도도 떨어진다.\r\n레벨 11이 되면 열탕+로 업그레이드 된다.\r\n업그레이드 후에는 증기의 범위가 넓어진다.'),(32,'9','파도타기','방해','http://pkm.gg/static/pokemon/img/pokemon/slowbro/Surf.png',4,0,5,'파도에 올라타 돌진하여 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 날려버린다. 이어서 2번 파도를 발생시켜 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 이동 속도도 잠시 동안 떨어뜨린다.\r\n레벨 11이 되면 파도타기+로 업그레이드 된다.\r\n업그레이드 후에는 2번째, 3번째 파도의 범위가 커지고 1번째 파도처럼 상대편 포켓몬을 날려버린다.'),(33,'13','망각술','회복','http://pkm.gg/static/pokemon/img/pokemon/slowbro/Amnesia.png',6,0,5,'아직 받지 않은 데미지의 일부를 없앤다. 기술을 사용한 뒤 잠시 동안 방해받지 않게 되며 방어가 오른다. 또한 \"열탕\", \"파도타기\"로 주는 데미지가 1번만 증가한다.\r\n레벨 13이 되면 망각술+로 업그레이드 된다.\r\n업그레이드 후에는 특수공격이 오른다.'),(34,'11','텔레키네시스','방해','http://pkm.gg/static/pokemon/img/pokemon/slowbro/Telekinesis.png',6,0,5,'초능력으로 상대편 포켓몬을 띄운다. 다시 기술을 사용하면 상대편 포켓몬을 자신의 방향으로 끌어온다.\r\n레벨 13이 되면 텔레키네시스+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 발사하기까지 걸리는 속도가 빨라지며 거리도 길어진다.'),(35,'0','유나이트 기술: 야앙?키네시스','방해','http://pkm.gg/static/pokemon/img/pokemon/slowbro/Slowbeam.png',9,0,5,'상대 팀의 포켓몬을 바라보며 계속 공격하고 데미지와 바인드 효과를 준다. 자신은 실드 효과를 얻고 기술을 사용하는 동안 방해받지 않게 된다.'),(36,'6','스톤샤워','범위','http://pkm.gg/static/pokemon/img/pokemon/crustle/Rock Slide.png',1,0,6,'지정한 장소로 큰 바위를 떨어뜨려 공격한다. 기술이 명중했을 때 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 잠시 동안 행동할 수 없게 만든다.'),(37,'3.5','연속자르기','근거리','http://pkm.gg/static/pokemon/img/pokemon/crustle/Fury Cutter.png',1,0,6,'발톱으로 상대편 포켓몬을 베고 데미지를 준다. 같은 상대편 포켓몬에게 연속으로 명중하면 주는 데미지가 증가한다.'),(38,'5','암석봉인','범위','http://pkm.gg/static/pokemon/img/pokemon/crustle/Rock Tomb.png',4,0,6,'지정한 장소를 향해 지면을 가르고 범위 안에 있는 상대편 포켓몬에게 데미지를 주면서 바위 장애물을 만든다. 다시 기술을 사용하면 장애물이 사라진다.\r\n레벨 11이 되면 암석봉인+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 며중했을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(39,'7','껍질깨기','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/crustle/Shell Smash.png',4,0,6,'껍질을 깨고 방어와 특수방어를 일정 비율로 공격과 특수공격으로 전환한다. 이때 이동 속도가 잠시 동안 오른다. 레벨 11이 되면 껍질깨기+로 업그레이드 된다.\r\n업그레이드 후에는 전환 비율이 높아진다.'),(40,'6','스텔스록','범위','http://pkm.gg/static/pokemon/img/pokemon/crustle/Stealth Rock.png',6,0,6,'수많은 작은 돌을 쏜다. 작은 돌이 상대편 포켓몬에게 맞을 때 또는 최대 거리까지 날아갔을 때 수많은 작은 돌이 떠 있는 공간이 만들어진다. 그 범위 안에 있는 상대편 포켓몬은 지속 데미지를 받는다. 또한 그 데미지는 점차 증가한다.\r\n레벨 13이 되면 스텔스록+로 업그레이드 된다.\r\n업그레이드 후에는 기술의 효과 시간이 길어진다. 기술이 명중했을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(41,'9','시저크로스','근거리','http://pkm.gg/static/pokemon/img/pokemon/crustle/X-Scissor.png',6,0,6,'발톱을 교차하며 전방으로 대시한다. 상대편 포켓몬에게 계속해서 데미지를 주고 밀쳐낸다. 밀쳐내진 상대편 포켓몬은 장애물에 부딪히면 행동할 수 없게 된다.\r\n레벨 13이 되면 시저크로스+로 업그레이드 된다.\r\n업그레이드 후에는 기술 대기 시간이 짧아진다.'),(42,'0','유나이트 기술: 쇄석선풍루','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/crustle/Rubble Rouser.png',9,0,6,'잠시 동안 실드 효과를 얻는다. 주변에 있는 상대편 포켓몬을 행동할 수 없게 만들고 지속 데미지를 준다. 또한 기술을 사용하는 동안 자신이 데미지를 받으면 주변에 있는 상대편 포켓몬에게 더욱 데미지를 준다.'),(43,'9','거품','원거리','http://pkm.gg/static/pokemon/img/pokemon/greninja/Bubble.png',1,0,7,'거품을 내뿜어 공격한다. 기술이 명중했을 때 잠시 동안 상대편 포켓몬의 이동 속도를 떨어뜨린다.'),(44,'8','대타출동','대시','http://pkm.gg/static/pokemon/img/pokemon/greninja/Substitute.png',1,0,7,'이동하면서 대타출동 인형을 남기고 간다.'),(45,'9','그림자분신','대시','http://pkm.gg/static/pokemon/img/pokemon/greninja/Double Team.png',5,0,7,'그 장소를 재빠르게 벗어나 분신을 만들고 자신의 전투를 돕게 한다.\r\n레벨 13이 되면 그림자분신+로 업그레이드 된다.\r\n업그레이드 후에는 기술 대기 시간이 짧아진다.'),(46,'13','연막','대시','http://pkm.gg/static/pokemon/img/pokemon/greninja/Smokescreen.png',5,0,7,'연막을 치고 구르면서 그 장소를 벗어난다. 그 직후에 은신 상태가 되어 자신의 이동 속도가 잠시 동안 오른다. 또한 다음 일반 공격이 강화 공격이 된다.\r\n레벨 13이 되면 연막+로 업그레이드 된다.\r\n업그레이드 후에는 은신 상태가 끝나면 공격이 잠시 동안 오른다.'),(47,'5','물수리검','원거리','http://pkm.gg/static/pokemon/img/pokemon/greninja/Water Shuriken.png',7,0,7,'점액으로 만들어진 수리검을 연속으로 던진다. 기술이 명중했을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨리고 자신의 HP를 회복한다. 또한 기술을 사용하는 동안 자신의 이동 속도가 오른다.\r\n레벨 11이 되면 물수리검+로 업그레이드 된다.\r\n업그레이드 후에는 기술의 공격 횟수가 늘어난다.'),(48,'9','파도타기','대시','http://pkm.gg/static/pokemon/img/pokemon/greninja/Surf.png',7,0,7,'파도에 올라타 상대편 포켓몬을 공격하여 데미지를 주고 자신의 HP를 회복한다. 이때 상대편 포켓몬을 KO 시키면 기술 대기 시간이 0초가 된다. 또한 HP가 적은 상대편 포켓몬에게는 주는 데미지가 증가한다.\r\n레벨 11이 되면 파도타기+로 업그레이드 된다.\r\n업그레이드 후에는 HP 회복량이 증가한다.'),(49,'0','유나이트 기술: 거대물수리검','범위','http://pkm.gg/static/pokemon/img/pokemon/greninja/Waterburst Shuriken.png',9,0,7,'지정한 장소로 거대한 물수리검을 던져 공격한다. 유나이트 기술이 명중했을 때 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 잠시 동안 이동 속도도 떨어뜨린다. 그 직후에 물수리검을 폭발시켜 다시 한번 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 날려버린다. 또한 유나이트 기술 종료 시에 지정한 방향으로 점프할 수 있다.'),(50,'6','고속이동','대시','http://pkm.gg/static/pokemon/img/pokemon/zeraora/Agility.png',1,0,8,'빠르게 장소를 이동한다. 그 뒤 일반 공격이 잠시 동안 빨라진다.'),(51,'8.5','베어가르기','근거리','http://pkm.gg/static/pokemon/img/pokemon/zeraora/Slash.png',1,0,8,'상대편 포켓몬에게 달려들어 날카로운 손톱으로 공격한다. 마지막 일격으로 상대편 포켓몬을 날려버린다.'),(52,'8','볼트체인지','대시','http://pkm.gg/static/pokemon/img/pokemon/zeraora/Volt Switch.png',6,0,8,'고속으로 장소를 이동하며 닿은 상대편 포켓몬에게 데미지를 준다. 이때 자신의 일반 공격이 잠시 동안 빨라진다. 일정 시간 안에 이 기술을 다시 사용하면 바로 이전 장소로 돌아간다.\r\n레벨 12가 되면 볼트체인지+로 업그레이드 된다.\r\n업그레이드 후에는 기술로 주는 데미지가 증가하고 일반 공격이 더욱 빨라진다.'),(53,'10','스파크','대시','http://pkm.gg/static/pokemon/img/pokemon/zeraora/Spark.png',6,0,8,'전류를 두르고 상대편 포켓몬에게 달려들어 데미지를 준다. 타깃으로 지정한 상대편 포켓몬에게 도착하기 전에 일반 공격을 사용하면 가장 가까이에 있는 상대편 포켓몬에게 돌진하고 데미지를 준다. 이 기술은 3번까지 연속으로 사용할 수 있다.\r\n레벨 12가 되면 스파크+로 업그레이드 된다.\r\n업그레이드 후에는 상대편 포켓몬에게 도착하기 전에 일반 공격을 사용하면 자신의 HP를 회복한다.'),(54,'12','방전','근거리','http://pkm.gg/static/pokemon/img/pokemon/zeraora/Discharge.png',8,0,8,'전기를 흘려 공격하여 주변에 있는 상대편 포켓몬에게 데미지를 준다. 기술이 명중했을 때 실드 효과를 얻는다. 상대편 포켓몬이 마비 상태인 경우에는 기술이 끝났을 때 상대편 포켓몬을 자신의 방향으로 끌어오며 다시 데미지를 주고 행동할 수 없게 만든다.\r\n레벨 14가 되면 방전+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중했을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(55,'11','와일드볼트','대시','http://pkm.gg/static/pokemon/img/pokemon/zeraora/Wild Charge.png',8,0,8,'지정한 방향으로 돌진한다. 기술이 명중했을 때 상대편 포켓몬에게 연속 공격을 하지만 동시에 자신도 일정 데미지를 받는다. 이 기술을 사용하기 전에 \"볼트체인지\"나 \"스파크\" 혹은 강화 공격을 상대편 포켓몬에게 명중시킨 경우 이 기술의 연속 공격 횟수가 늘어난다.\r\n레벨 14가 되면 와일드볼트+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중했을 때 주변에 있는 상대편 포켓몬에게 데미지를 준다.'),(56,'0','유나이트 기술: 질풍신뢰격','필중','http://pkm.gg/static/pokemon/img/pokemon/zeraora/Plasma Gale.png',10,0,8,'번개를 쏘아 공격하여 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 날려버린다. 동시에 플라스마 존을 만들고 그 안에 있는 상대편 포켓몬을 마비 상태로 만든다. 제라오라 자신이 플라스마 존 안에 있는 동안에는 일반 공격의 거리가 길어지고 주는 데미지도 증가한다.'),(57,'6','불꽃세례','필중','http://pkm.gg/static/pokemon/img/pokemon/cinderace/Ember.png',1,0,9,'작은 불꽃을 발사해서 공격한다. 기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고 잠시 동안 화상 상태로 만들고 공격을 떨어뜨린다.'),(58,'7.5','로킥','대시','http://pkm.gg/static/pokemon/img/pokemon/cinderace/Low Sweep.png',1,0,9,'지정한 방향으로 재빠르게 움직이며 맞은 상대편 포켓몬에게 데미지를 준다.'),(59,'7','화염볼','원거리','http://pkm.gg/static/pokemon/img/pokemon/cinderace/Pyro Ball.png',7,0,9,'지정한 방향으로 불꽃의 공을 차서 명중시킨 상대편 포켓몬에게 데미지를 주고 잠시 동안 화상 상태로 만든다.\r\n레벨 11이 되면 화염볼+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중했을 때 \"니트로차지\"나 \"페인트\"의 대기 시간이 짧아진다.'),(60,'8','브레이즈킥','필중','http://pkm.gg/static/pokemon/img/pokemon/cinderace/Blaze Kick.png',7,0,9,'불꽃을 담은 날아차기로 공격한다. 이 기술은 반드시 급소에 명중하며 상대편 포켓몬을 밀쳐내고 잠시 동안 화상 상태로 만든다. 또한 기술을 사용하는 동안 방해받지 않게 된다.\r\n레벨 11이 되면 브레이즈킥+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중한 뒤에 일반 공격이 잠시 동안 빨라진다.'),(61,'6','니트로차지','대시','http://pkm.gg/static/pokemon/img/pokemon/cinderace/Flame Charge.png',8,0,9,'불꽃을 두르고 돌격하여 맞은 상대편 포켓몬에게 데미지를 준다.\r\n레벨 13이 되면 니트로차지+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 끝난 뒤에 다음 강화 공격을 명중시키면 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(62,'13','페인트','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/cinderace/Feint.png',8,0,9,'기술을 사용하면 자신의 이동 속도가 잠시 동안 오르고 보호 상태가 된다.\r\n레벨 13이 되면 페인트+로 업그레이드 된다.\r\n업그레이드 후에는 기술에 이어서 일반 공격을 상대편 포켓몬에게 명중시키면 3번까지 HP를 회복한다.'),(63,'0','유나이트 기술: 블레이즈스트라이크','필중','http://pkm.gg/static/pokemon/img/pokemon/cinderace/Blazing Bicycle Kick.png',9,0,9,'불꽃으로 거대한 공을 만들어 지정한 장소로 슛해서 공격한다. 공은 무시무시한 충격파를 발산하여 범위 안에 있는 상대편 포켓몬에게 데미지를 준다. 또한 유나이트 기술이 명중하면 자신의 이동 속도가 잠시 동안 오른다.'),(64,'5','도깨비불','원거리','http://pkm.gg/static/pokemon/img/pokemon/gengar/Will-o-Wisp.png',1,0,10,'여러 발의 괴상한 불꽃을 쏘아 공격한다.\r\n기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고 화상 상태로 만든다.'),(65,'7','핥기','범위','http://pkm.gg/static/pokemon/img/pokemon/gengar/Lick.png',1,0,10,'혀를 내밀어 공격하고 상대편 포켓몬을 자신의 방향으로 끌어온다.'),(66,'4.5','섀도볼','원거리','http://pkm.gg/static/pokemon/img/pokemon/gengar/Shadow Ball.png',5,0,10,'까만 그림자의 덩어리를 내던져서 공격한다.\r\n기술이 명중했을 때 상대편 포켓몬의 이동 속도와 특수방어를 잠시 동안 떨어뜨린다.\r\n레벨 11이 되면 섀도볼+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(67,'8','오물폭탄','범위','http://pkm.gg/static/pokemon/img/pokemon/gengar/Sludge Bomb.png',5,0,10,'지정한 장소로 더러운 오물을 던져 공격한다.\r\n기술이 명중했을 때 상대편 포켓몬을 독 상태로 만든다.\r\n레벨 11이 되면 오물폭탄+로 업그레이드 된다\r\n업그레이드 후에는 독 상태의 시간이 길어진다.'),(68,'8','꿈먹기','원거리','http://pkm.gg/static/pokemon/img/pokemon/gengar/Dream Eater.png',7,0,10,'기술이 명중했을 때 상대편 포켓몬을 잠듦 상태로 만든다.\r\n상대편 포켓몬이 자신의 주변에서 잠듦 상태가 되어 있을 때\r\n다시 기술을 사용하면 그 포켓몬의 등 뒤에서 나타나 공격한다.\r\n이때 자신의 HP를 회복하며 \"섀도볼\"이나 \"오물폭탄\"의 대기 시간이 짧아진다.\r\n레벨 13이 되면 꿈먹기+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지와 회복하는 HP가 증가한다.'),(69,'7.5','병삼첨병','대시','http://pkm.gg/static/pokemon/img/pokemon/gengar/Hex.png',7,0,10,'지정한 장소까지 몸을 숨겨서 이동하고 모습을 드러냈을 때 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n상대편 포켓몬이 상태 이상일 때 공격에 성공하면 주는 데미지가 증가하고 기술 대기 시간이 짧아진다.\r\n레벨 13이 되면 병상첨병+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(70,'0','유나이트 기술: 인비저블쇼크','대시','http://pkm.gg/static/pokemon/img/pokemon/gengar/Phantom Ambush.png',9,0,10,'지정한 장소로 날아들어 이동 속도가 오르는 은신 상태가 된다.\r\n유나이트 기술을 다시 사용하면 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 이동 속도도 잠시 동안 떨어뜨린다.'),(71,'7','속이다','근거리','http://pkm.gg/static/pokemon/img/pokemon/mr-mime/Fake Out.png',1,0,11,'양손을 부딪쳐서 눈앞에 있는 상대편 포켓몬을 밀쳐낸다.'),(72,'8','빛의장막','방해','http://pkm.gg/static/pokemon/img/pokemon/mr-mime/Light Screen.png',1,0,11,'지정한 장소에 빛의장막을 만들어 상대편 포켓몬이 못 지나가게 한다.'),(73,'6','염동력','원거리','http://pkm.gg/static/pokemon/img/pokemon/mr-mime/Confusion.png',4,0,11,'직선으로 공격한다.\r\n상대편 포켓몬에게 데미지를 주고 밀쳐낸다.\r\n밀쳐낸 상대편 포켓몬이 장애물에 부딪히면 데미지가 증가하고 잠시 동안 행동할 수 없게 된다.\r\n상대편 포켓몬이 가드스웹 상태가 되어 있다면 밀쳐내지는 않지만 주는 데미지가 증가하고 잠시 동안 행동할 수 없게 된다.\r\n레벨 11이 되면 염동력+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(74,'6','사이코키네시스','능력 저하','http://pkm.gg/static/pokemon/img/pokemon/mr-mime/Psychic.png',4,0,11,'\"빛의장막\"이나 \"배리어\", 마임맨 자신, 가드스웹 상태인 상대편 포켓몬을 중심으로 기술이 발동되어 공격한다.\r\n기술이 상대편 포켓몬에게 명중하면 데미지를 주고 특수방어도 잠시 동안 떨어뜨린다.\r\n기술을 이중으로 맞은 상대편 포켓몬은 잠시 동안 행동할 수 없게 된다.\r\n레벨 11이 되면 사이코키네시스+로 업그레이드 된다.\r\n업그레이드 후에는 주는 데미지가 증가하며 상대편 포켓몬이 행동할 수 없는 시간이 길어진다.'),(75,'2','배리어','방해','http://pkm.gg/static/pokemon/img/pokemon/mr-mime/Barrier.png',6,0,11,'지정한 장소에 반투명한 벽을 만들어 상대편 포켓몬을 못 지나가게 한다.\r\n기술은 최대 2번까지 충전할 수 있다.\r\n레벨 13이 되면 배리어+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 충전할 수 있는 최대 횟수가 늘어난다.'),(76,'4.5','가드스웹','능력 저하','http://pkm.gg/static/pokemon/img/pokemon/mr-mime/Guard Swap.png',6,0,11,'기술이 명중했을 때 자신과 다른 포켓몬의 방어와 특수방어를 잠시 동안 교체한다.\r\n상대편 포켓몬에게 명중한 경우에는 지속 데미지를 주며 잠시 동안 이동 속도를 떨어뜨리고 자신의 이동 속도를 잠시 동안 올린다.\r\n같은 편 포켓몬에게 명중한 경우에는 잠시 동안 같은 편 포켓몬의 이동 속도를 올린다.\r\n레벨 13이 되면 가드스웹+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 사용하는 동안 자신과 같은 편 포켓몬의 HP를 계속 회복한다.'),(77,'0','유나이트 기술: It\'s 쇼타임','범위','http://pkm.gg/static/pokemon/img/pokemon/mr-mime/Showtime.png',9,0,11,'지정한 장소로 점프하여 팬터마임을 선보인다.\r\n범위 안에 있는 상대편 포켓몬에게 계속해서 데미지를 주고 잠시 동안 행동할 수 없게 만든다.'),(78,'5','땅고르기','범위','http://pkm.gg/static/pokemon/img/pokemon/garchomp/Bulldoze.png',1,0,12,'땅을 힘껏 밟아 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.'),(79,'6','모래뿌리기','능력 저하','http://pkm.gg/static/pokemon/img/pokemon/garchomp/Sand Attack.png',1,0,12,'모래를 뿌려서 공격한다.\r\n기술이 명중했을 때 잠시 동안 상대편 포켓몬의 시야가 좁아지고 이동 속도도 떨어진다.\r\n한편 자신의 이동 속도가 오르고 일반 공격도 빨라진다.'),(80,'8','구멍파기','대시','http://pkm.gg/static/pokemon/img/pokemon/garchomp/Dig.png',6,0,12,'지면을 파고들어 지정한 방향으로 고속으로 이동하여 상대편 포켓몬에게 닿은 시점 또는 최대 거리에 도달한 시점에서 뚫고 나온다.\r\n이때 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 날려버린다.\r\n레벨 12가 되면 구멍파기+로 업그레이드 된다.\r\n업그레이드 후에는 지면 아래에서 뚫고 나온 뒤 잠시 동안 받는 데미지가 감소한다.'),(81,'6','드래곤다이브','대시','http://pkm.gg/static/pokemon/img/pokemon/garchomp/Dragon Rush.png',6,0,12,'뒤쪽으로 거리를 벌린 뒤 지정한 방향으로 다이브해서 공격하고 상대편 포켓몬을 밀쳐낸다.\r\n처음에 거리를 벌리는 동안 \"드래곤크루\"를 연계할 수 있다.\r\n레벨 12가 되면 드래곤다이브+로 업그레이드 된다.\r\n업그레이드 후에는 최대 거리까지 밀쳐낸 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(82,'7','지진','범위','http://pkm.gg/static/pokemon/img/pokemon/garchomp/Earthquake.png',8,0,12,'높이 뛰어오른 뒤 지면에 기세 좋게 착지하여 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n레벨 14가 되면 지진+로 업그레이드 된다.\r\n업그레이드 후에는 범위 안에 있는 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(83,'5','드래곤크루','근거리','http://pkm.gg/static/pokemon/img/pokemon/garchomp/Dragon Claw.png',8,0,12,'전방을 손톱으로 2번 공격하고 상대편 포켓몬에게 데미지를 준다.\r\n1번째 공격은 데미지를 준 뒤 날려버린다. 2번째 공격은 주는 데미지가 증가한다.\r\n기술이 끝난 뒤 일반 공격이 잠시 동안 빨라진다.\r\n레벨 14가 되면 드래곤크루+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(84,'0','유나이트 기술: 노발대발러시','근거리','http://pkm.gg/static/pokemon/img/pokemon/garchomp/Livid Outrage.png',10,0,12,'전방으로 대시하면서 강력한 연속 공격을 한다.\r\n마지막 일격으로 상대편 포켓몬을 날려버리지만 그게 끝나면 잠시 동안 행동할 수 없게 된다.'),(85,'6','불꽃튀기기','원거리','http://pkm.gg/static/pokemon/img/pokemon/charizard/Flame Burst.png',1,0,13,'불꽃을 토해 내어 공격한다.\r\n기술이 명중했을 때 상대편 포켓몬이 화상 상태가 되며 자신의 이동 속도가 잠시 동안 오른다.'),(86,'10','회오리불꽃','범위','http://pkm.gg/static/pokemon/img/pokemon/charizard/Fire Spin.png',1,0,13,'범위 안에 있는 상대편 포켓몬을 회오리불꽃으로 가둔다.\r\n기술이 명중한 뒤에 지속 데미지를 주고 상대편 포켓몬의 이동 속도도 잠시 동안 떨어뜨린다.'),(87,'5.5','화염방사','원거리','http://pkm.gg/static/pokemon/img/pokemon/charizard/Flamethrower.png',5,0,13,'불꽃을 격렬하게 뿜어내 공격한다.\r\n기술이 명중했을 때 상대편 포켓몬이 화상 상태가 되며 자신의 이동 속도가 잠시 동안 오른다.\r\n레벨 11이 되면 화염방사+로 업그레이드 된다.\r\n업그레이드 후에는 기술과 화상 양쪽의 데미지가 증가한다.'),(88,'6','불꽃펀치','대시','http://pkm.gg/static/pokemon/img/pokemon/charizard/Fire Punch.png',5,0,13,'불꽃을 담은 펀치로 공격한다.\r\n기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고 밀쳐낸다.\r\n또한 밀쳐낸 상대편 포켓몬을 화상 상태를 만든다.\r\n레벨 11이 되면 불꽃펀치+로 업그레이드 된다.\r\n업그레이드 후에는 일반 공격이 명중할 때마다 기술 대기 시간이 짧아진다.'),(89,'8','불대문자','범위','http://pkm.gg/static/pokemon/img/pokemon/charizard/Fire Blast.png',7,0,13,'큰대자의 불꽃으로 공격한다.\r\n불꽃은 지면에서 불타는 동안 상대편 포켓몬에게 지속 데미지를 준다.\r\n또한 상대편 포켓몬의 이동 속도도 잠시 동안 떨어뜨린다.\r\n레벨 13이 되면 불대문자+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(90,'10','플레어드라이브','대시','http://pkm.gg/static/pokemon/img/pokemon/charizard/Flare Blitz.png',7,0,13,'불꽃을 두르고 돌진하여 상대편 포켓몬을 날려버린다.\r\n이때 자신은 실드 효과를 얻는다.\r\n레벨 13이 되면 플레어드라이브+로 업그레이드 된다.\r\n업그레이드 후에는 날려버린 상대편 포켓몬의 이동 속도도 잠시 동안 떨어뜨린다.'),(91,'0','유나이트 기술: 어스크러셔','필중','http://pkm.gg/static/pokemon/img/pokemon/charizard/Seismic Slam.png',9,0,13,'공중으로 날아 장애물을 무시하고 이동할 수 있다.\r\n유나이트 기술을 사용하는 동안은 일반 공격으로 주는 데미지가 증가하고 상대편 포켓몬을 화상 상태로 만든다.\r\n또한 상대편 포켓몬에게 데미지를 주면 자신의 HP를 회복한다.\r\n다시 유나이트 기술을 사용하면 상대 팀의 포켓몬을 붙잡아 공중에서 지면으로 내던진다.'),(92,'9','물대포','원거리','http://pkm.gg/static/pokemon/img/pokemon/blastoise/Water Gun.png',1,0,14,'물을 뿜어내어 공격한다. 상대편 포켓몬을 밀쳐내고 이동 속도를 잠시 동안 떨어뜨린다.'),(93,'10','로케트박치기','대시','http://pkm.gg/static/pokemon/img/pokemon/blastoise/Skull Bash.png',1,0,14,'상대편 포켓몬에게 격렬하게 부딪쳐 행동할 수 없게 만든다.'),(94,'8.5','하이드로펌프','원거리','http://pkm.gg/static/pokemon/img/pokemon/blastoise/Hydro Pump.png',5,0,14,'물을 격렬하게 뿜어내 공격한다.\r\n기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고 밀쳐낸다.\r\n레벨 11이 되면 하이드로펌프+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(95,'9','해수스파우팅','범위','http://pkm.gg/static/pokemon/img/pokemon/blastoise/Water Spout.png',5,0,14,'바닷물을 뿜어내어 지정한 장소로 범위 공격을 한다.\r\n상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.\r\n레벨 11이 되면 해수스파우팅+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(96,'12','파도타기','대시','http://pkm.gg/static/pokemon/img/pokemon/blastoise/Surf.png',7,0,14,'파도에 올라타 돌격하여 맞은 상대편 포켓몬을 밀쳐내고 행동할 수 없게 만든다.\r\n기술을 사용하는 동안 자신은 방해받지 않게 된다.\r\n또한 기술 종료 시에 지정한 방향으로 점프할 수 있다.\r\n레벨 13이 되면 파도타기+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중했을 때 실드 효과를 얻는다.'),(97,'11','고속스핀','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/blastoise/Rapid Spin.png',7,0,14,'몸을 고속으로 회전시켜 일반 공격, \"하이드로펌프\", \"해수스파우팅\"의 공격 패턴을 변화시킨다.\r\n기술을 사용할 때 \"하이드로펌프\", \"해수스파우팅\"의 대기 시간이 0초가 된다.\r\n기술을 사용하는 동안 자신은 방해받지 않게 된다.\r\n또한 기술이 끝난 뒤 다음 일반 공격이 강화 공격이 된다.\r\n레벨 13이 되면 고속스핀+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 사용하는 동안 자신이 받는 데미지가 감소한다.'),(98,'0','유나이트 기술: 하이드로타이푼','방해','http://pkm.gg/static/pokemon/img/pokemon/blastoise/Hydro Typhoon.png',9,0,14,'회전하면서 물을 뿜어내어 공격하고 넓은 범위에 걸쳐 상대편 포켓몬을 날려버린다.\r\n이때 자신은 실드 효과를 얻는다.'),(99,'5','전기쇼크','필중','http://pkm.gg/static/pokemon/img/pokemon/pikachu/Thunder Shock.png',1,0,15,'전기를 흘려 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n또한 상대편 포켓몬을 잠시 동안 마비 상태로 만든다.'),(100,'9','일렉트릭네트','방해','http://pkm.gg/static/pokemon/img/pokemon/pikachu/Electro Web.png',1,0,15,'전기 그물로 상대편 포켓몬을 붙잡아 공격하고 이동할 수 없게 만든다.'),(101,'5','일렉트릭볼','필중','http://pkm.gg/static/pokemon/img/pokemon/pikachu/Electro Ball.png',4,0,15,'전기로 된 공을 던져서 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 잠시 동안 마비 상태로 만든다.\r\n이때 주는 데미지는 상대편 포켓몬의 남은 HP가 적을수록 증가한다.\r\n레벨 11이 되면 일렉트릭볼+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(102,'8','번개','범위','http://pkm.gg/static/pokemon/img/pokemon/pikachu/Thunder.png',4,0,15,'격렬한 번개를 떨어뜨려 공격하고 범위 안에 있는\r\n상대편 포켓몬에게 데미지를 준다.\r\n레벨 11이 되면 번개+로 업그레이드 된다.\r\n업그레이드 후에는 기술의 공격 횟수가 늘어난다.'),(103,'10','볼트태클','방해','http://pkm.gg/static/pokemon/img/pokemon/pikachu/Volt Tackle.png',6,0,15,'전기를 모아 돌진하면서 공격하여 상대편 포켓몬을 날려버린다.\r\n레벨 13이 되면 볼트태클+로 업그레이드 된다.\r\n업그레이드 후에는 기술 대기 시간이 짧아진다.'),(104,'8','10만볼트','범위','http://pkm.gg/static/pokemon/img/pokemon/pikachu/Thunderbolt.png',6,0,15,'전기로 격렬하게 공격하여 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n또한 상대편 포켓몬을 행동할 수 없게 만든다.\r\n레벨 13이 되면 10만볼트+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(105,'0','유나이트 기술: 풀볼트스톰','범위','http://pkm.gg/static/pokemon/img/pokemon/pikachu/Thunderstorm.png',9,0,15,'주변에 있는 상대 팀의 포켓몬을 무시무시한 낙뢰로 공격한다.'),(106,'5','막치기','근거리','http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/Pound.png',1,0,16,'전방을 향해서 연속 공격을 한다.\r\n기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고\r\n잠시 동안 이동 속도도 떨어뜨린다.'),(107,'8','웅크리기','방해','http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/Defense Curl.png',1,0,16,'빠르게 굴러서 실드 효과를 얻는다.\r\n구르고 있는 도중에 맞은 상대편 포켓몬을 날려버린다.\r\n장애물에 부딪히면 진행 방향이 바뀌고 \"막치기\", \"연속뺨치기\", \"매지컬샤인\"의 대기 시간이 0초가 된다.'),(108,'10','구르기','방해','http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/Rollout.png',4,0,16,'빠르게 굴러서 실드 효과를 얻는다.\r\n구르고 있는 도중에 맞은 상대편 포켓몬에게 데미지를 주고 날려버린다.\r\n장애물에 부딪히면 진행 방향이 바뀌고 \"막치기\", \"연속뺨치기\", \"매지컬샤인\"의 대기 시간이 0초가 된다.\r\n레벨 12가 되면 구르기+로 업그레이드 된다.\r\n업그레이드 후에는 상대편 포켓몬을 날려버려 두는 시간이 길어진다.'),(109,'10','노래하기','범위','http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/Sing.png',4,0,16,'노랫소리를 이용해 주변에 있는 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.\r\n상대편 포켓몬이 기술의 범위 안에 잠깐 있으면 잠시 동안 잠듦 상태가 되며 방어와 특수방어도 떨어진다.\r\n레벨 12가 되면 노래하기+로 업그레이드 된다.\r\n업그레이드 후에는 상대편 포켓몬이 더 긴 시간 동안 잠듦 상태가 된다.'),(110,'5','연속빰치기','근거리','http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/Double Slap.png',6,0,16,'전방을 향해서 연속 공격을 한다.\r\n기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고 잠시 동안 이동 속도도 떨어뜨린다.\r\n레벨 10이 되면 연속빰치기+로 업그레이드 된다.\r\n업그레이드 후에는 기술의 공격 횟수가 늘어난다.'),(111,'4.5','매지컬샤인','범위','http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/Dazzling Gleam.png',6,0,16,'지정한 방향으로 강력한 빛을 내어 범위 안에 있는 상대편 포켓몬에게 2번 데미지를 준다.\r\n레벨 10이 되면 매지컬샤인+로 업그레이드 된다.\r\n업그레이드 후에는 기술로 1번째 데미지를 주었을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(112,'0','유나이트 기술: 스타☆리사이틀','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/wigglytuff/Starlight Recital.png',8,0,16,'리사이틀을 시작한다.\r\n자신과 주변에 있는 같은 편 포켓몬에 실드 효과를 부여하고 상태 이상을 회복하며 잠시 동안 방해받지 않게 된다.'),(113,'6','태권당수','근거리','http://pkm.gg/static/pokemon/img/pokemon/machamp/Karate Chop.png',1,0,17,'날카로운 당수로 상대편 포켓몬을 공격한다.'),(114,'9','벌크업','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/machamp/Bulk Up.png',1,0,17,'기술을 사용한 뒤 잠시 동안 방해받지 않게 되며 자신의 이동 속도와 공격이 오르고 일반 공격도 빨라진다.\r\n또한 다음 일반 공격이 강화 공격이 된다.'),(115,'8','폭발펀치','대시','http://pkm.gg/static/pokemon/img/pokemon/machamp/Dynamic Punch.png',5,0,17,'지정한 장소로 점프하며 공격하여 기술이 명중했을 때 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 행동할 수 없게 만든다.\r\n기술을 사용한 뒤 잠시 동안 방해받지 않게 되며 이동 속도가 오르고 일반 공격이 빨라진다.\r\n또한 다음 일반 공격이 강화 공격이 된다.\r\n레벨 11이 되면 폭발펀치+로 업그레이드 된다.\r\n업그레이드 후에는 공격과 이동 속도가 더욱 오른다.'),(116,'11','지옥의바퀴','방해','http://pkm.gg/static/pokemon/img/pokemon/machamp/Submission.png',5,0,17,'이동 속도가 올라가며 방해받지 않게 된다.\r\n다음 일반 공격이 명중했을 때 주는 데미지가 증가하고 상대편 포켓몬을 지면에 내던져 행동할 수 없게 만든다.\r\n기술이 끝나면 잠시 동안 급소율이 오르고 일반 공격도 빨라진다.\r\n레벨 11이 되면 지옥의바퀴+로 업그레이드 된다.\r\n업그레이드 후에는 급소율이 더욱 오르고 일반 공격이 빨라진다.'),(117,'6','인파이트','근거리','http://pkm.gg/static/pokemon/img/pokemon/machamp/Close Combat.png',7,0,17,'지정한 방향으로 연속 펀치를 날린다.\r\n마지막 일격은 주는 데미지가 증가한다.\r\n기술을 사용하는 동안에도 이동할 수 있으며 방해받지 않게 된다.\r\n레벨 13이 되면 인파이트+로 업그레이드 된다.\r\n업그레이드 후에는 상태 이상인 포켓몬에게 주는 데미지가 증가한다.'),(118,'6','크로스촙','대시','http://pkm.gg/static/pokemon/img/pokemon/machamp/Cross Chop.png',7,0,17,'전방으로 대시하며 양손으로 촙을 날린다.\r\n이때 급소율이 오른다.\r\n레벨 13이 되면 크로스촙+로 업그레이드 된다.\r\n업그레이드 후에는 일반 공격을 할 때마다 일정 정도까지 공격이 계속해서 오른다.'),(119,'0','유나이트 기술: 호걸러시','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/machamp/Barrage Blow.png',9,0,17,'잠시 동안 자신의 이동 속도, 공격, 방어, 특수방어가 오른다.\r\n다시 기술을 사용하면 연속으로 공격하며 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 밀쳐낸다.\r\n마지막 일격은 더욱 큰 데미지를 준다.'),(120,'6','막치기','근거리','http://pkm.gg/static/pokemon/img/pokemon/blissey/Pound.png',1,0,18,'지정한 방향으로 때려서 공격한다.\r\n기술이 명중했을 때 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 이동 속도도 잠시 동안 떨어뜨린다.'),(121,'10','치유파동','회복','http://pkm.gg/static/pokemon/img/pokemon/blissey/Heal Pulse.png',1,0,18,'자신과 지정한 같은 편 포켓몬의 HP를 잠시 동안 지속해서 회복한다.'),(122,'2','알낳기','회복','http://pkm.gg/static/pokemon/img/pokemon/blissey/Soft Boiled.png',4,0,18,'알을 같은 편 포켓몬에게 던져 자신과 그 포켓몬의 HP를 회복한다.\r\n기술은 최대 3번까지 충전할 수 있다.\r\n레벨 12가 되면 알낳기+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 충전할 수 있는 최대 횟수가 늘어난다.'),(123,'8','신비의부적','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/blissey/Safeguard.png',4,0,18,'지정한 같은 편 포켓몬과 해피너스 자신을 대상으로 상태 이상을 회복하고 실드 효과를 부여한다. 실드 효과가 계속되는 동안 지정한 같은 편 포켓몬과 해피너스 자신은 방해받지 않게 된다.\r\n레벨 12가 되면 신비의부적+로 업그레이드 된다.\r\n업그레이드 후에는 실드 효과를 통해 무효로 할 수 있는 데미지가 증가한다.'),(124,'7.5','알폭탄','원거리','http://pkm.gg/static/pokemon/img/pokemon/blissey/Egg Bomb.png',6,0,18,'지정한 장소로 알을 세게 던진다.\r\n던진 알은 폭발하여 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 날려버린다.\r\n레벨 10이 되면 알폭탄+로 업그레이드 된다.\r\n업그레이드 후에는 날려버린 상대편 포켓몬의 이동 속도도 잠시 동안 떨어뜨린다.'),(125,'9','도우미','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/blissey/Helping Hand.png',6,0,18,'자신과 주변에 있는 같은 편 포켓몬의 이동 속도가 잠시 동안 큰 폭으로 오르고 일반 공격도 빨라진다.\r\n기술의 효과가 계속되는 동안 자신의 일반 공격이 강화 공격이 된다.\r\n레벨 10이 되면 도우미+로 업그레이드 된다.\r\n업그레이드 후에는 기술의 효과가 계속되는 동안 일반 공격의 데미지가 증가한다.'),(126,'0','유나이트 기술: 해피해피어시스트','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/blissey/Bliss Assistance.png',8,0,18,'지정한 같은 편 포켓몬에게 대시하여 알을 건넨다.\r\n대시하는 중에 주변에 있거나 맞은 상대편 포켓몬을 날려버린다.\r\n알을 건넨 뒤 잠시 동안 실드 효과를 주고 공격과 특수공격이 오르며 그 포켓몬이 받은 데미지의 일부를 가져온다.'),(127,'8','페인트','대시','http://pkm.gg/static/pokemon/img/pokemon/absol/Feint.png',1,0,19,'호를 그리듯 대시하며 닿은 상대편 포켓몬을 공격한다.\r\n이 기술은 상대편 포켓몬의 방어나 실드를 무시하고 데미지를 줄 수 있다.'),(128,'6','베어가르기','근거리','http://pkm.gg/static/pokemon/img/pokemon/absol/Slash.png',1,0,19,'전방을 날카로운 발톱으로 베어 공격한다.\r\n기술을 사용할 때 급소율이 오른다.'),(129,'5','깜짝베기','대시','http://pkm.gg/static/pokemon/img/pokemon/absol/Night Slash.png',5,0,19,'호를 그리듯 대시하여 상대편 포켓몬에게 데미지를 준다.\r\n이 공격이 명중하면 추가 공격을 할 수 있다.\r\n추가 공격은 직선으로 대시하여 상대편 포켓몬에게 데미지를 준다.\r\n이때 상대편 포켓몬의 HP가 적을수록 자신의 급소율이 오른다.\r\n레벨 11이 되면 깜짝베기+로 업그레이드 된다.\r\n업그레이드 후에는 다시 기술을 사용하면 자신의 HP를 회복한다.'),(130,'5','따라가때리기','대시','http://pkm.gg/static/pokemon/img/pokemon/absol/Pursuit.png',5,0,19,'지정한 장소로 이동하고 다음 일반 공격으로 즉시 상대편 포켓몬에게 덤벼들어 공격한다.\r\n등 뒤에서 공격에 성공하면 주는 데미지가 증가하며\r\n기술 대기 시간이 짧아진다.\r\n레벨 11이 되면 따라가때리기+로 업그레이드 된다.\r\n업그레이드 후에는 이동 속도가 오른다.'),(131,'7','사이코커터','근거리','http://pkm.gg/static/pokemon/img/pokemon/absol/Psycho Cut.png',7,0,19,'실체화시킨 마음의 칼날로 공격한다.\r\n기술이 명중했을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.\r\n또한 그 상대편 포켓몬에게 일반 공격으로 주는 데미지가 그 뒤 3번까지 증가한다.\r\n레벨 13이 되면 사이코커터+로 업그레이드 된다.\r\n업그레이드 후에는 이 기술을 명중시킨 상대편 포켓몬에게 다가가면 자신의 이동 속도가 잠시 동안 오른다.'),(132,'7','기습','방해','http://pkm.gg/static/pokemon/img/pokemon/absol/Sucker Punch.png',7,0,19,'상대편 포켓몬을 공격할 찬스를 엿본다.\r\n그동안 자신과 상대편 포켓몬의 이동 속도를 떨어뜨린다.\r\n시간이 지나면 상대편 포켓몬에게 돌진하여 공격한다.\r\n단, 먼저 데미지를 받거나 상대편 포켓몬에게 공격받은 경우에는 바로 돌진하며 상대편 포켓몬을 밀쳐낸다.\r\n레벨 13이 되면 기습+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중한 뒤에 일반 공격이 잠시 동안 빨라진다.'),(133,'0','유나이트 기술: 다크슬래셔','범위','http://pkm.gg/static/pokemon/img/pokemon/absol/Midnight Slash.png',9,0,19,'전방을 반복해서 베어 공격한다.\r\n마지막에 무시무시한 기세로 칼날을 쏘아 더욱 큰 데미지를 상대편 포켓몬에게 주고 밀쳐낸다.'),(134,'6','전광석화','대시','http://pkm.gg/static/pokemon/img/pokemon/lucario/Quick Attack.png',1,0,20,'눈에 보이지 않는 속도로 돌진한다.\r\n상대편 포켓몬에게 닿으면 데미지를 준다.'),(135,'7','코멧펀치','근거리','http://pkm.gg/static/pokemon/img/pokemon/lucario/Meteor Mash.png',1,0,20,'혜성과 같은 펀치를 계속 날려서 공격한다.\r\n상대편 포켓몬에게 데미지를 주고 밀쳐낸다.'),(136,'9','신속','대시','http://pkm.gg/static/pokemon/img/pokemon/lucario/Extreme Speed.png',5,0,20,'경이로운 속도로 돌진해서 공격한다.\r\n지근거리에서 기술이 명중하면 기술 대기 시간이 0초가 되고 자신의 HP를 회복한다.\r\n단, 같은 상대에게 계속해서 기술을 맞춰 기술 대기 시간을 계속 0초로 만들 수는 없다.\r\n기술을 사용한 직후에 일반 공격을 사용하면 데미지가 증가한다.\r\n레벨 11이 되면 신속+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 사용하면 잠시 동안 공격이 오른다.'),(137,'7','그로우펀치','대시','http://pkm.gg/static/pokemon/img/pokemon/lucario/Power-up Punch.png',5,0,20,'힘을 모은 뒤 강력한 공격을 한다.\r\n힘을 모으는 동안 이동 속도가 떨어지지만 공격이 서서히 오르며 자신이 받는 데미지는 감소한다.\r\n그 뒤 지정한 방향으로 돌진하여 기술을 발동한다.\r\n기술의 데미지는 상대편 포켓몬의 남은 HP가 적을수록 증가하고\r\n제대로 명중하면 다음 일반 공격은 강화 공격이 된다.\r\n이 기술의 대기 시간은 루카리오의 기술이 명중할 때마다 짧아진다.\r\n레벨 11이 되면 그로우펀치+로 업그레이드 된다.\r\n업그레이드 후에는 힘을 모으는 동안 방해받지 않게 된다.'),(138,'10','본러쉬','근거리, 대시','http://pkm.gg/static/pokemon/img/pokemon/lucario/Bone Rush.png',7,0,20,'뼈를 사용해 연속 공격을 한다. 계속해서 상대편 포켓몬에게 데미지를 주고 밀쳐낸다.\r\n마지막 뼈는 멀리까지 날아가고 다시 기술을 사용하면 뼈가 있는 장소까지 돌격하여\r\n주변에 있는 상대편 포켓몬에게 데미지를 준다.\r\n레벨 13이 되면 본러쉬+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 다시 사용하면 \"신속\"이나 \"그로우펀치\"의 대기 시간이 0초가 된다.'),(139,'9','인파이트','근거리','http://pkm.gg/static/pokemon/img/pokemon/lucario/Close Combat.png',7,0,20,'연속 공격을 한다. 계속해서 상대편 포켓몬에게 데미지를 주고 밀쳐낸다.\r\n레벨 13이 되면 인파이트+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(140,'0','유나이트 기술: 풀포스블라스트','원거리','http://pkm.gg/static/pokemon/img/pokemon/lucario/Aura Cannon.png',9,0,20,'범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n유나이트 기술이 명중했을 때는 다음 \"그로우펀치\"로 주는 데미지가 증가한다.'),(141,'5','쪼기','근거리','http://pkm.gg/static/pokemon/img/pokemon/talonflame/Peck.png',1,0,21,'상대편 포켓몬에게 날아가 3번 공격한다.'),(142,'8','애크러뱃','대시','http://pkm.gg/static/pokemon/img/pokemon/talonflame/Acrobatics.png',1,0,21,'지정한 장소로 날아가 수차례 공격한다.\r\n공격 후에는 지정한 방향에서 멀어질 수 있다.'),(143,'6.5','니트로차지','대시','http://pkm.gg/static/pokemon/img/pokemon/talonflame/Flame Charge.png',5,0,21,'불꽃을 두르고 지정한 방향으로 날아가 진행 방향에 있는 상대편 포켓몬을 공격한다.\r\n그와 동시에 자신의 이동 속도가 잠시 동안 오른다.\r\n레벨 11이 되면 니트로차지+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중한 뒤에 잠시 동안 기술이나 일반 공격이 상대편 포켓몬의 방어를 일부 돌파하고 데미지를 준다.'),(144,'6','제비반환','대시','http://pkm.gg/static/pokemon/img/pokemon/talonflame/Aerial Ace.png',5,0,21,'지정한 상대편 포켓몬을 향해 날아 데미지를 준다.\r\n또한 다음 일반 공격이 강화 공격이 된다.\r\n레벨 11이 되면 제비반환+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(145,'11','공중날기','대시','http://pkm.gg/static/pokemon/img/pokemon/talonflame/Fly.png',7,0,21,'기술을 사용해 하늘로 날아오른다.\r\n다시 기술을 사용하면 지정한 장소로 다이브해서 공격하고 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n또한 다음 일반 공격이 강화 공격이 된다.\r\n레벨 13이 되면 공중날기+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중했을 때 상대편 포켓몬을 날려버린다.'),(146,'10','브레이브버드','대시','http://pkm.gg/static/pokemon/img/pokemon/talonflame/Brave Bird.png',7,0,21,'불꽃을 두르고 지정한 장소로 뛰어들어 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n기술이 명중했을 때 반동으로 자신도 데미지를 받지만 일정 시간 안에 강화 공격을 사용하면 \"니트로차지\"나 \"제비반환\"의 대기 시간이 0초가 된다.\r\n레벨 13이 되면 브레이브버드+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중했을 때 받는 데미지가 감소한다.'),(147,'0','유나이트 기술: 플레어스위퍼','대시','http://pkm.gg/static/pokemon/img/pokemon/talonflame/Flame Sweep.png',9,0,21,'공중제비를 돈 뒤 전방으로 돌격한다.\r\n진행 방향에 있는 상대편 포켓몬에게 데미지를 주고 밀쳐낸다.'),(148,'4.5','나뭇잎','원거리','http://pkm.gg/static/pokemon/img/pokemon/eldegoss/Leafage.png',1,0,22,'잎사귀를 던져 공격한다. \r\n기술이 명중했을 때 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.'),(149,'8','광합성','회복','http://pkm.gg/static/pokemon/img/pokemon/eldegoss/Synthesis.png',1,0,22,'자신과 주변에 있는 같은 편 포켓몬의 HP를 회복한다.'),(150,'6','꽃가루경단','원거리','http://pkm.gg/static/pokemon/img/pokemon/eldegoss/Pollen Puff.png',4,0,22,'꽃가루경단을 던진다.\r\n꽃가루경단은 상대편 포켓몬에게 붙으면 데미지를 주고\r\n같은 편 포켓몬에게 붙으면 HP를 회복한다.\r\n레벨 11이 되면 꽃가루경단+로 업그레이드 된다.\r\n업그레이드 후에는 꽃가루경단을 상대편 포켓몬에게 붙이면 지속 데미지를 주며 같은 편 포켓몬에게 붙이면 HP 회복과 더불어 받는 데미지도 감소한다.'),(151,'9','그래스믹서','원거리','http://pkm.gg/static/pokemon/img/pokemon/eldegoss/Leaf Tornado.png',4,0,22,'날카로운 잎사귀로 공격한다.\r\n잎사귀가 지나간 곳을 같은 편 포켓몬이 지나가면 이동 속도가 잠시 동안 오른다.\r\n레벨 11이 되면 그래스믹서+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 명중했을 때 상대편 포켓몬의 명중률을 잠시 동안 떨어뜨린다.'),(152,'9','코튼가드','능력 상승','http://pkm.gg/static/pokemon/img/pokemon/eldegoss/Cotton Guard.png',6,0,22,'자신과 주변에 있는 같은 편 포켓몬을 솜털로 지킨다.\r\n솜털은 데미지를 흡수하며 기술이 끝나면 일부 HP를 회복한다.\r\n레벨 13이 되면 코튼가드+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 사용하는 동안의 이동 속도가 오른다.'),(153,'7.5','목화포자','범위','http://pkm.gg/static/pokemon/img/pokemon/eldegoss/Cotton Spore.png',6,0,22,'포자를 주변에 모은다.\r\n시간이 지나면 포자는 튀어 나가 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 날려버린다.\r\n동시에 이동 속도를 잠시 동안 떨어뜨리지만 기술을 사용하는 동안 자신의 이동 속도는 오른다.\r\n레벨 13이 되면 목화포자+로 업그레이드 된다.\r\n업그레이드 후에는 기술을 사용하는 동안 자신이 받는 데미지가 감소한다.'),(154,'0','유나이트 기술: 솜털의춤','범위','http://pkm.gg/static/pokemon/img/pokemon/eldegoss/Cotton Cloud Crash.png',9,0,22,'공중에 떠올라 보호 상태가 된다.\r\n다시 사용하면 공중에서 몸통박치기로 공격한다.\r\n범위 안에 있는 상대편 포켓몬을 밀쳐내고 같은 편 포켓몬의 HP를 회복한다.'),(155,'5','바다회오리','범위','http://pkm.gg/static/pokemon/img/pokemon/cramorant/Whirlpool.png',1,0,23,'회오리를 일으켜 범위 안에 있는 상대편 포켓몬에게 데미지를 준다.\r\n기술의 범위는 점차 좁아지지만 주는 데미지는 증가한다.\r\n기술의 범위가 가장 좁아졌을 때 그 범위 안에 있는 상대편 포켓몬의 이동 속도를 잠시 동안 떨어뜨린다.\r\n또한 자신이 회오리 범위 안에 들어가 있으면 찌로꼬치 등을 잡을 수 있다.'),(156,'8','깃털댄스','방해','http://pkm.gg/static/pokemon/img/pokemon/cramorant/Feather Dance.png',1,0,23,'상대편 포켓몬의 공격과 이동 속도를 잠시 동안 떨어뜨린다.'),(157,'9','폭풍','원거리','http://pkm.gg/static/pokemon/img/pokemon/cramorant/Hurricane.png',4,0,23,'폭풍을 일으켜 공격한다.\r\n휩쓸린 상대편 포켓몬은 날려지고 지면에 떨어질 때 데미지를 받는다.\r\n레벨 11이 되면 폭풍+로 업그레이드 된다.\r\n업그레이드 후에는 이동 속도가 잠시 동안 오른다.'),(158,'5','에어슬래시','원거리','http://pkm.gg/static/pokemon/img/pokemon/cramorant/Air Slash.png',4,0,23,'뒤쪽으로 거리를 벌리며 수많은 공기의 칼날을 쏘아 공격한다.\r\n기술이 명중하면 범위 안에 있는 상대편 포켓몬에게 데미지를 주고 기술 대기 시간이 짧아진다.\r\n레벨 11이 되면 에어슬래시+로 업그레이드 된다.\r\n업그레이드 후에는 공기의 칼날이 상대편 포켓몬에게 명중할 때마다 HP를 회복한다.'),(159,'8','파도타기','원거리','http://pkm.gg/static/pokemon/img/pokemon/cramorant/Surf.png',6,0,23,'파도로 공격해서 상대편 포켓몬에게 데미지를 준다.\r\n파도는 최대 거리까지 진행하면 돌아오며 다시 상대편 포켓몬에게 데미지를 주고 끌어온다.\r\n또한 자신이 파도 범위 안에 들어가 있으면 찌로꼬치 등을 잡을 수 있다.\r\n레벨 13이 되면 파도타기+로 업그레이드 된다.\r\n업그레이드 후에는 1번째 파도가 상대편 포켓몬에게 맞았을 때 잠시 동안 그 포켓몬의 이동 속도를 떨어뜨린다.'),(160,'1.5','다이빙','대시','http://pkm.gg/static/pokemon/img/pokemon/cramorant/Dive.png',6,0,23,'지정한 장소가 물웅덩이처럼 변하고 거기에 뛰어들어 공격한다.\r\n기술이 명중했을 때 상대편 포켓몬에게 데미지를 주고 날려버린다.\r\n물웅덩이에서 올라올 때 추가로 찌로꼬치 등을 잡는다.\r\n기술은 최대 3번까지 충전할 수 있다.\r\n레벨 13이 되면 다이빙+로 업그레이드 된다.\r\n업그레이드 후에는 기술이 주는 데미지가 증가한다.'),(161,'0','유나이트 기술: 거센파도미사일','원거리','http://pkm.gg/static/pokemon/img/pokemon/cramorant/Gatling Gulp Missile.png',9,0,23,'찌로꼬치 등을 계속해서 붙잡아 가장 가까이에 있는 상대편 포켓몬에게 토해 내어 공격한다.\r\n기술을 사용하는 동안에는 이동할 수 없으며 다른 기술도 사용할 수 없게 된다.');
/*!40000 ALTER TABLE `pokemon_skill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-21  6:53:53
