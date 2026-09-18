-- Sql ANSI 2003 - brModelo.

Create Database if not exists SmartCoffee_LeonardoV2;

Use SmartCoffee_LeonardoV2;

CREATE TABLE Produtos (
Id_produto INT AUTO_INCREMENT PRIMARY KEY,
Categoria VARCHAR(30) NOT NULL,
Preco DECIMAL(4,2) NOT NULL,
Quantidade INT NOT NULL,
Validade TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Nome_produto VARCHAR(60) NOT NULL,
Descricao VARCHAR(60) NOT NULL,
Id_categoria INT
);

CREATE TABLE Funcionarios (
Id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(60) NOT NULL,
Numero VARCHAR(12) NOT NULL,
Endereco VARCHAR(80) NOT NULL,
Cargo VARCHAR(20) NOT NULL,
Data_nasc DATETIME NOT NULL,
Salario DECIMAL(5,2) NOT NULL,
CPF CHAR(14) NOT NULL,
Data_admissao DATE NOT NULL
);

CREATE TABLE Delivery (
Id_delivery INT AUTO_INCREMENT PRIMARY KEY,
Status_delivery ENUM("Ativo", "Inativo") DEFAULT "Ativo",
Nome VARCHAR(60) NOT NULL,
CPF CHAR(14) NOT NULL,
Data_hora_saida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Endereco VARCHAR(80) NOT NULL,
Taxa DECIMAL(3,2) NOT NULL,
Id_pedido INT
);

CREATE TABLE Programa_fidelidade (
Id_programa_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(60) NOT NULL,
CPF VARCHAR(14) NOT NULL,
Saldo_pontos INT NOT NULL,
Validade DATE NOT NULL,
Hist_compras TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Data_ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Id_cliente INT
);

CREATE TABLE Clientes (
Id_cliente INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(60) NOT NULL,
Telefone VARCHAR(12) NOT NULL,
CPF VARCHAR(14) NOT NULL,
Endereco VARCHAR(80) NOT NULL,
Data_nasc DATE NOT NULL,
email VARCHAR(30) NOT NULL,
Status ENUM("Ativo", "Inativo") DEFAULT "Ativo",
data_cadastro DATE NOT NULL
);

CREATE TABLE Estoque (
Id_insumo INT AUTO_INCREMENT PRIMARY KEY,
Fornecedor VARCHAR(60) NOT NULL,
Hist_entrada_saida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Tipo VARCHAR(30) NOT NULL,
Quantidade INT NOT NULL,
Nome_produto VARCHAR(60) NOT NULL,
Unidade_medida VARCHAR(20) NOT NULL,
Quantidade_minima INT NOT NULL
);

CREATE TABLE Categoria (
Id_categoria INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(60) NOT NULL,
Produtos VARCHAR(80) NOT NULL,
Quantidade INT NOT NULL,
Preco DECIMAL(5,2) NOT NULL,
Validade DATE NOT NULL
);

CREATE TABLE Fornecedor (
Id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
Empresa VARCHAR(60) NOT NULL,
Produto VARCHAR(80) NOT NULL,
Quantidade INT NOT NULL,
Localizacao VARCHAR(80) NOT NULL,
Preco DECIMAL(5,2) NOT NULL
);

CREATE TABLE Pagamento (
Id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
Valor DECIMAL(4,2) NOT NULL,
CPF VARCHAR(14) NOT NULL,
Data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Status ENUM("Ativo", "Inativo") DEFAULT "Ativo",
Forma_pag ENUM("Debito", "Credito", "Pix"),
Id_pedido INT
);

CREATE TABLE Pedidos (
Id_pedido INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(60) NOT NULL,
Produtos VARCHAR(80) NOT NULL,
Preco DECIMAL(5,2) NOT NULL,
Data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Quantidade INT NOT NULL,
Status ENUM("Ativo", "Inativo") DEFAULT "Ativo",
Tipo_pedido ENUM("Presencial", "Delivery") DEFAULT "Presencial",
Valor_total DECIMAL(5,2) NOT NULL
);

CREATE TABLE Realiza (
Id_pedido INT,
Id_cliente INT,
FOREIGN KEY(Id_pedido) REFERENCES Pedidos (Id_pedido),
FOREIGN KEY(Id_cliente) REFERENCES Clientes (Id_cliente)
);

CREATE TABLE Abastece (
Id_fornecedor INT,
Id_insumo INT,
FOREIGN KEY(Id_fornecedor) REFERENCES Fornecedor (Id_fornecedor),
FOREIGN KEY(Id_insumo) REFERENCES Estoque (Id_insumo)
);

CREATE TABLE Atende (
Id_funcionario INT,
Id_pedido INT,
FOREIGN KEY(Id_funcionario) REFERENCES Funcionarios (Id_funcionario),
FOREIGN KEY(Id_pedido) REFERENCES Pedidos (Id_pedido)
);

CREATE TABLE Contem (
quantidade INT NOT NULL,
preco_historico DECIMAL(5,2) NOT NULL,
Id_produto INT,
Id_pedido INT,
FOREIGN KEY(Id_produto) REFERENCES Produtos (Id_produto),
FOREIGN KEY(Id_pedido) REFERENCES Pedidos (Id_pedido)
);

CREATE TABLE Entrega (
Id_funcionario INT,
Id_delivery INT,
FOREIGN KEY(Id_funcionario) REFERENCES Funcionarios (Id_funcionario),
FOREIGN KEY(Id_delivery) REFERENCES Delivery (Id_delivery)
);

CREATE TABLE Consome (
Quantidade_gasta INT NOT NULL,
Id_produto INT,
Id_insumo INT,
FOREIGN KEY(Id_produto) REFERENCES Produtos (Id_produto),
FOREIGN KEY(Id_insumo) REFERENCES Estoque (Id_insumo)
);

ALTER TABLE Produtos
ADD FOREIGN KEY(Id_categoria)
REFERENCES Categoria (Id_categoria);

ALTER TABLE Delivery
ADD FOREIGN KEY(Id_pedido)
REFERENCES Pedidos (Id_pedido);

ALTER TABLE Programa_fidelidade
ADD FOREIGN KEY(Id_cliente)
REFERENCES Clientes (Id_cliente);

ALTER TABLE Pagamento
ADD FOREIGN KEY(Id_pedido)
REFERENCES Pedidos (Id_pedido);