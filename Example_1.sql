-- Criar tabela
CREATE DATABASE biblioteca_yasmin;

-- Usar tabela
USE biblioteca_yasmin;

-- Criar tabelas
CREATE TABLE livro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255),
    isbn VARCHAR(255) UNIQUE,
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
    email VARCHAR(255) UNIQUE,
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
INSERT INTO livro (titulo, isbn, descricao) VALUES
    (
        'Sapiens: Uma Breve História da Humanidade',
        '9788535925697',
        'Yuval Noah Harari explora a trajetória da humanidade desde os primeiros Homo sapiens até a sociedade moderna, abordando evolução, cultura, religião e economia.'
    ),
    (
        'Homo Deus: Uma Breve História do Amanhã',
        '9788535928193',
        'Continuação de Sapiens, Harari analisa os possíveis rumos futuros da humanidade, incluindo biotecnologia, inteligência artificial e a busca pela imortalidade.'
    ),
    (
        'Lições para o Século 21',
        '9788535930813',
        'Harari foca nos desafios contemporâneos, como fake news, política global, aquecimento climático e futuro do trabalho.'
    ),
    (
        'O Poder do Hábito',
        '9788539004114',
        'Charles Duhigg explora como os hábitos funcionam, como são formados e como podem ser transformados para melhorar a vida pessoal e profissional.'
    ),
    (
        'Rápido e Devagar: Duas Formas de Pensar',
        '9776539004923',
        'Daniel Kahneman explica os dois sistemas de pensamento humano: o rápido, intuitivo, e o devagar, lógico, mostrando como ambos influenciam decisões.'
    ),
    (
        'Mindset: A Nova Psicologia do Sucesso',
        '9372501463834',
        'Carol S. Dweck apresenta a teoria do "mindset fixo" e "mindset de crescimento", explicando como a mentalidade impacta aprendizado, carreira e relacionamentos.'
    ),
    (
        'O Homem Mais Rico da Babilônia',
        '9165027892462',
        'George S. Clason traz lições sobre prosperidade e gestão financeira baseadas em parábolas ambientadas na antiga Babilônia.'
    ),
    (
        'A Sutil Arte de Ligar o F*da-se',
        '9788551002345',
        'Mark Manson apresenta uma abordagem direta e prática sobre como viver melhor ao aprender a lidar com limites, fracassos e expectativas.'
    ),
    (
        'Essencialismo: A Disciplinada Busca por Menos',
        '9692510164293',
        'Greg McKeown defende a ideia de concentrar esforços no que realmente importa, eliminando distrações para viver com mais propósito.'
    ),
    (
        'Pai Rico, Pai Pobre',
        '9788576849948',
        'Robert Kiyosaki compara os ensinamentos financeiros de seu “pai rico” e “pai pobre”, mostrando como construir ativos, investir e alcançar independência financeira.'
    );

INSERT INTO autor (nome, data_nasc, biografia) VALUES
    (
        'Yuval Noah Harari',
        '1976-02-24',
        'Historiador israelense, professor da Universidade Hebraica de Jerusalém, autor de Sapiens, Homo Deus e 21 Lições para o Século 21.'
    ),
    (
        'Charles Duhigg',
        '1974-10-17',
        'Jornalista norte-americano vencedor do Prêmio Pulitzer, especializado em comportamento e produtividade, autor de O Poder do Hábito.'
    ),
    (
        'Daniel Kahneman',
        '1934-03-05',
        'Psicólogo e economista israelense, vencedor do Prêmio Nobel de Economia, pioneiro nos estudos sobre julgamento e tomada de decisão.'
    ),
    (
        'Carol S. Dweck',
        '1946-10-17',
        'Psicóloga americana e professora da Universidade de Stanford, reconhecida por suas pesquisas sobre mentalidade de crescimento.'
    ),
    (
        'George S. Clason',
        '1874-11-07',
        'Escritor e empresário americano, famoso por O Homem Mais Rico da Babilônia, que popularizou conceitos financeiros em parábolas.'
    ),
    (
        'Mark Manson',
        '1984-03-09',
        'Escritor e blogueiro norte-americano, conhecido por seus livros de autoajuda com abordagem irreverente e direta.'
    ),
    (
        'Greg McKeown',
        '1977-08-14',
        'Autor, palestrante e consultor britânico, especialista em liderança e tomada de decisão, autor de Essencialismo.'
    ),
    (
        'Robert Kiyosaki',
        '1947-04-08',
        'Empresário e escritor americano, autor de Pai Rico, Pai Pobre, obra de educação financeira de grande impacto mundial.'
    ),
    (
        'J. K. Rowling',
        '1965-07-31',
        'Escritora britânica criadora da série Harry Potter, uma das autoras mais lidas e traduzidas do mundo.'
    ),
    (
        'Stephen King',
        '1947-09-21',
        'Escritor norte-americano, mestre do terror, suspense e fantasia, autor de mais de 60 romances best-sellers.'
    );

