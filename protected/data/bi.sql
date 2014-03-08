-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 23, 2014 at 11:23 PM
-- Server version: 5.5.35
-- PHP Version: 5.3.10-1ubuntu3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bi`
--

-- --------------------------------------------------------

--
-- Table structure for table `egresos`
--
CREATE DATABASE IngresoEgresos;

USE IngresoEgresos;

DROP TABLE IF EXISTS `egresos`;
DROP TABLE IF EXISTS `ingresos`;
DROP TABLE IF EXISTS `tipo_egresos`;
DROP TABLE IF EXISTS `tipo_ingresos`;
DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE IF NOT EXISTS `tipo_egresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `tipo_ingresos`;
CREATE TABLE IF NOT EXISTS `tipo_ingresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `egresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci NULL,
  `fecha_egreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor_egresos` double NOT NULL,
  `usuario_id` int(5) NOT NULL,
  `tipo_egreso_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY(`usuario_id`),
  KEY(`tipo_egreso_id`)
  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE IF NOT EXISTS `ingresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor_ingreso` double NOT NULL,
  `usuario_id` int(5) NOT NULL,
  `tipo_ingreso_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY(`usuario_id`),
  KEY(`tipo_ingreso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE(`correo`),
  UNIQUE(`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

ALTER TABLE `egresos`
  ADD CONSTRAINT `egresos_ib_fk_2` FOREIGN KEY (`tipo_egreso_id`) REFERENCES `tipo_egresos` (`id`),
  ADD CONSTRAINT `egresos_ib_fk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `ingresos`
  ADD CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`tipo_ingreso_id`) REFERENCES `tipo_ingresos` (`id`),
  ADD CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Dumping data for table `egresos`
--

INSERT INTO `egresos` (`id`, `descr
INSERT INTO `tipo_ingresos` (`id`, `descripcion`) VALUES
(1, 'Salario'),
(2, 'Mesada'),
(3, 'Suerte'),
(4, 'Arriendo');ipcion`, `fecha_ingreso`, `valor_egresos`, `usuario_id`, `tipo_egreso_id`) VALUES
(1, 'prueba', '2014-02-22 05:00:00', 10000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ingresos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tipo_egresos`
--


--
-- Dumping data for table `tipo_egresos`
--

INSERT INTO `tipo_egresos` (`id`, `descripcion`) VALUES
(1, 'Alimentacion'),
(2, 'Transporte'),
(3, 'Arriendo'),
(4, 'Servicios');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_ingresos`
--


--
-- Dumping data for table `tipo_ingresos`
--

INSERT INTO `tipo_ingresos` (`id`, `descripcion`) VALUES
(1, 'Salario'),
(2, 'Mesada'),
(3, 'Suerte'),
(4, 'Arriendo');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--


--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `username`, `password`,correo) VALUES
(1, 'oscar', 'oskar', '40bd001563085fc35165329ea1ff5c5ecbdbbeef','oscarmesae.lpoli@gmail.com'),
(2, 'julian david giraldo', 'julian', '354106e416911844661e1603d99ecf7d1c318dda','julian.giraldo8@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `egresos`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
