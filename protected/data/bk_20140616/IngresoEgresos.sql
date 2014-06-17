-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-06-2014 a las 21:34:14
-- Versión del servidor: 5.6.19
-- Versión de PHP: 5.3.10-1ubuntu3.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `IngresoEgresos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `gastoXMes`(IN fecha DATE)
BEGIN
SELECT (SELECT aem.total_egreso_mensuale FROM DatamartEgresos.agr_egresos_mensuales aem 
        INNER JOIN DatamartEgresos.dim_tiempo t ON (t.id_fecha=aem.fecha_egreso) 
        WHERE EXTRACT(YEAR_MONTH FROM t.fecha) = EXTRACT(YEAR_MONTH FROM fecha) LIMIT 1)/COUNT(fac.total_egreso_dia) total
        FROM DatamartEgresos.fac_egresos_diarios fac 
                INNER JOIN DatamartEgresos.dim_tiempo t ON (fac.fecha_egreso = t.id_fecha)
                WHERE EXTRACT(YEAR_MONTH FROM t.fecha) = EXTRACT(YEAR_MONTH FROM fecha);
END$$

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
END$$

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
    END$$

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
END$$

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
    END$$

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
END$$

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
END$$

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
  -- CALL migracion_fac_egresos_diarios_process(@fi);
    SELECT @fi;
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
    END$$

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
END$$

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
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `saldoDiasHabiles`()
BEGIN
DECLARE done INT DEFAULT 0;
DECLARE dia INT;
DECLARE c_dias_habiles INT DEFAULT 0;
DECLARE total_dia DOUBLE;
DECLARE total DOUBLE DEFAULT 0;
DECLARE c_ingresos CURSOR FOR SELECT fac.total_egreso_dia,t.dia_semana FROM DatamartEgresos.fac_egresos_diarios fac 
                INNER JOIN DatamartEgresos.dim_tiempo t ON (fac.fecha_egreso = t.id_fecha);
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

OPEN c_ingresos;

REPEAT
        FETCH c_ingresos INTO total_dia,dia;
            IF dia <> 5 AND dia <> 6 THEN
                SET total = total + total_dia;
                SET c_dias_habiles = c_dias_habiles + 1;
            END IF;
    UNTIL done END REPEAT;

CLOSE c_ingresos;

SELECT c_dias_habiles;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE IF NOT EXISTS `egresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_egreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor_egresos` double NOT NULL,
  `usuario_id` int(5) NOT NULL,
  `tipo_egreso_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tipo_egreso_id` (`tipo_egreso_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`id`, `descripcion`, `fecha_egreso`, `valor_egresos`, `usuario_id`, `tipo_egreso_id`) VALUES
(1, 'Pago de reparacion de la moton', '2014-02-10 05:00:00', 120000, 1, 2),
(2, 'Comer por fuera', '2014-02-10 05:00:00', 4500, 1, 1),
(3, 'Prestar dinero a camilo.', '2014-02-10 05:00:00', 12000, 1, 5),
(4, 'Compra de mecato', '2014-02-11 05:00:00', 3000, 1, 7),
(5, 'pago de cervezas.', '2014-03-08 05:00:00', 20000, 1, 7),
(6, 'gasolina', '2014-03-08 05:00:00', 12000, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

CREATE TABLE IF NOT EXISTS `ingresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `valor_ingreso` double NOT NULL,
  `usuario_id` int(5) NOT NULL,
  `tipo_ingreso_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tipo_ingreso_id` (`tipo_ingreso_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `descripcion`, `fecha_ingreso`, `valor_ingreso`, `usuario_id`, `tipo_ingreso_id`) VALUES
(1, 'Nuevo pago de la nomina en la empresa.', '2014-02-10', 400000, 1, 1),
(2, 'pago por prestacion de servicios en gamma.', '2014-02-18', 200000, 1, 1),
(3, 'Pago de deuda por parte de una migo, que me estaba adeudando un dinero.', '2014-02-25', 20000, 1, 5),
(4, 'Prestamo que le hice a mi hermana', '2014-02-25', 40000, 1, 5),
(5, 'pago por prestacion de servicios en nettic', '2014-03-08', 80000, 1, 1),
(6, 'Pago nomina', '2014-02-10', 1200000, 2, 1),
(7, 'Mi padre pago una deuda de hace 4 semenas.', '2014-03-19', 300000, 2, 5),
(8, 'Me encontre en santa fe un dinero poor suerte.', '2014-02-28', 100000, 2, 3),
(9, 'Pago de horas extras.', '2014-03-06', 200000, 2, 1),
(10, 'Continua mi suerte, a la salida de mi casa encotre 20000', '2014-03-08', 20000, 2, 3),
(11, 'sueldo del mes', '2014-05-15', 490000, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_egresos`
--

CREATE TABLE IF NOT EXISTS `tipo_egresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `tipo_egresos`
--

INSERT INTO `tipo_egresos` (`id`, `descripcion`) VALUES
(1, 'Alimentacion'),
(2, 'Transporte'),
(3, 'Arriendo'),
(4, 'Servicios'),
(5, 'Prestamos  a terceros'),
(6, 'Pago de deudas'),
(7, 'Diversión y entretenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_identificacion`
--

CREATE TABLE IF NOT EXISTS `tipo_identificacion` (
  `id_identificacion` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`id_identificacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipo_identificacion`
--

INSERT INTO `tipo_identificacion` (`id_identificacion`, `descripcion`) VALUES
(1, 'Cédula de Ciudadania'),
(2, 'Tarjeta '),
(3, 'Pasapoorte'),
(4, 'Registro Civil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ingresos`
--

CREATE TABLE IF NOT EXISTS `tipo_ingresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tipo_ingresos`
--

INSERT INTO `tipo_ingresos` (`id`, `descripcion`) VALUES
(1, 'Salario'),
(2, 'Mesada'),
(3, 'Suerte'),
(4, 'Arriendo'),
(5, 'Pago deudas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombre2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido1` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_usuario` enum('activo','inactivo') COLLATE utf8_unicode_ci NOT NULL,
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
  KEY `id_usuario_modificador` (`id_usuario_modificador`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `estado_usuario`, `identificacion`, `id_tipo_identidad`, `username`, `password`, `email`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_modificador`) VALUES
(1, 'oscar', '', 'mesa', '0', 'activo', 1152188863, 1, 'oskar', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'oscarmesae.lpoli@gmail.com', '2014-05-12 07:02:49', NULL, 1),
(2, 'julian ', 'david ', 'giraldo', '0', 'inactivo', 2132134, 1, 'julian', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'julian.giraldo8@gmail.com', '2014-05-12 07:02:49', NULL, 1),
(3, 'usuario 1', '', 'prueba', '', 'activo', NULL, NULL, 'un_user', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'usuario_1@gmail.com', '2014-05-27 05:00:00', '2014-05-27 07:05:22', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD CONSTRAINT `egresos_ib_fk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `egresos_ib_fk_2` FOREIGN KEY (`tipo_egreso_id`) REFERENCES `tipo_egresos` (`id`);

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`tipo_ingreso_id`) REFERENCES `tipo_ingresos` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_identidad`) REFERENCES `tipo_identificacion` (`id_identificacion`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_usuario_modificador`) REFERENCES `usuarios` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
