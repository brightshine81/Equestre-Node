/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100135
 Source Host           : localhost:3306
 Source Schema         : equestre-db

 Target Server Type    : MySQL
 Target Server Version : 100135
 File Encoding         : 65001

 Date: 23/09/2019 22:42:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_events
-- ----------------------------
DROP TABLE IF EXISTS `tb_events`;
CREATE TABLE `tb_events`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key',
  `eventName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eventDate` datetime(0) NOT NULL DEFAULT '2000-01-01 00:00:00',
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `titleStart` datetime(0) NULL DEFAULT NULL,
  `titleEnd` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_events
-- ----------------------------
INSERT INTO `tb_events` VALUES (1, 'Prüfung 1 - LONGINES GRAND PRIX of BASEL', '2019-03-21 00:00:00', 'CSI***** Mercedes-Benz Zürich', '2019-03-21 00:00:00', '2019-03-26 00:00:00');
INSERT INTO `tb_events` VALUES (2, 'Competition Nr 5 - Grand Price from Dolce & Gabanna', '2019-04-13 00:00:00', 'CSI***** Genéve 2019', '2019-04-05 00:00:00', '2019-04-05 00:00:00');
INSERT INTO `tb_events` VALUES (3, 'Competition Nr. 1 - Preis der Firma HP Computer Solutions', '2019-04-05 00:00:00', 'Horse Jumping Event Bern, Switzerland', '2019-04-05 00:00:00', '2019-04-05 00:00:00');
INSERT INTO `tb_events` VALUES (4, 'Competition Nr. 4 - Grand Prix de Rolex SA, Bienne', '2019-04-05 00:00:00', 'CSI***** Genéve 2019', '2019-04-05 00:00:00', '2019-04-05 00:00:00');
INSERT INTO `tb_events` VALUES (5, 'Competition N°1', '2019-04-06 00:00:00', 'Days of Horses Den Haag 2019', '2019-04-06 00:00:00', '2019-04-06 00:00:00');

