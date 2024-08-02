CREATE DATABASE Campeonato_ProfIuri;

USE Campeonato_ProfIuri;

a) Tabela de Times: com informações sobre cada time, como
nome, cidade, estado, país, data de fundação, técnico, entre outros. 

CREATE TABLE clubes(
    id_clube INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_clube VARCHAR(50) NOT NULL,
    estado_clube VARCHAR(50) NOT NULL,
    pais_clube VARCHAR(50) NOT NULL,
    fundacao_clube DATE NOT NULL,
    tecnico_clube VARCHAR(50) NOT NULL
);

INSERT INTO clubes 
(nome_clube, estado_clube, pais_clube, fundacao_clube, tecnico_clube)
VALUES
("Celtic Football Club", "Reino Unido", "Escócia", "1887-11-06", "Brendan Rodgers"),
("Manchester United Football Club", "Reino Unido", "Inglaterra", "1876-03-05", "Erik ten Hag"),
("Paris Saint-Germain Football Club", "Île-de-France", "França", "1970-08-12", "Luis Enrique"),
("Società Sportiva Lazio", "Roma", "Italia", "1900-01-09", "Maurizio Sarri"),
("Futbolniy Klub Shakhtar", "Donetsk", "Ucrânia", "1936-05-24", "Marino Pusic"),
("Chelsea Football Club", "Londres", "Reino Unido", "1905-03-10", "Mauricio Pochettino"),
("Sport Club Corinthians Paulista", "São Paulo", "Brasil", "1910-09-01", "Antonio Oliveira"),
("Sampaio Corrêa", "Maranhão", "Brasil", "1923-03-25", "Thiago Gomes");


b) Tabela de Jogadores: com informações sobre cada jogador, como 
nome, posição, idade, altura, peso, número da camisa. 

CREATE TABLE jogadores(
    id_jogador INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_jogador VARCHAR(50) NOT NULL,
    posicao_jogador VARCHAR(50) NOT NULL,
    idade_jogador INT NOT NULL,
    altura_jogador DECIMAL(3,2) NOT NULL,
    peso_jogador DECIMAL(5,2) NOT NULL,
    num_camisa INT NOT NULL
);

-- Celtic Football Club
INSERT INTO jogadores (nome_jogador, posicao_jogador, idade_jogador, altura_jogador, peso_jogador, num_camisa)
VALUES ('Liam McGregor', 'Meio-campo', 28, 1.75, 70, 8);

-- Manchester United Football Club
INSERT INTO jogadores (nome_jogador, posicao_jogador, idade_jogador, altura_jogador, peso_jogador, num_camisa)
VALUES ('Harry Maguire', 'Zagueiro', 29, 1.94, 94, 5);

-- Paris Saint-Germain Football Club
INSERT INTO jogadores (nome_jogador, posicao_jogador, idade_jogador, altura_jogador, peso_jogador, num_camisa)
VALUES ('Kylian Mbappé', 'Atacante', 24, 1.78, 73, 7);

-- Società Sportiva Lazio
INSERT INTO jogadores (nome_jogador, posicao_jogador, idade_jogador, altura_jogador, peso_jogador, num_camisa)
VALUES ('Ciro Immobile', 'Atacante', 32, 1.85, 85, 17);

-- Futbolniy Klub Shakhtar
INSERT INTO jogadores (nome_jogador, posicao_jogador, idade_jogador, altura_jogador, peso_jogador, num_camisa)
VALUES ('Taison', 'Meio-campo', 34, 1.73, 68, 28);

-- Chelsea Football Club
INSERT INTO jogadores (nome_jogador, posicao_jogador, idade_jogador, altura_jogador, peso_jogador, num_camisa)
VALUES ('N''Golo Kanté', 'Meio-campo', 31, 1.68, 70, 7);

-- Sport Club Corinthians Paulista
INSERT INTO jogadores (nome_jogador, posicao_jogador, idade_jogador, altura_jogador, peso_jogador, num_camisa)
VALUES ('Gabriel Barbosa', 'Atacante', 26, 1.80, 78, 9);

