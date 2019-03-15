CREATE DATABASE  IF NOT EXISTS `compshop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci */;
USE `compshop`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: compshop
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zipcode` varchar(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `house` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (9,'12-500','Warszawa','Kolorowa','13'),(10,'99-888','Gdynia','Czerwona','8'),(15,'12-345','Porto','Makowa','9'),(16,'88-909','Barcelona','Niebieska','16');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,8),(3,9),(5,14),(6,15);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartspot`
--

DROP TABLE IF EXISTS `cartspot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cartspot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartspot`
--

LOCK TABLES `cartspot` WRITE;
/*!40000 ALTER TABLE `cartspot` DISABLE KEYS */;
INSERT INTO `cartspot` VALUES (85,1,13,1),(86,1,4,1),(87,1,9,1);
/*!40000 ALTER TABLE `cartspot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered`
--

DROP TABLE IF EXISTS `ordered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ordered` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered`
--

LOCK TABLES `ordered` WRITE;
/*!40000 ALTER TABLE `ordered` DISABLE KEYS */;
INSERT INTO `ordered` VALUES (18,5,1,5),(19,5,2,5),(20,5,4,3),(21,5,3,4),(28,8,2,5),(29,8,4,3),(30,8,3,4),(37,15,4,1),(38,16,1,3),(39,17,3,1),(40,18,4,1),(41,19,3,2),(42,19,4,1),(43,20,4,1),(44,21,4,2),(45,21,3,2),(46,22,2,2),(47,23,4,2),(48,24,2,1),(49,24,3,1),(50,24,4,1),(53,27,4,2),(54,27,3,2),(55,27,2,3),(56,28,13,1),(57,28,8,1),(58,28,9,1),(59,28,11,1),(60,28,7,1),(61,29,4,2);
/*!40000 ALTER TABLE `ordered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (23,8,'2019-01-29 16:13:17',938),(24,8,'2019-01-29 17:15:23',2667),(27,8,'2019-01-29 18:58:54',7233),(28,9,'2019-01-30 12:53:24',5455),(29,8,'2019-02-01 18:45:58',938);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwordchange`
--

DROP TABLE IF EXISTS `passwordchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `passwordchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `old_password` varchar(68) COLLATE utf8_polish_ci DEFAULT NULL,
  `new_password` varchar(68) COLLATE utf8_polish_ci DEFAULT NULL,
  `confirm` varchar(68) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordchange`
--

LOCK TABLES `passwordchange` WRITE;
/*!40000 ALTER TABLE `passwordchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `passwordchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `surname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (9,'Imie','Nazwisko','123456789'),(10,'Jan','Nowak','445566778'),(15,'Pestoslaw','Pestowski','897789978'),(16,'Edward','Edkowski','445664564');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Komputer stacjonarny','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','pc.jpg','computer',2699),(2,'Laptop','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','laptop.jpg','computer',1899),(3,'AMD fx4300','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','cpu.jpg','cpu',299),(4,'GTX 1070','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','gpu.jpg','gpu',469),(5,'Komputer stacjonarny','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','pc.jpg','computer',3899),(6,'Komputer stacjonarny','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','pc.jpg','computer',6299),(7,'Intel i7 8700k','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','cpu.jpg','cpu',1099),(8,'GTX 1080','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','gpu.jpg','gpu',2699),(9,'Dysk SSD','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','hdd.jpg','drive',459),(10,'RAM 8GB','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','ram.jpg','ram',199),(11,'RAM 16GB','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','ram.jpg','ram',299),(12,'Laptop','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','laptop.jpg','computer',4799),(13,'Płyta główna','  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus non tortor vitae auctor. Duis mauris felis, malesuada ac libero condimentum, molestie accumsan dui. In hac habitasse platea dictumst. Nulla venenatis, tortor nec tempus malesuada, eros enim pharetra nibh, in dignissim nisl erat ut nunc. Duis ullamcorper neque dui, sed auctor est eleifend vitae. Sed maximus est ut ipsum dictum, vel fermentum libero tincidunt. Quisque ac pulvinar ipsum, non euismod felis. Ut non metus turpis. Vestibulum pretium condimentum elit, nec varius nunc condimentum nec. Praesent volutpat ligula non odio euismod, vel sollicitudin mauris porttitor. Aenean quam mauris, dapibus eu quam placerat, blandit pretium libero. Donec quis tincidunt odio. Pellentesque tempus nisi nec ullamcorper tincidunt. Duis a viverra urna. ','mobo.jpg','mboard',899);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(68) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `personal_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `personal_id` (`personal_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`personal_id`) REFERENCES `personal` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'admin','{bcrypt}$2a$12$244qd5tZSB.ejOVwBaYJfOI9pxNtRixwa2SwBfyeDtFhFCzkt7aue',1,'admin@compshop.com',9,9),(9,'user','{bcrypt}$2a$12$HHu1ulhtHsP0f6AY8SMzzOyK03nwwzjasXDS37S6jM/dEMpx5NnlO',1,'user@gmail.com',10,10),(14,'pesto','{bcrypt}$2a$12$7O.g11aQUZK.Y3aGfMchKuKx1W.zEx4hUJol/ys30Rg0Mt8m42mea',1,'pesto@gmail.com',15,15),(15,'edek','{bcrypt}$2a$12$UnCYCyPo3EUw6Ei5ziOajOeFXFp2fCsSOxhIEGX3fwzRff0VRIvMC',1,'edek@gmail.com',16,16);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authorities` (
  `username` varchar(45) NOT NULL,
  `authority` varchar(45) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `username` (`username`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('admin','ROLE_USER',3),('user','ROLE_USER',4),('admin','ROLE_ADMIN',6),('pesto','ROLE_USER',7),('edek','ROLE_USER',8);
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-04 15:00:25
