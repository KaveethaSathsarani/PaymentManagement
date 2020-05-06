-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: healthcare
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `appoinment`
--

DROP TABLE IF EXISTS `appoinment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appoinment` (
  `AID` int NOT NULL AUTO_INCREMENT,
  `PName` varchar(200) NOT NULL,
  `DName` varchar(200) NOT NULL,
  `RoomNo` int NOT NULL,
  `Date` date NOT NULL,
  `Time` date NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`AID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appoinment`
--

LOCK TABLES `appoinment` WRITE;
/*!40000 ALTER TABLE `appoinment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appoinment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docappoinments`
--

DROP TABLE IF EXISTS `docappoinments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docappoinments` (
  `DocID` int NOT NULL COMMENT 'Primary Key',
  `AID` int NOT NULL COMMENT 'Primary Key',
  `DocPhone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docappoinments`
--

LOCK TABLES `docappoinments` WRITE;
/*!40000 ALTER TABLE `docappoinments` DISABLE KEYS */;
INSERT INTO `docappoinments` VALUES (123,111,77575242);
/*!40000 ALTER TABLE `docappoinments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DocID` int NOT NULL AUTO_INCREMENT,
  `DocName` varchar(200) NOT NULL,
  `DocNIC` varchar(10) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `ReqNo` int NOT NULL,
  `Specialized` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `DocCharges` decimal(10,2) NOT NULL,
  PRIMARY KEY (`DocID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Namala Rajapaksha','894561234V','M',58764,'skin','namal.r@gmail.com',200000.00);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docworkhost`
--

DROP TABLE IF EXISTS `docworkhost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docworkhost` (
  `DocID` int NOT NULL COMMENT 'Primary Key',
  `HosID` int NOT NULL COMMENT 'Primary Key',
  `HosPhone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docworkhost`
--

LOCK TABLES `docworkhost` WRITE;
/*!40000 ALTER TABLE `docworkhost` DISABLE KEYS */;
INSERT INTO `docworkhost` VALUES (123,222,771597534),(456,333,771597534),(555,333,771597534);
/*!40000 ALTER TABLE `docworkhost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `HosID` int NOT NULL AUTO_INCREMENT,
  `HosName` varchar(200) NOT NULL,
  `HosCity` varchar(200) NOT NULL,
  `Rooms` int NOT NULL,
  PRIMARY KEY (`HosID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitalpayment`
--

DROP TABLE IF EXISTS `hospitalpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitalpayment` (
  `PayID` int NOT NULL COMMENT 'Primary Key',
  `HosID` int NOT NULL COMMENT 'Primary key'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitalpayment`
--

LOCK TABLES `hospitalpayment` WRITE;
/*!40000 ALTER TABLE `hospitalpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospitalpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Age` int NOT NULL,
  `NIC` varchar(20) NOT NULL,
  `Phone` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PayID` int NOT NULL AUTO_INCREMENT,
  `DocCharge` decimal(10,2) NOT NULL,
  `HosCharge` decimal(10,2) NOT NULL,
  `AppoCharge` decimal(10,2) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `PayType` varchar(20) NOT NULL,
  `CardNo` char(16) NOT NULL,
  `CardExpiryDate` date NOT NULL,
  `Card_CVNo` char(3) NOT NULL,
  `AppoID` int NOT NULL,
  PRIMARY KEY (`PayID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1400.00,1150.00,1000.00,3550.00,'credit','4567765489070986','2024-12-24','342',67),(2,1100.00,1000.00,1300.00,3400.00,'credit','5678876543211234','2027-03-21','123',13),(3,1100.00,1100.00,1000.00,3200.00,'debit','2121456776670987','2022-04-24','564',38),(5,1200.00,1200.00,1000.00,3400.00,'debit','1234432156780987','2021-10-30','765',21),(6,1500.00,1200.00,1100.00,3800.00,'credit','3456098712340987','2020-11-17','980',87),(7,1100.00,1100.00,1000.00,3200.00,'debit','9090876554451234','2024-02-29','127',45),(8,1300.00,1200.00,1300.00,3800.00,'debit','2345543278900987','2020-12-24','543',55),(10,1200.00,1300.00,1100.00,3600.00,'credit','1234432198765432','2024-09-30','276',32),(12,5555.00,3333.00,888.00,9776.00,'credit','44444','2024-12-30','999',78),(13,6666.00,777.00,1111.00,8554.00,'debit','0987789056788765','2029-08-24','444',44),(14,8888.00,4444.00,6666.00,19998.00,'credit','5678876512344321','2026-09-30','555',33),(15,777.00,777.00,999.00,2553.00,'credit','9090789009876543','0020-09-19','555',12),(16,226266.00,222.00,1212.00,227700.00,'debit','1234567891234567','2020-05-15','345',1),(17,777.00,9999.00,3333.00,14109.00,'0','1234432156788765','2020-05-24','444',23),(18,66126126.00,12121.00,121212.00,66259459.00,'credit','5678876523455432','2020-05-09','222',31),(19,1212.00,21212.00,1212.00,23636.00,'credit','6789987656788765','2020-05-15','222',34),(20,1212.00,1212.00,1212.00,3636.00,'debit','6789987623455432','2020-05-15','234',12),(21,122.00,212.00,1212.00,1546.00,'debit','3456789009876543','2020-05-28','122',12),(22,21212.00,1212.00,21212.00,43636.00,'credit','4567765412344321','2020-05-07','122',1),(23,222.00,2222.00,2222.00,4666.00,'credit','1818186789345678','2020-12-26','222',21),(24,3333.00,4444.00,5555.00,13332.00,'debit','2345543223456789','2020-05-17','778',44),(25,2222.00,3333.00,4444.00,9999.00,'debit','4567765445672345','2020-05-09','333',21),(26,2222.00,3333.00,5555.00,11110.00,'credit','6789098765432112','2020-05-09','333',25),(27,1200.00,2300.00,1000.00,4500.00,'credit','6723982378431290','2020-05-23','222',45);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-06 20:40:10
