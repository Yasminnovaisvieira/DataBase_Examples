-- Criar tabela
CREATE DATABASE biblioteca;

-- Usar tabela
USE biblioteca;

-- Criar tabelas
CREATE TABLE livro (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    isbn VARCHAR(255),
    descricao TEXT
);

CREATE TABLE autor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    data_nasc DATE,
    biografia TEXT
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    numero_ident VARCHAR(255),
    email VARCHAR(255),
    data_cadastro DATE
);

CREATE TABLE nivel_usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nivel VARCHAR(255),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE categoria (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

CREATE TABLE emprestimo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATE,
    data_devolucao DATE,
    data_devolucaoRealizada DATE,
    id_livro INT,
    id_usuario INT,
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE livro_categoria (
	id_livro INT,
    id_categoria INT,
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE autor_livro (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT,
    id_autor INT,
    FOREIGN KEY (id_livro) REFERENCES livro(id),
    FOREIGN KEY (id_autor) REFERENCES autor(id)
);

-- Inserir dados nas tabelas
INSERT INTO livro VALUES 
	('Sapiens: Uma Breve História da Humanidade',
    '9788535925697',
    'Yuval Noah Harari explora a trajetória da humanidade desde os primeiros Homo sapiens até a sociedade moderna, abordando evolução, cultura, religião e economia.'),
    
    (),
    (),
    (),
    (),
    (),
    (),
    (),
    (),
    (),
    ();
