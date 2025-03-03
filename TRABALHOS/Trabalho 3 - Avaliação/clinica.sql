-- 1) Para iniciarmos, crie um banco de dados com o nome
Clínica;

CREATE DATABASE clínica;

-- 2) Crie as seguintes tabelas:

CREATE TABLE ambulatorios(
id_amb INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
andar INT NOT NULL,
capacidade INT
)







CREATE TABLE medicos(
id_m INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(40) NOT NULL,
idade INT NOT NULL,
especialidade VARCHAR(20),
CPF VARCHAR(11) UNIQUE,
cidade VARCHAR(30),
id_amb INT,
CONSTRAINT FK_Ambulatorio_Medicos
FOREIGN KEY (id_amb) REFERENCES ambulatorios(id_amb)
)







CREATE TABLE pacientes(
id_p INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(40) NOT NULL,
idade SMALLINT NOT NULL,
cidade VARCHAR(30),
CPF NUMERIC(11) UNIQUE,
doenca VARCHAR(40) NOT NULL
)





CREATE TABLE funcionarios(
id_f INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome VARCHAR(40) NOT NULL,
idade SMALLINT,
CPF VARCHAR(11) UNIQUE,
cidade VARCHAR(30),
salario NUMERIC(10),
cargo VARCHAR(20)
)






CREATE TABLE consultas(
id_c INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
dia DATE NOT NULL,
hora TIME NOT NULL,
id_m INT,
CONSTRAINT FK_Consultas_Medicos
FOREIGN KEY (id_m) REFERENCES medicos(id_m),
id_p INT,
CONSTRAINT FK_Consultas_Paciente
FOREIGN KEY (id_p) REFERENCES pacientes(id_p)
)




-- 3) Agora insira 5 linhas de dados na tabelas: ambulatorio,
-- medico, paciente, funcionários e insira 10 linhas de código na
-- tabela consultas.

INSERT INTO ambulatorios(andar, capacidade)
VALUES
(1,30),
(2,40),
(3,20),
(4,50),
(5,10)


INSERT INTO medicos(nome, idade, especialidade, CPF, cidade, id_amb)
VALUES
('Tiago',30,'Cardiologista',09854532167,'Porto Alegre',1),
('Maria',24,'Neurologista',097436216863,'Pernambuco',2),
('José',50,'Oftalmologista',65489743213,'Minas Gerais',3),
('Eduardo',44,'Psiquiatra',98734512876,'Rio de Janeiro',4),
('Thalita',35,'Pediatra',42398709541,'Espírito Santo',5)




INSERT INTO pacientes(nome, idade, cidade, CPF, doenca)
VALUES
('Karla',23,'São Paulo',23409876587,'Doença 1'),
('Josiane',40,'Pará',76534587612,'Doença 2'),
('Pedro',33,'Minas Gerais',098567876232,'Doença 3'),
('Henrique',60,'Porto Alegre',43287609823,'Doença 4'),
('Alberto',53,'Ceará',65489023412,'Doença 5')




INSERT INTO funcionarios(nome, idade, CPF, cidade, salario, cargo)
VALUES
('Luis',18,98765400987,'Ceará',1200,'Jovem Aprendiz'),
('Cristiano',44,87643296511,'Amazonas',3000,'Atendente'),
('Patrícia',30,34532176533,'Brasília',2300,'Limpeza'),
('Laura',25,76589754312,'Sergipe',2500,'Vigilante'),
('Marcos',67,098443765121,'Acre',3200,'Analista de Dados')




INSERT INTO consultas(id_m, id_p, dia, hora)
VALUES
(1,1,'2024-03-12','12:00:00'),
(2,2,'2024-04-29','13:00:00'),
(3,3,'2024-02-28','09:00:00'),
(4,4,'2024-05-09','15:00:00'),
(5,5,'2024-06-05','10:00:00'),
(1,2,'2024-03-01','11:00:00'),
(2,3,'2024-07-17','14:00:00'),
(3,4,'2024-08-14','20:00:00'),
(4,5,'2024-04-05','18:00:00'),
(5,1,'2024-05-27','17:00:00'),
(5,5,'2024-04-07','08:30:00')







-- 4) Resolva estes problemas:
-- a) O segundo paciente da lista se mudou para Ilhota;


UPDATE pacientes
SET cidade = 'Ilhota'
WHERE id_p = 2










-- b) A consulta do médico 1 com o paciente 4 foi marcada
--para as 12 horas do dia 4 de novembro de 2021;


UPDATE consultas
SET id_m = 1, id_p = 4, hora = '12:00:00', dia = '2024-11-04'
WHERE id_c = 11












-- c) O funcionário 4 deixou a clínica;

DELETE FROM funcionarios
WHERE id_f = 4











-- d) Foram contratados 2 novos funcionários. O funcionário
-- Matheus e a funcionária Martina;


