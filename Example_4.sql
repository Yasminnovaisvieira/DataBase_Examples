-- Usar o banco de dados
USE biblioteca_yasmin;

-- Select onde ID é 3
SELECT titulo, descricao FROM livro WHERE id = 3;

-- Inserção de novo gênero dentro de Categoria
INSERT INTO categoria (nome) VALUES ('Técnico');

-- Alter table da tabela Livro
ALTER TABLE livro 
ADD COLUMN edicao VARCHAR(50),
ADD COLUMN data_publicacao DATE,
ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT 'disponivel';

-- Insert na tabela Autor
INSERT INTO autor (nome, data_nasc, biografia)
VALUES (
    'Eric Matthes', 
    '1975-01-01', 
    'Autor de livros de programação Python.'
);

-- Insert na tabela Livro
INSERT INTO livro (titulo, isbn, descricao, edicao, data_publicacao)
VALUES(
    'Python',
    '1718502702', -- ISBN conforme a tarefa
    'Livro sobre programação em Python do iniciante até o avançado',
    '3ª edição',
    '2023-04-24'
);

-- Insert na tabela livro_categoria (e autor_livro) para relacionar o livro novo
INSERT INTO livro_categoria (id_livro, id_categoria) VALUES (11, 11);
INSERT INTO autor_livro (id_livro, id_autor) VALUES (11, 11);

-- Atualização do e-mail do usuário
UPDATE usuario SET email = 'teste@email.com' WHERE id = 1;

-- Correção do título do livro Python
UPDATE livro SET titulo = 'Curso Intensivo de Python: uma Introdução Prática e Baseada em Projetos à Programação' WHERE id = 11;

-- Insert na tabela Livro
INSERT INTO livro (titulo, isbn, edicao, data_publicacao)
VALUES(
    'JavaScript: The Definitive Guide',
    '9781565923928',
    '3° Edição',
    '1998-06-11'
);

-- Marcar livros publicados antes dos anos 2000 como Inativos
UPDATE livro SET status = 'inativo' WHERE YEAR(data_publicacao) < 2000;


-- Deletar livro de todas as tabelas que o utilizam
DELETE FROM autor_livro WHERE id_livro = 2;
DELETE FROM livro_categoria WHERE id_livro = 2;
DELETE FROM emprestimo WHERE id_livro = 2;
DELETE FROM livro WHERE id = 2;

-- Adição da coluna "nome" no usuário
ALTER TABLE usuario ADD COLUMN nome VARCHAR(255);

-- Insert de um usuário
INSERT INTO usuario (nome, numero_ident, email, data_cadastro)
VALUES (
    'Teste Testador', 
    'UTESTE', 
    'testetestador@gmail.com', 
    '2023-09-23'
);

-- Delete do usuário pelo nome, conforme a tarefa
DELETE FROM usuario WHERE nome = 'Teste Testador';

-- Insert de um livro com o status "danificado"
INSERT INTO livro (titulo, isbn, status)
VALUES (
    'Livro Danificado de Teste', 
    '0000000001', 
    'danificado'
);

-- Deletar livros com status = "danificado"
DELETE FROM livro WHERE status = 'danificado';

-- Insert de empréstimo para garantir que existe um registro de 2020
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_devolucao) 
VALUES (
    3, 
    9, 
    '2020-08-15', 
    '2020-08-29'
);

-- Delete de empréstimo realizado no ano 2020
DELETE FROM emprestimo WHERE YEAR(data_emprestimo) = 2020;

-- Desativar safe updates
SET SQL_SAFE_UPDATES = 0;