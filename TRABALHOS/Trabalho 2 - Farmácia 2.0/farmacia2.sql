--1) Crie uma tabela Funcionário que tenha o seu nome, sua função, sua data de nascimento e seu salário.

CREATE TABLE funcionario(
id_funcionario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
função VARCHAR(50) NOT NULL,
data_nascimento DATE NOT NULL,
salário DECIMAL (10,2) NOT NULL
)






--2) Crie uma tabela chamada Setor onde contenha o nome do setor, quantidade de funcionários.

CREATE TABLE setor(
id_setor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_setor VARCHAR(50) NOT NULL,
quantidade_funcionário INT(50) NOT NULL
)






--3)Adicione uma coluna na tabela Funcionário onde contenha uma foreign key relacionada a tabela Setor.

ALTER TABLE funcionario
ADD id_setor INT;

ALTER TABLE funcionario
ADD CONSTRAINT FK_setor
FOREIGN KEY (id_setor) REFERENCES setor(id_setor)






--4)Adicione uma coluna na tabela Cliente que contenha sua renda mensal.

ALTER TABLE cliente ADD renda_mensal DECIMAL(10,2)







--5)Insira os dados necessários em cada tabela

--TABELA FUNCIONÁRIO

INSERT INTO funcionario (nome, função, data_nascimento, salário)
VALUES
('Gustavo','Médico','2000-02-10',5000.00);
('Gabriel','Enfermeiro','1999-04-09',4000.00);
('Patrícia','Atendente','2001-09-12',3500.00);
('Luis','Atendente','2001-09-12',3500.00)

UPDATE funcionario
SET id_setor = 2
WHERE id_funcionario = 1
...

--TABELA SETOR

INSERT INTO setor (nome_setor, quantidade_funcionário)
VALUES
('Ambulatório',10),
('Medicina',50)

--TABELA CLIENTE

UPDATE cliente 
SET renda_mensal = 2000.00
WHERE id_cliente = 1
...





--6)

a) SELECT MAX(renda_mensal)
FROM cliente

a) SELECT MIN(renda_mensal)
FROM cliente

a) SELECT AVG(renda_mensal)
FROM cliente

SELECT * FROM cliente 
ORDER BY renda_mensal DESC




b)SELECT MAX(preco_medicamento)
FROM medicamentos

b)SELECT MIN(preco_medicamento)
FROM medicamentos

b)SELECT AVG(preco_medicamento)
from medicamentos



c)SELECT MAX(valor)
FROM venda

c)SELECT MIN(valor)
FROM venda

c)SELECT AVG(valor)
from venda




d)SELECT MAX(salário)
FROM funcionario

d)SELECT MIN(salário)
FROM funcionario

d)SELECT AVG(salário)
from funcionario



--7)

SELECT SUM(renda_mensal)
FROM cliente

SELECT SUM(preco_medicamento)
FROM medicamentos

SELECT SUM(valor)
FROM venda

SELECT SUM(salário)
FROM funcionario





