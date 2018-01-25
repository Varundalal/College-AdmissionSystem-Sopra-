-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: assignment_portal
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `assignment_dist`
--

DROP TABLE IF EXISTS `assignment_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_dist` (
  `USER_ID` varchar(15) NOT NULL,
  `SUBJECT_ID` varchar(10) NOT NULL,
  `ASSIGNMENT_NO` decimal(1,0) NOT NULL,
  `LAST_DATE` date NOT NULL,
  `FILE` blob,
  PRIMARY KEY (`USER_ID`,`SUBJECT_ID`,`ASSIGNMENT_NO`),
  KEY `SUBJECT_ID` (`SUBJECT_ID`),
  CONSTRAINT `assignment_dist_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `assignment_dist_ibfk_2` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`SUBJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_dist`
--

LOCK TABLES `assignment_dist` WRITE;
/*!40000 ALTER TABLE `assignment_dist` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment_dist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_submit`
--

DROP TABLE IF EXISTS `assignment_submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_submit` (
  `USER_ID` varchar(15) NOT NULL,
  `SUBJECT_ID` varchar(10) NOT NULL,
  `ASSIGNMENT_NO` decimal(1,0) NOT NULL,
  `STATUS` varchar(10) DEFAULT 'UNCHECKED',
  `REMARK` varchar(20) DEFAULT 'NO REMARK',
  `FILE` blob,
  `SUBMIT_DATE` date DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`SUBJECT_ID`,`ASSIGNMENT_NO`),
  KEY `SUBJECT_ID` (`SUBJECT_ID`),
  CONSTRAINT `assignment_submit_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `assignment_submit_ibfk_2` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`SUBJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_submit`
--

LOCK TABLES `assignment_submit` WRITE;
/*!40000 ALTER TABLE `assignment_submit` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment_submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `BRANCH_NAME` varchar(20) NOT NULL,
  `BRANCH_ID` varchar(10) NOT NULL,
  `COURSE_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`BRANCH_ID`),
  KEY `COURSE_ID` (`COURSE_ID`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `COURSE_NAME` varchar(20) NOT NULL,
  `COURSE_ID` varchar(10) NOT NULL,
  `DURATION` decimal(1,0) NOT NULL,
  PRIMARY KEY (`COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `SECTION_NAME` varchar(15) NOT NULL,
  `SECTION_ID` varchar(10) NOT NULL,
  `BRANCH_ID` varchar(10) NOT NULL,
  `COURSE_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`SECTION_ID`),
  KEY `BRANCH_ID` (`BRANCH_ID`),
  KEY `COURSE_ID` (`COURSE_ID`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`COURSE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `SEMESTER_NO` decimal(2,0) NOT NULL,
  `SEMESTER_ID` varchar(10) NOT NULL,
  `SECTION_ID` varchar(10) NOT NULL,
  `BRANCH_ID` varchar(10) NOT NULL,
  `COURSE_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`SEMESTER_ID`),
  KEY `BRANCH_ID` (`BRANCH_ID`),
  KEY `COURSE_ID` (`COURSE_ID`),
  KEY `SECTION_ID` (`SECTION_ID`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  CONSTRAINT `semester_ibfk_2` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`COURSE_ID`),
  CONSTRAINT `semester_ibfk_3` FOREIGN KEY (`SECTION_ID`) REFERENCES `section` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studies_in`
--

DROP TABLE IF EXISTS `studies_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studies_in` (
  `USER_ID` varchar(15) NOT NULL,
  `SEMESTER_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `SEMESTER_ID` (`SEMESTER_ID`),
  CONSTRAINT `studies_in_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `studies_in_ibfk_2` FOREIGN KEY (`SEMESTER_ID`) REFERENCES `semester` (`SEMESTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studies_in`
--

LOCK TABLES `studies_in` WRITE;
/*!40000 ALTER TABLE `studies_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `studies_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `SUBJECT_NAME` varchar(50) NOT NULL,
  `SUBJECT_ID` varchar(10) NOT NULL,
  `SECTION_ID` varchar(10) NOT NULL,
  `BRANCH_ID` varchar(10) NOT NULL,
  `COURSE_ID` varchar(10) NOT NULL,
  `SEMESTER_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`SUBJECT_ID`),
  KEY `BRANCH_ID` (`BRANCH_ID`),
  KEY `COURSE_ID` (`COURSE_ID`),
  KEY `SECTION_ID` (`SECTION_ID`),
  KEY `SEMESTER_ID` (`SEMESTER_ID`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`COURSE_ID`) REFERENCES `course` (`COURSE_ID`),
  CONSTRAINT `subject_ibfk_3` FOREIGN KEY (`SECTION_ID`) REFERENCES `section` (`SECTION_ID`),
  CONSTRAINT `subject_ibfk_4` FOREIGN KEY (`SEMESTER_ID`) REFERENCES `semester` (`SEMESTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches_in`
--

DROP TABLE IF EXISTS `teaches_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches_in` (
  `USER_ID` varchar(15) NOT NULL,
  `SUBJECT_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`SUBJECT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `teaches_in_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  CONSTRAINT `teaches_in_ibfk_2` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`SUBJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches_in`
--

LOCK TABLES `teaches_in` WRITE;
/*!40000 ALTER TABLE `teaches_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaches_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_NAME` varchar(50) NOT NULL,
  `USER_ID` varchar(15) NOT NULL,
  `USER_EMAIL` varchar(40) NOT NULL,
  `CONTACT` decimal(10,0) NOT NULL,
  `PASSWORD` varchar(15) NOT NULL,
  `USER_TYPE` varchar(15) NOT NULL,
  `SECURITY_QUESTION` varchar(100) NOT NULL,
  `SECURITY_ANSWER` varchar(50) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USER_EMAIL` (`USER_EMAIL`),
  UNIQUE KEY `CONTACT` (`CONTACT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-14 15:30:59
