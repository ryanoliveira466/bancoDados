-- questao 1
CREATE DATABASE Clinica;

USE clinica;

-- questao 2
CREATE TABLE ambulatorios(
    cod_amb INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    andar INT NOT NULL,
    capacidade INT
);

CREATE TABLE medicos(
    cod_m INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    especialidade VARCHAR(20),
    CPF VARCHAR(11) UNIQUE,
    cidade VARCHAR(30),
    cod_amb INT,
    CONSTRAINT FK_Ambulatorio_Medicos
    FOREIGN KEY (cod_amb) REFERENCES ambulatorios(cod_amb)
);


CREATE TABLE pacientes(
cod_p INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
idade INT NOT NULL,
cidade VARCHAR(30),
CPF VARCHAR(11) UNIQUE,
doenca VARCHAR(40) NOT NULL
);

-- D

CREATE TABLE funcionarios(
cod_f INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(40) NOT NULL,
idade INT,
CPF VARCHAR(11) UNIQUE,
cidade VARCHAR(30),
salario DECIMAL(10,2),
cargo VARCHAR(20)
);

-- E

CREATE TABLE consultas(
cod_consulta INT PRIMARY KEY AUTO_INCREMENT,
cod_m INT,
cod_p INT,
data_ DATE NOT NULL,
hora TIME NOT NULL,
CONSTRAINT FK_Medicos_Consulta
FOREIGN KEY (cod_m) REFERENCES medicos(cod_m),
CONSTRAINT FK_Paciente_Consulta
FOREIGN KEY (cod_p) REFERENCES pacientes(cod_p)
);

UPDATE pacientes
SET cidade = 'Ilhota'
WHERE cod_p = '2';

-- b) A consulta do médico 1 com o paciente 4 foi marcada para as 12 horas do dia 4 de novembro de 2021;

UPDATE consultas
SET data_ = '2021/11/04', hora = '12:00:01'
WHERE cod_m = '1'

-- c) O funcionário 4 deixou a clínica;
DELETE FROM funcionarios
WHERE cod_f = '4'

-- d) Foram contratados 2 novos funcionários. O funcionário Matheus e a funcionária Martina;
INSERT INTO funcionarios
VALUES (10, 'Martina', 19, '1111111', 'Getúlio Vargas', 1500, 'Limpeza')

-- e) Delete o paciente 3 pela doença e adicione um novo com a mesma doença;

SELECT * FROM pacientes WHERE cod_p = '3'

SELECT * FROM consultas WHERE cod_p = '3'

DELETE FROM consultas
WHERE cod_p = '3'

DELETE FROM pacientes
WHERE doenca = 'Dores de cabeça'

INSERT INTO pacientes
VALUES (6, 'Mario', 25, 'Novo Hamburgo', '5021364798', 'Dores de cabeça')

-- f) Os pacientes com idade inferior a 24 anos deixaram a clínica.
SELECT * FROM consultas
INNER JOIN pacientes
ON pacientes.cod_p = consultas.cod_p
WHERE pacientes.idade < 24


DELETE FROM consultas
WHERE cod_consulta = '1'
AND cod_consulta = '5'
AND cod_consulta = '8'
 
DELETE FROM pacientes WHERE idade < '24'
-- 5)
-- A)
SELECT * FROM ambulatorios
WHERE capacidade > 30

-- B)
SELECT * FROM medicos
WHERE idade < 40
OR especialidade = 'Traumatologia'

-- c)
SELECT * FROM consultas;

INSERT INTO consultas
VALUES (10, 3, 5, '2022-06-15', '14:00:00');

SELECT cod_m, cod_p
FROM consultas
WHERE hora > '12:59:59' AND data_ > '2022-05-15'

SELECT nome, idade FROM pacientes
WHERE cidade != 'Passo Fundo';  

SELECT nome, (idade * 12) AS 'Idade em Meses' FROM pacientes;

INSERT INTO funcionarios
VALUES (6, 'Fabricio', 20, '4564879546', 'Passo Fundo', 2000, 'Atendente'),
(7, 'José', 45, '987654321', 'Passo Fundo', 5000, 'Vigilante Noturno');

SELECT MIN(salario) AS 'Menor Salario', MAX(salario) AS 'Maior Salario'
FROM funcionarios
WHERE cidade = 'Passo Fundo'

SELECT AVG(idade) AS 'Media Idade', COUNT(cod_amb) AS 'Qtd Ambulatorios'
FROM medicos;

-- nome, idade, especialidade, cpf, cidade

INSERT INTO medicos
VALUES (11, 'Bruno', 60, 'Ortopedia', '85274679', 'Canoas', 3);

SELECT medicos.nome, a.cod_amb AS 'Cód. Ambulatório', a.andar AS 'Num. Andar' FROM medicos
INNER JOIN ambulatorios AS a
ON a.cod_amb = medicos.cod_amb
WHERE medicos.especialidade = 'Ortopedia';


SELECT cod_m, cod_p
FROM consultas
WHERE hora > '12:59:59' AND data_ > '2022-05-15'


SELECT * FROM consultas;

SELECT 
p.cod_p AS 'Id do Paciente', 
p.nome AS 'Nome do Paciente', 
c.data_ AS 'Data da Consulta'
FROM consultas AS c
INNER JOIN pacientes AS p
ON p.cod_p = c.cod_p
WHERE c.hora > '13:59:59';

SELECT 
f.cod_f 'ID do Funcionário', 
f.nome 'Nome do Funcionário',
f.salario 'Salário Bruto', 
(f.salario * 0.80) 'Salário Liquido'
FROM funcionarios f