INSERT INTO usuario (numero_ident, email, data_cadastro) VALUES
    (
        'U1001',
        'ana.silva@email.com',
        '2024-01-15'
    ),
    (
        'U1002',
        'joao.souza@email.com',
        '2024-02-20'
    ),
(
        'U1003',
        'maria.oliveira@email.com',
        '2024-03-05'
    ),
    (
        'U1004',
        'pedro.lima@email.com',
        '2024-04-12'
    ),
    (
        'U1005',
        'julia.costa@email.com',
        '2025-05-30'
    ),
    (
        'U1006',
        'rafael.pereira@email.com',
        '2025-06-18'
    ),
    (
        'U1007',
        'camila.alves@email.com',
        '2025-07-25'
    ),
    (
        'U1008',
        'lucas.martins@email.com',
        '2025-08-09'
    ),
    (
        'U1009',
        'fernanda.gomes@email.com',
        '2025-08-14'
    ),
    (
        'U1010',
        'rodrigo.ferreira@email.com',
        '2025-10-23'
    );

INSERT INTO nivel_usuario (nivel, id_usuario) VALUES
    ('Administrador', 1),
    ('Padrão', 2),
    ('Administrador', 3),
    ('Padrão', 4),
    ('Padrão', 5),
    ('Padrão', 6),
    ('Padrão', 7),
    ('Padrão', 8),
    ('Padrão', 9),
    ('Padrão', 10);

INSERT INTO categoria (nome) VALUES
    ('Ficção'),
    ('Romance'),
    ('Terror'),
    ('Suspense'),
    ('Fantasia'),
    ('Biografia'),
    ('Educação Financeira'),
    ('Drama'),
    ('Infantil'),
    ('Aventura');

INSERT INTO emprestimo (data_emprestimo, data_devolucao, data_devolucaoRealizada, id_livro, id_usuario) VALUES
    (
        '2024-01-15',
        '2024-01-29',
        '',
        1,
        2
    ),
    (
        '2024-03-10',
        '2024-03-24',
        '2024-03-25',
        3,
        5
    ),
    (
        '2024-05-22',
        '2024-06-05',
        '2024-06-04',
        2,
        1
    ),
    (
        '2024-07-01',
        '2024-07-15',
        '2024-07-18',
        4,
        6
    ),
    (
        '2024-09-12',
        '2024-09-26',
        '2024-09-24',
        5,
        3
    ),
    (
        '2024-11-05',
        '2024-11-19',
        '',
        7,
        4
    ),
    (
        '2025-01-18',
        '2025-02-01',
        '2025-02-02',
        6,
        7
    ),
    (
        '2025-03-03',
        '2025-03-17',
        '2025-03-16',
        8,
        8
    ),
    (
        '2025-05-09',
        '2025-05-23',
        '2025-05-24',
        9,
        9
    ),
    (
        '2025-07-21',
        '2025-08-04',
        '',
        10,
        10
    );

INSERT INTO livro_categoria (id_livro, id_categoria) VALUES
    (1, 8),
    (2, 9),
    (3, 10),
    (4, 9),
    (5, 3),
    (6, 9),
    (7, 10),
    (8, 9),
    (9, 4),
    (10, 5);

INSERT INTO autor_livro (id_livro, id_autor) VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 3),
    (6, 4),
    (7, 5),
    (8, 6),
    (9, 7),
    (10, 8);

-- Visualizar os dados que estão dentro de cada tabela
SELECT * FROM livro;

SELECT * FROM autor;

SELECT * FROM usuario;

SELECT * FROM nivel_usuario;

SELECT * FROM categoria;

SELECT * FROM emprestimo;

SELECT * FROM livro_categoria;

SELECT * FROM autor_livro;

-- Para visualizar as tabelas
SHOW tables;

-- Ver os campos de uma tabela especifica
DESCRIBE usuario;

-- Apagar tabela
-- DROP DATABASE biblioteca_yasmin;
