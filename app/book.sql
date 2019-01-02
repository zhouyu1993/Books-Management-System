-- MySQL dump 10.13  Distrib 8.0.13, for osx10.14 (x86_64)
--
-- Host: localhost    Database: BOOK
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_admin` (
  `Admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `Admin_name` varchar(10) NOT NULL,
  `Admin_password` varchar(32) NOT NULL,
  `Admin_type` varchar(10) NOT NULL,
  PRIMARY KEY (`Admin_id`),
  UNIQUE KEY `Admin_id_UNIQUE` (`Admin_id`),
  UNIQUE KEY `Admin_name` (`Admin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` VALUES (1,'root','63a9f0ea7bb98050796b649e85481845','1'),(2,'admin','21232f297a57a5a743894a0e4a801fc3','1'),(3,'book1','65d8db90b8b4efbc55b1a062c58f2fc1','2'),(4,'book2','745c723e03084d27553fb9d4037b08c1','2'),(5,'read1','108749512d78aa131a8eeb8d1c067ba3','3'),(6,'read2','d40e0f3dfb94d7877f6ad4450ccdb3ed','3');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_book`
--

DROP TABLE IF EXISTS `t_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_book` (
  `Book_num` int(11) NOT NULL AUTO_INCREMENT,
  `Book_name` varchar(100) NOT NULL,
  `Writer` varchar(100) NOT NULL,
  `Sort_id` int(11) NOT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  `Pub_company` varchar(20) DEFAULT NULL,
  `Pub_date` date DEFAULT NULL,
  `Total_num` int(11) NOT NULL,
  `Current_num` int(11) NOT NULL,
  `Buy_date` date NOT NULL,
  `Brief` text,
  PRIMARY KEY (`Book_num`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_book`
--

LOCK TABLES `t_book` WRITE;
/*!40000 ALTER TABLE `t_book` DISABLE KEYS */;
INSERT INTO `t_book` VALUES (1,'Java编程思想（第4版） [thinking in java]','[美] Bruce Eckel 著；陈昊鹏 译',2,73.40,'机械工业出版社','2007-06-01',10,10,'2016-01-10','《计算机科学丛书：Java编程思想（第4版）》赢得了全球程序员的广泛赞誉，即使是最晦涩的概念，在BruceEckel的文字亲和力和小而直接的编程示例面前也会化解于无形。'),(2,'疯狂Java讲义（第3版 附光盘）','李刚 著',2,91.30,'电子工业出版社','2014-07-01',10,10,'2016-01-10','IT图书作家李刚老师针对Java 8推出的全新升级版；'),(3,'轻量级Java EE企业应用实战：Struts2+Spring4+Hibernate整合开发（第4版 附CD光盘）','李刚 著',2,93.60,'电子工业出版社','2014-10-01',10,10,'2016-01-11','国内知名IT图书作家李刚老师基于曾荣获中国书刊发行业协会“年度全行业**畅销品种”大奖的《轻量级Java EE企业应用实战（第3版）》全新升级；\n　　本书内容升级到Struts 2.3、Spring 4.0、Hibernate 4.3；全书所有示例基于Java 8、Hibernate注解进行全面升级；\n　　《轻量级Java EE企业应用实战》新增Maven、SVN、Tomcat 8.0、Eclipse luna（4.4）等知识；\n　　数百个小型案例及完整的工作流系统综合案例帮读者领略S2SH开发精髓；\n　　《轻量级Java EE企业应用实战》被多所“985”“211”院校选作教材；\n　　最受程序员欢迎、影响力*大的国人原创S2SH应用开发必读经典。'),(4,'白说','白岩松 著',4,27.40,'长江文艺出版社','2015-09-01',10,10,'2016-01-11','《白说》是央视新闻人白岩松继《幸福了吗》《痛并快乐着》之后的全新作品，一部“自传”式的心灵履历。通过近年来于各个场合与公众的深入交流，以平等自由的态度，分享其世界观和价值观。时间跨度长达十五年，涵盖时政、教育、改革、音乐、阅读、人生等多个领域，温暖发声，理性执言。'),(5,'从你的全世界路过 [I belonged to you]','张嘉佳 著',4,24.80,'湖南文艺出版社','2013-11-01',10,10,'2016-01-11','《从你的全世界路过：让所有人心动的故事》是新媒体时代的写故事高手张嘉佳的短篇小说集。读过睡前故事的人会知道，这是一本精彩纷呈的书。书中讲述了发生在我们身边的爱情故事，故事里的人物嘴贱心善，真实得就像身边的哥儿们和闺密，在深夜和你掏心掏肺地讲述，讲述他走过的千山万水，经历过的爱恨情仇。那么多的故事，情节曲折，细节动人，有温暖的，有明亮的，有落单的，有疯狂的，有无聊的，有胡说八道的；有念念不忘的美好，有爱而不得的疼痛，有生离死别的遗憾，有一再错过的宿命，也有喧嚣之后的回归和温暖。当你辗转失眠时，当你需要安慰时，当你赖床慵懒时，当你等待列车时……无论何时何地你都能翻开这本书，找到一篇好看的故事。总有那么一些瞬间，你会在张嘉佳的故事里看到自己，也总有那么一些瞬间，你会因为这些故事，而想到某个人，某段爱情。《从你的全世界路过：让所有人心动的故事》注定会在你的记忆里，留下印记，刻下痕迹，因为这本书，是关于你的故事。'),(6,'哈利·波特纪念版','[英] J.K.罗琳 著；马爱农，马爱新 译',4,222.40,'人民文学出版社','2014-10-01',10,10,'2019-01-01','《哈利·波特（中文版）（套装共7册）》共7册，包括了《哈利·波特与魔法石》、《哈利·波特与密室》、《哈利·波特与凤凰社》、《哈利·波特与混血王子》、《哈利·波特与火焰杯》、《哈利·波特与阿兹卡班的囚徒》、《哈利·波特与死亡圣器》。'),(7,'数据挖掘 概念与技术（原书第3版） [Data Mining Concepts and Techniques Third Edition]','[美] Jiawei Han，[美] Micheling Kamber，[美] Jian Pei 等 著；范明，孟小峰 译',5,54.90,'机械工业出版社','2012-08-01',10,10,'2016-01-11','《数据挖掘：概念与技术（原书第3版）》完整全面地讲述数据挖掘的概念、方法、技术和全新研究进展。本书对前两版做了全面修订，加强和重新组织了全书的技术内容，重点论述了数据预处理、频繁模式挖掘、分类和聚类等的内容，还全面讲述了OLAP和离群点检测，并研讨了挖掘网络、复杂数据类型以及重要应用领域。'),(8,'鬼吹灯','南派三叔',15,20.00,'盗墓出版社','2018-06-01',1,0,'2019-01-02','几个人去盗墓的故事'),(9,'官术','狗狍子',16,30.50,'书书出版社','2019-01-01',1,0,'2019-01-02','风天云涛，鹰击四海，官场如长空点翼，搏尽权谋。玩尽官场之术，万术从心。一顶红顶子，道尽了官场这个没有硝烟的战场。是斗智斗勇，还是四两拔千斤蛇拿七寸。为官之道，管他阳谋阴谋能垫帽子就是良谋。');
/*!40000 ALTER TABLE `t_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student`
--

DROP TABLE IF EXISTS `t_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_student` (
  `Student_id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_name` varchar(10) NOT NULL,
  `Student_password` varchar(32) NOT NULL,
  `Student_type` varchar(10) NOT NULL,
  `Book_num` varchar(11) NOT NULL,
  `Borrow_date` date NOT NULL,
  `Return_date` date NOT NULL,
  PRIMARY KEY (`Student_id`),
  UNIQUE KEY `Student_id_UNIQUE` (`Student_id`),
  UNIQUE KEY `Student_name` (`Student_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student`
--

LOCK TABLES `t_student` WRITE;
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
INSERT INTO `t_student` VALUES (5,'read1','108749512d78aa131a8eeb8d1c067ba3','3','','0000-00-00','0000-00-00'),(6,'read2','d40e0f3dfb94d7877f6ad4450ccdb3ed','3','','0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_type`
--

DROP TABLE IF EXISTS `t_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_type` (
  `Sort_id` int(11) NOT NULL AUTO_INCREMENT,
  `Sort_name` varchar(20) NOT NULL,
  PRIMARY KEY (`Sort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_type`
--

LOCK TABLES `t_type` WRITE;
/*!40000 ALTER TABLE `t_type` DISABLE KEYS */;
INSERT INTO `t_type` VALUES (1,'JavaScript'),(2,'Java'),(3,'C'),(4,'文学'),(5,'数据库'),(6,'建筑'),(7,'经济'),(8,'医学'),(9,'摄影'),(10,'字典词典'),(11,'政治/军事'),(12,'儿童文本'),(13,'科普'),(14,'杂志/期刊'),(15,'悬疑'),(16,'都市');
/*!40000 ALTER TABLE `t_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-02 11:33:33
