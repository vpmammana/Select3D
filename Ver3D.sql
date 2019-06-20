-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Ver3D
-- ------------------------------------------------------
-- Server version	5.5.57-0+deb8u1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Evento um realizado em marte'),(2,'Evento dois realizado em vênus'),(3,'Evento três realizado em aldebarã'),(4,'Evento quatro realizado em betelgeuse'),(5,'Evento cinco realizado no sol'),(6,'Evento realizado na lua'),(7,'Evento realizado em Crux'),(8,'Evento realizado em alfa centauro'),(9,'Evento realizado em beta centauro'),(10,'Evento realizado em sirius'),(11,'Evento realizado em mercúrio'),(12,'Evento realizado na terra'),(13,'Evento realizado em andrômeda'),(14,'Evento realizado em júpiter'),(15,'Evento realizado em saturno'),(16,'Evento realizado em urano'),(17,'Evento realizado em netuno'),(18,'Evento realizado em plutão'),(19,'Evento realizado em Io'),(20,'Evento realizado em Europa'),(21,'Evento realizado em Azerbaijão'),(22,'Evento realizado em Coxinhistão'),(23,'Evento realizado em cassiopéia'),(24,'Evento realizado em plêiades'),(25,'Evento realizado em rigel'),(26,'Evento realizado em algedi'),(27,'Evento realizado em bellatrix'),(28,'Evento realizado em bunda'),(29,'Evento realizado em segin'),(30,'Evento realizado em zaniah'),(31,'Evento realizado em yildon'),(32,'Evento realizado em wasat'),(33,'Evento realizado em tabit'),(34,'Evento realizado em skat'),(35,'Evento realizado em situla'),(36,'Evento realizado em sheratan'),(37,'Evento realizado em sham'),(38,'Evento realizado em acrux'),(39,'Evento realizado em decrux'),(40,'Evento realizado em naos'),(41,'Evento realizado em navi'),(42,'Evento realizado em medrez'),(43,'Evento realizado em medrez'),(44,'Evento realizado em menkar'),(45,'Evento realizado em menkab'),(46,'Evento realizado em merak'),(47,'Evento realizado em menkiv'),(48,'Evento realizado em menkib'),(49,'Evento realizado em menkent'),(50,'Evento realizado em matar'),(51,'Evento realizado em media'),(52,'Evento realizado em mafik'),(53,'Evento realizado em meissa'),(54,'Evento realizado em mekbuda'),(55,'Evento realizado em megrez'),(56,'Evento realizado em maasyn'),(57,'Evento realizado em kochab'),(58,'Evento realizado em kitalpha'),(59,'Evento realizado em keid'),(60,'Evento realizado em girtab'),(61,'Evento realizado em gacrux'),(62,'Evento realizado em gatria'),(63,'Evento realizado em grafias'),(64,'Evento realizado em grumium'),(65,'Evento realizado em giedi'),(66,'Evento realizado em hadar'),(67,'Evento realizado em heka'),(68,'Evento realizado em heze'),(69,'Evento realizado em homam'),(70,'Evento realizado em intrometida'),(71,'Evento realizado em izar'),(72,'Evento realizado em dabih'),(73,'Evento realizado em chow'),(74,'Evento realizado em chort'),(75,'Evento realizado em cursa'),(76,'Evento realizado em chara'),(77,'Evento realizado em chertan'),(78,'Evento realizado em celaeno'),(79,'Evento realizado em cebalrai'),(80,'Evento realizado em furud'),(81,'Evento realizado em nash'),(82,'Evento realizado em phad'),(83,'Evento realizado em phact'),(84,'Evento realizado em pherkad'),(85,'Evento realizado em pherkard'),(86,'Evento realizado em pleione'),(87,'Evento realizado em polaris'),(88,'Evento realizado em pollux'),(89,'Evento realizado em propus'),(90,'Evento realizado em sabik'),(91,'Evento realizado em sadr'),(92,'Evento realizado em saiph'),(93,'Evento realizado em salm'),(94,'Evento realizado em situla'),(95,'Evento realizado em sulafat'),(96,'Evento realizado em tabut'),(97,'Evento realizado em tabit'),(98,'Evento realizado em talitha'),(99,'Evento realizado em tania'),(100,'Evento realizado em taygeta');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_evento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_evento` (`id_evento`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--

