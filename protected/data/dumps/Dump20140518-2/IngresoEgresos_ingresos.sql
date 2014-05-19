CREATE DATABASE  IF NOT EXISTS `IngresoEgresos` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `IngresoEgresos`;
-- MySQL dump 10.13  Distrib 5.6.17, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: IngresoEgresos
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
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `valor_ingreso` double NOT NULL,
  `usuario_id` int(5) NOT NULL,
  `tipo_ingreso_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tipo_ingreso_id` (`tipo_ingreso_id`),
  CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`tipo_ingreso_id`) REFERENCES `tipo_ingresos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` (`id`, `descripcion`, `fecha_ingreso`, `valor_ingreso`, `usuario_id`, `tipo_ingreso_id`) VALUES (1,'Nuevo pago de la nomina en la empresa.','2014-02-10',400000,1,1),(2,'pago por prestacion de servicios en gamma.','2014-02-18',200000,1,1),(3,'Pago de deuda por parte de una migo, que me estaba adeudando un dinero.','2014-02-25',20000,1,5),(4,'Prestamo que le hice a mi hermana','2014-02-25',40000,1,5),(5,'pago por prestacion de servicios en nettic','2014-03-08',80000,1,1),(6,'Pago nomina','2014-02-10',1200000,2,1),(7,'Mi padre pago una deuda de hace 4 semenas.','2014-03-19',300000,2,5),(8,'Me encontre en santa fe un dinero poor suerte.','2014-02-28',100000,2,3),(9,'Pago de horas extras.','2014-03-06',200000,2,1),(10,'Continua mi suerte, a la salida de mi casa encotre 20000','2014-03-08',20000,2,3),(11,'sueldo del mes','2014-05-15',490000,1,1);
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
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
