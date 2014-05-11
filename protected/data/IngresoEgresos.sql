-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-05-2014 a las 16:12:03
-- Versión del servidor: 5.6.17
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
  `fecha_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor_ingreso` double NOT NULL,
  `usuario_id` int(5) NOT NULL,
  `tipo_ingreso_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `tipo_ingreso_id` (`tipo_ingreso_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id`, `descripcion`, `fecha_ingreso`, `valor_ingreso`, `usuario_id`, `tipo_ingreso_id`) VALUES
(1, 'Nuevo pago de la nomina en la empresa.', '2014-02-10 05:00:00', 400000, 1, 1),
(2, 'pago por prestacion de servicios en gamma.', '2014-02-18 05:00:00', 200000, 1, 1),
(3, 'Pago de deuda por parte de una migo, que me estaba adeudando un dinero.', '2014-02-25 05:00:00', 20000, 1, 5),
(4, 'Prestamo que le hice a mi hermana', '2014-02-25 05:00:00', 40000, 1, 5),
(5, 'pago por prestacion de servicios en nettic', '2014-03-08 05:00:00', 80000, 1, 1),
(6, 'Pago nomina', '2014-02-10 05:00:00', 1200000, 2, 1),
(7, 'Mi padre pago una deuda de hace 4 semenas.', '2014-03-19 05:00:00', 300000, 2, 5),
(8, 'Me encontre en santa fe un dinero poor suerte.', '2014-02-28 05:00:00', 100000, 2, 3),
(9, 'Pago de horas extras.', '2014-03-06 05:00:00', 200000, 2, 1),
(10, 'Continua mi suerte, a la salida de mi casa encotre 20000', '2014-03-08 05:00:00', 20000, 2, 3);

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
  `identificacion` int(12) DEFAULT NULL,
  `id_tipo_identidad` int(5) DEFAULT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `identificacion`, `id_tipo_identidad`, `username`, `password`, `email`) VALUES
(1, 'oscar', '', 'mesa', '0', 1152188863, 1, 'oskar', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'oscarmesae.lpoli@gmail.com'),
(2, 'julian ', 'david ', 'giraldo', '0', 2132134, 1, 'julian', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'julian.giraldo8@gmail.com');

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
