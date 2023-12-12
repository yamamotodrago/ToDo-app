-- MySQL dump 10.13  Distrib 8.0.30, for macos11.6 (x86_64)
--
-- Host: localhost    Database: clara-coly-todo
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
-- MySQL dump 10.13  Distrib 8.0.30, for macos11.6 (x86_64)
--
-- Host: localhost    Database: clara_coly_todo
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'Dashboard','fa-bar-chart','/',NULL,NULL,NULL),(2,0,2,'TODOリスト一覧','fa-list-ol','todos',NULL,NULL,NULL),(3,0,3,'Admin','fa-tasks','',NULL,NULL,NULL),(4,3,3,'Users','fa-users','auth/users',NULL,NULL,NULL),(5,3,4,'Roles','fa-user','auth/roles',NULL,NULL,NULL),(6,3,5,'Permission','fa-ban','auth/permissions',NULL,NULL,NULL),(7,3,6,'Menu','fa-bars','auth/menu',NULL,NULL,NULL),(8,3,7,'Operation log','fa-history','auth/logs',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_operation_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'admin','GET','127.0.0.1','[]','2022-08-24 09:18:35','2022-08-24 09:18:35'),(2,1,'admin/todos','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2022-08-24 09:18:38','2022-08-24 09:18:38'),(3,1,'admin/auth/logout','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2022-08-24 09:18:51','2022-08-24 09:18:51'),(4,1,'admin','GET','127.0.0.1','[]','2022-08-24 09:19:08','2022-08-24 09:19:08'),(5,1,'admin/todos','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2022-08-24 09:19:10','2022-08-24 09:19:10'),(6,1,'admin/todos','GET','127.0.0.1','[]','2022-08-24 09:32:38','2022-08-24 09:32:38'),(7,1,'admin/todos','GET','127.0.0.1','[]','2022-08-24 09:32:43','2022-08-24 09:32:43');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,3,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2022-08-24 08:25:42','2022-08-24 08:25:42');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'coly','$2y$10$.2gxkAacFAZ3biKjKpW.gOct8YlMIUmVe6cMJrv6lZkI0DVpKDXMu','Coly Cao',NULL,'WOl0EBXe02ZreKnLkjDlAiae61wZ0pTqvHPSvg1OtTfUIVoflQbjbgQwYdzr','2022-08-24 08:25:42','2022-08-24 08:25:42');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2022_08_21_004743_create_todos_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todos`
--

DROP TABLE IF EXISTS `todos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'TODO事項',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '具体的な内容',
  `due_date` date NOT NULL COMMENT '締め切り日',
  `is_completed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状態が完了済み？',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todos`
--

LOCK TABLES `todos` WRITE;
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
INSERT INTO `todos` VALUES (1,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-17',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(2,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-21',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(3,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-04',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(4,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-31',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(5,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-02',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(6,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-02',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(7,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-22',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(8,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-21',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(9,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-16',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(10,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-06',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(11,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-04',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(12,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-18',1,'2022-08-24 08:25:41','2022-08-24 08:46:52',NULL),(13,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-23',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(14,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-27',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(15,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-01',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(16,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-08',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(17,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-16',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(18,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-10',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(19,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-27',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(20,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-23',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(21,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-31',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(22,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-21',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(23,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-19',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(24,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-17',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(25,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-04',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(26,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-13',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(27,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-11',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(28,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-30',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(29,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-11',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(30,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-29',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(31,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-10',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(32,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-11',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(33,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-29',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(34,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-04',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(35,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-08',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(36,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-20',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(37,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-05',1,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(38,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-02',0,'2022-08-24 08:25:41','2022-08-24 08:25:41',NULL),(39,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-15',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(40,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-16',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(41,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-28',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(42,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-21',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(43,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-11',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(44,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-15',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(45,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-18',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(46,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-30',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(47,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-15',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(48,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-14',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(49,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-27',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(50,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-21',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(51,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-12',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(52,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-29',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(53,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-11',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(54,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-08',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(55,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-10',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(56,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-12',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(57,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-30',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(58,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-13',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(59,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-29',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(60,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-07',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(61,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-08',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(62,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-11',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(63,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-12',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(64,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-13',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(65,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-12',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(66,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-19',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(67,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-08',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(68,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-05',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(69,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-16',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(70,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-19',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(71,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-18',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(72,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-17',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(73,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-12',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(74,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-04',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(75,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-21',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(76,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-04',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(77,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-19',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(78,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-13',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(79,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-06',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(80,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-21',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(81,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-09',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(82,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-17',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(83,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-08',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(84,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-28',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(85,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-22',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(86,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-04',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(87,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-30',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(88,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-01',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(89,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-12',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(90,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-09',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(91,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-17',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(92,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-15',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(93,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-14',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(94,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-16',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(95,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-20',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(96,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-08-28',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(97,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-11',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(98,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-13',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(99,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-20',0,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL),(100,'クローズド テスト','クローズド テスト版リリースを作成、管理し、限られた数のテスターでアプリのプレリリース版をテストできます。','2022-09-22',1,'2022-08-24 08:25:42','2022-08-24 08:25:42',NULL);
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-24 20:29:50
