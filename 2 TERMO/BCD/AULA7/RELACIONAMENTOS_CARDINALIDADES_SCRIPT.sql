-- Sql ANSI 2003 - brModelo.
--Relacionamentos e Cardinalidades - Banco de Dados - Exemplo

Create Database if not exists SESI_CR_TA;

Use SESI_CR_TA;



CREATE TABLE Cliente (
Id_cliente int auto_increment primary key PRIMARY KEY,
Nome_cliente varchar(60) not null
);

CREATE TABLE Pedido (
Id_pedido int auto_increment primary key PRIMARY KEY,
Data_pedido datetime not null,
Id_cliente int not null,
FOREIGN KEY(Id_cliente) REFERENCES Cliente (Id_cliente)
);

CREATE TABLE Estoque (
Id_produto int not null unique,
Nome_produto varchar(60) not null,
Id_estoque int auto_increment primary key,
Quantidade int not null
-- PRIMARY KEY(Id_produto,Id_estoque)
);

CREATE TABLE Fornecedor (
Id_fornecedor int auto_increment primary key PRIMARY KEY,
Razao_social varchar(60) not null
);

CREATE TABLE Produto (
Id_produto int auto_increment primary key PRIMARY KEY,
Nome_produto varchar(60) not null
);


CREATE TABLE Item_produto (
Id_produto int not null,
Id_fornecedor int not null,
Id_item int auto_increment primary key PRIMARY KEY,
Valor decimal(3,2) not null,
Observacao text(300),
FOREIGN KEY(Id_produto) REFERENCES Produto (Id_produto),
FOREIGN KEY(Id_fornecedor) REFERENCES Fornecedor (Id_fornecedor)
);

-- CREATE TABLE Realiza (
-- Id_pedido int not null,
-- Id_cliente int not null,
-- FOREIGN KEY(Id_pedido) REFERENCES Pedido (Id_pedido),
-- FOREIGN KEY(Id_cliente) REFERENCES Cliente (Id_cliente)
-- );