LOCK TABLES `fotos` WRITE;
/*!40000 ALTER TABLE `fotos` DISABLE KEYS */;
INSERT INTO `fotos` VALUES (1,'4',1),(2,'5',1),(4,'10',2),(3,'3',2),(7,'1',3),(5,'11',3),(8,'12',4),(9,'18',4),(11,'13',5),(10,'16',5),(12,'17',6),(13,'7',6),(34,'3',7),(33,'7',7),(16,'2',8),(35,'8',8),(36,'8',9),(20,'15',10),(37,'4',10),(32,'11',11),(23,'19',11),(28,'16',12),(24,'20',12),(39,'15',13),(38,'8',13),(40,'16',14),(41,'2',14),(42,'3',15),(43,'8',15),(45,'11',16),(44,'14',16),(46,'12',17),(47,'6',18),(48,'7',18),(50,'12',19),(49,'6',19),(52,'1',20),(51,'13',20),(53,'11',21),(54,'8',21),(56,'4',22),(55,'7',22),(57,'1',23),(58,'2',23),(60,'13',24),(59,'9',24),(61,'16',25),(62,'17',25),(63,'18',25),(64,'19',26),(65,'20',26),(66,'2',27),(67,'4',27),(68,'10',28),(69,'11',28),(71,'1',29),(70,'12',29),(72,'4',29),(74,'6',30),(73,'7',30),(76,'13',31),(75,'16',31),(77,'14',32),(78,'15',32),(79,'19',33),(80,'2',33),(81,'1',34),(82,'4',34),(83,'7',35),(84,'8',35),(85,'10',36),(86,'11',36),(87,'19',37),(88,'3',37),(89,'8',38),(90,'9',38),(91,'10',39),(92,'10',40),(93,'11',40),(94,'13',41),(95,'14',42),(96,'15',42),(98,'1',43),(97,'11',43),(99,'2',44),(100,'3',44),(102,'13',45),(101,'2',45),(104,'7',46),(103,'8',46),(105,'2',47),(106,'20',47),(108,'18',48),(107,'19',48),(109,'7',49),(110,'8',49),(111,'13',50),(112,'12',51),(113,'7',51),(114,'8',52),(115,'1',53),(116,'16',54),(117,'17',54),(118,'3',55),(119,'4',55),(120,'6',56),(121,'7',56),(123,'12',57),(122,'9',57),(124,'18',58),(125,'19',59),(126,'9',59),(127,'15',60),(128,'16',60),(129,'1',61),(130,'3',61),(132,'3',62),(131,'5',62),(134,'18',63),(133,'4',63),(135,'10',64),(137,'3',64),(136,'6',64),(138,'7',65),(139,'8',65),(140,'10',66),(141,'11',66),(142,'19',67),(143,'20',67),(144,'1',68),(145,'2',68),(146,'8',69),(147,'9',69),(149,'11',70),(148,'12',70),(150,'2',71),(151,'8',71),(152,'13',72),(154,'14',72),(156,'17',73),(155,'5',73),(158,'1',74),(157,'9',74),(159,'7',75),(160,'8',75),(163,'12',76),(161,'19',76),(164,'12',77),(162,'18',77),(166,'2',78),(165,'3',78),(167,'1',79),(168,'8',79),(169,'13',80),(170,'14',80),(172,'19',81),(171,'20',81),(174,'13',82),(173,'18',82),(176,'14',83),(175,'7',83),(178,'5',84),(177,'6',84),(179,'4',85),(180,'5',85),(181,'2',86),(182,'3',86),(184,'17',87),(183,'18',87),(186,'19',88),(185,'20',88),(188,'12',89),(187,'13',89),(189,'2',90),(190,'20',90),(192,'12',91),(191,'13',91),(194,'6',92),(193,'8',92),(195,'1',93),(196,'4',93),(198,'1',94),(197,'4',94),(200,'11',95),(199,'9',95),(201,'14',96),(202,'15',96),(204,'1',97),(203,'12',97),(206,'2',98),(205,'3',98),(208,'13',99),(207,'2',99),(209,'14',100),(210,'8',100);
/*!40000 ALTER TABLE `fotos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-20 13:02:28
