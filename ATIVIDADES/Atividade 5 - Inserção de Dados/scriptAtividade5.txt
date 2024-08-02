

CREATE TABLE desenvolvedores(
	id_dev INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_dev VARCHAR(100) NOT NULL,
	cargo_dev VARCHAR(200) NOT NULL
);

CREATE TABLE projetos(
	id_projetos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_projetos VARCHAR(100) NOT NULL,
	desc_projetos VARCHAR(200) NOT NULL,
	id_dev INT NOT NULL,
	FOREIGN KEY (id_dev) REFERENCES desenvolvedores(id_dev)
);

CREATE TABLE equipamentos(
	id_equipamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome VARCHAR(100)NOT NULL,
	tipo VARCHAR(100)NOT NULL
);



CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(200) NOT NULL,
	data_cadastro VARCHAR(20) NOT NULL
);	


CREATE TABLE chamados(
	id_chamado INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	descricao VARCHAR(100)NOT NULL,
	id_dev INT NOT NULL,
	FOREIGN KEY (id_dev) REFERENCES desenvolvedores(id_dev),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
