CREATE DATABASE  IF NOT EXISTS `sigga` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sigga`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: sigga
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `aca_areaconocimiento`
--

DROP TABLE IF EXISTS `aca_areaconocimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aca_areaconocimiento` (
  `AreaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `Nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AreaId`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aca_areaconocimiento`
--

LOCK TABLES `aca_areaconocimiento` WRITE;
/*!40000 ALTER TABLE `aca_areaconocimiento` DISABLE KEYS */;
INSERT INTO `aca_areaconocimiento` VALUES ('area02-0000-0000-0000-000000000000','Ciencias Econ√≥micas'),('area01-0000-0000-0000-000000000000','Ingenier√≠a en Sistemas');
/*!40000 ALTER TABLE `aca_areaconocimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aca_asignatura`
--

DROP TABLE IF EXISTS `aca_asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aca_asignatura` (
  `AsignaturaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `Nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CarreraId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AsignaturaId`),
  UNIQUE KEY `Codigo` (`Codigo`),
  KEY `CarreraId` (`CarreraId`),
  CONSTRAINT `aca_asignatura_ibfk_1` FOREIGN KEY (`CarreraId`) REFERENCES `aca_carrera` (`CarreraId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aca_asignatura`
--

LOCK TABLES `aca_asignatura` WRITE;
/*!40000 ALTER TABLE `aca_asignatura` DISABLE KEYS */;
INSERT INTO `aca_asignatura` VALUES ('asig01-0000-0000-0000-000000000000','Programaci√≥n Avanzada','IS301','carr01-0000-0000-0000-000000000000'),('asig02-0000-0000-0000-000000000000','Bases de Datos II','IS302','carr01-0000-0000-0000-000000000000');
/*!40000 ALTER TABLE `aca_asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aca_carrera`
--

DROP TABLE IF EXISTS `aca_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aca_carrera` (
  `CarreraId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `Nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AreaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CarreraId`),
  UNIQUE KEY `Nombre` (`Nombre`),
  KEY `AreaId` (`AreaId`),
  CONSTRAINT `aca_carrera_ibfk_1` FOREIGN KEY (`AreaId`) REFERENCES `aca_areaconocimiento` (`AreaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aca_carrera`
--

LOCK TABLES `aca_carrera` WRITE;
/*!40000 ALTER TABLE `aca_carrera` DISABLE KEYS */;
INSERT INTO `aca_carrera` VALUES ('carr01-0000-0000-0000-000000000000','Ingenier√≠a de Software','area01-0000-0000-0000-000000000000'),('carr02-0000-0000-0000-000000000000','Administraci√≥n de Empresas','area02-0000-0000-0000-000000000000');
/*!40000 ALTER TABLE `aca_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aca_clase`
--

DROP TABLE IF EXISTS `aca_clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aca_clase` (
  `ClaseId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `AsignaturaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProfesorId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GrupoId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Periodo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ubicacion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ClaseId`),
  KEY `AsignaturaId` (`AsignaturaId`),
  KEY `ProfesorId` (`ProfesorId`),
  KEY `GrupoId` (`GrupoId`),
  CONSTRAINT `aca_clase_ibfk_1` FOREIGN KEY (`AsignaturaId`) REFERENCES `aca_asignatura` (`AsignaturaId`),
  CONSTRAINT `aca_clase_ibfk_2` FOREIGN KEY (`ProfesorId`) REFERENCES `aca_profesor` (`ProfesorId`),
  CONSTRAINT `aca_clase_ibfk_3` FOREIGN KEY (`GrupoId`) REFERENCES `aca_grupo` (`GrupoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aca_clase`
--

LOCK TABLES `aca_clase` WRITE;
/*!40000 ALTER TABLE `aca_clase` DISABLE KEYS */;
INSERT INTO `aca_clase` VALUES ('clase01-0000-0000-0000-000000000000','asig01-0000-0000-0000-000000000000','prof01-0000-0000-0000-000000000000','grupo01-0000-0000-0000-000000000000','2025-I','Lab. Sistemas 1'),('clase02-0000-0000-0000-000000000000','asig02-0000-0000-0000-000000000000','prof01-0000-0000-0000-000000000000','grupo01-0000-0000-0000-000000000000','2025-I','Aula 304');
/*!40000 ALTER TABLE `aca_clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aca_estudiante`
--

DROP TABLE IF EXISTS `aca_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aca_estudiante` (
  `EstudianteId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CarreraId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EstudianteId`),
  UNIQUE KEY `PersonaId` (`PersonaId`),
  KEY `CarreraId` (`CarreraId`),
  CONSTRAINT `aca_estudiante_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `idn_persona` (`PersonaId`),
  CONSTRAINT `aca_estudiante_ibfk_2` FOREIGN KEY (`CarreraId`) REFERENCES `aca_carrera` (`CarreraId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aca_estudiante`
--

LOCK TABLES `aca_estudiante` WRITE;
/*!40000 ALTER TABLE `aca_estudiante` DISABLE KEYS */;
INSERT INTO `aca_estudiante` VALUES ('estu01-0000-0000-0000-000000000000','11111111-1111-1111-1111-111111111111','carr01-0000-0000-0000-000000000000'),('estu02-0000-0000-0000-000000000000','44444444-4444-4444-4444-444444444444','carr01-0000-0000-0000-000000000000');
/*!40000 ALTER TABLE `aca_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aca_grupo`
--

DROP TABLE IF EXISTS `aca_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aca_grupo` (
  `GrupoId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `NombreGrupo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CarreraId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`GrupoId`),
  KEY `CarreraId` (`CarreraId`),
  CONSTRAINT `aca_grupo_ibfk_1` FOREIGN KEY (`CarreraId`) REFERENCES `aca_carrera` (`CarreraId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aca_grupo`
--

LOCK TABLES `aca_grupo` WRITE;
/*!40000 ALTER TABLE `aca_grupo` DISABLE KEYS */;
INSERT INTO `aca_grupo` VALUES ('grupo01-0000-0000-0000-000000000000','3M1-IS','carr01-0000-0000-0000-000000000000'),('grupo02-0000-0000-0000-000000000000','1A1-AE','carr02-0000-0000-0000-000000000000');
/*!40000 ALTER TABLE `aca_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aca_horarioclase`
--

DROP TABLE IF EXISTS `aca_horarioclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aca_horarioclase` (
  `HorarioId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `ClaseId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DiaSemana` int NOT NULL,
  `HoraInicio` time NOT NULL,
  `HoraFin` time NOT NULL,
  PRIMARY KEY (`HorarioId`),
  KEY `ClaseId` (`ClaseId`),
  CONSTRAINT `aca_horarioclase_ibfk_1` FOREIGN KEY (`ClaseId`) REFERENCES `aca_clase` (`ClaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aca_horarioclase`
--

LOCK TABLES `aca_horarioclase` WRITE;
/*!40000 ALTER TABLE `aca_horarioclase` DISABLE KEYS */;
INSERT INTO `aca_horarioclase` VALUES ('hor01-0000-0000-0000-000000000000','clase01-0000-0000-0000-000000000000',7,'00:50:00','01:50:00'),('hor02-0000-0000-0000-000000000000','clase01-0000-0000-0000-000000000000',6,'23:51:00','23:52:00');
/*!40000 ALTER TABLE `aca_horarioclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aca_matricula`
--

DROP TABLE IF EXISTS `aca_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aca_matricula` (
  `MatriculaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `EstudianteId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClaseId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MatriculaId`),
  UNIQUE KEY `UQ_Estudiante_Clase` (`EstudianteId`,`ClaseId`),
  KEY `ClaseId` (`ClaseId`),
  CONSTRAINT `aca_matricula_ibfk_1` FOREIGN KEY (`EstudianteId`) REFERENCES `aca_estudiante` (`EstudianteId`),
  CONSTRAINT `aca_matricula_ibfk_2` FOREIGN KEY (`ClaseId`) REFERENCES `aca_clase` (`ClaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aca_matricula`
--

LOCK TABLES `aca_matricula` WRITE;
/*!40000 ALTER TABLE `aca_matricula` DISABLE KEYS */;
INSERT INTO `aca_matricula` VALUES ('mat01-0000-0000-0000-000000000000','estu01-0000-0000-0000-000000000000','clase01-0000-0000-0000-000000000000'),('mat02-0000-0000-0000-000000000000','estu02-0000-0000-0000-000000000000','clase02-0000-0000-0000-000000000000');
/*!40000 ALTER TABLE `aca_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aca_profesor`
--

DROP TABLE IF EXISTS `aca_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aca_profesor` (
  `ProfesorId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AreaId` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ProfesorId`),
  UNIQUE KEY `PersonaId` (`PersonaId`),
  KEY `AreaId` (`AreaId`),
  CONSTRAINT `aca_profesor_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `idn_persona` (`PersonaId`),
  CONSTRAINT `aca_profesor_ibfk_2` FOREIGN KEY (`AreaId`) REFERENCES `aca_areaconocimiento` (`AreaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aca_profesor`
--

LOCK TABLES `aca_profesor` WRITE;
/*!40000 ALTER TABLE `aca_profesor` DISABLE KEYS */;
INSERT INTO `aca_profesor` VALUES ('prof01-0000-0000-0000-000000000000','22222222-2222-2222-2222-222222222222','area01-0000-0000-0000-000000000000'),('prof02-0000-0000-0000-000000000000','55555555-5555-5555-5555-555555555555','area02-0000-0000-0000-000000000000');
/*!40000 ALTER TABLE `aca_profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_asistenciaclase`
--

DROP TABLE IF EXISTS `ast_asistenciaclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_asistenciaclase` (
  `AsistenciaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `SesionId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EstudianteId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MarcadoEl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MarcadoPor` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ObservacionSecretaria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AsistenciaId`),
  KEY `SesionId` (`SesionId`),
  KEY `EstudianteId` (`EstudianteId`),
  KEY `MarcadoPor` (`MarcadoPor`),
  CONSTRAINT `ast_asistenciaclase_ibfk_1` FOREIGN KEY (`SesionId`) REFERENCES `ast_sesionclase` (`SesionId`),
  CONSTRAINT `ast_asistenciaclase_ibfk_2` FOREIGN KEY (`EstudianteId`) REFERENCES `aca_estudiante` (`EstudianteId`),
  CONSTRAINT `ast_asistenciaclase_ibfk_3` FOREIGN KEY (`MarcadoPor`) REFERENCES `idn_persona` (`PersonaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_asistenciaclase`
--

LOCK TABLES `ast_asistenciaclase` WRITE;
/*!40000 ALTER TABLE `ast_asistenciaclase` DISABLE KEYS */;
INSERT INTO `ast_asistenciaclase` VALUES ('0949006e-b7bb-11f0-94fa-902e161e1951','50f2c73d-b7b8-11f0-94fa-902e161e1951','estu01-0000-0000-0000-000000000000','ausente','2025-11-02 07:10:39','prof01-0000-0000-0000-000000000000',NULL),('1f1e4cab-b7bb-11f0-94fa-902e161e1951','50f2c73d-b7b8-11f0-94fa-902e161e1951','estu01-0000-0000-0000-000000000000','ausente','2025-11-02 07:11:15','prof01-0000-0000-0000-000000000000',NULL),('asis01-0000-0000-0000-000000000000','ses01-0000-0000-0000-000000000000','estu01-0000-0000-0000-000000000000','Presente','2025-11-02 01:34:54','22222222-2222-2222-2222-222222222222',NULL);
/*!40000 ALTER TABLE `ast_asistenciaclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_eventoacceso`
--

DROP TABLE IF EXISTS `ast_eventoacceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_eventoacceso` (
  `EventoId` bigint NOT NULL AUTO_INCREMENT,
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CredencialId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PuntoAccesoId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Direccion` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EventoId`),
  KEY `PersonaId` (`PersonaId`),
  KEY `CredencialId` (`CredencialId`),
  KEY `PuntoAccesoId` (`PuntoAccesoId`),
  KEY `IX_EventoAcceso_FechaHora` (`FechaHora`),
  CONSTRAINT `ast_eventoacceso_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `idn_persona` (`PersonaId`),
  CONSTRAINT `ast_eventoacceso_ibfk_2` FOREIGN KEY (`CredencialId`) REFERENCES `idn_credencial` (`CredencialId`),
  CONSTRAINT `ast_eventoacceso_ibfk_3` FOREIGN KEY (`PuntoAccesoId`) REFERENCES `ast_puntoacceso` (`PuntoAccesoId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_eventoacceso`
--

LOCK TABLES `ast_eventoacceso` WRITE;
/*!40000 ALTER TABLE `ast_eventoacceso` DISABLE KEYS */;
INSERT INTO `ast_eventoacceso` VALUES (1,'11111111-1111-1111-1111-111111111111','aaa11111-aaaa-aaaa-aaaa-aaaaaaaaaaaa','punto01-0000-0000-0000-000000000000','2025-11-01 23:34:54','Entrada'),(2,'11111111-1111-1111-1111-111111111111','aaa11111-aaaa-aaaa-aaaa-aaaaaaaaaaaa','punto01-0000-0000-0000-000000000000','2025-11-02 01:34:54','Salida');
/*!40000 ALTER TABLE `ast_eventoacceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_eventovehicular`
--

DROP TABLE IF EXISTS `ast_eventovehicular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_eventovehicular` (
  `EventoVehicularId` bigint NOT NULL AUTO_INCREMENT,
  `VehiculoId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PuntoAccesoId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Direccion` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EventoVehicularId`),
  KEY `VehiculoId` (`VehiculoId`),
  KEY `PuntoAccesoId` (`PuntoAccesoId`),
  CONSTRAINT `ast_eventovehicular_ibfk_1` FOREIGN KEY (`VehiculoId`) REFERENCES `ast_vehiculo` (`VehiculoId`),
  CONSTRAINT `ast_eventovehicular_ibfk_2` FOREIGN KEY (`PuntoAccesoId`) REFERENCES `ast_puntoacceso` (`PuntoAccesoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_eventovehicular`
--

LOCK TABLES `ast_eventovehicular` WRITE;
/*!40000 ALTER TABLE `ast_eventovehicular` DISABLE KEYS */;
INSERT INTO `ast_eventovehicular` VALUES (1,'veh01-0000-0000-0000-000000000000','punto02-0000-0000-0000-000000000000','2025-11-02 00:34:54','Entrada');
/*!40000 ALTER TABLE `ast_eventovehicular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_objetovalor`
--

DROP TABLE IF EXISTS `ast_objetovalor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_objetovalor` (
  `ObjetoId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `PresenciaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TipoObjeto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FotoRuta` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ValidadoSalida` tinyint(1) NOT NULL DEFAULT '0',
  `ValidadoPor` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ObjetoId`),
  KEY `PresenciaId` (`PresenciaId`),
  KEY `ValidadoPor` (`ValidadoPor`),
  CONSTRAINT `ast_objetovalor_ibfk_1` FOREIGN KEY (`PresenciaId`) REFERENCES `ast_presenciacampus` (`PresenciaId`),
  CONSTRAINT `ast_objetovalor_ibfk_2` FOREIGN KEY (`ValidadoPor`) REFERENCES `idn_persona` (`PersonaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_objetovalor`
--

LOCK TABLES `ast_objetovalor` WRITE;
/*!40000 ALTER TABLE `ast_objetovalor` DISABLE KEYS */;
INSERT INTO `ast_objetovalor` VALUES ('obj01-0000-0000-0000-000000000000','pres01-0000-0000-0000-000000000000','Laptop','Dell XPS 13',NULL,1,NULL);
/*!40000 ALTER TABLE `ast_objetovalor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_presenciacampus`
--

DROP TABLE IF EXISTS `ast_presenciacampus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_presenciacampus` (
  `PresenciaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ingreso` timestamp NOT NULL,
  `Egreso` timestamp NULL DEFAULT NULL,
  `Estado` int NOT NULL,
  PRIMARY KEY (`PresenciaId`),
  KEY `PersonaId` (`PersonaId`),
  CONSTRAINT `ast_presenciacampus_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `idn_persona` (`PersonaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_presenciacampus`
--

LOCK TABLES `ast_presenciacampus` WRITE;
/*!40000 ALTER TABLE `ast_presenciacampus` DISABLE KEYS */;
INSERT INTO `ast_presenciacampus` VALUES ('pres01-0000-0000-0000-000000000000','11111111-1111-1111-1111-111111111111','2025-11-01 23:34:54','2025-11-02 01:34:54',1);
/*!40000 ALTER TABLE `ast_presenciacampus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_puntoacceso`
--

DROP TABLE IF EXISTS `ast_puntoacceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_puntoacceso` (
  `PuntoAccesoId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `Nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PuntoAccesoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_puntoacceso`
--

LOCK TABLES `ast_puntoacceso` WRITE;
/*!40000 ALTER TABLE `ast_puntoacceso` DISABLE KEYS */;
INSERT INTO `ast_puntoacceso` VALUES ('punto01-0000-0000-0000-000000000000','Puerta Principal','Peatonal'),('punto02-0000-0000-0000-000000000000','Parqueadero Norte','Vehicular');
/*!40000 ALTER TABLE `ast_puntoacceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_sesionclase`
--

DROP TABLE IF EXISTS `ast_sesionclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_sesionclase` (
  `SesionId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `ClaseId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha` date NOT NULL,
  `HoraInicio` time NOT NULL,
  `HoraFin` time NOT NULL,
  `Estado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Programada',
  PRIMARY KEY (`SesionId`),
  KEY `ClaseId` (`ClaseId`),
  CONSTRAINT `ast_sesionclase_ibfk_1` FOREIGN KEY (`ClaseId`) REFERENCES `aca_clase` (`ClaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_sesionclase`
--

LOCK TABLES `ast_sesionclase` WRITE;
/*!40000 ALTER TABLE `ast_sesionclase` DISABLE KEYS */;
INSERT INTO `ast_sesionclase` VALUES ('0f7a203f-b7b8-11f0-94fa-902e161e1951','clase01-0000-0000-0000-000000000000','2025-11-01','00:40:00','00:50:00','Ausente'),('50f2c73d-b7b8-11f0-94fa-902e161e1951','clase01-0000-0000-0000-000000000000','2025-11-02','00:50:00','01:50:00','Activa'),('a00593b9-b7b1-11f0-94fa-902e161e1951','clase01-0000-0000-0000-000000000000','2025-11-01','00:02:00','00:10:00','Ausente'),('ses01-0000-0000-0000-000000000000','clase01-0000-0000-0000-000000000000','2025-11-01','08:00:00','10:00:00','Completada'),('ses02-0000-0000-0000-000000000000','clase01-0000-0000-0000-000000000000','2025-11-01','23:29:00','23:30:00','Completada');
/*!40000 ALTER TABLE `ast_sesionclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ast_vehiculo`
--

DROP TABLE IF EXISTS `ast_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ast_vehiculo` (
  `VehiculoId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Placa` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`VehiculoId`),
  UNIQUE KEY `Placa` (`Placa`),
  KEY `PersonaId` (`PersonaId`),
  CONSTRAINT `ast_vehiculo_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `idn_persona` (`PersonaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ast_vehiculo`
--

LOCK TABLES `ast_vehiculo` WRITE;
/*!40000 ALTER TABLE `ast_vehiculo` DISABLE KEYS */;
INSERT INTO `ast_vehiculo` VALUES ('veh01-0000-0000-0000-000000000000','33333333-3333-3333-3333-333333333333','ABC123');
/*!40000 ALTER TABLE `ast_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aud_log`
--

DROP TABLE IF EXISTS `aud_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aud_log` (
  `LogId` bigint NOT NULL AUTO_INCREMENT,
  `UsuarioId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Accion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Detalles` text COLLATE utf8mb4_unicode_ci,
  `FechaHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogId`),
  KEY `UsuarioId` (`UsuarioId`),
  CONSTRAINT `aud_log_ibfk_1` FOREIGN KEY (`UsuarioId`) REFERENCES `idn_persona` (`PersonaId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aud_log`
--

LOCK TABLES `aud_log` WRITE;
/*!40000 ALTER TABLE `aud_log` DISABLE KEYS */;
INSERT INTO `aud_log` VALUES (1,'33333333-3333-3333-3333-333333333333','Inicio de sesi√≥n','Usuario administrador ingres√≥ al sistema.','2025-11-02 01:34:54'),(2,'22222222-2222-2222-2222-222222222222','Registro de asistencia','Profesor marc√≥ asistencia de clase 2025-I.','2025-11-02 01:34:54');
/*!40000 ALTER TABLE `aud_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cal_justificacion`
--

DROP TABLE IF EXISTS `cal_justificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cal_justificacion` (
  `JustificacionId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `Motivo` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DocumentoAdjuntoRuta` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AprobadoPor` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AprobadoEl` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`JustificacionId`),
  KEY `PersonaId` (`PersonaId`),
  KEY `AprobadoPor` (`AprobadoPor`),
  CONSTRAINT `cal_justificacion_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `idn_persona` (`PersonaId`),
  CONSTRAINT `cal_justificacion_ibfk_2` FOREIGN KEY (`AprobadoPor`) REFERENCES `idn_persona` (`PersonaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cal_justificacion`
--

LOCK TABLES `cal_justificacion` WRITE;
/*!40000 ALTER TABLE `cal_justificacion` DISABLE KEYS */;
INSERT INTO `cal_justificacion` VALUES ('just01-0000-0000-0000-000000000000','11111111-1111-1111-1111-111111111111','2025-10-30','2025-10-31','Asistencia a cita m√©dica',NULL,'Aprobada',NULL,NULL);
/*!40000 ALTER TABLE `cal_justificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idn_credencial`
--

DROP TABLE IF EXISTS `idn_credencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idn_credencial` (
  `CredencialId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `QrToken` varbinary(64) NOT NULL,
  `Salt` varbinary(16) NOT NULL,
  `EmitidaEl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RevocadaEl` timestamp NULL DEFAULT NULL,
  `Activa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CredencialId`),
  KEY `PersonaId` (`PersonaId`),
  CONSTRAINT `idn_credencial_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `idn_persona` (`PersonaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idn_credencial`
--

LOCK TABLES `idn_credencial` WRITE;
/*!40000 ALTER TABLE `idn_credencial` DISABLE KEYS */;
INSERT INTO `idn_credencial` VALUES ('aaa11111-aaaa-aaaa-aaaa-aaaaaaaaaaaa','11111111-1111-1111-1111-111111111111',_binary '¯ãƒÜChvèVˇë≠ZWr©ä->I\√©\Ê2qﬂ°\‚\‡v)F°õ\rO\n\Îsaıâ‹ùåkKÑPû\·',_binary 'Y¨¶zzu{–ä®T?6ü\‘\·','2025-11-02 01:34:54',NULL,1),('aaa22222-aaaa-aaaa-aaaa-aaaaaaaaaaaa','22222222-2222-2222-2222-222222222222',_binary ']\ =L\ÏO?ºqX≠É¿hs°ı∫±!\Â¶˛\0˛©í êy\„pï≤∞|Çª6uE@d≠A9=≥8§ó˚˘M©',_binary 'J\Zl¿z|%\ŒWmVªU{','2025-11-02 01:34:54',NULL,1),('aaa33333-aaaa-aaaa-aaaa-aaaaaaaaaaaa','33333333-3333-3333-3333-333333333333',_binary '™Ö¯(\ËZ\"\Ôo)\Áå	®ı±+onÜ/¶ó.¿\⁄c\Zı\Ì\„©Å¿\ I`∫¡\Ìö\Ô0n_	*ù˚ëØ˜±AAB\Ï',_binary '{\◊:5¡;d\≈—†\»[\Óˇ','2025-11-02 01:34:54',NULL,1),('aaa44444-aaaa-aaaa-aaaa-aaaaaaaaaaaa','44444444-4444-4444-4444-444444444444',_binary '\«\r|x#MI¥=\Î[ê9(ç˛Ñ$ó˘’∞	\Ê%˙g˝\’\nì2∂2ä±ˆîm\”Qù¿]\ﬁ€êΩç4£\‰\⁄Ga\"ìKí',_binary '\—\À\ \\\ÓÿØ9¿è¶t\¬\Ì','2025-11-02 01:34:54',NULL,1),('aaa55555-aaaa-aaaa-aaaa-aaaaaaaaaaaa','55555555-5555-5555-5555-555555555555',_binary '≠u´´\≈\–˚µ/©\‰K™€¨1D§k4lyâMú£B”ë]\ k$BÙ\'2\n\Ï_†õ\Èá\0pO•∫ÙÒ?∏J\÷y¿≠\Ã)éù',_binary 'º\ &K	ñ\0}®\À$≤d2','2025-11-02 01:34:54',NULL,1);
/*!40000 ALTER TABLE `idn_credencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idn_persona`
--

DROP TABLE IF EXISTS `idn_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idn_persona` (
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `PrimerNombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SegundoNombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PrimerApellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SegundoApellido` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cedula` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Carnet` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Categoria` int NOT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PersonaId`),
  UNIQUE KEY `Cedula` (`Cedula`),
  UNIQUE KEY `Carnet` (`Carnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idn_persona`
--

LOCK TABLES `idn_persona` WRITE;
/*!40000 ALTER TABLE `idn_persona` DISABLE KEYS */;
INSERT INTO `idn_persona` VALUES ('11111111-1111-1111-1111-111111111111','Carlos','Eduardo','P√©rez','Gonz√°lez','0102030405','C001',1,1),('22222222-2222-2222-2222-222222222222','Mar√≠a','Elena','Torres','Ram√≠rez','0203040506','C002',2,1),('33333333-3333-3333-3333-333333333333','Jorge',NULL,'Mart√≠nez','L√≥pez','0304050607','C003',3,1),('44444444-4444-4444-4444-444444444444','Luc√≠a',NULL,'Vega','Salazar','0405060708','C004',1,1),('55555555-5555-5555-5555-555555555555','Andr√©s','Felipe','Moreno','Cruz','0506070809','C005',2,1),('prof01-0000-0000-0000-000000000000','juan','caballo','rompe','anos','0506070807','C006',1,1);
/*!40000 ALTER TABLE `idn_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rpt_horascolaboradordia`
--

DROP TABLE IF EXISTS `rpt_horascolaboradordia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpt_horascolaboradordia` (
  `ReporteId` bigint NOT NULL AUTO_INCREMENT,
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha` date NOT NULL,
  `HorasEnCampus` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ReporteId`),
  UNIQUE KEY `UQ_ReporteColaboradorDia` (`PersonaId`,`Fecha`),
  CONSTRAINT `rpt_horascolaboradordia_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `idn_persona` (`PersonaId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpt_horascolaboradordia`
--

LOCK TABLES `rpt_horascolaboradordia` WRITE;
/*!40000 ALTER TABLE `rpt_horascolaboradordia` DISABLE KEYS */;
INSERT INTO `rpt_horascolaboradordia` VALUES (1,'33333333-3333-3333-3333-333333333333','2025-11-01',8.00);
/*!40000 ALTER TABLE `rpt_horascolaboradordia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rpt_horasprofesordia`
--

DROP TABLE IF EXISTS `rpt_horasprofesordia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpt_horasprofesordia` (
  `ReporteId` bigint NOT NULL AUTO_INCREMENT,
  `ProfesorId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fecha` date NOT NULL,
  `HorasProgramadas` decimal(5,2) NOT NULL,
  `HorasImpartidas` decimal(5,2) NOT NULL,
  `HorasEnCampus` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ReporteId`),
  UNIQUE KEY `UQ_ReporteProfesorDia` (`ProfesorId`,`Fecha`),
  CONSTRAINT `rpt_horasprofesordia_ibfk_1` FOREIGN KEY (`ProfesorId`) REFERENCES `aca_profesor` (`ProfesorId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rpt_horasprofesordia`
--

LOCK TABLES `rpt_horasprofesordia` WRITE;
/*!40000 ALTER TABLE `rpt_horasprofesordia` DISABLE KEYS */;
INSERT INTO `rpt_horasprofesordia` VALUES (1,'prof01-0000-0000-0000-000000000000','2025-11-01',4.00,3.50,4.00);
/*!40000 ALTER TABLE `rpt_horasprofesordia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_permiso`
--

DROP TABLE IF EXISTS `sec_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sec_permiso` (
  `PermisoId` int NOT NULL AUTO_INCREMENT,
  `NombrePermiso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PermisoId`),
  UNIQUE KEY `NombrePermiso` (`NombrePermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_permiso`
--

LOCK TABLES `sec_permiso` WRITE;
/*!40000 ALTER TABLE `sec_permiso` DISABLE KEYS */;
INSERT INTO `sec_permiso` VALUES (3,'gestionar:usuarios'),(2,'registrar:asistencia'),(1,'ver:dashboard-profesor');
/*!40000 ALTER TABLE `sec_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_rol`
--

DROP TABLE IF EXISTS `sec_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sec_rol` (
  `RolId` int NOT NULL AUTO_INCREMENT,
  `NombreRol` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RolId`),
  UNIQUE KEY `NombreRol` (`NombreRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_rol`
--

LOCK TABLES `sec_rol` WRITE;
/*!40000 ALTER TABLE `sec_rol` DISABLE KEYS */;
INSERT INTO `sec_rol` VALUES (3,'Administrador'),(2,'Estudiante'),(1,'Profesor');
/*!40000 ALTER TABLE `sec_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_rolpermiso`
--

DROP TABLE IF EXISTS `sec_rolpermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sec_rolpermiso` (
  `RolPermisoId` bigint NOT NULL AUTO_INCREMENT,
  `RolId` int NOT NULL,
  `PermisoId` int NOT NULL,
  PRIMARY KEY (`RolPermisoId`),
  UNIQUE KEY `UQ_RolPermiso` (`RolId`,`PermisoId`),
  KEY `PermisoId` (`PermisoId`),
  CONSTRAINT `sec_rolpermiso_ibfk_1` FOREIGN KEY (`RolId`) REFERENCES `sec_rol` (`RolId`),
  CONSTRAINT `sec_rolpermiso_ibfk_2` FOREIGN KEY (`PermisoId`) REFERENCES `sec_permiso` (`PermisoId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_rolpermiso`
--

LOCK TABLES `sec_rolpermiso` WRITE;
/*!40000 ALTER TABLE `sec_rolpermiso` DISABLE KEYS */;
INSERT INTO `sec_rolpermiso` VALUES (1,1,1),(2,1,2),(3,3,3);
/*!40000 ALTER TABLE `sec_rolpermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_usuariorol`
--

DROP TABLE IF EXISTS `sec_usuariorol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sec_usuariorol` (
  `UsuarioRolId` bigint NOT NULL AUTO_INCREMENT,
  `PersonaId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RolId` int NOT NULL,
  PRIMARY KEY (`UsuarioRolId`),
  UNIQUE KEY `UQ_UsuarioRol` (`PersonaId`,`RolId`),
  KEY `RolId` (`RolId`),
  CONSTRAINT `sec_usuariorol_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `idn_persona` (`PersonaId`),
  CONSTRAINT `sec_usuariorol_ibfk_2` FOREIGN KEY (`RolId`) REFERENCES `sec_rol` (`RolId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_usuariorol`
--

LOCK TABLES `sec_usuariorol` WRITE;
/*!40000 ALTER TABLE `sec_usuariorol` DISABLE KEYS */;
INSERT INTO `sec_usuariorol` VALUES (2,'11111111-1111-1111-1111-111111111111',2),(1,'22222222-2222-2222-2222-222222222222',1),(3,'33333333-3333-3333-3333-333333333333',3);
/*!40000 ALTER TABLE `sec_usuariorol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 13:28:20
