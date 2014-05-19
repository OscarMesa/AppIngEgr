-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-05-2014 a las 22:27:52
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.3.10-1ubuntu3.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `DatamartIngresos`
--

DELIMITER $$
--
-- Procedimientos
--
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
END$$

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

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agr_ingresos_mensuales`
--

CREATE TABLE IF NOT EXISTS `agr_ingresos_mensuales` (
  `id_ing_mensuales` int(5) NOT NULL AUTO_INCREMENT,
  `id_persona` int(5) NOT NULL,
  `fecha_ingreso` int(5) NOT NULL,
  `id_tipo_ingreso` int(5) NOT NULL,
  `total_ingreso_mensuale` double NOT NULL,
  PRIMARY KEY (`id_ing_mensuales`),
  KEY `id_tipo_ingreso` (`id_tipo_ingreso`),
  KEY `fecha_ingreso` (`fecha_ingreso`),
  KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
  `nombre_mes` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(5) NOT NULL,
  PRIMARY KEY (`id_fecha`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

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
(27, '2014-03-08', 8, 5, 'Saturday', '08 March', 3, 'Mar', 'March', 2014),
(28, '2014-03-09', 9, 6, 'Sunday', '09 March', 3, 'Mar', 'March', 2014),
(29, '2014-03-10', 10, 0, 'Monday', '10 March', 3, 'Mar', 'March', 2014),
(30, '2014-03-11', 11, 1, 'Tuesday', '11 March', 3, 'Mar', 'March', 2014),
(31, '2014-03-12', 12, 2, 'Wednesday', '12 March', 3, 'Mar', 'March', 2014),
(32, '2014-03-13', 13, 3, 'Thursday', '13 March', 3, 'Mar', 'March', 2014),
(33, '2014-03-14', 14, 4, 'Friday', '14 March', 3, 'Mar', 'March', 2014),
(34, '2014-03-15', 15, 5, 'Saturday', '15 March', 3, 'Mar', 'March', 2014),
(35, '2014-03-16', 16, 6, 'Sunday', '16 March', 3, 'Mar', 'March', 2014),
(36, '2014-03-17', 17, 0, 'Monday', '17 March', 3, 'Mar', 'March', 2014),
(37, '2014-03-18', 18, 1, 'Tuesday', '18 March', 3, 'Mar', 'March', 2014),
(38, '2014-03-19', 19, 2, 'Wednesday', '19 March', 3, 'Mar', 'March', 2014);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_tipo_ingreso`
--

CREATE TABLE IF NOT EXISTS `dim_tipo_ingreso` (
  `id_tipo_ingreso` int(5) NOT NULL AUTO_INCREMENT,
  `cod_tipo_ingreso` int(5) NOT NULL,
  `tipo_ingreso` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_ingreso`,`cod_tipo_ingreso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `dim_tipo_ingreso`
--

INSERT INTO `dim_tipo_ingreso` (`id_tipo_ingreso`, `cod_tipo_ingreso`, `tipo_ingreso`) VALUES
(1, 1, 'Salario'),
(2, 2, 'Mesada'),
(3, 3, 'Suerte'),
(4, 4, 'Arriendo'),
(5, 5, 'Pago deudas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fac_ingresos_diarios`
--

CREATE TABLE IF NOT EXISTS `fac_ingresos_diarios` (
  `id_ing_dirarios` int(5) NOT NULL AUTO_INCREMENT,
  `id_persona` int(5) NOT NULL,
  `fecha_ingreso` int(5) NOT NULL,
  `id_tipo_ingreso` int(5) NOT NULL,
  `total_ingreso_dia` double NOT NULL,
  PRIMARY KEY (`id_ing_dirarios`),
  KEY `id_tipo_ingreso` (`id_tipo_ingreso`),
  KEY `fecha_ingreso` (`fecha_ingreso`),
  KEY `id_persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agr_ingresos_mensuales`
--
ALTER TABLE `agr_ingresos_mensuales`
  ADD CONSTRAINT `agr_ingresos_mensuales_ibfk_6` FOREIGN KEY (`fecha_ingreso`) REFERENCES `dim_tiempo` (`id_fecha`),
  ADD CONSTRAINT `agr_ingresos_mensuales_ibfk_3` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`),
  ADD CONSTRAINT `agr_ingresos_mensuales_ibfk_5` FOREIGN KEY (`id_tipo_ingreso`) REFERENCES `dim_tipo_ingreso` (`id_tipo_ingreso`);

--
-- Filtros para la tabla `fac_ingresos_diarios`
--
ALTER TABLE `fac_ingresos_diarios`
  ADD CONSTRAINT `fac_ingresos_diarios_ibfk_3` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`),
  ADD CONSTRAINT `fac_ingresos_diarios_ibfk_1` FOREIGN KEY (`id_tipo_ingreso`) REFERENCES `dim_tipo_ingreso` (`id_tipo_ingreso`),
  ADD CONSTRAINT `fac_ingresos_diarios_ibfk_2` FOREIGN KEY (`fecha_ingreso`) REFERENCES `dim_tiempo` (`id_fecha`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
