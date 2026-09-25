DROP DATABASE IF EXISTS SMARTCOFFEE_DML_LEO;
CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_LEO;
USE SMARTCOFFEE_DML_LEO

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

-- INSERINDO DADOS NO DB

INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES 
('Arthur Nunes','arthur@email.com','1999999901','Rondonia',TRUE),
('Beatriz Raissa', 'beatriz@email.com','1999999902','Limeira',TRUE),
('Dandara Dias', 'dandara@email.com','1999999903','Limeira',TRUE),
('Davi Ferreira', 'davi@email.com','1999999904','Limeira',TRUE),
('Felipe Rodrigues', 'felipe@email.com','1999999905','Limeira',TRUE),
('Francisco Magri', 'francisco@email.com','1999999906','Limeira',TRUE),
('Franz Kramer', 'franz@email.com','1999999907','Limeira',TRUE),
('Gabriel Nogueira', 'gabriel@email.com','1999999908','Limeira',TRUE),
('Gabrielli Araujo', 'gabrielli@email.com','1999999909','Limeira',TRUE),
('Isabella Alves', 'isabella@email.com','1999999910','Limeira',TRUE),
('Keynan Santos', 'keynan@email.com','1999999911','Limeira',TRUE),
('Larissa Ramirez', 'larissa@email.com','1999999912','Limeira',TRUE),
('Leonardo Dias', 'leonardo@email.com','1999999913','Valinhos',TRUE),
('Luana Lima', 'luana@email.com','1999999914','Limeira',TRUE),
('Luccas Manfredi', 'luccas@email.com','1999999915','Limeira',TRUE),
('Livia Stein', 'livia@email.com','1999999916','Limeira',TRUE);

INSERT INTO categoria (nome) VALUES
('Cafés'),
('Bebidas Geladas'),
('Bebidas Quentes'),
('Salgados'),
('Sobremesas'),
('Combo');

-- VERIFICAR ULTIMO INSERT REALIZADO OU FEITO
INSERT INTO categoria (nome) VALUES
('Doces');
SET @categoria = LAST_INSERT_ID();
SELECT @categoria;
---------------------------------------------

-- ATUALIZANDO OU MODIFICANDO DADOS NO BD
-- LEMBRAR DE SEMPRE EXECUTAR O SELECT PARA ATUALIZAR (UPDATE)
-- E NUNCA JAMAIS NEVER FAÇA UM UPDATE SEM WHERE 😡
-- EX 1: MODIFICANDO VALORES INDIVIDUAIS
UPDATE cliente
SET telefone = '1988880001'
WHERE id_cliente = 10

UPDATE cliente
SET telefone = '000000000'

-- EX 2: MODIFICANDO VÁRIOS VALORES
UPDATE cliente
SET telefone = '1999999910',
    cidade = 'Piracicaba'
WHERE id_cliente = 10;


-- APAGAR DADOS DA TABELA NO BD
DELETE FROM cliente
WHERE id_cliente = 10;


-- CONSULTAR DADOS NO BD

-- SELECT * FROM cliente;
SELECT * FROM cliente
WHERE id_cliente = 9;
SELECT * FROM categoria;