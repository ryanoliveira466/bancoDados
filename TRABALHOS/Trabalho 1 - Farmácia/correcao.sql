 CREATE TABLE medicamento(
 	id_med INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 	nome_med VARCHAR(50) NOT NULL,
 	fabricante VARCHAR(50) NOT NULL,
 	preco DECIMAL(10,2) NOT NULL,
 	quantidade INT NOT NULL
 )
 
INSERT INTO medicamento (nome_med, fabricante, preco, quantidade)
VALUES('Paracetamol', 'Fabricante A', 10.50, 100),
('Amoxicilina', 'Fabricante B', 15.75, 75),
('Dipirona', 'Fabricante C', 8.99, 120),
('Omeprazol', 'Fabricante D', 20.25, 50),
('Ibuprofeno', 'Fabricante E', 12.35, 90);


CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 	nome_cliente VARCHAR(50) NOT NULL,
 	endereco VARCHAR(50) NOT NULL,
 	email VARCHAR(50) NOT NULL,
 	telefone VARCHAR(50) NOT NULL
)

INSERT INTO cliente (nome_cliente, endereco, email, telefone)
VALUES 
('Maria', 'SP', 'maria@gmail.com', '999999999'),
('Jose', 'RS', 'jose@gmaill.com', '888888888'),
('Ricardo', 'RS', 'ricardo@gmaill.com', '777777777'),
('Manoel', 'RS', 'manoel@gmaill.com', '666666666'),
('Carlos', 'RS', 'carlos@gmaill.com', '555555555');

CREATE TABLE fornecedor(
	id_forn INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 	nome_forn VARCHAR(50) NOT NULL,
 	endereco_forn VARCHAR(50) NOT NULL,
 	telefone_forn VARCHAR(50) NOT NULL
)

INSERT INTO fornecedor(nome_forn,endereco_forn,telefone_forn)
VALUES ('forne_test1','endereco_test1','+55 51 9874231232'),
('forne_test2','endereco_test2','+55 51 987238273')

  
CREATE TABLE venda(
	id_venda INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	data_venda DATE NOT NULL,
	id_med INT,
	id_cliente INT,
	FOREIGN KEY (id_med) REFERENCES medicamento(id_med),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
)

INSERT INTO venda (data_venda, id_med, id_cliente)
VALUES
('2023-03-09', 1, 1),
('2023-09-05', 2, 2),
('2023-11-10', 3, 3),
('2023-07-13', 4, 4),
('2023-07-31', 5, 5);

1)
SELECT * FROM medicamento
WHERE quantidade < 100

2)
SELECT medicamento.nome_med
FROM venda
INNER JOIN medicamento
ON medicamento.id_med = venda.id_med
WHERE data_venda 
BETWEEN '2023-11-01' AND CURRENT_DATE

3)

ALTER TABLE medicamento ADD vencimento DATE;

UPDATE medicamento 
SET vencimento = '2024-02-14' 
WHERE id_med = 5;

SELECT nome_med, vencimento
FROM medicamento
WHERE vencimento < CURRENT_DATE + 15;

4)

UPDATE medicamento 
SET quantidade = 0 
WHERE id_med = 5;

SELECT nome_med, quantidade
FROM medicamento
WHERE quantidade <= 0;

5)

SELECT cliente.nome_cliente,
medicamento.nome_med
FROM venda

INNER JOIN cliente
ON cliente.id_cliente = venda.id_cliente

INNER JOIN medicamento
ON medicamento.id_med = venda.id_med

WHERE cliente.id_cliente = 5

6)
ALTER TABLE venda ADD valor DECIMAL(10,2);

UPDATE venda 
SET valor = 150.00 
WHERE id_venda = 5;

SELECT SUM(valor) AS Total
FROM venda
WHERE data_venda < CURRENT_DATE

7)
SELECT cliente.nome_cliente
FROM venda
INNER JOIN cliente
ON cliente.id_cliente = venda.id_cliente
WHERE	valor > 150.00;

8)
INSERT INTO venda (data_venda, id_med, id_cliente, valor)
VALUES ('2024-02-08', 5, 5, 100.00);

--COM O NOME DO CLIENTE:
SELECT cliente.nome_cliente AS 'Cliente com mais compras'
FROM venda
INNER JOIN cliente
ON cliente.id_cliente = venda.id_cliente
GROUP BY venda.id_cliente
HAVING COUNT(*) > 1

--versão simples:
SELECT id_cliente AS 'Cliente com mais compras'
FROM venda
GROUP BY id_cliente
HAVING COUNT(*) > 1

9)
ALTER TABLE fornecedor
ADD medicamentos_vendidos INT;

UPDATE fornecedor
SET medicamentos_vendidos = 12
WHERE id_forn = 2

SELECT nome_forn, 
MAX(medicamentos_vendidos) 
AS 'Medicamentos Vendidos'
FROM fornecedor

--OBS.: INSERINDO ID E DATA DE FORNECIMENTO NA TABELA DE MEDICAMENTOS

ALTER TABLE medicamento
ADD data_forn DATE;

ALTER TABLE medicamento
ADD id_forn INT;

ALTER TABLE medicamento
ADD CONSTRAINT FK_Fornecedor
FOREIGN KEY (id_forn) REFERENCES fornecedor(id_forn);

UPDATES:

UPDATE medicamento
SET id_forn = 1
WHERE id_med = 5;

UPDATE medicamento
SET data_forn = '2024-02-15'
WHERE id_med = 5;

SUBQUERY:

SELECT
    MAX(m.quantidade) AS 'Quantidade Fornecida',
    f.nome_forn
FROM
    medicamento AS m
INNER JOIN
    fornecedor AS f ON f.id_forn = m.id_forn
INNER JOIN
    (SELECT MAX(quantidade) AS max_quantidade
    FROM medicamento
    WHERE data_forn BETWEEN '2023-09-01' AND CURRENT_DATE) AS subquery
ON
    m.quantidade = subquery.max_quantidade
WHERE
    m.data_forn BETWEEN '2023-09-01' AND CURRENT_DATE;


10)
ALTER TABLE fornecedor
ADD nome_meds VARCHAR(50);

UPDATE fornecedor
SET nome_meds = 'Rivotril'
WHERE id_forn = 2

SELECT nome_forn
FROM fornecedor
WHERE nome_meds = 'Rivotril'

11)
--(- Qual é o valor total de vendas por mês no último ano?)
SELECT SUM(valor)
FROM venda
WHERE data_venda BETWEEN '2023-03-01' AND '2023-03-30'

12) 
SELECT MAX(preco)
FROM medicamento
WHERE categoria = '1'

13)
--Obs.: Temos o mesmo problema da questão 9, o valor vem certo mas o nome não

SELECT cliente.nome_cliente, MAX(valor)
FROM venda
INNER JOIN cliente
ON cliente.id_cliente = venda.id_cliente 
