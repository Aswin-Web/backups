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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentPurchase`
--

LOCK TABLES `AgentPurchase` WRITE;
/*!40000 ALTER TABLE `AgentPurchase` DISABLE KEYS */;
INSERT INTO `AgentPurchase` VALUES (1,'2024-01-01 00:00:00.000','2025-01-01 00:00:00.000',NULL,NULL,NULL,'2024-12-16 17:51:09.895','2024-12-16 17:51:09.895');
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
INSERT INTO `AgentTypes` VALUES (1,'helper_agent','helper_agent','none',NULL,NULL,0,NULL,'2024-12-16 15:37:36.337','2024-12-16 15:37:36.337'),(2,'Support_agent','support_agent',NULL,NULL,NULL,0,NULL,'2024-12-16 15:38:01.636','2024-12-16 15:38:01.636');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentVersionTrainingLogs`
--

LOCK TABLES `AgentVersionTrainingLogs` WRITE;
/*!40000 ALTER TABLE `AgentVersionTrainingLogs` DISABLE KEYS */;
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
  `raw_url` varchar(191) NOT NULL,
  `train_url` varchar(191) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AgentVersions`
--

LOCK TABLES `AgentVersions` WRITE;
/*!40000 ALTER TABLE `AgentVersions` DISABLE KEYS */;
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
  `billing_name` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BillingInfo`
--

LOCK TABLES `BillingInfo` WRITE;
/*!40000 ALTER TABLE `BillingInfo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartItems`
--

LOCK TABLES `CartItems` WRITE;
/*!40000 ALTER TABLE `CartItems` DISABLE KEYS */;
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
  `chat_group_id` int(11) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `llm_type_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`message_id`),
  KEY `ChatConversation_chat_group_id_fkey` (`chat_group_id`),
  KEY `ChatConversation_org_user_id_fkey` (`org_user_id`),
  KEY `ChatConversation_llm_type_id_fkey` (`llm_type_id`),
  CONSTRAINT `ChatConversation_chat_group_id_fkey` FOREIGN KEY (`chat_group_id`) REFERENCES `ChatGroups` (`chat_group_id`) ON UPDATE CASCADE,
  CONSTRAINT `ChatConversation_llm_type_id_fkey` FOREIGN KEY (`llm_type_id`) REFERENCES `OrganizationLLMEnabledInfo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ChatConversation_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChatConversation`
--

LOCK TABLES `ChatConversation` WRITE;
/*!40000 ALTER TABLE `ChatConversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChatConversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChatGroups`
--

DROP TABLE IF EXISTS `ChatGroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChatGroups` (
  `chat_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_name` int(11) NOT NULL,
  `org_user_agents_id` int(11) NOT NULL,
  `org_agent_id` int(11) NOT NULL,
  `org_user_id` int(11) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  PRIMARY KEY (`chat_group_id`),
  KEY `ChatGroups_org_user_agents_id_fkey` (`org_user_agents_id`),
  KEY `ChatGroups_org_agent_id_fkey` (`org_agent_id`),
  KEY `ChatGroups_org_user_id_fkey` (`org_user_id`),
  CONSTRAINT `ChatGroups_org_agent_id_fkey` FOREIGN KEY (`org_agent_id`) REFERENCES `OrganizationAgents` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ChatGroups_org_user_agents_id_fkey` FOREIGN KEY (`org_user_agents_id`) REFERENCES `OrganisationUserAgents` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ChatGroups_org_user_id_fkey` FOREIGN KEY (`org_user_id`) REFERENCES `OrganizationUsers` (`org_user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChatGroups`
--

LOCK TABLES `ChatGroups` WRITE;
/*!40000 ALTER TABLE `ChatGroups` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DurationInMonths`
--