-- Sampaio Corrêa
INSERT INTO jogadores (nome_jogador, posicao_jogador, idade_jogador, altura_jogador, peso_jogador, num_camisa)
VALUES ('Luiz Otávio', 'Zagueiro', 29, 1.87, 82, 4);

c) Tabela de Jogos: com informações sobre cada jogo, 
como data, hora, local, time da casa e time de fora, resultado.

CREATE TABLE jogos(
    id_partida INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    hora_partida TIME NOT NULL,
    local_partida VARCHAR(50) NOT NULL,
    time_casa VARCHAR(50) NOT NULL,
    time_fora VARCHAR(50) NOT NULL,
    resultado_partida VARCHAR(3) NOT NULL
);

-- Jogo 1: Celtic vs Manchester United
INSERT INTO jogos (hora_partida, local_partida, time_casa, time_fora, resultado_partida)
VALUES ('15:00:00', 'Estádio Celtic Park', 'Celtic Football Club', 'Manchester United Football Club', '2-3');

-- Jogo 2: Paris Saint-Germain vs Lazio
INSERT INTO jogos (hora_partida, local_partida, time_casa, time_fora, resultado_partida)
VALUES ('18:30:00', 'Parc des Princes', 'Paris Saint-Germain Football Club', 'Società Sportiva Lazio', '2-1');

-- Jogo 3: Shakhtar vs Chelsea
INSERT INTO jogos (hora_partida, local_partida, time_casa, time_fora, resultado_partida)
VALUES ('20:00:00', 'Donbass Arena', 'Futbolniy Klub Shakhtar', 'Chelsea Football Club', '5-4');

-- Jogo 4: Corinthians vs Sampaio Corrêa
INSERT INTO jogos (hora_partida, local_partida, time_casa, time_fora, resultado_partida)
VALUES ('16:00:00', 'Arena Corinthians', 'Sport Club Corinthians Paulista', 'Sampaio Corrêa', '8-3');

d) Tabela de Estatísticas: com informações sobre as estatísticas de cada 
time, gols da casa e de fora, assistências, 
cartões amarelos e vermelhos
CREATE TABLE jogos(
    id_partida INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    hora_partida TIME NOT NULL,
    local_partida VARCHAR(50) NOT NULL,
    time_casa VARCHAR(50) NOT NULL,
    time_fora VARCHAR(50) NOT NULL,
    resultado_partida VARCHAR(3) NOT NULL
);


CREATE TABLE estatisticas(
    id_estatisticas INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    gols_casa INT NOT NULL,
    gols_fora INT NOT NULL,
    assistencias INT NOT NULL,
    cartoes_amarelos INT NOT NULL,
    cartoes_vermelhos INT NOT NULL,
    id_partida INT NOT NULL,
    CONSTRAINT FK_Jogo
    FOREIGN KEY (id_partida) REFERENCES  
)



-- Qual é a lista completa de jogadores que fazem parte do time de futsal?

SELECT jogadores.nome_jogador, clubes.nome_clube
FROM estatisticas

INNER JOIN jogadores 
ON jogadores.id_jogador = estatisticas.id_jogador

INNER JOIN clubes 
ON clubes.id_clube = estatisticas.id_clube

WHERE clubes.nome_clube = "Manchester United Football Club"

-- Quantas partidas o time já jogou nesta temporada?
-- Simples
SELECT 
COUNT(id_clube) AS 'Celtic'
FROM estatisticas
WHERE id_clube = 1

-- Complexa
SELECT COUNT(estatisticas.id_clube) AS 'Qtd. Jogos', clubes.nome_clube
FROM estatisticas
INNER JOIN clubes
ON clubes.id_clube = estatisticas.id_clube
WHERE clubes.nome_clube = 'Celtic Football Club'

-- Qual foi o resultado da última partida disputada pelo time?

INSERT INTO jogos (hora_partida, local_partida, time_casa, time_fora, resultado_partida, data_jogo)
VALUES ('15:00:00', 'Estádio Celtic Park', 'Celtic Football Club', 'Futbolniy Klub Shakhtar', '5-3', '2024-03-14');

ALTER TABLE jogos
ADD COLUMN data_jogo DATE NOT NULL


UPDATE jogos
SET data_jogo = '2024-03-06'
WHERE id_partida = 1;

