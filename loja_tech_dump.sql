CREATE DATABASE  IF NOT EXISTS `loja_tech` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `loja_tech`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: loja_tech
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Notebooks','Notebooks e laptops',1,'2026-11-24 18:00:52'),(2,'Smartphones','Celulares e smartphones',1,'2026-11-24 18:00:52'),(3,'Periféricos','Teclados, mouses, headsets',1,'2026-11-24 18:00:52'),(4,'Monitores','Monitores e telas',1,'2026-11-24 18:00:52'),(5,'Armazenamento','HDs, SSDs e pen drives',1,'2026-11-24 18:00:52'),(6,'Redes e Wi-Fi','Roteadores, switches e cabos de rede',1,'2026-11-24 18:33:50'),(7,'Redes e Wi-Fi','Roteadores, switches e cabos de rede',1,'2026-11-24 18:33:59'),(8,'Redes e Wi-Fi','Roteadores, switches e cabos de rede',1,'2026-11-24 19:15:03'),(9,'Redes e Wi-Fi','Roteadores, switches e cabos de rede',1,'2026-11-24 19:15:37'),(10,'Redes e Wi-Fi','Roteadores, switches e cabos de rede',1,'2026-11-24 19:16:10');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `cpf` char(11) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Silva','ana.silva@email.com','12345678901','11999998888','1995-03-15',1,'2026-11-24 18:00:52'),(2,'Bruno Oliveira','bruno.oliveira@email.com','23456789012','11976543210','1990-07-22',1,'2026-11-24 18:00:52'),(3,'Carla Santos','carla.santos@email.com','34567890123','21965432109','1988-11-08',1,'2026-11-24 18:00:52'),(4,'Daniel Costa','daniel.costa@email.com','45678901234','31954321098','2000-01-30',1,'2026-11-24 18:00:52'),(5,'Elena Ferreira','elena.ferreira@email.com','56789012345','41943210987','1998-06-12',1,'2026-11-24 18:00:52');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL DEFAULT '1',
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS ((`quantidade` * `preco_unitario`)) STORED,
  PRIMARY KEY (`id_item`),
  KEY `fk_item_pedido` (`id_pedido`),
  KEY `fk_item_produto` (`id_produto`),
  CONSTRAINT `fk_item_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `fk_item_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` (`id_item`, `id_pedido`, `id_produto`, `quantidade`, `preco_unitario`) VALUES (1,1,1,1,3499.90),(2,1,5,1,249.90),(3,2,3,1,4299.00),(4,3,6,1,349.90),(5,3,5,3,249.90),(6,4,4,1,6499.00),(7,5,5,1,249.90);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_operacoes`
--

