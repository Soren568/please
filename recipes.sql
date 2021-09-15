CREATE DATABASE  IF NOT EXISTS `recipes_schema` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipes_schema`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: recipes_schema
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `instructions` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `time` tinyint(1) DEFAULT NULL,
  `made_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recipes_users_idx` (`user_id`),
  CONSTRAINT `fk_recipes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (2,'Cupcakes','Miniature cakes and miniature cups!','Make a cake, but put it in a cup.','2021-09-01 00:00:00','2021-09-14 18:17:34',1,1,'2021-09-16'),(3,'Superbowl Guac','Best guac to support the winning team.','Avocados, mix them, season, voila ','2020-12-27 00:00:00','2021-09-14 17:31:41',2,1,'2020-12-27'),(4,'Lasagna','real G\'s move in silence in a similar fashion to lasanya','Spread a thin layer of pasta sauce in the bottom of a baking dish.\r\nMake a layer of cooked lasagna noodles.\r\nSpread an even layer of the ricotta cheese mixture.\r\nSpread an even layer of meat sauce.\r\nRepeat those layers two times.\r\nTop it with a final layer of noodles, sauce, mozzarella, and parmesan cheese.','2021-09-02 00:00:00','2021-09-14 17:31:48',2,0,'2021-09-01'),(5,'Yogurt','Partially coagulated milk.','Put trumoo in sun.\r\nLet bake for 1 hour.\r\nEnjoy.','2021-09-12 00:00:00','2021-09-14 17:30:27',1,0,'2021-09-13');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Tyler','the Creator','igor@ttc.com','$2b$12$.JMQwq6I0KIijxcCBR/68eSmOFEAPXfhH7W/p3rFhf/dlGc.S60Ie','2021-09-12 09:08:09','2021-09-12 09:08:09'),(2,'Peyton ','Manning','pmanning@broncos.com','$2b$12$7n0SN0CDRg/7Hnx2Wlva7O3kRKKRsdTZlJ7TzqzIhA4hG0DaOslW2','2021-09-12 11:07:06','2021-09-12 11:07:06'),(3,'Soren','Heitmann','sor@aol.com','$2b$12$Px7LTqtHm6./CXKeIRRJoedrY5IAPnLTqpNOufM9RJC8sHp7MdLi6','2021-09-14 11:41:47','2021-09-14 11:41:47'),(4,'New','Account','new@aol.com','$2b$12$nLx8bSfngdDeE4KAM1gM6uMGRY.0JDYdxFEMOofcWm8SHECTa1UTu','2021-09-14 15:53:35','2021-09-14 15:53:35');
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

-- Dump completed on 2021-09-15 15:40:27
