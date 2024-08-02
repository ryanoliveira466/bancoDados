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
('Celtic Football Club', 'Reino Unido', 'Escócia', '1887-11-06', 'Brendan Rodgers'),
('Manchester United Football Club', 'Reino Unido', 'Inglaterra', '1878-03-05', 'Erik ten Hag'),
('Manchester City Football Club', 'Reino Unido', 'Inglaterra', '1894-05-16', 'Pep Guardiola'),
('Futbol Club Barcelona', 'Barcelona', 'Espanha', '1899-10-29', 'Xavi'),
('Real Madrid Club de Fútbol', 'Madrid', 'Espanha', '1902-03-06', 'Carlo Ancelotti'),
('Paris Saint-Germain Football Club', 'Paris', 'França', '1970-08-12', 'Luis Enrique'),
('Liverpool Football Club', 'Reino Unido', 'Inglaterra', '1892-06-03', 'Jürgen Klopp'),
('Juventus Football Club', 'Turim', 'Itália', '1897-10-01', 'Massimiliano Allegri');

CREATE TABLE jogadores(
    id_jogador INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_jogador VARCHAR(50) NOT NULL,
    posicao_jogador VARCHAR(50) NOT NULL,
    idade_jogador INT NOT NULL,
    altura_jogador DECIMAL(3,2) NOT NULL,
    peso_jogador DECIMAL(5,2) NOT NULL,
    num_camisa INT NOT NULL
);

INSERT INTO jogadores(nome_jogador, posicao_jogador, idade_jogador, altura_jogador, peso_jogador, num_camisa)
VALUES
('Odsonne Édouard', 'Atacante', 26, 1.87, 77, 22),
('Lionel Messi', 'Atacante', 36, 1.70, 72, 30), 
('Cristiano Ronaldo', 'Atacante', 39, 1.87, 83, 7),
('Kevin De Bruyne', 'Meio-campista', 32, 1.81, 70, 17),
('Pedri', 'Meio-campista', 20, 1.74, 60, 16),
('Karim Benzema', 'Atacante', 36, 1.85, 81, 9),
('Mohamed Salah', 'Atacante', 31, 1.75, 71, 11),
('Federico Chiesa', 'Atacante', 26, 1.75, 70, 22);

CREATE TABLE jogos(
    id_partida INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    hora_partida TIME NOT NULL,
    local_partida VARCHAR(50) NOT NULL,
    time_casa VARCHAR(50) NOT NULL,
    time_fora VARCHAR(50) NOT NULL,
    resultado_partida VARCHAR(50) 
);

INSERT INTO jogos(hora_partida, local_partida, time_casa, time_fora, resultado_partida)
VALUES
('20:00:00', 'Old Trafford', 'Manchester United Football Club', 'Liverpool Football Club', '2-1'),
('18:30:00', 'Camp Nou', 'Futbol Club Barcelona', 'Real Madrid Club de Fútbol', '1-1'),
('21:00:00', 'Etihad Stadium', 'Manchester City Football Club', 'Paris Saint-Germain Football Club', '3-2'),
('19:45:00', 'Allianz Stadium', 'Juventus Football Club', 'Futbol Club Barcelona', '0-0'),
('20:30:00', 'Parc des Princes', 'Paris Saint-Germain Football Club', 'Real Madrid Club de Fútbol', '2-2'),
('17:15:00', 'Anfield', 'Liverpool Football Club', 'Manchester United Football Club', '1-1'),
('16:00:00', 'Celtic Park', 'Celtic Football Club', 'Manchester City Football Club', '1-3'),
('21:30:00', 'Santiago Bernabéu Stadium', 'Real Madrid Club de Fútbol', 'Juventus Football Club', '3-1');

CREATE TABLE estatisticas(
	id_estatistica INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	gols_time_casa INT,
	gols_time_fora INT,
	assistencia_casa INT,
	assistencia_fora INT,
	cartoes_amarelos_casa INT,
	cartoes_amarelos_fora INT,
    id_jogador INT,
	CONSTRAINT Fk_Jogadores_Estatisticas
    FOREIGN KEY (id_jogador) REFERENCES jogadores(id_jogador),
    id_clube INT,
    CONSTRAINT FK_Clubes_Estatisticas
    FOREIGN KEY (id_clube) REFERENCES clubes(id_clube)
);






-- Qual é a lista completa de jogadores que fazem parte do time de futsal?

SELECT * FROM jogadores;









-- Quantas partidas o time já jogou nesta temporada?