UPDATE jogos
SET data_jogo = '2024-02-12'
WHERE id_partida = 2;

UPDATE jogos
SET data_jogo = '2024-01-24'
WHERE id_partida = 3; 

UPDATE jogos
SET data_jogo = '2024-02-01'
WHERE id_partida = 4; 

SELECT resultado_partida
FROM jogos
WHERE time_casa = 'Celtic Football Club'
ORDER BY data_jogo DESC LIMIT 1

-- Quais jogadores têm mais gols marcados na temporada?
SELECT nome_jogador, gols
FROM jogadores
ORDER BY gols DESC LIMIT 3

-- Qual é a média de gols por partida do time até agora?

SELECT AVG(gols_time_casa) AS 'Media Gols'
FROM estatisticas
WHERE id_clube = 1

-- Quem são os jogadores que têm mais cartões amarelos acumulados?

SELECT jogadores.nome_jogador, estatisticas.cartoes_amarelos_casa
FROM estatisticas
INNER JOIN jogadores
ON jogadores.id_jogador = estatisticas.id_jogador
ORDER BY estatisticas.cartoes_amarelos_casa DESC LIMIT 3



-- Quantas faltas foram cometidas pelo time até agora na temporada?

ALTER TABLE estatisticas
ADD COLUMN faltas INT

SELECT c.nome_clube, SUM(e.faltas) AS 'Faltas'
FROM estatisticas e
INNER JOIN clubes c
ON c.id_clube = e.id_clube
WHERE c.nome_clube = 'PSG'

-- VERSÃO COM LIKE %
SELECT c.nome_clube, SUM(e.faltas) AS 'Faltas'
FROM estatisticas e
INNER JOIN clubes c
ON c.id_clube = e.id_clube
WHERE c.nome_clube LIKE 'Celtic%'

-- Quais são as informações dos jogadores que jogaram em cada partida e em qual time eles estavam?
-- O jogador sempre corresponde ao time da casa na tab estatisticas
SELECT clubes.nome_clube AS 'Time', j.nome_jogador, j.posicao_jogador, j.idade_jogador, j.altura_jogador, j.peso_jogador, j.num_camisa
FROM estatisticas
INNER JOIN jogadores j
ON j.id_jogador = estatisticas.id_jogador
INNER JOIN clubes
ON clubes.id_clube = estatisticas.id_clube

-- Quais são as partidas em que um determinado jogador jogou e qual foi o resultado da partida?

SELECT e.id_estatistica, j.nome_jogador, c.nome_clube, e.gols_time_casa, e.gols_time_fora
FROM estatisticas e
INNER JOIN jogadores j
ON j.id_jogador = e.id_jogador
INNER JOIN clubes c
ON c.id_clube = e.id_clube

-- Quais são as informações dos jogadores que têm mais de 10 gols na temporada atual?

SELECT * FROM jogadores
WHERE gols > 10

-- Qual é o ranking dos times com base no número de vitórias na temporada atual?

-- times de casa ganham
SELECT c.nome_clube, e.gols_time_casa, e.gols_time_fora
FROM estatisticas e
INNER JOIN clubes c
ON c.id_clube = e.id_clube
WHERE e.gols_time_casa > e.gols_time_fora
ORDER BY e.gols_time_casa DESC LIMIT 1

-- times de fora ganham
SELECT c.nome_clube, e.gols_time_fora, e.gols_time_casa
FROM estatisticas e
INNER JOIN clubes c
ON c.id_clube = e.id_clube
WHERE e.gols_time_fora > e.gols_time_casa
ORDER BY e.gols_time_fora DESC LIMIT 1

--RESPOSTA COM ALTERAÇÃO NA TABELA
ALTER TABLE estatisticas
ADD COLUMN vitoria VARCHAR(50)

-- Qual é o ranking dos times com base no número de vitórias na temporada atual?

SELECT c.nome_clube, count(e.vitoria) AS 'Num. Vitórias'
FROM estatisticas e
INNER JOIN clubes c
ON c.id_clube = e.id_clube
WHERE e.vitoria = 'Venceu'
GROUP BY c.nome_clube DESC
ORDER BY count(e.vitoria) DESC 

