-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: alemarsport
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `IDAccount` varchar(45) NOT NULL,
  `NomeUtente` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `DataRegistrazione` date NOT NULL,
  `GiftCard` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDAccount`),
  UNIQUE KEY `IDAccount_UNIQUE` (`IDAccount`),
  UNIQUE KEY `NomeUtente_UNIQUE` (`NomeUtente`),
  UNIQUE KEY `Password_UNIQUE` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `CodiceCategoria` varchar(45) NOT NULL,
  `C_SottoCategoria` varchar(45) DEFAULT NULL,
  `Nome` varchar(45) NOT NULL,
  `Caratteristiche` varchar(45) NOT NULL,
  PRIMARY KEY (`CodiceCategoria`),
  UNIQUE KEY `CodiceCategoria_UNIQUE` (`CodiceCategoria`),
  UNIQUE KEY `C_SottoCategoria_UNIQUE` (`C_SottoCategoria`),
  CONSTRAINT `C_SottoCategoria` FOREIGN KEY (`C_SottoCategoria`) REFERENCES `sottocategoria` (`CodiceSottoCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('111',NULL,'Uomo','Articoli per Uomo'),('222',NULL,'Attrezzi','Attrezzi sportivi');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datispedizione`
--

DROP TABLE IF EXISTS `datispedizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datispedizione` (
  `IDSpedizione` varchar(45) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Cognome` varchar(45) NOT NULL,
  `CAP` varchar(5) NOT NULL,
  `Città` varchar(45) NOT NULL,
  `Provincia` varchar(45) NOT NULL,
  `Via` varchar(45) NOT NULL,
  `NumeroCivico` varchar(10) NOT NULL,
  `ID_Account` varchar(45) NOT NULL,
  PRIMARY KEY (`IDSpedizione`,`ID_Account`),
  UNIQUE KEY `IDSpedizione_UNIQUE` (`IDSpedizione`),
  UNIQUE KEY `ID_Account_UNIQUE` (`ID_Account`),
  CONSTRAINT `ID_Account2` FOREIGN KEY (`ID_Account`) REFERENCES `account` (`IDAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datispedizione`
--

LOCK TABLES `datispedizione` WRITE;
/*!40000 ALTER TABLE `datispedizione` DISABLE KEYS */;
/*!40000 ALTER TABLE `datispedizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metododipagamento`
--

DROP TABLE IF EXISTS `metododipagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metododipagamento` (
  `Codice` varchar(45) NOT NULL,
  `ID_Account` varchar(45) NOT NULL,
  `CVV` varchar(3) NOT NULL,
  `Intestatario` varchar(45) NOT NULL,
  `Scadenza` varchar(5) NOT NULL,
  PRIMARY KEY (`Codice`),
  UNIQUE KEY `Codice_UNIQUE` (`Codice`),
  UNIQUE KEY `ID_Account_UNIQUE` (`ID_Account`),
  CONSTRAINT `ID_Account` FOREIGN KEY (`ID_Account`) REFERENCES `account` (`IDAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metododipagamento`
--

LOCK TABLES `metododipagamento` WRITE;
/*!40000 ALTER TABLE `metododipagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `metododipagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `IDOrdine` varchar(45) NOT NULL,
  `ID_Account` varchar(45) NOT NULL,
  `DataSpedizione` date NOT NULL,
  `#Prodotti` int NOT NULL,
  `DescrizioneProdotti` varchar(45) NOT NULL,
  `StatoOrdine` varchar(45) NOT NULL,
  `DataConsegna` date NOT NULL,
  `DataOrdine` date NOT NULL,
  PRIMARY KEY (`IDOrdine`,`ID_Account`),
  UNIQUE KEY `IDOrdine_UNIQUE` (`IDOrdine`),
  UNIQUE KEY `ID_Account_UNIQUE` (`ID_Account`),
  CONSTRAINT `ID_Account3` FOREIGN KEY (`ID_Account`) REFERENCES `account` (`IDAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `IDPagamento` varchar(45) NOT NULL,
  `ID_Ordine` varchar(45) DEFAULT NULL,
  `PrezzoTotale` float NOT NULL,
  `DescrizioneFattura` varchar(45) NOT NULL,
  PRIMARY KEY (`IDPagamento`),
  UNIQUE KEY `IDPagamento_UNIQUE` (`IDPagamento`),
  UNIQUE KEY `ID_Ordine_UNIQUE` (`ID_Ordine`),
  CONSTRAINT `ID_Ordine` FOREIGN KEY (`ID_Ordine`) REFERENCES `ordine` (`IDOrdine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possiede`
--

DROP TABLE IF EXISTS `possiede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possiede` (
  `ID_Prodotto` varchar(45) NOT NULL,
  `T_Taglia` varchar(45) NOT NULL,
  `NumeroTaglie` int NOT NULL,
  PRIMARY KEY (`ID_Prodotto`,`T_Taglia`),
  UNIQUE KEY `ID_Prodotto_UNIQUE` (`ID_Prodotto`),
  UNIQUE KEY `T_Taglia_UNIQUE` (`T_Taglia`),
  CONSTRAINT `ID_Prodotto2` FOREIGN KEY (`ID_Prodotto`) REFERENCES `prodotto` (`IDProdotto`),
  CONSTRAINT `T_Taglia` FOREIGN KEY (`T_Taglia`) REFERENCES `taglia` (`TipoTaglia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possiede`
--

LOCK TABLES `possiede` WRITE;
/*!40000 ALTER TABLE `possiede` DISABLE KEYS */;
/*!40000 ALTER TABLE `possiede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `IDProdotto` varchar(45) NOT NULL,
  `C_CodiceCategoria` varchar(45) NOT NULL,
  `Sconto` int NOT NULL,
  `Disponibilità` int NOT NULL,
  `DescrizioneProdotto` varchar(45) NOT NULL,
  `PrezzoNoIVA` float NOT NULL,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`IDProdotto`,`C_CodiceCategoria`),
  UNIQUE KEY `IDProdotto_UNIQUE` (`IDProdotto`),
  KEY `C_Categoria` (`C_CodiceCategoria`),
  CONSTRAINT `C_Categoria` FOREIGN KEY (`C_CodiceCategoria`) REFERENCES `categoria` (`CodiceCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES ('1','111',10,10,'Scarpe',50,'Nike Air Force'),('2','222',30,100,'Corda ',10,'Coorda per saltare');
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sottocategoria`
--

DROP TABLE IF EXISTS `sottocategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sottocategoria` (
  `CodiceSottoCategoria` varchar(45) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Caratteristiche` varchar(45) NOT NULL,
  PRIMARY KEY (`CodiceSottoCategoria`),
  UNIQUE KEY `CodiceSottoCategoria_UNIQUE` (`CodiceSottoCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sottocategoria`
--

LOCK TABLES `sottocategoria` WRITE;
/*!40000 ALTER TABLE `sottocategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `sottocategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specifica`
--

DROP TABLE IF EXISTS `specifica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specifica` (
  `ID_Ordine` varchar(45) NOT NULL,
  `ID_Prodotto` varchar(45) NOT NULL,
  `IVA` varchar(11) NOT NULL,
  `NumProdotti` int NOT NULL,
  PRIMARY KEY (`ID_Ordine`,`ID_Prodotto`),
  UNIQUE KEY `ID_Ordine_UNIQUE` (`ID_Ordine`),
  UNIQUE KEY `ID_Prodotto_UNIQUE` (`ID_Prodotto`),
  UNIQUE KEY `IVA_UNIQUE` (`IVA`),
  CONSTRAINT `ID_Ordine2` FOREIGN KEY (`ID_Ordine`) REFERENCES `ordine` (`IDOrdine`),
  CONSTRAINT `ID_Prodotto` FOREIGN KEY (`ID_Prodotto`) REFERENCES `prodotto` (`IDProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specifica`
--

LOCK TABLES `specifica` WRITE;
/*!40000 ALTER TABLE `specifica` DISABLE KEYS */;
/*!40000 ALTER TABLE `specifica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taglia`
--

DROP TABLE IF EXISTS `taglia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taglia` (
  `TipoTaglia` varchar(45) NOT NULL,
  `Formato` varchar(3) NOT NULL,
  `Numero` int NOT NULL,
  PRIMARY KEY (`TipoTaglia`),
  UNIQUE KEY `Tipologia_UNIQUE` (`TipoTaglia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taglia`
--

LOCK TABLES `taglia` WRITE;
/*!40000 ALTER TABLE `taglia` DISABLE KEYS */;
/*!40000 ALTER TABLE `taglia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-07 12:28:39
