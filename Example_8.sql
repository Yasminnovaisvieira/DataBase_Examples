-- Listar os títulos e categorias dos livros do gênero Mistério, ordenados por título em ordem alfabética
SELECT Livro.titulo, Categoria.nome
FROM LivroCategoria
INNER JOIN Livro ON Livro.id = LivroCategoria.livro_id
INNER JOIN Categoria ON Categoria.id = LivroCategoria.categoria_id
WHERE Categoria.nome = "Mistério"
ORDER BY Livro.titulo ASC;

-- Mostrar o título e o ISBN dos livros que começam com a letra "O"
SELECT titulo,isbn
FROM Livro
WHERE titulo LIKE "O%";

-- Listar os nomes e níveis de associação dos usuários cadastrados após 01/06/2023
SELECT nome, nivel_associacao
FROM Usuario
WHERE data_cadastro > "2023-06-01"; -- ano/mes/dia

-- Mostrar o nome dos autores cuja data de nascimento está ausente
SELECT nome
FROM Autor
WHERE data_nascimento IS NULL;

-- Exibir os títulos e descrições dos livros que possuem descrição preenchida
SELECT titulo, descricao
FROM Livro
WHERE descricao IS NOT NULL;

-- Listar os usuários regulares ou premium (usando IN) e mostre apenas nome e data de cadastro
SELECT nome, data_cadastro
FROM Usuario
WHERE nivel_associacao IN ('regular', 'premium');

-- Mostrar os livros com ID entre 3 e 6, inclusive
SELECT id, titulo, isbn, descricao
FROM Livro
WHERE id BETWEEN 303 AND 306;

-- Listar o nome e email dos usuários cujo nome não começa com “M”
SELECT nome,email
FROM Usuario
WHERE nome NOT LIKE "M%";

-- Exibir os títulos dos livros emprestados que ainda não foram devolvidos
SELECT Livro.titulo
FROM Emprestimo
INNER JOIN Livro ON Emprestimo.livro_id = Livro.id
WHERE data_devolucao IS NULL;

-- Mostrar os 5 primeiros livros cadastrados (considerando o ID como ordem de cadastro)
SELECT id, titulo, isbn, descricao
FROM Livro
LIMIT 5;

-- Mostrar os 5 livros seguintes após pular os 3 primeiros.
SELECT id,titulo, isbn, descricao
FROM Livro
LIMIT 5 OFFSET 3;

-- Mostrar os títulos de livros cujo nome tenha exatamente 5 letras antes de "rry"
SELECT titulo
FROM Livro
WHERE titulo LIKE "_____rry";

-- Listar os usuários premium cadastrados depois de julho de 2023
SELECT nome
FROM Usuario
WHERE nivel_associacao = "premium" AND data_cadastro > "2023-07-01-";

-- Listar os títulos de livros da categoria Ficção ou Mistério, que tenham descrição preenchida
SELECT Livro.titulo
FROM LivroCategoria
INNER JOIN Livro ON Livro.id = LivroCategoria.livro_id
INNER JOIN Categoria ON Categoria.id = LivroCategoria.categoria_id
WHERE (Categoria.nome = "Ficção" OR Categoria.nome = "Mistério") AND Livro.descricao IS NOT NULL;

/* Listar os títulos, nomes dos autores e categorias dos livros emprestados entre janeiro e fevereiro de 2024, cujo título começa com a letra “O”, que possuam descrição preenchida, e sejam de uma das categorias 'Mistério', 'Ficção' ou 'Fantasia'. Mostre apenas os livros escritos por autores cujo nome contém a letra “a”. Ordene o resultado por título */
SELECT Livro.titulo, Autor.nome, Categoria.nome
FROM Emprestimo

-- Título do livro
INNER JOIN Livro ON Livro.id = Emprestimo.livro_id
INNER JOIN LivroAutor ON Livro.id = LivroAutor.livro_id

--Nome do autor 
INNER JOIN Autor ON LivroAutor.autor_id = Autor.id
INNER JOIN LivroCategoria ON Livro.id = LivroCategoria.livro_id

-- Nome da categoria
INNER JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id

WHERE Emprestimo.data_emprestimo BETWEEN '2024-01-01' AND '2024-02-29'
  AND Livro.titulo LIKE 'O%'
  AND Livro.descricao IS NOT NULL
  AND Categoria.nome IN ('Mistério', 'Ficção', 'Fantasia')
  AND Autor.nome LIKE '%a%'
ORDER BY Livro.titulo ASC;