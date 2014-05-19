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
-- Table structure for table `fac_egresos_diarios`
--

DROP TABLE IF EXISTS `fac_egresos_diarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_egresos_diarios` (
  `id_ing_dirarios` int(5) NOT NULL AUTO_INCREMENT,
  `id_persona` int(5) NOT NULL,
  `fecha_egreso` int(5) NOT NULL,
  `id_tipo_egreso` int(5) NOT NULL,
  `total_egreso_dia` double NOT NULL,
  PRIMARY KEY (`id_ing_dirarios`),
  KEY `id_persona` (`id_persona`),
  KEY `fecha_egreso` (`fecha_egreso`),
  KEY `id_tipo_egreso` (`id_tipo_egreso`),
  CONSTRAINT `fac_egresos_diarios_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`),
  CONSTRAINT `fac_egresos_diarios_ibfk_2` FOREIGN KEY (`fecha_egreso`) REFERENCES `dim_tiempo` (`id_fecha`),
  CONSTRAINT `fac_egresos_diarios_ibfk_3` FOREIGN KEY (`id_tipo_egreso`) REFERENCES `dim_tipo_egreso` (`id_tipo_egreso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_egresos_diarios`
--

LOCK TABLES `fac_egresos_diarios` WRITE;
/*!40000 ALTER TABLE `fac_egresos_diarios` DISABLE KEYS */;
INSERT INTO `fac_egresos_diarios` (`id_ing_dirarios`, `id_persona`, `fecha_egreso`, `id_tipo_egreso`, `total_egreso_dia`) VALUES (1,1,1,2,136500),(2,1,2,7,3000),(3,1,27,7,32000),(4,1,27,7,32000);
/*!40000 ALTER TABLE `fac_egresos_diarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-18 21:06:39
