-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-05-2014 a las 00:09:53
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
-- Estructura de tabla para la tabla `dim_tipo_ingreso`
--

CREATE TABLE IF NOT EXISTS `dim_tipo_ingreso` (
  `id_tipo_ingreso` int(5) NOT NULL AUTO_INCREMENT,
  `cod_tipo_ingreso` int(5) NOT NULL,
  `tipo_ingreso` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_ingreso`,`cod_tipo_ingreso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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