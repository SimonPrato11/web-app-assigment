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
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredient_id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int DEFAULT NULL,
  `ingredient_name` varchar(255) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `instructions` varchar(255) DEFAULT NULL,
  `ingredient_section` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (182,1,'Chopped tomatoes (tin)','1 x 400g','','Chilli Sauce'),(183,1,'Rose harissa','2 tbsp','','Chilli Sauce'),(184,1,'Caster sugar','2 tsp','','Chilli Sauce'),(185,1,'Lemon juice','Good squeeze','','Chilli Sauce'),(186,1,'Onion','1','Very thinly sliced into half moons','Onion'),(187,1,'White wine vinegar','2 tsp','','Onion'),(188,1,'Flatleaf parsley','20g','Finely chopped','Onion'),(189,1,'Plain yoghurt','150g','','Yoghurt Sauce'),(190,1,'Dried mint','1 heaped tsp','','Yoghurt Sauce'),(191,1,'Salt and black pepper','To taste','','Yoghurt Sauce'),(192,1,'Oyster mushrooms','500g','Very thinly sliced lengthways','Doner'),(193,1,'Garlic oil','2 tsp','','Doner'),(194,1,'Sweet paprika','2 tsp','','Doner'),(195,1,'Ground coriander','2 heaped tsp','','Doner'),(196,1,'Celery salt','2 tsp','','Doner'),(197,1,'Garlic granules','3 tsp','','Doner'),(198,1,'Black pepper','½ tsp','','Doner'),(199,1,'White pitta breads','4','','Doner'),(200,1,'White cabbage','¼ small','Very finely shredded','Garnish'),(201,1,'Tomatoes','2','Sliced into half moons','Garnish'),(202,1,'Pickled chillies','4–6','Thinly sliced (optional)','Garnish'),(203,2,'Digestive biscuits','280g/10oz','Finely crushed','Biscuit Base'),(204,2,'Granulated sugar','65g/2¼oz','','Biscuit Base'),(205,2,'Ground cardamom','¼ tsp','','Biscuit Base'),(206,2,'Unsalted butter, melted','128g/4½oz','','Biscuit Base'),(207,2,'Sea salt','Large pinch','','Biscuit Base'),(208,2,'Granulated sugar','100g/3½oz','','Mango Custard Filling'),(209,2,'Powdered gelatine','2 tbsp plus ¼ tsp','','Mango Custard Filling'),(210,2,'Double cream','120ml/4fl oz','','Mango Custard Filling'),(211,2,'Cream cheese','115g/4oz','At room temperature','Mango Custard Filling'),(212,2,'Alfonso mango pulp','850g tin','','Mango Custard Filling'),(213,2,'Sea salt','Large pinch','','Mango Custard Filling'),(214,3,'Milk','125ml/4½fl oz','',NULL),(215,3,'Double cream','125ml/4½fl oz','',NULL),(216,3,'Vanilla essence','2-3 drops','',NULL),(217,3,'Free-range eggs','4','',NULL),(218,3,'Caster sugar','170g/6oz','',NULL),(219,3,'Plain flour','1 tbsp','',NULL),(220,3,'Butter','30g/1oz','',NULL),(221,3,'Plums','500g/1lb 2oz','Cut in half, stones removed',NULL),(222,3,'Brown sugar','2 tbsp','',NULL),(223,3,'Flaked almonds','30g/1oz','Optional',NULL),(224,3,'Icing sugar','For dusting','',NULL),(225,3,'Double cream','To serve','',NULL),(226,4,'Couscous','225g/8oz','Prepared according to the packet instructions',NULL),(227,4,'Preserved lemons','8 small','Flesh and rind finely chopped',NULL),(228,4,'Dried cranberries','180g/6⅓oz','',NULL),(229,4,'Pine nuts','120g/4⅓oz','Toasted',NULL),(230,4,'Unsalted shelled pistachio nuts','160g/5¾oz','Roughly chopped',NULL),(231,4,'Olive oil','125ml/4fl oz','',NULL),(232,4,'Flatleaf parsley','60g/2¼oz','Finely chopped',NULL),(233,4,'Garlic cloves','4','Crushed',NULL),(234,4,'Red wine vinegar','4 tbsp','',NULL),(235,4,'Red onion','1','Finely chopped',NULL),(236,4,'Salt','1 tsp','Or to taste',NULL),(237,4,'Rocket leaves','80g/2¾oz','',NULL),(238,5,'Vegetable oil','5 tbsp','',NULL),(239,5,'Onions','2','Finely sliced',NULL),(240,5,'Greek or natural yoghurt','200g/7oz','',NULL),(241,5,'Ginger','4 tbsp','Finely grated',NULL),(242,5,'Garlic','3 tbsp','Finely grated',NULL),(243,5,'Kashmiri red chilli powder','1–2 tsp','',NULL),(244,5,'Ground cumin','5 tsp','',NULL),(245,5,'Ground cardamom seeds','1 tsp','',NULL),(246,5,'Sea salt','4 tsp','',NULL),(247,5,'Lime','1','Juice only',NULL),(248,5,'Coriander leaves and stalks','30g/1oz','Finely chopped',NULL),(249,5,'Mint leaves','30g/1oz','Finely chopped',NULL),(250,5,'Green chillies','3–4','Finely chopped',NULL),(251,5,'Boneless lamb tenderloin or leg','800g/1lb 12oz','Cut into bite-sized pieces',NULL),(252,5,'Double cream','4 tbsp','',NULL),(253,5,'Full-fat milk','1½ tbsp','',NULL),(254,5,'Saffron strands','1 tsp (a large pinch)','',NULL),(255,5,'Basmati rice','400g/14oz','',NULL),(256,5,'Pomegranate seeds','2 tbsp','To garnish (optional)',NULL),(257,6,'Self-raising brown or wholemeal flour','125g/4½oz','Plus extra for dusting',NULL),(258,6,'Fine sea salt','Pinch','',NULL),(259,6,'Full-fat plain yoghurt','125g/4½oz','',NULL),(260,6,'Yellow or orange pepper','1','Seeds removed and thinly sliced',NULL),(261,6,'Courgette','1','Cut into 1cm/½in slices',NULL),(262,6,'Red onion','1','Cut into thin wedges',NULL),(263,6,'Extra virgin olive oil','1 tbsp','Plus extra for drizzling',NULL),(264,6,'Dried chilli flakes','½ tsp','',NULL),(265,6,'Ready-grated mozzarella or cheddar','50g/1¾oz','Or goat’s cheese, broken into small chunks, or 1 mozzarella ball, sliced or roughly torn',NULL),(266,6,'Freshly ground black pepper','To taste','',NULL),(267,6,'Fresh basil leaves','To serve','Optional',NULL),(268,6,'Passata sauce','6 tbsp (approximately 100g/3½oz)','',NULL),(269,6,'Dried oregano','1 tsp','',NULL),(270,7,'Self-raising flour','125g/4½oz','',NULL),(271,7,'Caster sugar','2 tbsp','',NULL),(272,7,'Baking powder','1 tsp','',NULL),(273,7,'Sea salt','good pinch','',NULL),(274,7,'Soya milk or almond milk','150ml/5fl oz','',NULL),(275,7,'Vanilla extract','¼ tsp','',NULL),(276,7,'Sunflower oil','4 tsp','for frying',NULL),(277,8,'Olive oil or sun-dried tomato oil','2 tbsp','',NULL),(278,8,'Smoked streaky bacon','6 rashers, chopped','',NULL),(279,8,'Onions','2 large, chopped','',NULL),(280,8,'Garlic cloves','3, crushed','',NULL),(281,8,'Lean minced beef','1kg/2¼lb','',NULL),(282,8,'Red wine','2 large glasses','',NULL),(283,8,'Chopped tomatoes','2 x 400g cans','',NULL),(284,8,'Antipasti marinated mushrooms','1 x 290g jar, drained','',NULL),(285,8,'Bay leaves','2, fresh or dried','',NULL),(286,8,'Dried oregano','1 tsp or a small handful of fresh leaves, chopped','',NULL),(287,8,'Dried thyme','1 tsp or a small handful of fresh leaves, chopped','',NULL),(288,8,'Balsamic vinegar','Drizzle','',NULL),(289,8,'Sun-dried tomato halves','12-14, in oil','',NULL),(290,8,'Salt','To taste','',NULL),(291,8,'Freshly ground black pepper','To taste','',NULL),(292,8,'Fresh basil leaves','A good handful, torn into small pieces','',NULL),(293,8,'Dried spaghetti','800g-1kg/1¾-2¼lb','',NULL),(294,8,'Freshly grated parmesan','To serve','',NULL);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28 22:31:47
