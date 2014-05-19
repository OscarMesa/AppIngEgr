CREATE DATABASE  IF NOT EXISTS `DatamartIngresos` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `DatamartIngresos`;
-- MySQL dump 10.13  Distrib 5.6.17, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: DatamartIngresos
-- ------------------------------------------------------
-- Server version	5.6.17-1+deb.sury.org~precise+1

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
-- Table structure for table `dim_tiempo`
--

DROP TABLE IF EXISTS `dim_tiempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_tiempo` (
  `id_fecha` int(5) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `dia` int(4) NOT NULL,
  `dia_semana` int(4) NOT NULL,
  `nombre_dia_semana` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_dia` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `mes` int(5) NOT NULL,
  `mes3L` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_mes` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(5) NOT NULL,
  PRIMARY KEY (`id_fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_tiempo`
--

LOCK TABLES `dim_tiempo` WRITE;
/*!40000 ALTER TABLE `dim_tiempo` DISABLE KEYS */;
INSERT INTO `dim_tiempo` (`id_fecha`, `fecha`, `dia`, `dia_semana`, `nombre_dia_semana`, `nombre_dia`, `mes`, `mes3L`, `nombre_mes`, `year`) VALUES (1,'2014-02-10',10,0,'Monday','10 February',2,'Feb','February',2014),(2,'2014-02-11',11,1,'Tuesday','11 February',2,'Feb','February',2014),(3,'2014-02-12',12,2,'Wednesday','12 February',2,'Feb','February',2014),(4,'2014-02-13',13,3,'Thursday','13 February',2,'Feb','February',2014),(5,'2014-02-14',14,4,'Friday','14 February',2,'Feb','February',2014),(6,'2014-02-15',15,5,'Saturday','15 February',2,'Feb','February',2014),(7,'2014-02-16',16,6,'Sunday','16 February',2,'Feb','February',2014),(8,'2014-02-17',17,0,'Monday','17 February',2,'Feb','February',2014),(9,'2014-02-18',18,1,'Tuesday','18 February',2,'Feb','February',2014),(10,'2014-02-19',19,2,'Wednesday','19 February',2,'Feb','February',2014),(11,'2014-02-20',20,3,'Thursday','20 February',2,'Feb','February',2014),(12,'2014-02-21',21,4,'Friday','21 February',2,'Feb','February',2014),(13,'2014-02-22',22,5,'Saturday','22 February',2,'Feb','February',2014),(14,'2014-02-23',23,6,'Sunday','23 February',2,'Feb','February',2014),(15,'2014-02-24',24,0,'Monday','24 February',2,'Feb','February',2014),(16,'2014-02-25',25,1,'Tuesday','25 February',2,'Feb','February',2014),(17,'2014-02-26',26,2,'Wednesday','26 February',2,'Feb','February',2014),(18,'2014-02-27',27,3,'Thursday','27 February',2,'Feb','February',2014),(19,'2014-02-28',28,4,'Friday','28 February',2,'Feb','February',2014),(20,'2014-03-01',1,5,'Saturday','01 March',3,'Mar','March',2014),(21,'2014-03-02',2,6,'Sunday','02 March',3,'Mar','March',2014),(22,'2014-03-03',3,0,'Monday','03 March',3,'Mar','March',2014),(23,'2014-03-04',4,1,'Tuesday','04 March',3,'Mar','March',2014),(24,'2014-03-05',5,2,'Wednesday','05 March',3,'Mar','March',2014),(25,'2014-03-06',6,3,'Thursday','06 March',3,'Mar','March',2014),(26,'2014-03-07',7,4,'Friday','07 March',3,'Mar','March',2014),(27,'2014-03-08',8,5,'Saturday','08 March',3,'Mar','March',2014),(28,'2014-03-09',9,6,'Sunday','09 March',3,'Mar','March',2014),(29,'2014-03-10',10,0,'Monday','10 March',3,'Mar','March',2014),(30,'2014-03-11',11,1,'Tuesday','11 March',3,'Mar','March',2014),(31,'2014-03-12',12,2,'Wednesday','12 March',3,'Mar','March',2014),(32,'2014-03-13',13,3,'Thursday','13 March',3,'Mar','March',2014),(33,'2014-03-14',14,4,'Friday','14 March',3,'Mar','March',2014),(34,'2014-03-15',15,5,'Saturday','15 March',3,'Mar','March',2014),(35,'2014-03-16',16,6,'Sunday','16 March',3,'Mar','March',2014),(36,'2014-03-17',17,0,'Monday','17 March',3,'Mar','March',2014),(37,'2014-03-18',18,1,'Tuesday','18 March',3,'Mar','March',2014),(38,'2014-03-19',19,2,'Wednesday','19 March',3,'Mar','March',2014),(39,'2014-03-19',19,2,'Wednesday','19 March',3,'Mar','March',2014),(40,'2014-03-20',20,3,'Thursday','20 March',3,'Mar','March',2014),(41,'2014-03-21',21,4,'Friday','21 March',3,'Mar','March',2014),(42,'2014-03-22',22,5,'Saturday','22 March',3,'Mar','March',2014),(43,'2014-03-23',23,6,'Sunday','23 March',3,'Mar','March',2014),(44,'2014-03-24',24,0,'Monday','24 March',3,'Mar','March',2014),(45,'2014-03-25',25,1,'Tuesday','25 March',3,'Mar','March',2014),(46,'2014-03-26',26,2,'Wednesday','26 March',3,'Mar','March',2014),(47,'2014-03-27',27,3,'Thursday','27 March',3,'Mar','March',2014),(48,'2014-03-28',28,4,'Friday','28 March',3,'Mar','March',2014),(49,'2014-03-29',29,5,'Saturday','29 March',3,'Mar','March',2014),(50,'2014-03-30',30,6,'Sunday','30 March',3,'Mar','March',2014),(51,'2014-03-31',31,0,'Monday','31 March',3,'Mar','March',2014),(52,'2014-04-01',1,1,'Tuesday','01 April',4,'Apr','April',2014),(53,'2014-04-02',2,2,'Wednesday','02 April',4,'Apr','April',2014),(54,'2014-04-03',3,3,'Thursday','03 April',4,'Apr','April',2014),(55,'2014-04-04',4,4,'Friday','04 April',4,'Apr','April',2014),(56,'2014-04-05',5,5,'Saturday','05 April',4,'Apr','April',2014),(57,'2014-04-06',6,6,'Sunday','06 April',4,'Apr','April',2014),(58,'2014-04-07',7,0,'Monday','07 April',4,'Apr','April',2014),(59,'2014-04-08',8,1,'Tuesday','08 April',4,'Apr','April',2014),(60,'2014-04-09',9,2,'Wednesday','09 April',4,'Apr','April',2014),(61,'2014-04-10',10,3,'Thursday','10 April',4,'Apr','April',2014),(62,'2014-04-11',11,4,'Friday','11 April',4,'Apr','April',2014),(63,'2014-04-12',12,5,'Saturday','12 April',4,'Apr','April',2014),(64,'2014-04-13',13,6,'Sunday','13 April',4,'Apr','April',2014),(65,'2014-04-14',14,0,'Monday','14 April',4,'Apr','April',2014),(66,'2014-04-15',15,1,'Tuesday','15 April',4,'Apr','April',2014),(67,'2014-04-16',16,2,'Wednesday','16 April',4,'Apr','April',2014),(68,'2014-04-17',17,3,'Thursday','17 April',4,'Apr','April',2014),(69,'2014-04-18',18,4,'Friday','18 April',4,'Apr','April',2014),(70,'2014-04-19',19,5,'Saturday','19 April',4,'Apr','April',2014),(71,'2014-04-20',20,6,'Sunday','20 April',4,'Apr','April',2014),(72,'2014-04-21',21,0,'Monday','21 April',4,'Apr','April',2014),(73,'2014-04-22',22,1,'Tuesday','22 April',4,'Apr','April',2014),(74,'2014-04-23',23,2,'Wednesday','23 April',4,'Apr','April',2014),(75,'2014-04-24',24,3,'Thursday','24 April',4,'Apr','April',2014),(76,'2014-04-25',25,4,'Friday','25 April',4,'Apr','April',2014),(77,'2014-04-26',26,5,'Saturday','26 April',4,'Apr','April',2014),(78,'2014-04-27',27,6,'Sunday','27 April',4,'Apr','April',2014),(79,'2014-04-28',28,0,'Monday','28 April',4,'Apr','April',2014),(80,'2014-04-29',29,1,'Tuesday','29 April',4,'Apr','April',2014),(81,'2014-04-30',30,2,'Wednesday','30 April',4,'Apr','April',2014),(82,'2014-05-01',1,3,'Thursday','01 May',5,'May','May',2014),(83,'2014-05-02',2,4,'Friday','02 May',5,'May','May',2014),(84,'2014-05-03',3,5,'Saturday','03 May',5,'May','May',2014),(85,'2014-05-04',4,6,'Sunday','04 May',5,'May','May',2014),(86,'2014-05-05',5,0,'Monday','05 May',5,'May','May',2014),(87,'2014-05-06',6,1,'Tuesday','06 May',5,'May','May',2014),(88,'2014-05-07',7,2,'Wednesday','07 May',5,'May','May',2014),(89,'2014-05-08',8,3,'Thursday','08 May',5,'May','May',2014),(90,'2014-05-09',9,4,'Friday','09 May',5,'May','May',2014),(91,'2014-05-10',10,5,'Saturday','10 May',5,'May','May',2014),(92,'2014-05-11',11,6,'Sunday','11 May',5,'May','May',2014),(93,'2014-05-12',12,0,'Monday','12 May',5,'May','May',2014),(94,'2014-05-13',13,1,'Tuesday','13 May',5,'May','May',2014),(95,'2014-05-14',14,2,'Wednesday','14 May',5,'May','May',2014),(96,'2014-05-15',15,3,'Thursday','15 May',5,'May','May',2014);
/*!40000 ALTER TABLE `dim_tiempo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-18 21:06:40
