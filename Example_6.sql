-- Usar tabela
USE biblioteca_yasmin;

SELECT 
	livro.titulo, 
    autor.nome AS autor, -- AS serve para criar "apelido"
    categoria.nome AS genero,
    usuario.nome AS usuario,
    emprestimo.data_emprestimo,
    emprestimo.data_devolucao

FROM emprestimo

INNER JOIN usuario ON usuario.id = emprestimo.id_usuario
INNER JOIN livro ON livro.id = emprestimo.id_livro

-- Ligação através da tabela autor_livro, por ela ter campos comuns entre as duas que desejo conectar
INNER JOIN autor_livro ON autor_livro.id_livro = livro.id
INNER JOIN autor ON autor.id = autor_livro.id_autor

-- Ligação através da tabela livro_categoria, por ela ter campos comuns entre as duas que desejo conectar
INNER JOIN livro_categoria ON livro_categoria.id_livro = livro.id
INNER JOIN categoria ON categoria.id = livro_categoria.id_categoria ;