DROP TABLE IF EXISTS `log_operacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_operacoes` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tabela_afetada` varchar(100) DEFAULT NULL,
  `operacao` varchar(50) DEFAULT NULL,
  `descricao` text,
  `usuario` varchar(100) DEFAULT (current_user()),
  `data_operacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_operacoes`
--

LOCK TABLES `log_operacoes` WRITE;
/*!40000 ALTER TABLE `log_operacoes` DISABLE KEYS */;
INSERT INTO `log_operacoes` VALUES (1,'produtos','UPDATE_PRECO','Reajuste de 10.00% na categoria ID 3 (3 produtos afetados).','root@localhost','2026-11-24 18:34:46');
/*!40000 ALTER TABLE `log_operacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `data_pedido` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pendente','processando','enviado','entregue','cancelado') DEFAULT 'pendente',
  `valor_total` decimal(10,2) DEFAULT '0.00',
  `observacao` text,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente` (`id_cliente`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2026-11-24 18:00:52','entregue',3749.80,NULL,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(2,2,'2026-11-24 18:00:52','enviado',4299.00,NULL,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(3,3,'2026-11-24 18:00:52','pendente',1099.70,NULL,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(4,1,'2026-11-24 18:00:52','processando',6499.00,NULL,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(5,4,'2026-11-24 18:00:52','cancelado',249.90,NULL,'2026-11-24 18:00:52','2026-11-24 18:00:52');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `nome` varchar(200) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int NOT NULL DEFAULT '0',
  `estoque_minimo` int NOT NULL DEFAULT '5',
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produto`),
  KEY `fk_produto_categoria` (`id_categoria`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,1,'Notebook Dell Inspiron 15',NULL,3599.00,25,5,1,'2026-11-24 18:00:52','2026-11-24 18:43:40'),(2,1,'Notebook Lenovo IdeaPad 3',NULL,2899.00,18,5,1,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(3,2,'Samsung Galaxy S24',NULL,4299.00,40,10,1,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(4,2,'iPhone 15',NULL,6499.00,15,5,1,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(5,3,'Teclado Mecânico Redragon',NULL,274.89,60,10,1,'2026-11-24 18:00:52','2026-11-24 18:34:46'),(6,3,'Mouse Logitech G502',NULL,384.89,45,10,1,'2026-11-24 18:00:52','2026-11-24 18:34:46'),(7,3,'Headset HyperX Cloud II',NULL,549.89,30,8,1,'2026-11-24 18:00:52','2026-11-24 18:34:46'),(8,4,'Monitor LG UltraWide 29\"',NULL,1599.00,12,3,1,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(9,4,'Monitor Samsung Curvo 27\"',NULL,1899.00,10,3,1,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(10,5,'SSD Kingston 480GB',NULL,219.90,80,15,1,'2026-11-24 18:00:52','2026-11-24 18:00:52'),(11,5,'HD Externo Seagate 1TB',NULL,329.90,35,8,1,'2026-11-24 18:00:52','2026-11-24 18:00:52');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_catalogo_vitrine`
--

DROP TABLE IF EXISTS `vw_catalogo_vitrine`;
/*!50001 DROP VIEW IF EXISTS `vw_catalogo_vitrine`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_catalogo_vitrine` AS SELECT 
 1 AS `codigo`,
 1 AS `titulo`,
 1 AS `valor_venda`,
 1 AS `saldo_disponivel`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_clientes_publico`
--

DROP TABLE IF EXISTS `vw_clientes_publico`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes_publico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes_publico` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nome`,
 1 AS `email`,
 1 AS `telefone`,
 1 AS `ativo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_detalhes_itens_vendidos`
--

DROP TABLE IF EXISTS `vw_detalhes_itens_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vw_detalhes_itens_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_detalhes_itens_vendidos` AS SELECT 
 1 AS `id_pedido`,
 1 AS `data_pedido`,
 1 AS `status`,
 1 AS `cliente`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `quantidade`,
 1 AS `preco_unitario`,
 1 AS `subtotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_gestao_precos_simples`
--

DROP TABLE IF EXISTS `vw_gestao_precos_simples`;
/*!50001 DROP VIEW IF EXISTS `vw_gestao_precos_simples`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_gestao_precos_simples` AS SELECT 
 1 AS `id_produto`,
 1 AS `nome`,
 1 AS `preco`,
 1 AS `ativo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_status_estoque_produtos`
--

DROP TABLE IF EXISTS `vw_status_estoque_produtos`;
/*!50001 DROP VIEW IF EXISTS `vw_status_estoque_produtos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_status_estoque_produtos` AS SELECT 
 1 AS `id_produto`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `preco`,
 1 AS `estoque`,
 1 AS `estoque_minimo`,
 1 AS `nivel_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'loja_tech'
--
/*!50003 DROP PROCEDURE IF EXISTS `atualizar_preco_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_preco_categoria`(
    IN p_id_categoria INT,
    IN p_percentual DECIMAL(5,2),
    OUT p_qtd_alterados INT,
    OUT p_mensagem VARCHAR(255)
)
BEGIN
    DECLARE v_categoria_existe INT DEFAULT 0;

    SELECT COUNT(*) INTO v_categoria_existe
    FROM categorias
    WHERE id_categoria = p_id_categoria;

    IF v_categoria_existe = 0 THEN
        SET p_qtd_alterados = 0;
        SET p_mensagem = 'ERRO: Categoria não encontrada.';
    ELSEIF p_percentual < -50.00 THEN
        SET p_qtd_alterados = 0;
        SET p_mensagem = 'ERRO: O desconto máximo permitido é de 50%.';
    ELSEIF p_percentual > 100.00 THEN
        SET p_qtd_alterados = 0;
        SET p_mensagem = 'ERRO: O aumento máximo permitido é de 100%.';
    ELSEIF p_percentual = 0 THEN
        SET p_qtd_alterados = 0;
        SET p_mensagem = 'AVISO: Percentual informado é 0%. Nenhum preço foi alterado.';
    ELSE
        UPDATE produtos
        SET preco = ROUND(preco * (1 + (p_percentual / 100)), 2)
        WHERE id_categoria = p_id_categoria AND ativo = TRUE;

        SET p_qtd_alterados = ROW_COUNT();
        SET p_mensagem = CONCAT('Sucesso! ', p_qtd_alterados, ' produto(s) atualizado(s).');

        INSERT INTO log_operacoes (tabela_afetada, operacao, descricao)
        VALUES (
            'produtos', 
            'UPDATE_PRECO', 
            CONCAT('Reajuste de ', p_percentual, '% na categoria ID ', p_id_categoria, ' (', p_qtd_alterados, ' produtos afetados).')
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `atualizar_telefone_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizar_telefone_cliente`(
    IN p_id_cliente INT,
    IN p_telefone VARCHAR(15)
)
BEGIN
    UPDATE clientes
    SET telefone = p_telefone
    WHERE id_cliente = p_id_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_pedidos_por_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_pedidos_por_status`(
    IN p_status VARCHAR(20)
)
BEGIN
    SELECT id_pedido, id_cliente, data_pedido, valor_total
    FROM pedidos
    WHERE status = p_status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_extrato_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_extrato_cliente`(
    IN p_id_cliente INT
)
BEGIN
    DECLARE v_cliente_existe INT DEFAULT 0;

    SELECT COUNT(*) INTO v_cliente_existe
    FROM clientes
    WHERE id_cliente = p_id_cliente;

    IF v_cliente_existe = 0 THEN
        SELECT 'ERRO: Cliente não encontrado na base de dados.' AS mensagem_erro;
    ELSE
        -- Result Set 1: Dados do cliente
        SELECT nome, email, telefone, criado_em AS data_cadastro
        FROM clientes
        WHERE id_cliente = p_id_cliente;

        -- Result Set 2: Pedidos do cliente
        SELECT id_pedido AS numero_pedido, data_pedido, status, valor_total
        FROM pedidos
        WHERE id_cliente = p_id_cliente
        ORDER BY data_pedido DESC;

        -- Result Set 3: Resumo financeiro
        SELECT 
            COUNT(id_pedido) AS total_pedidos,
            IFNULL(SUM(valor_total), 0.00) AS valor_total_gasto,
            IFNULL(ROUND(AVG(valor_total), 2), 0.00) AS ticket_medio,
            MAX(data_pedido) AS ultimo_pedido
        FROM pedidos
        WHERE id_cliente = p_id_cliente;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contar_produtos_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `contar_produtos_categoria`(
    IN p_id_categoria INT,
    OUT p_total INT
)
BEGIN
    SELECT COUNT(*) INTO p_total
    FROM produtos
    WHERE id_categoria = p_id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserir_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserir_categoria`(
    IN p_nome VARCHAR(100),
    IN p_descricao TEXT
)
BEGIN
    INSERT INTO categorias (nome, descricao)
    VALUES (p_nome, p_descricao);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_categorias_ativas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_categorias_ativas`()
BEGIN
    SELECT id_categoria, nome, descricao
    FROM categorias
    WHERE ativo = TRUE
    ORDER BY nome ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_catalogo_vitrine`
--

/*!50001 DROP VIEW IF EXISTS `vw_catalogo_vitrine`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_catalogo_vitrine` AS select `produtos`.`id_produto` AS `codigo`,`produtos`.`nome` AS `titulo`,`produtos`.`preco` AS `valor_venda`,`produtos`.`estoque` AS `saldo_disponivel` from `produtos` where ((`produtos`.`ativo` = true) and (`produtos`.`estoque` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_clientes_publico`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes_publico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes_publico` AS select `clientes`.`id_cliente` AS `id_cliente`,`clientes`.`nome` AS `nome`,`clientes`.`email` AS `email`,`clientes`.`telefone` AS `telefone`,`clientes`.`ativo` AS `ativo` from `clientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_detalhes_itens_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_detalhes_itens_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_detalhes_itens_vendidos` AS select `pe`.`id_pedido` AS `id_pedido`,`pe`.`data_pedido` AS `data_pedido`,`pe`.`status` AS `status`,`c`.`nome` AS `cliente`,`pr`.`nome` AS `produto`,`cat`.`nome` AS `categoria`,`ip`.`quantidade` AS `quantidade`,`ip`.`preco_unitario` AS `preco_unitario`,`ip`.`subtotal` AS `subtotal` from ((((`itens_pedido` `ip` join `pedidos` `pe` on((`ip`.`id_pedido` = `pe`.`id_pedido`))) join `clientes` `c` on((`pe`.`id_cliente` = `c`.`id_cliente`))) join `produtos` `pr` on((`ip`.`id_produto` = `pr`.`id_produto`))) join `categorias` `cat` on((`pr`.`id_categoria` = `cat`.`id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_gestao_precos_simples`
--

/*!50001 DROP VIEW IF EXISTS `vw_gestao_precos_simples`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gestao_precos_simples` AS select `produtos`.`id_produto` AS `id_produto`,`produtos`.`nome` AS `nome`,`produtos`.`preco` AS `preco`,`produtos`.`ativo` AS `ativo` from `produtos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_status_estoque_produtos`
--

/*!50001 DROP VIEW IF EXISTS `vw_status_estoque_produtos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_status_estoque_produtos` AS select `p`.`id_produto` AS `id_produto`,`p`.`nome` AS `produto`,`c`.`nome` AS `categoria`,`p`.`preco` AS `preco`,`p`.`estoque` AS `estoque`,`p`.`estoque_minimo` AS `estoque_minimo`,(case when (`p`.`estoque` <= `p`.`estoque_minimo`) then 'CRÍTICO' when (`p`.`estoque` <= (`p`.`estoque_minimo` * 2)) then 'ATENÇÃO' else 'NORMAL' end) AS `nivel_estoque` from (`produtos` `p` join `categorias` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) where (`p`.`ativo` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-24 19:36:57
