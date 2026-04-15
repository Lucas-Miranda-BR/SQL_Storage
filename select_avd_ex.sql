CREATE DATABASE  IF NOT EXISTS `curso_mysql3`; 
USE `curso_mysql3`;


DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Alimentos'),(2,'Eletrodomésticos'),(3,'Eletrônicos'),(4,'Limpeza');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `cidade`;

CREATE TABLE `cidade` (
  `idCidade` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'São Paulo'),(2,'Campinas'),(3,'Poços de Caldas'),(4,'Andradas'),(5,'Rio de Janeiro');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `idEstado` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'SP'),(2,'MG'),(3,'RJ'),(4,'ES'),(5,'MS');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `data_nasc` date DEFAULT NULL,
  `idEstado` int NOT NULL,
  `idCidade` int NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `Cliente_FKIndex1` (`idCidade`),
  KEY `Cliente_FKIndex2` (`idEstado`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idCidade`) REFERENCES `cidade` (`idCidade`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;


LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Camila Fernandes','camilaf@gmail.com','222.258.658.99','1985-12-16',1,1),(2,'João Rodrigues','rodrigues@hotmaill.com','221.546.652.89','1990-01-25',1,2),(3,'José Carlos','josec@hotmaill.com','758.564.254.89','1991-03-15',2,3),(4,'Marina Ferreira','marinaf@outlookl.com','451.578.965.21','1989-06-20',3,5),(5,'Luis Paulo','luispaulo@outlook.com','216.052.358.69','1980-07-10',1,1),(6,'Rui Biaco','ruibiaco@outlook.com','458.789.654.12','1983-03-30',1,2),(7,'Claudemir Silva','claudemir@gmail.com','124.564.458.99','1985-11-25',3,2),(8,'José da Silva','josesilva@outlook.com','025.658.458-89','1978-05-11',2,4),(9,'Jonas Firmino','jonasf@outlook.com','335.658.963.55','1979-02-15',3,5),(10,'Carolina Ferraz','carolferraz@outlook.com','124.254.458-12','1987-06-12',1,2),(11,'Marcio Gomes','marciogomez@gmail.com','137.258.784-25','1991-01-30',3,5),(12,'Fernando Henrique','fhenr@hotmail.com','555.666.888.99','1985-09-30',2,4);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `vendedor`;

CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `idCidade` int NOT NULL,
  `idEstado` int NOT NULL,
  PRIMARY KEY (`idVendedor`),
  KEY `vendedor_FKIndex1` (`idCidade`),
  KEY `vendedor_FKIndex2` (`idEstado`),
  CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`idCidade`) REFERENCES `cidade` (`idCidade`),
  CONSTRAINT `vendedor_ibfk_2` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Fábio','fabio@gmail.com','358.256.259-95',1,1),(2,'João','joao@gmail.com','127.128.589.79',1,1),(3,'Henrique','henrique@gmail.com','852.123.145-13',2,1),(4,'Roberto','roberto@gmail.com','659.521.456.87',2,1),(5,'Marcos','marcos@outlook.com','589.654.851.25',3,2),(6,'Rafael','rafael@outlook.com','184.547.963.37',4,2),(7,'Marcelo','marcelo@outlook.com','332.653.421-15',5,3);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `marca`;

CREATE TABLE `marca` (
  `idMarca` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Samsung'),(2,'LG'),(3,'Sony'),(4,'Brastemp'),(5,'Tio João'),(6,'Come Tudo'),(7,'Omo'),(8,'Electrolux'),(9,'BomBril'),(10,'Camil'),(11,'Fugini');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `data_pedido` date DEFAULT NULL,
  `idVendedor` int NOT NULL,
  `idCliente` int NOT NULL,
  `valorpedido` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `pedido_FKIndex1` (`idVendedor`),
  KEY `pedido_FKIndex2` (`idCliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedor` (`idVendedor`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2016-08-08',1,1,250.00),(2,'2016-08-07',2,1,45.00),(3,'2016-07-31',2,4,379.00),(4,'2016-08-08',3,5,48.90),(5,'2016-07-09',4,8,23.90),(6,'2016-08-04',7,10,11.90),(7,'2016-08-03',6,11,57.90),(8,'2016-08-02',7,8,99.70),(9,'2016-08-05',6,9,109.00),(10,'2016-07-28',2,5,9.90),(11,'2016-07-29',1,10,12.50);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;

CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `idCategoria` int NOT NULL,
  `idMarca` int NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `produto_FKIndex1` (`idCategoria`),
  KEY `produto_FKIndex2` (`idMarca`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,1,5,'Arroz',11.50,3),(2,1,5,'Arroz',11.50,7),(3,1,6,'Feijão',18.50,5),(4,1,11,'Molho de Tomate',1.50,3),(5,1,11,'Maionese',3.50,2),(6,1,11,'Ervilha',2.30,15),(7,1,10,'Arroz',9.90,22),(8,2,1,'Geladeira',3700.00,32),(9,2,1,'Microondas',450.00,4),(10,2,1,'Smart TV 48 4k',2700.00,7),(11,2,2,'Ar Condicionado 12.000 BTU',1350.00,2),(12,2,4,'Geladeira BRM58',2100.00,3),(13,2,4,'Máquina de Lavar 12KG',1430.00,1),(14,2,4,'Forno de Embutir 55 Litros',1260.00,6),(15,2,8,'Aspirador de Pó',350.00,11),(16,2,8,'Liquidificador',250.00,18),(17,2,8,'Batedeira',650.00,20),(18,3,1,'Samsung Galaxy S7',3550.00,40),(19,3,2,'Tablet LG 10.1',1550.00,3),(20,3,3,'Notebook Sony',3550.00,1),(21,4,9,'Pinho Brll',3.00,59),(22,4,9,'Lysoform 1 Lt',11.00,33),(23,4,9,'Limpol',8.00,99),(24,4,7,'Sabão em Pó',8.50,78),(25,4,7,'Sabão em Pó Líquido',9.50,56);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--


--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;

CREATE TABLE `itens_pedido` (
  `idItens` int NOT NULL AUTO_INCREMENT,
  `idPedido` int NOT NULL,
  `idProduto` int NOT NULL,
  `qtde` int DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idItens`),
  KEY `itens_pedido_FKIndex1` (`idProduto`),
  KEY `itens_pedido_FKIndex2` (`idPedido`),
  CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` VALUES (1,1,2,3,55.50),(2,1,21,10,30.00),(3,1,25,4,38.00),(4,1,1,5,57.50),(5,10,6,1,2.30),(6,10,10,1,2700.00),(7,10,9,2,900.00),(8,10,4,5,7.50),(9,10,18,1,3550.00),(10,10,15,1,350.00),(11,9,25,4,38.00),(12,9,21,5,15.00),(13,9,3,3,55.50),(14,9,1,10,115.00),(15,9,1,10,115.00),(16,8,18,1,3550.00),(17,8,15,1,350.00),(18,7,19,1,1550.00),(19,7,11,1,1350.00),(20,6,6,1,2.30),(21,6,10,1,2700.00),(22,6,9,2,900.00),(23,6,4,5,7.50),(24,5,8,1,3700.00),(25,5,5,4,14.00),(26,5,4,10,15.00),(27,4,22,2,22.00),(28,4,24,10,85.00),(29,4,7,10,99.00),(30,4,1,10,115.00),(31,3,14,1,1260.00),(32,3,13,1,1430.00),(33,2,17,1,650.00),(34,2,12,1,2100.00);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

select cliente.nome, cliente.email, cidade.nome as cidade from cliente inner join cidade on cliente.idcidade = cidade.idcidade;
select cliente.nome, cliente.email, estado.nome as estado, cidade.nome as cidade from cliente inner join estado on cliente.idestado = estado.idestado inner join cidade on cliente.idcidade = cidade.idcidade;
select cliente.nome, cliente.email, estado.nome as estado, cidade.nome as cidade from cliente inner join estado on cliente.idestado = estado.idestado inner join cidade on cliente.idcidade = cidade.idcidade where cliente.nome like "%o%";
select produto.nome, produto.preco, marca.nome as marca from produto inner join marca on produto.idmarca = marca.idmarca where produto.preco >= 1000 and produto.preco <= 3000;
select produto.nome, marca.nome as marca, categoria.nome as categoria from produto inner join marca on produto.idmarca = marca.idmarca inner join categoria on produto.idcategoria = categoria.idcategoria where produto.nome like "%e%";
select pedido.idpedido, pedido.data_pedido, cliente.nome from pedido inner join cliente on pedido.idcliente = cliente.idcliente where pedido.data_pedido like "2016-08-__";
select pedido.idpedido, pedido.data_pedido, cliente.nome, vendedor.nome as vendedor_nome from pedido inner join cliente on pedido.idcliente = cliente.idcliente inner join vendedor on pedido.idvendedor = vendedor.idvendedor where pedido.data_pedido like "2016-07-__";
select produto.nome, produto.preco from produto inner join itens_pedido on produto.idproduto = itens_pedido.idproduto inner join pedido on pedido.idpedido = itens_pedido.idpedido inner join cliente on pedido.idcliente = cliente.idcliente where cliente.idcliente like 1;
select pedido.idpedido, cliente.nome from pedido right join cliente on pedido.idcliente = cliente.idcliente;
select p.nome, p.preco, c.nome as categoria, m.nome as marca from produto p inner join categoria c inner join marca m on p.idcategoria = c.idcategoria and p.idmarca = m.idmarca where p.preco = (select max(preco) from produto);
select pe.idpedido, pr.preco, c.nome from pedido pe inner join cliente c inner join itens_pedido i inner join produto pr on pe.idcliente = c.idcliente and pe.idpedido = i.idpedido and i.idproduto = pr.idproduto where pr.preco = (select max(preco) from produto);
select p.idpedido, p.valorpedido as valorTotal, c.nome from pedido p inner join cliente c on p.idcliente = c.idcliente where p.valorpedido = (select max(valorpedido) from pedido);
select p.idpedido, p.valorpedido as valorTotal, c.nome from pedido p inner join cliente c on p.idcliente = c.idcliente where p.valorpedido = (select min(valorpedido) from pedido);
