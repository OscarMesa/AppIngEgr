/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : bi

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2014-03-03 21:53:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `egresos`
-- ----------------------------
DROP TABLE IF EXISTS `egresos`;
CREATE TABLE `egresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `deescripcion` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor_egresos` double NOT NULL,
  `usuario_id` int(5) NOT NULL,
  `tipo_egreso_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`,`tipo_egreso_id`),
  KEY `usuario_id_2` (`usuario_id`),
  KEY `tipo_egreso_id` (`tipo_egreso_id`),
  CONSTRAINT `egresos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `egresos_ibfk_2` FOREIGN KEY (`tipo_egreso_id`) REFERENCES `tipo_egresos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of egresos
-- ----------------------------
INSERT INTO `egresos` VALUES ('1', 'prueba', '2014-02-22 00:00:00', '10000', '1', '1');

-- ----------------------------
-- Table structure for `ingresos`
-- ----------------------------
DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE `ingresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor_ingreso` double NOT NULL,
  `usuario_id` int(5) NOT NULL,
  `tipo_ingreso_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `ingresos_ibfk_2` (`tipo_ingreso_id`),
  CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`tipo_ingreso_id`) REFERENCES `tipo_ingresos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ingresos
-- ----------------------------
INSERT INTO `ingresos` VALUES ('1', 'hola', '2014-02-28 04:57:30', '100000', '1', '1');
INSERT INTO `ingresos` VALUES ('2', 'otro 2', '2014-02-28 05:08:57', '20000', '2', '2');
INSERT INTO `ingresos` VALUES ('3', 'cara de la simba', '2014-02-28 05:17:20', '60000', '2', '3');

-- ----------------------------
-- Table structure for `tipo_egresos`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_egresos`;
CREATE TABLE `tipo_egresos` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tipo_egresos
-- ----------------------------
INSERT INTO `tipo_egresos` VALUES ('1', 'Alimentacion');
INSERT INTO `tipo_egresos` VALUES ('2', 'Transporte');
INSERT INTO `tipo_egresos` VALUES ('3', 'Arriendo');
INSERT INTO `tipo_egresos` VALUES ('4', 'Servicios');

-- ----------------------------
-- Table structure for `tipo_ingresos`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_ingresos`;
CREATE TABLE `tipo_ingresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tipo_ingresos
-- ----------------------------
INSERT INTO `tipo_ingresos` VALUES ('1', 'Salario');
INSERT INTO `tipo_ingresos` VALUES ('2', 'Mesada');
INSERT INTO `tipo_ingresos` VALUES ('3', 'Suerte');
INSERT INTO `tipo_ingresos` VALUES ('4', 'Arriendo');

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'oscar', 'oskar', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', null);
INSERT INTO `usuarios` VALUES ('2', 'julian david giraldo', 'julian', '354106e416911844661e1603d99ecf7d1c318dda', null);
INSERT INTO `usuarios` VALUES ('3', 'Michin', 'Botero', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'oscarmensagaravito@pornogay.like');
INSERT INTO `usuarios` VALUES ('4', 'perro', 'guachin', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'hernando.oscar@pornogay.like');
INSERT INTO `usuarios` VALUES ('5', 'Oscar Hernando Mensa Garavito', 'Gaykar', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'hernando.Oscar@megustaelporno.gay');