LOCK TABLES `DurationInMonths` WRITE;
/*!40000 ALTER TABLE `DurationInMonths` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExtPaymentInfo`
--

LOCK TABLES `ExtPaymentInfo` WRITE;
/*!40000 ALTER TABLE `ExtPaymentInfo` DISABLE KEYS */;
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
  PRIMARY KEY (`llm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LLMProviders`
--

LOCK TABLES `LLMProviders` WRITE;
/*!40000 ALTER TABLE `LLMProviders` DISABLE KEYS */;
INSERT INTO `LLMProviders` VALUES (1,'chat_gpt','chat gpt','2024-12-16 15:52:04.783','2024-12-16 15:52:04.783'),(2,'lama','lama','2024-12-16 15:52:15.033','2024-12-16 15:52:15.033'),(3,'gemini','gemini','2024-12-16 15:52:26.917','2024-12-16 15:52:26.917');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItems`
--

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderStatus`
--

LOCK TABLES `OrderStatus` WRITE;
/*!40000 ALTER TABLE `OrderStatus` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrgTrainingFilesLog`
--

LOCK TABLES `OrgTrainingFilesLog` WRITE;
/*!40000 ALTER TABLE `OrgTrainingFilesLog` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganisationUserAgents`
--

LOCK TABLES `OrganisationUserAgents` WRITE;
/*!40000 ALTER TABLE `OrganisationUserAgents` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `Organization_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
INSERT INTO `Organization` VALUES (1,1,'ibacustech','qq','qq','qq','qq','qq','qq','qq','2024-12-16 17:49:37.296','2024-12-16 17:49:37.296'),(2,1,'ibacustechlabs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-19 11:24:42.279','2024-12-19 11:24:42.279');
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
  PRIMARY KEY (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationAgents`
--

LOCK TABLES `OrganizationAgents` WRITE;
/*!40000 ALTER TABLE `OrganizationAgents` DISABLE KEYS */;
INSERT INTO `OrganizationAgents` VALUES (1,NULL,'Helpbot agent',1,1,NULL,'none',1,10000,1,'2024-12-16 17:53:10.583','2024-12-16 17:53:10.583'),(2,NULL,'Support agent',1,1,NULL,'none',1,10000,1,'2024-12-16 17:55:25.809','2024-12-16 17:55:25.809');
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
  PRIMARY KEY (`id`),
  KEY `OrganizationLLMEnabledInfo_org_id_fkey` (`org_id`),
  CONSTRAINT `OrganizationLLMEnabledInfo_org_id_fkey` FOREIGN KEY (`org_id`) REFERENCES `Organization` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationLLMEnabledInfo`
--

LOCK TABLES `OrganizationLLMEnabledInfo` WRITE;
/*!40000 ALTER TABLE `OrganizationLLMEnabledInfo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationPosition`
--

LOCK TABLES `OrganizationPosition` WRITE;
/*!40000 ALTER TABLE `OrganizationPosition` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `OrganizationSecrets_variable_id_fkey` (`variable_id`),
  CONSTRAINT `OrganizationSecrets_variable_id_fkey` FOREIGN KEY (`variable_id`) REFERENCES `VariableInfo` (`variable_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationSecrets`
--

LOCK TABLES `OrganizationSecrets` WRITE;
/*!40000 ALTER TABLE `OrganizationSecrets` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizationUsers`
--

LOCK TABLES `OrganizationUsers` WRITE;
/*!40000 ALTER TABLE `OrganizationUsers` DISABLE KEYS */;
INSERT INTO `OrganizationUsers` VALUES (1,2,2,0,'2024-12-19 11:24:42.286','2024-12-19 11:24:42.286');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperAdminUsers`
--

LOCK TABLES `SuperAdminUsers` WRITE;
/*!40000 ALTER TABLE `SuperAdminUsers` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'ashvinachu097@gmail.com','Ashwin','none','USER','2024-12-16 17:48:55.430','2024-12-16 17:48:55.430'),(2,'aswin@ibacustechlabs.in','Aswin Sasikumar','',NULL,'2024-12-19 11:24:42.226','2024-12-19 11:24:42.226');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserLog`
--

LOCK TABLES `UserLog` WRITE;
/*!40000 ALTER TABLE `UserLog` DISABLE KEYS */;
INSERT INTO `UserLog` VALUES (1,NULL,NULL,'en-GB,en-US;q=0.9,en;q=0.8','Linux','::1','Web',2,'2024-12-19 11:24:42.268','Chrome');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VariableInfo`
--

LOCK TABLES `VariableInfo` WRITE;
/*!40000 ALTER TABLE `VariableInfo` DISABLE KEYS */;
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
INSERT INTO `_prisma_migrations` VALUES ('136954c9-0d06-4d82-b488-f09ccb8f5a08','fadc3be9142da31a20b978d1c9ba894742c468f874733fa6daf0a3797de9b0b8','2024-12-17 09:29:01.309','20241217091244_init',NULL,NULL,'2024-12-17 09:29:01.268',1),('3ec84bc4-8a4c-443d-b01f-ddf3452791ff','6d3ba5b1f8605642ec0c0bd4c5d9002bcbd104f0a3f6a52b7f59b896946039cc','2024-12-19 07:21:04.903','20241219072104_table_add',NULL,NULL,'2024-12-19 07:21:04.880',1),('66fd09b6-72fa-4946-b34c-c33838709a40','bcaf353e68d6061bec65b0d6279f688b3975ecf6dfc3cff5895309e589be5e24','2024-12-16 10:06:23.335','20241216100622_',NULL,NULL,'2024-12-16 10:06:22.480',1),('a373d590-c096-443a-9fea-2207d91749e7','d995033312c8fa27f385c5b77f896625c2d8b67aff3f70e085636f8acd9b4099','2024-12-16 12:17:42.380','20241216121742_new_mod',NULL,NULL,'2024-12-16 12:17:42.205',1),('eaf1afb9-a3dc-4fbb-aad0-418f8cf942f9','8a7582167022b73f1ee37a3ade22c02143f5face75ce4f3e745500ffd50de67e','2024-12-16 10:17:49.756','20241216101749_new',NULL,NULL,'2024-12-16 10:17:49.741',1),('ec269030-d9f0-4102-90f4-0c7defc4b401','3c0518d88d555701a253d3d36197196a8e2c98e121cc58ac185ec3d973a7c3a4','2024-12-16 10:37:39.816','20241216103739_new_dep',NULL,NULL,'2024-12-16 10:37:39.804',1);
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

-- Dump completed on 2024-12-20 11:14:35