INSERT INTO funcionarios (nome, idade, CPF, cidade, salario, cargo)
VALUES
('Andrieli',47,11265400887,'Goiás',4000,'Gerente'),
('Mario',22,15643256511,'Bahia',3000,'Atendente')











-- e) Delete o paciente 3 pela doença e adicione um novo
-- com a mesma doença;

DELETE FROM pacientes
WHERE doenca = 'Doença 3' AND id_p = 3;

-- Fazendo esse comando temos o erro 
-- /* Erro SQL (1451): Cannot delete or update a parent row: a foreign key constraint fails (`clínica`.`consultas`, CONSTRAINT `FK_Consultas_Paciente` FOREIGN KEY (`id_p`) REFERENCES `pacientes` (`id_p`)) */
-- Acredito que não posso deletar a FOREIGN KEY 3 pois ela é referênciada na tabela ''consultas''
-- Então já que o paciente 3 vai sair da clínica, suas consultas também serão canceladas.

DELETE FROM consultas
WHERE id_p = 3


-- O comando novamente
DELETE FROM pacientes
WHERE doenca = 'Doença 3' AND id_p = 3;

INSERT INTO pacientes(nome, idade, cidade, CPF, doenca)
VALUES
('Ademir',59,'Rio Grande do Norte',66690624581,'Doença 3')

UPDATE pacientes
SET id_p = 6
WHERE nome = 'Ademir'

ALTER TABLE pacientes AUTO_INCREMENT = 6










-- f) Os pacientes com idade inferior a 24 anos deixaram a
-- clínica.

-- O mesmo erro da anterior

SELECT * FROM pacientes
WHERE idade < 24


DELETE FROM consultas
WHERE id_p = 1

DELETE FROM pacientes
WHERE id_p = 1







-- 5) Busque as seguintes informações filtrando os dados:

-- a) Buscar os dados dos ambulatórios que possuem
-- capacidade superior à 30;
 
 SELECT * FROM ambulatorios
 WHERE capacidade > 30
 




-- b) Buscar os dados dos médicos com menos de 40 anos
-- ou com especialidade traumatologia;

SELECT * FROM medicos
WHERE idade < 40 OR especialidade = 'Traumatologia' 
 




-- c) Buscar os códigos dos médicos e os códigos dos
-- pacientes, para todas as consultas marcadas no período
-- da tarde (a partir das 13h) após o dia 15/05/2022 (caso
-- não tenha, insira na tabela ou modifique e coloque o
-- UPDATE também na resposta dessa questão);

SELECT id_m, id_p
FROM consultas
WHERE dia > '2024-05-15' AND hora > '13:00:00'






-- d) Buscar o nome e a idade dos pacientes que não
-- residem em Passo Fundo;

SELECT nome, idade
FROM pacientes
WHERE cidade != 'Passo Fundo'




-- e) Buscar o nome e a idade (em meses) dos pacientes;

SELECT nome, idade * 12
FROM pacientes






-- f) Qual o menor e o maior salário dos funcionários de
-- Passo Fundo?

UPDATE funcionarios
SET cidade = 'Passo Fundo'
WHERE id_f = 6

UPDATE funcionarios
SET cidade = 'Passo Fundo'
WHERE id_f = 7

SELECT MAX(salario)
FROM funcionarios
WHERE cidade = 'Passo Fundo'

SELECT MIN(salario)
FROM funcionarios
WHERE cidade = 'Passo Fundo'




-- g) Qual a média de idade dos médicos e o total de
-- ambulatórios atendidos por eles?

SELECT COUNT(id_amb), AVG(idade)
FROM medicos





-- 6) Agora vamos fazer buscas juntando as tabelas:

-- a) Buscar o número e o andar dos ambulatórios utilizados
-- por médicos ortopedista (caso não tenha médico com
-- especialidade de ortopedia, insira e coloque o INSERT
-- ou o UPDATE também na resposta desta questão);

UPDATE medicos
SET especialidade = 'Ortopedia'
WHERE id_m = 5

UPDATE medicos
SET especialidade = 'Ortopedia'
WHERE id_m = 2

SELECT ambulatorios.andar, ambulatorios.id_amb
FROM medicos
INNER JOIN ambulatorios
ON ambulatorios.id_amb = medicos.id_amb
WHERE medicos.especialidade = 'Ortopedia'







-- b) Buscar o código, nome e data dos pacientes com
-- consulta marcada para horários após às 14 horas;

SELECT pacientes.id_p, pacientes.nome, consultas.dia
FROM pacientes
INNER JOIN consultas
ON consultas.id_p = pacientes.id_p
WHERE consultas.hora > '14:00:00'




-- 7) Crie um SELECT para buscar o código, o nome e o salário
-- líquido dos funcionários. O salário líquido é obtido pela
-- diferença entre o salário cadastrado menos 20% desse
-- mesmo salário;
 
 
SELECT id_f, nome, salario * 0.80
FROM funcionarios;














