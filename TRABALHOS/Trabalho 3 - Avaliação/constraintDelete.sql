CREATE TABLE funcionario(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome_fun VARCHAR(50)
);

CREATE TABLE setor(
	id_setor INT NOT NULL AUTO_INCREMENT,
	nome_setor VARCHAR(50) NOT NULL,
	id_funcionario INT,
	PRIMARY KEY(id_setor),
	CONSTRAINT FK_Funcionario 
	FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE cliente(
	id_cli INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome_cli VARCHAR(50)
);

CREATE TABLE venda(
	id_venda INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_cli INT,
	CONSTRAINT FK_Cliente_Venda
);

DELETE FROM cliente
WHERE id_cliente = 5


--USO DO UNIQUE:

CREATE TABLE funcionario(
	id_funcionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	CPF VARCHAR(11) UNIQUE,
	nome_fun VARCHAR(50)
);
