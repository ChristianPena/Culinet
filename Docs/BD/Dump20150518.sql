CREATE DATABASE  IF NOT EXISTS `CuliNet_Test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `CuliNet_Test`;
-- MySQL dump 10.13  Distrib 5.6.19, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: CuliNet_Test
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `APPLICATIONS`
--

DROP TABLE IF EXISTS `APPLICATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPLICATIONS` (
  `ID_APPLICATION` int(11) NOT NULL AUTO_INCREMENT,
  `APPLICATION_NAME` varchar(30) NOT NULL,
  `TITLE` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(45) NOT NULL,
  `SOURCE` varchar(100) NOT NULL,
  `LEFT_PANE` char(1) DEFAULT NULL,
  `RIGHT_PANE` char(1) DEFAULT NULL,
  `ID_CATEGORY` int(11) DEFAULT NULL,
  `POS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_APPLICATION`),
  UNIQUE KEY `APPLICATION_NAME_UNIQUE` (`APPLICATION_NAME`),
  UNIQUE KEY `TITLE_UNIQUE` (`TITLE`),
  KEY `ID_CATEGORY` (`ID_CATEGORY`),
  CONSTRAINT `APPLICATIONS_ibfk_1` FOREIGN KEY (`ID_CATEGORY`) REFERENCES `CATEGORY_APPLICATIONS` (`ID_CATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPLICATIONS`
--

LOCK TABLES `APPLICATIONS` WRITE;
/*!40000 ALTER TABLE `APPLICATIONS` DISABLE KEYS */;
INSERT INTO `APPLICATIONS` VALUES (1,'HOME','Pantalla Principal','Pantalla Principal','/culinet/app/home/Home.fxml','X',NULL,NULL,NULL),(2,'POS','Punto de Venta','Punto de Venta','/culinet/app/sales/pos/POS.fxml',NULL,NULL,1,10),(3,'MOVS','Movimientos de Caja','Movimientos de Caja','/culinet/app/sales/movs/Movs.fxml','X',NULL,1,20),(4,'CONF','Configuracion','Configuracion','/culinet/app/system/conf/Conf.fxml','X',NULL,3,10),(5,'LOCATION','Sucursal','Sucursal','/culinet/app/admin/location/Location.fxml','X',NULL,2,100),(6,'PRODUCT','Productos','Productos','/culinet/app/admin/product/Products.fxml','X',NULL,2,10);
/*!40000 ALTER TABLE `APPLICATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUTTONS`
--

DROP TABLE IF EXISTS `BUTTONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUTTONS` (
  `ID_BUTTON` int(11) NOT NULL AUTO_INCREMENT,
  `BUTTON_NAME` varchar(45) NOT NULL,
  `BUTTON_TEXT` varchar(45) DEFAULT NULL,
  `BUTTON_DESCRIPTION` varchar(45) DEFAULT NULL,
  `BUTTON_HELP` varchar(45) DEFAULT NULL,
  `BUTTON_ACTION` varchar(15) NOT NULL,
  `BUTTON_ICONNAME` varchar(45) DEFAULT NULL,
  `ID_PERMISSION` int(11) NOT NULL,
  `KEY_SHORTCUT` varchar(15) DEFAULT NULL,
  `CSS_CLASS` varchar(30) DEFAULT NULL,
  `CSS_ID` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_BUTTON`),
  KEY `fk_BUTTON_TOOLBAR_PERMISIONS1_idx` (`ID_PERMISSION`),
  CONSTRAINT `fk_BUTTON_TOOLBAR_PERMISIONS1` FOREIGN KEY (`ID_PERMISSION`) REFERENCES `PERMISIONS` (`ID_PERMISSION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUTTONS`
--

LOCK TABLES `BUTTONS` WRITE;
/*!40000 ALTER TABLE `BUTTONS` DISABLE KEYS */;
INSERT INTO `BUTTONS` VALUES (1,'SAVE',NULL,'Guardar','Guardar','SAVE','ICON_SAVE',13,'Ctrl+S','button_toolbar',NULL),(2,'BACK',NULL,'Atr√°s','Atr√°s','BACK','ICON_BACK',9,'F3','button_toolbar',NULL),(3,'EXIT',NULL,'Salir','Salir','EXIT','ICON_EXIT',11,'Shift+F3','button_toolbar',NULL),(4,'CANCEL',NULL,'Cancelar','Cancelar','CANCEL','ICON_CANCEL',10,'Esc','button_toolbar',NULL),(5,'PRINT',NULL,'Imprimir','Imprimir','PRINT','ICON_PRINT',8,'Ctrl+P','button_toolbar',NULL),(6,'SEARCH',NULL,'Buscar','Buscar','SEARCH','ICON_SEARCH',12,'Ctrl+F','button_toolbar',NULL),(7,'INFO',NULL,'Informaci√≥n','Informaci√≥n de la aplicaci√≥n','INFO_APP','ICON_INFO',14,'F1','button_toolbar',NULL),(8,'FAVORITES','Favoritos','Favoritos','Favoritos','ADD_FAVORITE','ICON_ADD_FAVORITE',18,NULL,'button_toolbar_2',NULL);
/*!40000 ALTER TABLE `BUTTONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUTTON_TOOLBAR`
--

DROP TABLE IF EXISTS `BUTTON_TOOLBAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUTTON_TOOLBAR` (
  `ID_BUTTON` int(11) NOT NULL,
  `ID_TOOLBAR` int(11) NOT NULL,
  KEY `fk_BUTTON_TOOLBAR_BUTTONS1_idx` (`ID_BUTTON`),
  KEY `fk_BUTTON_TOOLBAR_TOOLBAR1_idx` (`ID_TOOLBAR`),
  CONSTRAINT `fk_BUTTON_TOOLBAR_BUTTONS1` FOREIGN KEY (`ID_BUTTON`) REFERENCES `BUTTONS` (`ID_BUTTON`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BUTTON_TOOLBAR_TOOLBAR1` FOREIGN KEY (`ID_TOOLBAR`) REFERENCES `TOOLBAR` (`ID_TOOLBAR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUTTON_TOOLBAR`
--

LOCK TABLES `BUTTON_TOOLBAR` WRITE;
/*!40000 ALTER TABLE `BUTTON_TOOLBAR` DISABLE KEYS */;
INSERT INTO `BUTTON_TOOLBAR` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,2);
/*!40000 ALTER TABLE `BUTTON_TOOLBAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORY_APPLICATIONS`
--

DROP TABLE IF EXISTS `CATEGORY_APPLICATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORY_APPLICATIONS` (
  `ID_CATEGORY` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(30) NOT NULL,
  `ICON` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(30) DEFAULT NULL,
  `POS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY_APPLICATIONS`
--

LOCK TABLES `CATEGORY_APPLICATIONS` WRITE;
/*!40000 ALTER TABLE `CATEGORY_APPLICATIONS` DISABLE KEYS */;
INSERT INTO `CATEGORY_APPLICATIONS` VALUES (1,'SALES','CUTLERY','Ventas',10),(2,'ADMINISTRATION','BOOK','Administracion',20),(3,'CONFIGURATION','GEARS','Configuracion',30);
/*!40000 ALTER TABLE `CATEGORY_APPLICATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORY_PRODUCT`
--

DROP TABLE IF EXISTS `CATEGORY_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORY_PRODUCT` (
  `ID_CATEGORY` int(11) NOT NULL AUTO_INCREMENT,
  `NAME_CATEGORY` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORY_PRODUCT`
--

LOCK TABLES `CATEGORY_PRODUCT` WRITE;
/*!40000 ALTER TABLE `CATEGORY_PRODUCT` DISABLE KEYS */;
INSERT INTO `CATEGORY_PRODUCT` VALUES (1,'Refrescos'),(2,'Cafeteria');
/*!40000 ALTER TABLE `CATEGORY_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEES`
--

DROP TABLE IF EXISTS `EMPLOYEES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEES` (
  `ID_EMPLOYEE` int(11) NOT NULL AUTO_INCREMENT,
  `RUT` varchar(10) NOT NULL,
  `NAME` varchar(15) NOT NULL,
  `NAME2` varchar(15) DEFAULT NULL,
  `LASTNAME` varchar(15) NOT NULL,
  `LASTNAME2` varchar(15) DEFAULT NULL,
  `BIRTHDATE` date NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE_NUMBER` varchar(15) NOT NULL,
  `PHONE_NUMBER2` varchar(15) DEFAULT NULL,
  `ID_JOB` int(11) NOT NULL,
  `ID_MANAGER` int(11) DEFAULT NULL,
  `SALARY` int(11) NOT NULL,
  `COMISSION_PCT` double DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  PRIMARY KEY (`ID_EMPLOYEE`),
  KEY `fk_EMPLOYEES_JOBS1_idx` (`ID_JOB`),
  KEY `fk_EMPLOYEES_EMPLOYEES1_idx` (`ID_MANAGER`),
  CONSTRAINT `fk_EMPLOYEES_EMPLOYEES1` FOREIGN KEY (`ID_MANAGER`) REFERENCES `EMPLOYEES` (`ID_EMPLOYEE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEES_JOBS1` FOREIGN KEY (`ID_JOB`) REFERENCES `JOBS` (`ID_JOB`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (1,'17517063-4','CHRISTIAN','LUIS ANTONIO','PE√ëA','FARIAS','1990-09-11','CHRISTIAN.PENA.FARIAS@HOTMAIL.COM','+56950995288','03223171011',1,NULL,800000,NULL,'2015-01-01');
/*!40000 ALTER TABLE `EMPLOYEES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLOORS`
--

DROP TABLE IF EXISTS `FLOORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FLOORS` (
  `ID_FLOOR` int(11) NOT NULL AUTO_INCREMENT,
  `NAME_FLOOR` varchar(50) NOT NULL,
  `ID_LOCATION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_FLOOR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLOORS`
--

LOCK TABLES `FLOORS` WRITE;
/*!40000 ALTER TABLE `FLOORS` DISABLE KEYS */;
INSERT INTO `FLOORS` VALUES (1,'Primer Piso',1),(2,'Segundo Piso',1),(3,'Terraza',1);
/*!40000 ALTER TABLE `FLOORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ICONS`
--

DROP TABLE IF EXISTS `ICONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ICONS` (
  `ID_ICONS` int(11) NOT NULL AUTO_INCREMENT,
  `NAME_ICON` varchar(45) NOT NULL,
  `ICON` longblob NOT NULL,
  `WIDTH` varchar(45) DEFAULT NULL,
  `HEIGHT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_ICONS`),
  UNIQUE KEY `NAME_ICON_UNIQUE` (`NAME_ICON`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ICONS`
--

LOCK TABLES `ICONS` WRITE;
/*!40000 ALTER TABLE `ICONS` DISABLE KEYS */;
INSERT INTO `ICONS` VALUES (1,'ICON_SAVE','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0gAMA\0\0Ÿ‹≤⁄\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0\0H\0\0\0H\0F…k>\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0_IDAT8Àuì[SRaÜø˛@]ı⁄ˇ©;Ìd*E\nÖú!Ë$»]NyS1MÕÿWâ7J:VÄöBN#|:Rc®`¢rò’z7⁄8NÏô≈l÷˚<ão3{âÓ~õË’;Œ]ªeºx•w@Auˆîé3ÖﬁI\\°—;EèŒ~Yoı∆≠C~iu˚•›êé”Â\r®=d`¿¬Å+0MgÒ~ùòé“ÚÍ:≠»\r ohßP§m‘NQ˝˛{kGÕ¿LD¢Æ∏™PÃ._6˘}ï2øÚîÀ®ﬁh“…’h6©P:†j≠Nπ≠Ç Ã3.0*Ê¡a9∑ò¶tvÉ2πM™’ˇ`Xæ¯á*’# rñÊSÄÖW`∫?,?}Y†DzïR|ƒÉrÖé¯[U£2À˚áJe÷UfÜY”…\0~≈Ë|,\'g>”l¸≈ÊSîL˝†>Ê‚J¶U|è≤Ÿ¯Å5:üH∏‚˙mìbp<í°pÑˇúMEM,Q,πLs,¥jYÌM≈*öå∏<¿¨‹≥?îØﬂ§·i mÊ’Á-W™T9.ıû{?9\\qCkVÓZ»gØ∆ÈMhÇˆ©›ÖÏm(LœÉ„ÆË∫cQtè}Ic¡w¥W⁄o;\0∞p‡äÆ>´“orKèî£/hwØ‘v\020`·¿7˘£œ8$mÓÚ¯ûRqwØÌ\0d`¿¬Å+x!.i\\YãÀG^≥k¸\ZÔ∂^„SÖ20`·¿≈\"ù◊ËA≠ap≠èèe„Öqú]¶„B,∏¢[g«êòÜ#uÚ∫v¸gù’ïÊX’a˜/D·…\\π@qÕ\0\0\0%tEXtdate:create\02009-09-13T16:21:18+02:00‡Dë\0\0\0%tEXtdate:modify\02009-09-13T16:21:18+02:00ë«-\0\0\0\0IENDÆB`Ç','16','16'),(2,'ICON_BACK','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\01\0\01∑Ì(R\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0TIDAT8Àuì˝OSg«üV≤,fiÊ‚:([t≈\0∫åÈV%∞åƒ3Ï†\n•`y±ññæø‹ﬁﬁ⁄R ÀXòX◊µCêﬂñÒ√0÷ˇWâ$¯ëØÁ÷ƒd[ˆ$üÓyŒ˜úÔ…y.cˇ:˚><ƒtîjV|¢”W.˚¯»gÂïáuöΩ{Ÿ{˚˜≥ˇ=ü= ˆ}T™1‘7ú8Uœü˝Ó|æΩ≥´`Ê∫W[/òÚçÕg\"\'N◊jÍÍ4_çˇ˛ÂIVU}¨§ŒxökÎ0ØÛ¢àÙ/,‹YBv~≥ssê„qt[z◊œú;«54}[“‹rˆç¯d˝7å⁄ô±°ë„z,õì33»ds»‰ròKßÒ«Ú2˛zˆ∑2‹†oõ√±yﬁtÅ∞≤∂ˆv∆\Zööò±±—`∫xiMé≈11=]d,ï¬˝∞µµÖ¸”ßõ¬œ‰djÊGÿÆ≠ôÃÜéÆN∆:ØÙ∞ñ÷Vﬁ6ÏÄ Àà|4ä•ªw±≥≥çB°ÄX\"éƒx…âRSìààQX¨}º›9¬XsKãŒd6ÁÌN\'‹>F<,,.íxò A(¬CêDàä9¶P◊ˆ\'Ω÷^kÎ¯°‹t—º⁄mÈ¡’Å~¸öÕ≈ªªª∏≥¥Ñ·<~/|A?¸·\0¸°\0\\^7≈áDª‘›U÷yô+p=ó°íæï~[@u2hRì·t;…›Hó◊EE=´ﬁÄßú]È≥Ëz≠}OÆX—?‘Î`?≤π,∂∑∑ã#ƒi~áKu·&^¬~\Z)^Â	sy‹l»~ç∑9Æ√Ó¥ì’éøÕÁäE^¸˝·Ha!A‰! ‰—(îò»K1ë1≤¶bp˚\\kdâfÙ!»”¨‘maÒ6≠ÒVV˛,äc	ôPS÷¡ò«Áe˜ñs,ƒ∏H4ºï\"juåO$h„xÙ˚C<~ºÇ—∏§\nU6	NûX\"°ºyçí\"2QJH»Qóıd*éüfßÈı›ƒ‹ÕYLM”˛\'«TÒ:—5ñTJIÂ?ˇì∆¯ıW⁄p$P-)Ç<\ZìûS±ód˘%uÆ∆Bºø∫™ †•\\Õ[!Ò°#eZ≠∂≤¢B™ˆXÕ˜5µ’mz}y˝û=⁄#tß\'Jâ˜âw’BØ/TŸ÷‚à]\0\0\0%tEXtdate:create\02009-09-15T09:05:43+02:00 a\0\0\0%tEXtdate:modify\02009-09-15T09:05:43+02:00cóŸØ\0\0\0tEXtSoftware\0www.inkscape.orgõÓ<\Z\0\0\0\0IENDÆB`Ç','16','16'),(3,'ICON_EXIT','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\01\0\01∑Ì(R\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0LIDAT8ÀuìﬂOSg«ﬂV≤,∆4sqsP∂,Ëät”Y%∞åƒ3¨PÖ√∞0D,••ø(Â¥Áú⁄¬Zä≈±≤ïY\'(\\éÔ\'óHˆp√\r	$\\|˜úC∂d\Zﬂ‰ì˜=Ô˚|üÁ…7œaÏµu¸ÉìÃ~æÓ£¢O\r∆‚Süú˛º∞®¯îAwÙ(;v‚{Î˙ÏÃv¸„|ù©¸úÈ¸•J˛Íw◊Wõ[÷≠\\ÎF˝\rÀjUÌï–˘Àï¶≤ä\n›ófÛˇ≈_|uÅïîûÕ´0_Ê\Zö¨[º(bÍ—fÁÊÒ€¸fr,ÜV[˚÷ïk◊∏™öoÛjÎÆä/T~√¯3WUs‹€Œh:çô¨¢ëôöBfz\Z ”ßx2;ã_Ë€ÓtÓ\\∑‹‡∫˜XCc#cU55Ã\\]m≤‹∫Ωâ∆ê”N$byÀ++H¶Rüò¿D&ÉT˙∫Ï˜7-÷&SSK3cÕmwX]}=oÔu\"â@ xA¿≥≈EÏÔÔk,=9\Z≈H2ÅDj!QÄ≠≥Éw∏˙´≠´3X¨÷UáÀèﬂè>ØÛÿ€€√¡¡ÅÜz˛=ó!2$S=N«üÌùÌ÷–t≥–rÀ∫—jk√è]w°<y¨	∂∑∑Òk6ã¨í’ŒÍ›‹¸º~/‹>z˚z◊âvªµ•†˘nùvd&\'±ªªãø^Ω¢j<Óvw·ûΩÇ$`mmM{S+p∫{·Î˜n¯ﬁB÷÷a3¥wvP;ZÎπ?rp8Ëv‹W´¿Âq¡Âv™Úb	ãKœ–?‡#üÇ´|8h`nØáQ0ôháJè≥á|pQ´¯>Ç~˘\0√Am\'˘ ê©\"/EE∆®Çä…„woRKË\'¡Ä& ∑!FBêà∆#à\rÀ*õÑâ`ÃÎ˜±‹ä¬(;w)§ˇîå#˝0Öá0ñNb$˚WºCpë—0ã«Â√iîdëâR8èÑUŸRÉ«√ÙÃ$M‰\r–8£√™xãhëÛ‚#ÚˇìŒ|Òk˝`(P*…·»PTzI…˛VäI/’ª ﬂ_ZRb“S¨äÓ?!Òa >$\nÙz}qQëÒR˘Ÿ≤ÔÀ Kå∆¬ #GÙßÈÕH‰ÔÔ™â˛P€9˙?~≥\0\0\0%tEXtdate:create\02009-09-15T09:05:44+02:00◊m_ù\0\0\0%tEXtdate:modify\02009-09-15T09:05:44+02:00¶0Á!\0\0\0tEXtSoftware\0www.inkscape.orgõÓ<\Z\0\0\0\0IENDÆB`Ç','16','16'),(4,'ICON_CANCEL','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\01\0\01∑Ì(R\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0@IDAT8ÀuìˇOw«?≠dYÃ“Ã≈-8°lY–∏≈Ø´ÿFbÜ;®“Ch°A®-˝\n˝rΩﬁıË7Xáfä &€\\≤Mtd‚Ô¬\n°ﬂHˆ/ﬁsG$ôÀﬁ…Îá{ÓÛ~Ó˝‹=«ÿ[:Ù·«L˜A•ÊHÕß:}Ì±™Oé^]S{Lß9xêΩw¯0˚_}v‚;t¥Rch¸¬pˆB˘€´+]=ñÇôÎ-v\\7≠4∑]äûΩÿdh8}Zs h¸∑˘À3ÁX]˝…ä3∆ã\\g∑yõèâx¯h?˝Ú??˝KKêìIÙZm€óÆ\\·ö[ø©hkøºg>◊Ù5„CNfln·,˝÷ù…Ô≥x0?è˘≈E’∏¯‰	èËzfvéQ◊ŒU”un»yõuvu1÷‹⁄ å--”çõeQñÒÁÀóÿ⁄⁄¬Ωπ9dÔNczf3s≥X__«ÍÍ*¶≤Y9F &s∑°€“√XO_?kÔË‡G\\.ƒ$	πç\r(*ã»LM!ôN„Ø\\N≠mnn™µ®(¿j‡ùncmÌÌ:ìŸº‚tª·	¯!H¢ö@Q©TRMªªª»ÁÛHfRe	±∏à;£Œeõ›¶cù›ﬂUõnòãΩ÷~çc¯é¡pÖBoT*ó®qc°1åáÉ|py\\¢ä›ÏµTı‹‚\n\\ﬂ-Ù\rXa¥a‘ÎﬁÂMíH4BıQx¸j‡Ö‹_˝’åL:õ}`yp»é¡€v¯håµµµ}£Ç\"e,1√x(Äp4^Ø:Êı˚ÿ∞sÑw∏¯<xΩˆZ5‰Û{âÊUÊWî€»©µ¯DrB‰•Ñ»ò€ÁV0¯ﬁ2E¬ãﬂücÉ‚\'í2\"BÇAz2•æÃÂÂ?0ëêËÀ»e¬@0Ê∞ﬂû-±0‰¯XxGy:\'SíÁÃﬁøãÏÙ§z=ëTÕ;œ\n,ïí˜∂QíE&JB≈‚©¯vf*Iã4ç˘ÖXx¸˜ºGîVÃ€Ñ%ùë+R˘?ˇì∆¯’ym$\Z¨ód!NQ_Q≥øË…ØîZòØØ´3hÈ¨ÇfﬂHºCËàèà*≠V[[S£ø–x≤·ZCc}ß^_›t‡Äˆ8›”ïƒ˚ƒªJ£\0’ÌÙñ,ó\0\0\0%tEXtdate:create\02009-09-13T16:42:31+02:004{L\0\0\0%tEXtdate:modify\02009-09-13T16:42:31+02:00E&Ù√\0\0\0tEXtSoftware\0www.inkscape.orgõÓ<\Z\0\0\0\0IENDÆB`Ç','16','16'),(5,'ICON_PRINT','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0gAMA\0\0Ÿ‹≤⁄\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0\0H\0\0\0H\0F…k>\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0IDAT8À≠ì[oQƒ˜≠˝51ÈL€\"\rÖ‚•ÂR¥ãæÿà∆ƒòÿDM`c¿÷Z€zA—*x¿jEQc#\"a7¢•la1ƒ¿”xfU“%}”ìLrvÊ7á˛Gí˛«rxNJé£¶åπgéÿ\'g‰˝ƒåå…äNoç;%ç∏¸ÆÈêrÂzkâu¨=Ëìòë!ÀéÂÄCNÔ¡@(\\˙T,°eh6õ—cFÜlÔÄ?Ø>$^œÁÒù1ÆF‚P‚∑°ƒñ¨32dŸaW\Zs\'¶BëãÛQƒÓ$Z\\}à•ªI,ﬂ{lä˚≈’G∏πÚ;\'Àª“aßoÿ+áãπ∑Q™Ó@≠Ì‚{£Ω’Ü—˛ij˜G€¬”DV˙∂≤Ï∞Àl˛”ÁÀôÕw(|V±U˘ä/’\Z¥m’z√îV”QﬁV•j2ôÕ˜`á]id¬gÛÖ¬ÂdfOsØë æ* óˇÄ\rÒI˜ÙRπ<û	%≥/¡ª“®ÀoÛ Á ∑ÓØãÔ¶ Ò‰9“ŸH	•˚ƒåYvÿÂè8|<x∂xc9Åïd\Zç¶Ån∑ãNßc=fd»≤√Æ$&l–yBéŒŒ]¬|dUÉÆÎ®◊Î—cFÜ,;ÏöC$4$¶º≥sz˛Mö¶AUUãË1õYvz√ƒÕ®;0 ˛[Â¬ÂkÊ‡D˚Dè≤÷QﬁsôÏìAá›î˜ï»˛^¶ÒΩóÈ_÷/”	4]Ë¶`\0\0\0%tEXtdate:create\02009-09-13T16:21:13+02:00‚C+k\0\0\0%tEXtdate:modify\02009-09-13T16:21:13+02:00ìì◊\0\0\0\0IENDÆB`Ç','16','16'),(6,'ICON_SEARCH','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0gAMA\0\0Ÿ‹≤⁄\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0\0H\0\0\0H\0F…k>\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0πIDAT8Àçí]Hìa«]]D‰EòFÅT›tëtï–Ed$Çe¯9ßŒêƒ B©âË¢a≈@R2õTaEñí_€Îtn∫5uÌK∂πœ‹úS7˜˛;o&ŸÚ¿πxxûˇÔúˇycQ¢b¨Tµì(è≤BÂEJ1+…dE ñ?B˜#lÎ(.9A|P$·dát÷sÕ3+πrSÏDì¡ø˚ X¡≥X’hìp[\0$Îbzÿ[›iÉ—µåjë(O(Ü∂!/é4ËÊÈMNR…(cÂ™@±RDYµ¬ä`$Gàá)¿√∫¿c>Ã#∫∆£{\"Ä¥ZÕ+Ve∞Ú—\0y>TØµLŒ-b⁄√»‹\Z∆]qL∫„–{‚0˘„ØƒP‹ˆù\'+“_\0±rÄvVf\\vñivÖr˝ñU⁄¢[OœbÚ>H‹Ç8»ˆfE*ÒÖG∆ò’ÑBFßn	oÙKË6Fa:Ç˜îfom_ùUå>gyI\nïô«ÔN˙V/ö\0/@ŒÒTDÎXäâÏû Í^ô¡ƒ‹Ì‰\n5Yÿ¸•≈™î]UÍèÕ=Ë,n»=h¸‚CSø≤!fº09|8uﬂ\0öA=ì\'|ßÑÜR ee‹“∏⁄˚Õ–õË”;—;ÂÑŒÏ¬7Î<^k†ÊÌ<‘i˝L¨*°ØL˛¸T©ííìZ3f»{¢Áºõ¡„ûY‘tqÚﬁ_ŸÂƒùœ~îæt ˝∫\0·JHó\0i‰ÑuŒ†≠î&”¥i`Çg°ÌÙZﬂÂsêvªë˚Ãé‘k~V∆±J*¸O–Ä.ëœ| *µ∞©…B≈}$ nµ!è∫8”b¡û´„6≤så˝7Ñ6Cˆ÷j¸ßÂfúo∑cˇMmò÷;õm+6 ‘6U∂ìxyáT›EÁ4∂Ì ÂúËW€BeA,ÊÿOŒÀµÒÔÙ\0\0\0%tEXtdate:create\02009-09-13T16:21:19+02:00F3t%\0\0\0%tEXtdate:modify\02009-09-13T16:21:19+02:007nÃô\0\0\0\0IENDÆB`Ç','16','16'),(7,'ICON_SUCCESS','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0gAMA\0\0Ÿ‹≤⁄\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0\0H\0\0\0H\0F…k>\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0{IDAT8À}ì]HìQ«ènÖ•+,I\"⁄]–áw]÷U_uFQPàTíEÅS∫(í\"e°ë€´nmök .*»Hπ,2/¢M¬—ÿÛm6hã6¥∂˛ùÁô“≤Ë¿è=¸?Œﬁw;GàÂÎ.S$)ì)[‘˛≥∫%≤äÌE]¢eç”‡3∫7á	öIìﬁŒt//˜0z°à⁄çÆJµŒ_èvìI„—˙A\Zyî·lO¡7Î≠zA∆6œñTøfA$@AhxœÃ\"Ñ»œ\0\\“£eWtÍÛOÕ;YEU•´\"jãµ‚]n°£ò…N‡C6¿Ãd˝e}Êº∞«⁄@YÍpWoó;…˜;ÒÊ0∆Ê›òòƒ‘¬Sº]A˚KÜf“»{-3\'eñ:‹ù¬PÍ\\5⁄\Zi¿Û¥Çﬂxïvc<3Ê3ûÒ`Lj‰\rßª@YÍPó60V>X∂Ãö‡˘rèìÌJY1ú≤¡˚’¡–¸LjOíú°,u®Àlp≠õ’ãËùkÇÎÛU$n¿ìh√√Ñô°y qìΩﬁπfPñ:KV;JFÉ«a—Í°hó`˚‘G‹gºôqƒõXS¥À2sî•øÇŒÆ„qüw\'Ã—\Z¥EO·∂Zãvı,Ó|¨c:‘s¨ëgVk∞_f©√]˛+QUﬁgàûü:àÎ·j\\õ9\"?è¢%|å°9ØU£^f(Kù¸aíáA◊ULOQª…]ë:3πW¶°i˙\0L°<Õr&ç< PVßãﬂGzÈ(Kcm_©∫kh+NèÔF}`C3i‰QÊœ£\\xôÏÚ¢(Ú¬tãñí{+}Â}eaÇf“ÿ≥ˇÎ2.C∑“ 1.b`ÕÚw¸F;œµüY∆◊\0\0\0%tEXtdate:create\02009-09-13T16:20:19+02:00©Ò\0\0\0%tEXtdate:modify\02009-09-13T16:20:19+02:00ÿ¨ßß\0\0\0\0IENDÆB`Ç','16','16'),(8,'ICON_WARNING','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0gAMA\0\0Ÿ‹≤⁄\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0\0H\0\0\0H\0F…k>\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0]IDAT8ÀuìÕkSA≈ß≠Ë¢âä∏rë≠–¯T¥¢≈ä\"j˝¬Ö⁄l\\hu%(F\\DW.¥§M“ƒ§¢¡\ZåÌ¬œïI„BC”$$êJ⁄ê§.,Û¨ƒäxºg^¨≠≈ÅÔrÓ9ÛﬁºôQÍüÒ÷≠iJ∫ïE∞5∞PcÔø#5®T:§ö∆=™-ÂSÆÏê%û∞©HXSìûùzóç	øfU ´π∆ÈÚõ√0™∑Ò˝Àà∆®ˆÅ\Z{Ù–ÀÃﬂ7{ZÖ®≠fTÆ\0?ø^Ø\Zº-\n£‚=Ù¶ZtVø]>mK.º~ (ù‹BPx¸5Yà!°F©Ù2£ø\"sGfíıUÌ@Õ	◊ÅØ}¿º¯6d205„ÜpïƒV0ìñ¨Jˆ+k6¥&V+>ı≥óÄ9˘¶p´Å‘s2ÒÏeÒúΩÃ0´í ñøøÆXü<îzÄÚY†zòëÒÒö…å”‘ ≤ƒíı…„`ÜYsÇ{kãıÃ†pxw\n(ûﬁã˘√÷‘ÿO=sÃ¸ô¿ö\r ∆v„˚ÅT7ê>dNŸ”BèYScO<Ù2√¨¸ƒfná´<“ƒ˜±.`L&J^wõ∞¶€#û}(è⁄¡≥Ê6˙dC≠S∆ì‡Y\'tß<wœªLXk≠Ù–ÀåﬁF}ê˙+Öªj∆„m@T&â»dëÌ\r:¥∆=ÙN¯õ’‚ë^< “»[ßÀ·Õ®\r∑£>ºC√ö\Z{fx…Q^vô¸rôïùÎÀV«ÛAKë∞¶∆=+.”“ëÙ\nπŒ>el\r¨ZÛÆÙˇå«; Ø¢ÈX\0\0\0%tEXtdate:create\02009-09-13T16:20:21+02:00ëVü\0\0\0%tEXtdate:modify\02009-09-13T16:20:21+02:00eÃÓ#\0\0\0\0IENDÆB`Ç','16','16'),(9,'ICON_ERROR','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0gAMA\0\0Ÿ‹≤⁄\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0\0H\0\0\0H\0F…k>\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0MIDAT8Àuì€KTQ∆∑:i÷å—≈â»Ñ4»K/AaTí˘–MäÇ‘∫RXdOYÑ†VÇ]¥úS&kH\rä.b¡¯ê•E∑°ÈAëfﬁ«¿_kùmåò¯ò≈wYgˆ>k3Ái¥ì\"ønAÓ‹3‹¬O@–-¶cä¸)¶)òÂ\nÁÊDZ+\'Z±zÛÖ;çq˘å9Zì=1r∂íXØüƒË¡[b}~îSM=Í\rÃ˚\\iFÖ˛ÇıSÒûf¶¬‰¯3j19Ïp™©GΩæE.\'´o6Ú◊6ÖºÀ«„æ:¯ˆ~Ù¬ÿ+¯5h1ˆ\Z~ˆ¡˜ß®\'‰]1ÆÕö.yªﬂò¶ë£eÆ\"˜`∏>á‡Î3ã/R.r_<≠®W3›í’[˜ó,éƒ\Z™°ˇ\nºhÄÅVxﬂ&ÅáÇ[‹Üóç‚©CΩö—¨6»\rg/ã&ö+°Û4<æa9Jo=<o¥Ë´∑\\èhèŒ†^Õh÷6XôM\\€-á‡N<8˛Û“ÇÖ÷ ›≠r<Í’Ãøû`fz$vb;\\›◊˜@É4ª!Õn±∏yX∏¢ïãßıj∆9BwZ™Ωƒí<®ŸÁ6√≈®›óK-jwZNµö≠ålÀ≥ó(Ÿ‰gÙdé«A’8ñ’·xÅ†–÷ âØ(\"îïô¸å:©)vêVπß‚Â˘LW¨ÉΩﬁ$ˆ≠v8’˙≥›Œ i&0Ô(/Õò¯TË%VöCb˜ZZ+ß⁄£<œ2Î˘ÇÈÆ°∞;#™–ZπóiÓ:∑€’ıÃZgO˚Î¸_Ÿ¡¶bÌ\0\0\0%tEXtdate:create\02009-09-13T16:20:20+02:00≤Ê]+\0\0\0%tEXtdate:modify\02009-09-13T16:20:20+02:00√ªÂó\0\0\0\0IENDÆB`Ç','16','16'),(10,'ICON_HELP','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Oc#\"\0\0\0bKGDˇˇˇˇˇˇ	X˜‹\0\0\0	pHYs\0\07\\\0\07\\À«§π\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0ëIDATH«ùï{T”e«ﬂÉ8Grv»BÕÅîRä\"Ü÷†,≠‘Tí:!DÂ~Cπ\r8»≈ÀJrSKÑTe	Ü¿ÿclÉπÅ‡À∏dOœÔ«˛È‘9ù”ÔüœÔ˜Ó˚>ﬂÁ}ﬁÁ}G»>+äœ/†∏¨Ì‹\"∆6B÷∏_î≤ä	˘‰Õoÿ	YÎz˘$[ÅﬂW¨+®˜.] ÿJß‡¬.ÚûçÎÆH)Æ-˘˙1#åﬂ´°.ÔX∏‚ä¡*{}(Ø÷VtsqelG]Æ¸÷‚≤∏Qïº…~ ÏÖ;r—=k„ûêöE!üI´g8cbõOVï3v≤MWÌÒØÜ\\õõ:ä€Z+)˙ÚØ˚0˜öwÑW:⁄:…£Ó™¯~í¸K-W@ôtÓÍ¬.;Ä.∑í’û»c5vj@Rnyr∑3Ä_«ôÔ%ÔBßì>~‡ß^’LÛS’uA5ÑÏ∂©a≤gáË] go‚Ω}ìv\rUèS/é .éY›ÆW™Tnπ¸ô?Œ1∫Ö-+ñﬁ}ıd˜ãhx©ÊªûRÄ>ß·Âchÿ_6≤|Ï[\0·/∑≠5ﬂ†nÒµıó\0·Ÿ_\'+g\0∏Â¶.yXh\\jv\'ÿ˛ﬁç¿’Ñ¨ìíçÑøoÏ>áˆı≥Æ†^v◊x;è∞}#-Œ+π≥Níx\0ımîi\0¸µ_U ÷\04‘yi_ÄO –&°$\0Á \Zé˜E¢ÓnQ¶\"ÁıóÒî˝\0‹ŸÁmªìÿ∑¥ÓU6|ºIÍ≤ô8»;⁄ñ\n´*—ÑXéâE…i\nè¿¥˙Êπ\0Îü	πíÌ\0ÎŒ\nﬂîL¨˝\\Ë*mÿﬁ|v{g(¿ı≠-z7Ää“V±·4íä˚P∑ˇTz◊˜8ÔtæA1Åq~?ÌØƒƒ=ˆ‰º\'«\nY˛q™M)ò~Ar}U+óÓv˝}V—4ø–»ü\nDEã¸R´[Ù\0Àú3m≈±\0Ó¬Ã»ˆ–üe%¡í‰sÚtï–Ëód«Ò{ô–\\VåzA∂uÁ|‘ó‰ÃÎ⁄â¨…—)ˆSqrç›˘e«tã¶˘«sdc¢cÑÏÔpaÂc˚<ÔsŸÂÈ˛…∆CÚ6ÌÕ+\0Ï,xQ≠FÄY:~û∏¿uCzö§‡∆Hkê˛@ÔüÜ¬±LÄ∆5*…h¿Ô£\"9n≈Ïóì;ªp+Êºî:_Ò∆a¶¯vcOÿH˘„›X1FGÏßäy!1∫ó∞K0ÅPÀÊ0Í%4Ô°˛`qpeK\n„√\\€∂XÃä®kﬂ`ïıáƒ`%;ØñZaø´q˙ƒ*\0M„PÒ∏\0‡ı£Èµäõ®üó≠ËAnåOT:Qq‚‰™y\0ƒ\"nPçqâ÷S*?A/§w9ªs≥®RÑØlˇñ*MÑΩ‰9%å|±#ÑÊ∞¨ç¶JæõÈ„‘`Ö7V†j»fK‹;:ƒØ¿qM˙Yµ•ãkÓÒ•»´ÏSLhx¥ö\"øY[O11C\'!suJí§?}:IıB‘èùZ¡tB¢ow˘P¬òõT		âΩ™\\LÛö\nõà˝iz®˙\Z\Zﬂ⁄4ﬁD3~Çâ„2}D\'Ã?ÆSR<ú–ÔIÒHÙ„ÀìÇ≠h÷Ê¶·%`ç¯–M;™<CsBYÜ«ÉƒØQ£éoKÔ\\zö|\03>ﬂ[S\0‡π@xÒQ4ﬁwå&&hÜO.§∆øº”wÑ“%u\r–H.~2J1≈EüF3D/U\"ø0LwAn—W“	j{õ)≠hxé·“.£.åDeﬂV„\\I÷c,ÌúÍ¨¬æ√ÿÑ¬vO„\0Ì{√≤	‹SÌ˙·û	<Æ7æk/4∂\0º6;á9êO:ﬁ¢)–?5∫!3Ù£x„§¸fÿN\nJ…“?˚€ïútÎâ9Õ=ÉwôXúdõ\'Œ°(|CFyk⁄`Fï˛c∏ÁŒ»Æ«–PÙë· ¿á÷EÿıÓyﬁ˙•ÿÌºÃ˘˙¯Öÿ¶»\r1™π8_e(	¯ôê¥àò™é˝ÁBÃES4√-ph[)eÆ¬&›Ò ⁄›Ö8$p‘ór,úƒM}”BÛ?éDi5C”é¥\Zc[¢@S€dOúV®œ‰x·ºÂ÷πE»<ÚN83»WfÚπlÚ=l¢ô◊_∞ù\"k›ÌÃß»^Jà≈j´>ß∑1`∂◊]É7w˛¶‰√ù∞Iç„º283P˜æUØìøiû…ÿécäõeÚ1≈7€˚LΩΩ3Ë<n}\0\0\0%tEXtdate:create\02009-09-15T09:07:06+02:00¿Mês\0\0\0%tEXtdate:modify\02009-09-15T09:07:06+02:00±(œ\0\0\0tEXtSoftware\0www.inkscape.orgõÓ<\Z\0\0\0\0IENDÆB`Ç','16','16'),(11,'ICON_INFO','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Oc#\"\0\0\0bKGDˇˇˇˇˇˇ	X˜‹\0\0\0	pHYs\0\07\\\0\07\\À«§π\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0ëIDATH«ùï{T”e«ﬂÉ8Grv»BÕÅîRä\"Ü÷†,≠‘Tí:!DÂ~Cπ\r8»≈ÀJrSKÑTe	Ü¿ÿclÉπÅ‡À∏dOœÔ«˛È‘9ù”ÔüœÔ˜Ó˚>ﬂÁ}ﬁÁ}G»>+äœ/†∏¨Ì‹\"∆6B÷∏_î≤ä	˘‰Õoÿ	YÎz˘$[ÅﬂW¨+®˜.] ÿJß‡¬.ÚûçÎÆH)Æ-˘˙1#åﬂ´°.ÔX∏‚ä¡*{}(Ø÷VtsqelG]Æ¸÷‚≤∏Qïº…~ ÏÖ;r—=k„ûêöE!üI´g8cbõOVï3v≤MWÌÒØÜ\\õõ:ä€Z+)˙ÚØ˚0˜öwÑW:⁄:…£Ó™¯~í¸K-W@ôtÓÍ¬.;Ä.∑í’û»c5vj@Rnyr∑3Ä_«ôÔ%ÔBßì>~‡ß^’LÛS’uA5ÑÏ∂©a≤gáË] go‚Ω}ìv\rUèS/é .éY›ÆW™Tnπ¸ô?Œ1∫Ö-+ñﬁ}ıd˜ãhx©ÊªûRÄ>ß·Âchÿ_6≤|Ï[\0·/∑≠5ﬂ†nÒµıó\0·Ÿ_\'+g\0∏Â¶.yXh\\jv\'ÿ˛ﬁç¿’Ñ¨ìíçÑøoÏ>áˆı≥Æ†^v◊x;è∞}#-Œ+π≥Níx\0ımîi\0¸µ_U ÷\04‘yi_ÄO –&°$\0Á \Zé˜E¢ÓnQ¶\"ÁıóÒî˝\0‹ŸÁmªìÿ∑¥ÓU6|ºIÍ≤ô8»;⁄ñ\n´*—ÑXéâE…i\nè¿¥˙Êπ\0Îü	πíÌ\0ÎŒ\nﬂîL¨˝\\Ë*mÿﬁ|v{g(¿ı≠-z7Ää“V±·4íä˚P∑ˇTz◊˜8ÔtæA1Åq~?ÌØƒƒ=ˆ‰º\'«\nY˛q™M)ò~Ar}U+óÓv˝}V—4ø–»ü\nDEã¸R´[Ù\0Àú3m≈±\0Ó¬Ã»ˆ–üe%¡í‰sÚtï–Ëód«Ò{ô–\\VåzA∂uÁ|‘ó‰ÃÎ⁄â¨…—)ˆSqrç›˘e«tã¶˘«sdc¢cÑÏÔpaÂc˚<ÔsŸÂÈ˛…∆CÚ6ÌÕ+\0Ï,xQ≠FÄY:~û∏¿uCzö§‡∆Hkê˛@ÔüÜ¬±LÄ∆5*…h¿Ô£\"9n≈Ïóì;ªp+Êºî:_Ò∆a¶¯vcOÿH˘„›X1FGÏßäy!1∫ó∞K0ÅPÀÊ0Í%4Ô°˛`qpeK\n„√\\€∂XÃä®kﬂ`ïıáƒ`%;ØñZaø´q˙ƒ*\0M„PÒ∏\0‡ı£Èµäõ®üó≠ËAnåOT:Qq‚‰™y\0ƒ\"nPçqâ÷S*?A/§w9ªs≥®RÑØlˇñ*MÑΩ‰9%å|±#ÑÊ∞¨ç¶JæõÈ„‘`Ö7V†j»fK‹;:ƒØ¿qM˙Yµ•ãkÓÒ•»´ÏSLhx¥ö\"øY[O11C\'!suJí§?}:IıB‘èùZ¡tB¢ow˘P¬òõT		âΩ™\\LÛö\nõà˝iz®˙\Z\Zﬂ⁄4ﬁD3~Çâ„2}D\'Ã?ÆSR<ú–ÔIÒHÙ„ÀìÇ≠h÷Ê¶·%`ç¯–M;™<CsBYÜ«ÉƒØQ£éoKÔ\\zö|\03>ﬂ[S\0‡π@xÒQ4ﬁwå&&hÜO.§∆øº”wÑ“%u\r–H.~2J1≈EüF3D/U\"ø0LwAn—W“	j{õ)≠hxé·“.£.åDeﬂV„\\I÷c,ÌúÍ¨¬æ√ÿÑ¬vO„\0Ì{√≤	‹SÌ˙·û	<Æ7æk/4∂\0º6;á9êO:ﬁ¢)–?5∫!3Ù£x„§¸fÿN\nJ…“?˚€ïútÎâ9Õ=ÉwôXúdõ\'Œ°(|CFyk⁄`Fï˛c∏ÁŒ»Æ«–PÙë· ¿á÷EÿıÓyﬁ˙•ÿÌºÃ˘˙¯Öÿ¶»\r1™π8_e(	¯ôê¥àò™é˝ÁBÃES4√-ph[)eÆ¬&›Ò ⁄›Ö8$p‘ór,úƒM}”BÛ?éDi5C”é¥\Zc[¢@S€dOúV®œ‰x·ºÂ÷πE»<ÚN83»WfÚπlÚ=l¢ô◊_∞ù\"k›ÌÃß»^Jà≈j´>ß∑1`∂◊]É7w˛¶‰√ù∞Iç„º283P˜æUØìøiû…ÿécäõeÚ1≈7€˚LΩΩ3Ë<n}\0\0\0%tEXtdate:create\02009-09-15T09:07:06+02:00¿Mês\0\0\0%tEXtdate:modify\02009-09-15T09:07:06+02:00±(œ\0\0\0tEXtSoftware\0www.inkscape.orgõÓ<\Z\0\0\0\0IENDÆB`Ç','16','16'),(12,'ICON_ADD_FAVORITE','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0Ûˇa\0\0\0bKGD\0ˇ\0ˇ\0ˇ†Ωßì\0\0\0	pHYs\0\0\0H\0\0\0H\0F…k>\0\0\0	vpAg\0\0\0\0\0\0\0\\∆≠√\0\0œIDAT8Àc`†¯¥1Ü·›∫(ﬁSì}Ñ~mã#MÛﬂ]1øwƒql“›EÅç@!F?K‚\r¯≥\'å·œ&˛ß2~8ò|wuç© Œ.;‚4ˇﬁÔ«˚@(√Ô}AøÔó~ˇ˘∞¸ˇ’•ÆÂˇˇc∞‘ƒ‚‹cøè˙3˝9‰œÒkáõ–œ]n\n?wªö˛<∂˝ÁÎäˇ?ﬂU˝}$ËÚÉ5Æ?X´~›k.ˆÎ¨œ˜{éÃˇˇG30<X„¬poï≥‹ß›ú\ræÙ˝j‰√Ô7¢?|{îÚ˜€ªÇˇﬂﬁ˛ˇˆ$ıﬂ◊õüø^yˆÌí˜ı\';ÕwL,U¥ˇˇøìÅacá	CE∏:”ù5v°N˚>˛Ú,˛ˇÁ7)ˇ?øNF≈@±//„ˇ?=·¸ynΩrõ¨8õPúè(ƒSãï˛ˇˇœpm•âÀõSN7>>\n¸ˇ·y(\n˛Ù$ˇ˝#o{´ƒkò¯4ÙôP√¢.IÇ·ˇ;Ü˚[t}ﬁ_±˘ÚÓâ«ˇwO‹¡¯=ê˝‰∫Âø…+åo7oã€›v bjÍv›Æı	®Ü|8©ƒöÓoØ˝–Íˇõáñˇﬂ<∞¸ˇÍÅ≈ˇıg≠ˇ/ΩVıˇÏ´mˇ7ﬂùø˝hë‡\rúàƒÒÓ¥√€s*ÔŒ(ææ©˘ˇÂM≠ˇ∑è(Ωπ{TÒ—Ω+™ˇñ^˜ˇÒÀñˇü~ø˙˚”±ˇKÔÊ}À€Ø7‡˝IÜˇﬂûóôwˇÑÃœãƒ∂\'Ò¯L©Â”ŸøQ®k˛UÎ◊ø÷˝Ò„Íˇ&˛_ƒÛC·A%7∏˜ã0º:+ πoôPOC>OûÑì<PòÑÅ¡≈õ±F&c∆}´7€^Áˇ_˙‹ÎwÛy≠Y.SYy‡î§q2‰\'q2©(0ãπ ¨ƒ˙@lƒ\ZÃ‹Jv‹¡·ÛÖZ˝&	d™≥H≈ôq•h fb.(Ê\0b6®(\r¬å\0[$qü®%E\0\0\0%tEXtdate:create\02009-09-13T13:14:48+02:00 @o£\0\0\0%tEXtdate:modify\02009-09-13T13:14:48+02:00ª◊\0\0\0tEXtSoftware\0www.inkscape.orgõÓ<\Z\0\0\0\0IENDÆB`Ç','16','16'),(13,'ICON_HOME','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0Ä\0\0\0Ä\0\0\0√>aÀ\0\0\0gAMA\0\0Ÿ‹≤⁄\0\0 \0IDATxúÌ}wî%W}Êwo•ó:Á0°{Ç$#h$Õ(ílcíla»ÄçÖ¬Ï≤∞˜¨óıûµçÒÆa9$ÿCê–H≤l°\02BBÃhF\rH3£…©\'ˆÃtøX·ﬁﬂ˛q´ﬁ´~˝BΩNØg∂ø9u∫˚Ux∑Ó˜›_∫∑jÄ%,a	KX¬ñ∞Ñ%,a	KX¬ñˇX≥∞êËyœΩ©Æ.πrÇZﬁ|Lvvt±Ù\0åSÀæ~~˙LKˇt|úÔ?πÒ∆L≥€∫P8Ô–uÛ7[FÔüª&GÊÛÎ„ñ¿˝£$8 i«Y·TÇ9ˇC·ôú{‚„ﬂ∫%›Ãˆœ7ŒkÙ‹ˆÿi§>Â¿\Zï‡\0»ﬂCUŒ`≈ü&ÏΩ-»|Ó‰ùµ˘omsp^\n`‰ñª◊fµéœù§Æw™^Ñ6˛PRú˘‘æoﬁÙ \\∂s1‡º¿≤è<tÌ∏lª;á‰ ÁË™	dètÒâõ}˝ùOœ—EŒ+Ù}‰·7ùïmÿàµÕ|‘WÉÖ¬D;üx◊ÒØø˝…9æx”pﬁ¿\'ˇ_lƒZ#ìπ,&€˘ƒ\rÁãŒ4Dæ ¿ïÄ$@˜≥\0Oú¥z]r~â‡ú@dÚ%éDgWoæ®\r´zL¥õ\0Ä£gÏ=È‡âÌ8=^\0LÆQÁèŒiD&ﬂì0\r˚›~‹z]/VvàkÄwk\0Úÿ?Ó‚Æüü¿Wû8◊%QÁáŒYD&ﬂïËn3Òïé‚]ó∂¢‡(ã/iÍÕ3\Z3Ä˚_òƒ«æªß&Â™‚‹¡9)Ä»‰;›Ì&æsÎ\Z¸ﬁEILÊ’«¨ ]ì©÷8ƒˆ,˛ÏÆ]8u÷Q.°*ŒmhÕn@£hî¸oﬂ≤oæ0ââºR;cÍ,Iäp\"Lπå$†‡Ùõ∏dyyπ¨W380,èÙ∫/ˇ„Á≤[∞oÆÓu!pN	†Úª⁄M|Î√´Ò∆SH‘±˘B2ü|l\0òMBIØ^û¬„€\'ê?OEpŒ†!Ú€|Ûñ5x„ä|b(Ñ=Y\n˛XY˙¿ˆÄ˙,\\≤<Ö«_>ã|Núw\"8\'–(˘w›\\\"!Ú]*˚÷ |µ¢%œë§D∞¶œ¬´ó∑‡âÛPã^\0çD˚ùmæÒÁk¶ò}†Dæ\"V\Zı·—_t	≤d	$\0€÷ˆY∏xyûÿ~˘¸˘#ÇE-ÄÜ»o5µ≠¡.H!S J>ﬂäÿZ9OpıbL@•lÅ|K∞∂œ¬≈ÀZ”ÛHãV\0\rëﬂb‡´>˘i€?÷Á∆æŸ»~V€®î%T¡ö^Ø\Zn¡ì;Œ,J4B~GãÅØ¸Ÿjº˛Ç§†`‰3‰”¥ë/Äj\0\0Ñ±¢$ló∞∫œ¬Ôß≥ÌÁºù\0\Z%ˇK∫\Z◊≠mA¶ K—>©ë/≥\"5»˚âM%æ\\“ˇE¯á∫ñ`{Ñ5}1\\4ú¬œvL†pã`Q	†QÚøÅ’∏nM2∂äÌÉhø ‘Ë\r£Hº Ç@Å†|êñ†4?$	æ%P\"xÍ¡¢@#‰∑∑¯ﬂÔ_Ök◊∂\"]êC>U≈Û»è‚CŒﬁˇ¯ˇ‡åÈ+e¡gæhÑ/Œ‡[B¡Vı∆p·pOÌ<7E∞(–(˘ˇÙ\'´pÕöV§B˘gﬂú<‰≥È‰°—@Ûg|9S1É†Ry8LæÑˇ9\0è‘∆¬ñ¿#¨Íâ„Ç¡$û~Â‹A”–˘)ˇx”*\\≥∫Y[îä<‰=@)r(™\0•QL>y¶∆†3⁄SÂa/d1$Ö≠\0ï‹ÅÜ(â`Ì`œÏ:∑D–T4B~[J«?ºoÆ^”Üå-‘HˆÉ≤úGÑb∑8⁄ÉÕ∑˚$ŒK÷˙ñYà¿HU..á®îB}Ó	¿%Ä˚AÅ$¿Ñ—û8V$ãW&`Œ\r4M\0ç,ÊhKÈ¯ªW·Í’≠»D±»#	»9Ä\'’˘‰˚˝àà‰∞tV	Äephú¡Tt\rå©Î	Y≤\0˘Am@Y%:ŒK«ÿûƒ™û8V$ÒÏÆsCM@#‰∑&u¸èwè‚™’≠»‰£ú|6Õœá”;Œb:ä%`\0HòOøí∆¡q´{-8Å¸∏¿ìÍ⁄·2q8&êé)q¨≤âëûVı\'ÏÓ	ÿ∂®πº¨Ÿ\"Xp4FæÅøy◊Æ\\›™Ú¸P¥üuÆ@±∏K·ü8b∫\n»O\rìñÜgv•Òüæ∑èm;ÉﬂNb¥7€£‚1J,‰Hë/ŸîyO¡†-Å*çÙƒ0⁄ü¿¶›ÈE-Ç@#‰∑$u|˙Ül>îæ¨∏æœÚ˜¿4ÑKπ\Zcà\0c¨8∫ìñÜ_Ïûƒ\'∞∂+ÒÛW&q·P£=qÿÇä-”8‡äê%êS]A Wê≤\\	M‡xÑï›qåˆ«±iœ$úE*Ç@C‰\'t¸ó?Zâı£ä¸ Hìƒê∂	é E*P\"ﬁˇù¿ â†qÆ»G…Ï‰ˇ’›˚pf“-./‰û~eká‚Ìâ¡ˆdQHJÆà,¡‘â#Gé$Ë˛\\≤$ÇÌI¨Ëéae_œ-R,à\0\Z%ˇØÆ_â+B‰>“&∏EÚY©nÚ˘D™èìÜJ’¬‰?ªkˇ˘û}8õvß.ˆã` ÅëÂ¸ÿ\Z\\IEw KÄ©VAπÇŒK.¬ˆÀª„ÈâcÀﬁ≈\'Çy@#‰ß:>ıŒï∏|¥9[…LÆıE˚°—/Hô·§¡BC¬‰xvw\Z}oÚ¯\"xf◊$÷$∞≤;«#5ôÂN©ÑPÃ¸’EÂÓ¿Ä¡YQêÅVÙƒ±uﬂ‚¡º\n :˘ÑTB«\'ﬁæóç¥ ™ÌŒhäœ/è¯Å‡AÜ§©ä:¡Ëçõ\Z~πgüﬁ∏’»‡ã‡Ÿ›ìX=« Óò≤˛nù´Ö%é\'’Cà¡oè+	éßñôáSƒÂ]1,Ôâ„Ö˝ÈE#Çy@#‰\'\Z>˛∂ÂX7“Ç¨SZô\'àp6Op$!»‡’hgSÊı%Œê4π™¯Wàõ\Z6ÌI„øﬂÅ¸\0E§±™?ÅÜé$øv¿ä£?É$Â:lIpÑÉ ÇÌñu[X÷«Øˆg‡ÿ≤È\"ò4D~\\√_ºu.]Ÿä¨#@§®ˆ8õópƒ‘e\\Â9ø$≈kã…¡∏\ZâÜÑ©aÛﬁI¸Ì˝˚1ë—»†1ÿyâMª\'0⁄«ä.ïHﬂ◊Ëå¡ä‡¢;Ñ ©Ë°*Ñ:‡ã≈Ò$Ü;cÓé·◊˚”pùÊä`Œ–(˘yÀ0^∑¢9Wïw≥&\'aπ¿üÜÉ=	Âk[,V˘%Ú”¯˚`2Î5F~\0ç¡∂6ÌNc§/éÂ] H?ü‘9`HA`(|+X«S””&GQÿéêÓ¥0‘√∂ô¶ä`N–˘â∏Ü[oØY—äú_€gåAH‡t^¬ˆ®∏¶Ø8wèrÚÅKMÊe€∏©·π}i|ˆ¡Éä¸Zœ˜	ˇ§jùœl[‚π=i¨ÏãaYó˙AÅ¡’Ùs∞Ï,(ﬂ\r1Å#‘˝Ë\ZÛ3\ZÂÜ∫bÏ≤∞Ì`ÛD0gàLæP‰¯wáp… ‰Y,ø\nIœ‰´yﬁ»|ì+U¿◊\Z„‡S»ﬂ∫7çˇıoá|Úk¨u$Ü{,¥&4LN÷xË√¡ñΩi¨ÏçcYó€ìjµ\0Cc∞=\nYÇ«jï\ZA(xSÇj¶„;bÍä·7á2p›Ö¡ú†!Ú-éΩyó,O°‡P—Ï{8ïó∞=uh0⁄˛ÈõUSchãÒ‚»˘œÔK„sB:Wá|[ëˇË«◊‡Îª–∂	%ÇjÁ¯\"ÿ∫7çΩ1wY~äÄÖ-¡‘Ï†ò*í*1€B•Ñ¶¶ƒ]ÅÖÅ./L√uiAE0k4B~‹“¡7\r·‚Â-»;¢x¥ ‡dN†|òjÚÅ“»7uÜˆÄ|üehxa\Z_¯—!§s\"˘&¸ÿjºvYΩ≠^A\nèºT_é-Ò¸æ4ñ˜®QÎxB˙OsÜÇ UJ&ø>P¨P—ÿB=vfÍ•©dG⁄-ÙwZx˘PﬁZÇY	†1Ú9ﬁˇÜA\\ºLô}\"*|\'≤è¿ôö¿)çxbá˘‰kqÚ˘qÉ„W˚”¯“#áëâL˛*¨[ëÇÁ	H©2%Ç…H\"¯’˛4Üª-u∆‡à &PÊΩ‡ëü105ÅDAlä;∞ÖD¡#zöAH©D–a°Ø”ƒˆ¡å–(˘Ô{˝ ^µ,•»G`ˆ	\'≤yè‘™€≤@è¸  ø3\"üÄò…Ò´˝¸Ûc3#?ÄîÑ·ŒXC\"¯ıÅÜªcÏ∞`ãRLà p¡V ®¯»ôW#π°ø›B_áÖá3¿ÃH\0çö˝Ø¿E√)\\Y¨’{˛»œª•e\\äpuΩ‚¸ªÔÛªí⁄îÄ/fr¸˙@_ˇÒadÛ3\'?¿åD∞?Å	WPH¨d	BìFAä∏ y∑¥PEí*%˜∑«–€nbÁëÏºã†a›ˆ‡«©ÛA\'˘1ì„›◊‡¢·$\nn)’Û$·xZ Ô‰áórQiJW™ŒÈNh˛»\',Éc€¡,Ó˙…ë»‰ˇÀ_å‚≤ï)ıÍó*‹¡ukìx4Ç\\Gb€ÅÜ∫bh∑‡˙s¶Œê˜î‹Å\Z˝ Ç	Û ∆|w ˝¥±Ø›BoªÖW∆¢â¿%˝Ü˛u◊oN?œ˛Íù1\r	`Ì˜\\~î˙‰ ^˚=|>˘Ô∫∫%ë˜G>\0xÇp,#ëÛÕ˛ìèíÈ»ÔI®ë/¸åip¸Ê`ﬂzb,\"˘V$ÚHIX÷kHø9ò¡@ßÖ˛éG≈g,\r»cÇ∞(’ ‰]BÃ€@™‘‹€f¢ßÕ¬Æ±,<ØûLÀÅ˘á´Æ¯˝\'«∑ﬁ7V˜F}D¿Í?¯¢u¢uÙ°,R+PÎ\rúÇ≥8n∏Jë_4˚P©ﬁ±å@.lˆQ\"˛OA@LcËIÍE≥R—˛Ká≤¯Œìc»E˘≈e#IïcGDQkíxÙÂh\"¯Ì°,:cËo≥‡x≤¯\"KÁ»{≤8Ω<E(π[Ú.!n0p’ç°ØÕBOªÖ›GÎYÇÄÛH_ø¨Á“oüﬁ˝X}µ£Xo˛_>ÖÆw‘˘«]Ÿèµ˘(-¥<ö»π≤∏*∑$ÄíŸR-·ÍIÍ–Büipº|8ãÔ˛Ï(rÖh‰?—\\>íÇ„¯+ä™Ω®D!$ñu[∏vMèæúÆ/W‚•CYÙw™ ŒÒc¿2ÚÆúö\"Ó à†‹Eﬁ%ƒÕRu”ìÑﬁv=m—D`#÷gµ[]ôÁpî{ç$ÄÂ∑›È1Í˝\Z1≠z]’\'ˇ˙\r}X\"˛bä£iÅ¨„ßz·eπæÁìﬂó“†ÖæÄ¸Ô?u˘:+mUÖo:˘3ÅÑÂ›±í“µ+Üû+ÒÚ°,z;LÙ∂õp=_L•|yGU	•\"Q∏dLDS,A0‚	BoªâÓ6{éÂÍàÄ!O÷Îñ]ˆ∂á\'ûø˜hΩ{å\"\0fÆ˚Á3¨Â5UGø$ƒ,\r◊ØÔ√⁄°lü¸`uÌ—¥áúK≈6S»Ê¶_ê\"ø?•Cf˛H-›ﬁq8ã{û>ç¸ÓÄ¸Ñönç6Ë´Bâ¿¬µkxÙ•h\"ÿq$á˛6_Ç •äwbWñ Å,=Ö,5S1ÅJ“‡≈æÇ–◊n¢ª’¬ûcyxû¨˙∫3b:7·µÊûˇﬁıÓØÆ\0zﬁso*Ô¸≤=QÒ\0I0uéwlË≈ö¡$lWBBÂ∂Æ$åfüïV”Õ>Bfﬂ‡˛»gEÛh€èd±Òô»€çêüÑmG˜˘ı0≈D¡Œ#9Ù¥õËiRDïƒÜº´Jµ Q*m;Çê˜	É3 O\0=Ì&∫⁄ÏÀAãd*@Ç\rvåæı´πó7:µÓ≠Ó<i{∑‹`ì—Qı\0	\\}q÷&PpEq	ï#%éLzjÅÉˇ@&A´cj‚ƒïSzì‹’>Cgÿ~8ã˚\"í?‘m‚˛;V‚ÚëÏÇïT‹\ZA¯<\"¿.\\>í¿˝w¨ƒPó©VÅVÉ∆ê∑6>s€gah˛cgRø=)KSKº–Ã°îÑ‡êuT:˛Ù£$B¡X;ò¿’w‘å≈m2:⁄ªÂÜz˜YW\0J]¶ÛäÊ_zª-\\≤2•Ã>#xí06°»gå¸≠6\"e•ø™∆“Ä˛îŒÇŒ \Z√Œ#Y<Ïq¢êﬂe‚Åè¨ƒ£I\n¢h[ IØ\'ÜÍ˚)ÖÇ¿£	<—h\"(ÿ<{;édaË™‡IÇ†/≈ai øÀ†O0µØ#dâ±	œèjõÌJ\\≤2Öﬁn≈ÍSY{¡tû°‘e’®PW\0∆ÂTÌ0.ZñÑerxæs%pd“C∆°)O›Ü7B8‡”¡òz÷NA◊véÂ‡/O†`Àà#Æç£ê/ç¸zò:¬£Y\"†êW\"∏ˇéÍé\"ây;è‰†i îªæ%Ëk—aij…y10,K2·»§◊üKà`ô-KV\rÀ∆ÂıÓ©Æ\0≤€P—÷¿MéÅNU#?Çœ	§m‰Kïo§û©ãÎ@ã Û=êtç„ï±⁄‘\0˘∑/«˙—Ú9e‰7JÓ¥€´x\rı\r˘º¿˙—$Óø=∫⁄tØåÂ†k\\•wBu~ãé∏Æ,—Ù˛í˛»O€„9•íjﬁ`†”7+g@˙‹’F]‰§ô™&3ù3§bzqñK¸Eùe+xBõ\'Åò¡0–™CÁ%ã`hª∆rxxÛ…h‰wô∏œ\'?a‰W\"¥÷V˚Z@./∞~4é˚n_—H<º˘$vÕ¡–xqƒÎh’3¸«–*ÙY–ú¨#ããòÑR1zçöÄ‚Æ6f∞XÆÏk¶uû˙LVÿ<©F˛Ä?ÚÖoça˜—›rREÔF˛}∑/√Üë8rÖ†„gFf„˜W¢&Wêÿ0ö¿}∑/ãd	l[‚ëÁ0Upí*=,Å¨‹w·æù´{\" ¡ùLµd⁄ìyQ\\±À†¸z¯m¡¯¸ÅïÁˇ)C„ÿs,á«\Z!ˇ∂eÿ0ö@∂ kvBif±±—›≤yÅ\r£	lº-∫€r{é˘ñÄT_hæbzÈÅ‘`‚ÅXx;`¿d^¿+RÃÁÆ6Í\n …\nõ*∆\0Èéû.¯O∆™\\∑#Œë0¸G©HmÆ?Ú[uh~™H0t`ÔÒ~ºÂl\'\Z˘oU#?ìë»´ˆ{%îÔèv} ì∏r$éç∑FÅ#Ò„-ß∞˜xÜ¿è˛5Æ˙(ÆOÔøÑtƒπ_3P«=]Ät© ¯‰>wµQW\0\Z‹-¨Z¬…Äùás(8≤∏Çó3`®’@oRC¬`H=I\r√m∆îÚÆ°3Ï=^àH>˘‰„ —8“>˘¢Eıâ-ﬂÌöÍÿt^‡ —86ﬁ:Ï«5Œü\"Çùcç√mzB˝◊õ‘0‘j¯etïâùásU+ù\Z‹-ıÓ°Æ\0R,≥‰UÆ©j\'O€ÿ∂?\r-i~ßt\'8ÜZuµÍËN®â_·w¨°{èÂÒì®‰w∏˜ña\\9¢»–Ëhm3qiﬂ‹{€0Ü∫åH\"¯…ñSÿ{,CG‰˛”4Üm˚”8y⁄Æ“w O¶XfkΩ˚¨+Ä≥ß¯&ãπgj]aÛˆ	Ï:íÉ©Û‚F∏>Lv0¶CÓÀ„Ò≠„ë»Ï2√[Üp’Hì˘“∫Ç\0ç¯ÎπÚ˝¡ı¶¶¸ÚU#1¸÷!F¡„[«±g,Sg˙èc◊ë6oü®…û≈‹3gOÒ∫.†Ó\\@ÓÂçn«∫˜Ω6á‰´+¶ÉåÅ$aˇ±∫[MX≈‹T≠r—É°s∏·≈Ω<ΩÌ\\è\"ëÔ-É∏j$é…Ç¨˙_ΩDùÊùTB¡ïX›m`√hèÌ»!ù©QÕ‰BˆÀÉq°ˇ“xÊ7g’<@’ê£ˇzÚªxOΩˆGöÓ^w√æ%>\\u:ÿüª>|ºÄC„Ö‚l ‡zß3.v…·ó€œbÁÅ,d$H5#ˇ√Éj‰dSIÆÖj÷¢(Çë8~\\O\r˜jNk‰zùl¸Ê(”¡ë{u‡ˆáøzî˙Ó®Z{‡W*∏¡°˘ÚêÆF‘˚è¬`óÓìØF~±±5D–ÅT#?¸ykå„Ÿ}º˜ˇåal‹Ã:ÌúmˇÅaÄˇ⁄—oº˝£QÓ!r!(y`˜\'⁄0π≠Ó)\Zt¶&{\\µIIj5MDÚÔπy\0WÆåa¢¨¬\'eıº.ã#µ|áî”3£ÈŸ0ë∏rƒ¬=7`∞KØ\0≥Î?p¥ar[Ú¿ÓODΩü»K¬NÔ~L¨\\˜ñ≠Y$˛ÿÉô®k	XŸV∂ƒ`∑âªo¿U+fnˆ¬D)>Ö∏Éı#q¸dgÈtù%m@„˝ér„√ªq◊o=Âå‡k\Z¬≠ˇˆ˙S¨„æ›5\'§A^bd–¬˜>4ÄÀóõ™∫à dF%x>Ñ%”®µØ5ÆaÀA¯ŒQÏ≥Å¯¨+Ò>8b»ùÍ¶3Ô>|◊ıO5rf√œLæp˜Å˛KﬂÒ3Œ∞ÆÄÿ¿¨÷\\ëöæÓUI¸ﬂ?Ì«ÎÜcòÃ{S©F‰B\na¶ia˘>€#¨Ó±¶x˘îã«]ı˛⁄7QôávLº–N„7æÎÜgΩ¬åûö|·ﬁ±éuW/…åNÊ•Zw¡\0p@j∞òÉø|Kæ˙ﬁ~Ù•4d©¸¬~¥∂œØ˘MåÕ*&æ£ﬁu\ZŸÁJ†øE√{/maÀﬁô\rä@Ø√=ÏÙ7LÏªiÏÆh‰\n·+Õ\nΩ∑<≤¡÷Ãè:dΩµ@fcjÕK@$W_C`\Z\\¥∞Ÿ1\\—z_¯Àõ†[q∏ûr\'BT^≈;€†QKU8Q2Å04?¥7tœŒ„ˇt7ûõ¿ı#M	≈æÚóâ  úA\0DcŒ∏…ÏG-·|ıƒ7ﬂV∑ÿS˙lN\0øõ:ﬂˇHÎ`kn›YëZ∆^kìuM©îÖ|k+œ≥~Ω¸,z¯¥ÒLY@ú\'êwÅÑQ∫^≠≠Fb≠}ú´Í§Á˘ÎÎÎø>^◊55W!⁄Ø’Œ®˚ÖÚ.–≈\'ÒÛ√ÑL·§Ï¿	Ÿéì≤ì2N6bì)d2≥ü—Ø€ıÃÊ3ìâÁOˇmìµo$\Zf-Ä\0ßøˇ∂…”¿øCm¿{ÓM≠Í>⁄q≠π˝∑&£V.8#“ ¡‡Bá≠¢)ØFh=Ñ°àgHg≤?}ôLéÎ˙ÑV_D¡9áiH•íËÍlGK*9mF±¢X]”É:tÙ≥Ë◊∆!â¡ÖáX˙iÁ¢WÔ9•ù…lº1\0„5øΩqÃô\0¶a„çô+?IJt$°¡É^ñ9Nü´/ˇªQ‡ú√Ûè√âSß·∫8g›Ä@¡vpv2É„\'«—€›â·¡~h\ZØj\r¬m´∑/¯©ﬁfäu¿ ¿ He	∫2ΩıÙûçüœFh¯å0\0êHË∫\r,B®QâÿôàÄ1!vÔ=à”gŒÇs]„U◊œWªg)∆éG°`cıËrpŒˆ˘5-FÕ]4$4ØÕÎ≈A∏¬ê[n	¬§£1¸cj6Ì–ëc?söà/ÇÔØ\0∆∏∆1~Ê¨#&V.,^¶“zÑpª+}.•,∂;õçÊ\nÄ‡?\'8=®ıwµ}å1L¶≥8~Ú8Á˛WÃ¶4¨ŒÂú„¯…SËÏhC*ô®\ZLVã*O´ï=≥jﬁ`ÆJQ3GÖ®TÛ¨Cµ†˛vj¸¥ˇ67ùÎOÀzû¿©Sß\"Pï9âp+}æ—tP)ˇ¨t|E0Od≤9qê?ˆ©ÇÔØLª<O…dsÑ(∆µFz•ﬂ+ªÕF” IÇHV@5ˇ_1K`˛€∂wZ∫5\r3Ëw∆◊Öê¨,,wCÂ˜|^~oã¡*4]\0@`Ωk˚œÚÄj⁄±RÇ§Ù∞úá6°\'ùÍOKW˙\\5SN˘ªŸX(G%≤£Ï§~N;$j*H”ˇ,6Ét—ÍÕ¿¢@TﬂX≠n¸SL;kÊÌ\n˛ï≈,·ÔÆ’÷≈ä&Ä¸ÅU;xj[É“ﬂ3J˜B‡Æf;\\´Ÿh∫P¡P˝Z{™“¡ÈK«ÁÍ“≤™®ÿñ\nüïÓ3à#ö´Ç¶ @˘»ü±ˇWVŸ1√†Ê5√á‘vS+úã#Xî\0¶ózÀÀ√·œBW©˜-≥ngy¬üï∑©R≥Rø0ö.ÄÚŒ¨Ùw≥R–FêŒW\Z®RA	Œ´Ø™Â j›g≥–tîõ÷äEû–æ\0U›@•Hp¶÷6|ôÊπò	4]\0ÍÂS+Å3Ì¨ii`q«l[9ª40º }.w–t\0S+Å•œj|UM‹6≠Íµi•{Sbm>Ö\0j°ºÛje\0*\rúj©gkÎ~PœBÕE}`!—T®\Z–Tì\ZuŸU’°ÃWœYw˚◊≠UàZ¡∑µŸrXî Jæﬂàeò/DÕãm‘á—t4jNk≈Å_\rü5≤†°YMˇ#Ä∫ÑSø(ù[30\\‰.` ±ıüw≥6ØK¬≤Vé\0T[5\"‰Û1©QkÚÛâô¥#|¨ê≤ûøÁ\rÛ*Ä§mÁTyTô¡“ô,xËmyb≠\0\0¡IDATAπt&ù\ZÆ’ÄŸˆû∫FËﬂÑß&º¶>ÓŒπzh≈jÙC~ŒÊU\0wﬁyß–øò3‰èÉZcßi⁄î5w¡RjY6W}ChÛØ1ã≠⁄5km·6ÌÊúC”JOBiú„ÿ1‰Œî0ÙÇÍ√˘√¸Ø\n&<Wmc¿∂óv!_∞ãÀ∏c0∫ÆÔ\n∂“yl—nÂÌ„úC◊uÜQ‹œ9Gæ`c€ow’~^•FﬂÕÊ=ÙHl—â	∆ÿ¥\'!]«¡#GÒ¬∂Ì∏f˝Îê/ÿ\0J\"hƒÃ™Œ–5\r ?[ò√‘ê§ÑÆi0M”p¥±∂Öè∑Lœl˛-éÖ°W¶ÄàÑG¢Óãgãy∑\0bÚÿvPµ8\0–8«ìOo∆K;ˆ fY•:Ê\"∏õjª#ÕÈW<gñm	ÓÖséòe·•{‰”õ°Ò\Z›O8$&èmü’G¿º?üÙ‚ã/zÎ6\\∑ö1vE•˝å1∏Æáª˜C◊4Ùıu#fô@DaÊóàpr¸¥ˇøm∞ÈÔŸâb*ù„ü«5éﬁÓ.hZ…]’€8c‡ö”–·∏6o›Ü=˛s8é[ÛÒ0}˜[ﬂ¯ Cë:yXêBêCŒóLòŒKV⁄Øi\Z<œ√#?}\Zø›±Ø∫p5Ü˚–íJ¿–ıHê1ıÙé„∫ûòÛ †\n&%Ú˘Bd¿‡z“ôè«K;v„‡Ù÷$ü(Îí˚Âπl’6.ƒó\0¿mˇÒØˇ„¸oÎÁzà1ÀÇÆ´ˇ3∏,Öú∑˙\ZÉ≤ç/â‡y€V±MüI˘7w~È˛nÊ-çé+Ô|ÒüΩ‡5Wøâq˛ÜZ«$ÑÄÁyµ≠à˘û†zÔ˘´\0∆L√® \0íÚg;_¸≈g˛íb¡‘SOy\\rÕ-DÚßåÒıé/O˝Ê≥MDÚ\0à›Ú‘SO5Æ¸bAüæÛÀüŸ#àÆ\'¢›˘ΩÁàh∑ ∫˛Œ/fœB~ÔÇø•‡Wõü9˛Íı”¿_≈YËÔ_å íO:‰ﬁÙÌ/˝œyO˚ —LÀo˝¯˝4>…kmb;ö\"ö$‡Ûw}Ò3è9{ÌjchÊ{JËÖÕO?ı⁄\rW˛+#.\0t\0H1∆öæFa>AD6ÄΩ |_0˜#ﬂ¸‚?ﬁè˘] Xã& zœ{>ÔË5WK]ﬂ¿â÷Å±À\0à7ªm≥D¿mïå=œ=o”ôŒÓçø0Ø≥|KX¬ñ∞Ñ%,a	KX¬ñ∞Ñ%,a	Â¯ÂÚ@å √Ã\0\0\0\0IENDÆB`Ç','16','16');
/*!40000 ALTER TABLE `ICONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSTANCE`
--

DROP TABLE IF EXISTS `INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INSTANCE` (
  `ID_INSTANCE` varchar(100) NOT NULL,
  `USERNAME` varchar(15) NOT NULL,
  `IP` varchar(15) NOT NULL COMMENT 'Direcci√≥n IP \nXXX.XXX.XXX.XXX',
  `LOCATION` varchar(15) DEFAULT NULL,
  `DT_CONNECTION` date NOT NULL,
  `TM_CONNECTION` time NOT NULL,
  `DT_END_CONNECTION` date DEFAULT NULL,
  `TM_END_CONNECTION` time DEFAULT NULL,
  PRIMARY KEY (`ID_INSTANCE`),
  KEY `fk_INSTANCE_USERS1_idx` (`USERNAME`),
  CONSTRAINT `fk_INSTANCE_USERS1` FOREIGN KEY (`USERNAME`) REFERENCES `USERS` (`USERNAME`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSTANCE`
--

LOCK TABLES `INSTANCE` WRITE;
/*!40000 ALTER TABLE `INSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOBS`
--

DROP TABLE IF EXISTS `JOBS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JOBS` (
  `ID_JOB` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(15) NOT NULL,
  `MIN_SALARY` int(11) NOT NULL,
  `MAX_SALARY` int(11) NOT NULL,
  PRIMARY KEY (`ID_JOB`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOBS`
--

LOCK TABLES `JOBS` WRITE;
/*!40000 ALTER TABLE `JOBS` DISABLE KEYS */;
INSERT INTO `JOBS` VALUES (1,'Administrador',600000,1000000);
/*!40000 ALTER TABLE `JOBS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATIONS`
--

DROP TABLE IF EXISTS `LOCATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOCATIONS` (
  `ID_LOCATION` int(11) NOT NULL AUTO_INCREMENT,
  `LOCATION_NAME` varchar(45) NOT NULL,
  `LOCATION_DIR` varchar(250) NOT NULL,
  `RAZON_SOCIAL` varchar(45) NOT NULL,
  `RUT` varchar(45) NOT NULL,
  `GIRO` varchar(100) NOT NULL,
  `CASA_MATRIZ` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_LOCATION`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATIONS`
--

LOCK TABLES `LOCATIONS` WRITE;
/*!40000 ALTER TABLE `LOCATIONS` DISABLE KEYS */;
INSERT INTO `LOCATIONS` VALUES (1,'CULINET CENTRO','MONEDA 1576 LOCAL 302 SANTIAGO CENTRO','CULINET ALIMENTOS SA','76.468.420-6','PREPARACION DISTRIBUCION VENTA Y COMERCIALIZACION DE ALIMENTOS','LIBERTAD 1448 LOCAL 205 VINA DEL MAR');
/*!40000 ALTER TABLE `LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MENU`
--

DROP TABLE IF EXISTS `MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MENU` (
  `ID_MENUBAR` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL AUTO_INCREMENT,
  `MENU_NAME` varchar(15) NOT NULL,
  `CODE_NAME` varchar(15) DEFAULT NULL,
  `KEY_SHORTCUT` varchar(15) DEFAULT NULL,
  `LEVEL` int(11) NOT NULL,
  `MENU_TEXT` varchar(15) NOT NULL,
  `TYPE` varchar(15) DEFAULT NULL COMMENT '1 = MENU\n2 = MENU ITEM',
  `MENU_FATHER` int(11) DEFAULT NULL,
  `POS` int(11) DEFAULT NULL,
  `ID_PERMISSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_MENU`),
  KEY `fk_MENU_MENU12_idx` (`MENU_FATHER`),
  KEY `fk_MENUBAR_PERMISIONS12_idx` (`ID_PERMISSION`),
  KEY `fk_MENU_MENUBAR1_idx` (`ID_MENUBAR`),
  CONSTRAINT `fk_MENUBAR_PERMISIONS12` FOREIGN KEY (`ID_PERMISSION`) REFERENCES `PERMISIONS` (`ID_PERMISSION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MENU_MENU12` FOREIGN KEY (`MENU_FATHER`) REFERENCES `MENU` (`ID_MENU`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MENU_MENUBAR1` FOREIGN KEY (`ID_MENUBAR`) REFERENCES `MENUBAR` (`ID_MENUBAR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENU`
--

LOCK TABLES `MENU` WRITE;
/*!40000 ALTER TABLE `MENU` DISABLE KEYS */;
INSERT INTO `MENU` VALUES (1,1,'FILE',NULL,NULL,1,'Archivo','MENU',NULL,10,NULL),(1,2,'EDIT',NULL,NULL,1,'Editar','MENU',NULL,20,NULL),(1,3,'SYSTEM',NULL,NULL,1,'Sistema','MENU',NULL,30,NULL),(1,4,'HELP',NULL,NULL,1,'Ayuda','MENU',NULL,40,NULL),(1,5,'SAVE','SAVE','Ctrl+S',2,'Grabar','MENU_ITEM',1,110,13),(1,6,'EXIT','EXIT','Alt+F4',2,'Salir','MENU_ITEM',1,120,11),(1,7,'SEARCH','SEARCH','Ctrl+F',2,'Buscar','MENU_ITEM',2,210,12),(1,8,'STATUS','STATUS',NULL,2,'Status Sistema','MENU_ITEM',3,310,15),(1,9,'ABOUT','ABOUT',NULL,2,'Acerca de...','MENU_ITEM',4,410,16),(1,10,'INFO_APP','INFO_APP','F1',2,'Informaci√≥n apl','MENU_ITEM',4,420,14),(1,11,'EXIT','EXIT','Alt+F4',2,'Salir','MENU_ITEM',4,430,11);
/*!40000 ALTER TABLE `MENU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MENUBAR`
--

DROP TABLE IF EXISTS `MENUBAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MENUBAR` (
  `ID_MENUBAR` int(11) NOT NULL,
  `ID_APPLICATION` int(11) NOT NULL,
  PRIMARY KEY (`ID_MENUBAR`),
  KEY `fk_MENUBAR_APPLICATIONS1_idx` (`ID_APPLICATION`),
  CONSTRAINT `fk_MENUBAR_APPLICATIONS1` FOREIGN KEY (`ID_APPLICATION`) REFERENCES `APPLICATIONS` (`ID_APPLICATION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENUBAR`
--

LOCK TABLES `MENUBAR` WRITE;
/*!40000 ALTER TABLE `MENUBAR` DISABLE KEYS */;
INSERT INTO `MENUBAR` VALUES (1,1);
/*!40000 ALTER TABLE `MENUBAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PASSWORDS`
--

DROP TABLE IF EXISTS `PASSWORDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PASSWORDS` (
  `USERNAME` varchar(15) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `TEMP` int(11) NOT NULL COMMENT '1 = TRUE\n2 = FALSE',
  `OLD_PASSWORD` varchar(45) DEFAULT NULL,
  `ACTIVATION` date NOT NULL COMMENT 'FECHA DE ACTIVACION',
  `EXPIRATION` date NOT NULL,
  `VALID_DAYS` int(11) NOT NULL,
  PRIMARY KEY (`USERNAME`),
  KEY `fk_PASSWORD_USER_idx` (`USERNAME`),
  CONSTRAINT `fk_PASSWORD_USER` FOREIGN KEY (`USERNAME`) REFERENCES `USERS` (`USERNAME`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASSWORDS`
--

LOCK TABLES `PASSWORDS` WRITE;
/*!40000 ALTER TABLE `PASSWORDS` DISABLE KEYS */;
INSERT INTO `PASSWORDS` VALUES ('CH_PENA','*B43CC4953197D4B1354CDB4035E8B7A862167197',0,'','2015-01-04','2015-12-12',90);
/*!40000 ALTER TABLE `PASSWORDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISIONS`
--

DROP TABLE IF EXISTS `PERMISIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISIONS` (
  `ID_PERMISSION` int(11) NOT NULL AUTO_INCREMENT,
  `PERMISSION_NAME` varchar(30) NOT NULL,
  `PERMISSION_TEXT` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_PERMISSION`),
  UNIQUE KEY `PERMISION_NAME_UNIQUE` (`PERMISSION_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISIONS`
--

LOCK TABLES `PERMISIONS` WRITE;
/*!40000 ALTER TABLE `PERMISIONS` DISABLE KEYS */;
INSERT INTO `PERMISIONS` VALUES (1,'LOG_IN','Iniciar Sesi√≥n'),(2,'CREATE_USER','Crear Usuario'),(3,'MODIFY_USER','Modificar Usuario'),(4,'DELETE_USER','Eliminar Usuario'),(5,'LOCK_USER','Bloquear Usuario'),(6,'UNLOCK_USER','Desbloquear Usuario'),(7,'CHANGE_PASSWORD','Cambiar Contrase√±a'),(8,'REQUEST_NEW_PASSWORD','Solicitar nueva contrase√±a'),(9,'PRINT','Imprimir'),(10,'BACK','Retroceder'),(11,'CANCEL','Cancelar'),(12,'EXIT','Salir'),(13,'SEARCH','Buscar'),(14,'SAVE','Guardar'),(15,'INFO_APP','Informaci√≥n de la aplicaci√≥n'),(16,'STATUS','Informaci√≥n del sistema'),(17,'ABOUT','Acerca del Software'),(18,'ADD_FAVORITE','Agregar Aplicacion Favorita');
/*!40000 ALTER TABLE `PERMISIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSION_PRIVILEGE`
--

DROP TABLE IF EXISTS `PERMISSION_PRIVILEGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSION_PRIVILEGE` (
  `ID_PRIVILEGE` int(11) NOT NULL,
  `ID_PERMISSION` int(11) NOT NULL,
  KEY `fk_PERMISSION_PRIVILEGE_PRIVILEGES1_idx` (`ID_PRIVILEGE`),
  KEY `fk_PERMISSION_PRIVILEGE_PERMISIONS1_idx` (`ID_PERMISSION`),
  CONSTRAINT `fk_PERMISSION_PRIVILEGE_PERMISIONS1` FOREIGN KEY (`ID_PERMISSION`) REFERENCES `PERMISIONS` (`ID_PERMISSION`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERMISSION_PRIVILEGE_PRIVILEGES1` FOREIGN KEY (`ID_PRIVILEGE`) REFERENCES `PRIVILEGES` (`ID_PRIVILEGE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSION_PRIVILEGE`
--

LOCK TABLES `PERMISSION_PRIVILEGE` WRITE;
/*!40000 ALTER TABLE `PERMISSION_PRIVILEGE` DISABLE KEYS */;
INSERT INTO `PERMISSION_PRIVILEGE` VALUES (1,1),(1,8),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18);
/*!40000 ALTER TABLE `PERMISSION_PRIVILEGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRIVILEGES`
--

DROP TABLE IF EXISTS `PRIVILEGES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRIVILEGES` (
  `ID_PRIVILEGE` int(11) NOT NULL AUTO_INCREMENT,
  `PRIVILEGE_NAME` varchar(15) NOT NULL,
  `PRIVILEGE_TEXT` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_PRIVILEGE`),
  UNIQUE KEY `PRIVILEGE_NAME_UNIQUE` (`PRIVILEGE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRIVILEGES`
--

LOCK TABLES `PRIVILEGES` WRITE;
/*!40000 ALTER TABLE `PRIVILEGES` DISABLE KEYS */;
INSERT INTO `PRIVILEGES` VALUES (1,'SESSION','Sesi√≥n'),(2,'BASE','Privilegios B√°sicos');
/*!40000 ALTER TABLE `PRIVILEGES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRIVILEGE_ROLE`
--

DROP TABLE IF EXISTS `PRIVILEGE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRIVILEGE_ROLE` (
  `ID_ROLE` int(11) NOT NULL,
  `ID_PRIVILEGE` int(11) NOT NULL,
  KEY `fk_PRIVILEGE_ROLE_ROLE1_idx` (`ID_ROLE`),
  KEY `fk_PRIVILEGE_ROLE_PRIVILEGES1_idx` (`ID_PRIVILEGE`),
  CONSTRAINT `fk_PRIVILEGE_ROLE_PRIVILEGES1` FOREIGN KEY (`ID_PRIVILEGE`) REFERENCES `PRIVILEGES` (`ID_PRIVILEGE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRIVILEGE_ROLE_ROLE1` FOREIGN KEY (`ID_ROLE`) REFERENCES `ROLE` (`ID_ROLE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRIVILEGE_ROLE`
--

LOCK TABLES `PRIVILEGE_ROLE` WRITE;
/*!40000 ALTER TABLE `PRIVILEGE_ROLE` DISABLE KEYS */;
INSERT INTO `PRIVILEGE_ROLE` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `PRIVILEGE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTS`
--

