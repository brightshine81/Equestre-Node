/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : equestre-db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-09-11 02:06:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_events`
-- ----------------------------
DROP TABLE IF EXISTS `tb_events`;
CREATE TABLE `tb_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key',
  `eventName` varchar(256) NOT NULL,
  `eventDate` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `title` varchar(256) DEFAULT NULL,
  `titleStart` datetime DEFAULT NULL,
  `titleEnd` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_events
-- ----------------------------
INSERT INTO `tb_events` VALUES ('1', 'Prüfung 1 - LONGINES GRAND PRIX of BASEL', '2019-03-21 00:00:00', 'CSI***** Mercedes-Benz Zürich', '2019-03-21 00:00:00', '2019-03-26 00:00:00');

-- ----------------------------
-- Table structure for `tb_horses`
-- ----------------------------
DROP TABLE IF EXISTS `tb_horses`;
CREATE TABLE `tb_horses` (
  `eventId` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `owner` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`eventId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_horses
-- ----------------------------
INSERT INTO `tb_horses` VALUES ('1', '1', 'Dm Jacqmotte', '0', '1900-01-01 00:00:00', 'Bongaerts');
INSERT INTO `tb_horses` VALUES ('1', '2', 'Dieudonne de Guldenboom', '0', '1900-01-01 00:00:00', 'IHP.L.P Edinburgh + All Star BVBA +');
INSERT INTO `tb_horses` VALUES ('1', '3', 'Zapria', '0', '1900-01-01 00:00:00', 'Sportstall Tina Pol');
INSERT INTO `tb_horses` VALUES ('1', '4', 'Navalo de Poheton', '0', '1900-01-01 00:00:00', 'Mko Equestrian Llc');
INSERT INTO `tb_horses` VALUES ('1', '5', 'Corbusier', '0', '1900-01-01 00:00:00', 'Lehner Carola');
INSERT INTO `tb_horses` VALUES ('1', '6', 'Cupido van de Hoefslag Z', '0', '1900-01-01 00:00:00', 'Cancelli Gianni + Optimumhorses');
INSERT INTO `tb_horses` VALUES ('1', '7', 'Curtis Sitte', '0', '1900-01-01 00:00:00', 'Fasana Arturo');
INSERT INTO `tb_horses` VALUES ('1', '8', 'Cornet Kalua', '0', '1900-01-01 00:00:00', 'Max KÜHNER');
INSERT INTO `tb_horses` VALUES ('1', '9', 'Cardano CH', '0', '1900-01-01 00:00:00', 'Graf Trudy');
INSERT INTO `tb_horses` VALUES ('1', '10', 'Grand Cru van de Rozenberg', '0', '1900-01-01 00:00:00', 'Alexander OANCEA, Jérôme GUERY');
INSERT INTO `tb_horses` VALUES ('1', '11', 'Twentytwo des Biches', '0', '1900-01-01 00:00:00', 'Christiana DUGUET');
INSERT INTO `tb_horses` VALUES ('1', '12', 'Cannavaro', '0', '1900-01-01 00:00:00', 'Larocca, Jose Maria');
INSERT INTO `tb_horses` VALUES ('1', '13', 'Cordess', '0', '1900-01-01 00:00:00', 'Gestüt Gut Neuenhof');
INSERT INTO `tb_horses` VALUES ('1', '14', 'Delacroix AS', '0', '1900-01-01 00:00:00', 'Resicommerce SAGL');
INSERT INTO `tb_horses` VALUES ('1', '15', 'Clooney', '0', '1900-01-01 00:00:00', 'Luigi BALERI');
INSERT INTO `tb_horses` VALUES ('1', '16', 'Quasimodo VII', '0', '1900-01-01 00:00:00', 'Melliger Willi');
INSERT INTO `tb_horses` VALUES ('1', '17', 'Epleaser van T Heike', '0', '1900-01-01 00:00:00', 'Jauß, Marion & Isabell');
INSERT INTO `tb_horses` VALUES ('1', '18', 'Berlinda', '0', '1900-01-01 00:00:00', 'Zanotelli, Roland');
INSERT INTO `tb_horses` VALUES ('1', '19', 'Casall', '0', '1900-01-01 00:00:00', 'Schraner Emil');
INSERT INTO `tb_horses` VALUES ('1', '20', 'Spring Dark', '0', '1900-01-01 00:00:00', 'Sigrist Murphy Andrea + Murphy Kevi');
INSERT INTO `tb_horses` VALUES ('1', '21', 'All Star', '0', '1900-01-01 00:00:00', 'Thomas STRAUMANN');
INSERT INTO `tb_horses` VALUES ('1', '22', 'Salomon', '0', '1900-01-01 00:00:00', 'Marta Ortega');
INSERT INTO `tb_horses` VALUES ('1', '23', 'Silver Deux de Virton H D C', '0', '1900-01-01 00:00:00', 'Haras des Coudrettes');
INSERT INTO `tb_horses` VALUES ('1', '24', 'Balance', '0', '1900-01-01 00:00:00', 'Cindy Van der Straten - Marie');
INSERT INTO `tb_horses` VALUES ('1', '25', 'Clouzot de Lassus', '0', '1900-01-01 00:00:00', 'de Coulon Sarah');
INSERT INTO `tb_horses` VALUES ('1', '26', 'Caracas', '0', '1900-01-01 00:00:00', 'Axel VERLOOY, Copernicus Stables LL');
INSERT INTO `tb_horses` VALUES ('1', '27', 'Toupie de la Roque', '0', '1900-01-01 00:00:00', 'Sarl Top Stallions Company');
INSERT INTO `tb_horses` VALUES ('1', '28', 'JB\'s Hot Stuff', '0', '1900-01-01 00:00:00', 'Jayne Bean');
INSERT INTO `tb_horses` VALUES ('1', '29', 'Sunshine du Phare', '0', '1900-01-01 00:00:00', 'Monsieur OLIVIER BROHIER');
INSERT INTO `tb_horses` VALUES ('1', '30', 'Contanga', '0', '1900-01-01 00:00:00', 'A.Onassis de Miranda & Victory Eque');
INSERT INTO `tb_horses` VALUES ('1', '31', 'Gancia de Muze', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '32', 'About A Dream', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '33', 'Cas', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '34', 'Silver Shine', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '35', 'Louis', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '36', 'Fit for Fun', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '37', 'H&M Legend of Love', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '38', 'Dandiego B Z', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '39', 'Chesall Zimequest', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '40', 'California', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '41', 'Bacardi VDL', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '42', 'Balzaci', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '43', 'Daimler', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '44', 'Cornado NRW', '0', '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES ('1', '45', 'Tempo de Paban', '0', '1900-01-01 00:00:00', '');

-- ----------------------------
-- Table structure for `tb_ranks`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ranks`;
CREATE TABLE `tb_ranks` (
  `eventId` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `point1` int(11) DEFAULT NULL,
  `pointPlus1` int(11) DEFAULT NULL,
  `time1` int(11) DEFAULT NULL,
  `point2` int(11) DEFAULT NULL,
  `pointPlus2` int(11) DEFAULT NULL,
  `time2` int(11) DEFAULT NULL,
  `jumpOff` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`eventId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ranks
-- ----------------------------
INSERT INTO `tb_ranks` VALUES ('1', '1', '5', '0', '0', '19421', '0', '0', '16696', '1');
INSERT INTO `tb_ranks` VALUES ('1', '2', '8', '0', '0', '26139', '0', '0', '28134', '1');
INSERT INTO `tb_ranks` VALUES ('1', '3', '11', '250', '250', '68168', '0', '0', '0', '0');
INSERT INTO `tb_ranks` VALUES ('1', '4', '9', '0', '0', '10209', '0', '0', '30847', '1');
INSERT INTO `tb_ranks` VALUES ('1', '5', '10', '0', '0', '33359', '14000', '14000', '55249', '1');
INSERT INTO `tb_ranks` VALUES ('1', '6', '12', '3250', '3250', '80912', '0', '0', '0', '0');
INSERT INTO `tb_ranks` VALUES ('1', '7', '7', '0', '0', '14240', '0', '0', '18657', '1');
INSERT INTO `tb_ranks` VALUES ('1', '8', '4', '0', '0', '65344', '0', '0', '5953', '1');
INSERT INTO `tb_ranks` VALUES ('1', '9', '6', '0', '0', '11504', '0', '0', '18450', '1');
INSERT INTO `tb_ranks` VALUES ('1', '10', '2', '0', '0', '13058', '0', '0', '5749', '1');
INSERT INTO `tb_ranks` VALUES ('1', '11', '1', '0', '0', '11111', '0', '0', '5740', '1');
INSERT INTO `tb_ranks` VALUES ('1', '12', '3', '0', '0', '0', '0', '0', '5923', '1');

-- ----------------------------
-- Table structure for `tb_riders`
-- ----------------------------
DROP TABLE IF EXISTS `tb_riders`;
CREATE TABLE `tb_riders` (
  `eventId` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `firstName` varchar(256) NOT NULL,
  `lastName` varchar(256) NOT NULL,
  `nation` varchar(32) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  PRIMARY KEY (`eventId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_riders
-- ----------------------------
INSERT INTO `tb_riders` VALUES ('1', '1', 'Vermeir', 'Wilm', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '2', 'Philips', 'Jane Richard', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '3', 'Chudyba', 'Bronislav', 'svk', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '4', 'Kocher', 'Andrew', 'usa', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '5', 'Rhomberg', 'Christian', 'aut', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '6', 'Romp', 'Ruben', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '7', 'Estermann', 'Paul', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '8', 'Kühner', 'Max', 'aut', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '9', 'Rutschi', 'Niklaus', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '10', 'Guery', 'Jerome', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '11', 'Duguet', 'Romain', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '12', 'Saro', 'Manuel Fernandez', 'esp', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '13', 'Kukuk', 'Christian', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '14', 'Crotta', 'Fabio', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '15', 'Fuchs', 'Martin', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '16', 'Schurtenberger', 'Niklaus', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '17', 'Ahlmann', 'Christian', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '18', 'Dreher', 'Hans-Dieter', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '19', 'Jufer', 'Alain', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '20', 'Bengtsson', 'Rolf-Göran', 'swe', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '21', 'Lynch', 'Denis', 'irl', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '22', 'Vleuten', 'Maikel Van der', 'ned', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '23', 'Staut', 'Kevin', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '24', 'Straten', 'Cindy van der', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '25', 'Balsiger', 'Bryan', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '26', 'Verlooy', 'Jos', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '27', 'Epaillard', 'Julien', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '28', 'Whitaker', 'Michael', 'gbr', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '29', 'Bost', 'Roger Yves', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '30', 'Zorzi', 'Alberto', 'ita', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '31', 'Bruynseels', 'Niels', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '32', 'Schwizer', 'Pius', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '33', 'Smolders', 'Harrie', 'ned', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '34', 'Skrzyczynski', 'Jaroslaw', 'pol', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '35', 'Züger', 'Annina', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '36', 'Diniz', 'Luciana', 'por', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '37', 'Philippaerts', 'Olivier', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '38', 'Smits', 'Edwin', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '39', 'Delestre', 'Simon', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '40', 'Tops-Alexander', 'Edwina', 'aus', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '41', 'Sprunger', 'Janika', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '42', 'Haßmann', 'Felix', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '43', 'Muff', 'Werner', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '44', 'Ehning', 'Marcus', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES ('1', '45', 'Robert', 'Olivier', 'fra', '1900-01-01 00:00:00');