SELECT (SELECT COUNT(time_casa) FROM jogos WHERE time_casa = 'Real Madrid Club de Fútbol') + (SELECT COUNT(time_fora) FROM jogos WHERE time_fora = 'Real Madrid Club de Fútbol') AS partida_total;









-- Qual foi o resultado da última partida disputada pelo time?

ALTER TABLE jogos ADD dia_jogo DATE NOT NULL

UPDATE jogos
SET dia_jogo = '2024-03-06'
WHERE id_partida = 1;

UPDATE jogos
SET dia_jogo = '2024-02-12'
WHERE id_partida = 2;

UPDATE jogos
SET dia_jogo = '2024-01-24'
WHERE id_partida = 3; 

UPDATE jogos
SET dia_jogo = '2024-02-01'
WHERE id_partida = 4; 

UPDATE jogos
SET dia_jogo = '2024-01-15'
WHERE id_partida = 5; 

UPDATE jogos
SET dia_jogo = '2024-01-19'
WHERE id_partida = 6; 

UPDATE jogos
SET dia_jogo = '2024-02-22'
WHERE id_partida = 7; 

UPDATE jogos
SET dia_jogo = '2024-02-04'
WHERE id_partida = 8;

SELECT id_partida, resultado_partida, dia_jogo FROM jogos
WHERE time_casa = 'Real Madrid Club de Fútbol' OR time_fora = 'Real Madrid Club de Fútbol' AND dia_jogo < CURRENT_DATE
ORDER BY dia_jogo DESC;













-- Quais jogadores têm mais gols marcados na temporada?


INSERT INTO estatisticas
(gols_time_casa, gols_time_fora, assistencia_casa, assistencia_fora, cartoes_amarelos_casa, cartoes_amarelos_fora, id_jogador, id_clube)
VALUES
(2, 1, 1, 0, 1, 2, (SELECT id_jogador FROM jogadores WHERE nome_jogador = 'Odsonne Édouard'), (SELECT id_clube FROM clubes WHERE nome_clube = 'Celtic Football Club')),
(3, 2, 2, 1, 0, 1, (SELECT id_jogador FROM jogadores WHERE nome_jogador = 'Lionel Messi'), (SELECT id_clube FROM clubes WHERE nome_clube = 'Paris Saint-Germain Football Club')),
(1, 0, 1, 0, 2, 1, (SELECT id_jogador FROM jogadores WHERE nome_jogador = 'Cristiano Ronaldo'), (SELECT id_clube FROM clubes WHERE nome_clube = 'Manchester United Football Club')),
(0, 3, 0, 2, 1, 0, (SELECT id_jogador FROM jogadores WHERE nome_jogador = 'Kevin De Bruyne'), (SELECT id_clube FROM clubes WHERE nome_clube = 'Manchester City Football Club')),
(2, 2, 1, 1, 1, 1, (SELECT id_jogador FROM jogadores WHERE nome_jogador = 'Pedri'), (SELECT id_clube FROM clubes WHERE nome_clube = 'Futbol Club Barcelona')),
(3, 1, 2, 0, 0, 2, (SELECT id_jogador FROM jogadores WHERE nome_jogador = 'Karim Benzema'), (SELECT id_clube FROM clubes WHERE nome_clube = 'Real Madrid Club de Fútbol')),
(1, 2, 0, 1, 2, 0, (SELECT id_jogador FROM jogadores WHERE nome_jogador = 'Mohamed Salah'), (SELECT id_clube FROM clubes WHERE nome_clube = 'Liverpool Football Club')),
(2, 1, 1, 1, 1, 1, (SELECT id_jogador FROM jogadores WHERE nome_jogador = 'Federico Chiesa'), (SELECT id_clube FROM clubes WHERE nome_clube = 'Juventus Football Club'));

ALTER TABLE estatisticas ADD gols_total INT NOT NULL;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 1;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 2;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 3;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 4;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 5;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 6;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 7;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 8;

SELECT jogadores.nome_jogador, estatisticas.gols_total
FROM estatisticas
INNER JOIN jogadores
ON estatisticas.id_jogador = jogadores.id_jogador
WHERE estatisticas.gols_total
ORDER BY gols_total DESC;








-- Qual é a média de gols por partida do time até agora?
SELECT gols_total FROM estatisticas WHERE id_clube = 5 AS gols_total / ((SELECT COUNT(*) FROM jogos WHERE time_fora = 'Real Madrid Club de Fútbol') + (SELECT COUNT(*) FROM jogos WHERE time_casa = 'Real Madrid Club de Fútbol')) AS partida_total


 --Funcionando 

