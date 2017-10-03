-- MySQL dump 10.13  Distrib 5.7.12, for Linux (x86_64)
--
-- Host: localhost    Database: rimDB
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `notes` mediumtext,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date entered',
  `users_id` int(10) unsigned NOT NULL COMMENT 'entered by user',
  `job_status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_component_job_idx` (`job_id`),
  KEY `fk_components_users1_idx` (`users_id`),
  KEY `fk_components_job_status1_idx` (`job_status_id`),
  CONSTRAINT `fk_component_job` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_job_status1` FOREIGN KEY (`job_status_id`) REFERENCES `job_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_contacts`
--

DROP TABLE IF EXISTS `customer_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `customers_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_contacts_customers1_idx` (`customers_id`),
  CONSTRAINT `fk_customer_contacts_customers1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_contacts`
--

LOCK TABLES `customer_contacts` WRITE;
/*!40000 ALTER TABLE `customer_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `address3` varchar(45) DEFAULT NULL,
  `suburb` varchar(25) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL,
  `postcode` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (6,'CustomerA','1 Test St','','','Testville','VIC','3000'),(7,'CustomerB','1 TSmith Street',NULL,NULL,'Testville','VIC','3000'),(8,'CustomerC','1 Victoria Street','','','Testville','VIC','3000'),(9,'SIMON THOMAS','647 SLOANE STREET','','','DENI','NSW',''),(10,'DEC DEMS','SALEYARDS RD','','','DENILIQUIN','NSW','2710');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_operations`
--

DROP TABLE IF EXISTS `default_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_operations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `material_types_id` int(10) unsigned NOT NULL,
  `operations_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_default_operations_material_types1_idx` (`material_types_id`),
  KEY `fk_default_operations_operations1_idx` (`operations_id`),
  CONSTRAINT `fk_default_operations_material_types1` FOREIGN KEY (`material_types_id`) REFERENCES `material_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_default_operations_operations1` FOREIGN KEY (`operations_id`) REFERENCES `operations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_operations`
--

LOCK TABLES `default_operations` WRITE;
/*!40000 ALTER TABLE `default_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_status`
--

DROP TABLE IF EXISTS `job_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_status`
--

LOCK TABLES `job_status` WRITE;
/*!40000 ALTER TABLE `job_status` DISABLE KEYS */;
INSERT INTO `job_status` VALUES (4,'Not Started'),(5,'In Progress'),(6,'Complete');
/*!40000 ALTER TABLE `job_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_name` varchar(45) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Date job entered',
  `customer_id` int(10) unsigned NOT NULL,
  `notes` mediumtext,
  `users_id` int(10) unsigned NOT NULL COMMENT 'Job entered by this user',
  `job_status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_customer_idx` (`customer_id`),
  KEY `fk_job_users1_idx` (`users_id`),
  KEY `fk_jobs_job_status1_idx` (`job_status_id`),
  CONSTRAINT `fk_job_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_jobs_job_status1` FOREIGN KEY (`job_status_id`) REFERENCES `job_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (7,'QuickJobA','2016-08-04 00:44:29',6,NULL,4,4),(8,'QuickJobB','2016-08-04 00:44:29',7,NULL,4,4),(9,'ABigJob','2016-08-04 00:44:29',8,NULL,4,4),(10,'AnInProgressJob','2016-08-04 00:44:29',6,NULL,4,5),(11,'AnFinishedJob','2016-08-04 00:44:29',7,NULL,4,6),(12,'2bdr floor frame','2017-04-25 07:48:26',6,NULL,9,4),(13,'My Test Job','2017-06-01 00:00:00',6,'Here are some notes',4,4),(14,'Bullbars','2017-06-01 00:00:00',7,'SOme notes',4,4),(15,'vdcds','2017-06-09 00:00:00',7,'dasdas',11,4),(16,'My Test Job','2017-06-07 00:00:00',7,'some note',4,4),(17,'Door Jam','2017-06-12 00:00:00',8,'cvsdfds',9,4),(18,'THis is a test job','2017-06-05 00:00:00',6,'Here are some notes',9,4),(19,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(20,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(21,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(22,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(23,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(24,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(25,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(26,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(27,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(28,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(29,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(30,'A small job','2017-06-01 00:00:00',8,'Here are some notes',9,4),(31,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(32,'House Frame','2017-06-06 00:00:00',6,'Some ntoes',9,4),(33,'pontoon','2017-06-29 00:00:00',6,'fix ramp',9,4),(34,'UTE TRAY','2017-08-10 00:00:00',9,'JOB 1 TEST',9,4),(35,'TEST 10 08 17','2017-08-10 00:00:00',9,'SIMON J THOMAS 10\\08\\17\r\n',9,4),(36,'PAM WADE ','2017-09-14 00:00:00',10,'',9,4);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_types`
--

DROP TABLE IF EXISTS `material_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `UOM` varchar(45) NOT NULL,
  `parent_types_id` int(11) DEFAULT NULL,
  `measurement_properties_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `material_types_UN` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_types`
--

LOCK TABLES `material_types` WRITE;
/*!40000 ALTER TABLE `material_types` DISABLE KEYS */;
INSERT INTO `material_types` VALUES (9,'Duragal','mm',NULL,5),(10,'Structural','m',NULL,5),(11,'Flats','mm',NULL,5),(13,'Pipe','mm',NULL,5),(14,'Bolts','',NULL,9),(15,'SHS','mm',9,5),(16,'RHS','mm',9,5),(17,'Stainless Steel','m2',11,5),(18,'Aluminium','m2',11,5),(19,'Galvanised','m2',11,5),(20,'Zinc','m2',11,5),(21,'Colourbond','m2',11,5),(22,'Mild Steel','m2',11,5),(23,'Universal Beam','mm',10,5),(24,'Universal Columns','mm',10,5),(25,'Channels','mm',10,5),(26,'Angles-Equal','mm',10,5),(27,'Angles-UnEqual','mm',10,5),(28,'Taper Flange Beam','m',10,5);
/*!40000 ALTER TABLE `material_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_types_has_measurement_properties`
--

DROP TABLE IF EXISTS `material_types_has_measurement_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_types_has_measurement_properties` (
  `material_types_id` int(10) unsigned NOT NULL,
  `measurement_properties_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`material_types_id`,`measurement_properties_id`),
  KEY `fk_material_types_has_measurement_properties_measurement_pr_idx` (`measurement_properties_id`),
  KEY `fk_material_types_has_measurement_properties_material_types_idx` (`material_types_id`),
  CONSTRAINT `fk_material_types_has_measurement_properties_material_types1` FOREIGN KEY (`material_types_id`) REFERENCES `material_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_material_types_has_measurement_properties_measurement_prop1` FOREIGN KEY (`measurement_properties_id`) REFERENCES `measurement_properties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_types_has_measurement_properties`
--

LOCK TABLES `material_types_has_measurement_properties` WRITE;
/*!40000 ALTER TABLE `material_types_has_measurement_properties` DISABLE KEYS */;
INSERT INTO `material_types_has_measurement_properties` VALUES (15,5),(9,6),(15,6),(16,6),(9,7),(16,7),(9,9),(15,9),(16,9),(9,10),(15,10),(16,10);
/*!40000 ALTER TABLE `material_types_has_measurement_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `cost_price` decimal(6,2) NOT NULL COMMENT 'price/ 1 * Unit of Measure',
  `qty_on_hand` int(11) NOT NULL DEFAULT '0',
  `material_types_id` int(10) unsigned NOT NULL,
  `markup_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `sale_price` varchar(45) GENERATED ALWAYS AS ((`cost_price` * (1 + (`markup_percent` / 100)))) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `materials_UN` (`material_types_id`,`description`),
  KEY `fk_materials_material_types1_idx` (`material_types_id`),
  CONSTRAINT `fk_materials_material_types1` FOREIGN KEY (`material_types_id`) REFERENCES `material_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` (`id`, `description`, `cost_price`, `qty_on_hand`, `material_types_id`, `markup_percent`) VALUES (1,'20x1.6 SHS',52.00,1000,15,12.00),(2,'20x2.0 SHS',52.00,1000,15,12.00),(3,'25x2.5 SHS',52.00,1000,15,12.00),(4,'25x3.0 SHS',52.00,1000,15,12.00),(5,'0.55mm Sheet',22.00,350,17,15.00),(6,'0.75mm Sheet',22.00,350,17,15.00),(7,'0.95mm Sheet',22.00,350,17,15.00),(8,'1.20mm Sheet',22.00,350,17,15.00),(9,'1.50mm Sheet',22.00,350,17,15.00),(10,'2.00mm Sheet',22.00,350,17,15.00),(11,'0.55 Sheet',22.00,350,18,15.00),(12,'0.75 Sheet',22.00,350,18,15.00),(13,'0.95 Sheet',22.00,350,18,15.00),(14,'1.20 Sheet',22.00,350,18,15.00),(15,'1.50 Sheet',22.00,350,18,15.00),(16,'2.00 Sheet',22.00,350,18,15.00),(17,'0.55 Sheet',22.00,350,19,15.00),(18,'0.75 Sheet',22.00,350,19,15.00),(19,'0.95 Sheet',22.00,350,19,15.00),(20,'1.20 Sheet',22.00,350,19,15.00),(21,'1.50 Sheet',22.00,350,19,15.00),(22,'2.00 Sheet',22.00,350,19,15.00),(23,'0.55 Sheet',22.00,350,20,15.00),(24,'0.75 Sheet',22.00,350,20,15.00),(25,'0.95 Sheet',22.00,350,20,15.00),(26,'1.20 Sheet',22.00,350,20,15.00),(27,'1.50 Sheet',22.00,350,20,15.00),(28,'2.00 Sheet',22.00,350,20,15.00),(29,'0.55 Sheet',22.00,350,21,15.00),(30,'0.75 Sheet',22.00,350,21,15.00),(31,'0.95 Sheet',22.00,350,21,15.00),(32,'1.20 Sheet',22.00,350,21,15.00),(33,'1.50 Sheet',22.00,350,21,15.00),(34,'2.00 Sheet',22.00,350,21,15.00),(35,'0.55 Sheet',22.00,350,22,15.00),(36,'0.75 Sheet',22.00,350,22,15.00),(37,'0.95 Sheet',22.00,350,22,15.00),(38,'1.20 Sheet',22.00,350,22,15.00),(39,'1.50 Sheet',22.00,350,22,15.00),(40,'2.00 Sheet',22.00,350,22,15.00),(41,'150mmx14kg/m',16.80,100,23,15.00),(42,'150mmx18kg/m',21.60,100,23,15.00),(43,'180mmx16.1kg/m',19.32,100,23,15.00),(44,'180mmx18.1kg/m',21.72,100,23,15.00),(45,'180mmx22.2kg/m',26.64,100,23,15.00),(46,'200mmx18.2kg/m',21.84,100,23,15.00),(47,'200mmx22.3kg/m',26.76,100,23,15.00),(48,'200mmx25.4kg/m',30.48,100,23,15.00),(49,'200mmx29.8kg/m',35.76,100,23,15.00),(50,'250mmx25.7kg/m',30.84,100,23,15.00),(51,'250mmx31.4kg/m',37.68,100,23,15.00),(52,'250mmx37.3kg/m',44.76,100,23,15.00),(53,'310mmx32kg/m',38.40,100,23,15.00),(54,'310mmx40.4kg/m',48.48,100,23,15.00),(55,'310mmx46.2kg/m',55.44,100,23,15.00),(56,'360mmx44.7kg/m',53.64,100,23,15.00),(57,'360mmx50.7kg/m',60.84,100,23,15.00),(58,'360mmx56.7kg/m',68.04,100,23,15.00),(59,'410mmx53.7kg/m',64.44,100,23,15.00),(60,'410mmx59.7kg/m',71.64,100,23,15.00),(61,'460mmx67.1kg/m',80.52,100,23,15.00),(62,'460mmx74.6kg/m',89.52,100,23,15.00),(63,'460mmx82.1kg/m',98.52,100,23,15.00),(64,'530mmx82kg/m',98.40,100,23,15.00),(65,'530mmx92.4kg/m',110.88,100,23,15.00),(66,'610mmx101kg/m',121.20,100,23,15.00),(67,'610mmx113kg/m',135.60,100,23,15.00),(68,'610mmx125kg/m',150.00,100,23,15.00),(69,'100mmx14.8kg/m',17.76,100,24,15.00),(70,'150mmx23.4kg/m',28.08,100,24,15.00),(71,'150mmx30kg/m',36.00,100,24,15.00),(72,'150mmx37.2kg/m',44.64,100,24,15.00),(73,'200mmx46.2kg/m',55.44,100,24,15.00),(74,'200mmx52.2kg/m',62.64,100,24,15.00),(75,'200mmx59.5kg/m',71.40,100,24,15.00),(76,'250mmx72.9kg/m',87.48,100,24,15.00),(77,'250mmx89.5kg/m',107.40,100,24,15.00),(78,'310mmx96.8kg/m',116.16,100,24,15.00),(79,'310mmx118kg/m',141.60,100,24,15.00),(80,'310mmx137kg/m',164.40,100,24,15.00),(81,'310mmx158kg/m',189.60,100,24,15.00),(82,'150x75',21.24,100,25,15.00),(83,'180x75',25.08,100,25,15.00),(84,'200x75',27.48,100,25,15.00),(85,'230x75',30.12,100,25,15.00),(86,'250x90',42.60,100,25,15.00),(87,'300x90',48.12,100,25,15.00),(88,'380x100',66.24,100,25,15.00),(89,'125x125x8',18.62,100,26,15.00),(90,'125x125x10',22.50,100,26,15.00),(91,'125x125x12',28.12,100,26,15.00),(92,'125x125x16',36.38,100,26,15.00),(93,'150x150x10',27.38,100,26,15.00),(94,'150x150x12',34.12,100,26,15.00),(95,'150x150x16',44.25,100,26,15.00),(96,'150x150x19',52.62,100,26,15.00),(97,'200x200x13',50.00,100,26,15.00),(98,'200x200x16',60.88,100,26,15.00),(99,'200x200x18',68.00,100,26,15.00),(100,'200x200x20',75.12,100,26,15.00),(101,'200x200x26',96.00,100,26,15.00),(102,'150x90x8',17.88,100,27,15.00),(103,'150x90x10',21.62,100,27,15.00),(104,'150x90x16',34.88,100,27,15.00),(105,'150x100x10',22.50,100,27,15.00),(106,'150x100x12',28.12,100,27,15.00),(107,'100x45',0.00,100,28,15.00),(108,'125x65',0.00,100,28,15.00),(109,'25x1.6 SHS',52.00,1000,15,12.00),(110,'25x2.0 SHS',52.00,1000,15,12.00),(111,'30x1.6 SHS',52.00,1000,15,12.00),(112,'30x2.0 SHS',52.00,1000,15,12.00),(113,'30x2.5 SHS',52.00,1000,15,12.00),(114,'30x3.0 SHS',52.00,1000,15,12.00),(116,'35x1.6 SHS',52.00,1000,15,12.00),(117,'35x2.0 SHS',52.00,1000,15,12.00),(118,'35x2.5 SHS',52.00,1000,15,12.00),(119,'35x3.0 SHS',52.00,1000,15,12.00),(120,'40x1.6 SHS',52.00,1000,15,12.00),(121,'40x2.0 SHS',3.96,1000,15,30.00),(122,'40x2.5 SHS',52.00,1000,15,12.00),(123,'40x3.0 SHS',52.00,1000,15,12.00),(124,'40x4.0 SHS',4.00,1000,15,25.00),(125,'50x1.6 SHS',52.00,1000,15,12.00),(126,'50x2.0 SHS',52.00,1000,15,12.00),(127,'50x2.5 SHS',52.00,1000,15,12.00),(128,'50x3.0 SHS',52.00,1000,15,12.00),(129,'50x4.0 SHS',52.00,1000,15,12.00),(130,'50x5.0 SHS',52.00,1000,15,12.00),(131,'65x1.6 SHS',52.00,1000,15,12.00),(132,'65x2.0 SHS',52.00,1000,15,12.00),(133,'65x2.5 SHS',52.00,1000,15,12.00),(134,'65x3.0 SHS',52.00,1000,15,12.00),(135,'65x4.0 SHS',52.00,1000,15,12.00),(136,'65x5.0 SHS',52.00,1000,15,12.00),(137,'75x2.0 SHS',9.01,1000,15,12.00),(138,'75x2.5 SHS',52.00,1000,15,12.00),(139,'75x3.0 SHS',52.00,1000,15,12.00),(140,'75x4.0 SHS',52.00,1000,15,12.00),(141,'75x5.0 SHS',52.00,1000,15,12.00),(142,'89x2.0 SHS',52.00,1000,15,12.00),(143,'89x3.5 SHS',52.00,1000,15,12.00),(144,'89x5.0 SHS',52.00,1000,15,12.00),(145,'100x2.5 SHS',52.00,1000,15,12.00),(146,'100x3.0 SHS',52.00,1000,15,12.00),(147,'100x4.0 SHS',52.00,1000,15,12.00),(148,'100x5.0 SHS',52.00,1000,15,12.00),(162,'120mm Bolt',0.09,1000,14,100.00),(166,'75 x 50 2',7.45,10000,16,12.50),(167,'75 x 50 4',13.06,1000,16,12.50),(168,'150 x 150 x 5',26.80,10000,16,12.50);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials_has_measurement_properties`
--

DROP TABLE IF EXISTS `materials_has_measurement_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials_has_measurement_properties` (
  `materials_id` int(10) unsigned NOT NULL,
  `measurement_properties_id` int(10) unsigned NOT NULL,
  `measurement` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`materials_id`,`measurement_properties_id`),
  KEY `fk_materials_has_measurement_properties_measurement_propert_idx` (`measurement_properties_id`),
  KEY `fk_materials_has_measurement_properties_materials1_idx` (`materials_id`),
  CONSTRAINT `fk_materials_has_measurement_properties_materials1` FOREIGN KEY (`materials_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_has_measurement_properties_measurement_properties1` FOREIGN KEY (`measurement_properties_id`) REFERENCES `measurement_properties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials_has_measurement_properties`
--

LOCK TABLES `materials_has_measurement_properties` WRITE;
/*!40000 ALTER TABLE `materials_has_measurement_properties` DISABLE KEYS */;
INSERT INTO `materials_has_measurement_properties` VALUES (1,5,NULL),(1,6,25.00),(1,9,1.60),(1,10,NULL),(2,5,NULL),(2,6,25.00),(2,9,2.00),(2,10,NULL),(3,5,NULL),(3,6,25.00),(3,9,2.50),(3,10,NULL),(4,5,NULL),(4,6,25.00),(4,9,3.00),(4,10,NULL),(5,5,NULL),(5,6,NULL),(5,9,0.55),(5,10,NULL),(6,5,NULL),(6,6,NULL),(6,9,0.75),(6,10,NULL),(7,5,NULL),(7,6,NULL),(7,9,0.95),(7,10,NULL),(8,5,NULL),(8,6,NULL),(8,9,1.20),(8,10,NULL),(9,5,NULL),(9,6,NULL),(9,9,1.50),(9,10,NULL),(10,5,NULL),(10,6,NULL),(10,9,2.00),(10,10,NULL),(11,5,NULL),(11,6,NULL),(11,9,0.55),(11,10,NULL),(12,5,NULL),(12,6,NULL),(12,9,0.75),(12,10,NULL),(13,5,NULL),(13,6,NULL),(13,9,0.95),(13,10,NULL),(14,5,NULL),(14,6,NULL),(14,9,1.20),(14,10,NULL),(15,5,NULL),(15,6,NULL),(15,9,1.50),(15,10,NULL),(16,5,NULL),(16,6,NULL),(16,9,2.00),(16,10,NULL),(17,5,NULL),(17,6,NULL),(17,9,0.55),(17,10,NULL),(18,5,NULL),(18,6,NULL),(18,9,0.75),(18,10,NULL),(19,5,NULL),(19,6,NULL),(19,9,0.95),(19,10,NULL),(20,5,NULL),(20,6,NULL),(20,9,1.20),(20,10,NULL),(21,5,NULL),(21,6,NULL),(21,9,1.50),(21,10,NULL),(22,5,NULL),(22,6,NULL),(22,9,2.00),(22,10,NULL),(23,5,NULL),(23,6,NULL),(23,9,0.55),(23,10,NULL),(24,5,NULL),(24,6,NULL),(24,9,0.75),(24,10,NULL),(25,5,NULL),(25,6,NULL),(25,9,0.95),(25,10,NULL),(26,5,NULL),(26,6,NULL),(26,9,1.20),(26,10,NULL),(27,5,NULL),(27,6,NULL),(27,9,1.50),(27,10,NULL),(28,5,NULL),(28,6,NULL),(28,9,2.00),(28,10,NULL),(29,5,NULL),(29,6,NULL),(29,9,0.55),(29,10,NULL),(30,5,NULL),(30,6,NULL),(30,9,0.75),(30,10,NULL),(31,5,NULL),(31,6,NULL),(31,9,0.95),(31,10,NULL),(32,5,NULL),(32,6,NULL),(32,9,1.20),(32,10,NULL),(33,5,NULL),(33,6,NULL),(33,9,1.50),(33,10,NULL),(34,5,NULL),(34,6,NULL),(34,9,2.00),(34,10,NULL),(35,5,NULL),(35,6,NULL),(35,9,0.55),(35,10,NULL),(36,5,NULL),(36,6,NULL),(36,9,0.75),(36,10,NULL),(37,5,NULL),(37,6,NULL),(37,9,0.95),(37,10,NULL),(38,5,NULL),(38,6,NULL),(39,9,1.20),(39,10,NULL),(40,5,NULL),(40,6,NULL),(40,9,2.00),(40,10,NULL),(41,5,NULL),(41,10,NULL),(42,5,NULL),(42,10,NULL),(43,5,NULL),(43,10,NULL),(44,5,NULL),(44,10,NULL),(45,5,NULL),(45,10,NULL),(46,5,NULL),(46,10,NULL),(47,5,NULL),(47,10,NULL),(48,5,NULL),(48,10,NULL),(49,5,NULL),(49,10,NULL),(50,5,NULL),(50,10,NULL),(51,5,NULL),(51,10,NULL),(52,5,NULL),(52,10,NULL),(53,5,NULL),(53,10,NULL),(54,5,NULL),(54,10,NULL),(55,5,NULL),(55,10,NULL),(56,5,NULL),(56,10,NULL),(57,5,NULL),(57,10,NULL),(58,5,NULL),(58,10,NULL),(59,5,NULL),(59,10,NULL),(60,5,NULL),(60,10,NULL),(61,5,NULL),(61,10,NULL),(62,5,NULL),(62,10,NULL),(63,5,NULL),(63,10,NULL),(64,5,NULL),(64,10,NULL),(65,5,NULL),(65,10,NULL),(66,5,NULL),(66,10,NULL),(67,5,NULL),(67,10,NULL),(68,5,NULL),(68,10,NULL),(69,5,NULL),(69,10,NULL),(70,5,NULL),(70,10,NULL),(71,5,NULL),(71,10,NULL),(72,5,NULL),(72,10,NULL),(73,5,NULL),(73,10,NULL),(74,5,NULL),(74,10,NULL),(75,5,NULL),(75,10,NULL),(76,5,NULL),(76,10,NULL),(77,5,NULL),(77,10,NULL),(78,5,NULL),(78,10,NULL),(79,5,NULL),(79,10,NULL),(80,5,NULL),(80,10,NULL),(81,5,NULL),(81,10,NULL),(82,5,NULL),(82,10,NULL),(83,5,NULL),(83,10,NULL),(84,5,NULL),(84,10,NULL),(85,5,NULL),(85,10,NULL),(86,5,NULL),(86,10,NULL),(87,5,NULL),(87,10,NULL),(88,5,NULL),(88,10,NULL),(89,5,NULL),(89,10,NULL),(90,5,NULL),(90,10,NULL),(91,5,NULL),(91,10,NULL),(92,5,NULL),(92,10,NULL),(93,5,NULL),(93,10,NULL),(94,5,NULL),(94,10,NULL),(95,5,NULL),(95,10,NULL),(96,5,NULL),(96,10,NULL),(97,5,NULL),(97,10,NULL),(98,5,NULL),(98,10,NULL),(99,5,NULL),(99,10,NULL),(100,5,NULL),(100,10,NULL),(101,5,NULL),(101,10,NULL),(102,5,NULL),(102,10,NULL),(103,5,NULL),(103,10,NULL),(104,5,NULL),(104,10,NULL),(105,5,NULL),(105,10,NULL),(106,5,NULL),(106,10,NULL),(107,5,NULL),(107,10,NULL),(108,5,NULL),(108,10,NULL),(109,5,NULL),(109,6,20.00),(109,9,1.60),(109,10,NULL),(110,5,NULL),(110,6,20.00),(110,9,2.00),(110,10,NULL),(111,5,NULL),(111,6,30.00),(111,9,1.60),(111,10,NULL),(112,5,NULL),(112,6,30.00),(112,9,2.00),(112,10,NULL),(113,5,NULL),(113,6,30.00),(113,9,2.50),(113,10,NULL),(114,5,NULL),(114,6,30.00),(114,9,3.00),(114,10,NULL),(116,5,NULL),(116,6,35.00),(116,9,1.60),(116,10,NULL),(117,5,NULL),(117,6,35.00),(117,9,2.00),(117,10,NULL),(118,5,NULL),(118,6,35.00),(118,9,2.50),(118,10,NULL),(119,5,NULL),(119,6,35.00),(119,9,3.00),(119,10,NULL),(120,5,NULL),(120,6,40.00),(120,9,1.60),(120,10,NULL),(121,5,NULL),(121,6,40.00),(121,9,2.00),(121,10,NULL),(122,5,NULL),(122,6,40.00),(122,9,2.50),(122,10,NULL),(123,5,NULL),(123,6,40.00),(123,9,3.00),(123,10,NULL),(124,5,NULL),(124,6,40.00),(124,9,4.00),(124,10,NULL),(125,5,NULL),(125,6,50.00),(125,9,1.60),(125,10,NULL),(126,5,NULL),(126,6,50.00),(126,9,2.00),(126,10,NULL),(127,5,NULL),(127,6,50.00),(127,9,2.50),(127,10,NULL),(128,5,NULL),(128,6,50.00),(128,9,3.00),(128,10,NULL),(129,5,NULL),(129,6,50.00),(129,9,4.00),(129,10,NULL),(130,5,NULL),(130,6,50.00),(130,9,5.00),(130,10,NULL),(131,5,NULL),(131,6,65.00),(131,9,1.60),(131,10,NULL),(132,5,NULL),(132,6,65.00),(132,9,2.00),(132,10,NULL),(133,5,NULL),(133,6,65.00),(133,9,2.50),(133,10,NULL),(134,5,NULL),(134,6,65.00),(134,9,3.00),(134,10,NULL),(135,5,NULL),(135,6,65.00),(135,9,4.00),(135,10,NULL),(136,5,NULL),(136,6,65.00),(136,9,5.00),(136,10,NULL),(137,5,NULL),(137,6,75.00),(137,9,2.00),(137,10,NULL),(138,5,NULL),(138,6,75.00),(138,9,2.50),(138,10,NULL),(139,5,NULL),(139,6,75.00),(139,9,3.00),(139,10,NULL),(140,5,NULL),(140,6,75.00),(140,9,4.00),(140,10,NULL),(141,5,NULL),(141,6,75.00),(141,9,5.00),(141,10,NULL),(142,5,NULL),(142,6,89.00),(142,9,2.00),(142,10,NULL),(143,5,NULL),(143,6,89.00),(143,9,3.50),(143,10,NULL),(144,5,NULL),(144,6,89.00),(144,9,5.00),(144,10,NULL),(145,5,NULL),(145,6,100.00),(145,9,2.50),(145,10,NULL),(146,5,NULL),(146,6,100.00),(146,9,3.00),(146,10,NULL),(147,5,NULL),(147,6,100.00),(147,9,4.00),(147,10,NULL),(148,5,NULL),(148,6,100.00),(148,9,5.00),(148,10,NULL),(162,5,120.00),(162,10,NULL),(166,5,NULL),(166,10,NULL),(167,5,NULL),(167,10,NULL),(168,5,NULL),(168,10,NULL);
/*!40000 ALTER TABLE `materials_has_measurement_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials_usage`
--

DROP TABLE IF EXISTS `materials_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `component_id` int(10) unsigned DEFAULT NULL,
  `materials_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `job_id` int(10) unsigned NOT NULL,
  `cost_price` decimal(8,2) DEFAULT NULL,
  `markup_percent` decimal(5,2) DEFAULT NULL,
  `sale_price` varchar(45) GENERATED ALWAYS AS ((`cost_price` * (1 + (`markup_percent` / 100)))) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `fk_materials_usage_component1_idx` (`component_id`),
  KEY `fk_materials_usage_materials1_idx` (`materials_id`),
  KEY `fk_materials_usage_users1_idx` (`users_id`),
  KEY `fk_materials)usage_jobs1_idx` (`job_id`),
  CONSTRAINT `fk_materials)usage_jobs1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_usage_component1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_usage_materials1` FOREIGN KEY (`materials_id`) REFERENCES `materials` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_usage_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials_usage`
--

LOCK TABLES `materials_usage` WRITE;
/*!40000 ALTER TABLE `materials_usage` DISABLE KEYS */;
INSERT INTO `materials_usage` (`id`, `date`, `component_id`, `materials_id`, `users_id`, `job_id`, `cost_price`, `markup_percent`) VALUES (46,'2016-12-04 04:30:48',NULL,1,4,7,NULL,NULL),(47,'2016-12-04 04:32:51',NULL,2,4,7,NULL,NULL),(48,'2016-12-04 04:42:54',NULL,2,4,7,NULL,NULL),(49,'2016-12-04 04:48:53',NULL,1,4,8,NULL,NULL),(50,'2016-12-04 04:51:35',NULL,2,4,7,NULL,NULL),(51,'2016-12-04 05:15:13',NULL,1,6,9,NULL,NULL),(52,'2016-12-04 09:22:02',NULL,1,4,7,NULL,NULL),(53,'2016-12-04 09:23:52',NULL,1,4,7,NULL,NULL),(54,'2016-12-04 09:28:36',NULL,1,4,7,NULL,NULL),(55,'2016-12-04 09:44:45',NULL,1,4,7,NULL,NULL),(56,'2016-12-04 09:49:03',NULL,1,6,11,NULL,NULL),(57,'2016-12-04 09:49:59',NULL,1,6,11,NULL,NULL),(58,'2016-12-04 09:53:16',NULL,1,4,7,NULL,NULL),(59,'2016-12-04 09:55:28',NULL,1,4,8,NULL,NULL),(60,'2016-12-04 10:13:59',NULL,1,5,9,NULL,NULL),(61,'2016-12-04 13:01:28',NULL,1,4,7,NULL,NULL),(62,'2016-12-04 13:03:51',NULL,1,4,7,NULL,NULL),(63,'2016-12-04 13:18:27',NULL,1,4,7,NULL,NULL),(64,'2016-12-04 13:19:36',NULL,1,4,7,NULL,NULL),(65,'2016-12-04 13:20:09',NULL,1,4,7,NULL,NULL),(66,'2016-12-04 13:30:05',NULL,1,4,7,NULL,NULL),(67,'2016-12-04 13:31:00',NULL,1,4,7,NULL,NULL),(68,'2016-12-04 13:34:34',NULL,2,4,7,NULL,NULL),(69,'2016-12-04 13:35:24',NULL,3,4,7,NULL,NULL),(70,'2016-12-04 13:35:44',NULL,3,4,7,NULL,NULL),(71,'2016-12-04 14:35:12',NULL,3,4,10,NULL,NULL),(72,'2016-12-04 15:33:38',NULL,3,4,7,NULL,NULL),(73,'2016-12-12 09:26:26',NULL,3,4,7,NULL,NULL),(74,'2016-12-12 09:27:39',NULL,1,4,7,NULL,NULL),(75,'2016-12-12 09:44:05',NULL,3,4,7,NULL,NULL),(76,'2017-01-08 14:11:43',NULL,3,4,7,NULL,NULL),(77,'2017-01-18 13:17:36',NULL,4,8,8,NULL,NULL),(78,'2017-01-19 09:09:27',NULL,3,4,7,NULL,NULL),(79,'2017-01-19 09:10:55',NULL,1,4,7,NULL,NULL),(80,'2017-01-19 09:11:41',NULL,1,4,7,NULL,NULL),(81,'2017-01-19 09:13:48',NULL,4,4,7,NULL,NULL),(82,'2017-01-19 09:44:03',NULL,1,4,7,NULL,NULL),(83,'2017-01-19 09:45:23',NULL,1,4,7,NULL,NULL),(84,'2017-01-19 09:57:36',NULL,1,4,7,NULL,NULL),(85,'2017-01-21 11:43:46',NULL,1,4,7,NULL,NULL),(86,'2017-01-21 11:51:02',NULL,1,4,7,NULL,NULL),(87,'2017-01-21 11:52:38',NULL,1,8,7,NULL,NULL),(88,'2017-01-21 11:56:04',NULL,1,4,7,NULL,NULL),(89,'2017-01-21 11:58:15',NULL,1,4,7,NULL,NULL),(90,'2017-01-21 11:59:12',NULL,1,4,7,NULL,NULL),(91,'2017-01-21 11:59:39',NULL,1,4,7,NULL,NULL),(92,'2017-01-21 12:00:15',NULL,1,4,8,NULL,NULL),(93,'2017-01-21 12:00:40',NULL,1,4,9,NULL,NULL),(94,'2017-01-21 12:01:08',NULL,4,4,9,NULL,NULL),(95,'2017-01-21 12:01:38',NULL,4,4,9,NULL,NULL),(96,'2017-01-21 12:56:48',NULL,1,4,7,NULL,NULL),(97,'2017-01-21 12:58:04',NULL,1,4,7,NULL,NULL),(98,'2017-01-22 04:18:57',NULL,1,4,7,NULL,NULL),(99,'2017-01-22 09:54:54',NULL,1,10,7,NULL,NULL),(100,'2017-01-22 09:55:26',NULL,1,10,7,NULL,NULL),(101,'2017-01-22 09:59:46',NULL,1,11,8,NULL,NULL),(102,'2017-01-22 10:08:59',NULL,1,12,8,NULL,NULL),(103,'2017-01-22 10:10:31',NULL,2,7,11,NULL,NULL),(104,'2017-01-22 10:12:01',NULL,2,11,9,NULL,NULL),(105,'2017-01-22 10:12:28',NULL,1,8,11,NULL,NULL),(106,'2017-01-22 11:15:36',NULL,28,5,8,NULL,NULL),(107,'2017-01-22 11:18:02',NULL,16,6,8,NULL,NULL),(108,'2017-01-22 11:18:52',NULL,22,6,9,NULL,NULL),(109,'2017-01-22 11:19:25',NULL,15,6,9,NULL,NULL),(110,'2017-01-22 17:05:34',NULL,22,5,8,NULL,NULL),(111,'2017-01-24 10:10:27',NULL,33,11,8,NULL,NULL),(112,'2017-01-24 10:14:28',NULL,12,5,9,NULL,NULL),(113,'2017-01-29 01:39:23',NULL,31,4,7,NULL,NULL),(114,'2017-01-29 01:54:25',NULL,12,4,8,NULL,NULL),(115,'2017-04-17 02:12:42',NULL,1,4,7,NULL,NULL),(116,'2017-04-25 01:43:47',NULL,106,4,7,NULL,NULL),(117,'2017-06-15 12:01:45',NULL,1,4,7,NULL,NULL),(118,'2017-06-18 02:56:04',NULL,1,4,7,52.00,12.00),(119,'2017-06-24 11:41:42',NULL,41,4,11,16.80,15.00),(120,'2017-06-24 12:12:20',NULL,166,6,12,7.45,12.50),(121,'2017-06-24 12:35:06',NULL,167,6,12,13.06,12.50),(122,'2017-06-24 12:35:33',NULL,168,6,12,26.80,12.50),(123,'2017-06-24 12:55:50',NULL,137,6,12,52.00,12.00),(124,'2017-07-06 01:57:02',NULL,19,5,13,22.00,15.00),(125,'2017-08-10 03:13:50',NULL,166,7,34,7.45,12.50),(126,'2017-08-10 03:16:00',NULL,40,6,34,22.00,15.00),(127,'2017-08-10 03:17:39',NULL,16,5,34,22.00,15.00),(128,'2017-08-10 03:19:46',NULL,16,5,34,22.00,15.00),(129,'2017-08-10 03:45:38',NULL,70,12,35,28.08,15.00),(130,'2017-08-10 03:47:13',NULL,3,4,35,52.00,12.00),(131,'2017-08-10 03:58:50',NULL,162,7,14,0.09,100.00),(132,'2017-08-11 03:43:31',NULL,1,7,22,52.00,12.00),(133,'2017-08-13 22:37:58',NULL,19,4,13,22.00,15.00),(134,'2017-09-28 03:46:23',NULL,121,12,35,3.96,30.00),(135,'2017-09-28 03:48:57',NULL,121,12,35,3.96,30.00);
/*!40000 ALTER TABLE `materials_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials_usage_has_measurement_properties`
--

DROP TABLE IF EXISTS `materials_usage_has_measurement_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials_usage_has_measurement_properties` (
  `materials_usage_id` int(10) unsigned NOT NULL,
  `measurement_properties_id` int(10) unsigned NOT NULL,
  `measurement` decimal(8,2) unsigned NOT NULL,
  PRIMARY KEY (`materials_usage_id`,`measurement_properties_id`),
  KEY `fk_materials_usage_has_measurement_properties_materials_usa_idx` (`materials_usage_id`),
  KEY `fk_materials_usage_has_measurement_properties_measurement_p_idx` (`measurement_properties_id`),
  CONSTRAINT `fk_materials_usage_has_measurement_properties_materials_usage1` FOREIGN KEY (`materials_usage_id`) REFERENCES `materials_usage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_usage_has_measurement_properties_measurement_pro1` FOREIGN KEY (`measurement_properties_id`) REFERENCES `measurement_properties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials_usage_has_measurement_properties`
--

LOCK TABLES `materials_usage_has_measurement_properties` WRITE;
/*!40000 ALTER TABLE `materials_usage_has_measurement_properties` DISABLE KEYS */;
INSERT INTO `materials_usage_has_measurement_properties` VALUES (46,5,100.00),(46,10,1.00),(47,5,110.00),(47,10,1.00),(48,5,110.00),(48,10,1.00),(49,5,120.00),(49,10,3.00),(50,5,56.00),(50,10,3.00),(51,5,120.00),(51,10,1.00),(52,5,7.00),(52,10,3.00),(53,5,6.00),(53,10,3.00),(54,5,5.00),(54,10,3.00),(55,5,3.00),(55,10,6.00),(56,5,5.00),(56,10,6.00),(57,5,5.00),(57,10,6.00),(58,5,6.00),(58,10,6.00),(59,5,6.00),(59,10,9.00),(60,5,6.00),(60,10,3.00),(61,5,8.00),(61,10,6.00),(62,5,86.00),(62,10,3.00),(63,5,9.00),(63,10,6.00),(64,5,6.00),(64,10,6.00),(65,5,9.00),(65,10,6.00),(66,5,5.00),(66,10,6.00),(67,5,5.00),(67,10,6.00),(68,5,6.00),(68,10,3.00),(69,5,8.00),(69,10,3.00),(70,5,8.00),(70,10,3.00),(71,5,120.00),(71,10,1.00),(72,5,9.00),(72,10,3.00),(73,5,100.00),(73,10,1.00),(74,5,100.00),(74,10,3.00),(75,5,120.00),(75,10,3.00),(76,5,140.00),(76,10,1.00),(77,5,100.00),(77,10,1.00),(78,5,10.00),(78,10,2.00),(79,5,7.00),(79,10,9.00),(80,5,1.00),(80,10,1.00),(81,5,9.00),(81,10,9.00),(82,5,8.00),(82,10,6.00),(83,5,99.00),(83,10,6.00),(84,5,8.00),(84,10,9.00),(85,5,2.00),(85,10,3.00),(86,5,7.00),(86,10,6.00),(87,5,3.00),(87,10,3.00),(88,5,3.00),(88,10,3.00),(89,5,9.00),(89,10,6.00),(90,5,1000.00),(90,10,3.00),(91,5,99.00),(91,10,9.00),(92,5,3.00),(92,10,3.00),(93,5,3.00),(93,10,3.00),(94,5,1.00),(94,10,9.00),(95,5,9.00),(95,10,999.00),(96,5,1.00),(96,10,3.00),(97,5,1.00),(97,10,6.00),(98,5,3.00),(98,10,3.00),(99,5,2.00),(99,10,2.00),(100,5,6.00),(100,10,6.00),(101,5,6.00),(101,10,6.00),(102,5,9.00),(102,10,9.00),(103,5,3.00),(103,10,3.00),(104,5,6.00),(104,10,6.00),(105,5,9.00),(105,10,999.00),(106,5,8.00),(106,6,6.00),(106,10,3.00),(107,5,63.00),(107,6,8.00),(107,10,6.00),(108,5,3.00),(108,6,2.00),(108,10,1.00),(109,5,3.00),(109,6,2.00),(109,10,1.00),(110,5,6.00),(110,6,3.00),(110,10,1.00),(111,5,10.00),(111,6,3.00),(111,10,1.00),(112,5,6.00),(112,6,3.00),(112,10,1.00),(114,5,100.00),(114,6,2.00),(114,10,3.00),(115,5,8.00),(115,10,6.00),(116,5,70.00),(117,5,7.00),(117,10,5.00),(118,5,100.00),(118,10,2.00),(119,5,125.00),(119,10,1.00),(120,5,3.85),(120,10,21.00),(121,5,3.85),(121,10,2.00),(122,5,11.80),(122,10,2.00),(123,5,11.80),(123,10,2.00),(125,5,2000.00),(125,10,2.00),(126,5,1200.00),(126,6,1000.00),(126,10,2.00),(127,5,1.00),(127,6,1.00),(127,10,2.00),(129,5,3.00),(129,10,10.00),(130,5,1285.00),(130,10,1.00),(131,10,1.00),(132,5,77.00),(132,10,45.00),(134,5,2000.00),(134,10,1.00),(135,5,1000.00),(135,10,1.00);
/*!40000 ALTER TABLE `materials_usage_has_measurement_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement_properties`
--

DROP TABLE IF EXISTS `measurement_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement_properties`
--

LOCK TABLES `measurement_properties` WRITE;
/*!40000 ALTER TABLE `measurement_properties` DISABLE KEYS */;
INSERT INTO `measurement_properties` VALUES (5,'Length'),(6,'Width'),(7,'Depth'),(8,'Diameter'),(9,'Thickness'),(10,'Quantity');
/*!40000 ALTER TABLE `measurement_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_types`
--

DROP TABLE IF EXISTS `operation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `UnitOfMeasure` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_types`
--

LOCK TABLES `operation_types` WRITE;
/*!40000 ALTER TABLE `operation_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `cost_price` decimal(5,2) NOT NULL DEFAULT '0.00',
  `markup_percent` decimal(5,2) NOT NULL DEFAULT '0.00',
  `sale_price` varchar(45) GENERATED ALWAYS AS ((`cost_price` * (1 + (`markup_percent` / 100)))) VIRTUAL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations_log`
--

DROP TABLE IF EXISTS `operations_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qty` int(11) NOT NULL DEFAULT '0',
  `components_id` int(10) unsigned NOT NULL,
  `operations_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_operations_log_components1_idx` (`components_id`),
  KEY `fk_operations_log_operations1_idx` (`operations_id`),
  KEY `fk_operations_log_users1_idx` (`users_id`),
  CONSTRAINT `fk_operations_log_components1` FOREIGN KEY (`components_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_operations_log_operations1` FOREIGN KEY (`operations_id`) REFERENCES `operations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_operations_log_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations_log`
--

LOCK TABLES `operations_log` WRITE;
/*!40000 ALTER TABLE `operations_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `operations_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_line_items`
--

DROP TABLE IF EXISTS `purchase_order_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_line_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL,
  `materials_id` int(10) unsigned NOT NULL,
  `purchase_orders_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`purchase_orders_id`),
  KEY `fk_purchase_order_line_items_materials1_idx` (`materials_id`),
  KEY `fk_purchase_order_line_items_purchase_orders1_idx` (`purchase_orders_id`),
  CONSTRAINT `fk_purchase_order_line_items_materials1` FOREIGN KEY (`materials_id`) REFERENCES `materials` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_line_items_purchase_orders1` FOREIGN KEY (`purchase_orders_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_line_items`
--

LOCK TABLES `purchase_order_line_items` WRITE;
/*!40000 ALTER TABLE `purchase_order_line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_status`
--

DROP TABLE IF EXISTS `purchase_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_status`
--

LOCK TABLES `purchase_order_status` WRITE;
/*!40000 ALTER TABLE `purchase_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notes` varchar(45) DEFAULT NULL,
  `suppliers_id` int(10) unsigned NOT NULL,
  `purchase_order_status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_purchase_orders_suppliers1_idx` (`suppliers_id`),
  KEY `fk_purchase_orders_purchase_order_status1_idx` (`purchase_order_status_id`),
  CONSTRAINT `fk_purchase_orders_purchase_order_status1` FOREIGN KEY (`purchase_order_status_id`) REFERENCES `purchase_order_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_orders_suppliers1` FOREIGN KEY (`suppliers_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_orders`
--

LOCK TABLES `purchase_orders` WRITE;
/*!40000 ALTER TABLE `purchase_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_contacts`
--

DROP TABLE IF EXISTS `supplier_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `suppliers_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplier_contacts_suppliers1_idx` (`suppliers_id`),
  CONSTRAINT `fk_supplier_contacts_suppliers1` FOREIGN KEY (`suppliers_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_contacts`
--

LOCK TABLES `supplier_contacts` WRITE;
/*!40000 ALTER TABLE `supplier_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `address3` varchar(45) DEFAULT NULL,
  `notes` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (4,'Admin'),(5,'Office'),(6,'Engineer');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `user_types_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_user_types1_idx` (`user_types_id`),
  CONSTRAINT `fk_users_user_types1` FOREIGN KEY (`user_types_id`) REFERENCES `user_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Bill','Smith',NULL,NULL,6),(5,'Jim','Jones',NULL,NULL,6),(6,'Ted','Test',NULL,NULL,6),(7,'Ronald','McDonald',NULL,NULL,6),(8,'Danny','Dog',NULL,NULL,6),(9,'Simon','Thomas',NULL,NULL,4),(10,'Jane','Smith',NULL,NULL,6),(11,'Timmy','Time',NULL,NULL,6),(12,'Norm','Robertson',NULL,NULL,6),(14,'Jill','Recept',NULL,NULL,5);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-03 10:00:49
