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


-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email FROM cliente;


-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade FROM cliente;


-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT nome, preco FROM produto ORDER BY preco ASC


-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco FROM produto ORDER BY preco DESC LIMIT 5;


-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco FROM produto WHERE preco BETWEEN 8.00 AND 15.00


-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT nome, cidade FROM cliente WHERE cidade = 'Limeira' OR cidade = 'Americana'


-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome FROM produto WHERE nome LIKE '%Café%';


-- 9. Liste os clientes que não informaram telefone.
SELECT nome, telefone FROM cliente WHERE telefone IS NULL;


-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT status_pedido, valor_total FROM pedido WHERE valor_total > 20.00 ORDER BY valor_total DESC;

SELECT * FROM pedido


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS PRODUTOS_CADASTRADOS FROM produto


-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN(preco) AS MENOR_PREÇO,
       MAX(preco) AS MAIOR_PREÇO,
       ROUND(AVG(preco),2) AS MÉDIA_PREÇO
FROM produto


-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS QUANTIDADE_CLIENTES FROM cliente GROUP BY cidade;


-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS QUANTIDADE_CLIENTES FROM cliente GROUP BY cidade HAVING COUNT(*) >= 2;


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor_total) AS FATURAMENTO FROM pedido WHERE status_pedido = 'Finalizando';