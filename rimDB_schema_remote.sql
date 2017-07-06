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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `fk_materials_material_types1_idx` (`material_types_id`),
  CONSTRAINT `fk_materials_material_types1` FOREIGN KEY (`material_types_id`) REFERENCES `material_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_materials_has_measurement_properties_materials1` FOREIGN KEY (`materials_id`) REFERENCES `materials` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_has_measurement_properties_measurement_properties1` FOREIGN KEY (`measurement_properties_id`) REFERENCES `measurement_properties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`id`),
  KEY `fk_materials_usage_component1_idx` (`component_id`),
  KEY `fk_materials_usage_materials1_idx` (`materials_id`),
  KEY `fk_materials_usage_users1_idx` (`users_id`),
  KEY `fk_materials)usage_jobs1_idx` (`job_id`),
  CONSTRAINT `fk_materials)usage_jobs1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_usage_component1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_usage_materials1` FOREIGN KEY (`materials_id`) REFERENCES `materials` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_materials_usage_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-25  2:35:13