-- ----------------------------
-- Table structure for tb_horses
-- ----------------------------
DROP TABLE IF EXISTS `tb_horses`;
CREATE TABLE `tb_horses`  (
  `eventId` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `owner` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eventId`, `number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_horses
-- ----------------------------
INSERT INTO `tb_horses` VALUES (1, 1, 'Dm Jacqmotte', 0, '1900-01-01 00:00:00', 'Bongaerts');
INSERT INTO `tb_horses` VALUES (1, 2, 'Dieudonne de Guldenboom', 0, '1900-01-01 00:00:00', 'IHP.L.P Edinburgh + All Star BVBA +');
INSERT INTO `tb_horses` VALUES (1, 3, 'Zapria', 0, '1900-01-01 00:00:00', 'Sportstall Tina Pol');
INSERT INTO `tb_horses` VALUES (1, 4, 'Navalo de Poheton', 0, '1900-01-01 00:00:00', 'Mko Equestrian Llc');
INSERT INTO `tb_horses` VALUES (1, 5, 'Corbusier', 0, '1900-01-01 00:00:00', 'Lehner Carola');
INSERT INTO `tb_horses` VALUES (1, 6, 'Cupido van de Hoefslag Z', 0, '1900-01-01 00:00:00', 'Cancelli Gianni + Optimumhorses');
INSERT INTO `tb_horses` VALUES (1, 7, 'Curtis Sitte', 0, '1900-01-01 00:00:00', 'Fasana Arturo');
INSERT INTO `tb_horses` VALUES (1, 8, 'Cornet Kalua', 0, '1900-01-01 00:00:00', 'Max KÜHNER');
INSERT INTO `tb_horses` VALUES (1, 9, 'Cardano CH', 0, '1900-01-01 00:00:00', 'Graf Trudy');
INSERT INTO `tb_horses` VALUES (1, 10, 'Grand Cru van de Rozenberg', 0, '1900-01-01 00:00:00', 'Alexander OANCEA, Jérôme GUERY');
INSERT INTO `tb_horses` VALUES (1, 11, 'Twentytwo des Biches', 0, '1900-01-01 00:00:00', 'Christiana DUGUET');
INSERT INTO `tb_horses` VALUES (1, 12, 'Cannavaro', 0, '1900-01-01 00:00:00', 'Larocca, Jose Maria');
INSERT INTO `tb_horses` VALUES (1, 13, 'Cordess', 0, '1900-01-01 00:00:00', 'Gestüt Gut Neuenhof');
INSERT INTO `tb_horses` VALUES (1, 14, 'Delacroix AS', 0, '1900-01-01 00:00:00', 'Resicommerce SAGL');
INSERT INTO `tb_horses` VALUES (1, 15, 'Clooney', 0, '1900-01-01 00:00:00', 'Luigi BALERI');
INSERT INTO `tb_horses` VALUES (1, 16, 'Quasimodo VII', 0, '1900-01-01 00:00:00', 'Melliger Willi');
INSERT INTO `tb_horses` VALUES (1, 17, 'Epleaser van T Heike', 0, '1900-01-01 00:00:00', 'Jauß, Marion & Isabell');
INSERT INTO `tb_horses` VALUES (1, 18, 'Berlinda', 0, '1900-01-01 00:00:00', 'Zanotelli, Roland');
INSERT INTO `tb_horses` VALUES (1, 19, 'Casall', 0, '1900-01-01 00:00:00', 'Schraner Emil');
INSERT INTO `tb_horses` VALUES (1, 20, 'Spring Dark', 0, '1900-01-01 00:00:00', 'Sigrist Murphy Andrea + Murphy Kevi');
INSERT INTO `tb_horses` VALUES (1, 21, 'All Star', 0, '1900-01-01 00:00:00', 'Thomas STRAUMANN');
INSERT INTO `tb_horses` VALUES (1, 22, 'Salomon', 0, '1900-01-01 00:00:00', 'Marta Ortega');
INSERT INTO `tb_horses` VALUES (1, 23, 'Silver Deux de Virton H D C', 0, '1900-01-01 00:00:00', 'Haras des Coudrettes');
INSERT INTO `tb_horses` VALUES (1, 24, 'Balance', 0, '1900-01-01 00:00:00', 'Cindy Van der Straten - Marie');
INSERT INTO `tb_horses` VALUES (1, 25, 'Clouzot de Lassus', 0, '1900-01-01 00:00:00', 'de Coulon Sarah');
INSERT INTO `tb_horses` VALUES (1, 26, 'Caracas', 0, '1900-01-01 00:00:00', 'Axel VERLOOY, Copernicus Stables LL');
INSERT INTO `tb_horses` VALUES (1, 27, 'Toupie de la Roque', 0, '1900-01-01 00:00:00', 'Sarl Top Stallions Company');
INSERT INTO `tb_horses` VALUES (1, 28, 'JB\'s Hot Stuff', 0, '1900-01-01 00:00:00', 'Jayne Bean');
INSERT INTO `tb_horses` VALUES (1, 29, 'Sunshine du Phare', 0, '1900-01-01 00:00:00', 'Monsieur OLIVIER BROHIER');
INSERT INTO `tb_horses` VALUES (1, 30, 'Contanga', 0, '1900-01-01 00:00:00', 'A.Onassis de Miranda & Victory Eque');
INSERT INTO `tb_horses` VALUES (1, 31, 'Gancia de Muze', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 32, 'About A Dream', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 33, 'Cas', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 34, 'Silver Shine', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 35, 'Louis', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 36, 'Fit for Fun', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 37, 'H&M Legend of Love', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 38, 'Dandiego B Z', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 39, 'Chesall Zimequest', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 40, 'California', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 41, 'Bacardi VDL', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 42, 'Balzaci', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 43, 'Daimler', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 44, 'Cornado NRW', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (1, 45, 'Tempo de Paban', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 1, 'Dm Jacqmotte', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 2, 'Dieudonne de Guldenboom', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 3, 'Zapria', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 4, 'Navalo de Poheton', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 5, 'Corbusier', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 6, 'Cupido van de Hoefslag Z', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 7, 'Curtis Sitte', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 8, 'Cornet Kalua', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 9, 'Cardano CH', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 10, 'Grand Cru van de Rozenberg', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 11, 'Twentytwo des Biches', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 12, 'Cannavaro', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 13, 'Cordess', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 14, 'Delacroix AS', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 15, 'Clooney', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 16, 'Quasimodo VII', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 17, 'Epleaser van T Heike', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 18, 'Berlinda', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 19, 'Casall', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 20, 'Spring Dark', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 21, 'All Star', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 22, 'Salomon', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 23, 'Silver Deux de Virton H D C', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 24, 'Balance', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 25, 'Clouzot de Lassus', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 26, 'Caracas', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 27, 'Toupie de la Roque', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 28, 'JB\'s Hot Stuff', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 29, 'Sunshine du Phare', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 30, 'Contanga', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 31, 'Gancia de Muze', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 32, 'About A Dream', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 33, 'Cas', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 34, 'Silver Shine', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 35, 'Louis', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 36, 'Fit for Fun', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 37, 'H&M Legend of Love', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 38, 'Dandiego B Z', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 39, 'Chesall Zimequest', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 40, 'California', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 41, 'Bacardi VDL', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 42, 'Balzaci', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 43, 'Daimler', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 44, 'Cornado NRW', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (2, 45, 'Tempo de Paban', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 1, 'Dm Jacqmotte', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 2, 'Dieudonne de Guldenboom', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 3, 'Zapria', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 4, 'Navalo de Poheton', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 5, 'Corbusier', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 6, 'Cupido van de Hoefslag Z', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 7, 'Curtis Sitte', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 8, 'Cornet Kalua', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 9, 'Cardano CH', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 10, 'Grand Cru van de Rozenberg', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 11, 'Twentytwo des Biches', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 12, 'Cannavaro', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 13, 'Cordess', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 14, 'Delacroix AS', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 15, 'Clooney', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 16, 'Quasimodo VII', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 17, 'Epleaser van T Heike', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 18, 'Berlinda', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 19, 'Casall', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 20, 'Spring Dark', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 21, 'All Star', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 22, 'Salomon', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 23, 'Silver Deux de Virton H D C', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 24, 'Balance', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 25, 'Clouzot de Lassus', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 26, 'Caracas', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 27, 'Toupie de la Roque', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 28, 'JB\'s Hot Stuff', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 29, 'Sunshine du Phare', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 30, 'Contanga', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 31, 'Gancia de Muze', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 32, 'About A Dream', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 33, 'Cas', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 34, 'Silver Shine', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 35, 'Louis', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 36, 'Fit for Fun', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 37, 'H&M Legend of Love', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 38, 'Dandiego B Z', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 39, 'Chesall Zimequest', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 40, 'California', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 41, 'Bacardi VDL', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 42, 'Balzaci', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 43, 'Daimler', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 44, 'Cornado NRW', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (3, 45, 'Tempo de Paban', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 1, 'Dm Jacqmotte', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 2, 'Dieudonne de Guldenboom', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 3, 'Zapria', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 4, 'Navalo de Poheton', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 5, 'Corbusier', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 6, 'Cupido van de Hoefslag Z', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 7, 'Curtis Sitte', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 8, 'Cornet Kalua', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 9, 'Cardano CH', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 10, 'Grand Cru van de Rozenberg', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 11, 'Twentytwo des Biches', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 12, 'Cannavaro', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 13, 'Cordess', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 14, 'Delacroix AS', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 15, 'Clooney', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 16, 'Quasimodo VII', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 17, 'Epleaser van T Heike', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 18, 'Berlinda', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 19, 'Casall', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 20, 'Spring Dark', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 21, 'All Star', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 22, 'Salomon', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 23, 'Silver Deux de Virton H D C', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 24, 'Balance', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 25, 'Clouzot de Lassus', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 26, 'Caracas', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 27, 'Toupie de la Roque', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 28, 'JB\'s Hot Stuff', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 29, 'Sunshine du Phare', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 30, 'Contanga', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 31, 'Gancia de Muze', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 32, 'About A Dream', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 33, 'Cas', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 34, 'Silver Shine', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 35, 'Louis', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 36, 'Fit for Fun', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 37, 'H&M Legend of Love', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 38, 'Dandiego B Z', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 39, 'Chesall Zimequest', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 40, 'California', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 41, 'Bacardi VDL', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 42, 'Balzaci', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 43, 'Daimler', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 44, 'Cornado NRW', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (4, 45, 'Tempo de Paban', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 1, 'Dm Jacqmotte', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 2, 'Dieudonne de Guldenboom', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 3, 'Zapria', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 4, 'Navalo de Poheton', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 5, 'Corbusier', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 6, 'Cupido van de Hoefslag Z', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 7, 'Curtis Sitte', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 8, 'Cornet Kalua', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 9, 'Cardano CH', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 10, 'Grand Cru van de Rozenberg', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 11, 'Twentytwo des Biches', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 12, 'Cannavaro', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 13, 'Cordess', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 14, 'Delacroix AS', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 15, 'Clooney', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 16, 'Quasimodo VII', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 17, 'Epleaser van T Heike', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 18, 'Berlinda', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 19, 'Casall', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 20, 'Spring Dark', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 21, 'All Star', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 22, 'Salomon', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 23, 'Silver Deux de Virton H D C', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 24, 'Balance', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 25, 'Clouzot de Lassus', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 26, 'Caracas', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 27, 'Toupie de la Roque', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 28, 'JB\'s Hot Stuff', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 29, 'Sunshine du Phare', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 30, 'Contanga', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 31, 'Gancia de Muze', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 32, 'About A Dream', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 33, 'Cas', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 34, 'Silver Shine', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 35, 'Louis', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 36, 'Fit for Fun', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 37, 'H&M Legend of Love', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 38, 'Dandiego B Z', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 39, 'Chesall Zimequest', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 40, 'California', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 41, 'Bacardi VDL', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 42, 'Balzaci', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 43, 'Daimler', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 44, 'Cornado NRW', 0, '1900-01-01 00:00:00', '');
INSERT INTO `tb_horses` VALUES (5, 45, 'Tempo de Paban', 0, '1900-01-01 00:00:00', '');

-- ----------------------------
-- Table structure for tb_ranks
-- ----------------------------
DROP TABLE IF EXISTS `tb_ranks`;
CREATE TABLE `tb_ranks`  (
  `eventId` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `point1` int(11) NULL DEFAULT NULL,
  `pointPlus1` int(11) NULL DEFAULT NULL,
  `time1` int(11) NULL DEFAULT NULL,
  `timePlus1` int(11) NULL DEFAULT NULL,
  `point2` int(11) NULL DEFAULT NULL,
  `pointPlus2` int(11) NULL DEFAULT NULL,
  `time2` int(11) NULL DEFAULT NULL,
  `timePlus2` int(11) NULL DEFAULT NULL,
  `jumpOff` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`eventId`, `number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_ranks
-- ----------------------------
INSERT INTO `tb_ranks` VALUES (1, 1, 6, 0, 0, 21794, 0, 0, 0, 21809, 0, 1);
INSERT INTO `tb_ranks` VALUES (1, 2, 10, 0, 0, 40329, 12000, 12000, 0, 20351, 6000, 1);
INSERT INTO `tb_ranks` VALUES (1, 3, 7, 0, 0, 28179, 6000, 0, 0, 26530, 0, 1);
INSERT INTO `tb_ranks` VALUES (1, 4, 3, 0, 0, 34568, 6000, 0, 0, 14960, 0, 1);
INSERT INTO `tb_ranks` VALUES (1, 5, 2, 0, 0, 40647, 6000, 0, 0, 10849, 0, 1);
INSERT INTO `tb_ranks` VALUES (1, 6, 9, 0, 0, 18776, 6000, 4000, 0, 22302, 1000, 1);
INSERT INTO `tb_ranks` VALUES (1, 7, 1, 0, 0, 21886, 6000, 0, 0, 8952, 0, 1);
INSERT INTO `tb_ranks` VALUES (1, 8, 8, 0, 0, 28913, 6000, 4000, 0, 12368, 0, 1);
INSERT INTO `tb_ranks` VALUES (1, 9, 5, 0, 0, 12952, 0, 0, 0, 18999, 0, 1);
INSERT INTO `tb_ranks` VALUES (1, 10, 4, 0, 0, 11001, 0, 0, 0, 16271, 0, 1);
INSERT INTO `tb_ranks` VALUES (2, 1, 14, 16000, 0, 12328, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 2, 10, 8000, 0, 17159, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 4, 3, 0, 0, 16505, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 5, 7, 4000, 0, 23608, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 6, 12, 8000, 0, 31673, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 7, 2, 0, 0, 14376, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 9, 5, 0, 0, 141127, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 10, 6, 4000, 0, 9008, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 15, 13, 12000, 0, 13887, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 16, 1, 0, 0, 0, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 18, 8, 4000, 0, 172839, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 20, 4, 0, 0, 37897, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 21, 11, 8000, 0, 23224, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (2, 44, 9, 8000, 0, 13600, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 1, 9, 11250, 3250, 96860, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 2, 10, 12000, 0, 8824, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 3, 3, 4000, 0, 7911, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 4, 4, 4000, 0, 8391, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 5, 8, 8000, 0, 13568, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 6, 5, 4000, 0, 13368, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 7, 7, 8000, 0, 8017, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 8, 2, 3750, 3750, 102824, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 9, 6, 4000, 4000, 108456, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (3, 10, 1, 0, 0, 3991, NULL, 0, 0, 0, NULL, 0);
INSERT INTO `tb_ranks` VALUES (4, 1, 2, 0, 0, 13583, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (4, 2, 4, 0, 0, 111755, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (4, 3, 1, 0, 0, 6480, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (4, 4, 3, 0, 0, 97641, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (4, 5, 5, 10000, 0, 43126, 6000, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 1, 7, 8000, 0, 11192, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 2, 5, 1750, 1750, 26665, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 3, 8, 8750, 750, 22657, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 4, 3, 0, 0, 14247, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 5, 10, 95500, 95500, 401445, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 6, 9, 21250, 17250, 88672, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 7, 4, 0, 0, 15099, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 8, 1, 0, 0, 10655, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 9, 2, 0, 0, 14008, 0, 0, 0, 0, 0, 0);
INSERT INTO `tb_ranks` VALUES (5, 10, 6, 2750, 2750, 30943, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for tb_riders
-- ----------------------------
DROP TABLE IF EXISTS `tb_riders`;
CREATE TABLE `tb_riders`  (
  `eventId` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `firstName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastName` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nation` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`eventId`, `number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_riders
-- ----------------------------
INSERT INTO `tb_riders` VALUES (1, 1, 'Vermeir', 'Wilm', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 2, 'Philips', 'Jane Richard', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 3, 'Chudyba', 'Bronislav', 'svk', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 4, 'Kocher', 'Andrew', 'usa', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 5, 'Rhomberg', 'Christian', 'aut', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 6, 'Romp', 'Ruben', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 7, 'Estermann', 'Paul', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 8, 'Kühner', 'Max', 'aut', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 9, 'Rutschi', 'Niklaus', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 10, 'Guery', 'Jerome', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 11, 'Duguet', 'Romain', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 12, 'Saro', 'Manuel Fernandez', 'esp', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 13, 'Kukuk', 'Christian', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 14, 'Crotta', 'Fabio', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 15, 'Fuchs', 'Martin', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 16, 'Schurtenberger', 'Niklaus', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 17, 'Ahlmann', 'Christian', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 18, 'Dreher', 'Hans-Dieter', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 19, 'Jufer', 'Alain', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 20, 'Bengtsson', 'Rolf-Göran', 'swe', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 21, 'Lynch', 'Denis', 'irl', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 22, 'Vleuten', 'Maikel Van der', 'ned', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 23, 'Staut', 'Kevin', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 24, 'Straten', 'Cindy van der', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 25, 'Balsiger', 'Bryan', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 26, 'Verlooy', 'Jos', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 27, 'Epaillard', 'Julien', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 28, 'Whitaker', 'Michael', 'gbr', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 29, 'Bost', 'Roger Yves', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 30, 'Zorzi', 'Alberto', 'ita', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 31, 'Bruynseels', 'Niels', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 32, 'Schwizer', 'Pius', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 33, 'Smolders', 'Harrie', 'ned', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 34, 'Skrzyczynski', 'Jaroslaw', 'pol', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 35, 'Züger', 'Annina', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 36, 'Diniz', 'Luciana', 'por', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 37, 'Philippaerts', 'Olivier', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 38, 'Smits', 'Edwin', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 39, 'Delestre', 'Simon', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 40, 'Tops-Alexander', 'Edwina', 'aus', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 41, 'Sprunger', 'Janika', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 42, 'Haßmann', 'Felix', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 43, 'Muff', 'Werner', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 44, 'Ehning', 'Marcus', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (1, 45, 'Robert', 'Olivier', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 1, 'Vermeir', 'Wilm', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 2, 'Philips', 'Jane Richard', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 3, 'Chudyba', 'Bronislav', 'SVK', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 4, 'Kocher', 'Andrew', 'USA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 5, 'Rhomberg', 'Christian', 'AUT', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 6, 'Romp', 'Ruben', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 7, 'Estermann', 'Paul', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 8, 'Kühner', 'Max', 'AUT', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 9, 'Rutschi', 'Niklaus', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 10, 'Guery', 'Jerome', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 11, 'Duguet', 'Romain', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 12, 'Saro', 'Manuel Fernandez', 'ESP', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 13, 'Kukuk', 'Christian', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 14, 'Crotta', 'Fabio', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 15, 'Fuchs', 'Martin', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 16, 'Schurtenberger', 'Niklaus', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 17, 'Ahlmann', 'Christian', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 18, 'Dreher', 'Hans-Dieter', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 19, 'Jufer', 'Alain', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 20, 'Bengtsson', 'Rolf-Göran', 'SWE', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 21, 'Lynch', 'Denis', 'IRL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 22, 'Vleuten', 'Maikel Van der', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 23, 'Staut', 'Kevin', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 24, 'Straten', 'Cindy van der', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 25, 'Balsiger', 'Bryan', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 26, 'Verlooy', 'Jos', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 27, 'Epaillard', 'Julien', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 28, 'Whitaker', 'Michael', 'GBR', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 29, 'Bost', 'Roger Yves', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 30, 'Zorzi', 'Alberto', 'ITA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 31, 'Bruynseels', 'Niels', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 32, 'Schwizer', 'Pius', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 33, 'Smolders', 'Harrie', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 34, 'Skrzyczynski', 'Jaroslaw', 'POL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 35, 'Züger', 'Annina', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 36, 'Diniz', 'Luciana', 'POR', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 37, 'Philippaerts', 'Olivier', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 38, 'Smits', 'Edwin', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 39, 'Delestre', 'Simon', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 40, 'Tops-Alexander', 'Edwina', 'AUS', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 41, 'Sprunger', 'Janika', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 42, 'Haßmann', 'Felix', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 43, 'Muff', 'Werner', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 44, 'Ehning', 'Marcus', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (2, 45, 'Robert', 'Olivier', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 1, 'Vermeir', 'Wilm', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 2, 'Philips', 'Jane Richard', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 3, 'Chudyba', 'Bronislav', 'svk', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 4, 'Kocher', 'Andrew', 'usa', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 5, 'Rhomberg', 'Christian', 'aut', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 6, 'Romp', 'Ruben', 'ned', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 7, 'Estermann', 'Paul', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 8, 'Kühner', 'Max', 'aut', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 9, 'Rutschi', 'Niklaus', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 10, 'Guery', 'Jerome', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 11, 'Duguet', 'Romain', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 12, 'Saro', 'Manuel Fernandez', 'esp', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 13, 'Kukuk', 'Christian', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 14, 'Crotta', 'Fabio', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 15, 'Fuchs', 'Martin', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 16, 'Schurtenberger', 'Niklaus', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 17, 'Ahlmann', 'Christian', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 18, 'Dreher', 'Hans-Dieter', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 19, 'Jufer', 'Alain', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 20, 'Bengtsson', 'Rolf-Göran', 'swe', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 21, 'Lynch', 'Denis', 'irl', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 22, 'Vleuten', 'Maikel Van der', 'ned', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 23, 'Staut', 'Kevin', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 24, 'Straten', 'Cindy van der', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 25, 'Balsiger', 'Bryan', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 26, 'Verlooy', 'Jos', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 27, 'Epaillard', 'Julien', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 28, 'Whitaker', 'Michael', 'gbr', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 29, 'Bost', 'Roger Yves', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 30, 'Zorzi', 'Alberto', 'ita', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 31, 'Bruynseels', 'Niels', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 32, 'Schwizer', 'Pius', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 33, 'Smolders', 'Harrie', 'ned', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 34, 'Skrzyczynski', 'Jaroslaw', 'pol', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 35, 'Züger', 'Annina', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 36, 'Diniz', 'Luciana', 'por', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 37, 'Philippaerts', 'Olivier', 'bel', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 38, 'Smits', 'Edwin', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 39, 'Delestre', 'Simon', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 40, 'Tops-Alexander', 'Edwina', 'aus', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 41, 'Sprunger', 'Janika', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 42, 'Haßmann', 'Felix', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 43, 'Muff', 'Werner', 'sui', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 44, 'Ehning', 'Marcus', 'ger', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (3, 45, 'Robert', 'Olivier', 'fra', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 1, 'Vermeir', 'Wilm', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 2, 'Philips', 'Jane Richard', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 3, 'Chudyba', 'Bronislav', 'SVK', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 4, 'Kocher', 'Andrew', 'USA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 5, 'Rhomberg', 'Christian', 'AUT', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 6, 'Romp', 'Ruben', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 7, 'Estermann', 'Paul', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 8, 'Kühner', 'Max', 'AUT', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 9, 'Rutschi', 'Niklaus', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 10, 'Guery', 'Jerome', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 11, 'Duguet', 'Romain', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 12, 'Saro', 'Manuel Fernandez', 'ESP', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 13, 'Kukuk', 'Christian', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 14, 'Crotta', 'Fabio', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 15, 'Fuchs', 'Martin', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 16, 'Schurtenberger', 'Niklaus', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 17, 'Ahlmann', 'Christian', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 18, 'Dreher', 'Hans-Dieter', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 19, 'Jufer', 'Alain', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 20, 'Bengtsson', 'Rolf-Göran', 'SWE', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 21, 'Lynch', 'Denis', 'IRL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 22, 'Vleuten', 'Maikel Van der', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 23, 'Staut', 'Kevin', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 24, 'Straten', 'Cindy van der', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 25, 'Balsiger', 'Bryan', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 26, 'Verlooy', 'Jos', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 27, 'Epaillard', 'Julien', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 28, 'Whitaker', 'Michael', 'GBR', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 29, 'Bost', 'Roger Yves', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 30, 'Zorzi', 'Alberto', 'ITA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 31, 'Bruynseels', 'Niels', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 32, 'Schwizer', 'Pius', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 33, 'Smolders', 'Harrie', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 34, 'Skrzyczynski', 'Jaroslaw', 'POL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 35, 'Züger', 'Annina', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 36, 'Diniz', 'Luciana', 'POR', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 37, 'Philippaerts', 'Olivier', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 38, 'Smits', 'Edwin', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 39, 'Delestre', 'Simon', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 40, 'Tops-Alexander', 'Edwina', 'AUS', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 41, 'Sprunger', 'Janika', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 42, 'Haßmann', 'Felix', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 43, 'Muff', 'Werner', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 44, 'Ehning', 'Marcus', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (4, 45, 'Robert', 'Olivier', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 1, 'Vermeir', 'Wilm', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 2, 'Philips', 'Jane Richard', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 3, 'Chudyba', 'Bronislav', 'SVK', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 4, 'Kocher', 'Andrew', 'USA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 5, 'Rhomberg', 'Christian', 'AUT', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 6, 'Romp', 'Ruben', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 7, 'Estermann', 'Paul', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 8, 'Kühner', 'Max', 'AUT', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 9, 'Rutschi', 'Niklaus', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 10, 'Guery', 'Jerome', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 11, 'Duguet', 'Romain', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 12, 'Saro', 'Manuel Fernandez', 'ESP', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 13, 'Kukuk', 'Christian', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 14, 'Crotta', 'Fabio', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 15, 'Fuchs', 'Martin', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 16, 'Schurtenberger', 'Niklaus', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 17, 'Ahlmann', 'Christian', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 18, 'Dreher', 'Hans-Dieter', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 19, 'Jufer', 'Alain', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 20, 'Bengtsson', 'Rolf-Göran', 'SWE', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 21, 'Lynch', 'Denis', 'IRL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 22, 'Vleuten', 'Maikel Van der', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 23, 'Staut', 'Kevin', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 24, 'Straten', 'Cindy van der', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 25, 'Balsiger', 'Bryan', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 26, 'Verlooy', 'Jos', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 27, 'Epaillard', 'Julien', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 28, 'Whitaker', 'Michael', 'GBR', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 29, 'Bost', 'Roger Yves', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 30, 'Zorzi', 'Alberto', 'ITA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 31, 'Bruynseels', 'Niels', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 32, 'Schwizer', 'Pius', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 33, 'Smolders', 'Harrie', 'NED', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 34, 'Skrzyczynski', 'Jaroslaw', 'POL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 35, 'Züger', 'Annina', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 36, 'Diniz', 'Luciana', 'POR', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 37, 'Philippaerts', 'Olivier', 'BEL', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 38, 'Smits', 'Edwin', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 39, 'Delestre', 'Simon', 'FRA', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 40, 'Tops-Alexander', 'Edwina', 'AUS', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 41, 'Sprunger', 'Janika', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 42, 'Haßmann', 'Felix', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 43, 'Muff', 'Werner', 'SUI', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 44, 'Ehning', 'Marcus', 'GER', '1900-01-01 00:00:00');
INSERT INTO `tb_riders` VALUES (5, 45, 'Robert', 'Olivier', 'FRA', '1900-01-01 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
