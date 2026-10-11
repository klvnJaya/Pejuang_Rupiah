-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pejuang_rupiah
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `pejuang_rupiah`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `pejuang_rupiah` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `pejuang_rupiah`;

--
-- Table structure for table `freelancer`
--

DROP TABLE IF EXISTS `freelancer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freelancer` (
  `id_freelancer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tanggal_bergabung` date NOT NULL,
  PRIMARY KEY (`id_freelancer`),
  UNIQUE KEY `uq_username` (`username`),
  UNIQUE KEY `uq_email_freelancer` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelancer`
--

LOCK TABLES `freelancer` WRITE;
/*!40000 ALTER TABLE `freelancer` DISABLE KEYS */;
INSERT INTO `freelancer` VALUES (1,'CreativeStudio','creativestudio@pejuangrupiah.id','2025-01-15'),(2,'WebDeveloperPro','webdeveloperpro@pejuangrupiah.id','2025-02-10'),(3,'GrowthExpert','growthexpert@pejuangrupiah.id','2025-03-05'),(4,'WordCraft','wordcraft@pejuangrupiah.id','2025-03-20'),(5,'VideoMaster','videomaster@pejuangrupiah.id','2025-04-12'),(6,'AICreator','aicreator@pejuangrupiah.id','2025-05-01');
/*!40000 ALTER TABLE `freelancer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id_kategori` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_kategori` varchar(20) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kategori`),
  UNIQUE KEY `uq_kode_kategori` (`kode_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'graphics','Graphics & Design'),(2,'programming','Programming & Tech'),(3,'marketing','Digital Marketing'),(4,'writing','Writing & Translation'),(5,'video','Video & Animation'),(6,'ai','AI Services');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layanan`
--

DROP TABLE IF EXISTS `layanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layanan` (
  `id_layanan` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_kategori` int(10) unsigned NOT NULL,
  `id_freelancer` int(10) unsigned NOT NULL,
  `judul` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `rating` decimal(2,1) NOT NULL DEFAULT 0.0,
  `harga_mulai` decimal(10,2) NOT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_layanan`),
  KEY `fk_layanan_kategori` (`id_kategori`),
  KEY `fk_layanan_freelancer` (`id_freelancer`),
  CONSTRAINT `fk_layanan_freelancer` FOREIGN KEY (`id_freelancer`) REFERENCES `freelancer` (`id_freelancer`) ON UPDATE CASCADE,
  CONSTRAINT `fk_layanan_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layanan`
--

LOCK TABLES `layanan` WRITE;
/*!40000 ALTER TABLE `layanan` DISABLE KEYS */;
INSERT INTO `layanan` VALUES (1,1,1,'Professional Logo Design','Jasa pembuatan logo profesional untuk membangun identitas bisnis Anda.',4.9,20.00,'img/logo.jpg'),(2,2,2,'Website Development','Jasa pembuatan website modern, responsif, dan sesuai kebutuhan bisnis.',4.8,60.00,'img/website.jpg'),(3,3,3,'Social Media Marketing','Strategi konten dan pemasaran media sosial untuk meningkatkan jangkauan bisnis.',4.9,25.00,'img/beranda.jpg'),(4,4,4,'Article & Copywriting','Penulisan artikel, caption, dan copywriting yang menarik untuk kebutuhan bisnis.',4.8,15.00,'img/branda1.jpg'),(5,5,5,'Video Editing','Jasa editing video untuk media sosial, promosi bisnis, dan konten digital.',5.0,30.00,'img/video.jpg'),(6,6,6,'AI Content & Prompt','Pembuatan prompt AI, ide konten, dan solusi berbasis AI untuk produktivitas bisnis.',4.9,20.00,'img/website.jpg');
/*!40000 ALTER TABLE `layanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesanan`
--

DROP TABLE IF EXISTS `pesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pesanan` (
  `id_pesanan` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_kategori` int(10) unsigned NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `budget` decimal(10,2) NOT NULL,
  `batas_waktu` date NOT NULL,
  `deskripsi` text NOT NULL,
  `status` enum('menunggu','diproses','selesai','dibatalkan') NOT NULL DEFAULT 'menunggu',
  `tanggal_dibuat` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pesanan`),
  KEY `fk_pesanan_kategori` (`id_kategori`),
  CONSTRAINT `fk_pesanan_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesanan`
--

LOCK TABLES `pesanan` WRITE;
/*!40000 ALTER TABLE `pesanan` DISABLE KEYS */;
INSERT INTO `pesanan` VALUES (1,1,'Budi Santoso','budi.santoso@email.com','081234567890',40.00,'2026-11-15','Butuh logo untuk usaha kopi keliling.','menunggu','2026-10-01 09:15:00'),(2,2,'Siti Rahmawati','siti.rahma@email.com','082198765432',150.00,'2026-12-01','Website toko online baju muslim.','menunggu','2026-10-03 14:30:00'),(3,5,'Andi Pratama','andi.pratama@email.com','085712345678',60.00,'2026-11-20','Edit video promosi produk durasi 1 menit.','diproses','2026-10-05 10:00:00');
/*!40000 ALTER TABLE `pesanan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-11 16:30:03
