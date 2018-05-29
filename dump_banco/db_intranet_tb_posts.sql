-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_intranet
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `tb_posts`
--

DROP TABLE IF EXISTS `tb_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_posts` (
  `idpost` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(264) NOT NULL,
  `autor` varchar(64) NOT NULL,
  `texto` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `dtpost` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpost`),
  KEY `FK_posts_users_idx` (`id_user`),
  CONSTRAINT `fk_posts_users` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_posts`
--

LOCK TABLES `tb_posts` WRITE;
/*!40000 ALTER TABLE `tb_posts` DISABLE KEYS */;
INSERT INTO `tb_posts` VALUES (1,'Lorem Ipsum','Thiago','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse hendrerit ultrices condimentum. Proin turpis magna, iaculis sed metus et, feugiat faucibus dui. Donec pretium iaculis malesuada. Quisque imperdiet iaculis interdum. Cras eget diam velit. Ut urna justo, tincidunt id turpis nec, dignissim hendrerit dui. Sed ac lacus feugiat, iaculis turpis vel, finibus justo. Pellentesque commodo elit ac mauris sagittis iaculis.',2,'2018-05-28 00:34:20');
/*!40000 ALTER TABLE `tb_posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-29  0:48:12