DROP TABLE IF EXISTS `PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTS` (
  `ID_PRODUCT` int(11) NOT NULL AUTO_INCREMENT,
  `NAME_PRODUCT` varchar(100) DEFAULT NULL,
  `PRODUCT_TYPE` int(11) NOT NULL,
  `ID_CATEGORY` int(11) NOT NULL,
  PRIMARY KEY (`ID_PRODUCT`),
  KEY `ID_CATEGORY` (`ID_CATEGORY`),
  CONSTRAINT `PRODUCTS_ibfk_1` FOREIGN KEY (`ID_CATEGORY`) REFERENCES `CATEGORY_PRODUCT` (`ID_CATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTS`
--

LOCK TABLES `PRODUCTS` WRITE;
/*!40000 ALTER TABLE `PRODUCTS` DISABLE KEYS */;
INSERT INTO `PRODUCTS` VALUES (1000,'COCA-COLA 350CC',1,1),(1001,'SPRITE ZERO 350CC',1,1),(1003,'FANTA 350CC',1,1);
/*!40000 ALTER TABLE `PRODUCTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFILES`
--

DROP TABLE IF EXISTS `PROFILES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFILES` (
  `ID_PROFILE` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILE` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_PROFILE`),
  UNIQUE KEY `PROFILE_UNIQUE` (`PROFILE`),
  UNIQUE KEY `DESCRIPTION_UNIQUE` (`DESCRIPTION`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFILES`
--

LOCK TABLES `PROFILES` WRITE;
/*!40000 ALTER TABLE `PROFILES` DISABLE KEYS */;
INSERT INTO `PROFILES` VALUES (1,'IT_SUPPORT','Soporte TI'),(2,'MANAGER','Jefe de Local'),(3,'CASHIER','Cajero'),(4,'WAITER','Garzon'),(5,'DELIVERY','Repartidor');
/*!40000 ALTER TABLE `PROFILES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFILE_APPLICATION`
--

DROP TABLE IF EXISTS `PROFILE_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFILE_APPLICATION` (
  `PROFILE` int(11) NOT NULL,
  `APPLICATION` int(11) DEFAULT NULL,
  KEY `PROFILE` (`PROFILE`),
  KEY `APPLICATION` (`APPLICATION`),
  CONSTRAINT `PROFILE_APPLICATION_ibfk_1` FOREIGN KEY (`PROFILE`) REFERENCES `PROFILES` (`ID_PROFILE`),
  CONSTRAINT `PROFILE_APPLICATION_ibfk_2` FOREIGN KEY (`APPLICATION`) REFERENCES `APPLICATIONS` (`ID_APPLICATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFILE_APPLICATION`
--

LOCK TABLES `PROFILE_APPLICATION` WRITE;
/*!40000 ALTER TABLE `PROFILE_APPLICATION` DISABLE KEYS */;
INSERT INTO `PROFILE_APPLICATION` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(1,5),(1,6);
/*!40000 ALTER TABLE `PROFILE_APPLICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE` (
  `ID_ROLE` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(20) NOT NULL,
  `ROLE_TEXT` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_ROLE`),
  UNIQUE KEY `ROLE_NAME_UNIQUE` (`ROLE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (1,'ADMIN','Administrador'),(2,'STORE_MANAGER','Jefe de Local');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_USER`
--

DROP TABLE IF EXISTS `ROLE_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_USER` (
  `USERNAME` varchar(15) NOT NULL,
  `ID_ROLE` int(11) NOT NULL,
  PRIMARY KEY (`USERNAME`,`ID_ROLE`),
  KEY `fk_ROLE_USER_USERS1_idx` (`USERNAME`),
  KEY `fk_ROLE_USER_ROLE1_idx` (`ID_ROLE`),
  CONSTRAINT `fk_ROLE_USER_ROLE1` FOREIGN KEY (`ID_ROLE`) REFERENCES `ROLE` (`ID_ROLE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ROLE_USER_USERS1` FOREIGN KEY (`USERNAME`) REFERENCES `USERS` (`USERNAME`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_USER`
--

LOCK TABLES `ROLE_USER` WRITE;
/*!40000 ALTER TABLE `ROLE_USER` DISABLE KEYS */;
INSERT INTO `ROLE_USER` VALUES ('CH_PENA',1);
/*!40000 ALTER TABLE `ROLE_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SESSION`
--

DROP TABLE IF EXISTS `SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SESSION` (
  `ID_SESSION` varchar(40) NOT NULL,
  `USERNAME` varchar(15) NOT NULL,
  `HOSTNAME` varchar(15) NOT NULL,
  `SERVERNAME` varchar(15) NOT NULL,
  `DT_CONNECTION` date NOT NULL,
  `TM_CONNECTION` time NOT NULL,
  `DT_END_CONNECTION` date DEFAULT NULL,
  `TM_END_CONNECTION` time DEFAULT NULL,
  PRIMARY KEY (`ID_SESSION`),
  KEY `fk_SESSION_USERS1_idx` (`USERNAME`),
  CONSTRAINT `fk_SESSION_USERS1` FOREIGN KEY (`USERNAME`) REFERENCES `USERS` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SESSION`
--

LOCK TABLES `SESSION` WRITE;
/*!40000 ALTER TABLE `SESSION` DISABLE KEYS */;
INSERT INTO `SESSION` VALUES ('00b0de6203651408506845521ab743efdb88f109','CH_PENA','dum-e','dum-e','2015-02-22','00:49:04',NULL,NULL),('012ec086154cc7a6cb19a702f845f2c9d9ead32d','CH_PENA','dum-e','dum-e','2015-02-19','15:58:01','2015-02-19','15:58:04'),('01a387ad545e2042881558515cae83728385b6da','CH_PENA','dum-e','dum-e','2015-05-14','00:15:58',NULL,NULL),('01f88ffcbca82893a1616601c63fde394e10e561','CH_PENA','dum-e','dum-e','2015-05-13','00:52:56',NULL,NULL),('02563ae16026eb457abf41359a9807971b0ed79c','CH_PENA','dum-e','dum-e','2015-05-16','21:26:20',NULL,NULL),('03d796b38b8d972a803360bb2c53d67396c70c0d','CH_PENA','dum-e','dum-e','2015-02-21','10:38:37',NULL,NULL),('0405e93bada532aae304262115cb64c3b7997596','CH_PENA','dum-e','dum-e','2015-05-15','23:04:25',NULL,NULL),('041c536793191cc6ffce2f969428c95860dd0d7d','CH_PENA','dum-e','dum-e','2015-02-21','09:59:43',NULL,NULL),('045670a31be2836a4ad288e6184986303772e46c','CH_PENA','dum-e','dum-e','2015-05-16','23:47:59',NULL,NULL),('047688d8d64c60beac5aeb8e745d47c276d55456','CH_PENA','dum-e','dum-e','2015-05-17','23:12:23','2015-05-17','23:15:47'),('04a3ebef1657f43aea4019d82ba96ba8c09f4539','CH_PENA','dum-e','dum-e','2015-05-16','23:19:25',NULL,NULL),('04ffa709cb254f2fffb1e716252f6b8cbda715c2','CH_PENA','dum-e','dum-e','2015-05-14','01:06:39',NULL,NULL),('060189fb7d70947f15c1bf9092414ea24b7a96c2','CH_PENA','dum-e','dum-e','2015-05-13','22:57:30',NULL,NULL),('06d5287e8307afa6719c3ec8a1b4e1d53c4adae4','CH_PENA','dum-e','dum-e','2015-05-17','01:05:02','2015-05-17','01:07:46'),('07383517dbce7f021c3ca1f459a4447fdcde3d31','CH_PENA','dum-e','dum-e','2015-05-13','23:37:07',NULL,NULL),('0759c833e75d99b11b080340ca23c28f5cf37244','CH_PENA','dum-e','dum-e','2015-02-19','14:13:42','2015-02-19','14:13:49'),('084f29e44e503b4d960606f6808c89bf493ee964','CH_PENA','dum-e','dum-e','2015-05-13','00:25:08',NULL,NULL),('08777e6897818f793f34e0b96ca1e2ae6b9f85e8','CH_PENA','dum-e','dum-e','2015-05-13','00:02:54',NULL,NULL),('0886f5c43be5d754d5bb415069ccfe761fe89b70','CH_PENA','dum-e','dum-e','2015-05-16','23:53:50',NULL,NULL),('08a4876b540490ecb49ff66a3350429311d40a51','CH_PENA','dum-e','dum-e','2015-05-13','00:22:03',NULL,NULL),('08dd2a2be56f34184df5ef908335bc73532efa51','CH_PENA','dum-e','dum-e','2015-03-14','21:53:31',NULL,NULL),('095378e38ee660b01dde686dc22a7d513688905e','CH_PENA','dum-e','dum-e','2015-03-14','22:45:49',NULL,NULL),('09c34194d2e0c9afa4efdbcfbb639103ecf6c714','CH_PENA','dum-e','dum-e','2015-02-19','13:43:10','2015-02-19','13:43:25'),('0ac59a349b262b02b509bd0519b630cef20331ef','CH_PENA','dum-e','dum-e','2015-05-16','20:00:11',NULL,NULL),('0bd3271dac3e50cb351fd4ddcb1f1eea479d09b6','CH_PENA','dum-e','dum-e','2015-02-18','23:37:39',NULL,NULL),('0c55a196e5f9542326d3c13c9e84421795ae2156','CH_PENA','dum-e','dum-e','2015-05-17','01:52:04','2015-05-17','01:52:32'),('0d2a2597b09be17c74b5b09df2718b729f0030f5','CH_PENA','dum-e','dum-e','2015-05-17','01:13:03','2015-05-17','01:14:42'),('0d95cf8daf82db8ba107da84390f3a63a46e5a77','CH_PENA','dum-e','dum-e','2015-02-22','12:13:06',NULL,NULL),('0dbbb08c7d3f6bdef1cbabd949ff52a939e06b2d','CH_PENA','dum-e','dum-e','2015-05-15','22:26:43',NULL,NULL),('0df288fe88e64682bf879609b258dbceada7a9e2','CH_PENA','dum-e','dum-e','2015-05-15','22:46:43',NULL,NULL),('0ece1b44b27f57b8bb255c2e349f0838931e020a','CH_PENA','dum-e','dum-e','2015-05-17','12:10:48','2015-05-17','12:11:05'),('0f0e71204a8a00ec04a6b571fbd1e1bec770f69f','CH_PENA','dum-e','dum-e','2015-05-12','22:52:06',NULL,NULL),('0f2a714a5861d96c3117c666b5a79c6ae6306e6c','CH_PENA','dum-e','dum-e','2015-02-19','15:52:55','2015-02-19','15:53:40'),('0f865df52e4dd78ba80ec01acb1b2722f67bc839','CH_PENA','dum-e','dum-e','2015-02-19','13:33:11',NULL,NULL),('0fcd52248819153a8286a26f544572f802d553bc','CH_PENA','dum-e','dum-e','2015-03-14','22:27:55',NULL,NULL),('1043cf80ec3ff38031f73b31f80cd94107eec7fb','CH_PENA','dum-e','dum-e','2015-05-17','00:58:18','2015-05-17','00:59:09'),('1171cd3de82b448e0478d040bc46db11c1bbbdcd','CH_PENA','dum-e','dum-e','2015-05-13','00:55:51',NULL,NULL),('1252c324633ce6ca76974a79ce3c4f9f64456b31','CH_PENA','dum-e','dum-e','2015-05-17','13:36:17',NULL,NULL),('12e9035a4f4f04353e29e731bb927553d366e8c6','CH_PENA','dum-e','dum-e','2015-05-15','22:35:51',NULL,NULL),('130fcd3ef6a3d3333a5a5739bef6be63ab03373a','CH_PENA','dum-e','dum-e','2015-05-16','19:43:57','2015-05-16','19:43:59'),('14005c7b9e8e0b316347e88e1f0734dba26c2862','CH_PENA','dum-e','dum-e','2015-05-13','21:56:42',NULL,NULL),('14cf4295ecfc8bcceb952574cef5ff2e953dda27','CH_PENA','dum-e','dum-e','2015-05-14','00:55:24',NULL,NULL),('151b7b84987c5d42842e8033a097721da354e58f','CH_PENA','dum-e','dum-e','2015-05-13','23:28:02',NULL,NULL),('15504fcdca21458957c23103a8461ead5ad61b26','CH_PENA','dum-e','dum-e','2015-03-14','22:44:06',NULL,NULL),('1647016c19e882b42eb2bbbdbf4308e7d0f1bfc7','CH_PENA','dum-e','dum-e','2015-05-10','23:53:27',NULL,NULL),('16a05606ff0de26f7a7baec8cf0accf86f324e1e','CH_PENA','dum-e','dum-e','2015-02-19','15:59:02','2015-02-19','15:59:05'),('16bff3f918bae039e322b3466b446a7bc1810c93','CH_PENA','dum-e','dum-e','2015-05-13','23:24:10',NULL,NULL),('16f7ffd8738f0c0044136965eb3b12fbd71f9e4e','CH_PENA','dum-e','dum-e','2015-03-14','22:44:35',NULL,NULL),('177dfe114cf6cdf1636088a09cd68a3b9745904a','CH_PENA','dum-e','dum-e','2015-05-13','00:56:46',NULL,NULL),('18a4b751ff309dabfcfce0add5c48bbb5415f92f','CH_PENA','dum-e','dum-e','2015-05-15','22:21:34',NULL,NULL),('18dbe8ae011be22cf688189bd9fd8ba8f1c5a0e3','CH_PENA','dum-e','dum-e','2015-05-12','23:04:22',NULL,NULL),('19233e6d66a4f1a8c99e85c55da458e4993e2067','CH_PENA','dum-e','dum-e','2015-03-14','22:11:04',NULL,NULL),('198aa556284432163ae48ab51830633b153c57b1','CH_PENA','dum-e','dum-e','2015-02-19','13:36:21','2015-02-19','13:38:23'),('19b405c20198c5afa4c62880ee35fed00baac923','CH_PENA','dum-e','dum-e','2015-05-14','00:17:06',NULL,NULL),('1a92c2a12289081a69b56619dbc561103e41f65b','CH_PENA','dum-e','dum-e','2015-05-12','22:54:46',NULL,NULL),('1b7090dbfd2f203e3430ea0a387b02bfb1e7a241','CH_PENA','dum-e','dum-e','2015-05-17','18:17:12','2015-05-17','18:18:35'),('1b9a1d1cf73f6f2f523c133df7806dd4a8096b9e','CH_PENA','dum-e','dum-e','2015-02-22','00:43:49',NULL,NULL),('1bbf0c3a55d950f5af0f31e2fb6133ece94b37cb','CH_PENA','dum-e','dum-e','2015-05-13','23:11:27',NULL,NULL),('1c04b597785480472617372f3ef771e865e54fd4','CH_PENA','dum-e','dum-e','2015-02-19','14:16:24','2015-02-19','14:16:30'),('1c6d21c4b4427555082900facc452f3b74544663','CH_PENA','dum-e','dum-e','2015-05-17','12:06:46','2015-05-17','12:06:56'),('1c6eac192da1c8851c369b506a931ccc61bab8f3','CH_PENA','dum-e','dum-e','2015-03-14','22:28:07',NULL,NULL),('1c6ebe2cb1864e8a9184bf2eaa80dc0b6eb7b03d','CH_PENA','dum-e','dum-e','2015-02-19','16:07:47','2015-02-19','16:10:28'),('1cd56170d612151e76470303c7959cdeee2d2058','CH_PENA','dum-e','dum-e','2015-05-13','01:11:19',NULL,NULL),('1d3eba0ea4ccfd9ede1de00c927d622f3145cbed','CH_PENA','dum-e','dum-e','2015-05-17','12:14:01','2015-05-17','12:14:23'),('1debd2115c3a4d91f887d6ec616fdcc37b41d2ff','CH_PENA','dum-e','dum-e','2015-05-14','01:17:20',NULL,NULL),('1e40c29695511fcaa42d5a521d1e24260d92b71f','CH_PENA','dum-e','dum-e','2015-02-21','09:54:55',NULL,NULL),('1eead7d9dbae3dd0eabdadfaa29bebb81d51c9a6','CH_PENA','dum-e','dum-e','2015-05-16','22:12:07',NULL,NULL),('1f00e85cdc54a14a1a53e6777e12b3127dc8ae3b','CH_PENA','dum-e','dum-e','2015-02-22','00:44:05',NULL,NULL),('20482f7a534e52abe8fdfa384c070bf5787d73d6','CH_PENA','dum-e','dum-e','2015-05-17','13:41:20',NULL,NULL),('20500a5d4f022a877fa61f1db2a97a8911096d7f','CH_PENA','dum-e','dum-e','2015-05-16','22:36:36',NULL,NULL),('210f98c3be84d53c0d1acbfe68bc4b2ed44e2844','CH_PENA','dum-e','dum-e','2015-05-14','00:49:41',NULL,NULL),('2210850bcd4f7cfc7340549d84a1a61e41df5e49','CH_PENA','dum-e','dum-e','2015-05-12','23:08:02',NULL,NULL),('2215c3549b53802462c54a61af155ee5e54e971c','CH_PENA','dum-e','dum-e','2015-02-22','11:23:25',NULL,NULL),('22eb5928f2e91c101cbcd54a838b3a3338597567','CH_PENA','dum-e','dum-e','2015-05-15','22:58:11',NULL,NULL),('239d1fc9d5c19d73bc60617c838b3f071ecaaf81','CH_PENA','dum-e','dum-e','2015-02-22','13:12:46',NULL,NULL),('2493684e4e66335c06d3b1a9459ba75bf7c3d4a4','CH_PENA','dum-e','dum-e','2015-05-15','22:11:09',NULL,NULL),('2552ea3df1b73bed5d9c1548db1f931143f56491','CH_PENA','dum-e','dum-e','2015-02-19','14:52:37','2015-02-19','14:54:24'),('263e6037f696938ab0c574a52215c53591969cbc','CH_PENA','dum-e','dum-e','2015-03-14','22:14:49',NULL,NULL),('265de7281c9cfade0b4a66f1f62f2451977799dd','CH_PENA','dum-e','dum-e','2015-05-15','22:08:52',NULL,NULL),('2675d7e9b4acc5d8a88535cafef177ac52b2844a','CH_PENA','dum-e','dum-e','2015-05-14','00:57:16',NULL,NULL),('269f0b344bd3b8361fad5df2b7a5561f5ad9be2a','CH_PENA','dum-e','dum-e','2015-05-17','15:25:52','2015-05-17','15:26:16'),('26da35988e2fb2a3de2d5cb6679351535152d7a4','CH_PENA','dum-e','dum-e','2015-05-13','23:25:14',NULL,NULL),('2784b3ecd4c15b1576ff77464778a4a9c8bbdef9','CH_PENA','dum-e','dum-e','2015-05-16','23:39:05','2015-05-16','23:39:52'),('278ddb88ad889bab213183505b9435ab1aa6cc87','CH_PENA','dum-e','dum-e','2015-05-16','21:34:43','2015-05-16','21:34:44'),('27e3681a39103418af99836db57d16cfa38e56b1','CH_PENA','dum-e','dum-e','2015-05-17','01:10:46',NULL,NULL),('28287d9892c806b6e9d06631792e2f7a660b3b39','CH_PENA','dum-e','dum-e','2015-02-19','15:52:32','2015-02-19','15:52:35'),('286a77c4514539e6e17f673902aef9921455a9ab','CH_PENA','dum-e','dum-e','2015-05-17','23:19:20','2015-05-17','23:19:38'),('2874d1806a68eb3c1a381f2ae8d33c288430dd00','CH_PENA','dum-e','dum-e','2015-05-12','22:52:38',NULL,NULL),('28c85d8657f1e76a497ca671772f3a27c9691a07','CH_PENA','dum-e','dum-e','2015-05-17','01:11:42','2015-05-17','01:12:01'),('29279e927f18c0a1af528e5167111e5d8110d23b','CH_PENA','dum-e','dum-e','2015-05-17','16:52:08',NULL,NULL),('294d6f7a59b0115aefc9b691d62904e922758c0d','CH_PENA','dum-e','dum-e','2015-05-13','23:10:49',NULL,NULL),('29aceb94c894c23336e9439a14040ad29f973428','CH_PENA','dum-e','dum-e','2015-02-21','09:54:35',NULL,NULL),('2b3077813167098e7b15b6df9d6945baad854c45','CH_PENA','dum-e','dum-e','2015-05-14','00:01:39',NULL,NULL),('2c14cb31d28c098a378cbd77cab012e452de8b42','CH_PENA','dum-e','dum-e','2015-05-17','17:48:37','2015-05-17','17:48:54'),('2c15244afe9e6457eeb87282f9d5233ce1ae8a8f','CH_PENA','dum-e','dum-e','2015-02-21','09:55:48',NULL,NULL),('2c3f924e9c3ea01fb450ea2a41b662e8adb9165a','CH_PENA','dum-e','dum-e','2015-05-13','00:48:07',NULL,NULL),('2dd16a643052b3f337161c4d252358e7677685e6','CH_PENA','dum-e','dum-e','2015-05-13','00:46:54',NULL,NULL),('2e12240ceebc5b332420f64e19534f11fd725066','CH_PENA','dum-e','dum-e','2015-03-14','21:47:28',NULL,NULL),('2ee01cd295b53440b46866c5a08973e96ad61a66','CH_PENA','dum-e','dum-e','2015-05-16','21:33:25',NULL,NULL),('2f4a8a2e7d02bc587ff7d53040211e1c2bf6b217','CH_PENA','dum-e','dum-e','2015-05-17','23:20:26',NULL,NULL),('30622556df88172c1d0abf831dac026a83bdded7','CH_PENA','dum-e','dum-e','2015-05-16','23:35:35',NULL,NULL),('30fb81c2cef5175b2cbf50e33cc4b7189742ec9f','CH_PENA','dum-e','dum-e','2015-05-18','00:00:19',NULL,NULL),('3167d669a5d0617bc90b22a0cb58b9677c174145','CH_PENA','dum-e','dum-e','2015-05-17','23:16:34',NULL,NULL),('3310d8af920b0e8ea81030a91e94341440366381','CH_PENA','dum-e','dum-e','2015-05-17','15:54:16','2015-05-17','15:54:35'),('3312fed52520d191348cac0b668df0547eb17aac','CH_PENA','dum-e','dum-e','2015-05-17','12:31:19','2015-05-17','12:32:05'),('332bec964b6e2b305a04bc3ec90e35c6acf5d06b','CH_PENA','dum-e','dum-e','2015-02-21','10:38:19',NULL,NULL),('334629290d3109e35e6684726b8e23c59f55c569','CH_PENA','dum-e','dum-e','2015-05-15','22:12:07',NULL,NULL),('33ec9f43287ae4a46244dd0d5c18a87b992182c4','CH_PENA','dum-e','dum-e','2015-05-14','01:37:22',NULL,NULL),('342d745bfcb6f041b25bf6d4fa794935f18a9b47','CH_PENA','dum-e','dum-e','2015-02-19','16:02:19','2015-02-19','16:02:26'),('34e909f62b91bbcdc9b94de8413198a55ca40a67','CH_PENA','dum-e','dum-e','2015-05-17','11:38:04','2015-05-17','11:38:47'),('35241168d84b4bbcf31df250b415b5b35de52aa3','CH_PENA','dum-e','dum-e','2015-05-16','22:45:08',NULL,NULL),('356bcf256664b550539839e92e74ac12be7db477','CH_PENA','dum-e','dum-e','2015-05-15','22:51:09',NULL,NULL),('3593cd79b1eaf92ba4a27936f8cad2675a163494','CH_PENA','dum-e','dum-e','2015-05-13','00:57:26',NULL,NULL),('35bf55c244308261eb831f08b243fa52f8302518','CH_PENA','dum-e','dum-e','2015-05-14','00:29:12',NULL,NULL),('362b1faf32a8c79b616dba1d693c8429602be32f','CH_PENA','dum-e','dum-e','2015-05-13','23:34:58',NULL,NULL),('36633459659d9d10b2b0ae9c41bb4ae7117dc783','CH_PENA','dum-e','dum-e','2015-05-16','22:35:05',NULL,NULL),('369012a98832c9b82833ab10999326962965cba8','CH_PENA','dum-e','dum-e','2015-05-16','23:29:54','2015-05-16','23:32:28'),('36da57b36ddd784ccd7f4ba3a18d6c4a69063ae7','CH_PENA','dum-e','dum-e','2015-05-17','16:42:06',NULL,NULL),('37a5a92613ad335defb2710549460a0f40cb4e41','CH_PENA','dum-e','dum-e','2015-05-16','22:47:04','2015-05-16','22:52:33'),('37a7755203473a4a812fd265501012c4bf23c0b5','CH_PENA','dum-e','dum-e','2015-05-13','23:38:23',NULL,NULL),('37aad6dab5a088ed6328b048d664c234fb2f8923','CH_PENA','dum-e','dum-e','2015-02-19','15:54:38','2015-02-19','15:54:41'),('38053feb9e6894a269a12010f59391983e196c98','CH_PENA','dum-e','dum-e','2015-05-13','23:00:17',NULL,NULL),('3ab43d6aed9235100b365e7cd47be20514351ca5','CH_PENA','dum-e','dum-e','2015-05-15','22:53:34',NULL,NULL),('3aba57e051eb4f1650d3aa25bb556a4dddff0c34','CH_PENA','dum-e','dum-e','2015-05-13','23:29:30',NULL,NULL),('3ad4ce86e9ccff8f47e8d2a0862b43a4ff7d82c0','CH_PENA','dum-e','dum-e','2015-05-13','00:56:08',NULL,NULL),('3ad5aadfdd29f258eda12e61fecff25eeec0a5d0','CH_PENA','dum-e','dum-e','2015-05-15','23:47:14',NULL,NULL),('3b305118afcb66e868229ee2113d5bf6b7db1dd2','CH_PENA','dum-e','dum-e','2015-02-19','15:56:59','2015-02-19','15:57:07'),('3bf8cb5618a2b74356fc17605785be0086e595ab','CH_PENA','dum-e','dum-e','2015-05-16','20:46:47',NULL,NULL),('3c267f65c896f350e3487e4ca49d8c4e24412bb4','CH_PENA','dum-e','dum-e','2015-05-12','22:56:51',NULL,NULL),('3c2d1a868431206997b714a3954354d69cbb4f1e','CH_PENA','dum-e','dum-e','2015-03-14','20:44:24',NULL,NULL),('3cbd4377bdc88a5b16d9faf59f4e53ec55faf461','CH_PENA','dum-e','dum-e','2015-05-13','00:26:07',NULL,NULL),('3cd846ad070caab5fab9e802a76b9fb36653f647','CH_PENA','dum-e','dum-e','2015-02-19','15:57:40','2015-02-19','15:57:44'),('3d07ec308940083ec2621f5cefbd55c550435aa3','CH_PENA','dum-e','dum-e','2015-05-17','00:09:34',NULL,NULL),('3d7e34050b8f5d815ef0daf6f74c7079bc424bff','CH_PENA','dum-e','dum-e','2015-05-14','01:05:47',NULL,NULL),('3e5feb38d94efd98b5465b1726d1d70143707f6d','CH_PENA','dum-e','dum-e','2015-05-13','01:03:45',NULL,NULL),('3ec452fa3d35cce65e532c232294f2c7a2d57789','CH_PENA','dum-e','dum-e','2015-05-17','23:46:35',NULL,NULL),('3f7859bb1217b792b7c07168a40faf51d71c2f85','CH_PENA','dum-e','dum-e','2015-03-14','22:31:40',NULL,NULL),('4035bd31e3ceb012572078f574e13bfd016e867f','CH_PENA','dum-e','dum-e','2015-05-16','23:34:16',NULL,NULL),('404657df4119bb144068a801196d878f58329f89','CH_PENA','dum-e','dum-e','2015-05-13','23:56:33',NULL,NULL),('406bbbf5ed3ed0b487e3da317d7257a7ff2e4c1c','CH_PENA','dum-e','dum-e','2015-02-19','15:55:58','2015-02-19','15:56:08'),('4097083271ce1f80a2faa1c02ed3655c10572479','CH_PENA','dum-e','dum-e','2015-05-16','19:47:49',NULL,NULL),('40dc61f2bc50497a7d9048a5ac1a0204e4b51e17','CH_PENA','dum-e','dum-e','2015-05-13','23:25:54',NULL,NULL),('4188ab62ab743bdebaecb30a116b54ab4269a720','CH_PENA','dum-e','dum-e','2015-05-17','13:43:48',NULL,NULL),('418919ad2ef3b8566676f0e48a081b3884c53405','CH_PENA','dum-e','dum-e','2015-04-12','20:16:02',NULL,NULL),('42c7136268a7ed39342540f1d97bc4e3f0d8ea0f','CH_PENA','dum-e','dum-e','2015-05-17','18:19:10','2015-05-17','18:25:02'),('43de2bedf223b9115d314d53620e9a16a9f35266','CH_PENA','dum-e','dum-e','2015-02-19','14:15:31','2015-02-19','14:15:35'),('43e330d09f41005618eb29aa5471f9a5aaef501a','CH_PENA','dum-e','dum-e','2015-05-14','01:02:48',NULL,NULL),('43f260cdacf8ad657a31eea22d493b4ab39b9fc4','CH_PENA','dum-e','dum-e','2015-05-15','22:54:17',NULL,NULL),('448427823e59cdf68febc70bed69f1f4b2e66d40','CH_PENA','dum-e','dum-e','2015-05-15','22:56:23',NULL,NULL),('44ea63ab7246993c9c5f7d2e0668738d233f13dc','CH_PENA','dum-e','dum-e','2015-02-18','23:38:28',NULL,NULL),('451b76cdcdf577c521e487a5bb5ccbd308e88ec8','CH_PENA','dum-e','dum-e','2015-05-12','22:51:38',NULL,NULL),('45417f776c573656b7c6b93f39b780e1c04c372d','CH_PENA','dum-e','dum-e','2015-05-14','01:11:25',NULL,NULL),('45a13d0098c2a11fb6f1a17971d47c539abe7ab3','CH_PENA','dum-e','dum-e','2015-05-12','22:29:34',NULL,NULL),('45c844bbd49ae9dc0317396a550bb6db3fd76f76','CH_PENA','dum-e','dum-e','2015-05-17','12:48:35','2015-05-17','12:49:57'),('461dd0e2870aa6107fc122ba851ff207ba0565ce','CH_PENA','dum-e','dum-e','2015-05-14','00:23:19',NULL,NULL),('462e80c5ce26775a98961a3386234de1953941be','CH_PENA','dum-e','dum-e','2015-05-17','12:45:47',NULL,NULL),('46363f722894b3ccc26191d4cdf652bacfb58d8a','CH_PENA','dum-e','dum-e','2015-02-22','12:04:30',NULL,NULL),('4679f29e7248038039ea2a37e01f71cad409c503','CH_PENA','dum-e','dum-e','2015-05-12','23:00:36',NULL,NULL),('47863f803f1ab216f60738052c9e36c660bd29e2','CH_PENA','dum-e','dum-e','2015-02-18','23:41:17',NULL,NULL),('47b598487366372365e304e211a87ba75e579132','CH_PENA','dum-e','dum-e','2015-02-19','15:44:58','2015-02-19','15:45:32'),('483195ee2415a044e0282e56115b5c6151c3606c','CH_PENA','dum-e','dum-e','2015-05-15','22:59:51',NULL,NULL),('488334d5631df2ee88bc52c9dbcc508f657d5470','CH_PENA','dum-e','dum-e','2015-05-12','00:33:12',NULL,NULL),('488d63b08032ca72c5cce4c27181b44dab6acba9','CH_PENA','dum-e','dum-e','2015-02-21','23:24:07',NULL,NULL),('490baddaa9ccb4a72a33a3d500627e0985a3425d','CH_PENA','dum-e','dum-e','2015-05-10','23:56:51',NULL,NULL),('491f44bce6fdadc221c114ed37b982cf1704cd88','CH_PENA','dum-e','dum-e','2015-03-08','19:28:08',NULL,NULL),('49274ea2ef38764a36fd43e940dfad2596d418fe','CH_PENA','dum-e','dum-e','2015-02-19','16:03:20','2015-02-19','16:03:24'),('4967a13470c838a8f24aed18e1769182c1c57279','CH_PENA','dum-e','dum-e','2015-03-14','22:22:09',NULL,NULL),('4acd9d2857bad6b4e833a0c2be79d45a891717be','CH_PENA','dum-e','dum-e','2015-05-15','22:43:22',NULL,NULL),('4b40262b6db226e751fb8bfec0e3ae623ac73be9','CH_PENA','dum-e','dum-e','2015-02-19','15:49:08','2015-02-19','15:49:10'),('4b6f78654432e3f035c9f69be947131ecf6de933','CH_PENA','dum-e','dum-e','2015-05-16','22:45:28','2015-05-16','22:45:41'),('4be40b46d1254a9cba4bc850f994e3e15e9ba7c0','CH_PENA','dum-e','dum-e','2015-03-14','21:58:46',NULL,NULL),('4bec9a38efbf279b825d96fd30defed5fa224e4e','CH_PENA','dum-e','dum-e','2015-03-14','22:18:46',NULL,NULL),('4c056336ccfb25ea1bc167f5509dde49bc6129ef','CH_PENA','dum-e','dum-e','2015-02-21','09:56:09',NULL,NULL),('4c2a95307c368782c86b95c4563979d529e4653b','CH_PENA','dum-e','dum-e','2015-05-17','17:50:02','2015-05-17','17:50:08'),('4c9da912e0906397bd18df12ff4dec41f4105d38','CH_PENA','dum-e','dum-e','2015-05-12','00:29:36',NULL,NULL),('4cc3b87f90b9aba9647d06dc4d6cbf72bd0a8f74','CH_PENA','dum-e','dum-e','2015-05-14','00:16:29',NULL,NULL),('4db391a4dae8ec505fbf8a7ff5273ade5fb40fec','CH_PENA','dum-e','dum-e','2015-05-15','22:31:32',NULL,NULL),('4e6f9a3097b468242459aa244c498feeeaf095a4','CH_PENA','dum-e','dum-e','2015-05-15','22:25:27',NULL,NULL),('4e7c72275ef7b88d87e5151764b3fa04a568b634','CH_PENA','dum-e','dum-e','2015-05-17','23:21:04',NULL,NULL),('4ec242ed4ac5b2d2bd55249d71310d44525fcca2','CH_PENA','dum-e','dum-e','2015-02-21','09:57:30',NULL,NULL),('4f1684277f09d3597f183e34c7bb206f89c4a976','CH_PENA','dum-e','dum-e','2015-05-13','23:39:58',NULL,NULL),('4f63101b7a7802e75fd16f7f259dd540ebab2ab6','CH_PENA','dum-e','dum-e','2015-05-14','01:02:07',NULL,NULL),('4fa90cda86706db16f6a704766c435615dc363a1','CH_PENA','dum-e','dum-e','2015-02-21','23:23:28',NULL,NULL),('50965e982c904d8ef919ebf87d6e75503d19e1b5','CH_PENA','dum-e','dum-e','2015-05-17','16:28:02',NULL,NULL),('510f2b01a8733d76f9105b5d43d57189af78a1b4','CH_PENA','dum-e','dum-e','2015-05-17','16:52:39',NULL,NULL),('51adf7b78cfe222e4632d56ab37263331bcce6e7','CH_PENA','dum-e','dum-e','2015-02-19','15:56:16',NULL,NULL),('52c292869c7a20fc47192f8a80a154bb191bd53f','CH_PENA','dum-e','dum-e','2015-05-14','01:04:16',NULL,NULL),('531cde321392da8877677822c352fd88adb88b94','CH_PENA','dum-e','dum-e','2015-02-21','10:32:16',NULL,NULL),('532998103feb59a94b48feca8fd10c7ebf6728da','CH_PENA','dum-e','dum-e','2015-05-15','22:14:14',NULL,NULL),('53a456f30f690c166b3d8734f0ac7f4c4197936a','CH_PENA','dum-e','dum-e','2015-05-17','12:37:08','2015-05-17','12:38:21'),('5410c65a45b2fe72b1d849dd03f79da30dfb146d','CH_PENA','dum-e','dum-e','2015-02-19','15:51:27','2015-02-19','15:51:30'),('54451e99a25fc935ace672616b02e410601d3fa2','CH_PENA','dum-e','dum-e','2015-05-17','01:53:45',NULL,NULL),('547a282d5da098e91f4880980ef3ffd5b8124612','CH_PENA','dum-e','dum-e','2015-05-14','00:43:35',NULL,NULL),('54db10224dc451837299168f97cae6d081716450','CH_PENA','dum-e','dum-e','2015-02-19','15:54:06','2015-02-19','15:54:09'),('54e32ddf5c6dd257d2c13e600b4ca5a97395d9b0','CH_PENA','dum-e','dum-e','2015-03-14','22:05:43',NULL,NULL),('55b80f00bf25d97314fcfbd710a561f4d350c1d4','CH_PENA','dum-e','dum-e','2015-05-13','23:04:49',NULL,NULL),('568c4bfb4f5aaa9c11da1f7fa96e1bac10a87cf8','CH_PENA','dum-e','dum-e','2015-05-16','23:17:10',NULL,NULL),('5692c8e38efab2272577aea0c5387f56da331271','CH_PENA','dum-e','dum-e','2015-05-13','23:40:22',NULL,NULL),('57cde518dfec7d9284ed9cd58d74151446173b2d','CH_PENA','dum-e','dum-e','2015-05-16','22:01:24','2015-05-16','22:01:31'),('57f3809aa87129f2c0d20bdae8e62b08e0a5e238','CH_PENA','dum-e','dum-e','2015-02-19','00:09:47',NULL,NULL),('582d45b6e4e2ab1f5de80c7825709fdbf6d09fcc','CH_PENA','dum-e','dum-e','2015-05-14','00:52:41',NULL,NULL),('5883971069fb03d7b778e65692282df3ce43b3bb','CH_PENA','dum-e','dum-e','2015-05-17','01:52:47','2015-05-17','01:53:39'),('58bda8565c8a2c17c9e57aa91fe0849e093cffcc','CH_PENA','dum-e','dum-e','2015-05-12','22:57:51',NULL,NULL),('592ee90d0375131969c6d1534feb182f6058ec9f','CH_PENA','dum-e','dum-e','2015-02-19','15:39:38','2015-02-19','15:40:30'),('593f4a711a2ccd321ed66c0d8106ada07728fa30','CH_PENA','dum-e','dum-e','2015-05-17','12:07:35',NULL,NULL),('59c70358febad45d0e9a4ee4c82c7edafc7b067c','CH_PENA','dum-e','dum-e','2015-02-19','16:01:50',NULL,NULL),('5aabcd7f88c008ed3a33fbe16c7d2c64cc8d3be4','CH_PENA','dum-e','dum-e','2015-05-15','23:11:58',NULL,NULL),('5ab3adea4003350eeba552d01fb3172a40106487','CH_PENA','dum-e','dum-e','2015-02-19','15:48:55','2015-02-19','15:48:59'),('5ae4b9030c4d510ae63ac36ac41e51ea2b9edfd3','CH_PENA','dum-e','dum-e','2015-02-19','15:44:46','2015-02-19','15:44:51'),('5ba9b7f0808fd57b67feef72ac610185527c80df','CH_PENA','dum-e','dum-e','2015-05-15','22:46:21',NULL,NULL),('5c72a4fb30bb415ae5dfd95f657245c34616435d','CH_PENA','dum-e','dum-e','2015-05-15','23:04:59',NULL,NULL),('5deaef152f167e6953c6b61417d0559c22b16c98','CH_PENA','dum-e','dum-e','2015-05-14','00:15:31',NULL,NULL),('5df374d1b5b9a8f7f805da815f5a17823bf3ff8d','CH_PENA','dum-e','dum-e','2015-02-22','12:11:56',NULL,NULL),('5e1cd4602d9aab286696e1ae188036e4cb84229f','CH_PENA','dum-e','dum-e','2015-02-19','16:10:36','2015-02-19','16:11:54'),('5e37d1dd2ce6a57fea8fb0452ad470e155fd283e','CH_PENA','dum-e','dum-e','2015-05-13','23:45:59',NULL,NULL),('5e5dd2ddb5fecb835d11b133d73aae6fb304319d','CH_PENA','dum-e','dum-e','2015-05-17','16:31:48',NULL,NULL),('5ec8ff6531594961ea3a9a82d0fedd35e698863e','CH_PENA','dum-e','dum-e','2015-05-14','00:47:21',NULL,NULL),('5f6fa50e042077d47fd76ec7923a1cf617379019','CH_PENA','dum-e','dum-e','2015-05-17','12:58:57',NULL,NULL),('5fa1f69756b6599f5be1fc6b92f8f8ee89cb91c5','CH_PENA','dum-e','dum-e','2015-05-16','20:12:29','2015-05-16','20:12:31'),('5fbc5f88c6904ef091d8fb0c5de43194a036e9d6','CH_PENA','dum-e','dum-e','2015-02-21','10:40:40',NULL,NULL),('5fee6903cb889c2399aa09116a64c14bb9110826','CH_PENA','dum-e','dum-e','2015-05-17','23:22:10','2015-05-17','23:25:43'),('6082b72beab1841a3acea3e5b62095d2241ef9e0','CH_PENA','dum-e','dum-e','2015-03-14','21:49:54',NULL,NULL),('6087bd1c8592e1611c26178c4b817338598b4ac3','CH_PENA','dum-e','dum-e','2015-02-19','15:55:00','2015-02-19','15:55:06'),('60c61c9cf9b8ca0df26236540a2541c797afbd90','CH_PENA','dum-e','dum-e','2015-03-14','22:16:28',NULL,NULL),('60dadbdac1927dbaca70c1b02bd094af4868e93f','CH_PENA','dum-e','dum-e','2015-05-17','13:35:54','2015-05-17','13:36:11'),('61901eb4ca36d7e5774c8ebfdc9ea2c7a643eb48','CH_PENA','dum-e','dum-e','2015-05-13','23:42:28',NULL,NULL),('61cc087b603579bf013bb48f748e7bcef85dd144','CH_PENA','dum-e','dum-e','2015-05-16','22:34:07',NULL,NULL),('6216ff71f42284603a5f89c2e3aeb2d966e01fb1','CH_PENA','dum-e','dum-e','2015-02-19','14:22:04','2015-02-19','14:26:12'),('626c16e4f49c767e733c9ed93a0fad4d25098f36','CH_PENA','dum-e','dum-e','2015-05-14','01:01:36',NULL,NULL),('626fcb9ca81079553eab54fd712362b8cd6df824','CH_PENA','dum-e','dum-e','2015-05-10','23:56:19',NULL,NULL),('62b92f9121a995d5cebd7e5f12448d74951a910d','CH_PENA','dum-e','dum-e','2015-02-19','15:58:23','2015-02-19','15:58:27'),('62bdbdb2744de998ef8198655f9d9df984b6a986','CH_PENA','dum-e','dum-e','2015-05-17','23:21:31',NULL,NULL),('62f01be4c48261576a7a7d431b58f050234c4e3d','CH_PENA','dum-e','dum-e','2015-05-14','01:06:49',NULL,NULL),('63a33df7e3ae7e660de49eb158ce8d397957f40f','CH_PENA','dum-e','dum-e','2015-03-14','22:46:03',NULL,NULL),('64dab967a3edb3b5ae62f3a328003b5f34f196d7','CH_PENA','dum-e','dum-e','2015-03-14','21:58:31',NULL,NULL),('6507797c20f52708affa5f023f7d1982ee713dad','CH_PENA','dum-e','dum-e','2015-02-22','12:12:18',NULL,NULL),('658489f08fc105fe50e0ae422036bc108bb87c86','CH_PENA','dum-e','dum-e','2015-05-10','01:38:07',NULL,NULL),('65bc85b0e1d60f5ab5c7507eadeb49279309a920','CH_PENA','dum-e','dum-e','2015-05-17','11:54:56',NULL,NULL),('667e984dd3a1e6c8a905dd6bf19b44659ff85629','CH_PENA','dum-e','dum-e','2015-05-14','00:36:10',NULL,NULL),('669fc0bd6c42b580a4321b6df5c522bf9aae6f38','CH_PENA','dum-e','dum-e','2015-05-16','20:16:44',NULL,NULL),('66ecd4bd2137647845acc1a8be899d90b42311d4','CH_PENA','dum-e','dum-e','2015-05-13','23:27:07',NULL,NULL),('6761a9853189b9e331b30b0925657889e4c6a817','CH_PENA','dum-e','dum-e','2015-02-21','09:51:58',NULL,NULL),('695ce43572af74d3b88c21fdfda05db65c624179','CH_PENA','dum-e','dum-e','2015-05-16','19:49:49',NULL,NULL),('69724c1434a9a94352070d95a50ab99eafc478fd','CH_PENA','dum-e','dum-e','2015-05-14','00:57:35',NULL,NULL),('69aa5b1c44a47d4369d4610859ce8af40c791f66','CH_PENA','dum-e','dum-e','2015-02-22','19:02:46',NULL,NULL),('6a43a6ddc3100202c555faaab6294ef0b07b49fa','CH_PENA','dum-e','dum-e','2015-05-13','01:10:25',NULL,NULL),('6adf7819d22188b6bd0190c10c64757a149b796f','CH_PENA','dum-e','dum-e','2015-05-16','22:44:26',NULL,NULL),('6be13c31487e1223977872af4b22f3f5cb05b49b','CH_PENA','dum-e','dum-e','2015-05-16','23:36:30','2015-05-16','23:37:12'),('6c77b10fe53979ab339d5f498d93d62d502a409e','CH_PENA','dum-e','dum-e','2015-05-15','22:22:26',NULL,NULL),('6e86237a6795a748cf708895755b7aaa634d5209','CH_PENA','dum-e','dum-e','2015-02-22','12:02:30',NULL,NULL),('6e86ac3cffb85f4129fb58c28792252c3967a5b0','CH_PENA','dum-e','dum-e','2015-05-13','00:01:28',NULL,NULL),('6eadeb80065c66a87f8d1d936609c6c148242617','CH_PENA','dum-e','dum-e','2015-05-14','00:19:04',NULL,NULL),('6f17970859e08b0e4d7fc64917658f16266c3b57','CH_PENA','dum-e','dum-e','2015-03-14','21:52:56',NULL,NULL),('6f38b4856074f0a4956100cd233d292e87991d9e','CH_PENA','dum-e','dum-e','2015-05-13','01:04:53',NULL,NULL),('6f8589c659bcc279efa81de62e182ddaa521ffb5','CH_PENA','dum-e','dum-e','2015-05-15','22:10:03',NULL,NULL),('6f8ea3a85d510ce40e414a6fbb9bab18f3c601ce','CH_PENA','dum-e','dum-e','2015-05-17','23:48:16',NULL,NULL),('6fb7b0bfd947899671d1a2a4925601db12849c8b','CH_PENA','dum-e','dum-e','2015-05-15','22:57:02',NULL,NULL),('70454ca4d71831b5b419794c3e9d10f591ee2ea3','CH_PENA','dum-e','dum-e','2015-02-20','21:06:16','2015-02-20','21:07:44'),('70bffee5ecacfb764e04db01d9a7b3e1ce2fb893','CH_PENA','dum-e','dum-e','2015-02-19','14:17:00','2015-02-19','14:17:07'),('70cd585abc7db8f2a101481e17a6fbcae6870639','CH_PENA','dum-e','dum-e','2015-05-13','23:31:34',NULL,NULL),('717a6395c83e8b4dbf087f0db11a17708a0747d0','CH_PENA','dum-e','dum-e','2015-05-13','23:41:07',NULL,NULL),('71a9ac8ec3dff22a3f8d50979da6bff37275d8d3','CH_PENA','dum-e','dum-e','2015-05-14','00:04:32',NULL,NULL),('71bfb231a21cd232944c8dd46e17bed86c927ee4','CH_PENA','dum-e','dum-e','2015-03-14','20:50:37',NULL,NULL),('71f4c318cc76bbad167cd33d6d793c00bfb8249d','CH_PENA','dum-e','dum-e','2015-05-13','00:46:09',NULL,NULL),('7219639062d026c08a04f84f360a54232dbf23b8','CH_PENA','dum-e','dum-e','2015-02-18','23:55:34',NULL,NULL),('7279b20d9d2facbe3de822fb4e5eab89301f7732','CH_PENA','dum-e','dum-e','2015-02-19','15:57:25','2015-02-19','15:57:29'),('7342991be2626479c450eaaff159d762fdaef08d','CH_PENA','dum-e','dum-e','2015-05-16','22:00:49','2015-05-16','22:01:04'),('73d28836110d9362141cb4c68746932589b010c1','CH_PENA','dum-e','dum-e','2015-02-19','16:00:22','2015-02-19','16:00:26'),('73f7a975522cc3ffd9e1f28f9a4fca1733dbca31','CH_PENA','dum-e','dum-e','2015-05-13','01:00:37',NULL,NULL),('744941f04fc29fca6d1f6c67c1c9491781cf18fe','CH_PENA','dum-e','dum-e','2015-05-12','00:34:28',NULL,NULL),('74de89536a58d74b541369886455c71c57abb9ea','CH_PENA','dum-e','dum-e','2015-05-17','15:24:21','2015-05-17','15:24:36'),('74e2fe74024d20f55026c254709a795dcd26a81d','CH_PENA','dum-e','dum-e','2015-05-16','22:10:24','2015-05-16','22:11:13'),('755815f87050c5edab1db4656a9a864a83e882dd','CH_PENA','dum-e','dum-e','2015-03-14','22:34:59',NULL,NULL),('75cb0329ee04b8239dc653a2c05f3c36016d2f0b','CH_PENA','dum-e','dum-e','2015-05-15','22:36:12',NULL,NULL),('75cd9bc618074567c0584deb4f01226e57ea3abd','CH_PENA','dum-e','dum-e','2015-02-21','23:20:21','2015-02-21','23:20:25'),('7617ad2ca733a74518eaadf07226cd1f7878c046','CH_PENA','dum-e','dum-e','2015-05-13','00:11:32',NULL,NULL),('76636fbc5d47368029c8206a8b466e8fa3ea130a','CH_PENA','dum-e','dum-e','2015-05-17','19:15:53',NULL,NULL),('7683cd167e414bbbb07a4d2036ce98494ae8b4b7','CH_PENA','dum-e','dum-e','2015-05-14','00:02:32',NULL,NULL),('76934aef4e280a3a94933f647015b8d7658dbad3','CH_PENA','dum-e','dum-e','2015-02-19','13:34:37','2015-02-19','13:35:09'),('76b60dd31d4f2a15392f24fd60f30d817fe45a98','CH_PENA','dum-e','dum-e','2015-05-13','01:11:01',NULL,NULL),('774badd0dd061dceda846db57ef07b294c17af3a','CH_PENA','dum-e','dum-e','2015-05-10','01:48:02',NULL,NULL),('785b5e9e1c610bbe5dbd3e25958da47d255a7345','CH_PENA','dum-e','dum-e','2015-05-12','23:00:56',NULL,NULL),('790ec46a604be266eae19a0200a3798b5fe33d38','CH_PENA','dum-e','dum-e','2015-02-18','21:59:56',NULL,NULL),('791451995863bff84633ff08b774b6bf0c90bf93','CH_PENA','dum-e','dum-e','2015-02-21','22:57:18',NULL,NULL),('7945b17eb07efbb800e2733cb4e945501d3b0b6d','CH_PENA','dum-e','dum-e','2015-02-19','01:05:56',NULL,NULL),('797b8e1e3d84e75fae517c322fc97d0408e833e8','CH_PENA','dum-e','dum-e','2015-02-21','10:25:38',NULL,NULL),('79da59cac77e392f79b1962f470101c875c3cb8c','CH_PENA','dum-e','dum-e','2015-05-16','22:27:52',NULL,NULL),('7a2fea2db7c71cbb6df06332206a4d2aa7223eef','CH_PENA','dum-e','dum-e','2015-05-15','22:03:46',NULL,NULL),('7a4daa107f0c4cc189fd3f071e308ad6ae5df385','CH_PENA','dum-e','dum-e','2015-05-13','23:45:19',NULL,NULL),('7aaf3c87918d8505ea529141bef8614cdf5c3599','CH_PENA','dum-e','dum-e','2015-05-14','01:36:07',NULL,NULL),('7b0463f88d73782df4b23e2b2092225413b441b5','CH_PENA','dum-e','dum-e','2015-03-14','22:11:22',NULL,NULL),('7b0ac829754d6b23829b18f4db205d1da7582700','CH_PENA','dum-e','dum-e','2015-03-14','21:49:32',NULL,NULL),('7b20494df40fb708c2ecee9b0044e0d11fa55abd','CH_PENA','dum-e','dum-e','2015-05-14','00:16:12',NULL,NULL),('7b4c5b334c9cfed9e8371f342607f7bc790d237a','CH_PENA','dum-e','dum-e','2015-05-12','00:29:00',NULL,NULL),('7b7e642e8e378afa6a70adea967f4a9a6ecdf992','CH_PENA','dum-e','dum-e','2015-05-17','12:55:13',NULL,NULL),('7bbebc2d221242c2ed865b38d019ee19a4a6d4fc','CH_PENA','dum-e','dum-e','2015-05-16','23:14:28','2015-05-16','23:14:37'),('7c07e45511065de06bfe3c489661e526e40ad9e1','CH_PENA','dum-e','dum-e','2015-05-12','23:10:05',NULL,NULL),('7c5bd17e8ed2cc15105c105f20a4c74445802dbc','CH_PENA','dum-e','dum-e','2015-05-13','23:32:32',NULL,NULL),('7c848a5a6f5ecdc48f994159d8e2fab233500a9c','CH_PENA','dum-e','dum-e','2015-05-13','00:51:11',NULL,NULL),('7d1206eb7288c2d8b74bb3bfcfba034c05e1ac8e','CH_PENA','dum-e','dum-e','2015-05-13','00:54:37',NULL,NULL),('7d3fe2aec871e83349c07f8d23cccec5bf412edd','CH_PENA','dum-e','dum-e','2015-05-17','12:09:14','2015-05-17','12:09:35'),('7dc04cc58bf644aa0dede807003dcbc4d0758f1e','CH_PENA','dum-e','dum-e','2015-05-14','00:26:06',NULL,NULL),('7e8fe82ed71f0623f35805856245cefea47b6707','CH_PENA','dum-e','dum-e','2015-05-14','00:55:51',NULL,NULL),('7ed5ed88b2cb67ed88cd7da6d46d3ff4fca64a3e','CH_PENA','dum-e','dum-e','2015-05-17','00:42:50','2015-05-17','00:50:49'),('7fcf5b5f04a148162e406831f975f41e2118e860','CH_PENA','dum-e','dum-e','2015-05-14','01:04:31',NULL,NULL),('7febc7f777fa52fc99e6773c433371ac68791969','CH_PENA','dum-e','dum-e','2015-05-17','12:32:10','2015-05-17','12:34:57'),('80175b905c02f882a5dc985f86da05f03e340d35','CH_PENA','dum-e','dum-e','2015-02-22','12:03:56',NULL,NULL),('802ab7631a9ce54c6115dca1fdeb2fec9d4f25c3','CH_PENA','dum-e','dum-e','2015-05-16','21:35:38',NULL,NULL),('804a3e0af66057781b1aa01dc41c49b85dc662a8','CH_PENA','dum-e','dum-e','2015-05-13','23:18:24',NULL,NULL),('814f6591fa7f70b46404282851eb415706f4d562','CH_PENA','dum-e','dum-e','2015-05-13','23:57:16',NULL,NULL),('816a0caabd6b9f652bd0d443b81ee0d1d6454079','CH_PENA','dum-e','dum-e','2015-02-20','14:31:22','2015-02-20','14:33:15'),('8171f67b1a08cd5e96dce16a99de12c5d9d39cba','CH_PENA','dum-e','dum-e','2015-05-14','00:00:08',NULL,NULL),('81cd53f7f9f8ad38bcf65f1a18d5d44c52c5cf64','CH_PENA','dum-e','dum-e','2015-05-17','16:44:05','2015-05-17','16:51:16'),('827d6138877f97b8b1b2da276cbaaa11060de846','CH_PENA','dum-e','dum-e','2015-03-14','21:58:57',NULL,NULL),('82ccd16c47322fc769a925a80e14a2d2fa97a1e5','CH_PENA','dum-e','dum-e','2015-05-15','22:24:02',NULL,NULL),('82db3d2750ee989121a84acd64b092d9265dbfca','CH_PENA','dum-e','dum-e','2015-05-13','22:53:21',NULL,NULL),('83e13037bfd4f6c3d2a9f762a825b77dda012208','CH_PENA','dum-e','dum-e','2015-05-13','23:38:05',NULL,NULL),('83fff30598fe866f9f905bb7f21f3e1f51cff2e2','CH_PENA','dum-e','dum-e','2015-05-16','21:38:36',NULL,NULL),('84978aec5860334e43c5c40c527402d334f01254','CH_PENA','dum-e','dum-e','2015-05-15','22:36:00',NULL,NULL),('84d4fea3f2c71e2c51d97e7b6d1a1fd3dddb147c','CH_PENA','dum-e','dum-e','2015-05-16','23:18:44',NULL,NULL),('85705d447903ea80bf50cc312c9e006f9662fd4e','CH_PENA','dum-e','dum-e','2015-05-13','23:15:51',NULL,NULL),('860e8a797e213debd54cc574326ef6c15acfde97','CH_PENA','dum-e','dum-e','2015-05-16','20:14:39',NULL,NULL),('864620e9110e44f596b075ce5357891a51b4e9d9','CH_PENA','dum-e','dum-e','2015-05-17','13:44:36','2015-05-17','13:46:18'),('86575c2894657bf1cbaf24b03949c39329e66646','CH_PENA','dum-e','dum-e','2015-05-17','12:04:39','2015-05-17','12:04:52'),('86ed5ab119390486829aa86a9864b2f8f9984bd9','CH_PENA','dum-e','dum-e','2015-05-10','23:54:38',NULL,NULL),('8737790590d79936007b8fa363c4332e7f448f43','CH_PENA','dum-e','dum-e','2015-05-10','01:49:29',NULL,NULL),('87a7e305f513394e02768eaeac7b66f91b7034da','CH_PENA','dum-e','dum-e','2015-02-18','21:16:03',NULL,NULL),('88408db25a739143ca370448af07c03ee5d91085','CH_PENA','dum-e','dum-e','2015-02-19','13:29:47','2015-02-19','13:29:54'),('8966f0a56756e4876b18f7252367dd5fda8e7860','CH_PENA','dum-e','dum-e','2015-05-12','00:34:09',NULL,NULL),('899bb071a88eb9a56807bd896a009277d88ffe14','CH_PENA','dum-e','dum-e','2015-03-14','21:54:21',NULL,NULL),('8b1fa5e92e0dbdd83f10d33c14960051268f2b6d','CH_PENA','dum-e','dum-e','2015-05-13','23:57:59',NULL,NULL),('8bf57ecb240a4c9bd67f01c5068caefaf53dbef4','CH_PENA','dum-e','dum-e','2015-05-12','23:01:37',NULL,NULL),('8d9f2cfd35d56e639178815009d50dfc6f927f19','CH_PENA','dum-e','dum-e','2015-05-16','22:39:39',NULL,NULL),('8dfd1a5c0787d5af5af16c8f2de786dc101581ac','CH_PENA','dum-e','dum-e','2015-05-14','00:17:20',NULL,NULL),('8e12d4993109e88a6651dd6adb1b9a8e9da31dcc','CH_PENA','dum-e','dum-e','2015-05-15','22:25:57',NULL,NULL),('8f524dd4cea57ec8028abf96ae23f0cce26011fb','CH_PENA','dum-e','dum-e','2015-05-13','22:53:01',NULL,NULL),('8fbfe9d78358da8047a946cc4973dcdce227761a','CH_PENA','dum-e','dum-e','2015-05-15','22:41:56',NULL,NULL),('8fd0ea5c392844b5b1123a19cfdaf134c5c33d92','CH_PENA','dum-e','dum-e','2015-05-13','23:28:12',NULL,NULL),('8fdac64f0f2ed2343025eb0fcaae88fc8cebcf0f','CH_PENA','dum-e','dum-e','2015-05-14','00:17:43',NULL,NULL),('8fe73947cb1da0513df245b40843e44f5348a703','CH_PENA','dum-e','dum-e','2015-03-14','22:19:17',NULL,NULL),('90366368722d79e97df1673d1a06a67256bb5e4c','CH_PENA','dum-e','dum-e','2015-05-12','23:03:08',NULL,NULL),('907e6f62b6673fb4b5ea5cab5c012916d867cfea','CH_PENA','dum-e','dum-e','2015-05-17','12:46:17','2015-05-17','12:46:41'),('90e0917936c01e43908ecb4eae095de13bd28f06','CH_PENA','dum-e','dum-e','2015-05-16','22:21:36',NULL,NULL),('91015492d06dc0ac04ec2b80b313f795203565c2','CH_PENA','dum-e','dum-e','2015-05-15','22:55:40',NULL,NULL),('914a59260e6caf4b7ee653885252f5b97c882525','CH_PENA','dum-e','dum-e','2015-03-14','22:19:49',NULL,NULL),('91b24b473f0cf74d8fc2ea6640faaf85c085d7fc','CH_PENA','dum-e','dum-e','2015-05-17','13:33:39','2015-05-17','13:33:49'),('923a2d08c8a741b0eb707a8e20a10d6f3e39b896','CH_PENA','dum-e','dum-e','2015-05-14','00:26:18',NULL,NULL),('92452e9d3b4baf7950c949e48d4b3bfce3de74d5','CH_PENA','dum-e','dum-e','2015-05-17','11:50:08',NULL,NULL),('925fe5ea058b2dda960dd564234c2c493c0500a6','CH_PENA','dum-e','dum-e','2015-05-17','17:51:48',NULL,NULL),('94b6eef6c76d7c0669a2922fe8755d807faab618','CH_PENA','dum-e','dum-e','2015-05-13','22:53:44',NULL,NULL),('94f702e43bdca5675987d6a42aa507ef1f6a9d53','CH_PENA','dum-e','dum-e','2015-05-17','13:37:18',NULL,NULL),('953e086b0dad4165834032c482516b76a97f3d5c','CH_PENA','dum-e','dum-e','2015-05-12','22:25:19',NULL,NULL),('955725b1b0d3927438ce1955ae69cdfb35963481','CH_PENA','dum-e','dum-e','2015-02-19','01:00:25',NULL,NULL),('960306069bfa28881d0be7bb969020fd4cc8e057','CH_PENA','dum-e','dum-e','2015-03-14','22:28:50',NULL,NULL),('9661d4406a3dbc69d5022327c2866340ac5b7c6a','CH_PENA','dum-e','dum-e','2015-05-16','22:35:30',NULL,NULL),('96e9effafed134542d1ec79c2df223edcdf866f8','CH_PENA','dum-e','dum-e','2015-05-16','23:12:16','2015-05-16','23:12:41'),('97a6962edcfdeed1c7b2bc85b9177c9d65a02a66','CH_PENA','dum-e','dum-e','2015-02-19','14:48:45',NULL,NULL),('9818b3fecfdd6dabecfbcd61335efcee87282c86','CH_PENA','dum-e','dum-e','2015-03-14','22:28:29',NULL,NULL),('983a315c4fe2e9d259c1136f85d306af6cdae035','CH_PENA','dum-e','dum-e','2015-02-20','14:12:13','2015-02-20','14:20:23'),('986bbd368a3a975428a8c78336a5b6c1eaa70b63','CH_PENA','dum-e','dum-e','2015-02-19','16:04:05','2015-02-19','16:06:23'),('986c4eebc4c66ff255a38b10ce45a1f6ef2c88e4','CH_PENA','dum-e','dum-e','2015-05-14','00:53:13',NULL,NULL),('989c4b0967ac7fb37867caf8f42239df4ac76a3f','CH_PENA','dum-e','dum-e','2015-03-14','22:45:23',NULL,NULL),('9970ddbbb34a8f1c90ba47cc44740a33584d425d','CH_PENA','dum-e','dum-e','2015-05-17','18:02:11','2015-05-17','18:03:54'),('9a15317f012a097bf8bebf455176e1f407250f0e','CH_PENA','dum-e','dum-e','2015-05-16','23:51:31',NULL,NULL),('9c1b162dd8cc5ca22f437b2ab7caea099d2c1e79','CH_PENA','dum-e','dum-e','2015-02-19','15:52:20','2015-02-19','15:52:23'),('9c4527a3323fc53c5fdc779d28d43f4cd00c91af','CH_PENA','dum-e','dum-e','2015-05-16','21:26:18',NULL,NULL),('9c54ca8d49f2be559d0438d89ab798f1a2dfd87c','CH_PENA','dum-e','dum-e','2015-02-19','14:20:24',NULL,NULL),('9cc8c3e23f0ce72c8bcae78f0d8d0c75df2f1cfc','CH_PENA','dum-e','dum-e','2015-02-19','15:58:48','2015-02-19','15:58:52'),('9d60701c6c836c02538e4ec48774e263899e3c90','CH_PENA','dum-e','dum-e','2015-03-14','21:44:57',NULL,NULL),('9d683d20028bacc827cf4c857b028b38c8e735ca','CH_PENA','dum-e','dum-e','2015-03-14','22:33:08',NULL,NULL),('9d7975977d5977d72e021ec5a42e3cf0be5b6fcc','CH_PENA','dum-e','dum-e','2015-05-15','22:35:16',NULL,NULL),('9de3db94a7b3a72155c19a3233314390c19e86c4','CH_PENA','dum-e','dum-e','2015-05-12','22:56:16',NULL,NULL),('9e7eb70106d1c4096b63b41cee65ba4355ffa14e','CH_PENA','dum-e','dum-e','2015-05-14','01:13:11',NULL,NULL),('9f0606390c272a998f3afce96f5cdc64dab5fbae','CH_PENA','dum-e','dum-e','2015-05-17','12:09:49','2015-05-17','12:10:08'),('a050317cc1d3c4b26cd30deb284eeb3405a3a145','CH_PENA','dum-e','dum-e','2015-05-14','00:44:46',NULL,NULL),('a07db975e533cb6224207be655d6ff3df0c3b58a','CH_PENA','dum-e','dum-e','2015-05-16','23:15:08',NULL,NULL),('a118c2e22ee46f725fe0d49f91bb4cac4acc1ed4','CH_PENA','dum-e','dum-e','2015-05-13','00:29:29',NULL,NULL),('a15c16fc87b80f77d11d8dd3dfd4534762387c01','CH_PENA','dum-e','dum-e','2015-02-20','14:11:38','2015-02-20','14:11:44'),('a1f5bf19bc2f2a686e2dd686fdbf08fea8675572','CH_PENA','dum-e','dum-e','2015-05-13','23:19:45',NULL,NULL),('a2d062d26700563fd4db98217a9b08a4723c9847','CH_PENA','dum-e','dum-e','2015-05-17','17:47:45','2015-05-17','17:48:29'),('a409436af2acb565cf49f6e55507a37cc183cd67','CH_PENA','dum-e','dum-e','2015-05-17','13:59:09','2015-05-17','13:59:47'),('a4e1f46de26ed32bdab8ac25f987d2ebdb4b2072','CH_PENA','dum-e','dum-e','2015-02-22','12:05:17',NULL,NULL),('a539afff07996863908d3dbc60185c13c40fdf6f','CH_PENA','dum-e','dum-e','2015-05-16','23:44:35','2015-05-16','23:45:25'),('a668ffcf10a56e5e851a470aa0bb6e676704c516','CH_PENA','dum-e','dum-e','2015-05-14','00:57:53',NULL,NULL),('a6bf0b8a235a7d63763c5657ab2720f49d869d44','CH_PENA','dum-e','dum-e','2015-02-19','01:12:23',NULL,NULL),('a70240c86a5192ee22a6f918afc76eb60f0f6f02','CH_PENA','dum-e','dum-e','2015-05-14','00:27:57',NULL,NULL),('a76196918740b834336b66f50f95b45b55c93347','CH_PENA','dum-e','dum-e','2015-05-15','22:36:23',NULL,NULL),('a771aac39430606fbfa8c8bc7e44a8cb4979fd00','CH_PENA','dum-e','dum-e','2015-05-15','22:29:12',NULL,NULL),('a7ea7910f09cceb94ae14ff708977e363caa17af','CH_PENA','dum-e','dum-e','2015-02-20','14:26:58','2015-02-20','14:27:01'),('a8bf101ea9a54b6c9bbbb8297d2a7d33e515096d','CH_PENA','dum-e','dum-e','2015-05-17','00:03:54','2015-05-17','00:09:20'),('a8c9675a937aa8a7e043cb23054967f57f9928bf','CH_PENA','dum-e','dum-e','2015-02-19','15:59:59','2015-02-19','16:00:06'),('a8d09d2fab47da5ff1142d52524c2d5d0621d804','CH_PENA','dum-e','dum-e','2015-05-17','14:50:35',NULL,NULL),('a8e3a54e6106de30692916b4b3f47072c767dcbe','CH_PENA','dum-e','dum-e','2015-05-16','21:58:57','2015-05-16','21:59:28'),('a9a8c130b5cc45bbb5d1f140554e11adf8f6b6d2','CH_PENA','dum-e','dum-e','2015-02-19','00:43:52',NULL,NULL),('aa432a0b06eca6c27c9b6810b196ff4f8ec66955','CH_PENA','dum-e','dum-e','2015-05-17','11:47:49','2015-05-17','11:48:00'),('aa5231ee3adca25787cea6f8bb19dff005ca4b36','CH_PENA','dum-e','dum-e','2015-05-13','00:23:37',NULL,NULL),('aa83d196e6b9d0528f88c30da3d6f19f41c34efd','CH_PENA','dum-e','dum-e','2015-05-13','00:45:19',NULL,NULL),('aab5f2d3a4086ca2a6b2558f82dccacfab22c3a2','CH_PENA','dum-e','dum-e','2015-03-14','22:18:56',NULL,NULL),('ab408f665e4019e354014ddf84c2d1f03581af4b','CH_PENA','dum-e','dum-e','2015-02-19','13:30:15',NULL,NULL),('ab6c4abd199cbb9a2beaf2639ac90be1386c4c1c','CH_PENA','dum-e','dum-e','2015-02-19','21:11:25','2015-02-19','21:11:51'),('ac0ee4d834ebca38e3493f8141a9ea876106f718','CH_PENA','dum-e','dum-e','2015-05-17','12:15:13','2015-05-17','12:15:30'),('ac3459997c5da3e2c676937568ac5dd3195f299d','CH_PENA','dum-e','dum-e','2015-03-14','22:21:57',NULL,NULL),('ac431ae7cf46cd89136814e650afda0ab7df75a7','CH_PENA','dum-e','dum-e','2015-05-13','23:42:03',NULL,NULL),('ac7a19b82c30a2487d8a2386f78caccfb9b455d8','CH_PENA','dum-e','dum-e','2015-05-12','00:36:09',NULL,NULL),('ac8beb211b042891153309acf59178a4df31af0a','CH_PENA','dum-e','dum-e','2015-02-19','13:41:09','2015-02-19','13:41:36'),('ac9c584f85370715dd506895a49009f2f220f4b9','CH_PENA','dum-e','dum-e','2015-02-21','10:28:22',NULL,NULL),('aceea8ca4d02c3b552ea68930acef2edecf9ed92','CH_PENA','dum-e','dum-e','2015-05-12','23:02:33',NULL,NULL),('ad12228f1e31340bbc339a684d8e3d76995a4841','CH_PENA','dum-e','dum-e','2015-02-19','00:25:17',NULL,NULL),('ae013d3c7201bc8cbed65145b057954756239ec2','CH_PENA','dum-e','dum-e','2015-05-15','22:23:24',NULL,NULL),('ae2b7139f7a61ccda5209ed3451f14d804430769','CH_PENA','dum-e','dum-e','2015-05-13','23:59:06',NULL,NULL),('aed512a6d4aae8eacf8369f756a3bbfa16ed0f69','CH_PENA','dum-e','dum-e','2015-05-13','22:41:41',NULL,NULL),('aef1583c5fc98b28f80c88c4e22ea35dcecc8d8c','CH_PENA','dum-e','dum-e','2015-05-16','20:13:05','2015-05-16','20:13:36'),('aefe5ce66ee7b9e490d67de76751053cb36551f3','CH_PENA','dum-e','dum-e','2015-05-17','11:18:42',NULL,NULL),('af67077a1e5ac2e5e5b2b7f0f215d897393cb59e','CH_PENA','dum-e','dum-e','2015-05-13','22:56:29',NULL,NULL),('af71e89769a215dac48557f100cc586150d3fdde','CH_PENA','dum-e','dum-e','2015-05-13','23:28:26',NULL,NULL),('af7a1a86651f6cd85f35493541c04c2b1416295d','CH_PENA','dum-e','dum-e','2015-05-15','22:45:20',NULL,NULL),('afd2d5ace228e0689d62be3a9c0d1b6734cde467','CH_PENA','dum-e','dum-e','2015-05-13','23:44:45',NULL,NULL),('afd89d557f03f468927f07d1889e763e8014214c','CH_PENA','dum-e','dum-e','2015-05-17','12:56:05',NULL,NULL),('b011e6f523be9089311c16bc851e506e1893a93d','CH_PENA','dum-e','dum-e','2015-05-16','20:45:02',NULL,NULL),('b01ef29446a1abbaf9fa7304b6d188c8bdc52e0c','CH_PENA','dum-e','dum-e','2015-05-12','22:53:03',NULL,NULL),('b0671c15dac53e8e8ddad68fd0913578590bf93f','CH_PENA','dum-e','dum-e','2015-03-14','22:29:58',NULL,NULL),('b08e8020c07868baa91fefd3092b53c52f101f49','CH_PENA','dum-e','dum-e','2015-03-14','21:53:51',NULL,NULL),('b138902c0a0531fdaedc39b81606002e78a0c85e','CH_PENA','dum-e','dum-e','2015-05-12','22:53:22',NULL,NULL),('b18ba3660e1c2990c554fb0a3910c79616f23bfa','CH_PENA','dum-e','dum-e','2015-02-19','15:48:18','2015-02-19','15:48:32'),('b27f12bcba12e01f781f463541f9046fbc400f55','CH_PENA','dum-e','dum-e','2015-02-18','21:11:26',NULL,NULL),('b2d96ff394ff49eab585f6b8e6b488eb989df3b5','CH_PENA','dum-e','dum-e','2015-02-21','10:53:07',NULL,NULL),('b2f521a5723040af096d1d5ed016316e8b5117c1','CH_PENA','dum-e','dum-e','2015-05-16','19:42:01',NULL,NULL),('b3847c82e963ffab72b9c56dce29c6f18fd612f9','CH_PENA','dum-e','dum-e','2015-05-12','23:07:01',NULL,NULL),('b3d4033b61f76953a8ed798b79b27eb4892890fd','CH_PENA','dum-e','dum-e','2015-05-16','20:11:34',NULL,NULL),('b4f5c50c843196e6b93a5ccd206c0a4ba32e2bee','CH_PENA','dum-e','dum-e','2015-02-18','23:39:32',NULL,NULL),('b56392382db433bc29f240a7c61724ca24c03a7f','CH_PENA','dum-e','dum-e','2015-05-15','22:40:43',NULL,NULL),('b578a7a5da949256f86cfdcd77ae2217e3e13386','CH_PENA','dum-e','dum-e','2015-05-17','01:41:11','2015-05-17','01:51:09'),('b5c0389292afd146223c9c8aeb2ef25fd969c635','CH_PENA','dum-e','dum-e','2015-02-19','15:56:36','2015-02-19','15:56:41'),('b634278e86e092b4ae290ba9400a1c9823e4a8d7','CH_PENA','dum-e','dum-e','2015-05-16','22:26:33',NULL,NULL),('b785f33ab33276c35b8219fe58f0d36f169e0e91','CH_PENA','dum-e','dum-e','2015-05-15','22:58:49',NULL,NULL),('b7b152dd890a6a711de36729883e9b08b5284c33','CH_PENA','dum-e','dum-e','2015-02-19','14:21:11','2015-02-19','14:21:29'),('b7b5b35d6955ce227bd4e517560e0caefb9025c3','CH_PENA','dum-e','dum-e','2015-05-16','22:12:30',NULL,NULL),('b80ead49808f4f05ef0cea752661d95aad628765','CH_PENA','dum-e','dum-e','2015-03-21','19:20:56',NULL,NULL),('b89a4a9cf8e99b05ceebe6d0a7bf1aa2749ace16','CH_PENA','dum-e','dum-e','2015-05-16','22:19:08',NULL,NULL),('b9d1f060a550e3b23f7acd1a62d0caf609d0ceb9','CH_PENA','dum-e','dum-e','2015-05-17','11:59:14','2015-05-17','11:59:35'),('b9e7f634e1897a0dc267ba2944e0f6cbc40083be','CH_PENA','dum-e','dum-e','2015-02-19','14:16:07','2015-02-19','14:16:14'),('ba23b13a977058dd18588be0d45321814a5164b7','CH_PENA','dum-e','dum-e','2015-03-14','21:53:14',NULL,NULL),('ba7b7f0b34e7104fbedec9deee1f71a8278679a5','CH_PENA','dum-e','dum-e','2015-05-14','00:03:42',NULL,NULL),('baf45d73370c49481288ec8a21b2b7b8915e4641','CH_PENA','dum-e','dum-e','2015-02-22','12:12:53',NULL,NULL),('bb00918e48c7629199a5428a190f4c1aa6bed44a','CH_PENA','dum-e','dum-e','2015-05-15','22:50:25',NULL,NULL),('bb55673beda5ce3743accf9976a3bf3053c51923','CH_PENA','dum-e','dum-e','2015-05-13','23:50:05',NULL,NULL),('bc747544f7dc10049d64b06be7399b9b9ef1a9f5','CH_PENA','dum-e','dum-e','2015-05-13','23:20:40',NULL,NULL),('bda6fec28be6dcc5afee8e908cae9bc70e2af789','CH_PENA','dum-e','dum-e','2015-02-21','10:01:34',NULL,NULL),('bdbd5e79c07aa37195f242f49b6efe487e0072e2','CH_PENA','dum-e','dum-e','2015-05-16','21:27:00',NULL,NULL),('bde7769e983cec3cc1f4770ba0a7c244ba550997','CH_PENA','dum-e','dum-e','2015-05-13','01:08:14',NULL,NULL),('be0b6bb79397250b11afbfb9b53c2d22fe296b20','CH_PENA','dum-e','dum-e','2015-05-12','22:27:46',NULL,NULL),('be8fb4620eceda49a6c3f8ba091fa82a35505736','CH_PENA','dum-e','dum-e','2015-05-15','22:26:08',NULL,NULL),('beb2a4bb887275f2d442eeb0215a21254231b26b','CH_PENA','dum-e','dum-e','2015-05-16','21:25:59',NULL,NULL),('bef7cde936fbd03a64012990a4ad6766c040c01c','CH_PENA','dum-e','dum-e','2015-02-22','11:16:47',NULL,NULL),('bf41a43de08030d640e35770dce59b48cfc67d84','CH_PENA','dum-e','dum-e','2015-05-13','00:51:28',NULL,NULL),('c166aa0a75d7855c57d1d430db9c2181de8372dc','CH_PENA','dum-e','dum-e','2015-02-19','15:58:39','2015-02-19','15:58:42'),('c19984e5bf6e911229eb6769e06e55e17f4a2c53','CH_PENA','dum-e','dum-e','2015-05-14','01:07:29',NULL,NULL),('c20942939df461152047ee601c00ed33fa91c209','CH_PENA','dum-e','dum-e','2015-02-22','12:04:57',NULL,NULL),('c29a2751006bddedab770302952bb337407a4764','CH_PENA','dum-e','dum-e','2015-05-17','15:13:05',NULL,NULL),('c31db10ea622a4b8f214ccf70298bc7a690af5bf','CH_PENA','dum-e','dum-e','2015-05-17','19:12:52','2015-05-17','19:13:09'),('c3a03d00282c1150e2f3303445cf0115e846a3d1','CH_PENA','dum-e','dum-e','2015-03-14','22:29:40',NULL,NULL),('c456a802894596add54d4faf5ff95a0ac2e34aa2','CH_PENA','dum-e','dum-e','2015-05-16','22:45:47','2015-05-16','22:45:52'),('c4ec4e6b864b1e088d02d43225db0365ca8f4c08','CH_PENA','dum-e','dum-e','2015-05-14','00:51:53',NULL,NULL),('c5410316b6ff2b283da5d6c870716ddc6053a138','CH_PENA','dum-e','dum-e','2015-05-15','22:40:12',NULL,NULL),('c591cc9f4897a5dd521f7ed605ccbcbd3077026a','CH_PENA','dum-e','dum-e','2015-02-20','14:26:12','2015-02-20','14:26:19'),('c64d44a3386f47c18214ba71d4e45dce169e9d1f','CH_PENA','dum-e','dum-e','2015-05-15','22:22:59',NULL,NULL),('c6ebee499a715863d1b7e6ac51fc2f191fc7967d','CH_PENA','dum-e','dum-e','2015-02-22','00:57:25',NULL,NULL),('c6fda7377b186e4b992937005b6cd6b2ddf41ce6','CH_PENA','dum-e','dum-e','2015-05-10','23:11:51',NULL,NULL),('c79890f5a7469bc7bce4390127da01b5c79f2adc','CH_PENA','dum-e','dum-e','2015-02-18','21:56:32',NULL,NULL),('c8bae867970f5238757062a169028a9eba0d09e5','CH_PENA','dum-e','dum-e','2015-05-17','18:04:00','2015-05-17','18:04:02'),('c92b5dba2b621c2d3e91c4f0d5b942ee2bee91e3','CH_PENA','dum-e','dum-e','2015-05-13','22:58:14',NULL,NULL),('c951f3e7e6bc7a1c36648168a3795b1b405eb50f','CH_PENA','dum-e','dum-e','2015-05-17','12:35:06',NULL,NULL),('c9b9abe6229989a56c6e014f4a2eb61fdb4971b8','CH_PENA','dum-e','dum-e','2015-03-14','22:08:02',NULL,NULL),('c9c3cd955d0a74a29999705da53b61978b25992d','CH_PENA','dum-e','dum-e','2015-05-13','23:39:05',NULL,NULL),('c9ea264fef1b8b53d4ab14e53300654cb2bd485c','CH_PENA','dum-e','dum-e','2015-02-18','23:36:48',NULL,NULL),('ca0fb2b75ed39eee6f3ea84b5b51c6ae48fd9813','CH_PENA','dum-e','dum-e','2015-05-16','22:33:18',NULL,NULL),('cae76e750e470d91e2b9d5892ce81309bb88e9bc','CH_PENA','dum-e','dum-e','2015-03-14','21:54:08',NULL,NULL),('cba42d29d9859c4a527e9c8e70d10762099a88c7','CH_PENA','dum-e','dum-e','2015-05-13','23:47:57',NULL,NULL),('cc30b3905527551b59de9ffd9d070ecc4682672f','CH_PENA','dum-e','dum-e','2015-05-13','22:57:58',NULL,NULL),('cd16b227dca59be304fe838be304d5ec4c5477fc','CH_PENA','dum-e','dum-e','2015-03-14','22:42:26',NULL,NULL),('cd262da51752ffa674066e4fddbee95a4c4ed063','CH_PENA','dum-e','dum-e','2015-05-15','22:10:32',NULL,NULL),('cd5b772a74e5349ac5e49b086c6232d93b1d10e3','CH_PENA','dum-e','dum-e','2015-05-15','22:46:01',NULL,NULL),('cd6feedafa89f9b2840e28df9b73971600ddbab8','CH_PENA','dum-e','dum-e','2015-05-13','23:40:45',NULL,NULL),('ce34642c60a2747328c300c9adb337d4c71f13eb','CH_PENA','dum-e','dum-e','2015-05-15','22:11:30',NULL,NULL),('ce58a3ddc6b6ad618baf4a798d29dedc47c8db99','CH_PENA','dum-e','dum-e','2015-05-14','00:55:03',NULL,NULL),('ced35517adbb13600323c25febd959f585041337','CH_PENA','dum-e','dum-e','2015-02-19','16:00:34','2015-02-19','16:00:39'),('cfcab083191564f7a71a4ba9c0ad5ac8e64501de','CH_PENA','dum-e','dum-e','2015-05-13','23:53:54',NULL,NULL),('cfff5d29cdd394a8b92ea6d79a0317b3ccece816','CH_PENA','dum-e','dum-e','2015-02-20','14:27:28','2015-02-20','14:27:30'),('cffff3208cdaa334aba2d742ce57de0799bd8ae7','CH_PENA','dum-e','dum-e','2015-05-13','23:39:15',NULL,NULL),('d087a690b3f38522d776d584c79f0288ecfde3d7','CH_PENA','dum-e','dum-e','2015-02-22','13:19:16',NULL,NULL),('d0a7a2b878e698cd5f80eac3df169b84c6c61184','CH_PENA','dum-e','dum-e','2015-05-13','00:29:01',NULL,NULL),('d0baa1cf88440366213a73323bfbe8dc7c4c6d72','CH_PENA','dum-e','dum-e','2015-05-13','22:54:49',NULL,NULL),('d1158b7a03e15d347020fb28173f8145fb81dd64','CH_PENA','dum-e','dum-e','2015-05-15','23:02:36',NULL,NULL),('d12926f5875adc04bb2a12f0c1af93f69d786d20','CH_PENA','dum-e','dum-e','2015-03-14','21:42:07',NULL,NULL),('d14c19af6e261d20dbd5ebcac1843a3b314f791f','CH_PENA','dum-e','dum-e','2015-05-13','00:26:20',NULL,NULL),('d151ae4390831340b88dbdc0b2426c0357591010','CH_PENA','dum-e','dum-e','2015-05-13','23:02:06',NULL,NULL),('d182ad39aeb48ca8f780afc2edc3c9e19fcc35d0','CH_PENA','dum-e','dum-e','2015-05-13','23:07:32',NULL,NULL),('d3d1f4ab9f0bd27eeeb9cb411ec1e20838bf7903','CH_PENA','dum-e','dum-e','2015-02-19','16:03:44','2015-02-19','16:03:52'),('d4cdefa85105723ba34337bf47d1e2ac2ced6b3a','CH_PENA','dum-e','dum-e','2015-05-12','22:57:26',NULL,NULL),('d5c96b3c4bc4c8b7f9a2529af9e7ec9480c15776','CH_PENA','dum-e','dum-e','2015-02-20','14:28:09','2015-02-20','14:28:12'),('d6ba8ccf4b67d7dd08f122fafda0412c9389d37d','CH_PENA','dum-e','dum-e','2015-03-14','22:43:51',NULL,NULL),('d6d405b3a212cb558219d46851b7facc0837b651','CH_PENA','dum-e','dum-e','2015-05-14','00:41:55',NULL,NULL),('d7372fb7e7dbfe7c8d3b3d7e9cd02a3acb3253d1','CH_PENA','dum-e','dum-e','2015-05-15','22:40:27',NULL,NULL),('d75b304f280ab113ce87ecd1b315ff677b3f601f','CH_PENA','dum-e','dum-e','2015-02-21','22:58:15',NULL,NULL),('d764a81c2ee8a081334cf17eb062b2ec7d102f96','CH_PENA','dum-e','dum-e','2015-05-14','00:24:18',NULL,NULL),('d76afe75b9a3e505887b568a159a998a15bac3b2','CH_PENA','dum-e','dum-e','2015-05-17','15:39:07','2015-05-17','15:39:27'),('d784183641f7afb18a0ae5d15bebe554a3e5b503','CH_PENA','dum-e','dum-e','2015-05-17','00:53:35','2015-05-17','00:54:06'),('d7f902505cbbdff3e23cecf3aae9091bea90518a','CH_PENA','dum-e','dum-e','2015-05-16','21:34:12','2015-05-16','21:34:16'),('d8564665df437450dade65258862708861cfb020','CH_PENA','dum-e','dum-e','2015-05-14','00:41:45',NULL,NULL),('d8a6eb1e937f1a696396fdf3ec6e7278e8648474','CH_PENA','dum-e','dum-e','2015-05-17','16:58:15','2015-05-17','17:04:18'),('d8d0e5d2caa72c2851476296d2f7e3f6927165ed','CH_PENA','dum-e','dum-e','2015-05-12','22:58:55',NULL,NULL),('d94b4b24ebf3ad1b0b18cd7576aa5fd032496c86','CH_PENA','dum-e','dum-e','2015-05-14','01:05:15',NULL,NULL),('d97c81c973fd93933921370c12fe0406d3aed93c','CH_PENA','dum-e','dum-e','2015-05-17','01:35:43',NULL,NULL),('da20272ee391d0fdcc4cf3f8253ae2f8154726bf','CH_PENA','dum-e','dum-e','2015-05-17','12:05:07',NULL,NULL),('da611ee4f34f9ce5a5cb3c5622dae90f797bf42a','CH_PENA','dum-e','dum-e','2015-05-17','15:26:48','2015-05-17','15:27:49'),('da636bb93305f5d297ddef85e97711b17087e055','CH_PENA','dum-e','dum-e','2015-05-17','12:08:38','2015-05-17','12:08:51'),('da9a88675ec62e496862f55a0b8e52710843811b','CH_PENA','dum-e','dum-e','2015-02-19','14:50:32','2015-02-19','14:50:51'),('daa8298872654eddf5c365daf783ec85d6fbc52a','CH_PENA','dum-e','dum-e','2015-02-19','15:55:34','2015-02-19','15:55:37'),('daf60d0c3ce9a5642a4b8630f010b4292342fc54','CH_PENA','dum-e','dum-e','2015-05-13','00:21:14',NULL,NULL),('dbb43c9dfe4a6e760d7365a84170c472583dec4c','CH_PENA','dum-e','dum-e','2015-05-17','16:52:57','2015-05-17','16:53:36'),('dd5055e86d47d48d794f829632fa5b8c097d4789','CH_PENA','dum-e','dum-e','2015-05-17','15:58:13','2015-05-17','16:03:34'),('dd601fac21185c55c7384e3e598ff6f89622131a','CH_PENA','dum-e','dum-e','2015-02-21','10:26:35','2015-02-21','10:27:36'),('df1b3f4761b30d8fb9dadb6323df6e61fb98865f','CH_PENA','dum-e','dum-e','2015-05-18','00:13:13','2015-05-18','00:17:48'),('df26bb9765fe6b9fba61e2bd606991e18c630a9a','CH_PENA','dum-e','dum-e','2015-05-17','12:52:38','2015-05-17','12:54:00'),('df45545dd8f7d43350469252430c8b626cb4c972','CH_PENA','dum-e','dum-e','2015-02-19','13:40:35','2015-02-19','13:40:55'),('e0502818970eea34aa8bdff3e46a92f30d6aa704','CH_PENA','dum-e','dum-e','2015-05-16','22:46:23','2015-05-16','22:46:36'),('e0d86a04786d7279e8a967ec8d68bb8ae6d7fc6b','CH_PENA','dum-e','dum-e','2015-05-12','23:05:04',NULL,NULL),('e162bd8cd541c5b6ba9cc3b34c76fc6af139393b','CH_PENA','dum-e','dum-e','2015-05-13','23:27:22',NULL,NULL),('e19dbece82a38849f4a0ec428ca1293a45f228ef','CH_PENA','dum-e','dum-e','2015-05-13','23:08:15',NULL,NULL),('e1f433de340ba6667397f7b737da7886705c24f2','CH_PENA','dum-e','dum-e','2015-05-14','00:18:30',NULL,NULL),('e297a2b58b2eade55ec4b516d6ca432c8af9fea0','CH_PENA','dum-e','dum-e','2015-02-19','15:43:10','2015-02-19','15:43:22'),('e2b223cadb34b853b298d7e0fb41db78deefb9c7','CH_PENA','dum-e','dum-e','2015-05-17','15:46:55','2015-05-17','15:47:10'),('e2b7762dbeeb2ad5960f7a2b8031521ec71828ae','CH_PENA','dum-e','dum-e','2015-05-16','20:46:29',NULL,NULL),('e328132664e6ac43002d6512d5d7da0129b4f008','CH_PENA','dum-e','dum-e','2015-03-14','22:15:26',NULL,NULL),('e4bd644eaebeb2430f72d7ec74c15efcf062cae9','CH_PENA','dum-e','dum-e','2015-02-19','21:35:04','2015-02-19','21:36:49'),('e4c597228cae9bc001b252868895e938bb738a30','CH_PENA','dum-e','dum-e','2015-03-14','21:48:51',NULL,NULL),('e53eab645602f4a0d0ceae9da1a0a903db816fb4','CH_PENA','dum-e','dum-e','2015-02-19','15:47:59','2015-02-19','15:48:02'),('e56a640598bc1204ce263f5d93598854f6815dd4','CH_PENA','dum-e','dum-e','2015-03-14','21:43:01',NULL,NULL),('e5d06af310447f8d02faf35eb77efd553390f4bb','CH_PENA','dum-e','dum-e','2015-02-19','21:56:22','2015-02-19','22:14:55'),('e63efcb19c295aee5c4af6a239ed1bf0ee037dc4','CH_PENA','dum-e','dum-e','2015-05-14','00:46:44',NULL,NULL),('e659c04b1c5f89733ec23bb04578b782e3638581','CH_PENA','dum-e','dum-e','2015-05-14','00:32:16',NULL,NULL),('e730b5d3bfd061160a5e1fddf47a9ce6fa39310c','CH_PENA','dum-e','dum-e','2015-05-16','23:16:58',NULL,NULL),('e73873f72e3f0a2319d57336c2651f4d1b8e3193','CH_PENA','dum-e','dum-e','2015-03-14','22:44:20',NULL,NULL),('e74813638088614eabdd023aded99c803003ab6f','CH_PENA','dum-e','dum-e','2015-02-19','15:47:19','2015-02-19','15:47:24'),('e7951f764e95083ab462cf71fe9acf8279bd3cfe','CH_PENA','dum-e','dum-e','2015-05-12','23:07:24',NULL,NULL),('e8f18ec916150709b653142cfbd6b1379bc0c864','CH_PENA','dum-e','dum-e','2015-05-14','00:59:27',NULL,NULL),('ea261d098ad070d6215e05c87a6a1a4b51a58e38','CH_PENA','dum-e','dum-e','2015-05-15','23:03:40',NULL,NULL),('eaacabd5d4af0111b7fa9b436fef20b8407beef1','CH_PENA','dum-e','dum-e','2015-05-16','22:36:52',NULL,NULL),('eaedcc9ff388694def7fb02345931850cd753938','CH_PENA','dum-e','dum-e','2015-05-16','21:35:19',NULL,NULL),('eb55a28e805d1d46df2fe13523f37cb95bafa115','CH_PENA','dum-e','dum-e','2015-02-19','01:01:45',NULL,NULL),('ebeccd32f489d6fcd85a8615a9cbada0f71c1f8a','CH_PENA','dum-e','dum-e','2015-05-13','00:10:49',NULL,NULL),('ec204e3fe3b7e26d09a4c76e7ec86a234bbf4572','CH_PENA','dum-e','dum-e','2015-05-17','17:59:25','2015-05-17','18:01:57'),('ec6ba737aabeb459e96a2b2d13a2434af80a2f43','CH_PENA','dum-e','dum-e','2015-05-15','22:42:17',NULL,NULL),('ecea4db00d7272e5b34e4a43880e63288d520ecd','CH_PENA','dum-e','dum-e','2015-05-15','22:12:34',NULL,NULL),('ed315a661459590f3df8716a560a7f903c2bb8b2','CH_PENA','dum-e','dum-e','2015-02-19','15:52:04','2015-02-19','15:52:07'),('ed485a966be6b48e9a72e4ae49a716bfd166f88a','CH_PENA','dum-e','dum-e','2015-02-19','14:03:59','2015-02-19','14:04:55'),('ed885a3791225baa98bae70a83c897ec7b8d2176','CH_PENA','dum-e','dum-e','2015-03-14','21:47:02',NULL,NULL),('ed89936d8834422a6e73f3072e32d92bbe19179a','CH_PENA','dum-e','dum-e','2015-03-14','21:53:40',NULL,NULL),('eda2954e89d94404f2acd963d097cba23636b776','CH_PENA','dum-e','dum-e','2015-03-14','22:21:29',NULL,NULL),('edaf9ac0b368375506eb6793d627a0b16dda1046','CH_PENA','dum-e','dum-e','2015-05-17','15:47:35','2015-05-17','15:48:28'),('ee28c9b25341a0cdf973003934ea7c18e54bde34','CH_PENA','dum-e','dum-e','2015-05-15','23:47:36',NULL,NULL),('ee43a0f9cbe41358b6bfdd76c1ec770c799c2496','CH_PENA','dum-e','dum-e','2015-05-17','13:46:50','2015-05-17','13:46:56'),('eebcdb754f1bd95886b418da9936f94df94ed6f8','CH_PENA','dum-e','dum-e','2015-05-16','22:08:37','2015-05-16','22:09:06'),('eed24c5392ebdda64062f1d6b29e83ea7268af43','CH_PENA','dum-e','dum-e','2015-05-17','18:25:07','2015-05-17','18:50:52'),('ef2df607d145d1a6c6fd76e33208eb14b2386b54','CH_PENA','dum-e','dum-e','2015-03-14','22:11:59',NULL,NULL),('ef4816711c23d086b8da8cf543ec2937a8ee27d4','CH_PENA','dum-e','dum-e','2015-05-15','22:52:08',NULL,NULL),('f011d9463b2b28d1fb34e6eadce8a2b00648dbb1','CH_PENA','dum-e','dum-e','2015-05-13','21:18:43',NULL,NULL),('f0859b654a5194ae1c012b28dbb906463181e254','CH_PENA','dum-e','dum-e','2015-05-15','22:47:48',NULL,NULL),('f12058cc56c00ebf3bd243b6afb4bd80262f615a','CH_PENA','dum-e','dum-e','2015-05-16','22:33:57',NULL,NULL),('f169d287f43e3f657e884858c4fda12f71b379b0','CH_PENA','dum-e','dum-e','2015-05-17','15:40:37','2015-05-17','15:41:35'),('f2f8e60d834831cbb2d692d08329b40cbb949434','CH_PENA','dum-e','dum-e','2015-05-17','11:45:40','2015-05-17','11:46:02'),('f3396e8795aaa764258580bd57fd1df21a613e57','CH_PENA','dum-e','dum-e','2015-05-12','22:55:27',NULL,NULL),('f391c9ac632de08add0938b0f3fc8f8605e66c90','CH_PENA','dum-e','dum-e','2015-04-11','23:01:38',NULL,NULL),('f3d376842ad2bf0ce73767ae74c71c9abb13f2a2','CH_PENA','dum-e','dum-e','2015-05-13','23:08:02',NULL,NULL),('f4b03785fa295e11517e9b6bda14b9c53c480728','CH_PENA','dum-e','dum-e','2015-05-17','12:06:03','2015-05-17','12:06:15'),('f4caddd489537ca5fe1170c00d1862cc9d6b5d03','CH_PENA','dum-e','dum-e','2015-05-13','23:52:55',NULL,NULL),('f783058e8f1d8a864fae77389395d784be057297','CH_PENA','dum-e','dum-e','2015-05-12','22:57:05',NULL,NULL),('f7e9fbc1c381853079c952617fb88d1acbf36859','CH_PENA','dum-e','dum-e','2015-02-19','15:41:16','2015-02-19','15:43:02'),('f81821f309153a155033c4539964157cb3a89a2d','CH_PENA','dum-e','dum-e','2015-05-12','00:31:04',NULL,NULL),('f8ee0cd1abcb61775253beb38557905d4a05ba35','CH_PENA','dum-e','dum-e','2015-05-17','14:51:06','2015-05-17','14:51:22'),('f9162901639bfcf937e0db00c9e0dbb699d4a1cb','CH_PENA','dum-e','dum-e','2015-05-13','22:35:59',NULL,NULL),('f93c4437a9afe64217f2f81471eade1e799db089','CH_PENA','dum-e','dum-e','2015-05-14','00:25:06',NULL,NULL),('fa19e69c87dda1b9c2db3c6544b445cf0d599fae','CH_PENA','dum-e','dum-e','2015-03-14','22:00:04',NULL,NULL),('fa57b2da771b4f428ea6ae0e07de1bcadc714b5d','CH_PENA','dum-e','dum-e','2015-05-16','19:48:40',NULL,NULL),('fc152289224b723601737845a3a21909d22781ff','CH_PENA','dum-e','dum-e','2015-03-14','21:46:42',NULL,NULL),('fca17b9249c2c0c2fbfd8d1db5bfd4a101246af5','CH_PENA','dum-e','dum-e','2015-05-17','15:49:50','2015-05-17','15:50:06'),('fcadc685d2a52f5627fccb20a523f97842d5c3cf','CH_PENA','dum-e','dum-e','2015-05-14','01:03:49',NULL,NULL),('fd360617528fc4bbdf3346600974e79cc5e5e705','CH_PENA','dum-e','dum-e','2015-05-17','16:14:02','2015-05-17','16:14:16'),('fe5218702e45d473b83bdfa58167121257c574a0','CH_PENA','dum-e','dum-e','2015-05-13','22:55:33',NULL,NULL),('ff00df599281480bb6ddd68064aff8f818733348','CH_PENA','dum-e','dum-e','2015-02-19','15:59:13','2015-02-19','15:59:22');
/*!40000 ALTER TABLE `SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TABLES`
--

DROP TABLE IF EXISTS `TABLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TABLES` (
  `ID_TABLE` int(11) NOT NULL AUTO_INCREMENT,
  `NAME_TABLE` varchar(30) NOT NULL,
  `ID_FLOOR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TABLE`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TABLES`
--

LOCK TABLES `TABLES` WRITE;
/*!40000 ALTER TABLE `TABLES` DISABLE KEYS */;
INSERT INTO `TABLES` VALUES (1,'Mesa 1',1),(2,'Mesa 2',1),(3,'Mesa 3',1),(4,'Mesa 4',1),(5,'Mesa 5',1),(6,'Mesa 6',1),(7,'Mesa 7',1),(8,'Mesa 8',1),(9,'Mesa 9',1),(10,'Mesa 10',1),(11,'Mesa 11',2),(12,'Mesa 12',2),(13,'Mesa 13',2),(14,'Mesa 14',2),(15,'Mesa 15',2),(16,'Mesa 16',2),(17,'Mesa 17',2),(18,'Mesa 18',2),(19,'Mesa 19',2),(20,'Mesa 20',2),(21,'Mesa 21',3),(22,'Mesa 22',3),(23,'Mesa 23',3),(24,'Mesa 24',3),(25,'Mesa 25',3),(26,'Mesa 26',3),(27,'Mesa 27',3),(28,'Mesa 28',3),(29,'Mesa 29',3),(30,'Mesa 30',3);
/*!40000 ALTER TABLE `TABLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET_H`
--

DROP TABLE IF EXISTS `TICKET_H`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TICKET_H` (
  `TICKET_NUMBER` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_REF` int(11) DEFAULT NULL,
  `STATUS_TICKET` varchar(15) DEFAULT 'Disponible',
  `TOTAL` int(11) DEFAULT NULL,
  PRIMARY KEY (`TICKET_NUMBER`),
  KEY `TABLE_REF` (`TABLE_REF`),
  CONSTRAINT `TICKET_H_ibfk_1` FOREIGN KEY (`TABLE_REF`) REFERENCES `TABLES` (`ID_TABLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET_H`
--

LOCK TABLES `TICKET_H` WRITE;
/*!40000 ALTER TABLE `TICKET_H` DISABLE KEYS */;
/*!40000 ALTER TABLE `TICKET_H` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET_P`
--

DROP TABLE IF EXISTS `TICKET_P`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TICKET_P` (
  `TICKET_NUMBER` int(11) NOT NULL,
  `ID_PRODUCT` int(11) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `SUBTOTAL` int(11) DEFAULT NULL,
  KEY `ID_PRODUCT` (`ID_PRODUCT`),
  CONSTRAINT `TICKET_P_ibfk_1` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `PRODUCTS` (`ID_PRODUCT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET_P`
--

LOCK TABLES `TICKET_P` WRITE;
/*!40000 ALTER TABLE `TICKET_P` DISABLE KEYS */;
/*!40000 ALTER TABLE `TICKET_P` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TOOLBAR`
--

DROP TABLE IF EXISTS `TOOLBAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TOOLBAR` (
  `ID_TOOLBAR` int(11) NOT NULL AUTO_INCREMENT,
  `ID_APPLICATION` int(11) NOT NULL,
  PRIMARY KEY (`ID_TOOLBAR`),
  KEY `fk_TOOLBAR_APPLICATIONS1_idx` (`ID_APPLICATION`),
  CONSTRAINT `fk_TOOLBAR_APPLICATIONS1` FOREIGN KEY (`ID_APPLICATION`) REFERENCES `APPLICATIONS` (`ID_APPLICATION`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TOOLBAR`
--

LOCK TABLES `TOOLBAR` WRITE;
/*!40000 ALTER TABLE `TOOLBAR` DISABLE KEYS */;
INSERT INTO `TOOLBAR` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `TOOLBAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `USERNAME` varchar(15) NOT NULL,
  `ID_EMPLOYEE` int(11) NOT NULL,
  `NAME` varchar(15) NOT NULL,
  `NAME2` varchar(15) DEFAULT NULL,
  `LASTNAME` varchar(15) NOT NULL,
  `LASTNAME2` varchar(15) DEFAULT NULL,
  `SHORT_NAME` varchar(45) DEFAULT NULL,
  `ENABLE` int(11) NOT NULL COMMENT '1 = Habilitado\n2 = Deshabilitado',
  `DT_LAST_CONNECTION` date DEFAULT NULL COMMENT 'Fecha √∫ltima conexi√≥n',
  `TM_LAST_CONNECTION` time DEFAULT NULL COMMENT 'Hora √∫ltima conexi√≥n',
  `ID_PROFILE` int(11) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`),
  KEY `fk_USERS_EMPLOYEES1_idx` (`ID_EMPLOYEE`),
  KEY `ID_PROFILE` (`ID_PROFILE`),
  CONSTRAINT `fk_USERS_EMPLOYEES1` FOREIGN KEY (`ID_EMPLOYEE`) REFERENCES `EMPLOYEES` (`ID_EMPLOYEE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `USERS_ibfk_1` FOREIGN KEY (`ID_PROFILE`) REFERENCES `PROFILES` (`ID_PROFILE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES ('CH_PENA',1,'CHRISTIAN','LUIS ANTONIO','PE√ëA','FARIAS','CHRISTIAN PE√ëA',1,'2015-01-04','13:13:13',1);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'CuliNet_Test'
--

--
-- Dumping routines for database 'CuliNet_Test'
--
/*!50003 DROP FUNCTION IF EXISTS `CHECK_LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CHECK_LOGIN`(P_USERNAME CHAR(15), P_PASSWORD CHAR(45)) RETURNS int(11)
BEGIN

DECLARE LV_USERNAME CHAR(15);
DECLARE LV_PASSWORD CHAR(45);

DECLARE LV_RESULT INTEGER;

SELECT CHECK_USER(P_USERNAME)
  INTO LV_RESULT;
  
IF LV_RESULT = 0 THEN

	SELECT CHECK_PASSWORD(P_USERNAME)
      INTO LV_RESULT;
      
    IF LV_RESULT = 0 THEN
	
		SELECT PASSWORD
		  FROM PASSWORDS      
		 WHERE USERNAME = P_USERNAME
		  INTO LV_PASSWORD;
		 
		IF PASSWORD(P_PASSWORD) = LV_PASSWORD THEN     
			SET LV_RESULT = 0;        
		ELSE     
			SET LV_RESULT = 3;    
		END IF;
        
	ELSEIF LV_RESULT = 2 THEN
    
		SELECT PASSWORD
		  FROM PASSWORDS      
		 WHERE USERNAME = P_USERNAME
		  INTO LV_PASSWORD;
          
		IF P_PASSWORD = LV_PASSWORD THEN     
			SET LV_RESULT = 2;        
		ELSE     
			SET LV_RESULT = 5;    
		END IF;
    
    END IF;
     
END IF;

-- LV_RESULTS
-- 0 CORRECT
-- 1 USER_LOCK
-- 2 TEMP_PASSWORD
-- 3 PASSWORD_EXPIRATED
-- 4 USER_NOT_FOUND
-- 5 PASSWORD_INCORRECT

RETURN LV_RESULT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CHECK_PASSWORD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CHECK_PASSWORD`(P_USERNAME CHAR(15)) RETURNS int(11)
BEGIN
-- LOCAL VARIABLES
DECLARE LV_RESULT INTEGER;
DECLARE LV_EXPIRATION DATE;
DECLARE LV_TEMP INTEGER;
DECLARE LV_DIFF INTEGER;

SET LV_RESULT = 5;

SELECT TEMP
  FROM PASSWORDS
 WHERE USERNAME = P_USERNAME
  INTO LV_TEMP;

-- SI EL PASSWORD ES TEMPORAL  
IF LV_TEMP = 1 THEN 

	SET LV_RESULT = 2;

-- SI EL PASSWORD NO ES TEMPORAL    
ELSEIF LV_TEMP = 0 THEN 
	
    SELECT EXPIRATION
	  FROM PASSWORDS
	 WHERE USERNAME = P_USERNAME
      INTO LV_EXPIRATION;	
      
	SELECT DATEDIFF(LV_EXPIRATION,CURDATE())
      INTO LV_DIFF;
      
	IF LV_DIFF <= 0 THEN 
		
        SET LV_RESULT = 3;
        
	ELSEIF LV_DIFF THEN
    
		SET LV_RESULT = 0;
        
	END IF;
    
END IF;

RETURN LV_RESULT;

-- 0 CORRECTO
-- 2 PASSWORD TEMPORAL
-- 3 PASSWORD EXIPRADO
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CHECK_USER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CHECK_USER`(P_USERNAME CHAR(15)) RETURNS int(11)
BEGIN

	DECLARE LV_USERNAME CHAR(15);
    DECLARE LV_RESULT INTEGER;
    DECLARE LV_ENABLE INTEGER;
	
    SELECT USERNAME
	  FROM USERS      
	 WHERE USERNAME = P_USERNAME
      INTO LV_USERNAME;
	
    -- SI EL USUARIO EXISTE
    IF LV_USERNAME IS NOT NULL THEN
		
        SELECT ENABLE
		  FROM USERS
		 WHERE USERNAME = P_USERNAME
          INTO LV_ENABLE;
        
        -- SI EL USUARIO ESTA HABILITADO
		IF LV_ENABLE = 1 THEN
        
			SET LV_RESULT = 0;
            
		ELSE
        
			SET LV_RESULT = 1;	    
        
        END IF;
        
	ELSE 
		SET LV_RESULT = 4;
	END IF;
		
RETURN LV_RESULT;

-- 0 CORRECTO
-- 1 USUARIO NO HABILITADO
-- 4 USUARIO NO EXISTE
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CHANGE_PASSWORD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CHANGE_PASSWORD`(IN  I_USERNAME CHAR(15), 
									 I_PASSWD1 CHAR(45),
                                     I_PASSWD2 CHAR(45),
								 OUT O_RESULT INTEGER)
BEGIN

	DECLARE LV_PASSWORD CHAR(45);
    DECLARE LV_CURDATE  DATE;
    DECLARE LV_EXPIRATION DATE;
    

	IF I_PASSWD1 = I_PASSWD2 THEN
    
		SELECT PASSWORD
		  FROM PASSWORDS
		 WHERE USERNAME = I_USERNAME
          INTO LV_PASSWORD;
          
	    SELECT CURDATE() INTO LV_CURDATE;
        
        SELECT ADDDATE(LV_CURDATE,90) INTO LV_EXPIRATION;
    
		UPDATE PASSWORDS 
           SET PASSWORD     = PASSWORD(I_PASSWD1), 
               TEMP         = 0,
			   OLD_PASSWORD = LV_PASSWORD,
		       ACTIVATION	= LV_CURDATE,
               EXPIRATION   = LV_EXPIRATION,
               VALID_DAYS   = 90
		 WHERE USERNAME     = I_USERNAME;      
           
		SET O_RESULT = 0;
        
	ELSE
    
		SET O_RESULT = 1;
    
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CLOSE_SESSION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CLOSE_SESSION`(IN  I_ID_SESSION CHAR(200),
 OUT O_RETURN BOOLEAN)
BEGIN

	DECLARE LV_DT_END_CONNECTION DATE;
    DECLARE LV_TM_END_CONNECTION TIME;
    
    SET LV_DT_END_CONNECTION = CURDATE();
    SET LV_TM_END_CONNECTION = CURTIME();
    
    UPDATE SESSION SET DT_END_CONNECTION = LV_DT_END_CONNECTION,
					   TM_END_CONNECTION = LV_TM_END_CONNECTION
			     WHERE ID_SESSION        = I_ID_SESSION;
                 
	SET O_RETURN = TRUE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CREATE_SESSION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_SESSION`(
 IN I_USERNAME CHAR(15),
 IN I_HOSTNAME CHAR(15),
OUT O_DT_CONNECTION DATE,
OUT	O_TM_CONNECTION TIME,
OUT O_ID_SESSION CHAR(40),
OUT O_SERVERNAME CHAR(15))
BEGIN
	DECLARE LV_ID_SESSION CHAR(40);
    DECLARE LV_DT_CONNECTION DATE;
    DECLARE LV_TM_CONNECTION TIME;
    DECLARE LV_SERVERNAME CHAR(15);
    
    -- OBTIENE FECHA Y HORA ACTUAL
    SET LV_DT_CONNECTION = CURDATE();    
    SET LV_TM_CONNECTION = CURTIME();    
    
    -- ASIGNA FECHA Y HORA ACTUAL
    SET O_DT_CONNECTION = LV_DT_CONNECTION;
    SET O_TM_CONNECTION = LV_TM_CONNECTION;
    
	-- OBTIENE SERVERNAME
    SELECT VARIABLE_VALUE 
      INTO LV_SERVERNAME
      FROM INFORMATION_SCHEMA.GLOBAL_VARIABLES
     WHERE VARIABLE_NAME = 'hostname';
     	
    SET O_SERVERNAME = LV_SERVERNAME;
    
    -- CREA ID_SESSION 
    SET LV_ID_SESSION = SHA1(CONCAT(I_USERNAME,I_HOSTNAME,LV_SERVERNAME,
							        O_DT_CONNECTION,O_TM_CONNECTION));
                                    
	SET O_ID_SESSION = LV_ID_SESSION;
	
    -- REGISTRA SESION EN LA TABLA SESSION
	INSERT INTO SESSION(ID_SESSION,
						USERNAME,
						HOSTNAME,
                        SERVERNAME,
                        DT_CONNECTION,
                        TM_CONNECTION)                        
				VALUES (O_ID_SESSION,
						I_USERNAME,
                        I_HOSTNAME,
                        O_SERVERNAME,
                        O_DT_CONNECTION,
                        O_TM_CONNECTION);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `VALIDATE_LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VALIDATE_LOGIN`(IN P_USERNAME CHAR(15), P_PASSWORD CHAR(45),
								   OUT E_RESULT INTEGER)
BEGIN

DECLARE LV_USERNAME CHAR(15);
DECLARE LV_PASSWORD CHAR(45);

-- VALIDAR QUE EL USUARIO EXISTA
SELECT CHECK_USER(P_USERNAME)
  INTO E_RESULT;

-- SI EL USUARIO EXISTE  
IF E_RESULT = 0 THEN

	-- CHEQUEAR PASSWORD
	SELECT CHECK_PASSWORD(P_USERNAME)
      INTO E_RESULT;
      
	-- SI EL PASSWORD ESTA VIGENTE
    IF E_RESULT = 0 THEN
	
		-- OBTENER EL PASSWORD 
		SELECT PASSWORD
		  FROM PASSWORDS      
		 WHERE USERNAME = P_USERNAME
		  INTO LV_PASSWORD;
          
		-- VALIDAR QUE CORRESPONDA AL INGRESADO
		IF PASSWORD(P_PASSWORD) = LV_PASSWORD THEN     
			-- PASSWORD CORRECTO
			SET E_RESULT = 0;        
		ELSE     
			-- PASSWORD INCORRECTO
			SET E_RESULT = 5;    
		END IF;
        
	-- SI EL PASSWORD ES TEMPORAL
	ELSEIF E_RESULT = 2 THEN
    
		-- OBTENER EL PASSWORD TEMPORAL
		SELECT PASSWORD
		  FROM PASSWORDS      
		 WHERE USERNAME = P_USERNAME
		  INTO LV_PASSWORD;
          
		-- SI EL PASSWORD INGRESADO ES CORRECTO
		IF PASSWORD(P_PASSWORD) = LV_PASSWORD THEN
			-- PASSWORD TEMPORAL
			SET E_RESULT = 2;        
		ELSE     
			-- PASSWORD INCORRECTO
			SET E_RESULT = 5;    
		END IF;
    
    END IF;
     
END IF;

-- LV_RESULTS
-- 0 CORRECT
-- 1 USER_LOCK
-- 2 TEMP_PASSWORD
-- 3 PASSWORD_EXPIRATED
-- 4 USER_NOT_FOUND
-- 5 PASSWORD_INCORRECT

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-18  0:19:24
