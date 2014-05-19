CREATE DATABASE  IF NOT EXISTS `DatamartEgresos` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `DatamartEgresos`;
-- MySQL dump 10.13  Distrib 5.6.17, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: DatamartEgresos
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
  `nombre_mes` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(5) NOT NULL,
  PRIMARY KEY (`id_fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_tiempo`
--

LOCK TABLES `dim_tiempo` WRITE;
/*!40000 ALTER TABLE `dim_tiempo` DISABLE KEYS */;
INSERT INTO `dim_tiempo` VALUES (1,'2014-02-10',10,0,'Monday','10 February',2,'Feb','February',2014),(2,'2014-02-11',11,1,'Tuesday','11 February',2,'Feb','February',2014),(3,'2014-02-12',12,2,'Wednesday','12 February',2,'Feb','February',2014),(4,'2014-02-13',13,3,'Thursday','13 February',2,'Feb','February',2014),(5,'2014-02-14',14,4,'Friday','14 February',2,'Feb','February',2014),(6,'2014-02-15',15,5,'Saturday','15 February',2,'Feb','February',2014),(7,'2014-02-16',16,6,'Sunday','16 February',2,'Feb','February',2014),(8,'2014-02-17',17,0,'Monday','17 February',2,'Feb','February',2014),(9,'2014-02-18',18,1,'Tuesday','18 February',2,'Feb','February',2014),(10,'2014-02-19',19,2,'Wednesday','19 February',2,'Feb','February',2014),(11,'2014-02-20',20,3,'Thursday','20 February',2,'Feb','February',2014),(12,'2014-02-21',21,4,'Friday','21 February',2,'Feb','February',2014),(13,'2014-02-22',22,5,'Saturday','22 February',2,'Feb','February',2014),(14,'2014-02-23',23,6,'Sunday','23 February',2,'Feb','February',2014),(15,'2014-02-24',24,0,'Monday','24 February',2,'Feb','February',2014),(16,'2014-02-25',25,1,'Tuesday','25 February',2,'Feb','February',2014),(17,'2014-02-26',26,2,'Wednesday','26 February',2,'Feb','February',2014),(18,'2014-02-27',27,3,'Thursday','27 February',2,'Feb','February',2014),(19,'2014-02-28',28,4,'Friday','28 February',2,'Feb','February',2014),(20,'2014-03-01',1,5,'Saturday','01 March',3,'Mar','March',2014),(21,'2014-03-02',2,6,'Sunday','02 March',3,'Mar','March',2014),(22,'2014-03-03',3,0,'Monday','03 March',3,'Mar','March',2014),(23,'2014-03-04',4,1,'Tuesday','04 March',3,'Mar','March',2014),(24,'2014-03-05',5,2,'Wednesday','05 March',3,'Mar','March',2014),(25,'2014-03-06',6,3,'Thursday','06 March',3,'Mar','March',2014),(26,'2014-03-07',7,4,'Friday','07 March',3,'Mar','March',2014),(27,'2014-03-08',8,5,'Saturday','08 March',3,'Mar','March',2014);
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

-- Dump completed on 2014-05-18 21:04:26
