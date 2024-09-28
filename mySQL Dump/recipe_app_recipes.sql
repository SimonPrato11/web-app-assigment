-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: recipe_app
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `prep_time` int DEFAULT NULL,
  `cook_time` int DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `servings` int DEFAULT NULL,
  PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Vegan Doner Kebab','A plant-based take on a classic doner kebab with oyster mushrooms, cabbage, and yogurt sauce.',30,10,'main',4),(2,'Mango Pie','This mouthwatering mango dessert is an Indian take on a traditional Thanksgiving pie.',30,60,'Desert',16),(3,'Plum clafoutis','Halved plums are covered in a light batter and then baked in the oven to make this traditional French dessert.',30,60,'Desert',4),(4,'Couscous salad','A nutritious and satisfying vegan couscous salad packed with colour, flavour and texture, from dried cranberries, pistachios and pine nuts.',5,10,'Starter',4),(5,'Easy Lamb Biryani','This lamb biryani is real centrepiece dish, but it is actually easy as anything to make. Serve garnished with pomegranate seeds to make it look really special',72,120,'Main',8),(6,'Healthy Pizza','No yeast required for this easy, healthy pizza, topped with colourful vegetables that is ready in 30 minutes',10,30,'Main',2),(7,'Vegan Pancakes','Try this vegan fluffy American pancake recipe for a perfect start to the day. Serve these pancakes with fresh berries, maple syrup or chocolate sauce for a really luxurious start to the day.',30,15,'Starter',2),(8,'Spaghetti Bolognese','Once you have got this grown-up Spaghetti Bolognese, any left overs will taste even better next day',30,120,'Main',6);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28 22:31:46
