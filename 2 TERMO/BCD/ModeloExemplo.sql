CREATE TABLE `Clientes` (
  `id_cliente` int PRIMARY KEY AUTO_INCREMENT,
  `nome_cliente` varchar(60) NOT NULL
);

CREATE TABLE `Produtos` (
  `id_produtos` int PRIMARY KEY AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `nome_produto` varchar(120) NOT NULL
);

ALTER TABLE `Produtos` ADD FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`);
