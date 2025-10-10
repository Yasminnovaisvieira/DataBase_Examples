CREATE DATABASE locadora;

USE locadora;
 
-- Criação da tabela diretorj
CREATE TABLE diretor(
	id_diretor INT auto_increment primary key,
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    genero ENUM ("Feminino","Masculino","Outro")

);

-- Populando Diretor
INSERT INTO diretor (nome, sobrenome, genero) VALUES 
	('João', 'Carvalho', 'Masculino'),
	('Mariana', 'Silva', 'Feminino'),
	('Carlos', 'Pereira', 'Masculino'),
	('Ana', 'Souza', 'Feminino'),
	('Rafael', 'Almeida', 'Masculino'),
	('Beatriz', 'Oliveira', 'Feminino'),
	('Lucas', 'Mendes', 'Outro'),
	('Fernanda', 'Costa', 'Feminino'),
	('Eduardo', 'Lima', 'Masculino'),
	('Juliana', 'Ferreira', 'Feminino'),
	('André', 'Rodrigues', 'Masculino'),
	('Patrícia', 'Martins', 'Outro'),
	('Vinícius', 'Gonçalves', 'Masculino'),
	('Camila', 'Araújo', 'Feminino'),
	('Gustavo', 'Ribeiro', 'Masculino'),
	('Larissa', 'Barbosa', 'Feminino'),
	('Diego', 'Nascimento', 'Masculino'),
	('Sofia', 'Teixeira', 'Feminino'),
	('Felipe', 'Moura', 'Masculino'),
	('Alex', 'Torres', 'Outro');

-- Listar Diretores
SELECT * FROM diretor;
 
-- Criação da tabela Filme
CREATE TABLE filme(
	id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR (255) NOT NULL,
    atores VARCHAR(255) NOT NULL,
    diretor VARCHAR(255) NOT NULL,
    ano YEAR NOT NULL,
    genero VARCHAR(255) NOT NULL,
    produtora VARCHAR(255) NOT NULL,
    sinopse TEXT NOT NULL
);
 
-- Populando Filme
INSERT INTO filme (titulo, atores, diretor, ano, genero, produtora, sinopse) VALUES
	('O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 'Peter Jackson', 2001, 'Fantasia', 'New Line Cinema', 'Um jovem hobbit embarca em uma jornada épica para destruir um anel poderoso e salvar a Terra Média.'),
	('Harry Potter e as Relíquias da Morte: Parte 2', 'J.K. Rowling', 'David Yates', 2011, 'Aventura', 'Warner Bros', 'Harry enfrenta Voldemort em uma batalha final que decidirá o destino do mundo mágico.'),
	('Avatar', 'James Cameron', 'James Cameron', 2009, 'Ficção Científica', '20th Century Fox', 'Um ex-fuzileiro paraplégico é enviado a Pandora e se envolve com os nativos Na’vi em uma luta pela sobrevivência.'),
	('Star Wars: Uma Nova Esperança', 'George Lucas', 'George Lucas', 1977, 'Ficção Científica', 'Lucasfilm', 'Luke Skywalker se junta à Rebelião para enfrentar o império maligno e restaurar a liberdade na galáxia.'),
	('A Origem', 'Christopher Nolan', 'Christopher Nolan', 2010, 'Suspense', 'Syncopy', 'Um especialista em invadir sonhos precisa realizar um último trabalho: implantar uma ideia na mente de um herdeiro corporativo.');
 
-- Listar Filme
SELECT * FROM filme;
