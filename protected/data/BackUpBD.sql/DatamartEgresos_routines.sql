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

-- Dump completed on 2014-05-18 21:04:11
