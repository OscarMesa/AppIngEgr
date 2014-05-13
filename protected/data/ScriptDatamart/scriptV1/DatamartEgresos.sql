-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-05-2014 a las 22:27:44
-- Versión del servidor: 5.6.17
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
  `fecha_modificacion` date NOT NULL,
  `usuario_modificador` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_tiempo`
--

CREATE TABLE IF NOT EXISTS `dim_tiempo` (
  `id_fecha` int(5) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `dia` int(4) NOT NULL,
  `nombre_dia` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mes` int(5) NOT NULL,
  `nombre_mes` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(5) NOT NULL,
  PRIMARY KEY (`id_fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_tipo_egreso`
--

CREATE TABLE IF NOT EXISTS `dim_tipo_egreso` (
  `id_tipo_egreso` int(5) NOT NULL AUTO_INCREMENT,
  `cod_tipo_egreso` int(5) NOT NULL,
  `tipo_egreso` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_egreso`,`cod_tipo_egreso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agr_egresos_mensuales`
--
ALTER TABLE `agr_egresos_mensuales`
  ADD CONSTRAINT `agr_egresos_mensuales_ibfk_3` FOREIGN KEY (`id_tipo_egreso`) REFERENCES `dim_tipo_egreso` (`id_tipo_egreso`),
  ADD CONSTRAINT `agr_egresos_mensuales_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`),
  ADD CONSTRAINT `agr_egresos_mensuales_ibfk_2` FOREIGN KEY (`fecha_egreso`) REFERENCES `dim_tiempo` (`id_fecha`);

--
-- Filtros para la tabla `fac_egresos_diarios`
--
ALTER TABLE `fac_egresos_diarios`
  ADD CONSTRAINT `fac_egresos_diarios_ibfk_3` FOREIGN KEY (`id_tipo_egreso`) REFERENCES `dim_tipo_egreso` (`id_tipo_egreso`),
  ADD CONSTRAINT `fac_egresos_diarios_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `dim_persona` (`id_persona`),
  ADD CONSTRAINT `fac_egresos_diarios_ibfk_2` FOREIGN KEY (`fecha_egreso`) REFERENCES `dim_tiempo` (`id_fecha`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
