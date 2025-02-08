--TRABALHO 2

--Crie uma tabela Funcionário que tenha o seu nome, sua função, sua data de nascimento e seu salário.
--R: 
CREATE TABLE funcionario(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome_funcionario VARCHAR(50) NOT NULL,
	funcao VARCHAR(50),
	data_nasc_fun DATE NOT NULL,
	salario_fun DECIMAL(10,2)
)


--Crie uma tabela chamada Setor onde contenha o nome do setor, quantidade de funcionários.
--R:
CREATE TABLE setor(
	id_setor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_setor VARCHAR(50) NOT NULL,
	qtd_funcionarios INT
)


--Adicione uma coluna na tabela Funcionário onde contenha uma foreign key relacionada a tabela Setor.
--R:
ALTER TABLE funcionario
ADD id_setor INT;

ALTER TABLE funcionario
ADD CONSTRAINT FK_Setor
FOREIGN KEY (id_setor) REFERENCES setor(id_setor);


--Adicione uma coluna na tabela Cliente que contenha sua renda mensal.
--R:
ALTER TABLE cliente
ADD renda_mensal DECIMAL(10,2)


--Insira os dados necessários em cada tabela.
--R:
INSERT INTO setor (nome_setor, qtd_funcionarios)
VALUES
('Ambulatório',10),
('Medicina',50)

INSERT INTO funcionario (nome_funcionario, funcao, data_nasc_fun, salario_fun, id_setor)
VALUES
('Gustavo','Médico','2000-02-10',5000.00, 1),
('Gabriel','Enfermeiro','1999-04-09',4000.00, 2),
('Patrícia','Atendente','2001-09-12',3500.00, 1),
('Luis','Atendente','2001-09-12',3500.00, 2)


UPDATE cliente 
SET renda_mensal = 2000.00
WHERE id_cliente = 1


--Crie uma consulta com o valor Máximo, Mínimo e Média para cada tabela dessas:
--Cliente (Renda);

SELECT 
MAX(renda_mensal) AS 'Maior Renda',
MIN(renda_mensal) AS 'Menor Renda',
AVG(renda_mensal) AS 'Média Rendas'
FROM cliente

--Medicamento (Valor);
	SELECT 
MAX(preco) AS 'Maior Preço',
MIN(preco) AS 'Menor Preço',
AVG(preco) AS 'Média Preço'
FROM medicamento


--Venda (Valor);
	SELECT 
MAX(valor) AS 'Maior Valor',
MIN(valor) AS 'Menor Valor',
AVG(valor) AS 'Média Valor'
FROM venda

--Funcionário (Salário);
	SELECT 
MAX(salario_fun) AS 'Maior Salário',
MIN(salario_fun) AS 'Menor Salário',
AVG(salario_fun) AS 'Média Salário'
FROM funcionario


--Crie uma consulta para cada tabela dessas anteriores onde some o valor total das colunas especificadas.
--R:
--Tabela Cliente:
	SELECT SUM(renda_mensal) AS 'Soma das Rendas' FROM cliente

--Tabela Medicamento:
	SELECT SUM(preco) AS 'Soma dos Preços' FROM medicamento

--Tabela Venda:
	SELECT SUM(valor) AS 'Soma dos Valores' FROM venda

--Tabela Funcionarios:
        SELECT SUM(salario_fun) AS 'Soma dos Salários' FROM funcionario
