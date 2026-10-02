-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Leonardo Henrique Dias
-- Turma: 2DEVIS Data: 02/10/2026
-- Base: smartcoffee_dml
-- ============================================================
USE SMARTCOFFEE_DML_LEO;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES 
('Leon Kennedy','leon.kennedy@email.com','19999999999','Vila MonteNegro',TRUE),
('Grace Ashcroft','grace.ashcroft@email.com','19999999998','Vila MonteNegro',TRUE);


-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome) VALUES
('Especiais da Casa');
SET @categoria = LAST_INSERT_ID();
SELECT @categoria;
SELECT * FROM categoria


-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SELECT * FROM categoria

INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Mocha de Pistache', '15.00',TRUE,9),
('Batida Estival', '12.00',TRUE,9),
('Brownie Recheado', '8.50',TRUE,9);


-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Jill Valentine','jill.valentine@email.com','','Raccoon City',TRUE)


-- 5. Crie um novo pedido para um dos clientes cadastrados.
SELECT * FROM cliente

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(),'ABERTO',0.00,18)


-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SELECT * FROM pedido

SELECT * FROM produto

INSERT INTO item_pedido (id_pedido,id_produto,quantidade,preco_unitario,observacao) VALUES
(12,4,1,'5.00','Nenhuma observação'),
(12,7,1,'12.00','Preferências em Maracujá e Manga');
SET @pedido_atividade = LAST_INSERT_ID();
SELECT @pedido_atividade;


-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:
SELECT * FROM cliente
WHERE id_cliente = 18;

UPDATE cliente
SET telefone = '19999999995'
WHERE id_cliente = 18;

SELECT * FROM cliente
WHERE id_cliente = 18;

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
SELECT * FROM cliente
WHERE id_cliente = 19;

UPDATE cliente
SET telefone = '19999999945',
    cidade = 'Raccoon City'
WHERE id_cliente = 19;  

SELECT * FROM cliente
WHERE id_cliente = 19;


-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
SELECT * FROM produto
WHERE id_categoria = 9;

UPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = 9;  

SELECT * FROM produto
WHERE id_categoria = 9;



-- 10. Altere o status do pedido criado para 'PREPARANDO'.
SELECT * FROM pedido
WHERE id_pedido = 12;

UPDATE pedido
SET status_pedido = 'PREPARANDO'
WHERE id_pedido = 12;

SELECT * FROM pedido
WHERE id_pedido = 12;


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
SELECT * FROM item_pedido
WHERE id_pedido = 12;

SELECT * FROM pedido
WHERE id_pedido = 12;

UPDATE pedido
SET valor_total = 17.00
WHERE id_pedido = 12;

SELECT * FROM pedido
WHERE id_pedido = 12;


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
SELECT * FROM produto
WHERE id_categoria = 9;

UPDATE produto
SET ativo = FALSE
WHERE id_produto = 8

SELECT * FROM produto
WHERE id_categoria = 9;


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
SELECT * FROM cliente

INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES 
('Ethan Whinters','ethan.whinters@email.com','19999999888','Luisiana',TRUE);

DELETE FROM cliente
WHERE id_cliente = 21

SELECT * FROM cliente


-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado: Não é possível excluir o cliente porque ele está relacionado a um pedido. Se ele for excluido, o pedido fica sem cliente.

-- START TRANSACTION;

-- DELETE FROM cliente
-- WHERE id_cliente = 1

-- ROLLBACK;
-- COMMIT;


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta: Porque se o cliente for excluído, a tabela pedido que depende do cliente ficara sem esse cliente, resultando em erro, afinal não é possível existir pedido sem um cliente o ter feito.


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
SELECT * FROM categoria

INSERT INTO categoria (nome) VALUES
('Excluir depois');

SELECT * FROM categoria

DELETE FROM categoria
WHERE id_categoria = 10

SELECT * FROM categoria