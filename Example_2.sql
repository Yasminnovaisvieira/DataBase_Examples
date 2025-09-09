-- Criar tabela
CREATE DATABASE cursos_yasmin;

-- Usar tabela
USE cursos_yasmin;

-- Criar tabelas
CREATE TABLE modulo_curso (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    ordem INT NOT NULL,
    carga_horaria INT NOT NULL
);

CREATE TABLE professor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE curso (
	id INT PRIMARY KEY AUTO_INCREMENT,
    materia VARCHAR(255) NOT NULL,
    id_modulo INT,
    FOREIGN KEY (id_modulo) REFERENCES modulo(id)
);

CREATE TABLE professor_curso (
	id INT PRIMARY KEY AUTO_INCREMENT,
    papel_professor ENUM ('Titular', 'Tutor') NOT NULL,
    id_curso INT,
    id_professor INT,
    FOREIGN KEY (id_curso) REFERENCES curso(id),
    FOREIGN KEY (id_professor) REFERENCES professor(id)
);

CREATE TABLE plano_vigente (
	id INT PRIMARY KEY AUTO_INCREMENT,
    beneficio TEXT NOT NULL
);

CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_plano INT,
    FOREIGN KEY (id_plano) REFERENCES plano_vigente(id)
);

CREATE TABLE inscricao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    situacao ENUM('Ativa', 'Concluida', 'Trancada') NOT NULL,
    id_aluno INT,
    id_curso INT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);

CREATE TABLE perfil_opcional (
	id INT PRIMARY KEY AUTO_INCREMENT,
    foto BLOB NULL,
    biografia TEXT NULL,
    data_nascimento DATE NULL,
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id)
);

-- Inserir dados nas tabelas
INSERT INTO modulo_curso(titulo, ordem, carga_horaria) VALUES
	('Introdução ao Curso', 1, 90),
    ('Fundamentos Teóricos', 2, 90),
    ('Prática e Exercícios', 3, 90);
-- Armazena em minutos (Carga Horária)
    
INSERT INTO professor (nome, data_nascimento) VALUES
    ('Carlos Eduardo Silva', '1980-05-12'),
    ('Mariana Alves Souza', '1975-09-30'),
    ('João Pedro Fernandes', '1990-03-18');
    
INSERT INTO curso (materia, id_modulo) VALUES
    ('Matemática Básica', 1),
    ('Introdução à Programação', 2),
    ('Banco de Dados', 3);
    
INSERT INTO professor_curso (id_professor, id_curso, papel_professor) VALUES 
    (1, 1, 'Titular'),
    (2, 2, 'Tutor'),
    (3, 3, 'Titular');
    
INSERT INTO plano_vigente (beneficio) VALUES
    ('Acesso ilimitado a todos os cursos'),
    ('Suporte dedicado com tutores'),
    ('Certificação digital ao concluir cada curso');
    
INSERT INTO aluno (nome, data_nascimento, id_plano) VALUES
    ('Ana Beatriz Oliveira', '2002-04-15', 1),
    ('Lucas Martins Ferreira', '1999-11-03', 2),
    ('Juliana Costa Ramos', '2001-07-22', 3);
    
INSERT INTO inscricao (data, situacao, id_curso, id_aluno) VALUES
    ('2025-01-10', 'Ativa', 1, 1),
    ('2025-02-05', 'Concluida', 2, 2),
    ('2025-03-01', 'Trancada', 3, 3);
    
INSERT INTO perfil_opcional (foto, biografia, data_nascimento, id_aluno) VALUES
    ('ana.jpg', 'Estudante dedicada em matemática e estatística.', '2002-04-15', 1),
    ('lucas.png', 'Apaixonado por tecnologia e programação.', '1999-11-03', 2),
    ('juliana.jpeg', 'Interessada em banco de dados e ciência de dados.', '2001-07-22', 3);


-- Visualizar os dados que estão dentro de cada tabela
SELECT * FROM modulo_curso;

SELECT * FROM professor;

SELECT * FROM curso;

SELECT * FROM professor_curso;

SELECT * FROM plano_vigente;

SELECT * FROM aluno;

SELECT * FROM inscricao;

SELECT * FROM perfil_opcional;

-- Para visualizar as tabelas
SHOW tables;

-- Ver os campos de uma tabela especifica
DESCRIBE professor;

-- Apagar tabela
-- DROP DATABASE cursos_yasmin;