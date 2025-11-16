-- Usando banco de dados
USE bcd_subconsulta;

-- Listando o id_pedido, data_pedido_status e o total do pedido calculado com uma subconsulta que está somando qtde * preco_unit dos itens.
SELECT 
    p.id_pedido,
    p.data_pedido,
    p.status,
    (
        SELECT SUM(i.qtde * i.preco_unit)
        FROM itens_pedido i
        WHERE i.id_pedido = p.id_pedido
    ) AS total_pedido
FROM pedidos p;

-- Mostrando o id_pedido, data_pedido e o total calculado por subconsulta apenas para os pedidos cujo total é maior que a média geral de todos os pedidos.
-- WITH serve para criar uma tabelas temporaria para a consulta
WITH total_pedidos AS (
    SELECT 
        p.id_pedido,
        p.data_pedido,
        SUM(i.qtde * i.preco_unit) AS total_pedido
    FROM pedidos p
    -- INNER JOIN básico para juntas os pedidos
    JOIN itens_pedido i ON i.id_pedido = p.id_pedido
    GROUP BY p.id_pedido, p.data_pedido
),
media_total AS (
    SELECT AVG(total_pedido) AS media
    FROM total_pedidos
)SELECT 
    t.id_pedido,
    t.data_pedido,
    t.total_pedido
FROM total_pedidos t, media_total m
WHERE t.total_pedido > m.media;


-- Mostrando o id_pedido e o nome dos produtos que não aparecem em nenhum registro da tabela itens_pedidos.
-- Subconsulta com o NOT IN
SELECT id_produto, nome
FROM produtos
WHERE id_produto NOT IN (
    SELECT id_produto
    FROM itens_pedido
);

-- Listando o id_cliente e o nome dos clientes que nunca compraram produtos da categoria 'Games'.
SELECT c.id_cliente, c.nome
FROM clientes c
WHERE c.id_cliente NOT IN (
    SELECT p.id_cliente
    FROM pedidos p
    JOIN itens_pedido i ON p.id_pedido = i.id_pedido
    JOIN produtos pr ON i.id_produto = pr.id_produto
    JOIN categorias ca ON pr.id_categoria = ca.id_categoria
    WHERE ca.nome = 'Games'
);

-- Mostrando o id_produto, nome e preco dos produtos cujo preço é maior dentro da sua categoria.
SELECT p.id_produto, p.nome, p.preco
FROM produtos p
WHERE p.preco = (
    SELECT MAX(p2.preco)
    FROM produtos p2
    WHERE p2.id_categoria = p.id_categoria
);

-- Exibindo o id_pedido e prazo_dias das entregas de pedidos pagos cujo prazo é meior que a média de todos os prazos.
SELECT e.id_pedido, e.prazo_dias
FROM entregas e
WHERE e.id_pedido IN (
    SELECT id_pedido 
    FROM pedidos 
    WHERE status = 'Pago'
)
-- Usando o AND
AND e.prazo_dias < (
    SELECT AVG(prazo_dias)
    FROM entregas
);

-- Listando o id_produto, nome e preco dos produtos cujo preço é maior que a média de preços da própria categoria.
SELECT 
    p.id_produto,
    p.nome,
    p.preco
FROM produtos p
WHERE p.preco > (
    SELECT AVG(p2.preco)
    FROM produtos p2
    WHERE p2.id_categoria = p.id_categoria
);

-- (1 de 2) - Mostrando o id_produto, nome e quantos produtos da mesma categoria têm preço maior.
SELECT
    p.id_produto,
    p.nome,
    (
        SELECT COUNT(*)
        FROM produtos p2
        WHERE p2.id_categoria = p.id_categoria
          AND p2.preco > p.preco
    ) AS qtd_mais_caros
FROM produtos p;

-- (2 de 2) - Trazendo apenas os que não têm nenhum maior caro (top de categoria).
SELECT
    p.id_produto,
    p.nome,
    p.preco
FROM produtos p
WHERE (
    SELECT COUNT(*)
    FROM produtos p2
    WHERE p2.id_categoria = p.id_categoria
      AND p2.preco > p.preco
) = 0;


-- Listando o id_produto e o nome dos produtos que já foram vendidos em pedidos com pagamento aprovado.
SELECT DISTINCT
    p.id_produto,
    p.nome
FROM produtos p
JOIN itens_pedido ip ON ip.id_produto = p.id_produto
JOIN pagamentos pg ON pg.id_pedido = ip.id_pedido
WHERE pg.status = 'aprovado';


-- Listando o nome do cliente, id_pedido e o total apenas dos pedidos de maior valor no mês de agosto/2025.
SELECT
    c.nome,
    p.id_pedido,
    -- Subconsutla Correlacionada 
    (SELECT SUM(ip.qtde * ip.preco_unit)
     FROM itens_pedido ip
     WHERE ip.id_pedido = p.id_pedido) AS total_pedido
FROM
    pedidos p
JOIN
    clientes c ON p.id_cliente = c.id_cliente
WHERE
    DATE_FORMAT(p.data_pedido, '%Y-%m') = '2025-08'
HAVING
    
    total_pedido = (
        SELECT MAX(t.total)
        FROM (
            SELECT SUM(ip2.qtde * ip2.preco_unit) AS total
            FROM itens_pedido ip2
            JOIN pedidos p2 ON ip2.id_pedido = p2.id_pedido
            WHERE DATE_FORMAT(p2.data_pedido, '%Y-%m') = '2025-08'
            GROUP BY ip2.id_pedido
        ) AS t
    );
    
-- Mostrando o mês, id_pedido e o total do pedido de maior valor em cada mês (somante qtde * preco_unit), usando subconsulta no FROM.
SELECT 
	-- Data formada
    DATE_FORMAT(t.data_pedido, '%Y-%m') AS mes,
    t.id_pedido,
    t.total_pedido AS total
FROM (
        -- Total por pedido
        SELECT 
            p.id_pedido,
            p.data_pedido,
            SUM(i.qtde * i.preco_unit) AS total_pedido
        FROM pedidos p
        JOIN itens_pedido i ON i.id_pedido = p.id_pedido
        GROUP BY p.id_pedido, p.data_pedido
     ) t
JOIN (
        -- Saber o total do mes
        SELECT 
            DATE_FORMAT(data_pedido, '%Y-%m') AS mes,
            MAX(total_pedido) AS maior_do_mes
        FROM (
                SELECT 
                    p.id_pedido,
                    p.data_pedido,
                    SUM(i.qtde * i.preco_unit) AS total_pedido
                FROM pedidos p
                JOIN itens_pedido i ON i.id_pedido = p.id_pedido
                GROUP BY p.id_pedido, p.data_pedido
             ) x
        GROUP BY DATE_FORMAT(data_pedido, '%Y-%m')
     ) m
ON DATE_FORMAT(t.data_pedido, '%Y-%m') = m.mes
AND t.total_pedido = m.maior_do_mes
ORDER BY mes;