--Aqui eu coloco todo o calculo em um parênteses apenas, isso evitou o erro do 'Subquery returns more than 1 row' porque o select é apenas o resultado do cálculo e não o resto todo
SELECT 
    (SELECT gols_total FROM estatisticas WHERE id_clube = 2) / 
    ((SELECT COUNT(*) FROM jogos WHERE time_fora = 'Manchester United Football Club') + 
    (SELECT COUNT(*) FROM jogos WHERE time_casa = 'Manchester United Football Club')) 
AS avg_gols_por_partida




gols_total FROM estatisticas WHERE id_clube = 5 AS gols_total,


--Karim e Cris

UPDATE estatisticas
SET id_clube = 2
WHERE id_clube = 6


--







-- Subquery returns more than 1 row

SELECT
((SELECT gols_time_casa FROM estatisticas WHERE id_clube = 5) + (SELECT gols_time_fora FROM estatisticas WHERE id_clube = 5)) / ((SELECT COUNT(time_casa) FROM jogos WHERE time_casa = 'Real Madrid Club de Fútbol') + (SELECT COUNT(time_fora) FROM jogos WHERE time_fora = 'Real Madrid Club de Fútbol'))


SELECT AVG(gols_time_casa + gols_time_fora)
FROM estatisticas
WHERE id_clube = 1







--Quem são os jogadores que têm mais cartões amarelos acumulados?

ALTER TABLE estatisticas ADD amarelos_totais INT NOT NULL

UPDATE estatisticas
SET amarelos_totais = (cartoes_amarelos_casa + cartoes_amarelos_fora)
WHERE id_jogador = 1;

UPDATE estatisticas
SET amarelos_totais = (cartoes_amarelos_casa + cartoes_amarelos_fora)
WHERE id_jogador = 2;

UPDATE estatisticas
SET amarelos_totais = (cartoes_amarelos_casa + cartoes_amarelos_fora)
WHERE id_jogador = 3;

UPDATE estatisticas
SET amarelos_totais = (cartoes_amarelos_casa + cartoes_amarelos_fora)
WHERE id_jogador = 4;

UPDATE estatisticas
SET amarelos_totais = (cartoes_amarelos_casa + cartoes_amarelos_fora)
WHERE id_jogador = 5;

UPDATE estatisticas
SET amarelos_totais = (cartoes_amarelos_casa + cartoes_amarelos_fora)
WHERE id_jogador = 6;

UPDATE estatisticas
SET amarelos_totais = (cartoes_amarelos_casa + cartoes_amarelos_fora)
WHERE id_jogador = 7;

UPDATE estatisticas
SET amarelos_totais = (cartoes_amarelos_casa + cartoes_amarelos_fora)
WHERE id_jogador = 8;

SELECT jogadores.nome_jogador, estatisticas.amarelos_totais
FROM estatisticas
INNER JOIN jogadores
ON estatisticas.id_jogador = jogadores.id_jogador
WHERE estatisticas.amarelos_totais
ORDER BY amarelos_totais DESC;







--Quantas faltas foram cometidas pelo time até agora na temporada?

SELECT SUM(estatisticas.cartoes_amarelos_casa) + SUM(estatisticas.cartoes_amarelos_fora) AS falta_total
FROM estatisticas
WHERE id_clube = 5






--Quais são as informações dos jogadores que jogaram em cada partida e em qual time eles estavam?

SELECT jogadores.id_jogador, jogadores.nome_jogador, jogadores.posicao_jogador, jogadores.idade_jogador , clubes.nome_clube, (SELECT COUNT(*) FROM jogos WHERE time_casa = 'Real Madrid Club de Fútbol') AS quantidade_jogadas_casa
FROM estatisticas
INNER JOIN clubes
ON clubes.id_clube = estatisticas.id_clube
INNER JOIN jogadores
ON jogadores.id_jogador = estatisticas.id_jogador
WHERE clubes.nome_clube IN (SELECT time_casa FROM jogos WHERE time_casa = 'Real Madrid Club de Fútbol')

UPDATE estatisticas
SET id_clube = 5
WHERE id_jogador = 3

UPDATE estatisticas
SET id_clube = 2
WHERE id_jogador = 3

--Funciona com 2 jogadores sendo do Real Madrid



-- Colocar IN resolve o problema de retornar mais de uma coluna
--Subquery returns more than 1 row


