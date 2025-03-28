CREATE TABLE cliente (
id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_cliente VARCHAR(50) NOT NULL,
endereco_cliente VARCHAR(50) NOT NULL,
email_cliente VARCHAR(50) NOT NULL,
telefone_cliente VARCHAR(50) NOT NULL
)

CREATE TABLE medicamentos (
id_medicamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_medicamento VARCHAR(50) NOT NULL,
fabricante_medicamento VARCHAR(50) NOT NULL,
preco_medicamento DECIMAL(20) NOT NULL,
quantidade_medicamento INT(50) NOT NULL
)

CREATE TABLE fornecedor (
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_fornecedor VARCHAR(50) NOT NULL,
endereco_fornecedor VARCHAR(50) NOT NULL,
telefone_fornecedor VARCHAR(50) NOT NULL
)

CREATE TABLE venda (
id_venda INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
data_venda DATE NOT NULL,
id_medicamento INT NOT NULL,
id_cliente INT NOT NULL,
FOREIGN KEY (id_medicamento) REFERENCES medicamentos(id_medicamento),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
)
