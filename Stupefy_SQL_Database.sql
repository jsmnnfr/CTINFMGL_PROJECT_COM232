-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: infomgmtproject
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `adminacc`
--

DROP TABLE IF EXISTS `adminacc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminacc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `joineddate` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminacc`
--

LOCK TABLES `adminacc` WRITE;
/*!40000 ALTER TABLE `adminacc` DISABLE KEYS */;
INSERT INTO `adminacc` VALUES (1,'admin1','password1','Sanchez','Rick','2025-02-19 12:00:00'),(2,'admin22E','password2','Smith','Morty','2025-02-13 12:00:00');
/*!40000 ALTER TABLE `adminacc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album_name` varchar(100) NOT NULL,
  `album_release_date` date DEFAULT NULL,
  `artist_id` int DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_artist_id` (`artist_id`),
  CONSTRAINT `fk_artist_id` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Reputation','2017-11-10',1),(2,'Fearless','2008-11-11',1),(3,'Map of the Soul: 7','2020-02-21',2),(4,'Thank U, Next','2019-02-08',3),(5,'Handwritten','2018-05-25',4),(6,'Red','2012-10-22',1),(7,'BE','2020-11-20',2),(8,'You Never Walk Alone','2016-10-10',2),(9,'Sweetener','2018-08-17',3),(10,'Eternal Sunshine','2024-03-08',3);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(100) NOT NULL,
  `song_id` int DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `song_auto_id` int DEFAULT NULL,
  PRIMARY KEY (`artist_id`),
  KEY `song_id_idx` (`song_id`),
  CONSTRAINT `fk_song_id` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Taylor Swift',1,'Pop',1),(2,'BTS',4,'K-Pop',4),(3,'Ariana Grande',7,'Pop/R&B',7),(4,'Shawn Mendes',10,'Pop',10);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_songs`
--

DROP TABLE IF EXISTS `playlist_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_songs` (
  `playlist_id` int NOT NULL,
  `song_id` int NOT NULL,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_id`,`song_id`),
  KEY `fk_playlist_songs_song` (`song_id`),
  CONSTRAINT `fk_playlist_songs_playlist` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_playlist_songs_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_songs`
--

LOCK TABLES `playlist_songs` WRITE;
/*!40000 ALTER TABLE `playlist_songs` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `playlist_name` varchar(100) NOT NULL,
  `playlistcreated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playlist_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `userinfo` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,1,'Jane\'s Favorites','2025-03-02 19:02:34'),(2,2,'Maria\'s Workout Mix','2025-03-02 19:02:34'),(3,3,'Chill Vibes','2025-03-02 19:02:34'),(5,6,'asdasd','2025-03-02 19:02:34');
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `song_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `release_date` date DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `duration` time NOT NULL,
  `lyrics` varchar(500) DEFAULT NULL,
  `audio_url` varchar(255) DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  PRIMARY KEY (`song_id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `fk_album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE SET NULL,
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Dont Blame Me','Taylor Swift','2017-11-10','Electro-Pop','00:03:56','src/main/resources/Lyrics/Dont Blame Me.txt','src/main/resources/MusicFiles/Taylor Swift - Dont Blame Me.mp3',1),(2,'Love Story','Taylor Swift','2008-09-15','Country-Pop','00:03:55','src/main/resources/Lyrics/Love Story.txt','src/main/resources/MusicFiles/Taylor Swift - Love Story.mp3',2),(3,'All Too Well','Taylor Swift','2012-10-22','Country-Folk','00:05:29','src/main/resources/Lyrics/All Too Well.txt','src/main/resources/MusicFiles/Taylor Swift - All Too Well.mp3',6),(4,'Boy With Luv','BTS','2019-04-12','Korean-Pop','00:03:49','src/main/resources/Lyrics/Boy With Luv.txt','src/main/resources/MusicFiles/BTS - Boy With Luv.mp3',3),(5,'Dynamite','BTS','2020-08-21','Disco-Pop','00:03:19','src/main/resources/Lyrics/Dynamite.txt','src/main/resources/MusicFiles/BTS - Dynamite.mp3',7),(6,'Spring Day','BTS','2017-02-13','Alternative Rock','00:04:34','src/main/resources/Lyrics/Spring Day.txt','src/main/resources/MusicFiles/BTS - Spring Day.mp3',8),(7,'Thank U, Next','Ariana Grande','2019-02-08','R&B','00:03:27','src/main/resources/Lyrics/Thank U, Next.txt','src/main/resources/MusicFiles/Ariana Grande - thank u, next.mp3',4),(8,'No Tears Left to Cry','Ariana Grande','2018-04-20','Dance-Pop','00:03:25','src/main/resources/Lyrics/No Tears Left to Cry.txt','src/main/resources/MusicFiles/Ariana Grande - no tears left to cry.mp3',9),(9,'We Cant Be Friends','Ariana Grande','2024-03-08','Electro-Pop','00:03:48','src/main/resources/Lyrics/We Cant Be Friends.txt','src/main/resources/MusicFiles/Ariana Grande - we cant be friends.mp3',10),(10,'Stitches','Shawn Mendes','2015-03-16','Pop','00:03:26','src/main/resources/Lyrics/Stitches.txt','src/main/resources/MusicFiles/Shawn Mendes - Stitches.mp3',5);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `subscriptiontype` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `accountcreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'jane_dcruzszzxx','jane4567x','premium','Dela Cruz','Janeg','2025-02-19 12:00:00'),(2,'maria_cane','cane08','student','Cane','Maria','2024-11-11 11:59:58'),(3,'boyaboyas','boya','student','boya','bboya','2024-12-12 10:20:30'),(5,'Gabo1EDITED','Obag1','Student','Vinas','Gab','2025-02-28 19:34:04'),(6,'RickySanchez','Burp','premium','Rick','Sanchez','2025-03-01 16:52:23'),(8,'SzaS','Sza','Basic','Szaa','Sza','2025-03-02 04:28:55');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-03 22:05:14
