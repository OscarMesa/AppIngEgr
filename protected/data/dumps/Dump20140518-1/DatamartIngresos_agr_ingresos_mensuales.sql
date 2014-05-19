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
-- Table structure for table `agr_ingresos_mensuales`
--

DROP TABLE IF EXISTS `agr_ingresos_mensuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agr_ingresos_mensuales` (
  `id_ing_mensuales` int(5) NOT NULL AUTO_INCREMENT,
  `id_persona` int(5) NOT NULL,
  `fecha_ingreso` int(5) NOT NULL,
  `id_tipo_ingreso` int(5) NOT NULL,
  `total_ingreso_mensuale` double NOT NULL,
  PRIMARY KEY (`id_ing_mensuales`),
  KEY `id_tipo_ingreso` (`id_tipo_ingreso`),
  KEY `fecha_ingreso` (`fecha_ingreso`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `agr_ingresos_mensuales_ibfk_3` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`),
  CONSTRAINT `agr_ingresos_mensuales_ibfk_5` FOREIGN KEY (`id_tipo_ingreso`) REFERENCES `dim_tipo_ingreso` (`id_tipo_ingreso`),
  CONSTRAINT `agr_ingresos_mensuales_ibfk_6` FOREIGN KEY (`fecha_ingreso`) REFERENCES `dim_tiempo` (`id_fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agr_ingresos_mensuales`
--

LOCK TABLES `agr_ingresos_mensuales` WRITE;
/*!40000 ALTER TABLE `agr_ingresos_mensuales` DISABLE KEYS */;
INSERT INTO `agr_ingresos_mensuales` VALUES (5,1,19,1,660000),(6,1,51,1,80000),(7,1,96,1,490000),(8,2,19,1,1300000),(9,2,51,5,520000),(10,2,51,5,520000);
/*!40000 ALTER TABLE `agr_ingresos_mensuales` ENABLE KEYS */;
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
