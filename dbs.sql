/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: agents
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `AgentLevel`
--

DROP TABLE IF EXISTS `AgentLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentLevel` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `super_admin_id` int(11) DEFAULT NULL,
  `level_name` varchar(191) NOT NULL,
  `level_descp` varchar(191) NOT NULL,
  `level_type` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`level_id`),
  KEY `AgentLevel_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `AgentLevel_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentLevel`
--

LOCK TABLES `AgentLevel` WRITE;
/*!40000 ALTER TABLE `AgentLevel` DISABLE KEYS */;
INSERT INTO `AgentLevel` VALUES (1,NULL,'level 1','none',NULL,'2024-12-16 15:36:56.557','2024-12-16 15:36:56.557');
/*!40000 ALTER TABLE `AgentLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentPrices`
--

DROP TABLE IF EXISTS `AgentPrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentPrices` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_sub_prices_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `is_single_time_per_domain` tinyint(1) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `price` double NOT NULL,
  `current` tinyint(1) NOT NULL,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`price_id`),
  KEY `AgentPrices_agent_sub_prices_id_fkey` (`agent_sub_prices_id`),
  KEY `AgentPrices_super_admin_id_fkey` (`super_admin_id`),
  KEY `AgentPrices_currency_id_fkey` (`currency_id`),
  CONSTRAINT `AgentPrices_agent_sub_prices_id_fkey` FOREIGN KEY (`agent_sub_prices_id`) REFERENCES `AgentSubscriptionPrices` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentPrices_currency_id_fkey` FOREIGN KEY (`currency_id`) REFERENCES `Currency` (`currency_id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentPrices_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentPrices`
--

LOCK TABLES `AgentPrices` WRITE;
/*!40000 ALTER TABLE `AgentPrices` DISABLE KEYS */;
INSERT INTO `AgentPrices` VALUES (1,1,1,1,1,1500,1,NULL,'2024-12-16 15:40:29.985','2024-12-16 15:40:29.985'),(2,1,2,1,1,50,1,NULL,'2024-12-16 15:41:02.555','2024-12-16 15:41:02.555'),(3,2,1,1,0,0,1,NULL,'2024-12-16 15:41:44.308','2024-12-16 15:41:44.308');
/*!40000 ALTER TABLE `AgentPrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentPurchase`
--

DROP TABLE IF EXISTS `AgentPurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentPurchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime(3) NOT NULL,
  `end_date` datetime(3) NOT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`purchase_id`),
  KEY `AgentPurchase_order_item_id_fkey` (`order_item_id`),
  KEY `AgentPurchase_org_id_fkey` (`org_id`),
  KEY `AgentPurchase_order_id_fkey` (`order_id`),
  CONSTRAINT `AgentPurchase_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order` (`order_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `AgentPurchase_order_item_id_fkey` FOREIGN KEY (`order_item_id`) REFERENCES `OrderItems` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `AgentPurchase_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentPurchase`
--

LOCK TABLES `AgentPurchase` WRITE;
/*!40000 ALTER TABLE `AgentPurchase` DISABLE KEYS */;
INSERT INTO `AgentPurchase` VALUES (1,'2024-01-01 00:00:00.000','2025-01-01 00:00:00.000',NULL,NULL,NULL,'2024-12-16 17:51:09.895','2024-12-16 17:51:09.895'),(2,'2024-12-27 06:03:12.851','2025-01-27 06:03:12.851',1,2,2,'2024-12-27 06:03:12.853','2024-12-27 06:03:12.853'),(3,'2024-12-27 06:05:34.905','2025-01-27 06:05:34.905',2,2,3,'2024-12-27 06:05:34.907','2024-12-27 06:05:34.907'),(4,'2024-12-27 13:45:36.507','2025-01-27 13:45:36.507',3,2,4,'2024-12-27 13:45:36.508','2024-12-27 13:45:36.508');
/*!40000 ALTER TABLE `AgentPurchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentSubscription`
--

DROP TABLE IF EXISTS `AgentSubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentSubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `sub_type_id` int(11) NOT NULL,
  `sub_feature_id` int(11) NOT NULL,
  `sub_config_id` int(11) NOT NULL,
  `sub_price_id` int(11) NOT NULL,
  `available_llm_id` int(11) NOT NULL,
  `super_admin_id` int(11) DEFAULT NULL,
  `plan_name` varchar(191) NOT NULL,
  `disable` tinyint(1) NOT NULL,
  `access_user_limit` int(11) NOT NULL,
  `limit_level` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `AgentSubscription_agent_id_fkey` (`agent_id`),
  KEY `AgentSubscription_level_id_fkey` (`level_id`),
  KEY `AgentSubscription_sub_type_id_fkey` (`sub_type_id`),
  KEY `AgentSubscription_sub_feature_id_fkey` (`sub_feature_id`),
  KEY `AgentSubscription_sub_config_id_fkey` (`sub_config_id`),
  KEY `AgentSubscription_available_llm_id_fkey` (`available_llm_id`),
  KEY `AgentSubscription_sub_price_id_fkey` (`sub_price_id`),
  KEY `AgentSubscription_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `AgentSubscription_agent_id_fkey` FOREIGN KEY (`agent_id`) REFERENCES `AgentTypes` (`agent_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentSubscription_available_llm_id_fkey` FOREIGN KEY (`available_llm_id`) REFERENCES `AgentSubscriptionAvailableLLM` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentSubscription_level_id_fkey` FOREIGN KEY (`level_id`) REFERENCES `AgentLevel` (`level_id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentSubscription_sub_config_id_fkey` FOREIGN KEY (`sub_config_id`) REFERENCES `SubscriptionConfiguration` (`config_id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentSubscription_sub_feature_id_fkey` FOREIGN KEY (`sub_feature_id`) REFERENCES `SubscriptionFeatures` (`feature_id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentSubscription_sub_price_id_fkey` FOREIGN KEY (`sub_price_id`) REFERENCES `AgentSubscriptionPrices` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentSubscription_sub_type_id_fkey` FOREIGN KEY (`sub_type_id`) REFERENCES `SubscriptionType` (`sub_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentSubscription_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentSubscription`
--

LOCK TABLES `AgentSubscription` WRITE;
/*!40000 ALTER TABLE `AgentSubscription` DISABLE KEYS */;
INSERT INTO `AgentSubscription` VALUES (1,1,1,1,1,1,2,1,NULL,'Starters',0,10000,5,'2024-12-16 15:56:10.808','2024-12-16 15:56:10.808'),(2,1,1,2,2,2,1,1,NULL,'Starters',0,10000,5,'2024-12-16 15:57:00.222','2024-12-16 15:57:00.222'),(3,2,1,1,1,1,2,1,NULL,'Starters',0,500,5,'2024-12-16 15:57:51.167','2024-12-16 15:57:51.167'),(4,2,1,2,3,2,1,1,NULL,'Starters',0,100,5,'2024-12-16 15:59:05.092','2024-12-16 15:59:05.092');
/*!40000 ALTER TABLE `AgentSubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentSubscriptionAvailableLLM`
--

DROP TABLE IF EXISTS `AgentSubscriptionAvailableLLM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentSubscriptionAvailableLLM` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `AgentSubscriptionAvailableLLM_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `AgentSubscriptionAvailableLLM_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentSubscriptionAvailableLLM`
--

LOCK TABLES `AgentSubscriptionAvailableLLM` WRITE;
/*!40000 ALTER TABLE `AgentSubscriptionAvailableLLM` DISABLE KEYS */;
INSERT INTO `AgentSubscriptionAvailableLLM` VALUES (1,NULL,'2024-12-16 15:53:16.344','2024-12-16 15:53:16.344');
/*!40000 ALTER TABLE `AgentSubscriptionAvailableLLM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentSubscriptionPrices`
--

DROP TABLE IF EXISTS `AgentSubscriptionPrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentSubscriptionPrices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `AgentSubscriptionPrices_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `AgentSubscriptionPrices_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentSubscriptionPrices`
--

LOCK TABLES `AgentSubscriptionPrices` WRITE;
/*!40000 ALTER TABLE `AgentSubscriptionPrices` DISABLE KEYS */;
INSERT INTO `AgentSubscriptionPrices` VALUES (1,NULL,'2024-12-16 15:38:17.599','2024-12-16 15:38:17.599'),(2,NULL,'2024-12-16 15:38:24.870','2024-12-16 15:38:24.870');
/*!40000 ALTER TABLE `AgentSubscriptionPrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentTypes`
--

DROP TABLE IF EXISTS `AgentTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentTypes` (
  `agent_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `internal_name` varchar(191) NOT NULL,
  `external_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `agent_icon` varchar(191) DEFAULT NULL,
  `python_base_url` varchar(191) DEFAULT NULL,
  `disable` tinyint(1) NOT NULL DEFAULT 1,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`agent_type_id`),
  KEY `AgentTypes_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `AgentTypes_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentTypes`
--

LOCK TABLES `AgentTypes` WRITE;
/*!40000 ALTER TABLE `AgentTypes` DISABLE KEYS */;
INSERT INTO `AgentTypes` VALUES (1,'helper_agent','helper_agent','none',NULL,'/helper-agent/',0,NULL,'2024-12-16 15:37:36.337','2024-12-16 15:37:36.337'),(2,'Support_agent','support_agent',NULL,NULL,'/helper-agent/',0,NULL,'2024-12-16 15:38:01.636','2024-12-16 15:38:01.636');
/*!40000 ALTER TABLE `AgentTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentVersionTrainingLogs`
--

DROP TABLE IF EXISTS `AgentVersionTrainingLogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentVersionTrainingLogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_id` int(11) NOT NULL,
  `training_status` enum('STARTED','PROCESSING','FAILED','FINISHED') NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `AgentVersionTrainingLogs_version_id_fkey` (`version_id`),
  CONSTRAINT `AgentVersionTrainingLogs_version_id_fkey` FOREIGN KEY (`version_id`) REFERENCES `AgentVersions` (`version_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentVersionTrainingLogs`
--

LOCK TABLES `AgentVersionTrainingLogs` WRITE;
/*!40000 ALTER TABLE `AgentVersionTrainingLogs` DISABLE KEYS */;
INSERT INTO `AgentVersionTrainingLogs` VALUES (1,4,'PROCESSING','2024-12-27 09:59:41.862','2024-12-27 09:59:41.862'),(2,5,'PROCESSING','2024-12-27 10:02:10.683','2024-12-27 10:02:10.683'),(3,6,'PROCESSING','2024-12-27 10:25:49.940','2024-12-27 10:25:49.940'),(4,7,'PROCESSING','2024-12-27 10:26:55.167','2024-12-27 10:26:55.167'),(5,8,'PROCESSING','2024-12-27 10:27:52.347','2024-12-27 10:27:52.347'),(6,9,'PROCESSING','2024-12-27 10:30:32.099','2024-12-27 10:30:32.099'),(7,10,'PROCESSING','2024-12-27 10:31:33.778','2024-12-27 10:31:33.778'),(8,11,'PROCESSING','2024-12-27 10:32:58.479','2024-12-27 10:32:58.479'),(9,12,'PROCESSING','2024-12-27 10:33:22.465','2024-12-27 10:33:22.465'),(10,13,'PROCESSING','2024-12-27 10:44:31.607','2024-12-27 10:44:31.607'),(11,14,'PROCESSING','2024-12-27 10:44:54.982','2024-12-27 10:44:54.982'),(12,15,'PROCESSING','2024-12-27 10:45:36.562','2024-12-27 10:45:36.562'),(13,22,'PROCESSING','2024-12-27 10:51:35.753','2024-12-27 10:51:35.753'),(14,23,'PROCESSING','2024-12-27 10:57:24.092','2024-12-27 10:57:24.092'),(15,24,'PROCESSING','2024-12-27 10:58:38.496','2024-12-27 10:58:38.496'),(16,25,'PROCESSING','2024-12-27 10:59:37.397','2024-12-27 10:59:37.397'),(17,26,'PROCESSING','2024-12-27 11:00:17.623','2024-12-27 11:00:17.623'),(18,27,'PROCESSING','2024-12-27 11:09:39.396','2024-12-27 11:09:39.396'),(19,28,'PROCESSING','2024-12-27 11:10:40.130','2024-12-27 11:10:40.130'),(20,29,'PROCESSING','2024-12-27 11:11:09.423','2024-12-27 11:11:09.423'),(21,30,'PROCESSING','2024-12-27 11:12:57.022','2024-12-27 11:12:57.022'),(22,31,'PROCESSING','2024-12-27 11:13:23.928','2024-12-27 11:13:23.928'),(23,32,'PROCESSING','2024-12-27 11:23:13.263','2024-12-27 11:23:13.263'),(24,33,'PROCESSING','2024-12-27 11:25:09.014','2024-12-27 11:25:09.014'),(25,34,'PROCESSING','2024-12-27 11:26:51.807','2024-12-27 11:26:51.807'),(26,35,'PROCESSING','2024-12-27 11:30:20.245','2024-12-27 11:30:20.245'),(27,36,'PROCESSING','2024-12-27 11:30:31.026','2024-12-27 11:30:31.026'),(28,37,'PROCESSING','2024-12-27 11:30:52.816','2024-12-27 11:30:52.816'),(29,38,'PROCESSING','2024-12-27 11:36:45.376','2024-12-27 11:36:45.376'),(30,39,'PROCESSING','2024-12-27 11:38:29.532','2024-12-27 11:38:29.532'),(31,40,'PROCESSING','2024-12-27 11:39:16.914','2024-12-27 11:39:16.914'),(32,41,'PROCESSING','2024-12-27 11:39:58.563','2024-12-27 11:39:58.563'),(33,42,'PROCESSING','2024-12-27 11:40:05.551','2024-12-27 11:40:05.551'),(34,43,'PROCESSING','2024-12-27 11:44:53.890','2024-12-27 11:44:53.890'),(35,44,'PROCESSING','2024-12-27 11:45:11.746','2024-12-27 11:45:11.746'),(36,45,'PROCESSING','2024-12-27 11:48:21.934','2024-12-27 11:48:21.934'),(37,46,'PROCESSING','2024-12-27 12:02:29.654','2024-12-27 12:02:29.654'),(38,47,'PROCESSING','2024-12-27 12:04:57.114','2024-12-27 12:04:57.114'),(39,48,'PROCESSING','2024-12-27 12:20:20.366','2024-12-27 12:20:20.366'),(40,49,'PROCESSING','2024-12-27 12:20:41.522','2024-12-27 12:20:41.522'),(41,50,'PROCESSING','2024-12-27 13:47:48.713','2024-12-27 13:47:48.713'),(42,51,'PROCESSING','2024-12-27 13:49:03.097','2024-12-27 13:49:03.097'),(43,52,'PROCESSING','2024-12-27 13:49:31.795','2024-12-27 13:49:31.795'),(44,53,'PROCESSING','2024-12-30 06:53:53.590','2024-12-30 06:53:53.590'),(45,54,'PROCESSING','2024-12-30 06:54:52.694','2024-12-30 06:54:52.694'),(46,55,'PROCESSING','2024-12-30 06:55:06.012','2024-12-30 06:55:06.012'),(47,56,'PROCESSING','2024-12-30 06:55:42.444','2024-12-30 06:55:42.444'),(48,57,'PROCESSING','2024-12-30 06:57:52.018','2024-12-30 06:57:52.018'),(49,58,'PROCESSING','2024-12-30 06:58:18.783','2024-12-30 06:58:18.783'),(50,59,'PROCESSING','2024-12-30 06:59:14.111','2024-12-30 06:59:14.111'),(51,60,'PROCESSING','2024-12-30 07:00:24.981','2024-12-30 07:00:24.981'),(52,61,'PROCESSING','2024-12-30 07:01:02.406','2024-12-30 07:01:02.406'),(53,62,'PROCESSING','2024-12-30 07:04:26.245','2024-12-30 07:04:26.245'),(54,63,'PROCESSING','2024-12-30 07:05:05.163','2024-12-30 07:05:05.163'),(55,64,'PROCESSING','2024-12-30 07:06:20.466','2024-12-30 07:06:20.466'),(56,65,'PROCESSING','2024-12-30 07:07:25.617','2024-12-30 07:07:25.617'),(57,66,'PROCESSING','2024-12-30 07:08:50.463','2024-12-30 07:08:50.463'),(58,67,'PROCESSING','2024-12-30 07:25:48.656','2024-12-30 07:25:48.656');
/*!40000 ALTER TABLE `AgentVersionTrainingLogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AgentVersions`
--

DROP TABLE IF EXISTS `AgentVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AgentVersions` (
  `version_id` int(11) NOT NULL AUTO_INCREMENT,
  `version_name` varchar(191) NOT NULL,
  `agent_uuid` varchar(191) DEFAULT NULL,
  `raw_url` varchar(191) DEFAULT NULL,
  `train_url` varchar(191) DEFAULT NULL,
  `org_id` int(11) NOT NULL,
  `org_agent_id` int(11) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`version_id`),
  KEY `AgentVersions_org_id_fkey` (`org_id`),
  KEY `AgentVersions_org_agent_id_fkey` (`org_agent_id`),
  KEY `AgentVersions_org_user_id_fkey` (`org_user_id`),
  CONSTRAINT `AgentVersions_org_agent_id_fkey` FOREIGN KEY (`org_agent_id`) REFERENCES `OrganizationAgents` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentVersions_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `AgentVersions_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentVersions`
--

LOCK TABLES `AgentVersions` WRITE;
/*!40000 ALTER TABLE `AgentVersions` DISABLE KEYS */;
INSERT INTO `AgentVersions` VALUES (1,'new',NULL,NULL,'',3,4,3,'2024-12-27 09:54:40.186','2024-12-27 09:54:40.186'),(2,'new',NULL,NULL,'',3,4,3,'2024-12-27 09:55:18.859','2024-12-27 09:55:18.859'),(3,'new',NULL,NULL,'',3,4,3,'2024-12-27 09:57:14.784','2024-12-27 09:57:14.784'),(4,'new',NULL,NULL,'./files/3undefinedundefined/4/',3,4,3,'2024-12-27 09:59:41.846','2024-12-27 09:59:41.855'),(5,'new',NULL,NULL,'./files/3undefinedundefined/5/',3,4,3,'2024-12-27 10:02:10.668','2024-12-27 10:02:10.676'),(6,'new',NULL,NULL,'./files/3undefinedundefined/6/',3,4,3,'2024-12-27 10:25:49.931','2024-12-27 10:25:49.939'),(7,'new',NULL,NULL,'./files/3undefinedundefined/7/',3,4,3,'2024-12-27 10:26:55.158','2024-12-27 10:26:55.166'),(8,'new',NULL,NULL,'./files/3undefined1/8/',3,4,3,'2024-12-27 10:27:52.344','2024-12-27 10:27:52.346'),(9,'new',NULL,NULL,'./files/3undefinedundefined/9/',3,4,3,'2024-12-27 10:30:32.090','2024-12-27 10:30:32.098'),(10,'new',NULL,NULL,'./files/3undefinedundefined/10/',3,4,3,'2024-12-27 10:31:33.769','2024-12-27 10:31:33.776'),(11,'new',NULL,NULL,'./files/3undefinedundefined/11/',3,4,3,'2024-12-27 10:32:58.471','2024-12-27 10:32:58.478'),(12,'new',NULL,NULL,'./files/3undefinedundefined/12/',3,4,3,'2024-12-27 10:33:22.457','2024-12-27 10:33:22.464'),(13,'new',NULL,NULL,'./files/3undefined1/13/',3,4,3,'2024-12-27 10:44:31.601','2024-12-27 10:44:31.605'),(14,'new',NULL,NULL,'./files/3undefinedundefined/14/',3,4,3,'2024-12-27 10:44:54.980','2024-12-27 10:44:54.981'),(15,'new',NULL,NULL,'./files/3undefinedundefined/15/',3,4,3,'2024-12-27 10:45:36.554','2024-12-27 10:45:36.561'),(16,'new',NULL,NULL,'./files/3undefinedundefined/16/',3,4,3,'2024-12-27 10:46:41.677','2024-12-27 10:46:41.684'),(17,'new',NULL,NULL,'./files/3undefinedundefined/17/',3,4,3,'2024-12-27 10:46:53.544','2024-12-27 10:46:53.547'),(18,'new',NULL,NULL,'./files/3undefinedundefined/18/',3,4,3,'2024-12-27 10:47:56.690','2024-12-27 10:47:56.692'),(19,'new',NULL,NULL,'./files/3undefinedundefined/19/',3,4,3,'2024-12-27 10:48:53.910','2024-12-27 10:48:53.917'),(20,'new',NULL,NULL,'./files/3undefinedundefined/20/',3,4,3,'2024-12-27 10:48:54.814','2024-12-27 10:48:54.821'),(21,'new',NULL,NULL,'./files/3undefinedundefined/21/',3,4,3,'2024-12-27 10:48:55.636','2024-12-27 10:48:55.643'),(22,'new',NULL,NULL,'./files/3undefinedundefined/22/',3,4,3,'2024-12-27 10:51:35.750','2024-12-27 10:51:35.752'),(23,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddingsundefined/23/',3,4,3,'2024-12-27 10:57:24.083','2024-12-27 10:57:24.090'),(24,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddingsundefined/24/',3,4,3,'2024-12-27 10:58:38.487','2024-12-27 10:58:38.494'),(25,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddingsundefined/25/',3,4,3,'2024-12-27 10:59:37.389','2024-12-27 10:59:37.396'),(26,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddingsundefined/26/',3,4,3,'2024-12-27 11:00:17.614','2024-12-27 11:00:17.621'),(27,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/27/',3,4,3,'2024-12-27 11:09:39.393','2024-12-27 11:09:39.395'),(28,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/28/',3,4,3,'2024-12-27 11:10:40.126','2024-12-27 11:10:40.129'),(29,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/29/',3,4,3,'2024-12-27 11:11:09.414','2024-12-27 11:11:09.421'),(30,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/undefined/30/',3,4,3,'2024-12-27 11:12:57.013','2024-12-27 11:12:57.020'),(31,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/31/',3,4,3,'2024-12-27 11:13:23.922','2024-12-27 11:13:23.926'),(32,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/32/',3,4,3,'2024-12-27 11:23:13.258','2024-12-27 11:23:13.261'),(33,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/undefined/33/',3,4,3,'2024-12-27 11:25:09.004','2024-12-27 11:25:09.012'),(34,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/undefined/34/',3,4,3,'2024-12-27 11:26:51.798','2024-12-27 11:26:51.805'),(35,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/undefined/35/',3,4,3,'2024-12-27 11:30:20.236','2024-12-27 11:30:20.244'),(36,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/36/',3,4,3,'2024-12-27 11:30:31.019','2024-12-27 11:30:31.023'),(37,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/37/',3,4,3,'2024-12-27 11:30:52.807','2024-12-27 11:30:52.815'),(38,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/38/',3,4,3,'2024-12-27 11:36:45.371','2024-12-27 11:36:45.375'),(39,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/39/',3,4,3,'2024-12-27 11:38:29.517','2024-12-27 11:38:29.531'),(40,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/40/',3,4,3,'2024-12-27 11:39:16.911','2024-12-27 11:39:16.913'),(41,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/41/',3,4,3,'2024-12-27 11:39:58.555','2024-12-27 11:39:58.562'),(42,'new',NULL,NULL,'./files/3/helper-agent/process_and_create_embeddings/1/42/',3,4,3,'2024-12-27 11:40:05.542','2024-12-27 11:40:05.550'),(43,'new',NULL,NULL,'./files/2/helper-agent/process_and_create_embeddings/1/43/',2,8,1,'2024-12-27 11:44:53.885','2024-12-27 11:44:53.889'),(44,'new',NULL,NULL,'./files/2/helper-agent/process_and_create_embeddings/1/44/',2,8,1,'2024-12-27 11:45:11.737','2024-12-27 11:45:11.744'),(45,'new',NULL,NULL,'./files/2/helper-agent//1/45/',2,8,1,'2024-12-27 11:48:21.925','2024-12-27 11:48:21.933'),(46,'new',NULL,NULL,'./files/2/helper-agent//1/46/',2,8,1,'2024-12-27 12:02:29.642','2024-12-27 12:02:29.653'),(47,'new',NULL,NULL,'./files/2/helper-agent/1/47/',2,8,1,'2024-12-27 12:04:57.111','2024-12-27 12:04:57.113'),(48,'new',NULL,NULL,'./files/2/helper-agent/1/48/',2,8,1,'2024-12-27 12:20:20.360','2024-12-27 12:20:20.365'),(49,'new',NULL,NULL,'./files/2/helper-agent/1/49/',2,8,1,'2024-12-27 12:20:41.513','2024-12-27 12:20:41.521'),(50,'new',NULL,NULL,'./files/2/helper-agent/1/50/',2,9,1,'2024-12-27 13:47:48.709','2024-12-27 13:47:48.712'),(51,'new',NULL,NULL,'./files/2/helper-agent/1/51/',2,9,1,'2024-12-27 13:49:03.086','2024-12-27 13:49:03.095'),(52,'new',NULL,NULL,'./files/2/helper-agent/1/52/',2,9,1,'2024-12-27 13:49:31.791','2024-12-27 13:49:31.794'),(53,'new',NULL,NULL,'./files/3undefined1/53/',3,4,3,'2024-12-30 06:53:53.574','2024-12-30 06:53:53.584'),(54,'new',NULL,NULL,'./files/2/helper-agent/1/54/',2,9,1,'2024-12-30 06:54:52.681','2024-12-30 06:54:52.691'),(55,'new',NULL,NULL,'./files/2/helper-agent/1/55/',2,9,1,'2024-12-30 06:55:05.999','2024-12-30 06:55:06.008'),(56,'new',NULL,NULL,'./files/2/helper-agent/1/56/',2,9,1,'2024-12-30 06:55:42.430','2024-12-30 06:55:42.440'),(57,'new',NULL,NULL,'./files/2/helper-agent/1/57/',2,9,1,'2024-12-30 06:57:52.005','2024-12-30 06:57:52.014'),(58,'new',NULL,NULL,'./files/2/helper-agent/1/58/',2,9,1,'2024-12-30 06:58:18.768','2024-12-30 06:58:18.779'),(59,'new',NULL,NULL,'./files/2/helper-agent/1/59/',2,9,1,'2024-12-30 06:59:14.102','2024-12-30 06:59:14.108'),(60,'new',NULL,NULL,'./files/2/helper-agent/1/60/',2,9,1,'2024-12-30 07:00:24.968','2024-12-30 07:00:24.977'),(61,'new',NULL,NULL,'./files/2/helper-agent/1/61/',2,9,1,'2024-12-30 07:01:02.392','2024-12-30 07:01:02.402'),(62,'new',NULL,NULL,'./files/2/helper-agent/1/62/',2,9,1,'2024-12-30 07:04:26.235','2024-12-30 07:04:26.240'),(63,'new',NULL,NULL,'./files/2/helper-agent/1/63/',2,9,1,'2024-12-30 07:05:05.154','2024-12-30 07:05:05.160'),(64,'new',NULL,NULL,'./files/2/helper-agent/1/64/',2,9,1,'2024-12-30 07:06:20.452','2024-12-30 07:06:20.462'),(65,'new',NULL,NULL,'./files/2/helper-agent/1/65/',2,9,1,'2024-12-30 07:07:25.604','2024-12-30 07:07:25.614'),(66,'new',NULL,NULL,'../files/2/helper-agent/1/66/',2,9,1,'2024-12-30 07:08:50.447','2024-12-30 07:08:50.458'),(67,'new',NULL,NULL,'../files/2/helper-agent/1/67/',2,9,1,'2024-12-30 07:25:48.641','2024-12-30 07:25:48.652');
/*!40000 ALTER TABLE `AgentVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AvailableListAtLLMSubscription`
--

DROP TABLE IF EXISTS `AvailableListAtLLMSubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AvailableListAtLLMSubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_subscription_available_llm_id` int(11) NOT NULL,
  `llm_providers_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `AvailableListAtLLMSubscription_agent_subscription_available_fkey` (`agent_subscription_available_llm_id`),
  KEY `AvailableListAtLLMSubscription_llm_providers_id_fkey` (`llm_providers_id`),
  KEY `AvailableListAtLLMSubscription_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `AvailableListAtLLMSubscription_agent_subscription_available_fkey` FOREIGN KEY (`agent_subscription_available_llm_id`) REFERENCES `AgentSubscriptionAvailableLLM` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `AvailableListAtLLMSubscription_llm_providers_id_fkey` FOREIGN KEY (`llm_providers_id`) REFERENCES `LLMProviders` (`llm_id`) ON UPDATE CASCADE,
  CONSTRAINT `AvailableListAtLLMSubscription_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AvailableListAtLLMSubscription`
--

LOCK TABLES `AvailableListAtLLMSubscription` WRITE;
/*!40000 ALTER TABLE `AvailableListAtLLMSubscription` DISABLE KEYS */;
INSERT INTO `AvailableListAtLLMSubscription` VALUES (1,1,1,1,NULL,'2024-12-16 15:53:43.513','2024-12-16 15:53:43.513'),(2,1,2,1,NULL,'2024-12-16 15:53:55.784','2024-12-16 15:53:55.784'),(3,1,3,1,NULL,'2024-12-16 15:54:06.844','2024-12-16 15:54:06.844');
/*!40000 ALTER TABLE `AvailableListAtLLMSubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BillingInfo`
--

DROP TABLE IF EXISTS `BillingInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BillingInfo` (
  `billing_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_name` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `org_id` int(11) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`billing_info_id`),
  KEY `BillingInfo_org_id_fkey` (`org_id`),
  KEY `BillingInfo_org_user_id_fkey` (`org_user_id`),
  CONSTRAINT `BillingInfo_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `BillingInfo_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillingInfo`
--

LOCK TABLES `BillingInfo` WRITE;
/*!40000 ALTER TABLE `BillingInfo` DISABLE KEYS */;
INSERT INTO `BillingInfo` VALUES (1,'Ashwin','Ashwin, 73a, Thirumalai illam, Mahatmanagar',2,1,'2024-12-27 05:54:11.815','2024-12-27 05:54:11.815'),(2,'Ashwin','Ashwin, 73a, Thirumalai illam, Mahatmanagar',2,1,'2024-12-27 06:02:38.458','2024-12-27 06:02:38.458'),(3,'Ashwin','Ashwin, 73a, Thirumalai illam, Mahatmanagar',2,1,'2024-12-27 06:05:11.231','2024-12-27 06:05:11.231'),(4,'Ashwin','Ashwin, 73a, Thirumalai illam, Mahatmanagar',2,1,'2024-12-27 13:45:11.638','2024-12-27 13:45:11.638');
/*!40000 ALTER TABLE `BillingInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartItems`
--

DROP TABLE IF EXISTS `CartItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CartItems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_subscription_id` int(11) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `CartItems_agent_subscription_id_fkey` (`agent_subscription_id`),
  KEY `CartItems_org_user_id_fkey` (`org_user_id`),
  CONSTRAINT `CartItems_agent_subscription_id_fkey` FOREIGN KEY (`agent_subscription_id`) REFERENCES `AgentSubscription` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `CartItems_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartItems`
--

LOCK TABLES `CartItems` WRITE;
/*!40000 ALTER TABLE `CartItems` DISABLE KEYS */;
INSERT INTO `CartItems` VALUES (1,4,3,'2024-12-27 05:51:30.716','2024-12-27 05:51:30.716');
/*!40000 ALTER TABLE `CartItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChatConversation`
--

DROP TABLE IF EXISTS `ChatConversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChatConversation` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_group_id` varchar(191) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `llm_type_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `answer` text DEFAULT NULL,
  `question` varchar(191) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `ChatConversation_org_user_id_fkey` (`org_user_id`),
  KEY `ChatConversation_llm_type_id_fkey` (`llm_type_id`),
  KEY `ChatConversation_chat_group_id_fkey` (`chat_group_id`),
  CONSTRAINT `ChatConversation_chat_group_id_fkey` FOREIGN KEY (`chat_group_id`) REFERENCES `ChatGroups` (`chat_group_id`) ON UPDATE CASCADE,
  CONSTRAINT `ChatConversation_llm_type_id_fkey` FOREIGN KEY (`llm_type_id`) REFERENCES `OrganizationLLMEnabledInfo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ChatConversation_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChatConversation`
--

LOCK TABLES `ChatConversation` WRITE;
/*!40000 ALTER TABLE `ChatConversation` DISABLE KEYS */;
INSERT INTO `ChatConversation` VALUES (2,'02f17d3d-df9d-4e7e-a400-83116b6e95c2',3,1,'2024-12-24 06:06:41.054','2024-12-24 06:06:41.054','Need to modify this ','Who is Ibacus tech'),(3,'d7d7c07e-73cc-4f3f-8401-dd9c2e9ec798',3,1,'2024-12-24 06:12:09.376','2024-12-24 06:12:09.376','Need to modify this ','Who is Ibacus tech'),(4,'eeeb0dcd-d8c7-4e44-92ae-fdff0a4ba6bc',3,1,'2024-12-24 06:12:32.927','2024-12-24 06:12:32.927','Need to modify this ','What do greenestep do?'),(5,'f4792bf8-080f-48f3-b453-3d57bad3b060',3,1,'2024-12-24 06:12:50.247','2024-12-24 06:12:50.247','Need to modify this ','Who is Akidev Corp?'),(6,'845a4ebf-7cbb-4387-90fa-ed61cdabbc8b',3,1,'2024-12-24 06:13:06.168','2024-12-24 06:13:06.168','Need to modify this ','Who is Sunil Kumar?'),(7,'d3e8be6a-1201-4790-956a-374ccbf36a1e',3,1,'2024-12-24 06:59:07.839','2024-12-24 06:59:07.839','Need to modify this ','Who is Sunil Kumar?'),(8,'79c18874-09ff-42b4-b1f9-e035f93793e4',3,1,'2024-12-24 06:59:10.041','2024-12-24 06:59:10.041','Need to modify this ','Who is Sunil Kumar?'),(9,'79c18874-09ff-42b4-b1f9-e035f93793e4',3,1,'2024-12-24 06:59:25.313','2024-12-24 06:59:25.313','Need to modify this ','Who is Sunil Kumar?'),(10,'79c18874-09ff-42b4-b1f9-e035f93793e4',3,1,'2024-12-24 06:59:26.632','2024-12-24 06:59:26.632','Need to modify this ','Who is Sunil Kumar?'),(11,'79c18874-09ff-42b4-b1f9-e035f93793e4',3,1,'2024-12-24 06:59:27.901','2024-12-24 06:59:27.901','Need to modify this ','Who is Sunil Kumar?'),(12,'79c18874-09ff-42b4-b1f9-e035f93793e4',3,1,'2024-12-24 06:59:29.605','2024-12-24 06:59:29.605','Need to modify this ','Who is Sunil Kumar?'),(13,'79c18874-09ff-42b4-b1f9-e035f93793e4',3,1,'2024-12-24 06:59:30.518','2024-12-24 06:59:30.518','Need to modify this ','Who is Sunil Kumar?'),(14,'79c18874-09ff-42b4-b1f9-e035f93793e4',3,1,'2024-12-24 06:59:31.492','2024-12-24 06:59:31.492','Need to modify this ','Who is Sunil Kumar?'),(15,'d7d7c07e-73cc-4f3f-8401-dd9c2e9ec798',3,1,'2024-12-24 07:43:42.455','2024-12-24 07:43:42.455','Need to modify this ','Who is Amul?'),(16,'d7d7c07e-73cc-4f3f-8401-dd9c2e9ec798',3,1,'2024-12-24 07:43:54.690','2024-12-24 07:43:54.690','Need to modify this ','Who is Ranu?'),(17,'d7d7c07e-73cc-4f3f-8401-dd9c2e9ec798',3,1,'2024-12-24 07:44:05.496','2024-12-24 07:44:05.496','Need to modify this ','What is their goal?'),(18,'8dfd3948-cc50-49b6-8997-a5c040e7dd6a',3,1,'2024-12-24 11:37:58.804','2024-12-24 11:37:58.804','Need to modify this ','how to clear all the bugs in Zoom\n\n'),(19,'c4b141c2-1bb0-4a3e-b3a6-5f8e1223ff45',3,1,'2024-12-24 11:39:21.904','2024-12-24 11:39:21.904','Need to modify this ','Is greenestep an big company'),(20,'c2832810-232d-4c48-b01a-7496974bb503',3,1,'2024-12-24 11:40:43.192','2024-12-24 11:40:43.192','Need to modify this ','how about their CRM'),(21,'420cf825-3810-4034-b44e-3e3527171c22',3,1,'2024-12-24 11:48:01.107','2024-12-24 11:48:01.107','Need to modify this ','CaN WE PLAY A GAME'),(22,'acbe7283-0e98-456c-9261-58d2d5b42ca4',3,1,'2024-12-24 11:49:15.581','2024-12-24 11:49:15.581','Need to modify this ','CaN WE PLAY A GAME'),(23,'acbe7283-0e98-456c-9261-58d2d5b42ca4',3,1,'2024-12-24 11:49:39.881','2024-12-24 11:49:39.881','Need to modify this ','Can we hit a car\n\n'),(24,'acbe7283-0e98-456c-9261-58d2d5b42ca4',3,1,'2024-12-24 11:50:05.397','2024-12-24 11:50:05.397','Need to modify this ','Can we sell a car?\n\n\n\n'),(25,'3b576e56-07dd-49af-89c4-51b0c01de843',3,1,'2024-12-24 11:51:24.026','2024-12-24 11:51:24.026','Need to modify this ','What are the products that greenestep provides'),(26,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:54:31.877','2024-12-24 11:54:31.877','Need to modify this ','Do cybersecurity provides an good feature'),(27,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:39.535','2024-12-24 11:55:39.535','Need to modify this ',''),(28,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:40.879','2024-12-24 11:55:40.879','Need to modify this ',''),(29,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:41.480','2024-12-24 11:55:41.480','Need to modify this ',''),(30,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:41.626','2024-12-24 11:55:41.626','Need to modify this ',''),(31,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:41.779','2024-12-24 11:55:41.779','Need to modify this ',''),(32,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:41.933','2024-12-24 11:55:41.933','Need to modify this ',''),(33,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:42.080','2024-12-24 11:55:42.080','Need to modify this ',''),(34,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:42.213','2024-12-24 11:55:42.213','Need to modify this ',''),(35,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:42.393','2024-12-24 11:55:42.393','Need to modify this ',''),(36,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:46.440','2024-12-24 11:55:46.440','Need to modify this ',''),(37,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:55:49.703','2024-12-24 11:55:49.703','Need to modify this ',''),(38,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 11:57:24.127','2024-12-24 11:57:24.127','Need to modify this ','hey please help me'),(39,'1df332ae-dc85-4193-82d8-b34d9babe8b7',3,1,'2024-12-24 11:58:09.799','2024-12-24 11:58:09.799','Need to modify this ','What are the CRM functionalites which Greenestep CRM provides'),(40,'89541d6f-1eae-492a-a4ac-0d692c4ab800',3,1,'2024-12-24 12:13:20.855','2024-12-24 12:13:20.855','Need to modify this ','Hello world'),(41,'ca3bcc6d-4578-4dd1-8175-80333185e35e',3,1,'2024-12-24 12:39:20.877','2024-12-24 12:39:20.877','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','Generate some info about greenestep'),(42,'ca3bcc6d-4578-4dd1-8175-80333185e35e',3,1,'2024-12-24 12:45:16.402','2024-12-24 12:45:16.402','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','help me out'),(43,'ca3bcc6d-4578-4dd1-8175-80333185e35e',3,1,'2024-12-24 12:53:21.453','2024-12-24 12:53:21.453','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','Help me to do this task'),(44,'345e773a-6333-443d-8e8b-5125e2161a71',3,1,'2024-12-24 13:11:31.058','2024-12-24 13:11:31.058','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','Help Me out'),(45,'838be46a-1d4a-4723-8b20-040600df7396',3,1,'2024-12-26 06:10:11.569','2024-12-26 06:10:11.569','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','How greenestep will give business ideas?'),(46,'77e26bbb-9afb-4f14-9e49-7202078e8489',3,1,'2024-12-26 06:51:17.169','2024-12-26 06:51:17.169','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','What is greenestep'),(47,'a97976c9-1267-4805-b729-4f39e487f1ef',4,2,'2024-12-26 12:04:37.695','2024-12-26 12:04:37.695','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','hi pandisfdsfsd'),(48,'0775f443-f289-4613-94ff-28d99c4a4d99',4,2,'2024-12-26 12:05:20.297','2024-12-26 12:05:20.297','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','Hi Swetha Are you working fynn?'),(49,'4f092daa-6292-4a41-9647-7ca1aa640afe',1,2,'2024-12-27 06:06:22.938','2024-12-27 06:06:22.938','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','Hello'),(50,'bbc43bbe-f972-4ead-adaf-7b235d92ebc6',1,2,'2024-12-27 13:01:08.119','2024-12-27 13:01:08.119','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(51,'7b1b19b8-a20d-4d43-881f-cc316326d55e',1,2,'2024-12-27 13:08:44.670','2024-12-27 13:08:44.670','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(52,'837d0a52-4e7e-43ce-9f49-ce2e9e7f139b',1,2,'2024-12-27 13:10:38.256','2024-12-27 13:10:38.256','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(53,'94cd2682-d56b-4f49-8ed1-79320377f1b7',1,2,'2024-12-27 13:11:02.983','2024-12-27 13:11:02.983','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(54,'1b6b4d80-662c-4de8-8d29-f36da2ec4f42',1,2,'2024-12-27 13:12:57.545','2024-12-27 13:12:57.545','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(55,'0908c5f5-1898-4e4b-b464-ceac4aa09b28',1,2,'2024-12-27 13:13:48.325','2024-12-27 13:13:48.325','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(56,'2d19d7c7-1fb9-4d67-b472-e05c989cd9f5',1,2,'2024-12-27 13:18:25.319','2024-12-27 13:18:25.319','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(57,'95880d37-d43f-409e-92f4-3de44e029a16',1,2,'2024-12-27 13:20:12.846','2024-12-27 13:20:12.846','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(58,'cc03ce73-80c1-4b55-9ec0-2b737fc9e828',1,2,'2024-12-27 13:21:36.762','2024-12-27 13:21:36.762','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(59,'b8895a5f-4113-45e8-9295-b5d021a7fba9',1,2,'2024-12-27 13:21:48.327','2024-12-27 13:21:48.327','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','looo'),(60,'b8895a5f-4113-45e8-9295-b5d021a7fba9',1,2,'2024-12-27 13:23:39.237','2024-12-27 13:23:39.237','Greenestep Technologies is an innovative company dedicated to providing sustainable and eco-friendly solutions in various industries.','Hello Model Please Give me Info'),(61,'b8895a5f-4113-45e8-9295-b5d021a7fba9',1,2,'2024-12-27 13:28:52.433','2024-12-27 13:28:52.433','**GreeneStep** is an integrated business automation and management suite designed for small to medium-sized businesses (SMBs). It offers solutions like ERP, CRM, Ecommerce, project collaboration, and BI analytics, helping organizations digitally transform, optimize operations, and drive growth while reducing costs and carbon footprints. Established in 2008, it promotes sustainable business practices.','What is greenestep?'),(62,'b8895a5f-4113-45e8-9295-b5d021a7fba9',1,2,'2024-12-27 13:29:38.050','2024-12-27 13:29:38.050','I\'m sorry, but I don\'t have any information on a person named Sunil Kumar in the context of GreeneStep products or services. For further assistance regarding specific individuals, I recommend checking external sources or visiting our support page for more information.','who is sunil kumar?'),(63,'b8895a5f-4113-45e8-9295-b5d021a7fba9',1,2,'2024-12-27 13:30:02.933','2024-12-27 13:30:02.933','I\'m sorry, but I don\'t have any information on an individual named Sunil Kumar. For specific inquiries about people or to find more detailed information, please consider searching online or visiting relevant resources. If you have questions regarding GreeneStep products or services, feel free to ask!','Who is Sunil Kumar'),(64,'b8895a5f-4113-45e8-9295-b5d021a7fba9',1,2,'2024-12-27 13:30:24.906','2024-12-27 13:30:24.906','GreeneStep offers a range of integrated products designed for business automation, including:\n\n- **ERP for Renewable Industry**\n- **Distribution ERP**\n- **Manufacturing ERP**\n- **CRM**\n- **Collaboration Tools**\n- **Ticketing Solution**\n- **GIFT AI Analytics**\n\nThese solutions streamline operations, enhance efficiency, and support sustainable business growth. Visit GreeneStep for more details.','What are greenestep products?'),(65,'b8895a5f-4113-45e8-9295-b5d021a7fba9',1,2,'2024-12-27 13:30:40.057','2024-12-27 13:30:40.057','**GIFT** stands for **GreeneStep Intelligent Forecasting Technology**. It is an AI-powered analytics platform that provides businesses with insights through predictive analytics, customer journey analysis, and decision support. GIFT helps organizations optimize their operations by generating actionable insights, enhancing decision-making, and driving growth through advanced data analysis techniques.','What is GIFT?'),(66,'7d8b96ac-f746-4613-ad95-f5ff827f940d',1,2,'2024-12-27 13:50:44.795','2024-12-27 13:50:44.795','**GreeneStep** is a technology company specializing in business process automation software. It offers solutions like **ERP**, **CRM**, and **AI-driven forecasting** to help small and medium-sized businesses streamline operations and improve efficiency. With a focus on innovation, GreeneStep aims to empower businesses worldwide with advanced technological tools.','Who is greenestep?'),(67,'7d8b96ac-f746-4613-ad95-f5ff827f940d',1,2,'2024-12-27 13:51:02.959','2024-12-27 13:51:02.959','GreeneStep offers a comprehensive suite of solutions including *Enterprise Resource Planning (ERP)*, *Customer Relationship Management (CRM)*, and *Business Analytics*. Their platform supports small and mid-sized businesses in managing accounting, inventory, and sales processes, enhancing operational efficiency and facilitating growth through integrated solutions tailored for various industries.','What greenestep offers?'),(68,'7d8b96ac-f746-4613-ad95-f5ff827f940d',1,2,'2024-12-27 13:51:17.273','2024-12-27 13:51:17.273','**GIFT** (GreeneStep Intelligent Forecasting Technology) is an AI-powered analytics platform designed to provide critical insights for data-driven decision-making. It empowers business leaders and decision-makers with tools to analyze data effectively, enabling informed predictions and strategic planning for enhanced operational efficiency and business growth.','What is Gift?'),(69,'7d8b96ac-f746-4613-ad95-f5ff827f940d',1,2,'2024-12-27 13:51:30.092','2024-12-27 13:51:30.092','I\'m sorry, but I don\'t have any information about \"ibacustech\". For more details or assistance, please visit the GreeneStep Support page or check relevant online resources.','Who is ibacustech?'),(70,'7d8b96ac-f746-4613-ad95-f5ff827f940d',1,2,'2024-12-27 13:51:50.130','2024-12-27 13:51:50.130','**GreeneStep Agents** are AI-powered business assistants designed to enhance efficiency across various functions. They include specialized agents for finance, sales, fulfillment, and support, providing 24/7 assistance, data insights, and streamlined processes. These agents aim to improve customer satisfaction and drive business growth through intelligent automation.','What is greenestep agents?'),(71,'fd31260a-1d3c-4da0-b40b-f4e0359fc983',1,2,'2024-12-30 07:26:23.542','2024-12-30 07:26:23.542','**GreeneStep** is an integrated business automation and management suite designed to help small and medium-sized businesses (SMBs) digitally transform their operations. It offers a range of solutions, including:\n\n1. **ERP (Enterprise Resource Planning)**: Streamlines business processes across various functions such as finance, inventory, and customer management.\n   \n2. **CRM (Customer Relationship Management)**: Enhances customer interactions and relationships.\n   \n3. **Ecommerce**: Facilitates online sales and integration with inventory management.\n   \n4. **Project Collaboration**: Improves teamwork and project management.\n   \n5. **BI Analytics**: Provides insights through business intelligence tools to drive growth and profitability.\n   \n6. **Financial Accounting**: Manages accounting needs efficiently.\n\nGreeneStep aims to reduce carbon footprints, promote digitization, and create job opportunities while providing *affordable* and *innovative* solutions to unlock the full potential of businesses.\n\nFor more detailed information, please visit [GreeneStep\'s website](https://greenestep.com).','What is Greenestep?'),(72,'fd31260a-1d3c-4da0-b40b-f4e0359fc983',1,2,'2024-12-30 07:27:19.934','2024-12-30 07:27:19.934','I\'m sorry, but I don\'t have information on \"Sunil Kumar\" in the context of GreeneStep products or services. \n\nFor more detailed information, I recommend visiting our website at [GreeneStep](https://greenestep.com/) or checking out our support page.','Who is Sunil Kumar?');
/*!40000 ALTER TABLE `ChatConversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChatGroups`
--

DROP TABLE IF EXISTS `ChatGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChatGroups` (
  `chat_group_id` varchar(191) NOT NULL,
  `chat_name` varchar(191) NOT NULL,
  `org_user_agents_id` int(11) DEFAULT NULL,
  `org_agent_id` int(11) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`chat_group_id`),
  KEY `ChatGroups_org_agent_id_fkey` (`org_agent_id`),
  KEY `ChatGroups_org_user_id_fkey` (`org_user_id`),
  KEY `ChatGroups_org_user_agents_id_fkey` (`org_user_agents_id`),
  CONSTRAINT `ChatGroups_org_agent_id_fkey` FOREIGN KEY (`org_agent_id`) REFERENCES `OrganizationAgents` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ChatGroups_org_user_agents_id_fkey` FOREIGN KEY (`org_user_agents_id`) REFERENCES `OrganisationUserAgents` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ChatGroups_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChatGroups`
--

LOCK TABLES `ChatGroups` WRITE;
/*!40000 ALTER TABLE `ChatGroups` DISABLE KEYS */;
INSERT INTO `ChatGroups` VALUES ('02f17d3d-df9d-4e7e-a400-83116b6e95c2','Who is Ibacus tech',NULL,6,3,'2024-12-24 06:06:41.016','2024-12-24 06:06:41.016'),('0775f443-f289-4613-94ff-28d99c4a4d99','Hi Swetha Are you working fynn?',NULL,6,4,'2024-12-26 12:05:20.288','2024-12-26 12:05:20.288'),('0908c5f5-1898-4e4b-b464-ceac4aa09b28','looo',NULL,8,1,'2024-12-27 13:13:48.318','2024-12-27 13:13:48.318'),('1b6b4d80-662c-4de8-8d29-f36da2ec4f42','looo',NULL,8,1,'2024-12-27 13:12:57.543','2024-12-27 13:12:57.543'),('1df332ae-dc85-4193-82d8-b34d9babe8b7','What are the CRM functionalites which Greenestep CRM provides',NULL,6,3,'2024-12-24 11:58:09.791','2024-12-24 11:58:09.791'),('2d19d7c7-1fb9-4d67-b472-e05c989cd9f5','looo',NULL,8,1,'2024-12-27 13:18:25.318','2024-12-27 13:18:25.318'),('345e773a-6333-443d-8e8b-5125e2161a71','Help Me out',NULL,6,3,'2024-12-24 13:11:31.049','2024-12-24 13:11:31.049'),('3b576e56-07dd-49af-89c4-51b0c01de843','What are the products that greenestep provides',NULL,6,3,'2024-12-24 11:51:24.017','2024-12-24 11:51:24.017'),('420cf825-3810-4034-b44e-3e3527171c22','CaN WE PLAY A GAME',NULL,6,3,'2024-12-24 11:48:01.098','2024-12-24 11:48:01.098'),('4f092daa-6292-4a41-9647-7ca1aa640afe','Hello',NULL,8,1,'2024-12-27 06:06:22.929','2024-12-27 06:06:22.929'),('733a63a3-7fe9-4631-8d1c-2dec0ec09900','Generate some info about greenestep',NULL,6,3,'2024-12-24 12:38:17.485','2024-12-24 12:38:17.485'),('77e26bbb-9afb-4f14-9e49-7202078e8489','What is greenestep',NULL,4,3,'2024-12-26 06:51:17.165','2024-12-26 06:51:17.165'),('79c18874-09ff-42b4-b1f9-e035f93793e4','Who is Sunil Kumar?',NULL,6,3,'2024-12-24 06:59:10.035','2024-12-24 06:59:10.035'),('7b1b19b8-a20d-4d43-881f-cc316326d55e','looo',NULL,8,1,'2024-12-27 13:08:44.668','2024-12-27 13:08:44.668'),('7d8b96ac-f746-4613-ad95-f5ff827f940d','Who is greenestep?',NULL,9,1,'2024-12-27 13:50:43.297','2024-12-27 13:50:43.297'),('837d0a52-4e7e-43ce-9f49-ce2e9e7f139b','looo',NULL,8,1,'2024-12-27 13:10:38.254','2024-12-27 13:10:38.254'),('838be46a-1d4a-4723-8b20-040600df7396','How greenestep will give business ideas?',NULL,7,3,'2024-12-26 06:10:11.564','2024-12-26 06:10:11.564'),('845a4ebf-7cbb-4387-90fa-ed61cdabbc8b','Who is Sunil Kumar?',NULL,6,3,'2024-12-24 06:13:06.162','2024-12-24 06:13:06.162'),('89541d6f-1eae-492a-a4ac-0d692c4ab800','Do cybersecurity provides an good feature',NULL,6,3,'2024-12-24 11:54:31.868','2024-12-24 11:54:31.868'),('8dfd3948-cc50-49b6-8997-a5c040e7dd6a','how to clear all the bugs in Zoom\n\n',NULL,6,3,'2024-12-24 11:37:58.794','2024-12-24 11:37:58.794'),('94cd2682-d56b-4f49-8ed1-79320377f1b7','looo',NULL,8,1,'2024-12-27 13:11:02.975','2024-12-27 13:11:02.975'),('95880d37-d43f-409e-92f4-3de44e029a16','looo',NULL,8,1,'2024-12-27 13:20:12.845','2024-12-27 13:20:12.845'),('a97976c9-1267-4805-b729-4f39e487f1ef','hi pandisfdsfsd',NULL,6,4,'2024-12-26 12:04:37.690','2024-12-26 12:04:37.690'),('a994ba53-1c3b-4d85-8ed4-ad02f245d060','Hi Swetha Are you working fynn?',NULL,6,4,'2024-12-26 12:05:14.912','2024-12-26 12:05:14.912'),('acbe7283-0e98-456c-9261-58d2d5b42ca4','CaN WE PLAY A GAME',NULL,6,3,'2024-12-24 11:49:15.577','2024-12-24 11:49:15.577'),('b8895a5f-4113-45e8-9295-b5d021a7fba9','looo',NULL,8,1,'2024-12-27 13:21:48.320','2024-12-27 13:21:48.320'),('bbc43bbe-f972-4ead-adaf-7b235d92ebc6','looo',NULL,8,1,'2024-12-27 13:01:08.117','2024-12-27 13:01:08.117'),('c2832810-232d-4c48-b01a-7496974bb503','how about their CRM',NULL,6,3,'2024-12-24 11:40:43.184','2024-12-24 11:40:43.184'),('c4b141c2-1bb0-4a3e-b3a6-5f8e1223ff45','Is greenestep an big company',NULL,6,3,'2024-12-24 11:39:21.895','2024-12-24 11:39:21.895'),('ca3bcc6d-4578-4dd1-8175-80333185e35e','Generate some info about greenestep',NULL,6,3,'2024-12-24 12:39:20.867','2024-12-24 12:39:20.867'),('cc03ce73-80c1-4b55-9ec0-2b737fc9e828','looo',NULL,8,1,'2024-12-27 13:21:36.761','2024-12-27 13:21:36.761'),('d3e8be6a-1201-4790-956a-374ccbf36a1e','Who is Sunil Kumar?',NULL,6,3,'2024-12-24 06:59:07.833','2024-12-24 06:59:07.833'),('d7d7c07e-73cc-4f3f-8401-dd9c2e9ec798','Who is Ibacus tech',NULL,6,3,'2024-12-24 06:12:09.368','2024-12-24 06:12:09.368'),('e76dbe2f-23bb-41c9-af9a-01597fe7a565','Who is Ibacus tech',NULL,6,3,'2024-12-24 06:03:35.325','2024-12-24 06:03:35.325'),('eeeb0dcd-d8c7-4e44-92ae-fdff0a4ba6bc','What do greenestep do?',NULL,6,3,'2024-12-24 06:12:32.921','2024-12-24 06:12:32.921'),('f4792bf8-080f-48f3-b453-3d57bad3b060','Who is Akidev Corp?',NULL,6,3,'2024-12-24 06:12:50.245','2024-12-24 06:12:50.245'),('fd31260a-1d3c-4da0-b40b-f4e0359fc983','What is Greenestep?',NULL,9,1,'2024-12-30 07:26:18.528','2024-12-30 07:26:18.528');
/*!40000 ALTER TABLE `ChatGroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Currency`
--

DROP TABLE IF EXISTS `Currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(191) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `is_global` tinyint(1) NOT NULL,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`currency_id`),
  KEY `Currency_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `Currency_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Currency`
--

LOCK TABLES `Currency` WRITE;
/*!40000 ALTER TABLE `Currency` DISABLE KEYS */;
INSERT INTO `Currency` VALUES (1,'INR','inr',1,NULL,'2024-12-16 15:39:30.802','2024-12-16 15:39:30.802'),(2,'DOLLAR','usd',0,NULL,'2024-12-16 15:39:47.875','2024-12-16 15:39:47.875');
/*!40000 ALTER TABLE `Currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DurationInMonths`
--

DROP TABLE IF EXISTS `DurationInMonths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DurationInMonths` (
  `duration_in_month_id` int(11) NOT NULL AUTO_INCREMENT,
  `duration_name` varchar(191) NOT NULL,
  `no_of_months` int(11) NOT NULL,
  `discount_percent` int(11) NOT NULL,
  `discount_price` double NOT NULL,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`duration_in_month_id`),
  KEY `DurationInMonths_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `DurationInMonths_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DurationInMonths`
--

LOCK TABLES `DurationInMonths` WRITE;
/*!40000 ALTER TABLE `DurationInMonths` DISABLE KEYS */;
INSERT INTO `DurationInMonths` VALUES (3,'None',1,10,1000,5,'2024-12-27 11:32:30.107','2024-12-27 11:32:30.107');
/*!40000 ALTER TABLE `DurationInMonths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExtPaymentInfo`
--

DROP TABLE IF EXISTS `ExtPaymentInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExtPaymentInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_info` varchar(191) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `ExtPaymentInfo_org_user_id_fkey` (`org_user_id`),
  CONSTRAINT `ExtPaymentInfo_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExtPaymentInfo`
--

LOCK TABLES `ExtPaymentInfo` WRITE;
/*!40000 ALTER TABLE `ExtPaymentInfo` DISABLE KEYS */;
INSERT INTO `ExtPaymentInfo` VALUES (1,'order_Pc5mWHy3djS8Fo',1,'2024-12-27 05:54:11.827','2024-12-27 05:54:11.827'),(2,'order_Pc5vRKxO06aNMO',1,'2024-12-27 06:02:38.469','2024-12-27 06:02:38.469'),(3,'order_Pc5y862gJoOO1p',1,'2024-12-27 06:05:11.242','2024-12-27 06:05:11.242'),(4,'order_PcDo32FRBqMNaO',1,'2024-12-27 13:45:11.646','2024-12-27 13:45:11.646');
/*!40000 ALTER TABLE `ExtPaymentInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LLMProviders`
--

DROP TABLE IF EXISTS `LLMProviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LLMProviders` (
  `llm_id` int(11) NOT NULL AUTO_INCREMENT,
  `llm_internal_name` varchar(191) NOT NULL,
  `llm_external_name` varchar(191) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `llm_variable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`llm_id`),
  KEY `LLMProviders_llm_variable_id_fkey` (`llm_variable_id`),
  CONSTRAINT `LLMProviders_llm_variable_id_fkey` FOREIGN KEY (`llm_variable_id`) REFERENCES `VariableInfo` (`variable_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LLMProviders`
--

LOCK TABLES `LLMProviders` WRITE;
/*!40000 ALTER TABLE `LLMProviders` DISABLE KEYS */;
INSERT INTO `LLMProviders` VALUES (1,'gpt-4o-mini','Chat GPT','2024-12-16 15:52:04.783','2024-12-16 15:52:04.783',2),(2,'lama','Lama','2024-12-16 15:52:15.033','2024-12-16 15:52:15.033',3),(3,'gemini','Gemini','2024-12-16 15:52:26.917','2024-12-16 15:52:26.917',4);
/*!40000 ALTER TABLE `LLMProviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `coupon_id` int(11) DEFAULT NULL,
  `order_status` varchar(191) NOT NULL,
  `coupon_discount` double NOT NULL,
  `final_price` double NOT NULL,
  `payment_status` varchar(191) NOT NULL,
  `ext_payment_info_id` int(11) NOT NULL,
  `billing_info_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `Order_org_user_id_fkey` (`org_user_id`),
  KEY `Order_ext_payment_info_id_fkey` (`ext_payment_info_id`),
  KEY `Order_billing_info_id_fkey` (`billing_info_id`),
  CONSTRAINT `Order_billing_info_id_fkey` FOREIGN KEY (`billing_info_id`) REFERENCES `BillingInfo` (`billing_info_id`) ON UPDATE CASCADE,
  CONSTRAINT `Order_ext_payment_info_id_fkey` FOREIGN KEY (`ext_payment_info_id`) REFERENCES `ExtPaymentInfo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `Order_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,1,'2024-12-27 05:54:11.832','2024-12-27 05:54:11.832',NULL,'created',0,1500,'pending',1,1),(2,1,'2024-12-27 06:02:38.473','2024-12-27 06:03:12.836',NULL,'completed',0,1500,'paid',2,2),(3,1,'2024-12-27 06:05:11.246','2024-12-27 06:05:34.890',NULL,'completed',0,1500,'paid',3,3),(4,1,'2024-12-27 13:45:11.649','2024-12-27 13:45:36.499',NULL,'completed',0,1500,'paid',4,4);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItems`
--

DROP TABLE IF EXISTS `OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderItems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `sub_type_id` int(11) NOT NULL,
  `sub_feature_id` int(11) NOT NULL,
  `sub_config_id` int(11) NOT NULL,
  `sub_price_id` int(11) NOT NULL,
  `available_llm_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `item_duration_month` int(11) NOT NULL,
  `duration_in_months_id` int(11) DEFAULT NULL,
  `duration_discount` double NOT NULL,
  `final_price` double NOT NULL,
  `agent_subscription_id` int(11) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `OrderItems_order_id_fkey` (`order_id`),
  KEY `OrderItems_agent_id_fkey` (`agent_id`),
  KEY `OrderItems_level_id_fkey` (`level_id`),
  KEY `OrderItems_sub_type_id_fkey` (`sub_type_id`),
  KEY `OrderItems_sub_feature_id_fkey` (`sub_feature_id`),
  KEY `OrderItems_sub_config_id_fkey` (`sub_config_id`),
  KEY `OrderItems_available_llm_id_fkey` (`available_llm_id`),
  KEY `OrderItems_org_id_fkey` (`org_id`),
  KEY `OrderItems_price_id_fkey` (`price_id`),
  KEY `OrderItems_duration_in_months_id_fkey` (`duration_in_months_id`),
  KEY `OrderItems_agent_subscription_id_fkey` (`agent_subscription_id`),
  KEY `OrderItems_org_user_id_fkey` (`org_user_id`),
  CONSTRAINT `OrderItems_agent_id_fkey` FOREIGN KEY (`agent_id`) REFERENCES `AgentTypes` (`agent_type_id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_agent_subscription_id_fkey` FOREIGN KEY (`agent_subscription_id`) REFERENCES `AgentSubscription` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_available_llm_id_fkey` FOREIGN KEY (`available_llm_id`) REFERENCES `AgentSubscriptionAvailableLLM` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_duration_in_months_id_fkey` FOREIGN KEY (`duration_in_months_id`) REFERENCES `DurationInMonths` (`duration_in_month_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_level_id_fkey` FOREIGN KEY (`level_id`) REFERENCES `AgentLevel` (`level_id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_price_id_fkey` FOREIGN KEY (`price_id`) REFERENCES `AgentPrices` (`price_id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_sub_config_id_fkey` FOREIGN KEY (`sub_config_id`) REFERENCES `SubscriptionConfiguration` (`config_id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_sub_feature_id_fkey` FOREIGN KEY (`sub_feature_id`) REFERENCES `SubscriptionFeatures` (`feature_id`) ON UPDATE CASCADE,
  CONSTRAINT `OrderItems_sub_type_id_fkey` FOREIGN KEY (`sub_type_id`) REFERENCES `SubscriptionType` (`sub_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItems`
--

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;
INSERT INTO `OrderItems` VALUES (1,2,2,1,2,3,2,1,1,2,1,1,3,0,1500,4,1,'2024-12-27 06:02:38.494','2024-12-27 06:02:38.494'),(2,3,2,1,2,3,2,1,1,2,1,1,3,0,1500,4,1,'2024-12-27 06:05:11.267','2024-12-27 06:05:11.267'),(3,4,2,1,2,3,2,1,1,2,1,1,3,0,1500,4,1,'2024-12-27 13:45:11.659','2024-12-27 13:45:11.659');
/*!40000 ALTER TABLE `OrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderStatus`
--

DROP TABLE IF EXISTS `OrderStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderStatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `OrderStatus_order_id_fkey` (`order_id`),
  CONSTRAINT `OrderStatus_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order` (`order_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatus`
--

LOCK TABLES `OrderStatus` WRITE;
/*!40000 ALTER TABLE `OrderStatus` DISABLE KEYS */;
INSERT INTO `OrderStatus` VALUES (1,3,'paid','2024-12-27 06:05:34.929','2024-12-27 06:05:34.929'),(2,4,'paid','2024-12-27 13:45:36.514','2024-12-27 13:45:36.514');
/*!40000 ALTER TABLE `OrderStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrgTrainingFilesLog`
--

DROP TABLE IF EXISTS `OrgTrainingFilesLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrgTrainingFilesLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(191) NOT NULL,
  `file_size` double NOT NULL,
  `file_type` varchar(191) NOT NULL,
  `org_agent_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `agent_version_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `OrgTrainingFilesLog_id_key` (`id`),
  KEY `OrgTrainingFilesLog_org_agent_id_fkey` (`org_agent_id`),
  KEY `OrgTrainingFilesLog_org_id_fkey` (`org_id`),
  KEY `OrgTrainingFilesLog_org_user_id_fkey` (`org_user_id`),
  KEY `OrgTrainingFilesLog_agent_version_id_fkey` (`agent_version_id`),
  CONSTRAINT `OrgTrainingFilesLog_agent_version_id_fkey` FOREIGN KEY (`agent_version_id`) REFERENCES `AgentVersions` (`version_id`) ON UPDATE CASCADE,
  CONSTRAINT `OrgTrainingFilesLog_org_agent_id_fkey` FOREIGN KEY (`org_agent_id`) REFERENCES `OrganizationAgents` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `OrgTrainingFilesLog_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `OrgTrainingFilesLog_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrgTrainingFilesLog`
--

LOCK TABLES `OrgTrainingFilesLog` WRITE;
/*!40000 ALTER TABLE `OrgTrainingFilesLog` DISABLE KEYS */;
INSERT INTO `OrgTrainingFilesLog` VALUES (1,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,4,'2024-12-27 09:59:41.853','2024-12-27 09:59:41.853'),(2,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,5,'2024-12-27 10:02:10.674','2024-12-27 10:02:10.674'),(3,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,6,'2024-12-27 10:25:49.938','2024-12-27 10:25:49.938'),(4,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,7,'2024-12-27 10:26:55.165','2024-12-27 10:26:55.165'),(5,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,8,'2024-12-27 10:27:52.345','2024-12-27 10:27:52.345'),(6,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,13,'2024-12-27 10:44:31.604','2024-12-27 10:44:31.604'),(7,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,27,'2024-12-27 11:09:39.394','2024-12-27 11:09:39.394'),(8,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,28,'2024-12-27 11:10:40.128','2024-12-27 11:10:40.128'),(9,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,29,'2024-12-27 11:11:09.421','2024-12-27 11:11:09.421'),(10,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,31,'2024-12-27 11:13:23.925','2024-12-27 11:13:23.925'),(11,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,32,'2024-12-27 11:23:13.260','2024-12-27 11:23:13.260'),(12,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,36,'2024-12-27 11:30:31.021','2024-12-27 11:30:31.021'),(13,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,37,'2024-12-27 11:30:52.814','2024-12-27 11:30:52.814'),(14,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,38,'2024-12-27 11:36:45.374','2024-12-27 11:36:45.374'),(15,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,39,'2024-12-27 11:38:29.526','2024-12-27 11:38:29.526'),(16,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,40,'2024-12-27 11:39:16.912','2024-12-27 11:39:16.912'),(17,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,41,'2024-12-27 11:39:58.561','2024-12-27 11:39:58.561'),(18,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,42,'2024-12-27 11:40:05.549','2024-12-27 11:40:05.549'),(19,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',8,2,1,43,'2024-12-27 11:44:53.888','2024-12-27 11:44:53.888'),(20,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',8,2,1,44,'2024-12-27 11:45:11.743','2024-12-27 11:45:11.743'),(21,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',8,2,1,45,'2024-12-27 11:48:21.932','2024-12-27 11:48:21.932'),(22,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',8,2,1,46,'2024-12-27 12:02:29.652','2024-12-27 12:02:29.652'),(23,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',8,2,1,47,'2024-12-27 12:04:57.112','2024-12-27 12:04:57.112'),(24,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',8,2,1,48,'2024-12-27 12:20:20.364','2024-12-27 12:20:20.364'),(25,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',8,2,1,49,'2024-12-27 12:20:41.520','2024-12-27 12:20:41.520'),(26,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',9,2,1,50,'2024-12-27 13:47:48.711','2024-12-27 13:47:48.711'),(27,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',9,2,1,51,'2024-12-27 13:49:03.093','2024-12-27 13:49:03.093'),(28,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',9,2,1,52,'2024-12-27 13:49:31.793','2024-12-27 13:49:31.793'),(29,'Bulk Weight Difference in PDF.pdf',43009,'application/pdf',4,3,3,53,'2024-12-30 06:53:53.580','2024-12-30 06:53:53.580');
/*!40000 ALTER TABLE `OrgTrainingFilesLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganisationUserAgents`
--

DROP TABLE IF EXISTS `OrganisationUserAgents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganisationUserAgents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_user_id` int(11) NOT NULL,
  `org_agent_id` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `OrganisationUserAgents_org_user_id_fkey` (`org_user_id`),
  KEY `OrganisationUserAgents_org_agent_id_fkey` (`org_agent_id`),
  CONSTRAINT `OrganisationUserAgents_org_agent_id_fkey` FOREIGN KEY (`org_agent_id`) REFERENCES `OrganizationAgents` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `OrganisationUserAgents_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganisationUserAgents`
--

LOCK TABLES `OrganisationUserAgents` WRITE;
/*!40000 ALTER TABLE `OrganisationUserAgents` DISABLE KEYS */;
INSERT INTO `OrganisationUserAgents` VALUES (1,3,4,4,'2024-12-27 09:59:41.864','2024-12-27 09:59:41.864'),(2,3,4,5,'2024-12-27 10:02:10.684','2024-12-27 10:02:10.684'),(3,3,4,6,'2024-12-27 10:25:49.993','2024-12-27 10:25:49.993'),(4,3,4,7,'2024-12-27 10:26:55.211','2024-12-27 10:26:55.211'),(5,3,4,8,'2024-12-27 10:27:52.351','2024-12-27 10:27:52.351'),(6,3,4,9,'2024-12-27 10:30:32.136','2024-12-27 10:30:32.136'),(7,3,4,10,'2024-12-27 10:31:33.783','2024-12-27 10:31:33.783'),(8,3,4,11,'2024-12-27 10:32:58.484','2024-12-27 10:32:58.484'),(9,3,4,12,'2024-12-27 10:33:22.469','2024-12-27 10:33:22.469'),(10,3,4,13,'2024-12-27 10:44:31.648','2024-12-27 10:44:31.648'),(11,3,4,14,'2024-12-27 10:44:54.988','2024-12-27 10:44:54.988'),(12,3,4,15,'2024-12-27 10:45:36.568','2024-12-27 10:45:36.568'),(13,3,4,22,'2024-12-27 10:51:35.790','2024-12-27 10:51:35.790'),(14,3,4,23,'2024-12-27 10:58:03.105','2024-12-27 10:58:03.105'),(15,3,4,24,'2024-12-27 10:58:58.645','2024-12-27 10:58:58.645'),(16,3,4,25,'2024-12-27 10:59:57.764','2024-12-27 10:59:57.764'),(17,3,4,26,'2024-12-27 11:00:38.204','2024-12-27 11:00:38.204'),(18,3,4,27,'2024-12-27 11:09:39.443','2024-12-27 11:09:39.443'),(19,3,4,28,'2024-12-27 11:10:40.169','2024-12-27 11:10:40.169'),(20,3,4,29,'2024-12-27 11:11:09.464','2024-12-27 11:11:09.464'),(21,3,4,30,'2024-12-27 11:13:17.264','2024-12-27 11:13:17.264'),(22,3,4,31,'2024-12-27 11:13:23.968','2024-12-27 11:13:23.968'),(23,3,4,32,'2024-12-27 11:23:13.306','2024-12-27 11:23:13.306'),(24,3,4,33,'2024-12-27 11:25:31.313','2024-12-27 11:25:31.313'),(25,3,4,34,'2024-12-27 11:27:12.451','2024-12-27 11:27:12.451'),(26,3,4,35,'2024-12-27 11:30:41.952','2024-12-27 11:30:41.952'),(27,3,4,36,'2024-12-27 11:30:41.955','2024-12-27 11:30:41.955'),(28,3,4,37,'2024-12-27 11:30:52.822','2024-12-27 11:30:52.822'),(29,3,4,38,'2024-12-27 11:36:45.381','2024-12-27 11:36:45.381'),(30,3,4,39,'2024-12-27 11:38:29.538','2024-12-27 11:38:29.538'),(31,3,4,40,'2024-12-27 11:39:16.919','2024-12-27 11:39:16.919'),(32,3,4,41,'2024-12-27 11:39:58.568','2024-12-27 11:39:58.568'),(33,3,4,42,'2024-12-27 11:40:09.933','2024-12-27 11:40:09.933'),(34,1,8,43,'2024-12-27 11:44:53.931','2024-12-27 11:44:53.931'),(35,1,8,44,'2024-12-27 11:45:17.119','2024-12-27 11:45:17.119'),(36,1,8,45,'2024-12-27 11:48:26.491','2024-12-27 11:48:26.491'),(37,1,8,46,'2024-12-27 12:02:34.046','2024-12-27 12:02:34.046'),(38,1,8,47,'2024-12-27 12:05:01.100','2024-12-27 12:05:01.100'),(39,1,8,48,'2024-12-27 12:20:25.718','2024-12-27 12:20:25.718'),(40,1,8,49,'2024-12-27 12:20:45.693','2024-12-27 12:20:45.693'),(41,1,9,50,'2024-12-27 13:47:48.761','2024-12-27 13:47:48.761'),(42,1,9,51,'2024-12-27 13:49:03.147','2024-12-27 13:49:03.147'),(43,1,9,52,'2024-12-27 13:50:02.668','2024-12-27 13:50:02.668'),(44,3,4,53,'2024-12-30 06:53:53.722','2024-12-30 06:53:53.722'),(45,1,9,54,'2024-12-30 06:54:53.151','2024-12-30 06:54:53.151'),(46,1,9,55,'2024-12-30 06:55:13.293','2024-12-30 06:55:13.293'),(47,1,9,56,'2024-12-30 06:55:48.883','2024-12-30 06:55:48.883'),(48,1,9,57,'2024-12-30 06:57:58.353','2024-12-30 06:57:58.353'),(49,1,9,58,'2024-12-30 06:58:25.148','2024-12-30 06:58:25.148'),(50,1,9,59,'2024-12-30 06:59:20.533','2024-12-30 06:59:20.533'),(51,1,9,60,'2024-12-30 07:00:31.527','2024-12-30 07:00:31.527'),(52,1,9,61,'2024-12-30 07:01:09.164','2024-12-30 07:01:09.164'),(53,1,9,62,'2024-12-30 07:04:32.651','2024-12-30 07:04:32.651'),(54,1,9,63,'2024-12-30 07:05:12.236','2024-12-30 07:05:12.236'),(55,1,9,64,'2024-12-30 07:06:27.629','2024-12-30 07:06:27.629'),(56,1,9,65,'2024-12-30 07:07:32.366','2024-12-30 07:07:32.366'),(57,1,9,66,'2024-12-30 07:08:56.770','2024-12-30 07:08:56.770'),(58,1,9,67,'2024-12-30 07:25:55.267','2024-12-30 07:25:55.267');
/*!40000 ALTER TABLE `OrganisationUserAgents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `org_name` varchar(191) NOT NULL,
  `website` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `currency_type` varchar(191) DEFAULT NULL,
  `contact` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `org_external_name` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Organization_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
INSERT INTO `Organization` VALUES (1,1,'ibacustech','qq','qq','qq','qq','qq','qq','qq','2024-12-16 17:49:37.296','2024-12-16 17:49:37.296',NULL),(2,1,'ibacustechlabs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:24:42.279','2024-12-19 11:24:42.279',NULL),(3,1,'gmail',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-20 08:06:33.303','2024-12-20 08:06:33.303','Greenestep');
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizationAgents`
--

DROP TABLE IF EXISTS `OrganizationAgents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizationAgents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) DEFAULT NULL,
  `agent_name` varchar(191) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `publisher_url` varchar(191) NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `user_limit` int(11) NOT NULL,
  `visibility_info_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `org_agent_description` varchar(191) NOT NULL,
  `org_agent_uuid` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `OrganizationAgents_org_agent_uuid_key` (`org_agent_uuid`),
  KEY `OrganizationAgents_visibility_info_id_fkey` (`visibility_info_id`),
  KEY `OrganizationAgents_order_item_id_fkey` (`order_item_id`),
  KEY `OrganizationAgents_purchase_id_fkey` (`purchase_id`),
  KEY `OrganizationAgents_order_id_fkey` (`order_id`),
  KEY `OrganizationAgents_org_id_fkey` (`org_id`),
  CONSTRAINT `OrganizationAgents_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order` (`order_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `OrganizationAgents_order_item_id_fkey` FOREIGN KEY (`order_item_id`) REFERENCES `OrderItems` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `OrganizationAgents_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `OrganizationAgents_purchase_id_fkey` FOREIGN KEY (`purchase_id`) REFERENCES `AgentPurchase` (`purchase_id`) ON UPDATE CASCADE,
  CONSTRAINT `OrganizationAgents_visibility_info_id_fkey` FOREIGN KEY (`visibility_info_id`) REFERENCES `VisibilityInfo` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationAgents`
--

LOCK TABLES `OrganizationAgents` WRITE;
/*!40000 ALTER TABLE `OrganizationAgents` DISABLE KEYS */;
INSERT INTO `OrganizationAgents` VALUES (4,NULL,'hu agent',1,1,NULL,'none',3,10000,1,'2024-12-23 11:28:36.478','2024-12-23 11:28:36.478','this is an agent','f5b8b841-c989-4f8d-8064-2fcf835da407'),(5,NULL,'Support agent',1,1,NULL,'none',3,10000,2,'2024-12-23 11:28:36.484','2024-12-27 06:33:25.940','this is an agent','4762ceba-dbb1-48ea-aead-6eb157fd5fde'),(6,NULL,'Sales agent',1,1,NULL,'none',3,10000,1,'2024-12-23 11:29:23.262','2024-12-23 11:29:23.262','this is an agent','987c9b6c-ee36-4990-a7f0-de592e84d883'),(7,NULL,'Support agent',1,1,NULL,'none',3,10000,1,'2024-12-23 11:29:23.266','2024-12-23 11:29:23.266','this is an agent','1c3c7ffb-4cb1-4494-b452-72e26dcb0cea'),(8,2,'support_agent',3,1,3,'null',2,100,1,'2024-12-27 06:05:34.918','2024-12-27 06:05:34.918','Testing','c7a253f1-e939-4dfd-ad0a-b1b4c7d162dd'),(9,3,'support_agent',4,1,4,'null',2,100,1,'2024-12-27 13:45:36.511','2024-12-27 13:45:36.511','Testing','b7d16081-8b97-472b-9695-a8492bc38930');
/*!40000 ALTER TABLE `OrganizationAgents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizationLLMEnabledInfo`
--

DROP TABLE IF EXISTS `OrganizationLLMEnabledInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizationLLMEnabledInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `user_defined_name` varchar(191) NOT NULL,
  `org_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `org_secrets_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `OrganizationLLMEnabledInfo_org_id_fkey` (`org_id`),
  KEY `OrganizationLLMEnabledInfo_org_secrets_id_fkey` (`org_secrets_id`),
  CONSTRAINT `OrganizationLLMEnabledInfo_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `OrganizationLLMEnabledInfo_org_secrets_id_fkey` FOREIGN KEY (`org_secrets_id`) REFERENCES `OrganizationSecrets` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationLLMEnabledInfo`
--

LOCK TABLES `OrganizationLLMEnabledInfo` WRITE;
/*!40000 ALTER TABLE `OrganizationLLMEnabledInfo` DISABLE KEYS */;
INSERT INTO `OrganizationLLMEnabledInfo` VALUES (1,1,'Chat gpt V1',3,'2024-12-24 11:36:28.095','2024-12-24 11:36:28.095',1),(2,2,'GPT Mod',2,'2024-12-26 17:08:27.578','2024-12-26 17:08:27.578',1);
/*!40000 ALTER TABLE `OrganizationLLMEnabledInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizationPosition`
--

DROP TABLE IF EXISTS `OrganizationPosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizationPosition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(191) NOT NULL,
  `position_value` varchar(191) NOT NULL,
  `allowed_features` varchar(191) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationPosition`
--

LOCK TABLES `OrganizationPosition` WRITE;
/*!40000 ALTER TABLE `OrganizationPosition` DISABLE KEYS */;
INSERT INTO `OrganizationPosition` VALUES (1,'PUBLIC','0','none','2024-12-27 11:31:39.383','2024-12-27 11:31:39.383');
/*!40000 ALTER TABLE `OrganizationPosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizationSecrets`
--

DROP TABLE IF EXISTS `OrganizationSecrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizationSecrets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_id` int(11) NOT NULL,
  `variable_values` varchar(191) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `variable_active` tinyint(1) NOT NULL,
  `variable_name` varchar(191) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `org_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `OrganizationSecrets_variable_id_fkey` (`variable_id`),
  KEY `OrganizationSecrets_org_id_fkey` (`org_id`),
  KEY `OrganizationSecrets_org_user_id_fkey` (`org_user_id`),
  CONSTRAINT `OrganizationSecrets_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `OrganizationSecrets_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `OrganizationSecrets_variable_id_fkey` FOREIGN KEY (`variable_id`) REFERENCES `VariableInfo` (`variable_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationSecrets`
--

LOCK TABLES `OrganizationSecrets` WRITE;
/*!40000 ALTER TABLE `OrganizationSecrets` DISABLE KEYS */;
INSERT INTO `OrganizationSecrets` VALUES (1,2,'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','2024-12-20 14:23:04.595','2024-12-20 14:23:04.595',1,NULL,3,2),(3,3,'sdfsfsfsf','2024-12-20 14:23:33.360','2024-12-20 14:23:33.360',1,NULL,3,2);
/*!40000 ALTER TABLE `OrganizationSecrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizationUserPosition`
--

DROP TABLE IF EXISTS `OrganizationUserPosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizationUserPosition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_position_id` int(11) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `OrganizationUserPosition_org_position_id_fkey` (`org_position_id`),
  KEY `OrganizationUserPosition_org_user_id_fkey` (`org_user_id`),
  CONSTRAINT `OrganizationUserPosition_org_position_id_fkey` FOREIGN KEY (`org_position_id`) REFERENCES `OrganizationPosition` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrganizationUserPosition_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationUserPosition`
--

LOCK TABLES `OrganizationUserPosition` WRITE;
/*!40000 ALTER TABLE `OrganizationUserPosition` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrganizationUserPosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizationUsers`
--

DROP TABLE IF EXISTS `OrganizationUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizationUsers` (
  `org_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`org_user_id`),
  KEY `OrganizationUsers_org_id_fkey` (`org_id`),
  KEY `OrganizationUsers_user_id_fkey` (`user_id`),
  CONSTRAINT `OrganizationUsers_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrganizationUsers_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationUsers`
--

LOCK TABLES `OrganizationUsers` WRITE;
/*!40000 ALTER TABLE `OrganizationUsers` DISABLE KEYS */;
INSERT INTO `OrganizationUsers` VALUES (1,2,2,0,'2024-12-19 11:24:42.286','2024-12-19 11:24:42.286'),(2,3,3,0,'2024-12-20 08:06:33.305','2024-12-20 08:06:33.305'),(3,3,4,0,'2024-12-23 05:06:26.018','2024-12-23 05:06:26.018'),(4,3,2,0,'2024-12-26 11:34:11.376','2024-12-26 11:34:11.376');
/*!40000 ALTER TABLE `OrganizationUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubscriptionConfiguration`
--

DROP TABLE IF EXISTS `SubscriptionConfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubscriptionConfiguration` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `sitemap_depth` int(11) NOT NULL,
  `document_size` int(11) NOT NULL,
  `number_of_documents` int(11) NOT NULL,
  `acess_users` int(11) DEFAULT NULL,
  `access_type` enum('limited','unlimited') NOT NULL,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`config_id`),
  KEY `SubscriptionConfiguration_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `SubscriptionConfiguration_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubscriptionConfiguration`
--

LOCK TABLES `SubscriptionConfiguration` WRITE;
/*!40000 ALTER TABLE `SubscriptionConfiguration` DISABLE KEYS */;
INSERT INTO `SubscriptionConfiguration` VALUES (1,2,100,5,NULL,'unlimited',NULL,'2024-12-16 15:49:48.244','2024-12-16 15:49:48.244'),(2,4,500,10,NULL,'unlimited',NULL,'2024-12-16 15:50:17.221','2024-12-16 15:50:17.221');
/*!40000 ALTER TABLE `SubscriptionConfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubscriptionFeatures`
--

DROP TABLE IF EXISTS `SubscriptionFeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubscriptionFeatures` (
  `feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`feature_id`),
  KEY `SubscriptionFeatures_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `SubscriptionFeatures_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubscriptionFeatures`
--

LOCK TABLES `SubscriptionFeatures` WRITE;
/*!40000 ALTER TABLE `SubscriptionFeatures` DISABLE KEYS */;
INSERT INTO `SubscriptionFeatures` VALUES (1,NULL,'2024-12-16 15:43:16.787','2024-12-16 15:43:16.787'),(2,NULL,'2024-12-16 15:43:23.143','2024-12-16 15:43:23.143'),(3,NULL,'2024-12-16 15:43:32.243','2024-12-16 15:43:32.243'),(4,NULL,'2024-12-16 15:43:39.477','2024-12-16 15:43:39.477');
/*!40000 ALTER TABLE `SubscriptionFeatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubscriptionFeaturesInfo`
--

DROP TABLE IF EXISTS `SubscriptionFeaturesInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubscriptionFeaturesInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(191) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `sub_feature_id` int(11) NOT NULL,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`),
  KEY `SubscriptionFeaturesInfo_super_admin_id_fkey` (`super_admin_id`),
  KEY `SubscriptionFeaturesInfo_sub_feature_id_fkey` (`sub_feature_id`),
  CONSTRAINT `SubscriptionFeaturesInfo_sub_feature_id_fkey` FOREIGN KEY (`sub_feature_id`) REFERENCES `SubscriptionFeatures` (`feature_id`) ON UPDATE CASCADE,
  CONSTRAINT `SubscriptionFeaturesInfo_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubscriptionFeaturesInfo`
--

LOCK TABLES `SubscriptionFeaturesInfo` WRITE;
/*!40000 ALTER TABLE `SubscriptionFeaturesInfo` DISABLE KEYS */;
INSERT INTO `SubscriptionFeaturesInfo` VALUES (1,'Feature',1,1,NULL,'2024-12-16 15:44:10.077','2024-12-16 15:44:10.077'),(2,'LLMProviders',1,1,NULL,'2024-12-16 15:44:30.019','2024-12-16 15:44:30.019'),(3,'LLMProviders',1,2,NULL,'2024-12-16 15:44:49.499','2024-12-16 15:44:49.499'),(4,'SubscriptionFeaturesInfo',1,2,NULL,'2024-12-16 15:48:36.466','2024-12-16 15:48:36.466'),(5,'SubscriptionFeaturesInfo',1,3,NULL,'2024-12-16 15:48:50.871','2024-12-16 15:48:50.871'),(6,'SubscriptionFeaturesInfo',1,3,NULL,'2024-12-16 15:49:06.830','2024-12-16 15:49:06.830');
/*!40000 ALTER TABLE `SubscriptionFeaturesInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubscriptionType`
--

DROP TABLE IF EXISTS `SubscriptionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubscriptionType` (
  `sub_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(191) NOT NULL,
  `order` int(11) NOT NULL,
  `disable` tinyint(1) NOT NULL,
  `super_admin_id` int(11) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`sub_type_id`),
  KEY `SubscriptionType_super_admin_id_fkey` (`super_admin_id`),
  CONSTRAINT `SubscriptionType_super_admin_id_fkey` FOREIGN KEY (`super_admin_id`) REFERENCES `SuperAdminUsers` (`admin_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubscriptionType`
--

LOCK TABLES `SubscriptionType` WRITE;
/*!40000 ALTER TABLE `SubscriptionType` DISABLE KEYS */;
INSERT INTO `SubscriptionType` VALUES (1,'Free',0,0,NULL,'2024-12-16 15:42:34.648','2024-12-16 15:42:34.648'),(2,'Basic',1,0,NULL,'2024-12-16 15:42:46.282','2024-12-16 15:42:46.282'),(3,'Advanced',2,0,NULL,'2024-12-16 15:42:59.907','2024-12-16 15:42:59.907');
/*!40000 ALTER TABLE `SubscriptionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuperAdminUsers`
--

DROP TABLE IF EXISTS `SuperAdminUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuperAdminUsers` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `user_id` int(11) NOT NULL,
  `user_position` int(11) NOT NULL,
  `disable` tinyint(1) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `SuperAdminUsers_user_id_fkey` (`user_id`),
  CONSTRAINT `SuperAdminUsers_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperAdminUsers`
--

LOCK TABLES `SuperAdminUsers` WRITE;
/*!40000 ALTER TABLE `SuperAdminUsers` DISABLE KEYS */;
INSERT INTO `SuperAdminUsers` VALUES (5,'2024-12-27 11:31:59.143','2024-12-27 11:31:59.143',3,1,0);
/*!40000 ALTER TABLE `SuperAdminUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `display_picture` varchar(191) DEFAULT NULL,
  `user_type` varchar(191) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (2,'aswin@ibacustechlabs.in','Aswin Sasikumar','',NULL,'2024-12-19 11:24:42.226','2024-12-19 11:24:42.226'),(3,'test.ibtlabs@gmail.com','TEST','https://lh3.googleusercontent.com/a/ACg8ocI3Ck7ReRl74IHg-HWtWUDba35_6WFfcwAS9OGeBHap0WQPXw=s96-c','USER','2024-12-20 08:06:33.280','2024-12-20 08:06:33.280'),(4,'ashvinachu097@gmail.com','Ashvin S','https://lh3.googleusercontent.com/a/ACg8ocJqWm5OAKFoN1kI25tjlpjQFM5J13hocy1Ke5ljgxBFcjyDbrJK=s96-c','USER','2024-12-23 05:06:25.983','2024-12-23 05:06:25.983');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserLog`
--

DROP TABLE IF EXISTS `UserLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat_long` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `language` varchar(191) DEFAULT NULL,
  `operating_system` varchar(191) DEFAULT NULL,
  `ip` varchar(191) DEFAULT NULL,
  `accessed_app_type` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `browser` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserLog_user_id_fkey` (`user_id`),
  CONSTRAINT `UserLog_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserLog`
--

LOCK TABLES `UserLog` WRITE;
/*!40000 ALTER TABLE `UserLog` DISABLE KEYS */;
INSERT INTO `UserLog` VALUES (1,NULL,NULL,'en-GB,en-US;q=0.9,en;q=0.8','Linux','::1','Web',2,'2024-12-19 11:24:42.268','Chrome'),(2,NULL,NULL,'en-GB,en-US;q=0.9,en;q=0.8','Linux','::1','Web',3,'2024-12-20 08:06:33.301','Chrome'),(3,NULL,NULL,'en-GB,en-US;q=0.9,en;q=0.8','Android','::1','Mobile',4,'2024-12-23 05:06:26.009','Mobile Chrome');
/*!40000 ALTER TABLE `UserLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VariableInfo`
--

DROP TABLE IF EXISTS `VariableInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VariableInfo` (
  `variable_id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_name` varchar(191) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`variable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VariableInfo`
--

LOCK TABLES `VariableInfo` WRITE;
/*!40000 ALTER TABLE `VariableInfo` DISABLE KEYS */;
INSERT INTO `VariableInfo` VALUES (1,'JA_KEY','2024-12-20 14:16:34.657','2024-12-20 14:16:34.657'),(2,'OpenAI API Key','2024-12-20 14:16:57.478','2024-12-20 14:16:57.478'),(3,'Groq API Key','2024-12-20 14:17:10.260','2024-12-20 14:17:10.260'),(4,'Gemini API Key ','2024-12-20 14:17:37.748','2024-12-20 14:17:37.748');
/*!40000 ALTER TABLE `VariableInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VisibilityInfo`
--

DROP TABLE IF EXISTS `VisibilityInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VisibilityInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visibility_name` varchar(191) NOT NULL,
  `visibility_value` int(11) NOT NULL DEFAULT 0,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VisibilityInfo`
--

LOCK TABLES `VisibilityInfo` WRITE;
/*!40000 ALTER TABLE `VisibilityInfo` DISABLE KEYS */;
INSERT INTO `VisibilityInfo` VALUES (1,'Public',0,1,'2024-12-16 17:52:41.366','2024-12-16 17:52:41.366'),(2,'Private',1,1,'2024-12-16 17:52:58.325','2024-12-16 17:52:58.325');
/*!40000 ALTER TABLE `VisibilityInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_OrganizationLLMEnabledInfoToOrganizationUsers`
--

DROP TABLE IF EXISTS `_OrganizationLLMEnabledInfoToOrganizationUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_OrganizationLLMEnabledInfoToOrganizationUsers` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_OrganizationLLMEnabledInfoToOrganizationUsers_AB_unique` (`A`,`B`),
  KEY `_OrganizationLLMEnabledInfoToOrganizationUsers_B_index` (`B`),
  CONSTRAINT `_OrganizationLLMEnabledInfoToOrganizationUsers_A_fkey` FOREIGN KEY (`A`) REFERENCES `OrganizationLLMEnabledInfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_OrganizationLLMEnabledInfoToOrganizationUsers_B_fkey` FOREIGN KEY (`B`) REFERENCES `OrganizationUsers` (`org_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_OrganizationLLMEnabledInfoToOrganizationUsers`
--

LOCK TABLES `_OrganizationLLMEnabledInfoToOrganizationUsers` WRITE;
/*!40000 ALTER TABLE `_OrganizationLLMEnabledInfoToOrganizationUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `_OrganizationLLMEnabledInfoToOrganizationUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('0a1b55c5-e864-4fe4-9800-f80852c4c0e5','057ed6050cea62fe6561d86fa81d2247c9cce1101d35aa93790d70b7ba3a8100','2024-12-20 08:59:50.451','20241220085950_o',NULL,NULL,'2024-12-20 08:59:50.445',1),('136954c9-0d06-4d82-b488-f09ccb8f5a08','fadc3be9142da31a20b978d1c9ba894742c468f874733fa6daf0a3797de9b0b8','2024-12-17 09:29:01.309','20241217091244_init',NULL,NULL,'2024-12-17 09:29:01.268',1),('20452a07-618e-4edb-8f19-002c623fe333','943f06b488e301311ceab24f06036647d7be0b8e80f437ef2c12edaf7f2709d3','2024-12-24 05:30:38.535','20241224053038_new',NULL,NULL,'2024-12-24 05:30:38.525',1),('23d5049e-6c14-488d-8ddd-a2fbfe51966b','c15e79925dcedcd1cf354d4591e99768bb1910b902fc2d5cfdf449887d3f46bc','2024-12-24 05:46:45.720','20241224054645_nm',NULL,NULL,'2024-12-24 05:46:45.714',1),('3ec56cce-a1b7-4726-a5d6-e2f73a169478','e8d2dc561ed9ccd0c816f822facb9d60443eb5d8ffa05fedd8ecc73833382e49','2024-12-20 08:57:14.705','20241220085714_dev',NULL,NULL,'2024-12-20 08:57:14.680',1),('3ec84bc4-8a4c-443d-b01f-ddf3452791ff','6d3ba5b1f8605642ec0c0bd4c5d9002bcbd104f0a3f6a52b7f59b896946039cc','2024-12-19 07:21:04.903','20241219072104_table_add',NULL,NULL,'2024-12-19 07:21:04.880',1),('50694585-e4ac-49ec-b3a5-16dd62bccd97','7170e533cfd6f29d62778234993fbdb475f63a025a0698b44c6824764feae122','2024-12-20 08:50:34.964','20241220085034_llm_update',NULL,NULL,'2024-12-20 08:50:34.947',1),('577e7d0b-5f1c-492b-8835-d8c1f9dd6527','79bb4b98b405f19fced9d56b353ea57b21cb620d44db02d4a07886ef1afd9f1d','2024-12-23 11:11:53.607','20241223111153_',NULL,NULL,'2024-12-23 11:11:53.586',1),('6584f249-84a1-403f-9ab0-0e1e9954fd44','0a541116127914a79f341d67cc9f4d0f588a3ab93088024648d2e9671b3daab8','2024-12-20 08:43:25.619','20241220084325_secrets_table',NULL,NULL,'2024-12-20 08:43:25.612',1),('66fd09b6-72fa-4946-b34c-c33838709a40','bcaf353e68d6061bec65b0d6279f688b3975ecf6dfc3cff5895309e589be5e24','2024-12-16 10:06:23.335','20241216100622_',NULL,NULL,'2024-12-16 10:06:22.480',1),('80f165bb-79d7-4a8b-ba37-b13dbcc9afdf','415612a4cb11c92583b6dd963b0b560684ea70b1a6fc7dde72b1ff51a2de588a','2024-12-24 05:29:18.099','20241224052918_update',NULL,NULL,'2024-12-24 05:29:18.076',1),('88874dc1-31f3-45bc-a1a9-23f01218ac74','1db49ffb43db67817fd04e264648039accfeddc27bc9b5d8a4f407370271bb4c','2024-12-24 06:11:26.864','20241224061126_update',NULL,NULL,'2024-12-24 06:11:26.847',1),('a373d590-c096-443a-9fea-2207d91749e7','d995033312c8fa27f385c5b77f896625c2d8b67aff3f70e085636f8acd9b4099','2024-12-16 12:17:42.380','20241216121742_new_mod',NULL,NULL,'2024-12-16 12:17:42.205',1),('ccd281a5-1b1f-43b4-8e2e-1d2bf0a63b77','985671da9b9d0a80b568b064499b82de98074a29396609ef0961c2503d1d305e','2024-12-23 11:15:57.596','20241223111557_new',NULL,NULL,'2024-12-23 11:15:57.567',1),('d55d0542-b30f-4c17-9088-e9cc64bd6988','0888fdc01bd97f27b49c6ffb1ef80aa134b3a7e2ddb139482a48d25f9d38ba76','2024-12-27 05:53:34.023','20241227055333_n_ew',NULL,NULL,'2024-12-27 05:53:33.991',1),('eaf1afb9-a3dc-4fbb-aad0-418f8cf942f9','8a7582167022b73f1ee37a3ade22c02143f5face75ce4f3e745500ffd50de67e','2024-12-16 10:17:49.756','20241216101749_new',NULL,NULL,'2024-12-16 10:17:49.741',1),('ec269030-d9f0-4102-90f4-0c7defc4b401','3c0518d88d555701a253d3d36197196a8e2c98e121cc58ac185ec3d973a7c3a4','2024-12-16 10:37:39.816','20241216103739_new_dep',NULL,NULL,'2024-12-16 10:37:39.804',1),('fc7ea2c5-4a30-4978-bfd8-5a821c3f940e','580d39dc8f931a71105f1baf412660a1b8d4e5fcdc101b350feccbcfacc55f96','2024-12-23 12:56:52.721','20241223125652_nw_update',NULL,NULL,'2024-12-23 12:56:52.663',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 18:34:58
