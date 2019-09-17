-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: SGD
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `Cargo`
--

DROP TABLE IF EXISTS `Cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cargo` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCargo` varchar(100) NOT NULL,
  `descricaoCargo` varchar(200) NOT NULL,
  `cargaHorariaCargo` int(11) NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cargo`
--

LOCK TABLES `Cargo` WRITE;
/*!40000 ALTER TABLE `Cargo` DISABLE KEYS */;
INSERT INTO `Cargo` VALUES (1,'Estagiário','Auxilia nas atividades do setor. Dispostos a aprender.',6),(2,'Ass. Op. III','Trabalham ativamente para a consecução do serviço à população.',6),(3,'Ass. Op. II','Trabalham ativamente para a consecução do serviço à população.',6),(4,'Ass. Op. I','Trabalham ativamente para a consecução do serviço à população.',6),(5,'Major','Coordena os servidores ativamente para a consecução do serviço à população.',9),(6,'Ten.-cel.','Coordena os servidores ativamente para a consecução do serviço à população.',9),(7,'Cel.','Trabalham ativamente para a consecução do serviço à população.',9);
/*!40000 ALTER TABLE `Cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipamento`
--

DROP TABLE IF EXISTS `Equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Equipamento` (
  `idEquipamento` int(11) NOT NULL AUTO_INCREMENT,
  `nomeEquipamento` varchar(45) NOT NULL,
  `descricaoEquipamento` varchar(100) NOT NULL,
  PRIMARY KEY (`idEquipamento`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipamento`
--

LOCK TABLES `Equipamento` WRITE;
/*!40000 ALTER TABLE `Equipamento` DISABLE KEYS */;
INSERT INTO `Equipamento` VALUES (1,'Notebook-próprio','Informações com o proprietário.'),(2,'Gabinete','Computador de mesa DELL.'),(3,'Gabinete','Computador de mesa ASUS.'),(4,'Gabinete','Computador de mesa ITAUTEC.'),(5,'Gabinete','Computador de mesa GENÉRICO.'),(6,'Monitor','Marca: DELL, 18 polegadas.'),(7,'Monitor','Marca: DELL, 20 polegadas.'),(8,'Monitor','Marca: DELL, 22 polegadas.'),(9,'Monitor','Marca: ITAUTEC, 18 polegadas.'),(10,'Monitor','Marca: ITAUTEC, 20 polegadas.'),(11,'Monitor','Marca: ITAUTEC, 22 polegadas.'),(12,'Monitor','Marca: ASUS, 18 polegadas.'),(13,'Monitor','Marca: ASUS, 20 polegadas.'),(14,'Monitor','Marca: ASUS, 22 polegadas.'),(15,'Monitor','Marca: DELL, 18 polegadas.'),(16,'Monitor','Marca: DELL, 20 polegadas.'),(17,'Monitor','Marca: DELL, 22 polegadas.'),(18,'Notebook','Marca: DELL.'),(19,'Notebook','Marca: ASUS.'),(20,'Notebook','Marca: SANSUMG.'),(21,'Notebook','Marca: LENOVO.'),(22,'Notebook','ACER');
/*!40000 ALTER TABLE `Equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ideia`
--

DROP TABLE IF EXISTS `Ideia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ideia` (
  `idIdeia` int(11) NOT NULL AUTO_INCREMENT,
  `descricaoIdeia` varchar(300) NOT NULL,
  `dataCadastroIdeia` date NOT NULL,
  `Pessoa_idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`idIdeia`,`Pessoa_idPessoa`),
  KEY `fk_Ideia_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Ideia_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `Pessoa` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ideia`
--

LOCK TABLES `Ideia` WRITE;
/*!40000 ALTER TABLE `Ideia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ideia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pessoa` (
  `cpfPessoa` varchar(11) NOT NULL,
  `nomeCompletoPessoa` varchar(200) NOT NULL,
  `dataNascimentoPessoa` date NOT NULL,
  `sexoPessoa` char(1) NOT NULL,
  `idPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `Cargo_idCargo` int(11) NOT NULL,
  PRIMARY KEY (`idPessoa`,`Cargo_idCargo`),
  UNIQUE KEY `cpfPessoa_UNIQUE` (`cpfPessoa`),
  KEY `fk_Pessoa_Cargo1_idx` (`Cargo_idCargo`),
  CONSTRAINT `fk_Pessoa_Cargo1` FOREIGN KEY (`Cargo_idCargo`) REFERENCES `Cargo` (`idCargo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa_has_Equipamento`
--

DROP TABLE IF EXISTS `Pessoa_has_Equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pessoa_has_Equipamento` (
  `Pessoa_idPessoa` int(11) NOT NULL,
  `Equipamento_idEquipamento` int(11) NOT NULL,
  PRIMARY KEY (`Pessoa_idPessoa`,`Equipamento_idEquipamento`),
  KEY `fk_Pessoa_has_Equipamento_Equipamento1_idx` (`Equipamento_idEquipamento`),
  KEY `fk_Pessoa_has_Equipamento_Pessoa_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Pessoa_has_Equipamento_Equipamento1` FOREIGN KEY (`Equipamento_idEquipamento`) REFERENCES `Equipamento` (`idEquipamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_has_Equipamento_Pessoa` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `Pessoa` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa_has_Equipamento`
--

LOCK TABLES `Pessoa_has_Equipamento` WRITE;
/*!40000 ALTER TABLE `Pessoa_has_Equipamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pessoa_has_Equipamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-04 10:03:47
