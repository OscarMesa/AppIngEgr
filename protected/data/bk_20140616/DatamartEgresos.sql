-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-06-2014 a las 21:35:04
-- Versión del servidor: 5.6.19
-- Versión de PHP: 5.3.10-1ubuntu3.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `DatamartEgresos`
--

DELIMITER $$
--
-- Procedimientos
--
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
END$$

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
END$$

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

    END$$

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
END$$

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
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agr_egresos_mensuales`
--

CREATE TABLE IF NOT EXISTS `agr_egresos_mensuales` (
  `id_ing_mensuales` int(5) NOT NULL AUTO_INCREMENT,
  `id_persona` int(5) NOT NULL,
  `fecha_egreso` int(5) NOT NULL,
  `id_tipo_egreso` int(5) NOT NULL,
  `total_egreso_mensuale` double NOT NULL,
  PRIMARY KEY (`id_ing_mensuales`),
  KEY `id_persona` (`id_persona`),
  KEY `fecha_egreso` (`fecha_egreso`),
  KEY `id_tipo_egreso` (`id_tipo_egreso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `agr_egresos_mensuales`
--

INSERT INTO `agr_egresos_mensuales` (`id_ing_mensuales`, `id_persona`, `fecha_egreso`, `id_tipo_egreso`, `total_egreso_mensuale`) VALUES
(1, 1, 19, 2, 139500),
(2, 1, 27, 7, 32000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_persona`
--

CREATE TABLE IF NOT EXISTS `dim_persona` (
  `id_persona` int(5) NOT NULL,
  `tipo_identificacion` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_completo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `usuario_modificador` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `dim_persona`
--

INSERT INTO `dim_persona` (`id_persona`, `tipo_identificacion`, `nombre_completo`, `fecha_creacion`, `fecha_modificacion`, `usuario_modificador`) VALUES
(1, 'Cédula de Ciudadania', 'oscar  mesa 0', '2014-05-12', NULL, 'oscar mesa'),
(2, 'Cédula de Ciudadania', 'julian  david  giraldo 0', '2014-05-12', NULL, 'oscar mesa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_tiempo`
--

CREATE TABLE IF NOT EXISTS `dim_tiempo` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `dim_tiempo`
--

INSERT INTO `dim_tiempo` (`id_fecha`, `fecha`, `dia`, `dia_semana`, `nombre_dia_semana`, `nombre_dia`, `mes`, `mes3L`, `nombre_mes`, `year`) VALUES
(1, '2014-02-10', 10, 0, 'Monday', '10 February', 2, 'Feb', 'February', 2014),
(2, '2014-02-11', 11, 1, 'Tuesday', '11 February', 2, 'Feb', 'February', 2014),
(3, '2014-02-12', 12, 2, 'Wednesday', '12 February', 2, 'Feb', 'February', 2014),
(4, '2014-02-13', 13, 3, 'Thursday', '13 February', 2, 'Feb', 'February', 2014),
(5, '2014-02-14', 14, 4, 'Friday', '14 February', 2, 'Feb', 'February', 2014),
(6, '2014-02-15', 15, 5, 'Saturday', '15 February', 2, 'Feb', 'February', 2014),
(7, '2014-02-16', 16, 6, 'Sunday', '16 February', 2, 'Feb', 'February', 2014),
(8, '2014-02-17', 17, 0, 'Monday', '17 February', 2, 'Feb', 'February', 2014),
(9, '2014-02-18', 18, 1, 'Tuesday', '18 February', 2, 'Feb', 'February', 2014),
(10, '2014-02-19', 19, 2, 'Wednesday', '19 February', 2, 'Feb', 'February', 2014),
(11, '2014-02-20', 20, 3, 'Thursday', '20 February', 2, 'Feb', 'February', 2014),
(12, '2014-02-21', 21, 4, 'Friday', '21 February', 2, 'Feb', 'February', 2014),
(13, '2014-02-22', 22, 5, 'Saturday', '22 February', 2, 'Feb', 'February', 2014),
(14, '2014-02-23', 23, 6, 'Sunday', '23 February', 2, 'Feb', 'February', 2014),
(15, '2014-02-24', 24, 0, 'Monday', '24 February', 2, 'Feb', 'February', 2014),
(16, '2014-02-25', 25, 1, 'Tuesday', '25 February', 2, 'Feb', 'February', 2014),
(17, '2014-02-26', 26, 2, 'Wednesday', '26 February', 2, 'Feb', 'February', 2014),
(18, '2014-02-27', 27, 3, 'Thursday', '27 February', 2, 'Feb', 'February', 2014),
(19, '2014-02-28', 28, 4, 'Friday', '28 February', 2, 'Feb', 'February', 2014),
(20, '2014-03-01', 1, 5, 'Saturday', '01 March', 3, 'Mar', 'March', 2014),
(21, '2014-03-02', 2, 6, 'Sunday', '02 March', 3, 'Mar', 'March', 2014),
(22, '2014-03-03', 3, 0, 'Monday', '03 March', 3, 'Mar', 'March', 2014),
(23, '2014-03-04', 4, 1, 'Tuesday', '04 March', 3, 'Mar', 'March', 2014),
(24, '2014-03-05', 5, 2, 'Wednesday', '05 March', 3, 'Mar', 'March', 2014),
(25, '2014-03-06', 6, 3, 'Thursday', '06 March', 3, 'Mar', 'March', 2014),
(26, '2014-03-07', 7, 4, 'Friday', '07 March', 3, 'Mar', 'March', 2014),
(27, '2014-03-08', 8, 5, 'Saturday', '08 March', 3, 'Mar', 'March', 2014);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_tipo_egreso`
--

CREATE TABLE IF NOT EXISTS `dim_tipo_egreso` (
  `id_tipo_egreso` int(5) NOT NULL AUTO_INCREMENT,
  `cod_tipo_egreso` int(5) NOT NULL,
  `tipo_egreso` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_egreso`,`cod_tipo_egreso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `dim_tipo_egreso`
--

INSERT INTO `dim_tipo_egreso` (`id_tipo_egreso`, `cod_tipo_egreso`, `tipo_egreso`) VALUES
(1, 1, 'Alimentacion'),
(2, 2, 'Transporte'),
(3, 3, 'Arriendo'),
(4, 4, 'Servicios'),
(5, 5, 'Prestamos  a terceros'),
(6, 6, 'Pago de deudas'),
(7, 7, 'Diversión y entretenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fac_egresos_diarios`
--

CREATE TABLE IF NOT EXISTS `fac_egresos_diarios` (
  `id_ing_dirarios` int(5) NOT NULL AUTO_INCREMENT,
  `id_persona` int(5) NOT NULL,
  `fecha_egreso` int(5) NOT NULL,
  `id_tipo_egreso` int(5) NOT NULL,
  `total_egreso_dia` double NOT NULL,
  PRIMARY KEY (`id_ing_dirarios`),
  KEY `id_persona` (`id_persona`),
  KEY `fecha_egreso` (`fecha_egreso`),
  KEY `id_tipo_egreso` (`id_tipo_egreso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `fac_egresos_diarios`
--

INSERT INTO `fac_egresos_diarios` (`id_ing_dirarios`, `id_persona`, `fecha_egreso`, `id_tipo_egreso`, `total_egreso_dia`) VALUES
(1, 1, 1, 2, 136500),
(2, 1, 2, 7, 3000),
(3, 1, 27, 7, 32000),
(4, 1, 27, 7, 32000);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agr_egresos_mensuales`
--
ALTER TABLE `agr_egresos_mensuales`
  ADD CONSTRAINT `agr_egresos_mensuales_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`),
  ADD CONSTRAINT `agr_egresos_mensuales_ibfk_2` FOREIGN KEY (`fecha_egreso`) REFERENCES `dim_tiempo` (`id_fecha`),
  ADD CONSTRAINT `agr_egresos_mensuales_ibfk_3` FOREIGN KEY (`id_tipo_egreso`) REFERENCES `dim_tipo_egreso` (`id_tipo_egreso`);

--
-- Filtros para la tabla `fac_egresos_diarios`
--
ALTER TABLE `fac_egresos_diarios`
  ADD CONSTRAINT `fac_egresos_diarios_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`),
  ADD CONSTRAINT `fac_egresos_diarios_ibfk_2` FOREIGN KEY (`fecha_egreso`) REFERENCES `dim_tiempo` (`id_fecha`),
  ADD CONSTRAINT `fac_egresos_diarios_ibfk_3` FOREIGN KEY (`id_tipo_egreso`) REFERENCES `dim_tipo_egreso` (`id_tipo_egreso`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