--Quantidade fora
SELECT jogadores.id_jogador, jogadores.nome_jogador, jogadores.posicao_jogador, jogadores.idade_jogador, (SELECT COUNT(*) FROM jogos WHERE time_fora = 'Real Madrid Club de Fútbol') AS quantidade_jogadas_fora
FROM estatisticas
INNER JOIN clubes
ON clubes.id_clube = estatisticas.id_clube
INNER JOIN jogadores
ON jogadores.id_jogador = estatisticas.id_jogador
WHERE clubes.nome_clube IN (SELECT time_fora FROM jogos WHERE time_fora = 'Real Madrid Club de Fútbol')

--Quantidade casa
SELECT jogadores.id_jogador, jogadores.nome_jogador, jogadores.posicao_jogador, jogadores.idade_jogador, (SELECT COUNT(*) FROM jogos WHERE time_casa = 'Real Madrid Club de Fútbol') AS quantidade_jogadas_casa
FROM estatisticas
INNER JOIN clubes
ON clubes.id_clube = estatisticas.id_clube
INNER JOIN jogadores
ON jogadores.id_jogador = estatisticas.id_jogador
WHERE clubes.nome_clube IN (SELECT time_casa FROM jogos WHERE time_casa = 'Real Madrid Club de Fútbol')




--Quais são as informações dos jogadores que têm mais de 10 gols na temporada atual?


UPDATE estatisticas
SET gols_time_casa = 15
WHERE id_jogador = 6


--Aparentemente os dados não atualizam automaticamente


UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 1;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 2;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 3;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 4;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 5;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 6;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 7;

UPDATE estatisticas
SET gols_total = (gols_time_casa + gols_time_fora)
WHERE id_jogador = 8;



SELECT jogadores.id_jogador, jogadores.nome_jogador, jogadores.posicao_jogador, jogadores.idade_jogador, estatisticas.gols_total
FROM estatisticas
INNER JOIN jogadores
ON jogadores.id_jogador = estatisticas.id_jogador
WHERE gols_total >= 10
ORDER BY gols_total DESC;


UPDATE estatisticas
SET gols_time_casa = 15
WHERE id_jogador = 6




--Qual é o ranking dos times com base no número de vitórias na temporada atual?


ALTER TABLE jogos ADD venceu_casa VARCHAR(50);

ALTER TABLE jogos ADD venceu_fora VARCHAR(50);

UPDATE jogos
SET venceu_casa = 'Venceu'
WHERE id_partida = 1;

UPDATE jogos
SET venceu_casa = 'Venceu'
WHERE id_partida = 3;

UPDATE jogos
SET venceu_fora = 'Venceu'
WHERE id_partida = 7;

UPDATE jogos
SET venceu_casa = 'Venceu'
WHERE id_partida = 8;



--ahhhhhhhhhhhhhhhhh

SELECT time_fora
FROM jogos
WHERE venceu_fora = 'Venceu'

SELECT time_casa
FROM jogos
WHERE venceu_casa = 'Venceu'









--Quais são as partidas em que um determinado jogador jogou e qual foi o resultado da partida? 

--Resultado fora
SELECT jogadores.nome_jogador, (SELECT COUNT(*) FROM jogos WHERE time_fora = 'Real Madrid Club de Fútbol') AS quantidade_jogadas_fora,
jogos.resultado_partida AS resultado_partida,
jogos.time_casa AS time_adversário,
clubes.nome_clube AS time_selecionado
FROM estatisticas
INNER JOIN clubes
ON clubes.id_clube = estatisticas.id_clube
INNER JOIN jogadores
ON jogadores.id_jogador = estatisticas.id_jogador
INNER JOIN jogos
ON jogos.time_fora = clubes.nome_clube
WHERE clubes.nome_clube IN (SELECT time_fora FROM jogos WHERE time_fora = 'Real Madrid Club de Fútbol')





--Resultado casa
SELECT jogadores.nome_jogador, (SELECT COUNT(*) FROM jogos WHERE time_casa = 'Real Madrid Club de Fútbol') AS quantidade_jogadas_casa,
jogos.resultado_partida AS resultado_partida,
clubes.nome_clube AS time_selecionado,
jogos.time_fora AS time_adversário
FROM estatisticas
INNER JOIN clubes
ON clubes.id_clube = estatisticas.id_clube
INNER JOIN jogadores
ON jogadores.id_jogador = estatisticas.id_jogador
INNER JOIN jogos
ON jogos.time_casa = clubes.nome_clube
WHERE clubes.nome_clube IN (SELECT time_casa FROM jogos WHERE time_casa = 'Real Madrid Club de Fútbol')




