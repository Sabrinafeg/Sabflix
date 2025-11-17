-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS FilmesDB;
USE FilmesDB;

-- Tabela de Filmes
CREATE TABLE Filmes (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT
);

-- Tabela de Gêneros
CREATE TABLE Generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de relacionamento (muitos-para-muitos)
CREATE TABLE Filme_Genero (
    id_filme INT,
    id_genero INT,
    PRIMARY KEY (id_filme, id_genero),
    FOREIGN KEY (id_filme) REFERENCES Filmes(id_filme) ON DELETE CASCADE,
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero) ON DELETE CASCADE
);

-- Inserindo gêneros
INSERT INTO Generos (nome) VALUES
('Ação'),
('Aventura'),
('Drama'),
('Comédia'),
('Ficção Científica'),
('Romance'),
('Terror'),
('Suspense'),
('Animação'),
('Fantasia');

-- Inserindo 20 filmes
INSERT INTO Filmes (nome, descricao) VALUES
('Interestelar', 'Um grupo de astronautas viaja através de um buraco de minhoca em busca de um novo lar para a humanidade.'),
('O Senhor dos Anéis: A Sociedade do Anel', 'Um jovem hobbit embarca em uma jornada para destruir um anel poderoso.'),
('Titanic', 'Um romance proibido nasce a bordo do navio mais famoso do mundo.'),
('O Cavaleiro das Trevas', 'Batman enfrenta o caos provocado pelo Coringa em Gotham City.'),
('Matrix', 'Um hacker descobre que o mundo é uma simulação controlada por máquinas.'),
('Toy Story', 'Brinquedos ganham vida quando os humanos não estão por perto.'),
('Gladiador', 'Um general romano busca vingança contra o imperador que destruiu sua vida.'),
('Vingadores: Ultimato', 'Os heróis se unem para reverter o estalo de Thanos e salvar o universo.'),
('A Origem', 'Um ladrão invade os sonhos das pessoas para roubar segredos corporativos.'),
('O Rei Leão', 'Um jovem leão precisa reivindicar seu lugar como rei.'),
('Coringa', 'A origem sombria de um dos vilões mais icônicos da história.'),
('Forrest Gump', 'A vida de um homem simples que testemunha eventos marcantes da história americana.'),
('Jurassic Park', 'Dinossauros são recriados geneticamente e escapam do controle em um parque temático.'),
('Pantera Negra', 'O rei de Wakanda luta para proteger seu povo e seu legado.'),
('It: A Coisa', 'Um grupo de amigos enfrenta uma entidade aterrorizante que assume a forma de um palhaço.'),
('Up: Altas Aventuras', 'Um idoso embarca em uma viagem épica com um garoto escoteiro e uma casa voadora.'),
('O Exorcista', 'Uma jovem é possuída por uma entidade demoníaca e precisa de um exorcismo.'),
('Avatar', 'Um ex-fuzileiro naval se une a uma raça alienígena em um planeta exuberante.'),
('La La Land', 'Um pianista e uma atriz lutam por seus sonhos e seu amor em Los Angeles.'),
('O Lobo de Wall Street', 'A ascensão e queda de um corretor de ações ambicioso e sem escrúpulos.');

-- Relacionando filmes e gêneros
INSERT INTO Filme_Genero (id_filme, id_genero) VALUES
-- Interestelar
(1, 2), (1, 5), (1, 3),
-- Senhor dos Anéis
(2, 2), (2, 10), (2, 1),
-- Titanic
(3, 3), (3, 6),
-- O Cavaleiro das Trevas
(4, 1), (4, 8), (4, 3),
-- Matrix
(5, 1), (5, 5), (5, 8),
-- Toy Story
(6, 4), (6, 9), (6, 10),
-- Gladiador
(7, 1), (7, 3), (7, 2),
-- Vingadores: Ultimato
(8, 1), (8, 2), (8, 5),
-- A Origem
(9, 5), (9, 8), (9, 3),
-- O Rei Leão
(10, 9), (10, 10), (10, 3),
-- Coringa
(11, 3), (11, 8),
-- Forrest Gump
(12, 3), (12, 6),
-- Jurassic Park
(13, 2), (13, 5), (13, 1),
-- Pantera Negra
(14, 1), (14, 2), (14, 10),
-- It: A Coisa
(15, 7), (15, 8),
-- Up: Altas Aventuras
(16, 9), (16, 4), (16, 10),
-- O Exorcista
(17, 7), (17, 8),
-- Avatar
(18, 5), (18, 2), (18, 10),
-- La La Land
(19, 6), (19, 3),
-- O Lobo de Wall Street
(20, 3), (20, 4);

-- Consulta exemplo: listar filmes com seus gêneros
SELECT f.nome AS Filme, GROUP_CONCAT(g.nome SEPARATOR ', ') AS Generos
FROM Filmes f
JOIN Filme_Genero fg ON f.id_filme = fg.id_filme
JOIN Generos g ON g.id_genero = fg.id_genero
GROUP BY f.id_filme
ORDER BY f.nome;
