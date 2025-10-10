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
	('A Origem', 'Christopher Nolan', 'Christopher Nolan', 2010, 'Suspense', 'Syncopy', 'Um especialista em invadir sonhos precisa realizar um último trabalho: implantar uma ideia na mente de um herdeiro corporativo.'),
	('Interestelar', 'Matthew McConaughey, Anne Hathaway', 'Christopher Nolan', 2014, 'Ficção Científica', 'Paramount Pictures', 'Um grupo de astronautas viaja através de um buraco de minhoca em busca de um novo lar para a humanidade.'),
	('Titanic', 'Leonardo DiCaprio, Kate Winslet', 'James Cameron', 1997, 'Romance', '20th Century Fox', 'Dois jovens de diferentes classes sociais se apaixonam a bordo do trágico navio Titanic.'),
	('Gladiador', 'Russell Crowe, Joaquin Phoenix', 'Ridley Scott', 2000, 'Ação', 'DreamWorks Pictures', 'Um general romano é traído e busca vingança contra o imperador corrupto que matou sua família.'),
	('Coringa', 'Joaquin Phoenix, Robert De Niro', 'Todd Phillips', 2019, 'Drama', 'Warner Bros', 'Um comediante falido em Gotham entra em colapso e se transforma no icônico vilão Coringa.'),
	('Os Vingadores', 'Robert Downey Jr., Chris Evans', 'Joss Whedon', 2012, 'Ação', 'Marvel Studios', 'Heróis poderosos se unem para proteger a Terra de uma invasão alienígena liderada por Loki.'),
	('Pantera Negra', 'Chadwick Boseman, Michael B. Jordan', 'Ryan Coogler', 2018, 'Ação', 'Marvel Studios', 'T’Challa retorna a Wakanda para assumir o trono e enfrentar inimigos internos e externos.'),
	('Forrest Gump', 'Tom Hanks, Robin Wright', 'Robert Zemeckis', 1994, 'Drama', 'Paramount Pictures', 'A vida de um homem simples que, sem saber, influencia diversos eventos históricos.'),
	('Clube da Luta', 'Brad Pitt, Edward Norton', 'David Fincher', 1999, 'Drama', '20th Century Fox', 'Um homem insone forma um clube secreto de luta com um vendedor de sabão carismático.'),
	('O Poderoso Chefão', 'Marlon Brando, Al Pacino', 'Francis Ford Coppola', 1972, 'Crime', 'Paramount Pictures', 'A saga da família Corleone e a luta pelo poder no mundo do crime organizado.'),
	('Matrix', 'Keanu Reeves, Laurence Fishburne', 'Lana Wachowski, Lilly Wachowski', 1999, 'Ficção Científica', 'Warner Bros', 'Um hacker descobre que o mundo é uma simulação e se une à resistência humana.'),
	('Pulp Fiction', 'John Travolta, Uma Thurman', 'Quentin Tarantino', 1994, 'Crime', 'Miramax Films', 'Histórias interligadas de crime e redenção em Los Angeles.'),
	('O Resgate do Soldado Ryan', 'Tom Hanks, Matt Damon', 'Steven Spielberg', 1998, 'Guerra', 'DreamWorks Pictures', 'Durante a Segunda Guerra Mundial, um grupo de soldados é enviado para resgatar um companheiro.'),
	('A Vida é Bela', 'Roberto Benigni, Nicoletta Braschi', 'Roberto Benigni', 1997, 'Drama', 'Cecchi Gori Group', 'Um pai usa humor e imaginação para proteger seu filho dos horrores de um campo de concentração.'),
	('Homem-Aranha: Sem Volta Para Casa', 'Tom Holland, Zendaya', 'Jon Watts', 2021, 'Ação', 'Marvel Studios', 'Peter Parker enfrenta as consequências de ter sua identidade revelada e busca ajuda do Doutor Estranho.'),
	('Duna', 'Timothée Chalamet, Rebecca Ferguson', 'Denis Villeneuve', 2021, 'Ficção Científica', 'Warner Bros', 'Paul Atreides, herdeiro de uma família nobre, deve viajar ao planeta desértico Arrakis e enfrentar perigos para salvar seu povo.');
 
-- Listar Filme
SELECT * FROM filme;
