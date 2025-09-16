CREATE DATABASE prova_yasmin;

USE prova_yasmin;

CREATE TABLE setor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE equipamento (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL,
    id_setor INT,
    FOREIGN KEY (id_setor) REFERENCES setor(id)
);

CREATE TABLE tecnico (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255) NOT NULL,
    email VARCHAR (255) UNIQUE NOT NULL,
    descricao_conhecimento TEXT NOT NULL
);

CREATE TABLE peca (
	id INT PRIMARY KEY AUTO_INCREMENT,
    codigo INT UNIQUE NOT NULL,
    nome VARCHAR(255) NOT NULL,
    nome_fabricante VARCHAR(255) NOT NULL
);

CREATE TABLE laudo_tecnico (
	id INT PRIMARY KEY AUTO_INCREMENT,
    observacao VARCHAR(255) NOT NULL,
    data DATE NOT NULL,
    resultado VARCHAR (255) NOT NULL
);

CREATE TABLE manutencao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade_pecas INT NOT NULL,
    tipo_manutencao ENUM ('Preventiva', 'Corretiva') NOT NULL,
    data_proxima DATE NULL,
    id_peca INT,
    id_equipamento INT,
    id_laudo INT,
    FOREIGN KEY (id_peca) REFERENCES peca(id),
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id),
    FOREIGN KEY (id_laudo) REFERENCES laudo_tecnico(id)
);

CREATE TABLE tecnico_manutencao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    status ENUM ('Aberta', 'Em Andamento', 'Concluída') NOT NULL,
    id_tecnico INT,
    id_manutencao INT,
    FOREIGN KEY (id_tecnico) REFERENCES tecnico(id),
    FOREIGN KEY (id_manutencao) REFERENCES manutencao(id)
);

CREATE TABLE peca_manutencao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_peca INT,
    id_manutencao INT,
    FOREIGN KEY (id_peca) REFERENCES peca(id),
    FOREIGN KEY (id_manutencao) REFERENCES manutencao(id)
);

INSERT INTO setor (nome) VALUES
	('BASBI'),
    ('LYLLA'),
    ('YD');
    
INSERT INTO equipamento (nome, id_setor) VALUES 
	('Monitor Gamer', 1),
    ('Ar Condicionado', 2),
    ('Teclado', 3);
    
INSERT INTO tecnico (nome, email, descricao_conhecimento) VALUES
	('Yasmin Vieira', 'yasmin@gmail.com', 'Conhecimentos em apertar parafusos'),
    ('Julya Jacometti', 'julya@gmail.com', 'Conhecimentos em fazer nada'),
    ('Leticia Roth', 'leticia@gmail.com', 'Conhecimentos em ser coloridinha');
    
INSERT INTO peca (codigo, nome, nome_fabricante) VALUES
	('356574','Parafusadeira', 'Lorenzeti'),
    ('467356', 'Chave Inglesa', 'Mariana'),
    ('542575', 'Chave Portuguesa', 'Bosch');

INSERT INTO laudo_tecnico (observacao, data, resultado) VALUES
	('Equipamento estava com problemas para parafusar', '2025-11-03', 'Deu tudo certo'),
    ('Equipamento estava com problemas nas teclas', '2023-07-06', 'Não foi possível realizar a manutenção'),
    ('Equipamento estava com problemas ao desligar, pois continuava pingando água', '2005-07-09', 'Deu tudo certo');
    
INSERT INTO manutencao (quantidade_pecas, tipo_manutencao, data_proxima, id_peca, id_equipamento, id_laudo) VALUES
	(5, 'Preventiva', '2025-05-23', 3, 3, 1),
    (9, 'Corretiva', '2025-03-09', 2, 2, 3),
    (7, 'Preventiva', '2025-02-12', 1, 1, 2);
    
INSERT INTO tecnico_manutencao (status, id_tecnico, id_manutencao) VALUES
	('Em Andamento', 2, 1),
    ('Concluída', 3, 2),
    ('Aberta', 1, 3);
    
INSERT INTO peca_manutencao (id_peca, id_manutencao) VALUES
	(3, 1),
    (2, 2),
    (1, 3);

SELECT * FROM equipamento;

SELECT * FROM peca;

SELECT * FROM laudo_tecnico;

SELECT * FROM tecnico;

SELECT * FROM setor;

SELECT * FROM manutencao;

SELECT * FROM tecnico_manutencao;

SELECT * FROM peca_manutencao;

SHOW tables;

-- DROP DATABASE prova_yasmin;