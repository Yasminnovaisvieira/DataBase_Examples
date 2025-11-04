USE biblioteca_joins;

-- INNER JOIN: Liste todos os empréstimos com nome do leitor e título do livro.
SELECT emprestimos.id_emprestimo, leitores.nome_leitor, livros.titulo
FROM emprestimos
INNER JOIN emprestimos_leitores ON emprestimos_leitores.id_emprestimo = emprestimos.id_emprestimo
INNER JOIN leitores ON emprestimos_leitores.id_leitor = leitores.id_leitor
INNER JOIN livros ON livros.id_livro = emprestimos.id_livro;

-- LEFT JOIN: Mostre todos os livros com o nome do autor, mesmo os que não foram emprestados.
SELECT livros.titulo, autores.nome_autor
FROM livros
LEFT JOIN autores ON livros.id_autor = autores.id_autor;

-- RIGHT JOIN: Liste todos os autores, mesmo que não tenham livros publicados
SELECT autores.nome_autor, livros.titulo 
FROM livros
RIGHT JOIN autores ON livros.id_autor = autores.id_autor;

-- FULL OUTER JOIN (simulado): Liste todos os livros e editoras, mesmo que o livro não tenha editora ou a editora não tenha livro.
SELECT livros.titulo, editoras.nome_editora
FROM livros
LEFT JOIN editoras ON editoras.id_editora = livros.id_editora
UNION
SELECT livros.titulo, editoras.nome_editora
FROM livros
RIGHT JOIN editoras ON editoras.id_editora = livros.id_editora;

-- CROSS JOIN: Mostre todas as combinações possíveis entre leitores e livros.
SELECT leitores.nome_leitor, livros.titulo
FROM livros
CROSS JOIN leitores;

-- UNION: Mostre todos os nomes de autores e nomes de editoras numa única coluna.
SELECT autores.nome_autor AS nome
FROM autores
UNION
SELECT editoras.nome_editora AS nome
FROM editoras;

-- LEFT JOIN com erro: Liste os empréstimos com título dos livros (para testar se aparece NULL nos inválidos).
SELECT emprestimos.id_emprestimo, livros.titulo
FROM emprestimos
LEFT JOIN livros ON livros.id_livro = emprestimos.id_livro;

-- INNER JOIN com erro: Tente juntar empréstimos com leitores — o leitor 503 não existe, e será descartado.
SELECT emprestimos_leitores.id_emprestimo, leitores.nome_leitor
FROM emprestimos
INNER JOIN emprestimos_leitores ON emprestimos_leitores.id_emprestimo = emprestimos.id_emprestimo
INNER JOIN leitores ON leitores.id_leitor = emprestimos_leitores.id_leitor;

-- Exiba todos os livros com o nome da editora, mesmo que a editora não tenha publicado nenhum livro.
SELECT editoras.nome_editora, livros.titulo
FROM editoras
LEFT JOIN livros ON livros.id_editora = editoras.id_editora;

-- Liste todos os leitores e os livros que eles pegaram emprestado, se houver.
SELECT leitores.nome_leitor, livros.titulo
FROM emprestimos_leitores
LEFT JOIN emprestimos ON emprestimos.id_emprestimo = emprestimos_leitores.id_emprestimo
RIGHT JOIN leitores ON leitores.id_leitor = emprestimos_leitores.id_leitor
LEFT JOIN livros ON livros.id_livro = emprestimos.id_livro;

-- Mostre os nomes de todos os autores e os títulos de seus livros. Inclua também autores que ainda não têm livros cadastrados.
SELECT autores.nome_autor, livros.titulo
FROM autores
LEFT JOIN livros ON livros.id_autor = autores.id_autor;