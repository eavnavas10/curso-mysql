-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hello_mysql
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'MoureDev'),(2,'Apple'),(3,'Google');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpi`
--

DROP TABLE IF EXISTS `dpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dpi` (
  `dpi_id` int NOT NULL AUTO_INCREMENT,
  `dpi_number` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`dpi_id`),
  UNIQUE KEY `dpi_id` (`dpi_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `dpi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpi`
--

LOCK TABLES `dpi` WRITE;
/*!40000 ALTER TABLE `dpi` DISABLE KEYS */;
INSERT INTO `dpi` VALUES (1,1111,1),(2,2222,2),(4,4444,4),(5,3333,NULL);
/*!40000 ALTER TABLE `dpi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_history`
--

DROP TABLE IF EXISTS `email_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_history` (
  `email_history_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email_history_id`),
  UNIQUE KEY `email_history_id_UNIQUE` (`email_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_history`
--

LOCK TABLES `email_history` WRITE;
/*!40000 ALTER TABLE `email_history` DISABLE KEYS */;
INSERT INTO `email_history` VALUES (1,5,'Diegovilla@gmail.com');
/*!40000 ALTER TABLE `email_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'Swift'),(2,'Kotlin'),(3,'Javascript'),(4,'Java'),(5,'Python'),(6,'C#'),(7,'COBOL');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `init_date` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_companies` (`company_id`),
  KEY `idx_name_surname` (`name`,`surname`),
  CONSTRAINT `fk_companies` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ernesto','Villatoro',23,'2001-06-18','ernestonavas53@gmail.com',1),(2,'Alfonso','Navas',22,'2001-12-16','ernestonavas10@outlook.com',2),(4,'Wilson',NULL,15,NULL,NULL,NULL),(5,'Diego','Villalobos',24,NULL,'DiegouVillalobos@gmail.com',3),(6,'Eduardo','López',23,NULL,'ernestonavas10@outlook.com',NULL),(7,'Jose','Higueros',18,'2002-01-20','jhigueros@hotmail.com',1),(8,'Rodolfo','Pérez',26,NULL,NULL,NULL),(9,'Pablo','Torres',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_languages`
--

DROP TABLE IF EXISTS `users_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_languages` (
  `users_language_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `language_id` int NOT NULL,
  PRIMARY KEY (`users_language_id`),
  UNIQUE KEY `user_id` (`user_id`,`language_id`),
  KEY `users_languages_ibfk_2` (`language_id`),
  CONSTRAINT `users_languages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `users_languages_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_languages`
--

LOCK TABLES `users_languages` WRITE;
/*!40000 ALTER TABLE `users_languages` DISABLE KEYS */;
INSERT INTO `users_languages` VALUES (1,1,1),(2,1,2),(3,1,5),(4,2,3),(5,2,5);
/*!40000 ALTER TABLE `users_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_adult_users_age`
--

DROP TABLE IF EXISTS `v_adult_users_age`;
/*!50001 DROP VIEW IF EXISTS `v_adult_users_age`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_adult_users_age` AS SELECT 
 1 AS `name`,
 1 AS `age`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_adult_users_age`
--

/*!50001 DROP VIEW IF EXISTS `v_adult_users_age`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`uvng3kevrzysmbct`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_adult_users_age` AS select `users`.`name` AS `name`,`users`.`age` AS `age` from `users` where (`users`.`age` >= 18) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02 22:06:13
