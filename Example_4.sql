USE biblioteca_yasmin;

-- Select onde ID é 3
SELECT titulo, descricao FROM livro WHERE id = 3;

-- Inserção de novo gênero dentro de Categoria
INSERT INTO categoria (nome) VALUES ('Técnico');
SELECT * FROM categoria;

-- Alter table da tabela Livro
ALTER TABLE livro 
ADD COLUMN edicao VARCHAR(150),
ADD COLUMN data_publicacao DATE,
ADD COLUMN quantidade_paginas INT;

SELECT * FROM livro;

-- Insert na tabela Autor
INSERT INTO autor (nome, data_nasc, biografia)
VALUES (
    'Eric Matthes',
    '1913-07-25',
    'O senador Eric Randall Matthews, também um grande autor de livros de desenvolvimento'
);
SELECT * FROM autor;

-- Insert na tabela Livro
INSERT INTO livro (titulo, descricao, quantidade_paginas, isbn, edicao, data_publicacao)
VALUES(
    'Python',
    'Livro sobre programação em Python do iniciante até o avançado',
    89,
    '652419890',
    '3° Edição',
    '2023-04-24'
);
SELECT * FROM livro;

-- Insert na tabela livro_categoria
INSERT INTO livro_categoria (id_livro, id_categoria) 
VALUES (11, 11);
SELECT * FROM livro_categoria;

-- Atualização do e-mail do usuario
UPDATE usuario SET email = 'teste@email.com' WHERE id = 1;
SELECT * FROM usuario;

-- Correção do título do livro Python
UPDATE livro SET titulo = 'Curso Intensivo de Python: uma Introdução Prática e Baseada em Projetos à Programação' WHERE id = 11;
SELECT * FROM livro;

-- Adicionar coluna status em Livro
ALTER TABLE livro ADD COLUMN status ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo';
SELECT * FROM livro;

-- Insert na tabela Livro (livro antigo, vai virar Inativo depois)
INSERT INTO livro (titulo, descricao, quantidade_paginas, isbn, edicao, data_publicacao)
VALUES(
    'JavaScript: The Definitive Guide',
    'Guia abrangente e referência técnica sobre a linguagem JavaScript: cobre a “core language” (tipos, operadores, estruturas de controle, funções), a programação orientada a objetos em JS, bem como a API do navegador (Document Object Model, manipulação de imagens, cookies, eventos) da época.',
    776,
    '9781565923928',
    '3° Edição',
    '1998-06-11'
);

-- Marcar livros publicados antes dos anos 2000 como Inativos
UPDATE livro
SET status = 'Inativo'
WHERE data_publicacao < '2000-01-01';
SELECT * FROM livro;

-- Deletar livro de todas as tabelas que o utilizam (exemplo com id=2)
DELETE FROM autor_livro WHERE id_livro = 2;
DELETE FROM livro_categoria WHERE id_livro = 2;
DELETE FROM emprestimo WHERE id_livro = 2;
DELETE FROM livro WHERE id = 2;

-- Insert de um usuário teste
INSERT INTO usuario (numero_ident, email, data_cadastro)
VALUES (
    'UTESTE', 
    'testetestador@gmail.com', 
    '2023-09-23'
);
SELECT * FROM usuario;

-- Delete do usuário teste
DELETE FROM usuario WHERE numero_ident = 'UTESTE';

-- Insert de empréstimo (ajustado para colunas corretas)
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_devolucao, data_devolucaoRealizada) 
VALUES (
    3, 
    9, 
    '2020-08-15', 
    '2020-08-29', 
    '2020-08-16'
);
SELECT * FROM emprestimo;

-- Delete de empréstimo realizado no ano 2020
DELETE FROM emprestimo WHERE YEAR(data_emprestimo) = 2020;

-- Desativar safe updates
SET SQL_SAFE_UPDATES = 0;
