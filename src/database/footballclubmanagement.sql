-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: footballclubmanagement
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisements` (
  `ad_id` int NOT NULL AUTO_INCREMENT,
  `sponsor_id` int DEFAULT NULL,
  `ad_type` varchar(50) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(15,2) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'active',
  `notes` text,
  PRIMARY KEY (`ad_id`),
  KEY `sponsor_id` (`sponsor_id`),
  CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`sponsor_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisements`
--

LOCK TABLES `advertisements` WRITE;
/*!40000 ALTER TABLE `advertisements` DISABLE KEYS */;
INSERT INTO `advertisements` VALUES (1,1,'jersey','Áo đấu chính thức','2023-01-01','2024-12-31',300000.00,'active',NULL),(2,2,'banner','Sân vận động Mỹ Đình','2023-01-01','2024-12-31',150000.00,'active',NULL),(3,3,'website','Trang web chính thức VFF','2023-01-01','2023-12-31',80000.00,'active',NULL),(4,4,'led','Sân vận động Mỹ Đình','2023-01-01','2025-12-31',200000.00,'active',NULL),(5,5,'nutrition','Thực đơn dinh dưỡng đội tuyển','2023-03-01','2024-02-28',100000.00,'active',NULL),(6,6,'social_media','Kênh truyền thông chính thức','2023-02-01','2024-01-31',120000.00,'active',NULL);
/*!40000 ALTER TABLE `advertisements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finances`
--

DROP TABLE IF EXISTS `finances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finances` (
  `finance_id` int NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(30) NOT NULL,
  `category` varchar(50) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `description` text,
  `sponsor_id` int DEFAULT NULL,
  `match_id` int DEFAULT NULL,
  `document_ref` varchar(100) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT 'completed',
  PRIMARY KEY (`finance_id`),
  KEY `sponsor_id` (`sponsor_id`),
  KEY `match_id` (`match_id`),
  KEY `idx_finance_transaction_type` (`transaction_type`),
  KEY `idx_finance_category` (`category`),
  CONSTRAINT `finances_ibfk_1` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsors` (`sponsor_id`) ON DELETE SET NULL,
  CONSTRAINT `finances_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finances`
--

