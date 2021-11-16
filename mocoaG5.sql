-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: mocoaG5
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

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
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEmpresa` varchar(100) NOT NULL,
  `NIT` varchar(100) NOT NULL,
  `actividad` varchar(100) NOT NULL,
  `empleados` int(11) NOT NULL,
  `vacantes` int(11) NOT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'Ninguna','0','Desempleado',0,0),(2,'Presidencia','0','Gobierno',5,1),(3,'Alcaldia','0','Gobierno',10,1),(4,'Instituto Tecnologico del Putumayo','0','Educacion',50,5),(5,'ECSALUD','0','Educacion',25,0),(6,'Postobon','8005641238','Alimentos',15,5),(7,'Agropecuaria Putumayo','9005648795','Agraria',25,10),(9,'Restaurante el Loro Amarillo','90025648579','Alimentos',15,1),(10,'Panaderia la espiga de oro','9002564587','Alimentos',8,0);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social`
--

DROP TABLE IF EXISTS `social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social` (
  `idSocial` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPoblacion` varchar(100) NOT NULL,
  `conyugue` varchar(10) NOT NULL,
  `hijos` varchar(10) NOT NULL,
  `desplazado` varchar(10) NOT NULL,
  PRIMARY KEY (`idSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social`
--

LOCK TABLES `social` WRITE;
/*!40000 ALTER TABLE `social` DISABLE KEYS */;
INSERT INTO `social` VALUES (100,'Indigena','No','No','No'),(101,'Indigena','No','No','Si'),(102,'Indigena','No','Si','Si'),(103,'Indigena','Si','Si','Si'),(104,'Indigena','Si','Si','No'),(105,'Indigena','Si','No','No'),(106,'Indigena','Si','No','Si'),(107,'Indigena','No','Si','No'),(108,'Afrodescendiente','No','No','No'),(109,'Afrodescendiente','No','No','Si'),(110,'Afrodescendiente','No','Si','Si'),(111,'Afrodescendiente','Si','Si','Si'),(112,'Afrodescendiente','Si','Si','No'),(113,'Afrodescendiente','Si','No','No'),(114,'Afrodescendiente','Si','No','Si'),(115,'Afrodescendiente','No','Si','No'),(116,'Ninguna','No','No','No'),(117,'Ninguna','No','No','Si'),(118,'Ninguna','No','Si','Si'),(119,'Ninguna','Si','Si','Si'),(120,'Ninguna','Si','Si','No'),(121,'Ninguna','Si','No','No'),(122,'Ninguna','Si','No','Si'),(123,'Ninguna','No','Si','No');
/*!40000 ALTER TABLE `social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(100) CHARACTER SET latin2 NOT NULL,
  `tipoDocumento` varchar(100) CHARACTER SET latin2 NOT NULL,
  `documentoUsuario` varchar(100) CHARACTER SET latin2 NOT NULL,
  `tipoPerfil` varchar(100) CHARACTER SET latin2 NOT NULL,
  `edad` int(11) NOT NULL,
  `municipio` varchar(100) CHARACTER SET latin2 NOT NULL,
  `telefono` varchar(100) CHARACTER SET latin2 NOT NULL,
  `email` varchar(100) CHARACTER SET latin2 DEFAULT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idSocial` int(11) NOT NULL DEFAULT 116,
  `usuario` varchar(100) CHARACTER SET latin2 NOT NULL,
  `contrasenia` varchar(100) CHARACTER SET latin2 NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `usuarios_FK` (`idEmpresa`),
  KEY `usuarios_FK_1` (`idSocial`),
  CONSTRAINT `usuarios_FK` FOREIGN KEY (`idEmpresa`) REFERENCES `empresas` (`idEmpresa`),
  CONSTRAINT `usuarios_FK_1` FOREIGN KEY (`idSocial`) REFERENCES `social` (`idSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (100,'Alejando Jose Sanchez','CC','80564879','ADMINISTRADOR',33,'Mocoa','3105648975','administracion@social.gov.co',2,116,'Alejandro100','12345'),(101,'Martina Rodriguez','CC','53654789','ADMINISTRADOR',29,'Mocoa','3158964566','administracion2@social.gov.co',2,116,'Martina101','45678'),(102,'Diego Fernando Arce','CC','80564321','JAC',45,'Mocoa','316547896','jacmocoa@mocoa.gov.co',3,116,'Diego102','01020'),(103,'Lucia Martinez','CC','80245654','JAC',25,'San Luis','3156254789','jacmocoa@mocoa.gov.co',3,116,'Lucia103','perro45'),(104,'Pedro Juan  Ramirez','CC','80564859','JAC',35,'San Luis','3112546333','jacmocoa2@mocoa.gov.co',3,100,'Pedro104','gatico2015'),(106,'Nina Maria Lopez','CC','52145698','JAC',24,'Mocoa','3005689874','jacmocoa4@mocoa.gov.co',3,100,'Nina106','12456'),(107,'Francisco Jose Barbosa','CC','25654789','JAC',55,'Mocoa','3002568974','pacho4567@gmail.com',3,116,'Francisco107','12345'),(109,'Susana Horia Lopez','CC','56231456','USUARIO',24,'Mocoa','315654789','zanahoria@hotmail.com',1,101,'Susana109','zanahoria2008'),(110,'Roxanna Julieta Rodriguez','CC','80278965','USUARIO',33,'San Luis','3005648795','jily2005@gmail.com',1,116,'Roxanna110','roxannna2010'),(111,'Guadalupe Lucia Ferrer','CC','19564879','USUARIO',65,'Pueblo Viejo','3205648795','No tiene',1,117,'Guadalupe111','lupe2000'),(112,'Socorro Piramanrique','CC','53654789','USUARIO',45,'Mocoa','3002564178','No tiene',5,104,'Socorro112','help112');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mocoaG5'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15 19:49:48
