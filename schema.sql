CREATE DATABASE  IF NOT EXISTS `journeybooker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `journeybooker`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: journeybooker
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `aircraftid` int NOT NULL,
  `manufacturer` varchar(15) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `sunday` tinyint(1) NOT NULL,
  `monday` tinyint(1) NOT NULL,
  `tuesday` tinyint(1) NOT NULL,
  `wednesday` tinyint(1) NOT NULL,
  `thursday` tinyint(1) NOT NULL,
  `friday` tinyint(1) NOT NULL,
  `saturday` tinyint(1) NOT NULL,
  `airlineid` char(2) DEFAULT NULL,
  PRIMARY KEY (`aircraftid`),
  KEY `airlineid` (`airlineid`),
  CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`airlineid`) REFERENCES `airline` (`airlineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline` (
  `airlineid` char(2) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`airlineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airportid` char(3) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`airportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `answerid` int NOT NULL,
  `content` mediumtext,
  `userid` int DEFAULT NULL,
  `timelog` datetime DEFAULT NULL,
  `questionid` int DEFAULT NULL,
  PRIMARY KEY (`answerid`),
  KEY `userid` (`userid`),
  KEY `questionid` (`questionid`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connecting_flight`
--

DROP TABLE IF EXISTS `connecting_flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connecting_flight` (
  `first_flightnumber` int NOT NULL,
  `first_airlineid` char(2) NOT NULL,
  `second_flightnumber` int NOT NULL,
  `second_airlineid` char(2) NOT NULL,
  PRIMARY KEY (`first_flightnumber`,`first_airlineid`,`second_flightnumber`,`second_airlineid`),
  KEY `second_flightnumber` (`second_flightnumber`,`second_airlineid`),
  CONSTRAINT `connecting_flight_ibfk_1` FOREIGN KEY (`first_flightnumber`, `first_airlineid`) REFERENCES `flight` (`flightnumber`, `airlineid`),
  CONSTRAINT `connecting_flight_ibfk_2` FOREIGN KEY (`second_flightnumber`, `second_airlineid`) REFERENCES `flight` (`flightnumber`, `airlineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connecting_flight`
--

LOCK TABLES `connecting_flight` WRITE;
/*!40000 ALTER TABLE `connecting_flight` DISABLE KEYS */;
/*!40000 ALTER TABLE `connecting_flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flightnumber` int NOT NULL,
  `airlineid` char(2) NOT NULL,
  `aircraftid` int DEFAULT NULL,
  `departing_airportid` char(3) DEFAULT NULL,
  `departing_time` datetime DEFAULT NULL,
  `arriving_airportid` char(3) DEFAULT NULL,
  `arriving_arrival` datetime DEFAULT NULL,
  PRIMARY KEY (`flightnumber`,`airlineid`),
  KEY `airlineid` (`airlineid`),
  KEY `aircraftid` (`aircraftid`),
  KEY `departing_airportid` (`departing_airportid`),
  KEY `arriving_airportid` (`arriving_airportid`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`airlineid`) REFERENCES `airline` (`airlineid`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`aircraftid`) REFERENCES `aircraft` (`aircraftid`),
  CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`departing_airportid`) REFERENCES `airport` (`airportid`),
  CONSTRAINT `flight_ibfk_4` FOREIGN KEY (`arriving_airportid`) REFERENCES `airport` (`airportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_has_ticket`
--

DROP TABLE IF EXISTS `flight_has_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_has_ticket` (
  `flightnumber` int NOT NULL,
  `airlineid` char(2) NOT NULL,
  `ticketid` int NOT NULL,
  `seatnumber` int DEFAULT NULL,
  PRIMARY KEY (`flightnumber`,`airlineid`,`ticketid`),
  KEY `ticketid` (`ticketid`),
  CONSTRAINT `flight_has_ticket_ibfk_1` FOREIGN KEY (`flightnumber`, `airlineid`) REFERENCES `flight` (`flightnumber`, `airlineid`),
  CONSTRAINT `flight_has_ticket_ibfk_2` FOREIGN KEY (`ticketid`) REFERENCES `ticket` (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_has_ticket`
--

LOCK TABLES `flight_has_ticket` WRITE;
/*!40000 ALTER TABLE `flight_has_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_has_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operates_at`
--

DROP TABLE IF EXISTS `operates_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operates_at` (
  `airlineid` char(2) NOT NULL,
  `airportid` char(3) NOT NULL,
  PRIMARY KEY (`airlineid`,`airportid`),
  KEY `airportid` (`airportid`),
  CONSTRAINT `operates_at_ibfk_1` FOREIGN KEY (`airlineid`) REFERENCES `airline` (`airlineid`),
  CONSTRAINT `operates_at_ibfk_2` FOREIGN KEY (`airportid`) REFERENCES `airport` (`airportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operates_at`
--

LOCK TABLES `operates_at` WRITE;
/*!40000 ALTER TABLE `operates_at` DISABLE KEYS */;
/*!40000 ALTER TABLE `operates_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `questionid` int NOT NULL,
  `title` tinytext,
  `content` mediumtext,
  `userid` int DEFAULT NULL,
  `timelog` datetime DEFAULT NULL,
  PRIMARY KEY (`questionid`),
  KEY `userid` (`userid`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticketid` int NOT NULL,
  `bookingfee` decimal(4,2) DEFAULT NULL,
  `totalfare` decimal(4,2) DEFAULT NULL,
  `class` enum('economy','business','first') DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `timelog` datetime DEFAULT NULL,
  PRIMARY KEY (`ticketid`),
  KEY `userid` (`userid`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `secondname` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('admin','customer representive','customer') DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitlists`
--

DROP TABLE IF EXISTS `waitlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitlists` (
  `flightnumber` int NOT NULL,
  `airlineid` char(2) NOT NULL,
  `userid` int NOT NULL,
  `timelog` datetime DEFAULT NULL,
  PRIMARY KEY (`flightnumber`,`airlineid`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `waitlists_ibfk_1` FOREIGN KEY (`flightnumber`, `airlineid`) REFERENCES `flight` (`flightnumber`, `airlineid`),
  CONSTRAINT `waitlists_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitlists`
--

LOCK TABLES `waitlists` WRITE;
/*!40000 ALTER TABLE `waitlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `waitlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-12 15:21:05
