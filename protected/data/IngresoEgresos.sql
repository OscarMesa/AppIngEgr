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
-- Table structure for table `dim_tipo_egreso`
--

DROP TABLE IF EXISTS `dim_tipo_egreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_tipo_egreso` (
  `id_tipo_egreso` int(5) NOT NULL AUTO_INCREMENT,
  `cod_tipo_egreso` int(5) NOT NULL,
  `tipo_egreso` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_egreso`,`cod_tipo_egreso`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_tipo_egreso`
--

LOCK TABLES `dim_tipo_egreso` WRITE;
/*!40000 ALTER TABLE `dim_tipo_egreso` DISABLE KEYS */;
INSERT INTO `dim_tipo_egreso` (`id_tipo_egreso`, `cod_tipo_egreso`, `tipo_egreso`) VALUES (1,1,'Alimentacion'),(2,2,'Transporte'),(3,3,'Arriendo'),(4,4,'Servicios'),(5,5,'Prestamos  a terceros'),(6,6,'Pago de deudas'),(7,7,'Diversión y entretenimiento');
/*!40000 ALTER TABLE `dim_tipo_egreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agr_egresos_mensuales`
--

DROP TABLE IF EXISTS `agr_egresos_mensuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agr_egresos_mensuales` (
  `id_ing_mensuales` int(5) NOT NULL AUTO_INCREMENT,
  `id_persona` int(5) NOT NULL,
  `fecha_egreso` int(5) NOT NULL,
  `id_tipo_egreso` int(5) NOT NULL,
  `total_egreso_mensuale` double NOT NULL,
  PRIMARY KEY (`id_ing_mensuales`),
  KEY `id_persona` (`id_persona`),
  KEY `fecha_egreso` (`fecha_egreso`),
  KEY `id_tipo_egreso` (`id_tipo_egreso`),
  CONSTRAINT `agr_egresos_mensuales_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`),
  CONSTRAINT `agr_egresos_mensuales_ibfk_2` FOREIGN KEY (`fecha_egreso`) REFERENCES `dim_tiempo` (`id_fecha`),
  CONSTRAINT `agr_egresos_mensuales_ibfk_3` FOREIGN KEY (`id_tipo_egreso`) REFERENCES `dim_tipo_egreso` (`id_tipo_egreso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agr_egresos_mensuales`
--

LOCK TABLES `agr_egresos_mensuales` WRITE;
/*!40000 ALTER TABLE `agr_egresos_mensuales` DISABLE KEYS */;
INSERT INTO `agr_egresos_mensuales` (`id_ing_mensuales`, `id_persona`, `fecha_egreso`, `id_tipo_egreso`, `total_egreso_mensuale`) VALUES (1,1,19,2,139500),(2,1,27,7,32000);
/*!40000 ALTER TABLE `agr_egresos_mensuales` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `dim_tiempo` (`id_fecha`, `fecha`, `dia`, `dia_semana`, `nombre_dia_semana`, `nombre_dia`, `mes`, `mes3L`, `nombre_mes`, `year`) VALUES (1,'2014-02-10',10,0,'Monday','10 February',2,'Feb','February',2014),(2,'2014-02-11',11,1,'Tuesday','11 February',2,'Feb','February',2014),(3,'2014-02-12',12,2,'Wednesday','12 February',2,'Feb','February',2014),(4,'2014-02-13',13,3,'Thursday','13 February',2,'Feb','February',2014),(5,'2014-02-14',14,4,'Friday','14 February',2,'Feb','February',2014),(6,'2014-02-15',15,5,'Saturday','15 February',2,'Feb','February',2014),(7,'2014-02-16',16,6,'Sunday','16 February',2,'Feb','February',2014),(8,'2014-02-17',17,0,'Monday','17 February',2,'Feb','February',2014),(9,'2014-02-18',18,1,'Tuesday','18 February',2,'Feb','February',2014),(10,'2014-02-19',19,2,'Wednesday','19 February',2,'Feb','February',2014),(11,'2014-02-20',20,3,'Thursday','20 February',2,'Feb','February',2014),(12,'2014-02-21',21,4,'Friday','21 February',2,'Feb','February',2014),(13,'2014-02-22',22,5,'Saturday','22 February',2,'Feb','February',2014),(14,'2014-02-23',23,6,'Sunday','23 February',2,'Feb','February',2014),(15,'2014-02-24',24,0,'Monday','24 February',2,'Feb','February',2014),(16,'2014-02-25',25,1,'Tuesday','25 February',2,'Feb','February',2014),(17,'2014-02-26',26,2,'Wednesday','26 February',2,'Feb','February',2014),(18,'2014-02-27',27,3,'Thursday','27 February',2,'Feb','February',2014),(19,'2014-02-28',28,4,'Friday','28 February',2,'Feb','February',2014),(20,'2014-03-01',1,5,'Saturday','01 March',3,'Mar','March',2014),(21,'2014-03-02',2,6,'Sunday','02 March',3,'Mar','March',2014),(22,'2014-03-03',3,0,'Monday','03 March',3,'Mar','March',2014),(23,'2014-03-04',4,1,'Tuesday','04 March',3,'Mar','March',2014),(24,'2014-03-05',5,2,'Wednesday','05 March',3,'Mar','March',2014),(25,'2014-03-06',6,3,'Thursday','06 March',3,'Mar','March',2014),(26,'2014-03-07',7,4,'Friday','07 March',3,'Mar','March',2014),(27,'2014-03-08',8,5,'Saturday','08 March',3,'Mar','March',2014);
/*!40000 ALTER TABLE `dim_tiempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_persona`
--

DROP TABLE IF EXISTS `dim_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_persona` (
  `id_persona` int(5) NOT NULL,
  `tipo_identificacion` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_completo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `usuario_modificador` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_persona`
--

LOCK TABLES `dim_persona` WRITE;
/*!40000 ALTER TABLE `dim_persona` DISABLE KEYS */;
INSERT INTO `dim_persona` (`id_persona`, `tipo_identificacion`, `nombre_completo`, `fecha_creacion`, `fecha_modificacion`, `usuario_modificador`) VALUES (1,'Cédula de Ciudadania','oscar  mesa 0','2014-05-12',NULL,'oscar mesa'),(2,'Cédula de Ciudadania','julian  david  giraldo 0','2014-05-12',NULL,'oscar mesa');
/*!40000 ALTER TABLE `dim_persona` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping events for database 'DatamartEgresos'
--

--
-- Dumping routines for database 'DatamartEgresos'
--
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_personas_egresos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_personas_egresos`()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE id INT;
    DECLARE nombre1 VARCHAR(100);
    DECLARE nombre2 VARCHAR(100);
    DECLARE apellido1 VARCHAR(100);
    DECLARE apellido2 VARCHAR(100);
    DECLARE tipo_identificacion VARCHAR(100);
    DECLARE fecha_creacion DATE;
    DECLARE fecha_modificacion DATE;
    DECLARE um_nombre1 VARCHAR(100);
    DECLARE um_apellido1 VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE c_personas CURSOR FOR SELECT inusu.id,inusu.nombre1, inusu.nombre2, inusu.apellido1, inusu.apellido2,intp.descripcion tipo_identificacion,inusu.fecha_creacion,inusu.fecha_modificacion,inusummod.nombre1 um_nombre1,inusummod.apellido1 um_apellido1 FROM IngresoEgresos.usuarios inusu INNER JOIN IngresoEgresos.tipo_identificacion intp ON (inusu.id_tipo_identidad = intp.id_identificacion) INNER JOIN IngresoEgresos.usuarios inusummod ON (inusummod.id = inusu.id_usuario_modificador);

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    OPEN c_personas;

    REPEAT
        FETCH c_personas INTO id,nombre1,nombre2,apellido1,apellido2,tipo_identificacion,fecha_creacion,fecha_modificacion,um_nombre1,um_apellido1;
            IF NOT done THEN
                SET count = (SELECT COUNT(DIDP.id_persona) FROM DatamartEgresos.dim_persona DIDP WHERE DIDP.id_persona = id);
                IF count = 0 THEN
                    INSERT INTO DatamartEgresos.dim_persona (id_persona,tipo_identificacion,nombre_completo,fecha_creacion,fecha_modificacion,usuario_modificador) VALUE(id,tipo_identificacion,CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion,fecha_modificacion,CONCAT(um_nombre1,' ',um_apellido1));
                ELSE
                    UPDATE DatamartEgresos.dim_persona SET tipo_identificacion=tipo_identificacion,nombre_completo=CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion=fecha_creacion,fecha_modificacion=fecha_modificacion,usuario_modificador=CONCAT(um_nombre1,' ',um_apellido1)  WHERE id_persona =id;
                END IF;
            END IF;
    UNTIL done END REPEAT;
    CLOSE c_personas;
--     SELECT count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_personas_ingresos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_personas_ingresos`()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE id INT;
    DECLARE nombre1 VARCHAR(100);
    DECLARE nombre2 VARCHAR(100);
    DECLARE apellido1 VARCHAR(100);
    DECLARE apellido2 VARCHAR(100);
    DECLARE tipo_identificacion VARCHAR(100);
    DECLARE fecha_creacion DATE;
    DECLARE fecha_modificacion DATE;
    DECLARE um_nombre1 VARCHAR(100);
    DECLARE um_apellido1 VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE c_personas CURSOR FOR SELECT inusu.id,inusu.nombre1, inusu.nombre2, inusu.apellido1, inusu.apellido2,intp.descripcion tipo_identificacion,inusu.fecha_creacion,inusu.fecha_modificacion,inusummod.nombre1 um_nombre1,inusummod.apellido1 um_apellido1 FROM IngresoEgresos.usuarios inusu INNER JOIN IngresoEgresos.tipo_identificacion intp ON (inusu.id_tipo_identidad = intp.id_identificacion) INNER JOIN IngresoEgresos.usuarios inusummod ON (inusummod.id = inusu.id_usuario_modificador);

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    OPEN c_personas;

    REPEAT
        FETCH c_personas INTO id,nombre1,nombre2,apellido1,apellido2,tipo_identificacion,fecha_creacion,fecha_modificacion,um_nombre1,um_apellido1;
            IF NOT done THEN
                SET count = (SELECT COUNT(DIDP.id_persona) FROM DatamartIngresos.dim_persona DIDP WHERE DIDP.id_persona = id);
                IF count = 0 THEN
                    INSERT INTO DatamartIngresos.dim_persona (id_persona,tipo_identificacion,nombre_completo,fecha_creacion,fecha_modificacion,usuario_modificador) VALUE(id,tipo_identificacion,CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion,fecha_modificacion,CONCAT(um_nombre1,' ',um_apellido1));
                ELSE
                    UPDATE DatamartIngresos.dim_persona SET tipo_identificacion=tipo_identificacion,nombre_completo=CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion=fecha_creacion,fecha_modificacion=fecha_modificacion,usuario_modificador=CONCAT(um_nombre1,' ',um_apellido1)  WHERE id_persona =id;
                END IF;
            END IF;
    UNTIL done END REPEAT;
    CLOSE c_personas;
--     SELECT count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_tiempo_egresos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_tiempo_egresos`()
BEGIN

    -- menor 
    SELECT MAX( fecha ) FROM DatamartEgresos.dim_tiempo INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_egreso ) FROM IngresoEgresos.egresos INTO @fi;
     END IF; 
    -- mayor
    SELECT MAX( fecha_egreso ) FROM IngresoEgresos.egresos INTO @ff;  

    --  
    while (@fi <= @ff) DO 
      
    INSERT INTO DatamartEgresos.dim_tiempo
        (
            fecha,
            dia,
            dia_semana,
            mes,
            year,
            nombre_dia,
            nombre_dia_semana,
            mes3L,
            nombre_mes
        )
    SELECT (@fi) Fecha,
            RIGHT(concat('0',day(@fi)),2) Dia,
            weekday(@fi) DiaSemana,
            month(@fi) Mes,
            year(@fi) y,    
            concat(RIGHT(concat('0',day(@fi)),2),' ',monthname(@fi)) nombre_dia,
            dayname(@fi) nombre_dia_semana,
            LEFT(monthname(@fi),3) mes3L,
            monthname(@fi) nombre_mes;
     
    set @fi = DATE_ADD(@fi, INTERVAL 1 DAY); 
     
    END WHILE;

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_fac_egresos_diarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_fac_egresos_diarios`()
BEGIN
    
    DECLARE fecha DATE;

    SELECT MAX( t.fecha ) FROM DatamartEgresos.fac_egresos_diarios egre JOIN  DatamartEgresos.dim_tiempo t ON (t.id_fecha = egre.fecha_egreso) INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_egreso ) FROM IngresoEgresos.egresos INTO @fi;
    ELSE
        SET @fi = DATE_ADD(@fi, INTERVAL 1 DAY);
    END IF;
   CALL migracion_fac_egresos_diarios_process(@fi);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_fac_egresos_diarios_process` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_fac_egresos_diarios_process`(IN fechafi DATE)
BEGIN
   DECLARE id INT;
   DECLARE fecha_id INT;
   DECLARE id_egreso INT;
   DECLARE id_tp_egreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   DECLARE c_egresos CURSOR FOR SELECT SUM( valor_egreso ) total , usuario_id, fecha_egreso,tipo_egreso_id FROM IngresoEgresos.egresos WHERE fecha_egreso BETWEEN DATE_FORMAT(fechafi,  '%Y-%m-%d' ) AND DATE_FORMAT(now(),  '%Y-%m-%d' ) GROUP BY usuario_id, fecha_egreso;
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
   OPEN c_egresos;

    REPEAT
        FETCH c_egresos INTO total,id,f,id_egreso;
        SET fecha_id = (SELECT MAX(id_fecha) FROM DatamartEgresos.dim_tiempo WHERE `fecha` = f LIMIT 1);
        SET id_tp_egreso = (SELECT MAX(id_tipo_egreso) FROM DatamartEgresos.dim_tipo_egreso WHERE cod_tipo_egreso = id_egreso LIMIT 1);
        INSERT INTO DatamartEgresos.fac_egresos_diarios (id_persona,fecha_egreso,id_tipo_egreso,total_egreso_dia) VALUE(id,fecha_id,id_tp_egreso,total);
    UNTIL done END REPEAT;   
    CLOSE c_egresos;
    SELECT  fechafi;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-18 21:10:18
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
INSERT INTO `agr_ingresos_mensuales` (`id_ing_mensuales`, `id_persona`, `fecha_ingreso`, `id_tipo_ingreso`, `total_ingreso_mensuale`) VALUES (5,1,19,1,660000),(6,1,51,1,80000),(7,1,96,1,490000),(8,2,19,1,1300000),(9,2,51,5,520000),(10,2,51,5,520000);
/*!40000 ALTER TABLE `agr_ingresos_mensuales` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `dim_persona`
--

DROP TABLE IF EXISTS `dim_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_persona` (
  `id_persona` int(5) NOT NULL,
  `tipo_identificacion` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_completo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `usuario_modificador` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_persona`
--

LOCK TABLES `dim_persona` WRITE;
/*!40000 ALTER TABLE `dim_persona` DISABLE KEYS */;
INSERT INTO `dim_persona` (`id_persona`, `tipo_identificacion`, `nombre_completo`, `fecha_creacion`, `fecha_modificacion`, `usuario_modificador`) VALUES (1,'Cédula de Ciudadania','oscar  mesa 0','2014-05-12',NULL,'oscar mesa'),(2,'Cédula de Ciudadania','julian  david  giraldo 0','2014-05-12',NULL,'oscar mesa');
/*!40000 ALTER TABLE `dim_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_tipo_ingreso`
--

DROP TABLE IF EXISTS `dim_tipo_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_tipo_ingreso` (
  `id_tipo_ingreso` int(5) NOT NULL AUTO_INCREMENT,
  `cod_tipo_ingreso` int(5) NOT NULL,
  `tipo_ingreso` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_ingreso`,`cod_tipo_ingreso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_tipo_ingreso`
--

LOCK TABLES `dim_tipo_ingreso` WRITE;
/*!40000 ALTER TABLE `dim_tipo_ingreso` DISABLE KEYS */;
INSERT INTO `dim_tipo_ingreso` (`id_tipo_ingreso`, `cod_tipo_ingreso`, `tipo_ingreso`) VALUES (1,1,'Salario'),(2,2,'Mesada'),(3,3,'Suerte'),(4,4,'Arriendo'),(5,5,'Pago deudas');
/*!40000 ALTER TABLE `dim_tipo_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_ingresos_diarios`
--

DROP TABLE IF EXISTS `fac_ingresos_diarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_ingresos_diarios` (
  `id_ing_dirarios` int(5) NOT NULL AUTO_INCREMENT,
  `id_persona` int(5) NOT NULL,
  `fecha_ingreso` int(5) NOT NULL,
  `id_tipo_ingreso` int(5) NOT NULL,
  `total_ingreso_dia` double NOT NULL,
  PRIMARY KEY (`id_ing_dirarios`),
  KEY `id_tipo_ingreso` (`id_tipo_ingreso`),
  KEY `fecha_ingreso` (`fecha_ingreso`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `fac_ingresos_diarios_ibfk_1` FOREIGN KEY (`id_tipo_ingreso`) REFERENCES `dim_tipo_ingreso` (`id_tipo_ingreso`),
  CONSTRAINT `fac_ingresos_diarios_ibfk_2` FOREIGN KEY (`fecha_ingreso`) REFERENCES `dim_tiempo` (`id_fecha`),
  CONSTRAINT `fac_ingresos_diarios_ibfk_3` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_ingresos_diarios`
--

LOCK TABLES `fac_ingresos_diarios` WRITE;
/*!40000 ALTER TABLE `fac_ingresos_diarios` DISABLE KEYS */;
INSERT INTO `fac_ingresos_diarios` (`id_ing_dirarios`, `id_persona`, `fecha_ingreso`, `id_tipo_ingreso`, `total_ingreso_dia`) VALUES (11,1,1,1,400000),(12,1,9,1,200000),(13,1,16,5,60000),(14,1,27,1,80000),(15,2,1,1,1200000),(16,2,19,3,100000),(17,2,25,1,200000),(18,2,27,3,20000),(21,2,38,5,300000),(22,2,38,5,300000);
/*!40000 ALTER TABLE `fac_ingresos_diarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'DatamartIngresos'
--

--
-- Dumping routines for database 'DatamartIngresos'
--
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_personas_ingresos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_personas_ingresos`()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE id INT;
    DECLARE nombre1 VARCHAR(100);
    DECLARE nombre2 VARCHAR(100);
    DECLARE apellido1 VARCHAR(100);
    DECLARE apellido2 VARCHAR(100);
    DECLARE tipo_identificacion VARCHAR(100);
    DECLARE fecha_creacion DATE;
    DECLARE fecha_modificacion DATE;
    DECLARE um_nombre1 VARCHAR(100);
    DECLARE um_apellido1 VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE c_personas CURSOR FOR SELECT inusu.id,inusu.nombre1, inusu.nombre2, inusu.apellido1, inusu.apellido2,intp.descripcion tipo_identificacion,inusu.fecha_creacion,inusu.fecha_modificacion,inusummod.nombre1 um_nombre1,inusummod.apellido1 um_apellido1 FROM IngresoEgresos.usuarios inusu INNER JOIN IngresoEgresos.tipo_identificacion intp ON (inusu.id_tipo_identidad = intp.id_identificacion) INNER JOIN IngresoEgresos.usuarios inusummod ON (inusummod.id = inusu.id_usuario_modificador);

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    OPEN c_personas;

    REPEAT
        FETCH c_personas INTO id,nombre1,nombre2,apellido1,apellido2,tipo_identificacion,fecha_creacion,fecha_modificacion,um_nombre1,um_apellido1;
            IF NOT done THEN
                SET count = (SELECT COUNT(DIDP.id_persona) FROM DatamartIngresos.dim_persona DIDP WHERE DIDP.id_persona = id);
                IF count = 0 THEN
                    INSERT INTO DatamartIngresos.dim_persona (id_persona,tipo_identificacion,nombre_completo,fecha_creacion,fecha_modificacion,usuario_modificador) VALUE(id,tipo_identificacion,CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion,fecha_modificacion,CONCAT(um_nombre1,' ',um_apellido1));
                ELSE
                    UPDATE DatamartIngresos.dim_persona SET tipo_identificacion=tipo_identificacion,nombre_completo=CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion=fecha_creacion,fecha_modificacion=fecha_modificacion,usuario_modificador=CONCAT(um_nombre1,' ',um_apellido1)  WHERE id_persona =id;
                END IF;
            END IF;
    UNTIL done END REPEAT;
    CLOSE c_personas;
    SELECT count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_tiempo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_tiempo`()
BEGIN


-- delete from DatamartIngresos.dim_tiempo;
-- menor 
SELECT MAX( fecha ) FROM DatamartIngresos.dim_tiempo INTO @fi;
IF COUNT(@fi)=0 THEN
    SELECT MIN( fecha_ingreso ) FROM IngresoEgresos.ingresos INTO @fi;
END IF;  
-- mayor
SELECT MAX( fecha_ingreso ) FROM IngresoEgresos.ingresos INTO @ff;  
 
--  
-- while (@fi <= @ff) DO 
--   
-- INSERT INTO DIM_TIEMPO
--     (
--         fecha,
--         Anio,
--         Trimestre,
--         Mes,
--         Semana,
--         Dia,
--         DiaSemana,
--         NTrimestre,
--         NMes,
--         NMes3L,
--         NSemana,
--         NDia,
--         NDiaSemana
--     )
-- SELECT year(@fi)*10000+month(@fi)*100+day(@fi) as FechaSK,
--         (@fi) Fecha,
--         year(@fi) Anio,
--         quarter(@fi) Trimestre,
--         month(@fi) Mes,
--         week(@fi) Semana,
--         RIGHT(concat('0',day(@fi)),2) Dia,
--         weekday(@fi) DiaSemana,
--         concat('T',quarter(@fi),'/',year(@fi))NTrimestre,
--         monthname(@fi) NMes,
--         LEFT(monthname(@fi),3) NMes3L,
--         concat('Sem ',week(@fi) ,'/', year(@fi)) NSemana,
--         concat(RIGHT(concat('0',day(@fi)),2),' ',monthname(@fi)) NDia,
--         dayname(@fi) NDiaSemana;
--  
-- set @fi = DATE_ADD(@fi, INTERVAL 1 DAY); 
--  
-- END WHILE;

SELECT @fi;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_fac_ingresos_diarios_process` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_fac_ingresos_diarios_process`()
BEGIN
   DECLARE id INT;
   DECLARE id_ingreso INT;
   DECLARE id_tp_ingreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   SELECT COUNT(id_fecha) FROM  DatamartIngresos.dim_tiempo;
    
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-18 21:10:18
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

--
-- Table structure for table `tipo_identificacion`
--

DROP TABLE IF EXISTS `tipo_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_identificacion` (
  `id_identificacion` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_identificacion`
--

LOCK TABLES `tipo_identificacion` WRITE;
/*!40000 ALTER TABLE `tipo_identificacion` DISABLE KEYS */;
INSERT INTO `tipo_identificacion` (`id_identificacion`, `descripcion`) VALUES (1,'Cédula de Ciudadania'),(2,'Tarjeta '),(3,'Pasapoorte'),(4,'Registro Civil');
/*!40000 ALTER TABLE `tipo_identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ingresos`
--

DROP TABLE IF EXISTS `tipo_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_ingresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ingresos`
--

LOCK TABLES `tipo_ingresos` WRITE;
/*!40000 ALTER TABLE `tipo_ingresos` DISABLE KEYS */;
INSERT INTO `tipo_ingresos` (`id`, `descripcion`) VALUES (1,'Salario'),(2,'Mesada'),(3,'Suerte'),(4,'Arriendo'),(5,'Pago deudas');
/*!40000 ALTER TABLE `tipo_ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_egresos`
--

DROP TABLE IF EXISTS `tipo_egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_egresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_egresos`
--

LOCK TABLES `tipo_egresos` WRITE;
/*!40000 ALTER TABLE `tipo_egresos` DISABLE KEYS */;
INSERT INTO `tipo_egresos` (`id`, `descripcion`) VALUES (1,'Alimentacion'),(2,'Transporte'),(3,'Arriendo'),(4,'Servicios'),(5,'Prestamos  a terceros'),(6,'Pago de deudas'),(7,'Diversión y entretenimiento');
/*!40000 ALTER TABLE `tipo_egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombre2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido1` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identificacion` int(12) DEFAULT NULL,
  `id_tipo_identidad` int(5) DEFAULT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `id_usuario_modificador` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `id_tipo_identidad` (`id_tipo_identidad`),
  KEY `id_usuario_modificador` (`id_usuario_modificador`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_identidad`) REFERENCES `tipo_identificacion` (`id_identificacion`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_usuario_modificador`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `identificacion`, `id_tipo_identidad`, `username`, `password`, `email`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_modificador`) VALUES (1,'oscar','','mesa','0',1152188863,1,'oskar','40bd001563085fc35165329ea1ff5c5ecbdbbeef','oscarmesae.lpoli@gmail.com','2014-05-12 07:02:49',NULL,1),(2,'julian ','david ','giraldo','0',2132134,1,'julian','40bd001563085fc35165329ea1ff5c5ecbdbbeef','julian.giraldo8@gmail.com','2014-05-12 07:02:49',NULL,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresos`
--

DROP TABLE IF EXISTS `egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_egreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor_egresos` double NOT NULL,
  `usuario_id` int(5) NOT NULL,
  `tipo_egreso_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tipo_egreso_id` (`tipo_egreso_id`),
  CONSTRAINT `egresos_ib_fk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `egresos_ib_fk_2` FOREIGN KEY (`tipo_egreso_id`) REFERENCES `tipo_egresos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresos`
--

LOCK TABLES `egresos` WRITE;
/*!40000 ALTER TABLE `egresos` DISABLE KEYS */;
INSERT INTO `egresos` (`id`, `descripcion`, `fecha_egreso`, `valor_egresos`, `usuario_id`, `tipo_egreso_id`) VALUES (1,'Pago de reparacion de la moton','2014-02-10 05:00:00',120000,1,2),(2,'Comer por fuera','2014-02-10 05:00:00',4500,1,1),(3,'Prestar dinero a camilo.','2014-02-10 05:00:00',12000,1,5),(4,'Compra de mecato','2014-02-11 05:00:00',3000,1,7),(5,'pago de cervezas.','2014-03-08 05:00:00',20000,1,7),(6,'gasolina','2014-03-08 05:00:00',12000,1,2);
/*!40000 ALTER TABLE `egresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'IngresoEgresos'
--

--
-- Dumping routines for database 'IngresoEgresos'
--
/*!50003 DROP PROCEDURE IF EXISTS `migracion_arg_egresos_mensuales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_arg_egresos_mensuales`()
BEGIN
    
    DECLARE fecha DATE;

    SELECT MAX( DATE_FORMAT(t.fecha, "%Y-%m" ) ) FROM DatamartEgresos.agr_egresos_mensuales egre JOIN  DatamartEgresos.dim_tiempo t ON (t.id_fecha = egre.fecha_egreso) INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( DATE_FORMAT(fecha_egreso, "%Y-%m" ) ) FROM IngresoEgresos.egresos INTO @fi;
    ELSE
        SET @fi = DATE_FORMAT(DATE_ADD(@fi, INTERVAL 1 MONTH), "%Y-%m" );
    END IF;
   CALL migracion_arg_egresos_mensuales_process(@fi);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_arg_egresos_mensuales_process` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_arg_egresos_mensuales_process`(IN fechafi VARCHAR(10))
BEGIN
   DECLARE id INT;
   DECLARE fecha_id INT;
   DECLARE id_egreso INT;
   DECLARE id_tp_egreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   DECLARE c_egresos CURSOR FOR SELECT SUM( valor_egresos ) total , usuario_id, DATE_FORMAT(fecha_egreso,'%Y-%m') fecha_egreso,tipo_egreso_id FROM IngresoEgresos.egresos WHERE fecha_egreso BETWEEN DATE_FORMAT(CONCAT(fechafi,'-01'),  '%Y-%m-%d') AND DATE_FORMAT(CONCAT(DATE_FORMAT(now(),  '%Y-%m' ),'-31'),  '%Y-%m-%d') GROUP BY usuario_id, DATE_FORMAT(fecha_egreso,'%Y-%m');
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
   OPEN c_egresos;

    REPEAT
        FETCH c_egresos INTO total,id,f,id_egreso;
IF NOT done THEN
        SET fecha_id = (SELECT MAX(id_fecha) FROM DatamartEgresos.dim_tiempo WHERE  DATE_FORMAT(fecha,  '%Y-%m') = DATE_FORMAT( CONCAT(f,'-01'), '%Y-%m' ) LIMIT 1);
        SET id_tp_egreso = (SELECT MAX(id_tipo_egreso) FROM DatamartEgresos.dim_tipo_egreso WHERE cod_tipo_egreso = id_egreso LIMIT 1);
        INSERT INTO DatamartEgresos.agr_egresos_mensuales (id_persona,fecha_egreso,id_tipo_egreso,total_egreso_mensuale) VALUE(id,fecha_id,id_tp_egreso,total);
END IF;    
UNTIL done END REPEAT;   
    CLOSE c_egresos;
    SELECT  fechafi;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_arg_ingresos_mensuales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_arg_ingresos_mensuales`()
BEGIN
    
    DECLARE fecha DATE;

    SELECT MAX( DATE_FORMAT(t.fecha, "%Y-%m" ) ) FROM DatamartIngresos.agr_ingresos_mensuales ingre JOIN  DatamartIngresos.dim_tiempo t ON (t.id_fecha = ingre.fecha_ingreso) INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( DATE_FORMAT(fecha_ingreso, "%Y-%m" ) ) FROM IngresoEgresos.ingresos INTO @fi;
    ELSE
        SET @fi = DATE_FORMAT(DATE_ADD(@fi, INTERVAL 1 MONTH), "%Y-%m" );
    END IF;
   CALL migracion_arg_ingresos_mensuales_process(@fi);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_arg_ingresos_mensuales_process` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_arg_ingresos_mensuales_process`(IN fechafi VARCHAR(10))
BEGIN
   DECLARE id INT;
   DECLARE fecha_id INT;
   DECLARE id_ingreso INT;
   DECLARE id_tp_ingreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   DECLARE c_ingresos CURSOR FOR SELECT SUM( valor_ingreso ) total , usuario_id, DATE_FORMAT(fecha_ingreso,'%Y-%m') fecha_ingreso,tipo_ingreso_id FROM IngresoEgresos.ingresos WHERE fecha_ingreso BETWEEN DATE_FORMAT(CONCAT(fechafi,'-01'),  '%Y-%m-%d') AND DATE_FORMAT(CONCAT(DATE_FORMAT(now(),  '%Y-%m' ),'-31'),  '%Y-%m-%d') GROUP BY usuario_id, DATE_FORMAT(fecha_ingreso,'%Y-%m');
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
   OPEN c_ingresos;

    REPEAT
        FETCH c_ingresos INTO total,id,f,id_ingreso;
IF NOT done THEN
        SET fecha_id = (SELECT MAX(id_fecha) FROM DatamartIngresos.dim_tiempo WHERE  DATE_FORMAT(fecha,  '%Y-%m') = DATE_FORMAT( CONCAT(f,'-01'), '%Y-%m' ) LIMIT 1);
        SET id_tp_ingreso = (SELECT MAX(id_tipo_ingreso) FROM DatamartIngresos.dim_tipo_ingreso WHERE cod_tipo_ingreso = id_ingreso LIMIT 1);
        INSERT INTO DatamartIngresos.agr_ingresos_mensuales (id_persona,fecha_ingreso,id_tipo_ingreso,total_ingreso_mensuale) VALUE(id,fecha_id,id_tp_ingreso,total);
END IF;    
UNTIL done END REPEAT;   
    CLOSE c_ingresos;
    SELECT  fechafi;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_personas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_personas`()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE id INT;
    DECLARE nombre1 VARCHAR(100);
    DECLARE nombre2 VARCHAR(100);
    DECLARE apellido1 VARCHAR(100);
    DECLARE apellido2 VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE c_personas CURSOR FOR SELECT inusu.id,inusu.nombre1, inusu.nombre2, inusu.apellido1, inusu.apellido2 FROM IngresoEgresos.usuarios inusu;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    OPEN c_personas;

    REPEAT
        FETCH c_personas INTO id,nombre1,nombre2,apellido1,apellido2;
            
    UNTIL done END REPEAT;
    CLOSE c_personas;
    SELECT count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_personas_egresos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_personas_egresos`()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE id INT;
    DECLARE nombre1 VARCHAR(100);
    DECLARE nombre2 VARCHAR(100);
    DECLARE apellido1 VARCHAR(100);
    DECLARE apellido2 VARCHAR(100);
    DECLARE tipo_identificacion VARCHAR(100);
    DECLARE fecha_creacion DATE;
    DECLARE fecha_modificacion DATE;
    DECLARE um_nombre1 VARCHAR(100);
    DECLARE um_apellido1 VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE c_personas CURSOR FOR SELECT inusu.id,inusu.nombre1, inusu.nombre2, inusu.apellido1, inusu.apellido2,intp.descripcion tipo_identificacion,inusu.fecha_creacion,inusu.fecha_modificacion,inusummod.nombre1 um_nombre1,inusummod.apellido1 um_apellido1 FROM IngresoEgresos.usuarios inusu INNER JOIN IngresoEgresos.tipo_identificacion intp ON (inusu.id_tipo_identidad = intp.id_identificacion) INNER JOIN IngresoEgresos.usuarios inusummod ON (inusummod.id = inusu.id_usuario_modificador);

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    OPEN c_personas;

    REPEAT
        FETCH c_personas INTO id,nombre1,nombre2,apellido1,apellido2,tipo_identificacion,fecha_creacion,fecha_modificacion,um_nombre1,um_apellido1;
            IF NOT done THEN
                SET count = (SELECT COUNT(DIDP.id_persona) FROM DatamartEgresos.dim_persona DIDP WHERE DIDP.id_persona = id);
                IF count = 0 THEN
                    INSERT INTO DatamartEgresos.dim_persona (id_persona,tipo_identificacion,nombre_completo,fecha_creacion,fecha_modificacion,usuario_modificador) VALUE(id,tipo_identificacion,CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion,fecha_modificacion,CONCAT(um_nombre1,' ',um_apellido1));
                ELSE
                    UPDATE DatamartEgresos.dim_persona SET tipo_identificacion=tipo_identificacion,nombre_completo=CONCAT(nombre1,' ',nombre2,' ',apellido1,' ',apellido2),fecha_creacion=fecha_creacion,fecha_modificacion=fecha_modificacion,usuario_modificador=CONCAT(um_nombre1,' ',um_apellido1)  WHERE id_persona =id;
                END IF;
            END IF;
    UNTIL done END REPEAT;
    CLOSE c_personas;
--     SELECT count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_tiempo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_tiempo`()
BEGIN


    -- delete from DatamartIngresos.dim_tiempo;
    -- menor 
    SELECT MAX( fecha ) FROM DatamartIngresos.dim_tiempo INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_ingreso ) FROM IngresoEgresos.ingresos INTO @fi;
     END IF; 
    -- mayor
    SELECT MAX( fecha_ingreso ) FROM IngresoEgresos.ingresos INTO @ff;  

    --  
    while (@fi <= @ff) DO 
      
    INSERT INTO DatamartIngresos.dim_tiempo
        (
            fecha,
            dia,
            dia_semana,
            mes,
            year,
            nombre_dia,
            nombre_dia_semana,
            mes3L,
            nombre_mes
        )
    SELECT (@fi) Fecha,
            RIGHT(concat('0',day(@fi)),2) Dia,
            weekday(@fi) DiaSemana,
            month(@fi) Mes,
            year(@fi) y,
            concat(RIGHT(concat('0',day(@fi)),2),' ',monthname(@fi)) nombre_dia,
            dayname(@fi) nombre_dia_semana,
            LEFT(monthname(@fi),3) mes3L,
            monthname(@fi) nombre_mes;
     
    set @fi = DATE_ADD(@fi, INTERVAL 1 DAY); 
     
    END WHILE;

    SELECT @fi;

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_tiempo_egresos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_tiempo_egresos`()
BEGIN

    -- menor 
    SELECT MAX( fecha ) FROM DatamartEgresos.dim_tiempo INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_egreso ) FROM IngresoEgresos.egresos INTO @fi;
     END IF; 
    -- mayor
    SELECT MAX( fecha_egreso ) FROM IngresoEgresos.egresos INTO @ff;  

    --  
    while (@fi <= @ff) DO 
      
    INSERT INTO DatamartEgresos.dim_tiempo
        (
            fecha,
            dia,
            dia_semana,
            mes,
            year,
            nombre_dia,
            nombre_dia_semana,
            mes3L,
            nombre_mes
        )
    SELECT (@fi) Fecha,
            RIGHT(concat('0',day(@fi)),2) Dia,
            weekday(@fi) DiaSemana,
            month(@fi) Mes,
            year(@fi) y,    
            concat(RIGHT(concat('0',day(@fi)),2),' ',monthname(@fi)) nombre_dia,
            dayname(@fi) nombre_dia_semana,
            LEFT(monthname(@fi),3) mes3L,
            monthname(@fi) nombre_mes;
     
    set @fi = DATE_ADD(@fi, INTERVAL 1 DAY); 
     
    END WHILE;

    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_tipo_egreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_tipo_egreso`()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE id INT;
    DECLARE tipo_egreso VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE c_tp_egreso CURSOR FOR SELECT intpi.id,intpi.descripcion FROM IngresoEgresos.tipo_egresos intpi;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    OPEN c_tp_egreso;

    REPEAT
        FETCH c_tp_egreso INTO id, tipo_egreso;
            IF NOT done THEN
                SET count = (SELECT COUNT(DITI.cod_tipo_egreso) FROM DatamartEgresos.dim_tipo_egreso DITI WHERE DITI.cod_tipo_egreso = id);
                IF  count = 0 THEN  
                    INSERT INTO DatamartEgresos.dim_tipo_egreso (cod_tipo_egreso,tipo_egreso) VALUE(id,tipo_egreso);
                ELSE
                    UPDATE DatamartEgresos.dim_tipo_egreso SET tipo_egreso = tipo_egreso WHERE cod_tipo_egreso = id;
                END IF;     
            END IF;
    UNTIL done END REPEAT;
    CLOSE c_tp_egreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_dim_tipo_ingreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_dim_tipo_ingreso`()
BEGIN
    DECLARE count INT DEFAULT 2;
    DECLARE id INT;
    DECLARE tipo_ingreso VARCHAR(100);
    DECLARE done INT DEFAULT 0;
    DECLARE c_tp_ingreso CURSOR FOR SELECT intpi.id,intpi.descripcion FROM IngresoEgresos.tipo_ingresos intpi;

    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

    OPEN c_tp_ingreso;

    REPEAT
        FETCH c_tp_ingreso INTO id, tipo_ingreso;
            IF NOT done THEN
                SET count = (SELECT COUNT(DITI.cod_tipo_ingreso) FROM DatamartIngresos.dim_tipo_ingreso DITI WHERE DITI.cod_tipo_ingreso = id);
                IF  count = 0 THEN  
                    INSERT INTO DatamartIngresos.dim_tipo_ingreso (cod_tipo_ingreso,tipo_ingreso) VALUE(id,tipo_ingreso);
                ELSE
                    UPDATE DatamartIngresos.dim_tipo_ingreso SET tipo_ingreso = tipo_ingreso WHERE cod_tipo_ingreso = id;
                END IF;     
            END IF;
    UNTIL done END REPEAT;
    CLOSE c_tp_ingreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_fac_egresos_diarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_fac_egresos_diarios`()
BEGIN
    
    DECLARE fecha DATE;

    SELECT MAX( t.fecha ) FROM DatamartEgresos.fac_egresos_diarios egre JOIN  DatamartEgresos.dim_tiempo t ON (t.id_fecha = egre.fecha_egreso) INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_egreso ) FROM IngresoEgresos.egresos INTO @fi;
    ELSE
        SET @fi = DATE_ADD(@fi, INTERVAL 1 DAY);
    END IF;
  -- CALL migracion_fac_egresos_diarios_process(@fi);
    SELECT @fi;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_fac_egresos_diarios_process` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_fac_egresos_diarios_process`(IN fechafi DATE)
BEGIN
   DECLARE id INT;
   DECLARE fecha_id INT;
   DECLARE id_egreso INT;
   DECLARE id_tp_egreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   DECLARE c_egresos CURSOR FOR SELECT SUM( valor_egresos ) total , usuario_id, fecha_egreso,tipo_egreso_id FROM IngresoEgresos.egresos WHERE fecha_egreso BETWEEN DATE_FORMAT(fechafi,  '%Y-%m-%d' ) AND DATE_FORMAT(now(),  '%Y-%m-%d' ) GROUP BY usuario_id, fecha_egreso;
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
   OPEN c_egresos;

    REPEAT
        FETCH c_egresos INTO total,id,f,id_egreso;
    IF NOT done THEN
        SET fecha_id = (SELECT MAX(id_fecha) FROM DatamartEgresos.dim_tiempo WHERE `fecha` = f LIMIT 1);
        SET id_tp_egreso = (SELECT MAX(id_tipo_egreso) FROM DatamartEgresos.dim_tipo_egreso WHERE cod_tipo_egreso = id_egreso LIMIT 1);
        INSERT INTO DatamartEgresos.fac_egresos_diarios (id_persona,fecha_egreso,id_tipo_egreso,total_egreso_dia) VALUE(id,fecha_id,id_tp_egreso,total);
    END IF;    
    UNTIL done END REPEAT;   
    CLOSE c_egresos;
    SELECT  fechafi;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_fac_ingresos_diarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_fac_ingresos_diarios`()
BEGIN
    
    DECLARE fecha DATE;

    SELECT MAX( t.fecha ) FROM DatamartIngresos.fac_ingresos_diarios ingre JOIN  DatamartIngresos.dim_tiempo t ON (t.id_fecha = ingre.fecha_ingreso) INTO @fi;
    IF (@fi IS NULL) THEN
        SELECT MIN( fecha_ingreso ) FROM IngresoEgresos.ingresos INTO @fi;
    ELSE
        SET @fi = DATE_ADD(@fi, INTERVAL 1 DAY);
    END IF;
   CALL migracion_fac_ingresos_diarios_process(@fi);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `migracion_fac_ingresos_diarios_process` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `migracion_fac_ingresos_diarios_process`(IN fechafi DATE)
BEGIN
   DECLARE id INT;
   DECLARE fecha_id INT;
   DECLARE id_ingreso INT;
   DECLARE id_tp_ingreso INT;
   DECLARE total DOUBLE;
   DECLARE done INT DEFAULT 0;
   DECLARE f VARCHAR(20);
   DECLARE c_ingresos CURSOR FOR SELECT SUM( valor_ingreso ) total , usuario_id, fecha_ingreso,tipo_ingreso_id FROM IngresoEgresos.ingresos WHERE fecha_ingreso BETWEEN DATE_FORMAT(fechafi,  '%Y-%m-%d' ) AND DATE_FORMAT(now(),  '%Y-%m-%d' ) GROUP BY usuario_id, fecha_ingreso;
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
   OPEN c_ingresos;

    REPEAT
        FETCH c_ingresos INTO total,id,f,id_ingreso;
        IF NOT done THEN
        SET fecha_id = (SELECT MAX(id_fecha) FROM DatamartIngresos.dim_tiempo WHERE `fecha` = f LIMIT 1);
        SET id_tp_ingreso = (SELECT MAX(id_tipo_ingreso) FROM DatamartIngresos.dim_tipo_ingreso WHERE cod_tipo_ingreso = id_ingreso LIMIT 1);
        INSERT INTO DatamartIngresos.fac_ingresos_diarios (id_persona,fecha_ingreso,id_tipo_ingreso,total_ingreso_dia) VALUE(id,fecha_id,id_tp_ingreso,total);
        END IF;
UNTIL done END REPEAT;   
    CLOSE c_ingresos;
    SELECT  fechafi;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-18 21:10:18
