CREATE DATABASE  IF NOT EXISTS `cs336_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cs336_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: cs336_db
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
  `manufacturer` varchar(20) DEFAULT NULL,
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
INSERT INTO `aircraft` VALUES (1,'Boeing','747',500,1,0,1,1,1,1,0,'AA'),(2,'Airbus','A320',200,0,1,1,0,1,1,1,'DL'),(3,'Boeing','777',350,1,0,1,1,0,1,1,'UA'),(4,'Airbus','A380',600,1,1,0,1,1,0,1,'LH'),(5,'Boeing','737',150,0,1,1,1,0,1,1,'BA'),(6,'Airbus','A330',250,1,1,1,0,1,0,1,'AF'),(7,'Embraer','E190',100,1,1,1,1,0,1,1,'EK'),(8,'Boeing','787',300,0,1,0,1,1,0,1,'SQ'),(9,'Airbus','A350',270,1,0,1,1,1,1,0,'QF'),(10,'Boeing','767',180,1,0,1,1,1,0,1,'CX'),(11,'Airbus','A310',120,0,1,0,1,1,0,1,'TK'),(12,'Boeing','757',200,1,1,1,0,1,1,0,'JL'),(13,'Airbus','A300',250,0,1,1,1,1,1,0,'EK'),(14,'Boeing','747',500,1,0,1,0,1,1,1,'EK'),(15,'Boeing','777',350,1,1,0,1,0,1,1,'SW'),(16,'Airbus','A320',200,0,1,1,1,0,1,0,'AA'),(17,'Boeing','777',350,1,0,1,1,1,0,1,'DL'),(18,'Airbus','A380',600,1,1,0,1,1,0,1,'UA'),(19,'Boeing','737',150,0,1,1,1,0,1,1,'LH'),(20,'Airbus','A330',250,1,1,1,0,1,0,1,'BA');
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
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`airlineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES ('AA','American Airlines','1-800-433-7300'),('AF','Air France','+33 1 41 56 78 00'),('BA','British Airways','1-800-AIRWAYS'),('CX','Cathay Pacific','+852 2747 3333'),('DL','Delta Air Lines','1-800-221-1212'),('EA','Etihad Airways','+971 600 555 666'),('EK','Emirates','+971 600 555 555'),('JL','Japan Airlines','+81 3 6733 3063'),('LH','Lufthansa','+49 69 86 799 799'),('QF','Qantas','1-800-227-4500'),('RD','KLM Royal Dutch Airlines','+31 20 474 7747'),('SQ','Singapore Airlines','+65 6223 8888'),('SW','Southwest Airlines','1-800-I-FLY-SWA'),('TK','Turkish Airlines','+90 212 444 0 849'),('UA','United Airlines','1-800-864-8331');
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
  `phone` varchar(20) DEFAULT NULL,
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
INSERT INTO `airport` VALUES ('AMS','Amsterdam Airport Schiphol','+31 20 794 0800','Amsterdam','Netherlands',52.308100,4.764900),('ATL','Hartsfield-Jackson Atlanta International Airport','1-800-897-1910','Atlanta','United States',33.640700,-84.427700),('CDG','Charles de Gaulle Airport','+33 1 70 36 39 50','Paris','France',49.009700,2.547900),('DEN','Denver International Airport','1-303-342-2000','Denver','United States',39.856100,-104.673700),('DFW','Dallas/Fort Worth International Airport','1-972-973-3112','Dallas','United States',32.899800,-97.040300),('DXB','Dubai International Airport','+971 4 224 5555','Dubai','United Arab Emirates',25.253200,55.365700),('FRA','Frankfurt Airport','+49 180 6 3724636','Frankfurt','Germany',50.033600,8.570600),('HND','Haneda Airport','+81 3 5757 8111','Tokyo','Japan',35.553300,139.781100),('ICN','Incheon International Airport','+82 1577-2600','Incheon','South Korea',37.460200,126.440700),('IST','Istanbul Airport','+90 444 1441','Istanbul','Turkey',41.275600,28.751900),('JFK','John F. Kennedy International Airport','1-718-244-4444','New York','United States',40.641300,-73.778100),('LAX','Los Angeles International Airport','1-855-463-5252','Los Angeles','United States',33.941600,-118.408500),('LHR','London Heathrow Airport','+44 20 8745 7654','London','United Kingdom',51.469400,-0.452100),('MEX','Benito Juárez International Airport','+52 55 5284 0400','Mexico City','Mexico',19.436100,-99.072100),('ORD','O\'Hare International Airport','1-773-686-2200','Chicago','United States',41.974200,-87.907300),('PEK','Beijing Capital International Airport','+86 10 96158','Beijing','China',40.079900,116.603100),('SIN','Changi Airport','+65 6595 6868','Singapore','Singapore',1.364400,103.991500),('SVO','Sheremetyevo International Airport','+7 495 578-65-65','Moscow','Russia',55.972600,37.414500),('SYD','Sydney Kingsford Smith Airport','+61 2 9667 9111','Sydney','Australia',-33.946100,151.177200),('YYZ','Toronto Pearson International Airport','1-416-247-7678','Toronto','Canada',43.677700,-79.624800);
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
INSERT INTO `connecting_flight` VALUES (111,'CX',121,'TK'),(121,'TK',131,'JL'),(131,'JL',141,'EK'),(141,'EK',151,'SW'),(151,'SW',161,'AA'),(161,'AA',171,'DL'),(171,'DL',181,'UA'),(181,'UA',191,'LH'),(191,'LH',201,'BA'),(101,'AA',202,'DL'),(201,'BA',211,'AF'),(202,'DL',303,'UA'),(303,'UA',404,'LH'),(404,'LH',505,'BA'),(505,'BA',606,'AF'),(606,'AF',707,'EK'),(707,'EK',808,'SQ'),(808,'SQ',909,'QF');
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
  `arriving_time` datetime DEFAULT NULL,
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
INSERT INTO `flight` VALUES (101,'AA',1,'JFK','2023-01-01 08:00:00','LAX','2023-01-01 11:00:00'),(111,'CX',10,'IST','2023-10-01 07:30:00','MEX','2023-10-01 15:00:00'),(121,'TK',11,'MEX','2023-11-01 11:15:00','SVO','2023-11-01 16:45:00'),(131,'JL',12,'SVO','2023-12-01 14:45:00','YYZ','2023-12-01 19:30:00'),(141,'EK',13,'YYZ','2024-01-01 18:00:00','ICN','2024-01-02 00:30:00'),(151,'SW',14,'ICN','2024-02-01 21:30:00','AMS','2024-02-02 05:00:00'),(161,'AA',15,'AMS','2024-03-01 01:15:00','FRA','2024-03-01 06:45:00'),(171,'DL',16,'FRA','2024-04-01 04:45:00','ATL','2024-04-01 11:15:00'),(181,'UA',17,'ATL','2024-05-01 08:15:00','ORD','2024-05-01 14:45:00'),(191,'LH',18,'ORD','2024-06-01 12:00:00','DFW','2024-06-01 18:30:00'),(201,'BA',19,'DFW','2024-07-01 15:30:00','DEN','2024-07-01 20:15:00'),(202,'DL',2,'LAX','2023-02-01 10:30:00','JFK','2023-02-01 14:30:00'),(211,'AF',20,'DEN','2024-08-01 19:00:00','JFK','2024-08-02 00:30:00'),(303,'UA',3,'LHR','2023-03-01 12:15:00','CDG','2023-03-01 14:45:00'),(404,'LH',4,'CDG','2023-04-01 14:45:00','SYD','2023-04-02 10:00:00'),(505,'BA',5,'SYD','2023-05-01 09:30:00','HND','2023-05-01 16:00:00'),(606,'AF',6,'HND','2023-06-01 15:00:00','PEK','2023-06-01 18:30:00'),(707,'EK',7,'PEK','2023-07-01 18:30:00','DXB','2023-07-02 01:00:00'),(808,'SQ',8,'DXB','2023-08-01 22:00:00','SIN','2023-08-02 04:30:00'),(909,'QF',9,'SIN','2023-09-01 03:45:00','IST','2023-09-01 10:15:00');
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
INSERT INTO `flight_has_ticket` VALUES (101,'AA',102,8),(101,'AA',106,18),(101,'AA',107,7),(111,'CX',101,15),(111,'CX',104,5),(111,'CX',105,12),(121,'TK',101,32),(161,'AA',103,22),(171,'DL',103,22),(171,'DL',108,10),(171,'DL',110,25),(171,'DL',114,11),(707,'EK',109,14),(707,'EK',111,3),(707,'EK',112,19),(707,'EK',113,6),(707,'EK',115,16);
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
INSERT INTO `operates_at` VALUES ('EK','AMS'),('SW','ATL'),('LH','CDG'),('SW','DEN'),('SW','DFW'),('SQ','DXB'),('SW','FRA'),('AF','HND'),('EK','ICN'),('CX','IST'),('AA','JFK'),('DL','JFK'),('AA','LAX'),('DL','LAX'),('DL','LHR'),('UA','LHR'),('TK','MEX'),('SW','ORD'),('EK','PEK'),('QF','SIN'),('JL','SVO'),('BA','SYD'),('AA','YYZ'),('EK','YYZ');
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
  `class` enum('economy','business','first') DEFAULT NULL,
  `bookingfee` decimal(6,2) DEFAULT NULL,
  `totalfare` decimal(10,2) DEFAULT NULL,
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
INSERT INTO `ticket` VALUES (101,'economy',50.00,300.00,2,'2023-12-15 08:30:00'),(102,'business',75.50,600.00,5,'2023-12-16 12:45:00'),(103,'economy',25.00,150.00,8,'2023-12-17 15:20:00'),(104,'first',100.00,800.00,11,'2023-12-18 18:10:00'),(105,'business',60.00,400.00,14,'2023-12-19 21:05:00'),(106,'economy',30.00,200.00,17,'2023-12-20 23:55:00'),(107,'first',80.00,700.00,20,'2023-12-21 03:30:00'),(108,'economy',45.00,350.00,2,'2023-12-22 06:15:00'),(109,'business',85.00,650.00,5,'2023-12-23 09:40:00'),(110,'economy',35.00,250.00,8,'2023-12-24 13:25:00'),(111,'first',120.00,950.00,11,'2023-12-25 16:50:00'),(112,'business',70.00,500.00,14,'2023-12-26 19:35:00'),(113,'economy',40.00,300.00,17,'2023-12-27 22:20:00'),(114,'first',90.00,750.00,20,'2023-12-28 01:45:00'),(115,'economy',55.00,400.00,2,'2023-12-29 04:30:00');
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
INSERT INTO `user` VALUES (1,'Admin',NULL,'admin','password','admin@admin.com','admin'),(2,'Customer','Rep','CustomerRep','password','hello@hotmail.com','customer representive'),(3,'Bob','John','BobbyDobby','Bob#@!','yooo@yahoo.com','customer'),(4,'Alice','Smith','AliceS','Alice123','alice@gmail.com','customer'),(5,'Charlie','Brown','CBrown','Charlie456','charlie@yahoo.com','admin'),(6,'Eva','Garcia','EvaG','Eva789','eva@hotmail.com','customer representive'),(7,'Frank','Miller','FrankM','Frank987','frank@gmail.com','customer'),(8,'Grace','Davis','GraceD','Grace654','grace@yahoo.com','customer'),(9,'Hank','Taylor','HankT','Hank321','hank@hotmail.com','customer representive'),(10,'Ivy','Clark','IvyC','Ivy000','ivy@gmail.com','customer'),(11,'Jack','Anderson','JackA','Jack111','jack@gmail.com','customer'),(12,'Kelly','Martin','KellyM','Kelly222','kelly@hotmail.com','customer'),(13,'Liam','Johnson','LiamJ','Liam333','liam@yahoo.com','customer representive'),(14,'Mia','Brown','MiaB','Mia444','mia@gmail.com','customer'),(15,'Noah','Davis','NoahD','Noah555','noah@hotmail.com','customer'),(16,'Olivia','Garcia','OliviaG','Olivia666','olivia@yahoo.com','customer representive'),(17,'Parker','Clark','ParkerC','Parker777','parker@gmail.com','customer'),(18,'Quinn','Smith','QuinnS','Quinn888','quinn@hotmail.com','customer'),(19,'Ryan','Miller','RyanM','Ryan999','ryan@yahoo.com','customer representive'),(20,'Sophia','Taylor','SophiaT','Sophia000','sophia@gmail.com','customer representive');
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
INSERT INTO `waitlists` VALUES (171,'DL',15,'2023-01-01 11:00:00'),(707,'EK',15,'2023-01-01 10:00:00'),(707,'EK',17,'2023-01-01 12:00:00'),(707,'EK',18,'2023-01-01 11:00:00');
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

-- Dump completed on 2023-12-13 10:29:07
