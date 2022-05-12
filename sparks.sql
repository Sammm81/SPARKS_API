-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: sparks
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` varchar(10) NOT NULL,
  `place_id` varchar(10) NOT NULL,
  `area_name` varchar(30) NOT NULL,
  `full` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `place_id` (`place_id`),
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES ('0a45758d8c','0a23715d08','Front Lobby',0),('0a4d9ab8b9','0a23715d08','Side A',0),('0a4ddcf49e','0a23715d08','Side B',0),('0a4e222323','0a23715d08','Side C',0),('0a4e5cf55e','0a23715d08','Side D',0),('cf793e4089','0a23715d08','Motor',0);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` varchar(10) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `slot_id` varchar(10) NOT NULL,
  `token` varchar(20) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `record` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_id` (`user_id`),
  KEY `slot_id` (`slot_id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `slot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('099081567c','0cf724c66f','0a58e29a55','0a58e29a550cf724c66f',1,'2022-05-03 02:52:56'),('09b71a6263','0a75a6e042','0a5891364f','0a5891364f0a75a6e042',1,'2022-05-03 03:03:13'),('0a148c3616','0a75a6e042','0a61546c7f','0a61546c7f0a75a6e042',1,'2022-05-03 03:28:08'),('0a3ff94226','0cf724c66f','0a622a1560','0a622a15600cf724c66f',1,'2022-05-03 03:39:43'),('0efc994315','0cf724c66f','0a546c2725','0a546c27250cf724c66f',1,'2022-04-21 05:46:49'),('2b1639f62b','0cf724c66f','0a6757c09a','0a6757c09a0cf724c66f',1,'2022-04-22 13:45:07'),('cf85da9efc','0cf724c66f','cf7b03e617','cf7b03e6170cf724c66f',1,'2022-05-12 12:06:53');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` varchar(10) NOT NULL,
  `book_id` varchar(10) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `record` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('099fd35206','099081567c',1,'2022-05-03 02:57:01'),('09c215476c','09b71a6263',1,'2022-05-03 03:06:09'),('0a254d3620','0a148c3616',1,'2022-05-03 03:32:36'),('0a411f0f83','0a3ff94226',1,'2022-05-03 03:40:01'),('113b7128aa','0efc994315',1,'2022-04-21 08:20:07'),('cd8d5c8bb0','2b1639f62b',1,'2022-04-22 13:57:41'),('cf88599a48','cf85da9efc',1,'2022-05-12 12:07:33');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `id` varchar(10) NOT NULL,
  `place_name` varchar(30) NOT NULL,
  `full` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES ('0a219599cf','Living Plaza Jababeka',0),('0a23715d08','President University',0),('0a2456af0e','District I Meikarta',0),('0a2592b293','Lippo Cikarang',0),('0a2dc32d91','RS Metro Cikarang',0),('0a2e88dbbf','RS Harapan Keluarga Cikarang',0),('0a310d5dcb','Jababeka Golf & Country',0),('0a331a239b','Ibis Hotel Cikarang',0),('0a35264c7a','Grand Zuri Hotel Cikarang',0),('0a3bae098a','Hollywood Junction Jababeka',0);
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot`
--

DROP TABLE IF EXISTS `slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `slot` (
  `id` varchar(10) NOT NULL,
  `area_id` varchar(10) NOT NULL,
  `slot_name` varchar(30) NOT NULL,
  `book` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `slot_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot`
--

LOCK TABLES `slot` WRITE;
/*!40000 ALTER TABLE `slot` DISABLE KEYS */;
INSERT INTO `slot` VALUES ('0a542c87f0','0a4d9ab8b9','A1',0,1),('0a546c2725','0a4d9ab8b9','A2',0,1),('0a549e3dba','0a4d9ab8b9','A3',0,1),('0a54ce0c35','0a4d9ab8b9','A4',0,1),('0a55001297','0a4d9ab8b9','A5',0,1),('0a553295b0','0a4d9ab8b9','A6',0,1),('0a55867076','0a4d9ab8b9','A7',0,1),('0a55bf0004','0a4d9ab8b9','A8',0,1),('0a55f2412b','0a4d9ab8b9','A9',0,1),('0a5626a401','0a4d9ab8b9','A10',0,1),('0a5865630f','0a4ddcf49e','B1',0,1),('0a5891364f','0a4ddcf49e','B2',0,1),('0a58b60b91','0a4ddcf49e','B3',0,1),('0a58e29a55','0a4ddcf49e','B4',0,1),('0a592b5d02','0a4ddcf49e','B5',0,1),('0a595ef58e','0a4ddcf49e','B6',0,1),('0a59914082','0a4ddcf49e','B7',0,1),('0a59c10bff','0a4ddcf49e','B8',0,1),('0a59fb4183','0a4ddcf49e','B9',0,1),('0a5a2823e5','0a4ddcf49e','B10',0,1),('0a5b9af891','0a4e222323','C1',0,1),('0a5bc7e4bd','0a4e222323','C2',0,1),('0a5bf58043','0a4e222323','C3',0,1),('0a5c276805','0a4e222323','C4',0,1),('0a5c5b4939','0a4e222323','C5',0,1),('0a5f53c6e5','0a4e222323','C6',0,1),('0a5f82f3d5','0a4e222323','C7',0,1),('0a5faee877','0a4e222323','C8',0,1),('0a5fd8e804','0a4e222323','C9',0,1),('0a60108a2d','0a4e222323','C10',0,1),('0a612a59c0','0a4e5cf55e','D1',0,1),('0a61546c7f','0a4e5cf55e','D2',0,1),('0a6175cfd8','0a4e5cf55e','D3',0,1),('0a61a7bf18','0a4e5cf55e','D4',0,1),('0a61cd1f29','0a4e5cf55e','D5',0,1),('0a622a1560','0a4e5cf55e','D6',0,1),('0a6253a638','0a4e5cf55e','D7',0,1),('0a62887f7f','0a4e5cf55e','D8',0,1),('0a62b68184','0a4e5cf55e','D9',0,1),('0a62e46695','0a4e5cf55e','D10',0,1),('0a67247160','0a45758d8c','FL1',0,1),('0a6757c09a','0a45758d8c','FL2',0,1),('0a6782154e','0a45758d8c','FL3',0,1),('0a67a6fa05','0a45758d8c','FL4',0,1),('0a67cf12a2','0a45758d8c','FL5',0,1),('0a68098358','0a45758d8c','FL6',0,1),('0a6830c352','0a45758d8c','FL7',0,1),('0a68629548','0a45758d8c','FL8',0,1),('0a688d1b82','0a45758d8c','FL9',0,1),('0a68bb8aa3','0a45758d8c','FL10',0,1),('184f55c4fb','0a4d9ab8b9','A11',0,1),('cf7b03e617','cf793e4089','M1',0,1),('cf7d841e8e','cf793e4089','M2',0,1),('cf7e3bf227','cf793e4089','M3',0,1),('cf7f25fe38','cf793e4089','M4',0,1),('cf7fc19c52','cf793e4089','M5',0,1);
/*!40000 ALTER TABLE `slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(500) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `balance` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('0a11c044ee','admin','admin.sparks@gmail.com','21232f297a57a5a743894a0e4a801fc3',1,0),('0a75a6e042','Ayub','ayub.sparks@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',0,-4000),('0cf724c66f','Christian','chris.sparks@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',0,144000),('182f6e2f9b','Samuel','sam.sparks@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',0,0),('18505e0b74','livevil','livevil.sparks@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',0,0);
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

-- Dump completed on 2022-05-12 19:09:55
