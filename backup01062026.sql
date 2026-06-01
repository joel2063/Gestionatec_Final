-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: GESTION
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ASISTENCIA`
--

DROP TABLE IF EXISTS `ASISTENCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASISTENCIA` (
  `id_asistencia` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `entrada_matutina` time DEFAULT NULL,
  `salida_matutina` time DEFAULT NULL,
  `entrada_vespertina` time DEFAULT NULL,
  `salida_vespertina` time DEFAULT NULL,
  `estado_asistencia` enum('PRESENTE','ATRASADO','FALTA') DEFAULT NULL,
  `id_empleado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `ASISTENCIA_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `EMPLEADO` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASISTENCIA`
--

LOCK TABLES `ASISTENCIA` WRITE;
/*!40000 ALTER TABLE `ASISTENCIA` DISABLE KEYS */;
INSERT INTO `ASISTENCIA` VALUES ('ASI001','2025-05-04','08:15:00','12:05:00','13:12:00','18:00:00','ATRASADO','EMP001'),('ASI002','2025-05-04','08:00:00','12:05:00','13:00:00','18:05:00','PRESENTE','EMP002'),('ASI003','2025-05-01','08:10:00','12:05:00','13:05:00','18:00:00','ATRASADO','EMP003'),('ASI004','2025-05-01','08:05:00','12:05:00','13:05:00','18:05:00','PRESENTE','EMP004'),('ASI005','2025-05-04',NULL,NULL,NULL,NULL,'FALTA','EMP005'),('ASI006','2025-05-05','07:10:00','11:00:00','12:00:00','16:00:00','ATRASADO','EMP006'),('ASI007','2025-05-05','09:00:00','13:00:00','14:00:00','18:00:00','PRESENTE','EMP007'),('ASI008','2025-05-06','06:30:00','10:30:00','11:30:00','15:30:00','PRESENTE','EMP008'),('ASI009','2025-05-06','08:20:00','12:00:00','13:00:00','17:00:00','ATRASADO','EMP009'),('ASI010','2025-05-07',NULL,NULL,NULL,NULL,'FALTA','EMP010');
/*!40000 ALTER TABLE `ASISTENCIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARGO`
--

DROP TABLE IF EXISTS `CARGO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARGO` (
  `id_cargo` varchar(50) NOT NULL,
  `nombre_cargo` varchar(100) NOT NULL,
  `sueldo` double NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARGO`
--

LOCK TABLES `CARGO` WRITE;
/*!40000 ALTER TABLE `CARGO` DISABLE KEYS */;
INSERT INTO `CARGO` VALUES ('CAR001','Gerente',1200.5),('CAR002','Supervisor',950.75),('CAR003','Contador',850),('CAR004','Secretaria',700.25),('CAR005','Cajero',650),('CAR006','Recepcionista',600),('CAR007','Tecnico',750),('CAR008','Vendedor',680),('CAR009','Mensajero',550),('CAR010','Asistente',620);
/*!40000 ALTER TABLE `CARGO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DESCUENTO`
--

DROP TABLE IF EXISTS `DESCUENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DESCUENTO` (
  `id_descuento` varchar(50) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `tipo` enum('HORAS','DIA') NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `id_asistencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_descuento`),
  KEY `id_asistencia` (`id_asistencia`),
  CONSTRAINT `DESCUENTO_ibfk_1` FOREIGN KEY (`id_asistencia`) REFERENCES `ASISTENCIA` (`id_asistencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DESCUENTO`
--

LOCK TABLES `DESCUENTO` WRITE;
/*!40000 ALTER TABLE `DESCUENTO` DISABLE KEYS */;
INSERT INTO `DESCUENTO` VALUES ('DES001','Atraso matutino','HORAS',5,'2025-05-01','ASI003'),('DES002','Falta completa','DIA',20,'2025-05-04','ASI005'),('DES003','Atraso matutino','HORAS',4.5,'2025-05-05','ASI006'),('DES004','Atraso vespertino','HORAS',2.5,'2025-05-05','ASI007'),('DES005','Atraso matutino','HORAS',5,'2025-05-06','ASI008'),('DES006','Atraso matutino','HORAS',3,'2025-05-06','ASI009'),('DES007','Falta completa','DIA',20,'2025-05-07','ASI010');
/*!40000 ALTER TABLE `DESCUENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLEADO`
--

DROP TABLE IF EXISTS `EMPLEADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLEADO` (
  `id_empleado` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `id_usuario` varchar(50) NOT NULL,
  `id_horario` varchar(50) NOT NULL,
  `id_cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `cedula` (`cedula`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_horario` (`id_horario`),
  KEY `id_cargo` (`id_cargo`),
  CONSTRAINT `EMPLEADO_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `USUARIO` (`id_usuario`),
  CONSTRAINT `EMPLEADO_ibfk_2` FOREIGN KEY (`id_horario`) REFERENCES `HORARIO` (`id_horario`),
  CONSTRAINT `EMPLEADO_ibfk_3` FOREIGN KEY (`id_cargo`) REFERENCES `CARGO` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLEADO`
--

LOCK TABLES `EMPLEADO` WRITE;
/*!40000 ALTER TABLE `EMPLEADO` DISABLE KEYS */;
INSERT INTO `EMPLEADO` VALUES ('EMP001','Juan Perez','1101111111','0991111111','USR003','HOR-001','CAR001'),('EMP002','Maria Lopez','1102222222','0992222222','USR004','HOR-001','CAR002'),('EMP003','Carlos Ramirez','1103333333','0993333333','USR005','HOR-001','CAR003'),('EMP004','Ana Torres','1104444444','0994444444','USR006','HOR-001','CAR004'),('EMP005','Luis Mendoza','1105555555','0995555555','USR007','HOR-001','CAR005'),('EMP006','Pedro Castillo','1106666666','0996666666','USR008','HOR-001','CAR006'),('EMP007','Sofia Herrera','1107777777','0997777777','USR009','HOR-001','CAR007'),('EMP008','Diego Morales','1108888888','0998888888','USR010','HOR-001','CAR008'),('EMP009','Valeria Suarez','1109999999','0999999999','USR011','HOR-001','CAR009'),('EMP010','Andres Villacis','1100000000','0990000000','USR012','HOR-001','CAR010');
/*!40000 ALTER TABLE `EMPLEADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HORARIO`
--

DROP TABLE IF EXISTS `HORARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HORARIO` (
  `id_horario` varchar(50) NOT NULL,
  `entrada_matutina` time NOT NULL,
  `salida_matutina` time NOT NULL,
  `entrada_vespertina` time NOT NULL,
  `salida_vespertina` time NOT NULL,
  PRIMARY KEY (`id_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HORARIO`
--

LOCK TABLES `HORARIO` WRITE;
/*!40000 ALTER TABLE `HORARIO` DISABLE KEYS */;
INSERT INTO `HORARIO` VALUES ('HOR-001','08:05:00','12:05:00','13:05:00','18:05:00');
/*!40000 ALTER TABLE `HORARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HORASEXTRA`
--

DROP TABLE IF EXISTS `HORASEXTRA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HORASEXTRA` (
  `id_horaextra` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio_extra` time NOT NULL,
  `hora_fin_extra` time NOT NULL,
  `id_asistencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_horaextra`),
  KEY `id_asistencia` (`id_asistencia`),
  CONSTRAINT `HORASEXTRA_ibfk_1` FOREIGN KEY (`id_asistencia`) REFERENCES `ASISTENCIA` (`id_asistencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HORASEXTRA`
--

LOCK TABLES `HORASEXTRA` WRITE;
/*!40000 ALTER TABLE `HORASEXTRA` DISABLE KEYS */;
INSERT INTO `HORASEXTRA` VALUES ('HEX001','2025-05-01','18:10:00','20:10:00','ASI003'),('HEX002','2025-05-01','18:05:00','19:05:00','ASI004'),('HEX003','2025-05-04','18:15:00','21:15:00','ASI005'),('HEX004','2025-05-05','16:05:00','18:05:00','ASI006'),('HEX005','2025-05-05','18:00:00','20:00:00','ASI007'),('HEX006','2025-05-06','15:30:00','17:30:00','ASI008'),('HEX007','2025-05-06','17:00:00','19:00:00','ASI009'),('HEX008','2025-05-07','18:00:00','21:00:00','ASI010');
/*!40000 ALTER TABLE `HORASEXTRA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JUSTIFICACION`
--

DROP TABLE IF EXISTS `JUSTIFICACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JUSTIFICACION` (
  `id_justificacion` varchar(50) NOT NULL,
  `tipo_justificacion` enum('ATRASO','FALTA') NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `horas_justificadas` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `id_asistencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_justificacion`),
  UNIQUE KEY `id_asistencia` (`id_asistencia`),
  CONSTRAINT `JUSTIFICACION_ibfk_1` FOREIGN KEY (`id_asistencia`) REFERENCES `ASISTENCIA` (`id_asistencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JUSTIFICACION`
--

LOCK TABLES `JUSTIFICACION` WRITE;
/*!40000 ALTER TABLE `JUSTIFICACION` DISABLE KEYS */;
INSERT INTO `JUSTIFICACION` VALUES ('JUS001','FALTA','Consulta medica',8,'2025-05-04','ASI005'),('JUS002','ATRASO','Problemas de transporte',2,'2025-05-04','ASI003'),('JUS003','ATRASO','Trafico vehicular',1,'2025-05-01','ASI001'),('JUS004','ATRASO','Accidente de transito',1,'2025-05-05','ASI006'),('JUS005','ATRASO','Cita medica familiar',1,'2025-05-06','ASI009'),('JUS006','FALTA','Enfermedad con certificado',8,'2025-05-07','ASI010'),('JUS007','ATRASO','Corte de agua en domicilio',1,'2025-05-05','ASI007'),('JUS008','ATRASO','Lluvia intensa',1,'2025-05-06','ASI008');
/*!40000 ALTER TABLE `JUSTIFICACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPORTE`
--

DROP TABLE IF EXISTS `REPORTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REPORTE` (
  `id_reporte` varchar(50) NOT NULL,
  `total_horas` int NOT NULL DEFAULT '0',
  `total_horas_extra` int NOT NULL DEFAULT '0',
  `total_atrasos` int NOT NULL DEFAULT '0',
  `total_descuento` double NOT NULL DEFAULT '0',
  `sueldo_final` double NOT NULL DEFAULT '0',
  `mes` int NOT NULL,
  `anio` int NOT NULL,
  `fecha_generacion` date NOT NULL,
  `id_empleado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_reporte`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `REPORTE_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `EMPLEADO` (`id_empleado`),
  CONSTRAINT `REPORTE_chk_1` CHECK ((`mes` between 1 and 12))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPORTE`
--

LOCK TABLES `REPORTE` WRITE;
/*!40000 ALTER TABLE `REPORTE` DISABLE KEYS */;
INSERT INTO `REPORTE` VALUES ('REP001',160,2,1,5,1195.5,5,2025,'2025-05-31','EMP001'),('REP002',160,1,0,0,950.75,5,2025,'2025-05-31','EMP002'),('REP003',160,2,1,5,845,5,2025,'2025-05-31','EMP003'),('REP004',160,1,0,0,700.25,5,2025,'2025-05-31','EMP004'),('REP005',152,3,0,20,630,5,2025,'2025-05-31','EMP005'),('REP006',159,2,1,4.5,595.5,5,2025,'2025-05-31','EMP006'),('REP007',160,2,0,2.5,747.5,5,2025,'2025-05-31','EMP007'),('REP008',160,2,0,5,745,5,2025,'2025-05-31','EMP008'),('REP009',159,2,1,3,547,5,2025,'2025-05-31','EMP009'),('REP010',152,3,0,20,530,5,2025,'2025-05-31','EMP010');
/*!40000 ALTER TABLE `REPORTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `id_usuario` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `rol` enum('ADMIN','EMPLEADO') NOT NULL,
  `EDAD` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES ('USR001','admin1@gmail.com','admin123','ADMIN',18),('USR002','admin2@gmail.com','admin456','ADMIN',0),('USR003','juan@gmail.com','juan123','EMPLEADO',0),('USR004','maria@gmail.com','maria123','EMPLEADO',0),('USR005','carlos@gmail.com','carlos123','EMPLEADO',0),('USR006','ana@gmail.com','ana123','EMPLEADO',0),('USR007','luis@gmail.com','luis123','EMPLEADO',0),('USR008','pedro@gmail.com','pedro123','EMPLEADO',0),('USR009','sofia@gmail.com','sofia123','EMPLEADO',0),('USR010','diego@gmail.com','diego123','EMPLEADO',0),('USR011','valeria@gmail.com','valeria123','EMPLEADO',0),('USR012','andres@gmail.com','andres123','EMPLEADO',0),('USR013','joeltene@gmail.com','joel123','EMPLEADO',0);
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-01 10:53:10