LOCK TABLES `finances` WRITE;
/*!40000 ALTER TABLE `finances` DISABLE KEYS */;
INSERT INTO `finances` VALUES (1,'2023-01-15','income','sponsorship',125000.00,'Thanh toán quý 1 - Grand Sport',1,NULL,NULL,'completed'),(2,'2023-01-15','income','sponsorship',200000.00,'Thanh toán quý 1 - Yanmar',2,NULL,NULL,'completed'),(3,'2023-01-20','income','sponsorship',75000.00,'Thanh toán quý 1 - Acecook',3,NULL,NULL,'completed'),(4,'2023-01-20','income','sponsorship',175000.00,'Thanh toán quý 1 - Sony',4,NULL,NULL,'completed'),(5,'2023-03-05','income','sponsorship',112500.00,'Thanh toán quý 1 - Vinamilk',5,NULL,NULL,'completed'),(6,'2023-02-10','income','sponsorship',150000.00,'Thanh toán quý 1 - ViettelPay',6,NULL,NULL,'completed'),(7,'2023-01-30','expense','salary',197000.00,'Lương tháng 1/2023 - Cầu thủ & HLV',NULL,NULL,NULL,'completed'),(8,'2023-02-28','expense','salary',197000.00,'Lương tháng 2/2023 - Cầu thủ & HLV',NULL,NULL,NULL,'completed'),(9,'2023-03-30','expense','salary',197000.00,'Lương tháng 3/2023 - Cầu thủ & HLV',NULL,NULL,NULL,'completed'),(10,'2023-01-05','expense','equipment',50000.00,'Trang thiết bị tập luyện',NULL,NULL,NULL,'completed'),(11,'2023-02-15','expense','travel',35000.00,'Chi phí di chuyển - Trận Malaysia',NULL,NULL,NULL,'completed'),(12,'2023-03-10','expense','travel',45000.00,'Chi phí di chuyển - Trận Iraq',NULL,NULL,NULL,'completed'),(13,'2023-01-25','expense','medical',15000.00,'Chi phí y tế tháng 1/2023',NULL,NULL,NULL,'completed'),(14,'2023-02-25','expense','medical',18000.00,'Chi phí y tế tháng 2/2023',NULL,NULL,NULL,'completed'),(15,'2023-03-25','expense','medical',12000.00,'Chi phí y tế tháng 3/2023',NULL,NULL,NULL,'completed'),(16,'2023-04-15','income','sponsorship',125000.00,'Thanh toán quý 2 - Grand Sport',1,NULL,NULL,'completed'),(17,'2023-04-15','income','sponsorship',200000.00,'Thanh toán quý 2 - Yanmar',2,NULL,NULL,'completed'),(18,'2023-04-20','income','sponsorship',75000.00,'Thanh toán quý 2 - Acecook',3,NULL,NULL,'completed'),(19,'2023-04-20','income','sponsorship',175000.00,'Thanh toán quý 2 - Sony',4,NULL,NULL,'completed'),(20,'2023-06-05','income','sponsorship',112500.00,'Thanh toán quý 2 - Vinamilk',5,NULL,NULL,'completed'),(21,'2023-05-10','income','sponsorship',150000.00,'Thanh toán quý 2 - ViettelPay',6,NULL,NULL,'completed'),(22,'2023-04-30','expense','salary',197000.00,'Lương tháng 4/2023 - Cầu thủ & HLV',NULL,NULL,NULL,'completed'),(23,'2023-05-30','expense','salary',197000.00,'Lương tháng 5/2023 - Cầu thủ & HLV',NULL,NULL,NULL,'completed'),(24,'2023-06-30','expense','salary',197000.00,'Lương tháng 6/2023 - Cầu thủ & HLV',NULL,NULL,NULL,'completed'),(25,'2023-06-01','expense','travel',60000.00,'Chi phí di chuyển - Trận Afghanistan',NULL,NULL,NULL,'completed'),(26,'2023-07-15','income','sponsorship',125000.00,'Thanh toán quý 3 - Grand Sport',1,NULL,NULL,'completed'),(27,'2023-07-15','income','sponsorship',200000.00,'Thanh toán quý 3 - Yanmar',2,NULL,NULL,'completed'),(28,'2023-07-20','income','sponsorship',75000.00,'Thanh toán quý 3 - Acecook',3,NULL,NULL,'completed'),(29,'2023-07-20','income','sponsorship',175000.00,'Thanh toán quý 3 - Sony',4,NULL,NULL,'completed'),(30,'2023-09-05','income','sponsorship',112500.00,'Thanh toán quý 3 - Vinamilk',5,NULL,NULL,'completed'),(31,'2023-08-10','income','sponsorship',150000.00,'Thanh toán quý 3 - ViettelPay',6,NULL,NULL,'completed');
/*!40000 ALTER TABLE `finances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `opponent_name` varchar(100) NOT NULL,
  `match_date` datetime NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `competition` varchar(100) DEFAULT NULL,
  `result` varchar(20) DEFAULT NULL,
  `goals_scored` int DEFAULT '0',
  `goals_conceded` int DEFAULT '0',
  `match_status` varchar(30) DEFAULT 'scheduled',
  `notes` text,
  PRIMARY KEY (`match_id`),
  KEY `idx_match_date` (`match_date`),
  KEY `idx_match_status` (`match_status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'Indonesia','2023-01-03 19:30:00','Sân vận động Mỹ Đình, Hà Nội','AFF Cup 2022','win',2,0,'completed',NULL),(2,'Philippines','2023-01-06 19:30:00','Sân vận động Mỹ Đình, Hà Nội','AFF Cup 2022','win',3,0,'completed',NULL),(3,'Malaysia','2023-01-10 19:30:00','Sân vận động Bukit Jalil, Kuala Lumpur','AFF Cup 2022','draw',2,2,'completed',NULL),(4,'Thailand','2023-01-13 19:30:00','Sân vận động Thammasat, Bangkok','AFF Cup 2022','loss',0,2,'completed',NULL),(5,'Iraq','2023-03-21 20:00:00','Sân vận động Al Madina, Basra','Giao hữu quốc tế','loss',1,2,'completed',NULL),(6,'Philippines','2023-03-24 19:00:00','Sân vận động Mỹ Đình, Hà Nội','Giao hữu quốc tế','win',2,0,'completed',NULL),(7,'Afghanistan','2023-06-16 20:00:00','Sân vận động Jassim Bin Hamad, Doha','Vòng loại World Cup 2026','draw',1,1,'completed',NULL),(8,'Hong Kong','2023-09-07 19:00:00','Sân vận động Mỹ Đình, Hà Nội','Vòng loại World Cup 2026','win',3,0,'completed',NULL),(9,'Indonesia','2023-10-10 19:30:00','Sân vận động Gelora Bung Karno, Jakarta','Vòng loại World Cup 2026','loss',0,1,'completed',NULL),(10,'Iraq','2023-11-16 19:00:00','Sân vận động Mỹ Đình, Hà Nội','Vòng loại World Cup 2026','loss',0,1,'completed',NULL),(11,'Philippines','2024-01-21 19:00:00','Sân vận động Rizal Memorial, Manila','Vòng loại World Cup 2026','win',2,0,'completed',NULL),(12,'Indonesia','2024-01-25 19:00:00','Sân vận động Mỹ Đình, Hà Nội','Vòng loại World Cup 2026','win',1,0,'completed',NULL),(13,'Iraq','2024-03-21 15:00:00','Sân vận động Al Madina, Basra','Vòng loại World Cup 2026','scheduled',0,0,'scheduled',NULL),(14,'Afghanistan','2024-03-26 19:00:00','Sân vận động Mỹ Đình, Hà Nội','Vòng loại World Cup 2026','scheduled',0,0,'scheduled',NULL);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchstatistics`
--

DROP TABLE IF EXISTS `matchstatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchstatistics` (
  `stat_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `possession` int DEFAULT NULL,
  `shots` int DEFAULT '0',
  `shots_on_target` int DEFAULT '0',
  `corners` int DEFAULT '0',
  `fouls` int DEFAULT '0',
  `yellow_cards` int DEFAULT '0',
  `red_cards` int DEFAULT '0',
  `notes` text,
  PRIMARY KEY (`stat_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `matchstatistics_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchstatistics`
--

LOCK TABLES `matchstatistics` WRITE;
/*!40000 ALTER TABLE `matchstatistics` DISABLE KEYS */;
INSERT INTO `matchstatistics` VALUES (1,1,65,15,8,7,10,1,0,NULL),(2,2,70,18,10,8,8,2,0,NULL),(3,3,48,12,6,5,13,3,0,NULL),(4,4,42,8,3,4,12,2,0,NULL),(5,5,40,7,4,3,14,1,0,NULL),(6,6,60,14,9,6,10,0,0,NULL),(7,7,52,10,5,4,11,2,0,NULL),(8,8,68,16,11,9,7,1,0,NULL),(9,9,45,9,3,5,15,3,1,NULL),(10,10,46,8,2,6,12,2,0,NULL),(11,11,55,12,7,5,9,1,0,NULL),(12,12,54,11,6,7,10,2,0,NULL);
/*!40000 ALTER TABLE `matchstatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `role` varchar(30) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `contract_status` varchar(30) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `user_id` (`user_id`),
  KEY `idx_member_role` (`role`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Troussier Philippe','1955-03-21','Pháp',NULL,'coach','0909123456','troussier@vnff.com.vn','2023-02-01','active',3),(2,'Đinh Thế Nam','1980-05-15','Việt Nam',NULL,'assistant','0909123457','thenam@vnff.com.vn','2023-02-01','active',NULL),(3,'Nguyễn Đức Cảnh','1982-07-20','Việt Nam',NULL,'assistant','0909123458','duccanh@vnff.com.vn','2023-03-15','active',NULL),(4,'Trần Minh Quang','1978-11-10','Việt Nam',NULL,'fitness','0909123459','minhquang@vnff.com.vn','2023-04-01','active',NULL),(5,'Nguyễn Văn Phú','1985-02-28','Việt Nam',NULL,'goalkeeper_coach','0909123460','vanphu@vnff.com.vn','2023-02-15','active',NULL),(6,'Đặng Văn Lâm','1993-08-13','Việt Nam','goalkeeper','player','0909123461','vanlam@vnff.com.vn','2018-01-10','active',NULL),(7,'Nguyễn Filip Nguyên','1992-09-14','Việt Nam','goalkeeper','player','0909123462','filipnguyen@vnff.com.vn','2022-10-01','active',NULL),(8,'Bùi Tấn Trường','1986-02-19','Việt Nam','goalkeeper','player','0909123463','tantruong@vnff.com.vn','2019-03-01','active',NULL),(9,'Quế Ngọc Hải','1993-05-15','Việt Nam','defender','player','0909123464','ngochai@vnff.com.vn','2015-01-01','active',NULL),(10,'Đỗ Duy Mạnh','1996-09-29','Việt Nam','defender','player','0909123465','duymanh@vnff.com.vn','2015-02-15','active',NULL),(11,'Nguyễn Thành Chung','1997-10-08','Việt Nam','defender','player','0909123466','thanhchung@vnff.com.vn','2017-01-15','active',NULL),(12,'Bùi Tiến Dũng','1995-10-02','Việt Nam','defender','player','0909123467','buitiendung@vnff.com.vn','2017-02-20','active',NULL),(13,'Vũ Văn Thanh','1996-04-14','Việt Nam','defender','player','0909123468','vanthanh@vnff.com.vn','2016-03-10','active',NULL),(14,'Nguyễn Phong Hồng Duy','1996-06-13','Việt Nam','defender','player','0909123469','hongduy@vnff.com.vn','2016-04-05','active',NULL),(15,'Hồ Tấn Tài','1997-11-05','Việt Nam','defender','player','0909123470','tantai@vnff.com.vn','2019-09-01','active',NULL),(16,'Đoàn Văn Hậu','1999-04-19','Việt Nam','defender','player','0909123471','vanhau@vnff.com.vn','2017-03-01','active',NULL),(17,'Nguyễn Quang Hải','1997-04-12','Việt Nam','midfielder','player','0909123472','quanghai@vnff.com.vn','2015-03-15','active',NULL),(18,'Đỗ Hùng Dũng','1993-09-08','Việt Nam','midfielder','player','0909123473','hungdung@vnff.com.vn','2015-04-10','active',NULL),(19,'Lương Xuân Trường','1995-04-28','Việt Nam','midfielder','player','0909123474','xuantruong@vnff.com.vn','2015-05-05','active',NULL),(20,'Phạm Đức Huy','1995-01-20','Việt Nam','midfielder','player','0909123475','duchuy@vnff.com.vn','2015-06-01','active',NULL),(21,'Nguyễn Hoàng Đức','1998-01-11','Việt Nam','midfielder','player','0909123476','hoangduc@vnff.com.vn','2019-09-15','active',NULL),(22,'Nguyễn Tuấn Anh','1995-05-16','Việt Nam','midfielder','player','0909123477','tuananh@vnff.com.vn','2015-07-10','active',NULL),(23,'Phan Văn Đức','1996-04-11','Việt Nam','midfielder','player','0909123478','vanduc@vnff.com.vn','2017-05-01','active',NULL),(24,'Nguyễn Văn Toàn','1996-04-12','Việt Nam','forward','player','0909123479','vantoan@vnff.com.vn','2016-06-15','active',NULL),(25,'Nguyễn Công Phượng','1995-01-21','Việt Nam','forward','player','0909123480','congphuong@vnff.com.vn','2015-08-01','active',NULL),(26,'Nguyễn Tiến Linh','1997-10-20','Việt Nam','forward','player','0909123481','tienlinh@vnff.com.vn','2018-03-15','active',NULL),(27,'Phạm Tuấn Hải','1998-02-06','Việt Nam','forward','player','0909123482','tuanhai@vnff.com.vn','2021-10-01','active',NULL),(28,'Nguyễn Văn Quyết','1991-07-01','Việt Nam','forward','player','0909123483','vanquyet@vnff.com.vn','2014-01-10','active',NULL),(34,'HUy','2006-08-09','Việt','goalkeeper','player','8219','nsd','2025-05-15','active',NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstatistics`
--

DROP TABLE IF EXISTS `playerstatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerstatistics` (
  `stat_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `match_id` int NOT NULL,
  `goals` int DEFAULT '0',
  `assists` int DEFAULT '0',
  `minutes_played` int DEFAULT '0',
  `yellow_cards` int DEFAULT '0',
  `red_cards` int DEFAULT '0',
  `shots` int DEFAULT '0',
  `shots_on_target` int DEFAULT '0',
  `passes` int DEFAULT '0',
  `tackles` int DEFAULT '0',
  `saves` int DEFAULT '0',
  `rating` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`stat_id`),
  KEY `member_id` (`member_id`),
  KEY `match_id` (`match_id`),
  KEY `idx_player_stats_goals` (`goals`),
  KEY `idx_player_stats_assists` (`assists`),
  CONSTRAINT `playerstatistics_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `playerstatistics_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstatistics`
--

LOCK TABLES `playerstatistics` WRITE;
/*!40000 ALTER TABLE `playerstatistics` DISABLE KEYS */;
INSERT INTO `playerstatistics` VALUES (1,6,11,0,0,90,0,0,0,0,28,0,4,7.5),(2,9,11,0,0,90,0,0,1,0,52,3,0,7.0),(3,10,11,0,0,90,0,0,0,0,65,5,0,7.2),(4,11,11,0,0,90,1,0,0,0,60,4,0,6.8),(5,13,11,0,1,90,0,0,1,1,48,2,0,7.5),(6,15,11,0,0,85,0,0,1,0,70,6,0,7.3),(7,16,11,1,0,90,0,0,2,1,65,2,0,8.2),(8,14,11,0,1,75,0,0,2,1,55,3,0,7.8),(9,18,11,0,0,70,0,0,3,2,40,1,0,7.4),(10,20,11,1,0,80,0,0,3,2,25,0,0,8.0),(11,22,11,0,0,65,0,0,2,1,20,0,0,6.5),(12,19,11,0,0,25,0,0,0,0,15,1,0,6.5),(13,21,11,0,0,15,0,0,0,0,10,0,0,6.0),(14,23,11,0,0,25,0,0,0,0,12,0,0,6.0);
/*!40000 ALTER TABLE `playerstatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsors` (
  `sponsor_id` int NOT NULL AUTO_INCREMENT,
  `sponsor_name` varchar(100) NOT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `contract_start` date DEFAULT NULL,
  `contract_end` date DEFAULT NULL,
  `contract_value` decimal(15,2) DEFAULT NULL,
  `status` varchar(30) DEFAULT 'active',
  `notes` text,
  PRIMARY KEY (`sponsor_id`),
  KEY `idx_sponsor_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` VALUES (1,'Grand Sport','Thể thao','Nguyễn Văn An','contact@grandsport.com','0901234567','2023-01-01','2024-12-31',500000.00,'active',NULL),(2,'Yanmar','Công nghiệp','Trần Bình','contact@yanmar.com','0912345678','2023-01-01','2024-12-31',800000.00,'active',NULL),(3,'Acecook','Thực phẩm','Lê Công','contact@acecook.com','0923456789','2023-01-01','2023-12-31',300000.00,'active',NULL),(4,'Sony','Điện tử','Phạm Dung','contact@sony.com','0934567890','2023-01-01','2025-12-31',700000.00,'active',NULL),(5,'Vinamilk','Thực phẩm','Hoàng Gia','contact@vinamilk.com','0945678901','2023-03-01','2024-02-28',450000.00,'active',NULL),(6,'ViettelPay','Viễn thông','Lý Hương','contact@viettelpay.com','0956789012','2023-02-01','2024-01-31',600000.00,'active',NULL);
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamlineups`
--

DROP TABLE IF EXISTS `teamlineups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teamlineups` (
  `lineup_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `team_id` int NOT NULL,
  `member_id` int NOT NULL,
  `position` varchar(50) DEFAULT NULL,
  `is_starting` tinyint(1) DEFAULT '0',
  `notes` text,
  PRIMARY KEY (`lineup_id`),
  KEY `match_id` (`match_id`),
  KEY `team_id` (`team_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `teamlineups_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`match_id`) ON DELETE CASCADE,
  CONSTRAINT `teamlineups_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE CASCADE,
  CONSTRAINT `teamlineups_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamlineups`
--

LOCK TABLES `teamlineups` WRITE;
/*!40000 ALTER TABLE `teamlineups` DISABLE KEYS */;
INSERT INTO `teamlineups` VALUES (1,11,1,6,'GK',1,NULL),(2,11,1,9,'RB',1,NULL),(3,11,1,10,'CB',1,NULL),(4,11,1,11,'CB',1,NULL),(5,11,1,13,'LB',1,NULL),(6,11,1,15,'DMF',1,NULL),(7,11,1,16,'CMF',1,NULL),(8,11,1,14,'CMF',1,NULL),(9,11,1,18,'AMF',1,NULL),(10,11,1,20,'CF',1,NULL),(11,11,1,22,'CF',1,NULL),(12,11,1,7,'GK',0,NULL),(13,11,1,12,'DF',0,NULL),(14,11,1,17,'MF',0,NULL),(15,11,1,19,'MF',0,NULL),(16,11,1,21,'FW',0,NULL),(17,11,1,23,'FW',0,NULL),(18,11,1,24,'MF',0,NULL);
/*!40000 ALTER TABLE `teamlineups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) NOT NULL,
  `team_type` varchar(50) NOT NULL,
  `description` text,
  `created_at` date DEFAULT (curdate()),
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Đội tuyển Việt Nam','first team','Đội tuyển quốc gia Việt Nam','2025-05-06'),(2,'U23 Việt Nam','youth','Đội tuyển U23 Việt Nam','2025-05-06'),(3,'U21 Việt Nam','youth','Đội tuyển U21 Việt Nam','2025-05-06'),(4,'Đội tuyển nữ Việt Nam','women','Đội tuyển bóng đá nữ quốc gia Việt Nam','2025-05-06');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','1234','admin@vnff.com.vn','admin','2025-05-06 15:53:35','2025-05-06 21:39:31',1),(2,'manager','1234','manager@vnff.com.vn','manager','2025-05-06 15:53:35','2025-05-07 21:27:29',1),(3,'coach','1234','coach@vnff.com.vn','staff','2025-05-06 15:53:35','2025-05-07 21:27:29',1),(4,'staff1','1234','staff1@vnff.com.vn','staff','2025-05-06 15:53:35','2025-05-07 21:27:29',1),(5,'staff2','1234','staff2@vnff.com.vn','staff','2025-05-06 15:53:35','2025-05-07 21:27:29',1);
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

-- Dump completed on 2025-05-15 14:22:57
