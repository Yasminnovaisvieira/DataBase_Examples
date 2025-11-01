USE BibliotecaOnline;

-- Mostrar o nome de todos os usuários e o ano em que eles se cadastraram
SELECT nome, YEAR(data_cadastro) FROM Usuario;

-- Exibir o nome dos autores e o mês de nascimento de cada um
SELECT nome MONTH(data_nascimento) FROM Autor;

-- Listar o nome do usuário, título do livro, data_emprestimo, data_devolucao e a diferença em dias entre essas duas data de todos os empréstimos que já foram devolvidos
SELECT usuario.nome, livro.titulo, emprestimo.data_emprestimo, emprestimo.data_devolucao,
DATEDIFF(emprestimo.data_devolucao, emprestimo.data_emprestimo) AS dias_uso
FROM emprestimo
JOIN livro ON emprestimo.livro_id = livro.id
JOIN usuario ON emprestimo.usuario_id = usuario.id
WHERE emprestimo.data_devolucao IS NOT NULL;

-- Mostrar os livros emprestados (título) e a data formatada do empréstimo no formato dd/mm/aaaa
SELECT livro.titulo, DATE_FORMAT(emprestimo.data_emprestimo, "%d/%m/%y")
FROM emprestimo
JOIN livro ON emprestimo.livro_id = livro.id;

-- Listar a data de cadastro e o dia da semana em que cada usuário foi cadastrado
SELECT data_cadastro, DAYNAME(data_cadastro) FROM usuario;

-- Mostrar a diferença absoluta em dias entre a data de devolução e a data limite de devolução (empréstimos já devolvidos), com o acréscimo de uma uma coluna mostrando somente a diferença em dias entre a data de devolução e a data limite de devolução (uma coluna com diferença absoluta e outra sem a função)
SELECT Emprestimo.id,Livro.titulo,Usuario.nome AS usuario,Emprestimo.data_devolucao,Emprestimo.data_devolucao_limite,
	ABS(DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_devolucao_limite)) AS diferenca_absoluta,
    DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_devolucao_limite) AS diferenca_normal
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
JOIN Livro ON Emprestimo.livro_id = Livro.id
WHERE Emprestimo.data_devolucao IS NOT NULL;

-- Calcular o valor da multa, considerando 1 real por dia de atraso (data_devolucao > data_devolucao_limite) e mostrar o valor arredondado para 2 casas decimais
SELECT Emprestimo.id, Livro.titulo, Usuario.nome AS usuario,Emprestimo.data_devolucao,Emprestimo.data_devolucao_limite,
    ROUND(
        CASE
            WHEN Emprestimo.data_devolucao > Emprestimo.data_devolucao_limite
            THEN DATEDIFF(Emprestimo.data_devolucao, Emprestimo.data_devolucao_limite) * 1
            ELSE 0
        END, 2
    ) AS valor_multa
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
JOIN Livro ON Emprestimo.livro_id = Livro.id
WHERE Emprestimo.data_devolucao IS NOT NULL;

-- Listar o nome dos usuários em letras maiúsculas
SELECT UPPER(nome) FROM usuario;

-- Listar os nomes dos livros com apenas o 5 primeiros caracteres
SELECT LEFT(titulo, 5) FROM livro;

-- Mostrar o nome e o e-mail de cada usuário concatenados com um traço entre eles
SELECT CONCAT(nome, '-' ,email) FROM usuario;

-- Mostrar os nomes dos autores com todas as letras 'a' substituídas por '@'
SELECT REPLACE(nome, 'a', '@') FROM usuario;

-- Listar o nome dos livros e o número de caracteres de cada título
SELECT nome, LENGTH(nome) FROM usuario;

-- Mostrar quantos usuários há no total
SELECT COUNT(id) FROM usuario;

-- Exibir a média de dias de empréstimo (entre data_emprestimo e data_devolucao) para os empréstimos já devolvidos
SELECT AVG(DATEDIFF(data_devolucao, data_emprestimo)) AS dias
FROM emprestimo
WHERE data_devolucao IS NOT NULL;

-- Mostrar o menor e o maior número de dias entre data_emprestimo e data_devolucao para os empréstimos já devolvidos
SELECT MIN(DATEDIFF(data_devolucao,data_emprestimo)), MAX(DATEDIFF(data_devolucao,data_emprestimo)) FROM emprestimo;

-- Mostrar quantos usuários existem por número de associação
SELECT nivel_associacao, COUNT(*) AS usuarios_totais
FROM Usuario
GROUP BY nivel_associacao;

-- Mostrar quantos livros foram emprestados por usuários
SELECT Usuario.nome AS Usuario, COUNT(Emprestimo.livro_id) AS emprestimos_totais
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
GROUP BY Usuario.nome;

-- Listar quantos empréstimos foram feitos por mês
SELECT YEAR(data_emprestimo) AS ano, MONTH(data_emprestimo) AS mes, COUNT(*) AS total_emprestimos
FROM Emprestimo
GROUP BY YEAR(data_emprestimo), MONTH(data_emprestimo)
ORDER BY ano, mes;

-- Mostrar a quantidade de livro por categoria
SELECT Categoria.nome AS categoria,COUNT(LivroCategoria.livro_id) AS total_livros
FROM LivroCategoria
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
GROUP BY Categoria.nome;

-- Mostrar os níveis de associação com mais de 3 usuários
SELECT nivel_associacao,COUNT(*) AS total_usuarios
FROM Usuario
GROUP BY nivel_associacao
HAVING COUNT(*) > 3;

-- Listar os usuários que fizeram mais de 1 empréstimo
SELECT Usuario.nome AS usuario,COUNT(Emprestimo.id) AS total_emprestimos
FROM Emprestimo
JOIN Usuario ON Emprestimo.usuario_id = Usuario.id
GROUP BY Usuario.nome
HAVING COUNT(Emprestimo.id) > 1;

-- Mostrar os meses com mais de 2 empréstimos registrados
SELECT YEAR(data_emprestimo) AS ano,MONTH(data_emprestimo) AS mes,COUNT(*) AS total_emprestimos
FROM Emprestimo
GROUP BY YEAR(data_emprestimo), MONTH(data_emprestimo)
HAVING COUNT(*) > 2
ORDER BY ano, mes;

-- Listar as categorias com mais de 1 livro vinculado
SELECT Categoria.nome AS categoria,COUNT(LivroCategoria.livro_id) AS total_livros
FROM LivroCategoria
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
GROUP BY Categoria.nome
HAVING COUNT(LivroCategoria.livro_id) > 1;