CREATE DATABASE  IF NOT EXISTS `heroku_a16e5753c5ce081` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `heroku_a16e5753c5ce081`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: us-cdbr-east-02.cleardb.com    Database: heroku_a16e5753c5ce081
-- ------------------------------------------------------
-- Server version	5.5.62-log

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
-- Table structure for table `anticipos`
--

DROP TABLE IF EXISTS `anticipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anticipos` (
  `idAnticipos` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` int(11) NOT NULL,
  `Empleado_Persona_idPersona` int(11) NOT NULL,
  `descripcion_anticipo` varchar(45) DEFAULT NULL,
  `fecha_anticipo` date DEFAULT NULL,
  `monto_anticipo` double DEFAULT NULL,
  `estado_anticipo` binary(1) DEFAULT NULL,
  PRIMARY KEY (`idAnticipos`,`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  KEY `fk_Anticipos_Empleado1_idx` (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  CONSTRAINT `fk_Anticipos_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`) REFERENCES `empleado` (`idEmpleado`, `Persona_idPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anticipos`
--

LOCK TABLES `anticipos` WRITE;
/*!40000 ALTER TABLE `anticipos` DISABLE KEYS */;
INSERT INTO `anticipos` VALUES (1,1,1,NULL,'2020-03-14',1334.87,'0'),(2,2,2,NULL,'2019-11-01',1983.97,'0'),(3,3,3,NULL,'2020-08-21',1359.6,'1'),(4,2,2,NULL,'2020-03-02',2665.02,'1'),(5,1,1,NULL,'2020-09-12',1946.37,'0');
/*!40000 ALTER TABLE `anticipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `idArea` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(45) NOT NULL,
  `Sucursal_idSucursal` int(11) NOT NULL,
  PRIMARY KEY (`idArea`),
  KEY `fk_Area_Sucursal1_idx` (`Sucursal_idSucursal`),
  CONSTRAINT `fk_Area_Sucursal1` FOREIGN KEY (`Sucursal_idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Parte principal',1),(2,'Minibodega',1),(3,'Llantera',2),(4,'Estanteria',2),(5,'Sala principal',3),(6,'Sotano',3);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bono`
--

DROP TABLE IF EXISTS `bono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bono` (
  `idBono` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha_bono` date DEFAULT NULL,
  `monto` double NOT NULL,
  PRIMARY KEY (`idBono`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bono`
--

LOCK TABLES `bono` WRITE;
/*!40000 ALTER TABLE `bono` DISABLE KEYS */;
INSERT INTO `bono` VALUES (1,'Comisiones','2019-12-10',2356.34),(2,'Aguinaldo','2019-10-18',5125.74),(3,'Catorceavo','2020-02-18',5802.12),(11,'Aguinaldo','2020-11-30',4000),(21,'Aguinaldo','2020-11-15',3500),(31,'Aguinaldo','2020-11-25',1850.66),(41,'Aguinaldo','2020-11-17',0),(51,'Aguinaldo','2020-11-25',1500),(61,'Comisiones','2021-01-31',5000),(71,'Comisiones','2021-01-31',2500),(81,'asd','2020-11-11',5),(91,'Aguinaldo','2020-11-23',1500),(101,'aguinaldo','2020-12-04',5000),(111,'Aguinaldo','2020-12-07',14000),(121,'Aguinaldo','2020-12-10',15000),(131,'','2020-12-10',0),(141,'Comisiones','2020-12-07',3000),(151,'Aguinaldo','2020-12-16',500),(161,'Comisiones','2020-12-01',278.08),(171,'Aguinalso','2020-12-01',1000),(181,'Comisiones','2020-12-08',1500),(191,'Comisiones','2020-12-09',2300),(201,'aguinaldo','2020-12-08',1025),(211,'Bono de ventas','2020-12-14',2500);
/*!40000 ALTER TABLE `bono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_cargo` varchar(100) NOT NULL,
  `nombre_cargo` varchar(50) NOT NULL,
  `sueldo_base` double DEFAULT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Administrador de los procesos gerenciales','Gerente',12455.63),(2,'Encargado de la caja','Cajero',8120.94),(3,'Encargado de la caja','Cajero',8382.32),(4,'Encargado de lavar autos','Lavador de autos',8579.51),(5,'Encargado de lavar autos','Lavador de autos',9596.8),(6,'Especialista en mecanica basica','Mecanico automotriz',8932.6),(7,'Especialista en circuitos electricos','Electrico automotriz',9593.45),(8,'Especialista en mecanica basica','Mecanico automotriz',9336.16),(9,'Encargado de lavar autos','Lavador de autos',8822.66),(10,'Especialista en circuitos electricos','Electrico automotriz',9878.79),(11,'Administrador de Sistemas','Admin',10000);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo_x_empleado`
--

DROP TABLE IF EXISTS `cargo_x_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_x_empleado` (
  `Cargo_idCargo` int(11) NOT NULL,
  `Empleado_idEmpleado` int(11) NOT NULL,
  `Empleado_Persona_idPersona` int(11) NOT NULL,
  `fecha_nombramiento` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`Cargo_idCargo`,`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  KEY `fk_Cargo_has_Empleado_Empleado1_idx` (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  KEY `fk_Cargo_has_Empleado_Cargo1_idx` (`Cargo_idCargo`),
  CONSTRAINT `fk_Cargo_has_Empleado_Cargo1` FOREIGN KEY (`Cargo_idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Cargo_has_Empleado_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`) REFERENCES `empleado` (`idEmpleado`, `Persona_idPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_x_empleado`
--

LOCK TABLES `cargo_x_empleado` WRITE;
/*!40000 ALTER TABLE `cargo_x_empleado` DISABLE KEYS */;
INSERT INTO `cargo_x_empleado` VALUES (1,7,15,'2020-10-28',NULL),(2,2,2,'2020-09-07','2020-12-15'),(3,3,3,'2020-10-02',NULL),(3,5,5,'2020-05-29','2020-12-11'),(4,4,4,'2020-06-11',NULL),(7,1,1,'2019-12-04','2020-12-06'),(7,8,16,'2020-10-30',NULL),(11,6,11,'2020-05-29',NULL);
/*!40000 ALTER TABLE `cargo_x_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ciudad` varchar(100) NOT NULL,
  `Departamento_idDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`idCiudad`,`Departamento_idDepartamento`),
  KEY `fk_Ciudad_Departamento1_idx` (`Departamento_idDepartamento`),
  CONSTRAINT `fk_Ciudad_Departamento1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Choluteca',1),(2,'Tegucigalpa',2),(3,'La Ceiba',3),(4,'Comayagua',4),(5,'Santa Rosa de Copan',5),(6,'Catacamas',9),(7,'San Marcos de Colon',1),(8,'Ojojona',2),(9,'Tela',3),(10,'San Lorenzo',10);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Persona_idPersona` int(11) NOT NULL,
  `fechaRegistro` date NOT NULL,
  PRIMARY KEY (`idCliente`,`Persona_idPersona`),
  UNIQUE KEY `Persona_idPersona_UNIQUE` (`Persona_idPersona`),
  KEY `fk_Cliente_Persona_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Cliente_Persona` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,6,'2019-12-19'),(2,7,'2019-11-04'),(3,8,'2019-11-21'),(4,9,'2020-04-10');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compania`
--

DROP TABLE IF EXISTS `compania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compania` (
  `idCompania` int(11) NOT NULL AUTO_INCREMENT,
  `Telefono_idTelefono` int(11) NOT NULL,
  `Telefono_Persona_idPersona` int(11) NOT NULL,
  `nombre_compania` varchar(45) NOT NULL,
  PRIMARY KEY (`idCompania`,`Telefono_idTelefono`,`Telefono_Persona_idPersona`),
  KEY `fk_Compania_Telefono1_idx` (`Telefono_idTelefono`,`Telefono_Persona_idPersona`),
  CONSTRAINT `fk_Compania_Telefono1` FOREIGN KEY (`Telefono_idTelefono`, `Telefono_Persona_idPersona`) REFERENCES `telefono` (`idTelefono`, `Persona_idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compania`
--

LOCK TABLES `compania` WRITE;
/*!40000 ALTER TABLE `compania` DISABLE KEYS */;
INSERT INTO `compania` VALUES (1,1,1,'Kling-Kuhlman'),(1,3,3,'Kling-Kuhlman'),(1,4,4,'Kling-Kuhlman'),(1,6,6,'Kling-Kuhlman'),(1,8,8,'Kling-Kuhlman'),(2,2,2,'Rowe-Heathcote'),(2,5,5,'Rowe-Heathcote'),(2,7,7,'Rowe-Heathcote'),(2,9,9,'Rowe-Heathcote'),(2,10,10,'Rowe-Heathcote');
/*!40000 ALTER TABLE `compania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `nFactura` varchar(20) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `isv` float NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`idCompra`),
  UNIQUE KEY `nFactura_UNIQUE` (`nFactura`),
  KEY `compras_proveedor_idx` (`idProveedor`),
  CONSTRAINT `compras_proveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'066-066-01-00952239',1,'2020-12-01',14.34,109.95);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenedor`
--

DROP TABLE IF EXISTS `contenedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenedor` (
  `idContenedor` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_cont` varchar(45) NOT NULL,
  `TipoContenedor_idTipoContenedor` int(11) NOT NULL,
  PRIMARY KEY (`idContenedor`),
  KEY `fk_Contenedor_TipoContenedor1_idx` (`TipoContenedor_idTipoContenedor`),
  CONSTRAINT `fk_Contenedor_TipoContenedor1` FOREIGN KEY (`TipoContenedor_idTipoContenedor`) REFERENCES `tipocontenedor` (`idTipoContenedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenedor`
--

LOCK TABLES `contenedor` WRITE;
/*!40000 ALTER TABLE `contenedor` DISABLE KEYS */;
INSERT INTO `contenedor` VALUES (1,'Bodega Venecia',5),(2,'Bodega Carwash',1),(3,'Bodega Carwash',2),(4,'Oficina Carwash',1),(5,'Oficina Carwash',4);
/*!40000 ALTER TABLE `contenedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `idContrato` int(11) NOT NULL AUTO_INCREMENT,
  `fechainicio_contrato` date NOT NULL,
  `fechafin_contrato` date NOT NULL,
  `Empleado_idEmpleado` int(11) NOT NULL,
  `Empleado_Persona_idPersona` int(11) NOT NULL,
  `TipoContrato_idTipoContrato` int(11) NOT NULL,
  PRIMARY KEY (`idContrato`,`Empleado_idEmpleado`,`Empleado_Persona_idPersona`,`TipoContrato_idTipoContrato`),
  KEY `fk_Contrato_Empleado1_idx` (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  KEY `fk_Contrato_TipoContrato1_idx` (`TipoContrato_idTipoContrato`),
  CONSTRAINT `fk_Contrato_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`) REFERENCES `empleado` (`idEmpleado`, `Persona_idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrato_TipoContrato1` FOREIGN KEY (`TipoContrato_idTipoContrato`) REFERENCES `tipocontrato` (`idTipoContrato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,'2019-11-25','2025-02-28',1,1,1),(2,'2019-01-06','2022-12-11',2,2,2),(3,'2019-04-25','2020-11-22',3,3,3),(4,'2020-03-28','2025-04-09',4,4,1),(5,'2020-12-07','2021-02-23',5,5,3);
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correo`
--

DROP TABLE IF EXISTS `correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correo` (
  `idCorreo` int(11) NOT NULL AUTO_INCREMENT,
  `dir_correo` varchar(45) NOT NULL,
  `Persona_idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idCorreo`,`Persona_idPersona`),
  KEY `fk_Correo_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Correo_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correo`
--

LOCK TABLES `correo` WRITE;
/*!40000 ALTER TABLE `correo` DISABLE KEYS */;
INSERT INTO `correo` VALUES (1,'correo@prueba.hn',1),(2,'kcotilard1@desdev.cn',2),(3,'gwhodcoat2@google.cn',3),(4,'tcray3@gnu.org',4),(5,'nrides4@kickstarter.com',5),(6,'ioguillen@gmail.com',6),(7,'gafera@gmail.com',7),(8,'racaceres@gmail.com',8),(9,'wyguillen@gmail.com',9),(10,'sraggles9@symantec.com',10),(11,'lfbenitez15@gmail.com',11),(13,'fidel.garcia@unah.hn',16),(14,'jabenitez@gmail.com',15);
/*!40000 ALTER TABLE `correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deduccion`
--

DROP TABLE IF EXISTS `deduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deduccion` (
  `idDeduccion` int(11) NOT NULL AUTO_INCREMENT,
  `fechainicio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `TipoDeduccion_idTipoDeduccion` int(11) NOT NULL,
  PRIMARY KEY (`idDeduccion`,`TipoDeduccion_idTipoDeduccion`),
  KEY `fk_Deduccion_TipoDeduccion1_idx` (`TipoDeduccion_idTipoDeduccion`),
  CONSTRAINT `fk_Deduccion_TipoDeduccion1` FOREIGN KEY (`TipoDeduccion_idTipoDeduccion`) REFERENCES `tipodeduccion` (`idTipoDeduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deduccion`
--

LOCK TABLES `deduccion` WRITE;
/*!40000 ALTER TABLE `deduccion` DISABLE KEYS */;
INSERT INTO `deduccion` VALUES (1,'2020-04-23','2020-02-04',1918.15,1),(2,'2020-06-09','2019-11-03',1905.42,2),(3,'2019-11-03','2020-09-11',1366.9,3),(4,'2020-04-18','2020-08-11',1267.71,2),(5,'2020-05-03','2020-01-12',1393.14,3),(6,'2020-03-10','2019-10-19',2952.26,1),(7,'2020-06-28','2020-08-10',2249.08,1),(8,'2020-03-06','2020-02-01',2994.25,2),(9,'2020-08-20','2020-08-18',2398.44,3),(10,'2020-08-04','2019-10-16',2976.75,1),(11,'2020-11-14','2020-11-30',1500,2),(21,'2020-11-15','2020-11-30',835.85,1),(31,'2020-11-17','2020-11-18',500,2),(41,'2021-01-16','2021-01-31',5000,1),(51,'2020-12-02','2020-12-03',5000,1),(61,'2020-12-01','2020-12-31',6500,1),(71,'2020-12-08','2020-12-30',3000,1),(81,'2020-12-09','2020-12-08',55,2),(91,'2020-12-08','2020-12-30',400,1),(181,'2020-12-14','2020-12-21',2500,3);
/*!40000 ALTER TABLE `deduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nom_departamento` varchar(100) NOT NULL,
  `Pais_idPais` int(11) NOT NULL,
  PRIMARY KEY (`idDepartamento`,`Pais_idPais`),
  KEY `fk_Departamento_Pais1_idx` (`Pais_idPais`),
  CONSTRAINT `fk_Departamento_Pais1` FOREIGN KEY (`Pais_idPais`) REFERENCES `pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Choluteca',1),(2,'Francisco Morazan',1),(3,'Atlantida',1),(4,'Comayagua',1),(5,'Copan',1),(6,'Cortes',1),(7,'Ocotepeque',1),(8,'Yoro',1),(9,'Olancho',1),(10,'Valle',1);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compra` (
  `idProducto` int(11) NOT NULL,
  `idfactura_compras` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `isv` float NOT NULL,
  `descuento` float NOT NULL,
  `total` float NOT NULL,
  KEY `detalleCompra_Producto_idx` (`idProducto`),
  KEY `FK_Detalle_FacturaCompras` (`idfactura_compras`),
  CONSTRAINT `FK_Detalle_FacturaCompras` FOREIGN KEY (`idfactura_compras`) REFERENCES `factura_compras` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detalleCompra_Producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (5,1,18,15000,60,0,460);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `idProducto` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `ISV` float NOT NULL,
  `descuento` float NOT NULL,
  `total` float NOT NULL,
  KEY `fk_detalle_venta_producto_idx` (`idProducto`),
  KEY `fk_detalle_venta_factura_venta_idx` (`idFactura`),
  CONSTRAINT `fk_detalle_venta_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_factura_venta` FOREIGN KEY (`idFactura`) REFERENCES `factura_ventas` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `Persona_idPersona` int(11) NOT NULL,
  `sueldo_emp` double NOT NULL,
  `estado_empleo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`,`Persona_idPersona`),
  KEY `fk_Empleado_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Empleado_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,8808.11,'E'),(2,2,10824.54,'D'),(3,3,14490.49,'E'),(4,4,11409.77,'E'),(5,5,15722.92,'D'),(6,11,10000,'E'),(7,15,12455.6298828125,'E'),(8,16,10000,'E');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_x_bono`
--

DROP TABLE IF EXISTS `empleado_x_bono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado_x_bono` (
  `Empleado_idEmpleado` int(11) NOT NULL,
  `Empleado_Persona_idPersona` int(11) NOT NULL,
  `Bono_idBono` int(11) NOT NULL,
  `estado_bono` binary(1) DEFAULT NULL,
  `Planilla_idPlanilla` int(11) DEFAULT NULL,
  PRIMARY KEY (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`,`Bono_idBono`),
  KEY `fk_Empleado_has_Bono_Bono1_idx` (`Bono_idBono`),
  KEY `fk_Empleado_has_Bono_Empleado1_idx` (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  KEY `fk_Empleado_has_Bono_Planilla1_idx` (`Planilla_idPlanilla`),
  CONSTRAINT `fk_Empleado_has_Bono_Bono1` FOREIGN KEY (`Bono_idBono`) REFERENCES `bono` (`idBono`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleado_has_Bono_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`) REFERENCES `empleado` (`idEmpleado`, `Persona_idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleado_has_Bono_Planilla1` FOREIGN KEY (`Planilla_idPlanilla`) REFERENCES `planilla` (`idPlanilla`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_x_bono`
--

LOCK TABLES `empleado_x_bono` WRITE;
/*!40000 ALTER TABLE `empleado_x_bono` DISABLE KEYS */;
INSERT INTO `empleado_x_bono` VALUES (1,1,1,'1',1),(1,1,31,'\0',21),(1,1,171,'\0',111),(2,2,2,'0',1),(2,2,71,'\0',41),(2,2,181,'\0',111),(3,3,3,'1',1),(3,3,11,'\0',21),(3,3,21,'\0',21),(4,4,1,'1',1),(4,4,191,'\0',111),(5,5,2,'1',2),(5,5,161,'\0',111),(6,11,51,'\0',31),(6,11,81,'\0',51),(6,11,121,'\0',101),(8,16,41,'\0',31),(8,16,61,'\0',41),(8,16,141,'\0',101),(8,16,151,'\0',101),(8,16,201,'\0',111),(8,16,211,'\0',111);
/*!40000 ALTER TABLE `empleado_x_bono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_x_deduccion`
--

DROP TABLE IF EXISTS `empleado_x_deduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado_x_deduccion` (
  `Empleado_idEmpleado` int(11) NOT NULL,
  `Empleado_Persona_idPersona` int(11) NOT NULL,
  `Deduccion_idDeduccion` int(11) NOT NULL,
  `fecha_emp_deduc` date NOT NULL,
  `estado_emp_deduc` binary(1) DEFAULT NULL,
  `Planilla_idPlanilla` int(11) DEFAULT NULL,
  PRIMARY KEY (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`,`Deduccion_idDeduccion`),
  KEY `fk_Empleado_has_Deduccion_Deduccion1_idx` (`Deduccion_idDeduccion`),
  KEY `fk_Empleado_has_Deduccion_Empleado1_idx` (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  KEY `fk_Empleado_x_Deduccion_Planilla1_idx` (`Planilla_idPlanilla`),
  CONSTRAINT `fk_Empleado_has_Deduccion_Deduccion1` FOREIGN KEY (`Deduccion_idDeduccion`) REFERENCES `deduccion` (`idDeduccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleado_has_Deduccion_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`) REFERENCES `empleado` (`idEmpleado`, `Persona_idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleado_x_Deduccion_Planilla1` FOREIGN KEY (`Planilla_idPlanilla`) REFERENCES `planilla` (`idPlanilla`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_x_deduccion`
--

LOCK TABLES `empleado_x_deduccion` WRITE;
/*!40000 ALTER TABLE `empleado_x_deduccion` DISABLE KEYS */;
INSERT INTO `empleado_x_deduccion` VALUES (1,1,1,'2020-09-08','0',1),(1,1,6,'2020-02-13','0',6),(1,1,21,'0000-00-00','\0',21),(1,1,91,'0000-00-00','\0',111),(2,2,2,'2020-02-28','0',2),(2,2,7,'2019-11-12','1',7),(3,3,3,'2020-08-06','0',3),(3,3,91,'0000-00-00','\0',111),(4,4,4,'2020-09-20','0',4),(4,4,8,'2019-10-15','1',8),(4,4,9,'2020-04-30','0',9),(4,4,31,'0000-00-00','\0',31),(5,5,5,'2020-04-08','0',5),(5,5,10,'2020-01-20','0',10),(5,5,71,'0000-00-00','\0',111),(6,11,61,'0000-00-00','\0',101),(6,11,181,'0000-00-00','\0',111),(7,15,81,'0000-00-00','\0',111),(8,16,21,'0000-00-00','\0',31),(8,16,41,'0000-00-00','\0',41),(8,16,51,'0000-00-00','\0',101);
/*!40000 ALTER TABLE `empleado_x_deduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_x_planilla`
--

DROP TABLE IF EXISTS `empleado_x_planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado_x_planilla` (
  `Empleado_idEmpleado` int(11) NOT NULL,
  `Empleado_Persona_idPersona` int(11) NOT NULL,
  `Planilla_idPlanilla` int(11) NOT NULL,
  `sueldo_total` double DEFAULT NULL,
  PRIMARY KEY (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`,`Planilla_idPlanilla`),
  KEY `fk_Empleado_has_Planilla_Planilla1_idx` (`Planilla_idPlanilla`),
  KEY `fk_Empleado_has_Planilla_Empleado1_idx` (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  CONSTRAINT `fk_Empleado_has_Planilla_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`) REFERENCES `empleado` (`idEmpleado`, `Persona_idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Empleado_has_Planilla_Planilla1` FOREIGN KEY (`Planilla_idPlanilla`) REFERENCES `planilla` (`idPlanilla`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_x_planilla`
--

LOCK TABLES `empleado_x_planilla` WRITE;
/*!40000 ALTER TABLE `empleado_x_planilla` DISABLE KEYS */;
INSERT INTO `empleado_x_planilla` VALUES (1,1,1,NULL),(1,1,2,NULL),(1,1,3,NULL),(1,1,11,NULL),(1,1,21,NULL),(1,1,31,NULL),(1,1,41,NULL),(1,1,51,NULL),(1,1,101,8808.11),(1,1,111,9408.11),(1,1,121,NULL),(2,2,1,NULL),(2,2,2,NULL),(2,2,3,NULL),(2,2,11,NULL),(2,2,21,NULL),(2,2,31,NULL),(2,2,41,NULL),(2,2,51,NULL),(2,2,101,10824.5400390625),(2,2,111,12324.54),(2,2,121,NULL),(3,3,1,NULL),(3,3,2,NULL),(3,3,3,NULL),(3,3,11,NULL),(3,3,21,NULL),(3,3,31,NULL),(3,3,41,NULL),(3,3,51,NULL),(3,3,101,14490.490234375),(3,3,111,14090.49),(3,3,121,NULL),(4,4,1,NULL),(4,4,2,NULL),(4,4,3,NULL),(4,4,11,NULL),(4,4,21,NULL),(4,4,31,NULL),(4,4,41,NULL),(4,4,51,NULL),(4,4,101,11409.76953125),(4,4,111,13709.76),(4,4,121,NULL),(5,5,1,NULL),(5,5,2,NULL),(5,5,3,NULL),(5,5,11,NULL),(5,5,21,NULL),(5,5,31,NULL),(5,5,41,NULL),(5,5,51,NULL),(5,5,101,15722.919921875),(5,5,111,13000.99),(5,5,121,NULL),(6,11,21,NULL),(6,11,31,NULL),(6,11,41,NULL),(6,11,51,NULL),(6,11,101,18500),(6,11,111,7455),(6,11,121,NULL),(7,15,21,NULL),(7,15,31,NULL),(7,15,41,NULL),(7,15,51,NULL),(7,15,101,12455.6298828125),(7,15,111,12400.62),(7,15,121,NULL),(8,16,21,NULL),(8,16,31,NULL),(8,16,41,NULL),(8,16,51,NULL),(8,16,101,8500),(8,16,111,13525),(8,16,121,NULL);
/*!40000 ALTER TABLE `empleado_x_planilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_x_producto`
--

DROP TABLE IF EXISTS `empleado_x_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado_x_producto` (
  `idEmpleado` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `monto_adelanto` double NOT NULL,
  `fechaRegistro` date NOT NULL,
  `idPlanilla` int(11) DEFAULT NULL,
  KEY `fk_idEmpleado_idx` (`idEmpleado`),
  KEY `fk_idProducto_idx` (`idProducto`),
  KEY `FK_Empleado_Planilla` (`idPlanilla`),
  CONSTRAINT `FK_Empleado_Planilla` FOREIGN KEY (`idPlanilla`) REFERENCES `planilla` (`idPlanilla`),
  CONSTRAINT `fk_idEmpleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_x_producto`
--

LOCK TABLES `empleado_x_producto` WRITE;
/*!40000 ALTER TABLE `empleado_x_producto` DISABLE KEYS */;
INSERT INTO `empleado_x_producto` VALUES (6,2,1,45,'2020-12-12',111);
/*!40000 ALTER TABLE `empleado_x_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas_clientes`
--

DROP TABLE IF EXISTS `empresas_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresas_clientes` (
  `idEmpresaCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEmpresa` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `RTN` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idEmpresaCliente`),
  UNIQUE KEY `RTN_UNIQUE` (`RTN`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabla para los registros de nombres y RTN de empresas clientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas_clientes`
--

LOCK TABLES `empresas_clientes` WRITE;
/*!40000 ALTER TABLE `empresas_clientes` DISABLE KEYS */;
INSERT INTO `empresas_clientes` VALUES (1,'Lubricantes Warco','080199606652458'),(2,'Aguas del Sur','0801199606652125'),(3,'Farmacias Siman','0801197545875478'),(4,'Ferreteria el Diamante','0801197545875698');
/*!40000 ALTER TABLE `empresas_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_compras`
--

DROP TABLE IF EXISTS `factura_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_compras` (
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `idProveedor` int(11) DEFAULT NULL,
  `precio_total` double NOT NULL,
  `precio_impuesto` double NOT NULL,
  `descuentos` double NOT NULL,
  `num_factura` varchar(20) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `FK_Factura_Proveedor` (`idProveedor`),
  CONSTRAINT `FK_Factura_Proveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_compras`
--

LOCK TABLES `factura_compras` WRITE;
/*!40000 ALTER TABLE `factura_compras` DISABLE KEYS */;
INSERT INTO `factura_compras` VALUES (1,4,460,60,0,'1123364','2020-12-14');
/*!40000 ALTER TABLE `factura_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_encabezado`
--

DROP TABLE IF EXISTS `factura_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_encabezado` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_factura` date NOT NULL,
  `observaciones` varchar(100) NOT NULL,
  `total_factura` double NOT NULL,
  `RTN` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int(11) NOT NULL DEFAULT '0',
  `Cliente_Persona_idPersona` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFactura`,`Cliente_idCliente`,`Cliente_Persona_idPersona`),
  KEY `fk_Factura_Encabezado_Cliente1_idx` (`Cliente_idCliente`,`Cliente_Persona_idPersona`),
  CONSTRAINT `fk_Factura_Encabezado_Cliente1` FOREIGN KEY (`Cliente_idCliente`, `Cliente_Persona_idPersona`) REFERENCES `cliente` (`idCliente`, `Persona_idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_encabezado`
--

LOCK TABLES `factura_encabezado` WRITE;
/*!40000 ALTER TABLE `factura_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_encabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_ventas`
--

DROP TABLE IF EXISTS `factura_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_ventas` (
  `idFactura` int(11) NOT NULL,
  `nFactura` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `cliente` varchar(45) NOT NULL,
  `RTN` varchar(15) DEFAULT NULL,
  `subtotal` float NOT NULL,
  `ISV` float NOT NULL,
  `descuento` float NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`idFactura`),
  UNIQUE KEY `nFactura_UNIQUE` (`nFactura`),
  KEY `fk_factura_ventas_empleado_idx` (`idEmpleado`),
  CONSTRAINT `fk_factura_ventas_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_ventas`
--

LOCK TABLES `factura_ventas` WRITE;
/*!40000 ALTER TABLE `factura_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaencabezado_x_formapago`
--

DROP TABLE IF EXISTS `facturaencabezado_x_formapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturaencabezado_x_formapago` (
  `Factura_Encabezado_idFactura` int(11) NOT NULL,
  `Factura_Encabezado_Cliente_idCliente` int(11) NOT NULL,
  `Factura_Encabezado_Cliente_Persona_idPersona` int(11) NOT NULL,
  `FormaPago_idFormaPago` int(11) NOT NULL,
  `montoPagado` double NOT NULL,
  PRIMARY KEY (`Factura_Encabezado_idFactura`,`Factura_Encabezado_Cliente_idCliente`,`Factura_Encabezado_Cliente_Persona_idPersona`,`FormaPago_idFormaPago`),
  KEY `fk_Factura_Encabezado_has_FormaPago_FormaPago1_idx` (`FormaPago_idFormaPago`),
  KEY `fk_Factura_Encabezado_has_FormaPago_Factura_Encabezado1_idx` (`Factura_Encabezado_idFactura`,`Factura_Encabezado_Cliente_idCliente`,`Factura_Encabezado_Cliente_Persona_idPersona`),
  CONSTRAINT `fk_Factura_Encabezado_has_FormaPago_Factura_Encabezado1` FOREIGN KEY (`Factura_Encabezado_idFactura`, `Factura_Encabezado_Cliente_idCliente`, `Factura_Encabezado_Cliente_Persona_idPersona`) REFERENCES `factura_encabezado` (`idFactura`, `Cliente_idCliente`, `Cliente_Persona_idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Encabezado_has_FormaPago_FormaPago1` FOREIGN KEY (`FormaPago_idFormaPago`) REFERENCES `formapago` (`idFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaencabezado_x_formapago`
--

LOCK TABLES `facturaencabezado_x_formapago` WRITE;
/*!40000 ALTER TABLE `facturaencabezado_x_formapago` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturaencabezado_x_formapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturaencabezado_x_producto`
--

DROP TABLE IF EXISTS `facturaencabezado_x_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturaencabezado_x_producto` (
  `Factura_Encabezado_idFactura` int(11) NOT NULL,
  `Factura_Encabezado_Cliente_idCliente` int(11) NOT NULL,
  `Factura_Encabezado_Cliente_Persona_idPersona` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL,
  `cantidadcompra` double NOT NULL,
  PRIMARY KEY (`Factura_Encabezado_idFactura`,`Factura_Encabezado_Cliente_idCliente`,`Factura_Encabezado_Cliente_Persona_idPersona`,`Producto_idProducto`),
  KEY `fk_Factura_Encabezado_has_Producto_Producto1_idx` (`Producto_idProducto`),
  KEY `fk_Factura_Encabezado_has_Producto_Factura_Encabezado1_idx` (`Factura_Encabezado_idFactura`,`Factura_Encabezado_Cliente_idCliente`,`Factura_Encabezado_Cliente_Persona_idPersona`),
  CONSTRAINT `fk_Factura_Encabezado_has_Producto_Factura_Encabezado1` FOREIGN KEY (`Factura_Encabezado_idFactura`, `Factura_Encabezado_Cliente_idCliente`, `Factura_Encabezado_Cliente_Persona_idPersona`) REFERENCES `factura_encabezado` (`idFactura`, `Cliente_idCliente`, `Cliente_Persona_idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Encabezado_has_Producto_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturaencabezado_x_producto`
--

LOCK TABLES `facturaencabezado_x_producto` WRITE;
/*!40000 ALTER TABLE `facturaencabezado_x_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturaencabezado_x_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapago`
--

DROP TABLE IF EXISTS `formapago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formapago` (
  `idFormaPago` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_formapago` varchar(45) NOT NULL,
  PRIMARY KEY (`idFormaPago`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapago`
--

LOCK TABLES `formapago` WRITE;
/*!40000 ALTER TABLE `formapago` DISABLE KEYS */;
INSERT INTO `formapago` VALUES (1,'Efectivo'),(2,'Tarjeta de Credito'),(3,'Tarjeta de Debito'),(4,'Cheque'),(5,'TENGO'),(6,'Tigo Money');
/*!40000 ALTER TABLE `formapago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada`
--

DROP TABLE IF EXISTS `jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jornada` (
  `idJornada` int(11) NOT NULL AUTO_INCREMENT,
  `horainicio_jor` datetime NOT NULL,
  `horafin_jor` datetime NOT NULL,
  `Empleado_idEmpleado` int(11) NOT NULL,
  `Empleado_Persona_idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idJornada`,`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  KEY `fk_Jornada_Empleado1_idx` (`Empleado_idEmpleado`,`Empleado_Persona_idPersona`),
  CONSTRAINT `fk_Jornada_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`, `Empleado_Persona_idPersona`) REFERENCES `empleado` (`idEmpleado`, `Persona_idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada`
--

LOCK TABLES `jornada` WRITE;
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL,
  `nombre_marca` varchar(45) NOT NULL,
  `descp_marca` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Castrol',' '),(2,'Michelin Tires',' '),(3,'Puma Lubricants',NULL),(4,'Warco',NULL),(5,'Michelin',NULL),(6,'Continental',NULL),(7,'Pirelli',NULL),(8,'Nexen',NULL),(9,'Goodyear',NULL),(10,'Bridgeston',NULL),(11,'Pennzoil',NULL),(12,'Mobil',NULL),(13,'AMSOIL',NULL),(14,'Turtle wax',NULL);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimiento` (
  `idMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fechaTransaccion` date NOT NULL,
  `tipoMovimiento` varchar(1) NOT NULL,
  `cantidadPuntos` int(11) NOT NULL,
  `TarjetaAcumulacion_idTarjetaAcumulacion` int(11) NOT NULL,
  `TarjetaAcumulacion_Cliente_idCliente` int(11) NOT NULL,
  `TarjetaAcumulacion_Cliente_Persona_idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idMovimiento`,`TarjetaAcumulacion_idTarjetaAcumulacion`,`TarjetaAcumulacion_Cliente_idCliente`,`TarjetaAcumulacion_Cliente_Persona_idPersona`),
  KEY `fk_Movimiento_TarjetaAcumulacion1_idx` (`TarjetaAcumulacion_idTarjetaAcumulacion`,`TarjetaAcumulacion_Cliente_idCliente`,`TarjetaAcumulacion_Cliente_Persona_idPersona`),
  CONSTRAINT `fk_Movimiento_TarjetaAcumulacion1` FOREIGN KEY (`TarjetaAcumulacion_idTarjetaAcumulacion`, `TarjetaAcumulacion_Cliente_idCliente`, `TarjetaAcumulacion_Cliente_Persona_idPersona`) REFERENCES `tarjetaacumulacion` (`idTarjetaAcumulacion`, `Cliente_idCliente`, `Cliente_Persona_idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numeracion_correlativa`
--

DROP TABLE IF EXISTS `numeracion_correlativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numeracion_correlativa` (
  `idNumeracion` int(11) NOT NULL,
  `cai` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `inicio` int(11) NOT NULL,
  `fin` int(11) NOT NULL,
  `actual` int(11) NOT NULL,
  PRIMARY KEY (`idNumeracion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numeracion_correlativa`
--

LOCK TABLES `numeracion_correlativa` WRITE;
/*!40000 ALTER TABLE `numeracion_correlativa` DISABLE KEYS */;
INSERT INTO `numeracion_correlativa` VALUES (1,'7C5779-17492-BD4A91-08987D-4AFB94-9F','2021-03-27',80001,150000,80002);
/*!40000 ALTER TABLE `numeracion_correlativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pais` varchar(100) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Honduras'),(2,'Guatemala'),(3,'Costa Rica'),(4,'El Salvador'),(5,'China'),(6,'Haiti'),(7,'Brasil'),(8,'Francia'),(9,'Argentina'),(10,'Belice');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasillo`
--

DROP TABLE IF EXISTS `pasillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasillo` (
  `idPasillo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_pasillo` varchar(45) NOT NULL,
  `Area_idArea` int(11) NOT NULL,
  PRIMARY KEY (`idPasillo`),
  KEY `fk_Pasillo_Area1_idx` (`Area_idArea`),
  CONSTRAINT `fk_Pasillo_Area1` FOREIGN KEY (`Area_idArea`) REFERENCES `area` (`idArea`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasillo`
--

LOCK TABLES `pasillo` WRITE;
/*!40000 ALTER TABLE `pasillo` DISABLE KEYS */;
INSERT INTO `pasillo` VALUES (1,'Pasillo 1',1),(2,'Pasillo 2',1),(3,'Pasillo 1',2),(4,'Pasillo 2',2),(5,'Pasillo 1',3),(6,'Pasillo 2 ',3),(7,'Pasillo 1',4),(8,'Pasillo 2',4),(9,'Pasillo 1',5),(10,'Pasillo 1',6);
/*!40000 ALTER TABLE `pasillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasillo_x_contenedor`
--

DROP TABLE IF EXISTS `pasillo_x_contenedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pasillo_x_contenedor` (
  `Pasillo_idPasillo` int(11) NOT NULL,
  `Contenedor_idContenedor` int(11) NOT NULL,
  PRIMARY KEY (`Pasillo_idPasillo`,`Contenedor_idContenedor`),
  KEY `fk_Pasillo_has_Contenedor_Contenedor1_idx` (`Contenedor_idContenedor`),
  KEY `fk_Pasillo_has_Contenedor_Pasillo1_idx` (`Pasillo_idPasillo`),
  CONSTRAINT `fk_Pasillo_has_Contenedor_Contenedor1` FOREIGN KEY (`Contenedor_idContenedor`) REFERENCES `contenedor` (`idContenedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pasillo_has_Contenedor_Pasillo1` FOREIGN KEY (`Pasillo_idPasillo`) REFERENCES `pasillo` (`idPasillo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasillo_x_contenedor`
--

LOCK TABLES `pasillo_x_contenedor` WRITE;
/*!40000 ALTER TABLE `pasillo_x_contenedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `pasillo_x_contenedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Ciudad_idCiudad` int(11) DEFAULT '0',
  `Ciudad_Departamento_idDepartamento` int(11) DEFAULT '0',
  `pnombre` varchar(45) NOT NULL,
  `snombre` varchar(45) DEFAULT NULL,
  `papellido` varchar(45) NOT NULL,
  `sapellido` varchar(45) DEFAULT NULL,
  `num_identidad` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPersona`),
  UNIQUE KEY `num_identidad_UNIQUE` (`num_identidad`),
  KEY `fk_Persona_Ciudad1_idx` (`Ciudad_idCiudad`,`Ciudad_Departamento_idDepartamento`),
  CONSTRAINT `fk_Persona_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`, `Ciudad_Departamento_idDepartamento`) REFERENCES `ciudad` (`idCiudad`, `Departamento_idDepartamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,2,2,'Leroy','Jsandye','Grahamslaw','Sorensen','742942589','3280 Delladonna Street'),(2,1,1,'Porty','Yule','Seers','Lettice','125077484','0 Colorado Terrace'),(3,2,2,'Mirella','Ches','Schoroder','OKeevan','726847583','543 Clemons Court'),(4,3,3,'Packston','Kissiah','Licciardiello','Iddens','838429184','05 Hanover Court'),(5,7,1,'Godfree','Mano','ODonegan','Ingley','680494030','062 Beilfuss Point'),(6,2,2,'Iris','Ondina','Guillen','Garcia','0301195584734','Col. Sagastume'),(7,2,2,'Mario','Francisco','Rodriguez','','0801199798676','Col. Modesto Rodas'),(8,2,2,'Rony','Alexander','Caceres','Lopez','0801200032545','Col. Sagastume'),(9,2,2,'Wendy','Yamileth','Lopez','Guillen','0801198047543','Col. Sagastume'),(10,10,10,'Hy','Grove','Ezzell','Paten','75-703-4237','9378 Vernon Street'),(11,2,2,'Luis','Fernando','Benitez','Lopez','0801199606652','Col. 21 de Octubre'),(12,1,1,'Eneyda','Liliana','Lopez','Guillen','0301197601081','Col. 21 de Octubre'),(13,1,1,'Alcides','Antonio','Benitez','Mondragon','0601197048569','La venecia'),(15,1,NULL,'Jose','Antonio','Benitez','Mondragon','0301195487367','Col. La Venecia'),(16,2,2,'Fidel','Ernesto','GarcÃ­a','GutiÃ©rrez','0801199905590','Barrio Casamata');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planilla`
--

DROP TABLE IF EXISTS `planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planilla` (
  `idPlanilla` int(11) NOT NULL AUTO_INCREMENT,
  `fechaefectiva` date DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `estado_planilla` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idPlanilla`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planilla`
--

LOCK TABLES `planilla` WRITE;
/*!40000 ALTER TABLE `planilla` DISABLE KEYS */;
INSERT INTO `planilla` VALUES (1,'2020-01-08','2019-12-09','2020-01-09','P'),(2,'2020-02-08','2020-01-09','2020-02-09','P'),(3,'2020-03-08','2020-02-10','2020-03-09','P'),(4,'2020-04-08','2020-03-03','2020-04-09','P'),(5,'2020-05-08','2020-04-08','2020-05-09','P'),(6,'2019-06-08','2020-05-05','2020-06-09','P'),(7,'2020-07-08','2020-06-01','2020-07-09','P'),(8,'2019-08-08','2020-07-09','2020-08-09','P'),(9,'2019-09-08','2020-08-03','2020-09-09','P'),(10,'2020-10-08','2020-09-09','2020-10-09','P'),(11,'2020-11-14','2020-11-01','2020-11-30','P'),(21,'2020-11-01','2020-11-01','2020-11-30','P'),(31,'2020-12-01','2020-12-01','2020-12-31','P'),(41,'2021-01-16','2021-01-01','2021-01-31','P'),(51,'0000-00-00','0000-00-00','0000-00-00','P'),(101,'2020-12-31','2020-11-30','2020-12-30','P'),(111,'2020-12-31','2020-12-01','2020-12-30','P'),(121,'2020-12-21','2021-01-21','2021-01-22','N');
/*!40000 ALTER TABLE `planilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `descp_gral` varchar(1000) NOT NULL,
  `barcode` varchar(20) DEFAULT NULL,
  `precioCosto` double NOT NULL,
  `precioVenta` double NOT NULL,
  `porcentaje_desc` double DEFAULT NULL,
  `estado_producto` varchar(1) NOT NULL,
  `cantidad` double NOT NULL,
  `Contenedor_idContenedor` int(11) NOT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_Producto_Contenedor1_idx` (`Contenedor_idContenedor`),
  KEY `fk_Producto_TipoProducto` (`idTipoProducto`),
  KEY `FK_MarcaProducto` (`idMarca`),
  CONSTRAINT `FK_MarcaProducto` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Producto_Contenedor1` FOREIGN KEY (`Contenedor_idContenedor`) REFERENCES `contenedor` (`idContenedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Producto_TipoProducto` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipoproducto` (`idTipo_Producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'{\"categoria\":\"Accesorios\",\"general\":\"Pulimento para auto - Limpiador de servicio pesado RUBBING COMPOUND 298g\"}','074660412305',0,0,0,'D',0,4,6,14),(2,'{\"categoria\":\"Lubricantes\",\"tipo\":\"Liquido de Frenos\",\"viscosidad\":\"DOT-3\",\"volumen\":\"0.35\",\"unidad\":\"L\"}','815765020688',0,0,0,'D',0,4,2,3),(3,'{\"categoria\":\"Accesorios\",\"general\":\"Limpiador y protector para tapiceria 18oz\"}','074660402467',0,0,0,'D',0,4,6,14),(4,'{\"categoria\":\"Accesorios\",\"general\":\"Limpiador de alfombras y tapetes 18oz\"}','074660402443',0,0,0,'D',0,4,6,14),(5,'{\"categoria\":\"Neumaticos\",\"diametro\":\"12\",\"valvula\":\"larga\",\"vehiculo\":\"carro\",\"observacion\":\"delantero\"}','1211',26,15000,0,'D',18,1,4,7),(6,'{\"categoria\":\"Consumibles\",\"nombre\":\"Churros\",\"caducidad\":\"2020-12-21\"}','1224',0,0,0,'D',0,3,5,6);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(45) NOT NULL,
  `direccion_proveedor` varchar(45) NOT NULL,
  `telefono_proveedor` varchar(45) NOT NULL,
  `correo_proveedor` varchar(45) DEFAULT NULL,
  `Persona_idPersona` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `fk_Proveedor_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Proveedor_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Grady-Jakubowski','8 Colorado Parkway','11111111','gbenard0@linkedin.com',NULL),(2,'Leuschke-Bogisich','34 Spohn Point','7746286784','lcornely1@wikimedia.org',NULL),(3,'Christiansen LLC','60350 Longview Street','9233698602','jjanda2@mac.com',NULL),(4,'Cartwright, Dickens and Lubowitz','385 Lakewood Gardens Point','22229878','tpethybridge3@t.co',4),(5,'Yost-Muller','471 Lakewood Park','5648200043','jhuller4@toplist.cz',NULL),(6,'Blick and Sons','285 Express Parkway','9846661087','mbiggadyke5@discuz.net',NULL),(7,'Kerluke, Roob and Hintz','32 Bonner Court','9887942437','ibrunning6@edublogs.org',NULL),(8,'Sporer-Dickens','510 Elmside Trail','6047043878','alarrosa7@chron.com',NULL),(9,'Russel, Fritsch and Kunze','95495 Green Park','8284641164','tfoort8@hubpages.com',NULL),(10,'Llantilandia','Barrio el centro, Choluteca','22365485','llantilandia@email.com',NULL),(11,'Diana','Prados','22136869','ban134@gmail.com',NULL),(12,'Lubricantes Warco','Barrio el centro, Choluteca','99999999','warco@gmail.com',NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sucursal` (
  `idSucursal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `Ciudad_idCiudad` int(11) NOT NULL,
  `Ciudad_Departamento_idDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`idSucursal`),
  KEY `fk_Sucursal_Ciudad1_idx` (`Ciudad_idCiudad`,`Ciudad_Departamento_idDepartamento`),
  CONSTRAINT `fk_Sucursal_Ciudad1` FOREIGN KEY (`Ciudad_idCiudad`, `Ciudad_Departamento_idDepartamento`) REFERENCES `ciudad` (`idCiudad`, `Departamento_idDepartamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Principal','3 Dexter Drive',1,1),(2,'Bodega 1','3 Roxbury Court',7,1),(3,'Bodega 2','52 Daystar Road',10,10);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetaacumulacion`
--

DROP TABLE IF EXISTS `tarjetaacumulacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjetaacumulacion` (
  `idTarjetaAcumulacion` int(11) NOT NULL AUTO_INCREMENT,
  `fechaEmision` date NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Cliente_Persona_idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idTarjetaAcumulacion`,`Cliente_idCliente`,`Cliente_Persona_idPersona`),
  KEY `fk_TarjetaAcumulacion_Cliente1_idx` (`Cliente_idCliente`,`Cliente_Persona_idPersona`),
  CONSTRAINT `fk_TarjetaAcumulacion_Cliente1` FOREIGN KEY (`Cliente_idCliente`, `Cliente_Persona_idPersona`) REFERENCES `cliente` (`idCliente`, `Persona_idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetaacumulacion`
--

LOCK TABLES `tarjetaacumulacion` WRITE;
/*!40000 ALTER TABLE `tarjetaacumulacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjetaacumulacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `idTelefono` int(11) NOT NULL AUTO_INCREMENT,
  `Persona_idPersona` int(11) NOT NULL,
  `num_telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`idTelefono`,`Persona_idPersona`),
  KEY `fk_Telefono_Persona1_idx` (`Persona_idPersona`),
  CONSTRAINT `fk_Telefono_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1,1,'58766993'),(2,2,'95847958'),(3,3,'13816051'),(4,4,'10530723'),(5,5,'63163170'),(6,6,'96662555'),(7,7,'98273712'),(8,8,'99776644'),(9,9,'88447733'),(10,10,'37482756'),(11,11,'98989898'),(12,12,'99999999'),(13,13,'98542563'),(14,15,'99773355'),(16,16,'94868686');
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontenedor`
--

DROP TABLE IF EXISTS `tipocontenedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocontenedor` (
  `idTipoContenedor` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipocont` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoContenedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontenedor`
--

LOCK TABLES `tipocontenedor` WRITE;
/*!40000 ALTER TABLE `tipocontenedor` DISABLE KEYS */;
INSERT INTO `tipocontenedor` VALUES (1,'Estante'),(2,'Caja'),(3,'Baul'),(4,'Vitrina'),(5,'Otro');
/*!40000 ALTER TABLE `tipocontenedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontrato`
--

DROP TABLE IF EXISTS `tipocontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocontrato` (
  `idTipoContrato` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipocon` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoContrato`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontrato`
--

LOCK TABLES `tipocontrato` WRITE;
/*!40000 ALTER TABLE `tipocontrato` DISABLE KEYS */;
INSERT INTO `tipocontrato` VALUES (1,'Permanente'),(2,'Temporal'),(3,'Pendiente');
/*!40000 ALTER TABLE `tipocontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodeduccion`
--

DROP TABLE IF EXISTS `tipodeduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodeduccion` (
  `idTipoDeduccion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`idTipoDeduccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodeduccion`
--

LOCK TABLES `tipodeduccion` WRITE;
/*!40000 ALTER TABLE `tipodeduccion` DISABLE KEYS */;
INSERT INTO `tipodeduccion` VALUES (1,'Pago de materiales perjudicados'),(2,'Compra de objetos en la tienda'),(3,'Pago de materiales perjudicados');
/*!40000 ALTER TABLE `tipodeduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoproducto` (
  `idTipo_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `descp_tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipo_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproducto`
--

LOCK TABLES `tipoproducto` WRITE;
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT INTO `tipoproducto` VALUES (1,'Aceites'),(2,'Lubricantes'),(3,'Llantas'),(4,'Neumaticos'),(5,'Consumibles'),(6,'Accesorios');
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `idtipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idtipousuario`),
  UNIQUE KEY `tipo_UNIQUE` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'admin'),(2,'cajero'),(3,'supervisor'),(4,'tecnico');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion_correlativa`
--

DROP TABLE IF EXISTS `ubicacion_correlativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicacion_correlativa` (
  `idUsuario` int(11) NOT NULL,
  `establecimiento` varchar(3) NOT NULL DEFAULT '001',
  `caja` varchar(3) NOT NULL DEFAULT '001',
  UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  CONSTRAINT `fk_ubicacion_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion_correlativa`
--

LOCK TABLES `ubicacion_correlativa` WRITE;
/*!40000 ALTER TABLE `ubicacion_correlativa` DISABLE KEYS */;
INSERT INTO `ubicacion_correlativa` VALUES (1,'001','001'),(2,'001','001'),(3,'001','001'),(4,'001','001'),(5,'001','001'),(6,'001','001');
/*!40000 ALTER TABLE `ubicacion_correlativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` int(11) NOT NULL,
  `idtipousuario` int(11) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  KEY `empleado_usuario_idx` (`Empleado_idEmpleado`),
  KEY `tipousuario_usuario_idx` (`idtipousuario`),
  CONSTRAINT `empleado_usuario` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tipousuario_usuario` FOREIGN KEY (`idtipousuario`) REFERENCES `tipousuario` (`idtipousuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 DELAY_KEY_WRITE=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,6,1,'admin123','ca4b962351b2588925550f02085cecc4bdcc0783'),(2,2,2,'pyseers','cb6628e49d36ca24541acb4e2c2a0bacae22b3e1'),(3,3,3,'pkidden','cb6628e49d36ca24541acb4e2c2a0bacae22b3e1'),(4,7,4,'joseb','bcdcb29ed2aab16d48c11485264df665e906bdd9'),(5,8,4,'fegarcia','bcdcb29ed2aab16d48c11485264df665e906bdd9'),(6,1,1,'sadf','asd');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'heroku_a16e5753c5ce081'
--
/*!50003 DROP PROCEDURE IF EXISTS `AdelantoProductos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `AdelantoProductos`(
	IN idEmpleado INT,
    IN idPlanilla INT
)
BEGIN
	SELECT prod.descp_gral, exp.monto_adelanto, exp.fechaRegistro, exp.cantidad
    FROM empleado_x_producto as exp
    INNER JOIN empleado e ON exp.idEmpleado = e.idEmpleado
    INNER JOIN producto prod ON exp.idProducto = prod.idProducto
    WHERE exp.idEmpleado = idEmpleado AND exp.idPlanilla = idPlanilla;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Categorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Categorias`()
BEGIN
select * from tipoproducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Cliente`(IN id int)
BEGIN
SELECT
	c.idCliente,
	p.num_identidad as "id",
	p.pnombre,
    p.snombre,
    p.papellido,
    p.sapellido,
	tel.num_telefono as telefono,
	co.dir_correo as email,
	p.direccion as direccion,
    p.Ciudad_idCiudad as ciudad
FROM
	persona AS p
	INNER JOIN cliente  AS c ON p.idPersona = c.Persona_idPersona
	LEFT JOIN correo as co ON co.Persona_idPersona = p.idPersona
	LEFT JOIN telefono as tel on tel.Persona_idPersona = p.idPersona
    WHERE c.idCliente = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Clientes`()
BEGIN
SELECT
	c.idCliente as Id,
	p.num_identidad as "Id/RTN",
	CONCAT(p.pnombre," ",p.snombre," ",p.papellido," ",p.sapellido) as "Nombre Completo",
	tel.num_telefono as Telefono,
	co.dir_correo as Email,
	p.direccion as Direccion
FROM
	persona AS p
	INNER JOIN cliente  AS c ON p.idPersona = c.Persona_idPersona
	LEFT JOIN correo as co ON co.Persona_idPersona = p.idPersona
	LEFT JOIN telefono as tel on tel.Persona_idPersona = p.idPersona;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Compras`()
BEGIN
	SELECT
		idCompra as Id,
        nFactura as "# Factura",
        p.nombre_proveedor as Proveedor,
        fecha as Fecha,
        isv as ISV,
        total as Total
	FROM compras
    INNER JOIN proveedor as p
    ON compras.idProveedor = p.idProveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Contenedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Contenedores`()
BEGIN
	SELECT
    c.idContenedor as Id,     
    CONCAT(c.descripcion_cont," ",tc.descripcion_tipocont) as Ubicacion
    FROM contenedor c
    INNER JOIN tipocontenedor tc
    ON c.TipoContenedor_idTipoContenedor = tc.idTipoContenedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DetalleProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `DetalleProducto`(IN id int)
BEGIN
	select 
		p.descp_gral as Descripcion,        
		dc.cantidad as Cantidad,
        dc.precio as Precio,
        dc.isv as ISV,
        dc.descuento as Descuento,
        dc.total as Total
    from detalle_compra as dc
    inner join producto as p
    on p.idProducto = dc.idProducto
    where dc.idfactura_compras = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DetalleVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `DetalleVenta`(in idFactura int)
BEGIN
	select
    p.descp_gral as Descripcion,
    dv.cantidad as Cantidad,
    dv.precio as Precio,
    dv.ISV,
    dv.descuento as Descuento,
    dv.total as Total
    from detalle_venta as dv
    inner join producto as p
    on p.idProducto = dv.idProducto
    where dv.idFactura = idFactura;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Empleado`(IN id int)
BEGIN
SELECT
				emp.idEmpleado as Id,
                per.num_identidad as nId,
                per.pnombre as pNombre,
                per.snombre as sNombre,
                per.papellido as pApellido,
                per.sapellido as sApellido,
                tel.num_telefono as Telefono,
                c.dir_correo as Email,
                per.Ciudad_idCiudad as Ciudad,
                per.direccion as Direccion,
                car.idCargo as Funcion,
                emp.sueldo_emp as Sueldo,
                cxe.fecha_nombramiento as Contratado
            FROM
                empleado AS emp
                INNER JOIN
                persona as per ON emp.Persona_idPersona = per.IdPersona
                left JOIN
                telefono as tel ON tel.Persona_idPersona = per.IdPersona
                left join
                correo as c ON c.Persona_idPersona = per.idPersona
                inner JOIN
                cargo_x_empleado as cxe on cxe.Empleado_idEmpleado = emp.idEmpleado
                INNER JOIN
                cargo as car on car.idCargo = cxe.Cargo_idCargo
             WHERE emp.idEMpleado = id;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Empleados`()
BEGIN
SELECT
				emp.idEmpleado as Id,
                per.num_identidad as "#Id",
                CONCAT(per.pnombre," ",per.snombre," ",per.papellido," ",per.sapellido) as Nombre,
                tel.num_telefono as Telefono,
                c.dir_correo as Email,
                per.direccion as Direccion,
                car.nombre_cargo as Funcion,
                TRUNCATE(emp.sueldo_emp,2) as Sueldo,
                cxe.fecha_nombramiento as Contratado,
                emp.estado_empleo as Estado
            FROM
                empleado AS emp
                INNER JOIN
                persona as per ON emp.Persona_idPersona = per.IdPersona
                left JOIN
                telefono as tel ON tel.Persona_idPersona = per.IdPersona
                left join
                correo as c ON c.Persona_idPersona = per.idPersona
                inner JOIN
                cargo_x_empleado as cxe on cxe.Empleado_idEmpleado = emp.idEmpleado
                INNER JOIN
                cargo as car on car.idCargo = cxe.Cargo_idCargo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Factura_Compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Factura_Compras`()
BEGIN
	SELECT
			fc.idfactura as 'Id',
            fc.num_factura as 'Num. Factura',
            p.nombre_proveedor as 'Proveedor',
			fc.precio_total as 'Precio Total',
            fc.precio_impuesto as 'ISV',
            fc.descuentos as '% Descuento',
            fc.fecha_registro as 'Fecha Registro'
    FROM factura_compras AS fc
    INNER JOIN proveedor p on fc.idProveedor = p.idProveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Inventario`()
BEGIN
SELECT
                p.idProducto as Id,
                tp.descp_tipo as Tipo,
                p.descp_gral as Descripcion,
                p.precioCosto as Costo,
                p.precioVenta as Precio,
                p.cantidad as Stock,
                c.descripcion_cont as Local,
                tc.descripcion_tipocont as Ubicacion,
                m.nombre_marca as Marca
            FROM
                producto AS p                
                    LEFT JOIN
				marca AS m
                 ON p.idMarca = m.idMarca
					INNER JOIN
				contenedor AS c
				  ON c.idContenedor = p.Contenedor_idContenedor
                  INNER JOIN
                  tipocontenedor as tc
                  ON tc.idTipoContenedor = c.TipoContenedor_idTipoContenedor
                  INNER JOIN tipoproducto as tp
                  ON tp.idTipo_Producto = p.idTipoProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Marcas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Marcas`()
BEGIN
select idMarca, nombre_marca as marca from marca;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NumeracionCorrelativa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `NumeracionCorrelativa`(in fecha date)
BEGIN
	select 	
    actual
    from numeracion_correlativa
    where fecha < numeracion_correlativa.fecha AND actual < fin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProductoBarcode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `ProductoBarcode`(in barcodeIn varchar(20))
BEGIN
	SELECT 
		idProducto as Id,
		barcode as Barcode,
		descp_gral as Descripcion,
        precioVenta as Precio,
        precioCosto as Costo,
        porcentaje_desc as Descuento
    FROM producto
    WHERE barcode = barcodeIn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProductoId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `ProductoId`(IN id int)
BEGIN
SELECT
                p.idProducto as Id,
                p.barcode as Barcode,
                p.idTipoProducto as Tipo,
                p.descp_gral as Descripcion,              
                p.Contenedor_idContenedor as Local,                
                p.idMarca as Marca
            FROM
                producto AS p                                    						
                  WHERE p.idProducto = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Proveedor`(IN id int)
BEGIN
		SELECT
                p.idProveedor as Id,
                p.nombre_proveedor as Nombre,
                p.direccion_proveedor as Direccion,
                p.telefono_proveedor as Telefono,
                p.correo_proveedor as Email
            FROM
                proveedor AS p
                    LEFT JOIN
                persona  AS pe
                 ON p.Persona_idPersona = pe.idPersona
                     LEFT JOIN
                telefono AS t
                  ON pe.idPersona = t.Persona_idPersona
			WHERE p.idProveedor = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Proveedores`()
BEGIN
SELECT
                p.idProveedor as Id,
                p.nombre_proveedor as Nombre,
                p.direccion_proveedor as Direccion,
                p.telefono_proveedor as Telefono,
                p.correo_proveedor as Email
            FROM
                proveedor AS p
                    LEFT JOIN
                persona  AS pe
                 ON p.Persona_idPersona = pe.idPersona
                     LEFT JOIN
                telefono AS t
                  ON pe.idPersona = t.Persona_idPersona
                ORDER BY Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPactualiza_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPactualiza_cliente`(
	IN idCliente INT,	
	IN pNombre VARCHAR(50),
	IN sNombre VARCHAR(50),
	IN pApellido VARCHAR(50),
	IN sApellido VARCHAR(50),
	IN nom_ciudad INT,
	IN direccion VARCHAR(50),
	IN num_telefono VARCHAR(50),
	IN email VARCHAR(50),
	IN id VARCHAR(50)
    )
BEGIN
	DECLARE nom_departamento, idPersona INT;
	SET nom_departamento = (SELECT Departamento_idDepartamento from ciudad where idCiudad = nom_ciudad);
	SET idPersona = (SELECT Persona_idPersona from cliente where cliente.idCliente = idCliente);

		SET autocommit = 0;
		
		START TRANSACTION;
    
        UPDATE persona
		SET
		persona.Ciudad_idCiudad = nom_ciudad,
        persona.Ciudad_Departamento_idDepartamento = nom_departamento,
		persona.pnombre = pNombre,
		persona.snombre = sNombre,
		persona.papellido = pApellido,
		persona.sapellido = sApellido,
		persona.num_identidad = id,
		persona.direccion = direccion
		WHERE persona.idPersona = idPersona;		

		IF num_telefono <> '' THEN
		UPDATE telefono
		SET	telefono.num_telefono = num_telefono
		WHERE Persona_idPersona = idPersona;
        END IF;
        
		IF email <> '' THEN
		UPDATE correo
		SET	dir_correo = email
		WHERE Persona_idPersona = idPersona;
        END IF;
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPactualiza_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPactualiza_empleado`(
	IN id INT,
	IN pNombre VARCHAR(50),
	IN sNombre VARCHAR(50),
	IN pApellido VARCHAR(50),
	IN sApellido VARCHAR(50),
	IN nom_ciudad INT,
	IN direccion VARCHAR(50),
	IN num_telefono VARCHAR(50),
	IN email VARCHAR(50),
	IN fechaRegistro DATE,
	IN identidad VARCHAR(50),
	IN cargo INT
)
BEGIN
	DECLARE nom_depto, idpersona INT;
    SET nom_depto = (SELECT Departamento_idDepartamento from ciudad where idCiudad = nom_ciudad);
    SET idpersona = (
					SELECT A.Persona_idPersona FROM empleado AS A
					INNER JOIN cargo_x_empleado AS B ON(A.idEmpleado = B.Empleado_idEmpleado)
					WHERE A.idEmpleado = id
                    );
		SET autocommit = 0;
		
		START TRANSACTION;
    
        UPDATE persona
		SET
		persona.Ciudad_idCiudad = nom_ciudad,
        persona.Ciudad_Departamento_idDepartamento = nom_depto,
		persona.pnombre = pNombre,
		persona.snombre = sNombre,
		persona.papellido = pApellido,
		persona.sapellido = sApellido,
		persona.num_identidad = identidad,
		persona.direccion = direccion
		WHERE persona.idPersona = idPersona;
        
        IF num_telefono <> '' THEN
		UPDATE telefono
		SET	telefono.num_telefono = num_telefono
		WHERE Persona_idPersona = idPersona;
        END IF;
        
		IF email <> '' THEN
		UPDATE correo
		SET	dir_correo = email
		WHERE Persona_idPersona = idpersona;
        END IF;
        
        IF id <> '' THEN
        UPDATE cargo_x_empleado
        SET Cargo_idCargo = cargo
        WHERE Empleado_idEmpleado = id;
        END IF;
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPactualiza_numeracion_correlativa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPactualiza_numeracion_correlativa`(in numero int ,in fechaActual date)
BEGIN
DECLARE nactual INT;
DECLARE nfin INT;
DECLARE nfecha DATE;
DECLARE idIn int;

SET nactual = (SELECT actual from numeracion_correlativa);
SET nfin = (SELECT fin from numeracion_correlativa);
SET nfecha = (SELECT fecha from numeracion_correlativa);
SET idIn = (SELECT idNumeracion from numeracion_correlativa where actual = numero);

IF nactual < nfin THEN
	IF fechaActual < nfecha THEN
		UPDATE numeracion_correlativa SET actual = actual + 1 WHERE idNumeracion = idIn;
    END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPactualiza_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPactualiza_producto`(
	IN idProducto INT,
    IN descp_gral VARCHAR (1000),
    IN barcode VARCHAR (20),
    IN idContenedor INT,
    IN idTipoProd INT,
    IN marca INT
)
BEGIN
	
    SET autocommit = 0;
    START TRANSACTION;
    
    UPDATE producto
    SET
    producto.descp_gral = descp_gral,
    producto.barcode = barcode,
    producto.Contenedor_idContenedor = idContenedor,
    producto.idTipoProducto = idTipoProd,
    producto.idMarca = marca
    WHERE producto.idProducto = idProducto;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPactualiza_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPactualiza_proveedor`(
	IN id INT,
	IN nom_proveedor VARCHAR(45),
    IN direccion_proveedor VARCHAR(45),
    IN telefono_proveedor VARCHAR(45),
    IN correo_proveedor VARCHAR(45),
    IN idPersona INT
	)
BEGIN
	UPDATE proveedor
    SET 
	nombre_proveedor = nom_proveedor,  
	direccion_proveedor = direccion_proveedor,
	telefono_proveedor = telefono_proveedor,
	correo_proveedor = correo_proveedor
    WHERE idProveedor = id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPactualiza_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPactualiza_usuario`(
	IN id INT,
	IN empleado INT,
	IN idTipousuario INT,
	IN nombre_usuario VARCHAR(50),
	IN password_usuario VARCHAR(50)
)
BEGIN
	DECLARE passwd varchar(50);
	SET autocommit = 0;
    SET passwd = password_usuario;
	
    IF password_usuario = '' THEN
		SET passwd = (SELECT usuario.password FROM usuario WHERE usuario.idUsuario = id);
    END IF;
    
    START TRANSACTION;
	UPDATE usuario
	SET
	usuario.Empleado_idEmpleado = empleado,
	usuario.idtipousuario = idTipousuario,
	usuario.nombre_usuario = nombre_usuario,
	usuario.password = passwd
	WHERE usuario.idUsuario = id;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPdespedir_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPdespedir_empleado`(IN idEmp INT)
SP:BEGIN
	IF idEmp = 0 OR idEmp < 0 THEN
		LEAVE SP;
	END IF;
    
    SET autocommit = 0;
    START TRANSACTION;
    
	UPDATE empleado
    SET estado_empleo = 'D'
    WHERE idEmpleado = idEmp;
    
    UPDATE cargo_x_empleado
    SET fecha_fin = CURDATE()
    WHERE Empleado_idEmpleado = idEmp;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPelimina_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPelimina_cliente`(
	IN id int
)
BEGIN
	DECLARE idPersona_temp INT;
	SET idPersona_temp = (SELECT  Persona_idPersona from cliente where idCliente = id);
    SET autocommit = 0;
    
    START TRANSACTION;
    delete from cliente where idCliente = id;
    delete from persona where idPersona = idPersona_temp;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPelimina_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPelimina_producto`(IN id INT)
BEGIN    
    delete from producto where idProducto = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPelimina_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPelimina_proveedor`(IN idProv INT)
BEGIN
	SET autocommit = 0;
	DELETE FROM proveedor
	WHERE idProveedor = idProv;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPelimina_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPelimina_usuario`(IN id int)
BEGIN
start transaction;
    delete from usuario where idUsuario = id;
commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPempresas_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPempresas_clientes`()
BEGIN
select * from empresas_clientes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPmuestraprecio_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPmuestraprecio_productos`(IN textosearch VARCHAR(45))
BEGIN
	SELECT idProducto, precioVenta FROM producto
	WHERE descp_gral LIKE ('%' + textosearch + '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnueva_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnueva_venta`(
	IN numerofactura varchar(20),
    IN fecha_registro DATE,
    IN usernameIn VARCHAR(45),
    IN cliente VARCHAR(45),
    IN RTN VARCHAR(15),
    IN subtotal float,
    IN ISV float,
    IN descuento float,
    IN total float  
)
BEGIN
	DECLARE idfactura_insert INT;
    DECLARE idEmpleado INT;
    
    SET idEmpleado = (select Empleado_idEmpleado from usuario where nombre_usuario = usernameIn);
    
    SET idfactura_insert = (SELECT COUNT(idFactura) FROM factura_ventas) + 1;
    
    INSERT INTO factura_ventas VALUES 
    (idfactura_insert,numerofactura, fecha_registro, idEmpleado, cliente, RTN, subtotal, ISV, descuento, total);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevoingresar_facturacompras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevoingresar_facturacompras`(
	IN idProveedor INT,
    IN precio_total DOUBLE,
    IN precio_impuestos DOUBLE,
    IN descuento DOUBLE,
    IN numerofactura varchar(20),
    IN fecha_registro DATE
)
BEGIN
	DECLARE idfactura_insert INT;
    
    SET idfactura_insert = (SELECT COUNT(*) FROM factura_compras) + 1;
    
    INSERT INTO factura_compras VALUES 
    (idfactura_insert, idProveedor, precio_total, precio_impuestos, 
    descuento, numerofactura, fecha_registro);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevo_adelantoempleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevo_adelantoempleado`(
	IN identidad varchar(20),
    IN idProductoIn INT,
    IN cantidadIn INT,
    IN monto_adelanto DOUBLE,
    IN fechaRegistro DATE
)
BEGIN
	DECLARE planilla INT;
    DECLARE idEmpleado int; 
    DECLARE stock int; 
    
    SET stock = (SELECT cantidad FROM producto WHERE producto.idProducto = idProductoIn);
    
    IF stock > 0 THEN
		SET planilla = (SELECT idPlanilla FROM planilla WHERE estado_planilla='N');
		SET idEmpleado =  (SELECT emp.idEmpleado  FROM empleado AS emp
							INNER JOIN   persona as per ON emp.Persona_idPersona = per.IdPersona
						WHERE per.num_identidad = identidad);
						
		SET autocommit = 0;
		START TRANSACTION;
		
		INSERT INTO empleado_x_producto VALUES
		(idEmpleado, idProductoIn, cantidadIn, monto_adelanto, fechaRegistro, planilla);
		
		CALL SPsueldo_total(idEmpleado);

		UPDATE producto
		SET
		cantidad = stock - cantidadIn
		WHERE idProducto = idProductoIn;

    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevo_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevo_cliente`(
	IN pNombre VARCHAR(50),
	IN sNombre VARCHAR(50),
	IN pApellido VARCHAR(50),
	IN sApellido VARCHAR(50),
	IN nom_ciudad INT,
	IN direccion VARCHAR(50),
	IN num_telefono VARCHAR(50),
	IN email VARCHAR(50),
	IN fechaRegistro DATE,
	IN id VARCHAR(50)
    )
BEGIN
	DECLARE nom_departamento INT;
	SET nom_departamento = (SELECT Departamento_idDepartamento from ciudad where idCiudad = nom_ciudad);

		SET autocommit = 0;
		
		START TRANSACTION;
	
        INSERT INTO persona (Ciudad_idCiudad,Ciudad_Departamento_idDepartamento,pnombre,snombre,papellido,sapellido,num_identidad,direccion)
		VALUES (nom_ciudad,nom_departamento,pNombre,sNombre,pApellido,sApellido,id,direccion);

		SELECT @idPersona:= idPersona from persona where num_identidad = id FOR UPDATE;

		IF num_telefono <> '' THEN
		INSERT INTO telefono (Persona_idPersona,num_telefono)
		VALUES (@idPersona,num_telefono);
		END IF;
        
		IF email <> '' THEN
		INSERT INTO correo (dir_correo,Persona_idPersona)
		VALUES (email,@idPersona);
		END IF;
        
		INSERT INTO cliente (Persona_idPersona,fechaRegistro)
		VALUES (@idPersona,DATE(fechaRegistro));
        
        COMMIT;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevo_detalle_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevo_detalle_compra`(
	IN barcodeIn varchar(20),
    IN numFactura varchar(20),
    IN cantidad_nueva int,
    IN precio float,
    IN costo float,
    IN isv float,
    IN descuento float,
    IN total float    
)
BEGIN	
		DECLARE idCompra INT;
		DECLARE idProducto_insert INT;
		DECLARE cantidad_actual DOUBLE;
        
        SET idCompra = (select idfactura from factura_compras where num_factura = numFactura);
        SET idProducto_insert = (select idProducto from producto where barcode = barcodeIn);
        
        SET cantidad_actual = 	(
								SELECT p.cantidad FROM producto p 
                                WHERE p.idProducto = idProducto_insert
                                );
        
        INSERT INTO detalle_compra VALUES(idProducto_insert, idCompra, 
        cantidad_nueva, precio, isv, descuento, total);
        
        UPDATE producto
        SET cantidad = cantidad_nueva + cantidad_actual, precioCosto = costo, precioVenta = precio
        WHERE idProducto = idProducto_insert;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevo_detalle_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevo_detalle_venta`(
	IN barcodeIn VARCHAR(20),
    IN nFacturaIn VARCHAR(20),
    IN cantidad_nueva int,
    IN precio float,
    IN isv float,
    IN descuento float,
    IN total float    
)
BEGIN	
		DECLARE idVenta INT;
		DECLARE idProducto_insert INT;
		DECLARE cantidad_actual INT;
        
        SET idVenta = (select idFactura from factura_ventas where nFactura = nFacturaIn);
        SET idProducto_insert = (select idProducto from producto where barcode = barcodeIn);
        
        SET cantidad_actual = 	(
								SELECT p.cantidad FROM producto p 
                                WHERE p.idProducto = idProducto_insert
                                );
        
        INSERT INTO detalle_venta VALUES(idProducto_insert, idVenta, 
        cantidad_nueva, precio, isv, descuento, total);
        
        UPDATE producto
        SET cantidad = cantidad_actual-cantidad_nueva
        WHERE idProducto = idProducto_insert;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevo_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevo_empleado`(
	IN pNombre VARCHAR(50),
	IN sNombre VARCHAR(50),
	IN pApellido VARCHAR(50),
	IN sApellido VARCHAR(50),
	IN nom_ciudad INT,
	IN direccion VARCHAR(50),
	IN num_telefono VARCHAR(50),
	IN email VARCHAR(50),
	IN fechaRegistro DATE,
	IN identidad VARCHAR(50),
	IN idCargo_insert INT
)
SP:BEGIN
	DECLARE sueldo_base_insert FLOAT;
	DECLARE idPersona_insert INT;
	DECLARE idTelefono_insert INT;
	DECLARE idCorreo_insert INT;
	DECLARE idEmpleado_insert INT;
	DECLARE nom_departamento INT;

	SET idPersona_insert = (SELECT COUNT(idPersona) FROM Persona) + 1;
	SET idTelefono_insert = (SELECT COUNT(idTelefono) FROM Telefono) + 1;
	SET idCorreo_insert = (SELECT COUNT(idCorreo) FROM Correo) + 1;
	SET idEmpleado_insert = (SELECT COUNT(idEmpleado) FROM Empleado) + 1;
	SET nom_departamento = (SELECT Departamento_idDepartamento from ciudad where idCiudad = nom_ciudad);

	SET sueldo_base_insert = (SELECT sueldo_base FROM Cargo WHERE idCargo = idCargo_insert);

	SET autocommit = 0;
	START TRANSACTION;

	INSERT INTO Persona VALUES(idPersona_insert, nom_ciudad, nom_departamento, pNombre, sNombre, pApellido, sApellido, identidad, direccion);
	
	INSERT INTO Telefono VALUES(idTelefono_insert, idPersona_insert, num_telefono);

	IF email <> '' THEN
		INSERT INTO Correo VALUES(idCorreo_insert, email, idPersona_insert);
	END IF;

	INSERT INTO Empleado VALUES(idEmpleado_insert, idPersona_insert, sueldo_base_insert);
	
	INSERT INTO cargo_x_empleado VALUES(idCargo_insert, idEmpleado_insert, idPersona_insert, fechaRegistro,null);
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevo_empresa_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevo_empresa_cliente`(
	IN nombre varchar(50),
    IN RTN varchar(20)
)
BEGIN
DECLARE id INT;

START TRANSACTION;
SET id = (SELECT MAX(idEmpresaCliente) FROM empresas_clientes) + 1;

INSERT INTO empresas_clientes
(idEmpresaCliente,nombreEmpresa,RTN)
VALUES
(id,nombre,RTN);
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevo_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevo_producto`(
	IN descripcion VARCHAR(1000),
    IN barcode VARCHAR(20),
	IN idContenedor INT,
	IN idTipoProducto INT,
    IN idMarca INT
)
BEGIN
	DECLARE estadoproducto VARCHAR(1);
	DECLARE idProducto_insert INT;

	SET idProducto_insert = (SELECT MAX(idProducto) FROM Producto) + 1;
	SET estadoproducto = 'D';

	SET autocommit = 0;
	START TRANSACTION;

	INSERT INTO Producto
    VALUES(
    idProducto_insert, descripcion,barcode, 0, 0, 0, estadoproducto, 0, idContenedor, idTipoProducto,idMarca);

	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevo_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevo_proveedor`(
    IN nombre_proveedor VARCHAR(45),
    IN direccion_proveedor VARCHAR(45),
    IN telefono_proveedor VARCHAR(45),
    IN correo_proveedor VARCHAR(45),
    IN idPersona INT
    )
SP:BEGIN
        DECLARE idProveedor_insert INT;
		SET autocommit = 0;
		
		START TRANSACTION;
        
		SET idProveedor_insert = (SELECT COUNT(idProveedor) FROM Proveedor) + 1;
       
        INSERT INTO Proveedor VALUES(idProveedor_insert, nombre_proveedor, direccion_proveedor, telefono_proveedor, correo_proveedor, idPersona);
        COMMIT;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPnuevo_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPnuevo_usuario`(
		IN idEmpleado INT,
		IN idTipousuario INT,
    	IN nombre_usuario VARCHAR(50),
    	IN password_usuario VARCHAR(50)
    )
SP:BEGIN
        DECLARE idUsuario_insert INT;
		SET autocommit = 0;
		
		START TRANSACTION;
				
		SET idUsuario_insert = (SELECT COUNT(idUsuario) FROM Usuario) + 1;

        INSERT INTO Usuario VALUES(idUsuario_insert, idEmpleado, idTipoUsuario, nombre_usuario, password_usuario);
        INSERT INTO ubicacion_correlativa values(idUsuario_insert,"001","001");
        COMMIT;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPsueldo_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `SPsueldo_total`(IN idEm INT)
BEGIN
DECLARE sueldo FLOAT;
DECLARE bono FLOAT;
DECLARE deduccion FLOAT;
DECLARE adelanto FLOAT;
DECLARE planilla_estadon INT;

SET planilla_estadon = (
						SELECT idPlanilla FROM Planilla
                        WHERE estado_planilla = 'N'
						);

SET sueldo = (SELECT sueldo_emp FROM empleado AS A
			INNER JOIN empleado_x_planilla AS F
			ON(A.idEmpleado=F.Empleado_idEmpleado)
			INNER JOIN planilla AS G
			ON(F.Planilla_idPlanilla=G.idPlanilla)
			WHERE A.idEmpleado = idEm AND G.idPlanilla = planilla_estadon);
            
SET bono = (
			SELECT SUM(monto) FROM bono AS A
            INNER JOIN empleado_x_bono AS B
			ON(A.idBono=B.Bono_idBono)
            INNER JOIN empleado AS C
            ON(B.Empleado_idEmpleado=C.idEmpleado)
            INNER JOIN planilla AS G
			ON(B.Planilla_idPlanilla=G.idPlanilla)
			WHERE C.idEmpleado = idEm AND G.idPlanilla = planilla_estadon
			);
            
SET deduccion = (
				SELECT SUM(valor) FROM deduccion AS A
				INNER JOIN empleado_x_deduccion AS B
				ON(B.Deduccion_idDeduccion=A.idDeduccion)
				INNER JOIN empleado AS E
				ON(B.Empleado_idEmpleado=E.idEmpleado)
				INNER JOIN planilla AS D
				ON(B.Planilla_idPlanilla=D.idPlanilla)
				WHERE E.idEmpleado = idEm AND D.idPlanilla = planilla_estadon
				);
                
SET adelanto = (
				SELECT SUM(monto_adelanto) FROM empleado_x_producto AS exp
                INNER JOIN empleado e on exp.idEmpleado = e.idEmpleado
                INNER JOIN empleado_x_planilla explan ON e.idEmpleado = explan.Empleado_idEmpleado
                INNER JOIN planilla pla ON explan.Planilla_idPlanilla = pla.idPlanilla
                WHERE e.idEmpleado = idEm AND pla.idPlanilla = planilla_estadon
                );
                
		IF deduccion IS NULL THEN  
			SET deduccion = 0;          
			UPDATE empleado_x_planilla
            SET sueldo_total = TRUNCATE(sueldo + bono - deduccion - adelanto, 2)
            WHERE Empleado_idEmpleado = idEm AND Planilla_idPlanilla = planilla_estadon;
		END IF; 
        
		IF bono IS NULL THEN  
			SET bono = 0;          
			UPDATE empleado_x_planilla
            SET sueldo_total = TRUNCATE(sueldo + bono - deduccion - adelanto, 2)
            WHERE Empleado_idEmpleado  = idEm AND Planilla_idPlanilla = planilla_estadon;  
		END IF;
        
        IF adelanto IS NULL THEN
			SET adelanto = 0;
            UPDATE empleado_x_planilla
            SET sueldo_total = TRUNCATE(sueldo + bono - deduccion - adelanto, 2)
            WHERE Empleado_idEmpleado  = idEm AND Planilla_idPlanilla = planilla_estadon;
        END IF;
        
        IF bono IS NULL THEN  
			IF deduccion IS NULL THEN
				IF adelanto IS NULL THEN
				UPDATE empleado_x_planilla
				SET sueldo_total = TRUNCATE(sueldo, 2)
				WHERE Empleado_idEmpleado  = idEm AND Planilla_idPlanilla = planilla_estadon;
				END IF;
            END IF;
		END IF;
        
         IF bono IS not NULL THEN  
			IF deduccion IS not NULL THEN
				UPDATE empleado_x_planilla 
				SET sueldo_total = TRUNCATE(sueldo + bono - deduccion - adelanto, 2)
				WHERE Empleado_idEmpleado  = idEm AND Planilla_idPlanilla = planilla_estadon;
			END IF;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Stock`(in idProductoIn int)
BEGIN
	select cantidad from producto where idProducto = idProductoIn;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TipoUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `TipoUsuario`()
BEGIN
select tipo from tipousuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Usuario`(IN id int)
BEGIN
	SELECT 
	e.idEmpleado as empleado,
	u.nombre_usuario as username,
	tu.idtipousuario as tipo
	FROM usuario as u
	inner join empleado as e on e.idEmpleado = u.Empleado_idEmpleado
	inner join persona as p on p.idPersona = e.Persona_idPersona
	inner join tipousuario as tu on tu.idtipousuario = u.idtipousuario
    WHERE idUsuario = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Usuarios`()
BEGIN
		SELECT 
        u.idUsuario as Id,
        CONCAT(p.pnombre," ",p.papellido) as Empleado,
		u.nombre_usuario as "Nombre de Usuario",
        tu.tipo as "Tipo de Cuenta"
		FROM usuario as u
		inner join empleado as e on e.idEmpleado = u.Empleado_idEmpleado
		inner join persona as p on p.idPersona = e.Persona_idPersona
		inner join tipousuario as tu on tu.idtipousuario = u.idtipousuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`b70fe44c3564d1`@`%` PROCEDURE `Ventas`()
BEGIN
	select 
    fv.idFactura as Id,
    fv.nFactura as "Factura #",
    fv.fecha as Fecha,
    CONCAT(p.pNombre, " " , p.pApellido) as Cajero,
    fv.cliente as Cliente,
    fv.RTN,
    fv.subtotal as Subtotal,
    fv.ISV,
    fv.descuento as Descuento,
    fv.total as Total
    from factura_ventas as fv
    inner join empleado as emp
    on fv.idEmpleado = emp.idEmpleado
    inner join persona as p
    on emp.Persona_idPersona = p.idPersona;
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

-- Dump completed on 2020-12-17 19:34:30
