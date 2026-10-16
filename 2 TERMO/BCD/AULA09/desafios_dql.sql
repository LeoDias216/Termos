-- Active: 1788519236873@@127.0.0.1@3306@smartcoffee_dml_leo
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Leonardo Henrique Dias
-- Turma: 2DEVIS Data: 09/10/2026
-- Base: smartcoffee_dql
-- ============================================================


-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * FROM cliente;
SELECT nome FROM cliente;


-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email FROM cliente;


-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade FROM cliente;


-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome, preco FROM produto ORDER BY preco ASC;


-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco FROM produto ORDER BY preco DESC;
-- LIMIT 5 Opcional


-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco FROM produto WHERE preco BETWEEN 8.00 AND 15.00;


-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade FROM cliente WHERE cidade = 'Limeira' OR cidade = 'Americana';


-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome FROM produto WHERE nome LIKE '%Café%';


-- 9. Liste os clientes que não informaram telefone.
SELECT nome, telefone FROM cliente WHERE telefone IS NULL;


-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT status_pedido, valor_total FROM pedido WHERE status_pedido = 'Finalizando' AND valor_total > 20.00 ORDER BY valor_total DESC;

SELECT * FROM pedido;


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS PRODUTOS_CADASTRADOS FROM produto;


-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(preco) AS MENOR_PREÇO,
       MAX(preco) AS MAIOR_PREÇO,
       ROUND(AVG(preco),2) AS MÉDIA_PREÇO
FROM produto;


-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS QUANTIDADE_CLIENTES FROM cliente GROUP BY cidade;


-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS QUANTIDADE_CLIENTES FROM cliente GROUP BY cidade HAVING COUNT(*) >= 2;


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor_total) AS FATURAMENTO FROM pedido WHERE status_pedido = 'Finalizando';

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME AS CLIENTE, P.STATUS_PEDIDO, P.VALOR_TOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE;


-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT PR.NOME AS PRODUTO, CA.NOME AS CATEGORIA
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA
ORDER BY CA.NOME, PR.NOME;


-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT P.ID_PEDIDO, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME;


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT C.NOME, P.ID_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
ORDER BY C.NOME;


-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;


-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.