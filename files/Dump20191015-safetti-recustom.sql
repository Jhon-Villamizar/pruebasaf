-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: safetti_recustom
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `auth_user_informations`
--

DROP TABLE IF EXISTS `auth_user_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `document` varchar(20) NOT NULL,
  `birthdate` varchar(80) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `term_conditions` tinyint(1) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_auth_user_informations_saf_contries1_idx` (`country_id`),
  KEY `fk_auth_user_informations_auth_users1_idx` (`user_id`),
  CONSTRAINT `fk_auth_user_informations_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_auth_user_informations_saf_contries1` FOREIGN KEY (`country_id`) REFERENCES `saf_countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_informations`
--

LOCK TABLES `auth_user_informations` WRITE;
/*!40000 ALTER TABLE `auth_user_informations` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_types`
--

DROP TABLE IF EXISTS `auth_user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_types`
--

LOCK TABLES `auth_user_types` WRITE;
/*!40000 ALTER TABLE `auth_user_types` DISABLE KEYS */;
INSERT INTO `auth_user_types` VALUES (1,'Administrador',1,'2019-10-11 15:53:34','2019-10-11 15:53:34'),(2,'Asesor',1,'2019-10-11 15:53:34','2019-10-11 15:53:34'),(3,'Diseñador',1,'2019-10-11 15:53:34','2019-10-11 15:53:34'),(4,'Cliente nacional',1,'2019-10-11 15:53:34','2019-10-11 15:53:34'),(5,'Cliente internacional',1,'2019-10-11 15:53:34','2019-10-11 15:53:34'),(6,'Distribuidor',1,'2019-10-11 15:53:34','2019-10-11 15:53:34'),(7,'Partner',1,'2019-10-11 15:53:34','2019-10-11 15:53:34');
/*!40000 ALTER TABLE `auth_user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_users`
--

DROP TABLE IF EXISTS `auth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `second_key` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `validation_code` varchar(100) DEFAULT NULL,
  `auth_user_types_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_auth_users_auth_user_types1_idx` (`auth_user_types_id`),
  CONSTRAINT `fk_auth_users_auth_user_types1` FOREIGN KEY (`auth_user_types_id`) REFERENCES `auth_user_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_users`
--

LOCK TABLES `auth_users` WRITE;
/*!40000 ALTER TABLE `auth_users` DISABLE KEYS */;
INSERT INTO `auth_users` VALUES (1,'yuranh@chefcomapny.co','12345',NULL,NULL,1,NULL,1,'2019-10-12 00:02:37','2019-10-12 00:02:37');
/*!40000 ALTER TABLE `auth_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_access_custom`
--

DROP TABLE IF EXISTS `cus_access_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_access_custom` (
  `custom_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `fk_cus_access_custom_cus_custom1_idx` (`custom_id`),
  KEY `fk_cus_access_custom_auth_users1_idx` (`user_id`),
  CONSTRAINT `fk_cus_access_custom_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cus_access_custom_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_access_custom`
--

LOCK TABLES `cus_access_custom` WRITE;
/*!40000 ALTER TABLE `cus_access_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_access_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_adjustment_files`
--

DROP TABLE IF EXISTS `cus_adjustment_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_adjustment_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `adjustment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_adjustment_files_cus_adjustments1_idx` (`adjustment_id`),
  CONSTRAINT `fk_cus_adjustment_files_cus_adjustments1` FOREIGN KEY (`adjustment_id`) REFERENCES `cus_adjustments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_adjustment_files`
--

LOCK TABLES `cus_adjustment_files` WRITE;
/*!40000 ALTER TABLE `cus_adjustment_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_adjustment_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_adjustments`
--

DROP TABLE IF EXISTS `cus_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `message` text,
  `custom_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_adjustments_cus_custom1_idx` (`custom_id`),
  KEY `fk_cus_adjustments_auth_users1_idx` (`user_id`),
  CONSTRAINT `fk_cus_adjustments_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cus_adjustments_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_adjustments`
--

LOCK TABLES `cus_adjustments` WRITE;
/*!40000 ALTER TABLE `cus_adjustments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_custom`
--

DROP TABLE IF EXISTS `cus_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_custom`
--

LOCK TABLES `cus_custom` WRITE;
/*!40000 ALTER TABLE `cus_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_custom_designs`
--

DROP TABLE IF EXISTS `cus_custom_designs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_custom_designs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colors` text,
  `links` text,
  `custom_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_custom_designs_cus_custom1_idx` (`custom_id`),
  CONSTRAINT `fk_cus_custom_designs_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_custom_designs`
--

LOCK TABLES `cus_custom_designs` WRITE;
/*!40000 ALTER TABLE `cus_custom_designs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_custom_designs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_custom_files`
--

DROP TABLE IF EXISTS `cus_custom_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_custom_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_id` int(11) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_custom_files_cus_custom1_idx` (`custom_id`),
  CONSTRAINT `fk_cus_custom_files_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_custom_files`
--

LOCK TABLES `cus_custom_files` WRITE;
/*!40000 ALTER TABLE `cus_custom_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_custom_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_custom_products`
--

DROP TABLE IF EXISTS `cus_custom_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_custom_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_custom_products_cus_custom1_idx` (`custom_id`),
  KEY `fk_cus_custom_products_cus_products1_idx` (`products_id`),
  CONSTRAINT `fk_cus_custom_products_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cus_custom_products_cus_products1` FOREIGN KEY (`products_id`) REFERENCES `cus_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_custom_products`
--

LOCK TABLES `cus_custom_products` WRITE;
/*!40000 ALTER TABLE `cus_custom_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_custom_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_custom_sizes`
--

DROP TABLE IF EXISTS `cus_custom_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_custom_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sizes` text,
  `custom_product_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_custom_sizes_cus_custom_products1_idx` (`custom_product_id`),
  CONSTRAINT `fk_cus_custom_sizes_cus_custom_products1` FOREIGN KEY (`custom_product_id`) REFERENCES `cus_custom_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_custom_sizes`
--

LOCK TABLES `cus_custom_sizes` WRITE;
/*!40000 ALTER TABLE `cus_custom_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_custom_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_gartnets`
--

DROP TABLE IF EXISTS `cus_gartnets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_gartnets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_gartnets`
--

LOCK TABLES `cus_gartnets` WRITE;
/*!40000 ALTER TABLE `cus_gartnets` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_gartnets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_genders`
--

DROP TABLE IF EXISTS `cus_genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_genders`
--

LOCK TABLES `cus_genders` WRITE;
/*!40000 ALTER TABLE `cus_genders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_general_discounts`
--

DROP TABLE IF EXISTS `cus_general_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_general_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `rules` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_general_discounts_cus_products1_idx` (`product_id`),
  CONSTRAINT `fk_cus_general_discounts_cus_products1` FOREIGN KEY (`product_id`) REFERENCES `cus_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_general_discounts`
--

LOCK TABLES `cus_general_discounts` WRITE;
/*!40000 ALTER TABLE `cus_general_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_general_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_payments`
--

DROP TABLE IF EXISTS `cus_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_id` int(11) NOT NULL,
  `external_reference` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `price` float DEFAULT NULL,
  `payment_ref` varchar(600) DEFAULT NULL,
  `url_payment` varchar(800) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_payments_cus_custom1_idx` (`custom_id`),
  CONSTRAINT `fk_cus_payments_cus_custom1` FOREIGN KEY (`custom_id`) REFERENCES `cus_custom` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_payments`
--

LOCK TABLES `cus_payments` WRITE;
/*!40000 ALTER TABLE `cus_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_product_types`
--

DROP TABLE IF EXISTS `cus_product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_product_types`
--

LOCK TABLES `cus_product_types` WRITE;
/*!40000 ALTER TABLE `cus_product_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_product_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_products`
--

DROP TABLE IF EXISTS `cus_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `price` float DEFAULT NULL,
  `quantity_min` int(11) DEFAULT NULL,
  `genders_id` int(11) NOT NULL,
  `sports_id` int(11) NOT NULL,
  `product_types_id` int(11) NOT NULL,
  `gartnets_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_products_cus_genders_idx` (`genders_id`),
  KEY `fk_cus_products_cus_sports1_idx` (`sports_id`),
  KEY `fk_cus_products_cus_product_types1_idx` (`product_types_id`),
  KEY `fk_cus_products_cus_gartnets1_idx` (`gartnets_id`),
  CONSTRAINT `fk_cus_products_cus_gartnets1` FOREIGN KEY (`gartnets_id`) REFERENCES `cus_gartnets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cus_products_cus_genders` FOREIGN KEY (`genders_id`) REFERENCES `cus_genders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cus_products_cus_product_types1` FOREIGN KEY (`product_types_id`) REFERENCES `cus_product_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cus_products_cus_sports1` FOREIGN KEY (`sports_id`) REFERENCES `cus_sports` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_products`
--

LOCK TABLES `cus_products` WRITE;
/*!40000 ALTER TABLE `cus_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_products_assets`
--

DROP TABLE IF EXISTS `cus_products_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_products_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `file` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_cus_products_assets_cus_products1_idx` (`product_id`),
  CONSTRAINT `fk_cus_products_assets_cus_products1` FOREIGN KEY (`product_id`) REFERENCES `cus_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_products_assets`
--

LOCK TABLES `cus_products_assets` WRITE;
/*!40000 ALTER TABLE `cus_products_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_products_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_sports`
--

DROP TABLE IF EXISTS `cus_sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cus_sports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_sports`
--

LOCK TABLES `cus_sports` WRITE;
/*!40000 ALTER TABLE `cus_sports` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saf_cms`
--

DROP TABLE IF EXISTS `saf_cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saf_cms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `content` text,
  `url` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_saf_cms_auth_users1_idx` (`user_id`),
  CONSTRAINT `fk_saf_cms_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saf_cms`
--

LOCK TABLES `saf_cms` WRITE;
/*!40000 ALTER TABLE `saf_cms` DISABLE KEYS */;
/*!40000 ALTER TABLE `saf_cms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saf_countries`
--

DROP TABLE IF EXISTS `saf_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saf_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saf_countries`
--

LOCK TABLES `saf_countries` WRITE;
/*!40000 ALTER TABLE `saf_countries` DISABLE KEYS */;
INSERT INTO `saf_countries` VALUES (1,'Afghanistan','AFG',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(2,'Aland Islands','ALA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(3,'Albania','ALB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(4,'Algeria','DZA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(5,'American Samoa','ASM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(6,'Andorra','AND',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(7,'Angola','AGO',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(8,'Anguilla','AIA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(9,'Antarctica','ATA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(10,'Antigua And Barbuda','ATG',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(11,'Argentina','ARG',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(12,'Armenia','ARM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(13,'Aruba','ABW',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(14,'Australia','AUS',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(15,'Austria','AUT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(16,'Azerbaijan','AZE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(17,'Bahamas The','BHS',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(18,'Bahrain','BHR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(19,'Bangladesh','BGD',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(20,'Barbados','BRB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(21,'Belarus','BLR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(22,'Belgium','BEL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(23,'Belize','BLZ',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(24,'Benin','BEN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(25,'Bermuda','BMU',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(26,'Bhutan','BTN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(27,'Bolivia','BOL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(28,'Bosnia and Herzegovina','BIH',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(29,'Botswana','BWA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(30,'Bouvet Island','BVT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(31,'Brasil','BRA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(32,'British Indian Ocean Territory','IOT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(33,'Brunei','BRN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(34,'Bulgaria','BGR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(35,'Burkina Faso','BFA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(36,'Burundi','BDI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(37,'Cambodia','KHM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(38,'Cameroon','CMR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(39,'Canada','CAN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(40,'Cape Verde','CPV',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(41,'Cayman Islands','CYM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(42,'Central African Republic','CAF',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(43,'Chad','TCD',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(44,'Chile','CHL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(45,'China','CHN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(46,'Christmas Island','CXR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(47,'Cocos (Keeling) Islands','CCK',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(48,'Colombia','COL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(49,'Comoros','COM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(50,'Congo','COG',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(51,'Congo The Democratic Republic Of The','COD',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(52,'Cook Islands','COK',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(53,'Costa Rica','CRI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(54,'Cote D\'Ivoire (Ivory Coast)','CIV',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(55,'Croatia (Hrvatska)','HRV',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(56,'Cuba','CUB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(57,'Cyprus','CYP',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(58,'Czech Republic','CZE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(59,'Denmark','DNK',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(60,'Djibouti','DJI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(61,'Dominica','DMA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(62,'Dominican Republic','DOM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(63,'East Timor','TLS',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(64,'Ecuador','ECU',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(65,'Egypt','EGY',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(66,'El Salvador','SLV',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(67,'Equatorial Guinea','GNQ',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(68,'Eritrea','ERI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(69,'Estonia','EST',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(70,'Ethiopia','ETH',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(71,'Falkland Islands','FLK',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(72,'Faroe Islands','FRO',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(73,'Fiji Islands','FJI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(74,'Finland','FIN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(75,'France','FRA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(76,'French Guiana','GUF',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(77,'French Polynesia','PYF',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(78,'French Southern Territories','ATF',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(79,'Gabon','GAB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(80,'Gambia The','GMB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(81,'Georgia','GEO',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(82,'Germany','DEU',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(83,'Ghana','GHA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(84,'Gibraltar','GIB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(85,'Greece','GRC',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(86,'Greenland','GRL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(87,'Grenada','GRD',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(88,'Guadeloupe','GLP',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(89,'Guam','GUM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(90,'Guatemala','GTM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(91,'Guernsey and Alderney','GGY',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(92,'Guinea','GIN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(93,'Guinea-Bissau','GNB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(94,'Guyana','GUY',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(95,'Haiti','HTI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(96,'Heard and McDonald Islands','HMD',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(97,'Honduras','HND',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(98,'Hong Kong S.A.R.','HKG',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(99,'Hungary','HUN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(100,'Iceland','ISL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(101,'India','IND',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(102,'Indonesia','IDN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(103,'Iran','IRN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(104,'Iraq','IRQ',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(105,'Ireland','IRL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(106,'Israel','ISR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(107,'Italy','ITA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(108,'Jamaica','JAM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(109,'Japan','JPN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(110,'Jersey','JEY',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(111,'Jordan','JOR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(112,'Kazakhstan','KAZ',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(113,'Kenya','KEN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(114,'Kiribati','KIR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(115,'Korea North','PRK',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(116,'Korea South','KOR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(117,'Kuwait','KWT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(118,'Kyrgyzstan','KGZ',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(119,'Laos','LAO',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(120,'Latvia','LVA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(121,'Lebanon','LBN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(122,'Lesotho','LSO',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(123,'Liberia','LBR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(124,'Libya','LBY',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(125,'Liechtenstein','LIE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(126,'Lithuania','LTU',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(127,'Luxembourg','LUX',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(128,'Macau S.A.R.','MAC',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(129,'Macedonia','MKD',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(130,'Madagascar','MDG',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(131,'Malawi','MWI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(132,'Malaysia','MYS',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(133,'Maldives','MDV',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(134,'Mali','MLI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(135,'Malta','MLT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(136,'Man (Isle of)','IMN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(137,'Marshall Islands','MHL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(138,'Martinique','MTQ',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(139,'Mauritania','MRT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(140,'Mauritius','MUS',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(141,'Mayotte','MYT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(142,'Mexico','MEX',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(143,'Micronesia','FSM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(144,'Moldova','MDA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(145,'Monaco','MCO',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(146,'Mongolia','MNG',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(147,'Montenegro','MNE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(148,'Montserrat','MSR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(149,'Morocco','MAR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(150,'Mozambique','MOZ',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(151,'Myanmar','MMR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(152,'Namibia','NAM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(153,'Nauru','NRU',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(154,'Nepal','NPL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(155,'Netherlands Antilles','ANT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(156,'Netherlands The','NLD',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(157,'New Caledonia','NCL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(158,'New Zealand','NZL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(159,'Nicaragua','NIC',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(160,'Niger','NER',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(161,'Nigeria','NGA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(162,'Niue','NIU',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(163,'Norfolk Island','NFK',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(164,'Northern Mariana Islands','MNP',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(165,'Norway','NOR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(166,'Oman','OMN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(167,'Pakistan','PAK',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(168,'Palau','PLW',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(169,'Palestinian Territory Occupied','PSE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(170,'Panama','PAN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(171,'Papua new Guinea','PNG',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(172,'Paraguay','PRY',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(173,'Peru','PER',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(174,'Philippines','PHL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(175,'Pitcairn Island','PCN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(176,'Poland','POL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(177,'Portugal','PRT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(178,'Puerto Rico','PRI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(179,'Qatar','QAT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(180,'Reunion','REU',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(181,'Romania','ROU',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(182,'Russia','RUS',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(183,'Rwanda','RWA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(184,'Saint Helena','SHN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(185,'Saint Kitts And Nevis','KNA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(186,'Saint Lucia','LCA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(187,'Saint Pierre and Miquelon','SPM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(188,'Saint Vincent And The Grenadines','VCT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(189,'Saint-Barthelemy','BLM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(190,'Saint-Martin (French part)','MAF',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(191,'Samoa','WSM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(192,'San Marino','SMR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(193,'Sao Tome and Principe','STP',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(194,'Saudi Arabia','SAU',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(195,'Senegal','SEN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(196,'Serbia','SRB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(197,'Seychelles','SYC',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(198,'Sierra Leone','SLE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(199,'Singapore','SGP',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(200,'Slovakia','SVK',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(201,'Slovenia','SVN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(202,'Solomon Islands','SLB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(203,'Somalia','SOM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(204,'South Africa','ZAF',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(205,'South Georgia','SGS',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(206,'South Sudan','SSD',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(207,'Spain','ESP',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(208,'Sri Lanka','LKA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(209,'Sudan','SDN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(210,'Suriname','SUR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(211,'Svalbard And Jan Mayen Islands','SJM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(212,'Swaziland','SWZ',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(213,'Sweden','SWE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(214,'Switzerland','CHE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(215,'Syria','SYR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(216,'Taiwan','TWN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(217,'Tajikistan','TJK',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(218,'Tanzania','TZA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(219,'Thailand','THA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(220,'Togo','TGO',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(221,'Tokelau','TKL',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(222,'Tonga','TON',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(223,'Trinidad And Tobago','TTO',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(224,'Tunisia','TUN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(225,'Turkey','TUR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(226,'Turkmenistan','TKM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(227,'Turks And Caicos Islands','TCA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(228,'Tuvalu','TUV',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(229,'Uganda','UGA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(230,'Ukraine','UKR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(231,'United Arab Emirates','ARE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(232,'United Kingdom','GBR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(233,'United States','USA',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(234,'United States Minor Outlying Islands','UMI',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(235,'Uruguay','URY',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(236,'Uzbekistan','UZB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(237,'Vanuatu','VUT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(238,'Vatican City State (Holy See)','VAT',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(239,'Venezuela','VEN',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(240,'Vietnam','VNM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(241,'Virgin Islands (British)','VGB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(242,'Virgin Islands (US)','VIR',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(243,'Wallis And Futuna Islands','WLF',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(244,'Western Sahara','ESH',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(245,'Yemen','YEM',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(246,'Zambia','ZMB',1,'2019-10-10 23:15:44','2019-10-10 23:15:44'),(247,'Zimbabwe','ZWE',1,'2019-10-10 23:15:44','2019-10-10 23:15:44');
/*!40000 ALTER TABLE `saf_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saf_logs`
--

DROP TABLE IF EXISTS `saf_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saf_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saf_logs`
--

LOCK TABLES `saf_logs` WRITE;
/*!40000 ALTER TABLE `saf_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `saf_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saf_questions`
--

DROP TABLE IF EXISTS `saf_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saf_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `description` text,
  `order` int(11) DEFAULT NULL,
  `multiple` tinyint(4) DEFAULT NULL,
  `options` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_saf_questions_auth_users1_idx` (`user_id`),
  CONSTRAINT `fk_saf_questions_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saf_questions`
--

LOCK TABLES `saf_questions` WRITE;
/*!40000 ALTER TABLE `saf_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `saf_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saf_settings`
--

DROP TABLE IF EXISTS `saf_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saf_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` text,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_saf_settings_auth_users1_idx` (`user_id`),
  CONSTRAINT `fk_saf_settings_auth_users1` FOREIGN KEY (`user_id`) REFERENCES `auth_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saf_settings`
--

LOCK TABLES `saf_settings` WRITE;
/*!40000 ALTER TABLE `saf_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `saf_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-15 14:41:22
