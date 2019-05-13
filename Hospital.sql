-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctors` (
  `doctor_ID` int(10) unsigned NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`doctor_ID`),
  UNIQUE KEY `doctor_ID` (`doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (43,'Victor','Frankentein'),(44,'KC','Santosh'),(101,'Doc','Oc'),(107,'Ben','Carson'),(121,'Gellert','Grindelwald');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patients` (
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(30) NOT NULL,
  `patient_ID` int(10) unsigned NOT NULL,
  `phone_number` bigint(20) unsigned DEFAULT NULL,
  `sex` enum('M','F') NOT NULL,
  `date_admitted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ailment` varchar(30) DEFAULT NULL,
  `treatment` varchar(35) DEFAULT NULL,
  `attending_physician` int(10) unsigned NOT NULL,
  PRIMARY KEY (`patient_ID`),
  UNIQUE KEY `patient_ID` (`patient_ID`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `attending_physician` (`attending_physician`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`attending_physician`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('Martin','Tyler',404,7086142211,'M','2018-09-26 00:21:36','Laryngitis','cough syrup and saline solution',121),('Morgan','Freeman',707,2129064513,'M','2018-09-26 00:21:36','Stroke','blood thinners',44),('Ricardo','Quaresma',1175,6172194433,'M','2018-09-26 00:21:36','Concussion','MRI and bed rest',107),('Shelley','Mary',6667,NULL,'F','2018-09-26 00:21:38','High Fever and vomiting','Dolasetron and X-Str Tylenol',43),('Eric','Schmidt',22109,4049521036,'M','2018-09-26 00:21:36','rheumatoid arthritis','corticol steroids',43);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rooms` (
  `room_number` int(10) unsigned NOT NULL,
  `current_patient` int(10) unsigned DEFAULT NULL,
  `current_staff` int(10) unsigned DEFAULT NULL,
  `room_type` enum('ICU','Operation','Regular') DEFAULT NULL,
  PRIMARY KEY (`room_number`),
  UNIQUE KEY `room_number` (`room_number`),
  UNIQUE KEY `current_patient` (`current_patient`),
  UNIQUE KEY `current_staff` (`current_staff`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`current_patient`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`current_staff`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (210,NULL,101,'Regular'),(443,22109,NULL,'Regular');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-28 12:58:53
