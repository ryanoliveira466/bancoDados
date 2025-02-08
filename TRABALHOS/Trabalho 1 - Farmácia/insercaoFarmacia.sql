INSERT INTO cliente (nome_cliente, endereco_cliente, email_cliente, telefone_cliente)
VALUES 
('Maria', 'SP', 'maria@gmail.com', '999999999'),
('Jose', 'RS', 'jose@gmaill.com', '888888888'),
('Ricardo', 'RS', 'ricardo@gmaill.com', '777777777'),
('Manoel', 'RS', 'manoel@gmaill.com', '666666666'),
('Carlos', 'RS', 'carlos@gmaill.com', '555555555');

TRUNCATE TABLE table_name;
DELETE FROM table_name;
ALTER TABLE table_name AUTO_INCREMENT = 1;

--(Síntaxe do "INSERT INTO" estava com erros e com isso alguns dados eram inseridos e os números dos ID não voltavam pr a contagem inicial depois de apagar e colocar outros dados então usei o comando "ALTER TABLE" para arrumar).

INSERT INTO fornecedor (nome_fornecedor, endereco_fornecedor, telefone_fornecedor)
VALUES
('Eduardo', 'SP', '111111111'),
('Paulo', 'MG', '222222222'),
('Isabel', 'SP', '333333333'),
('Veronica', 'RJ', '444444444')

ALTER TABLE medicamentos
MODIFY preco_medicamento DECIMAL(6,2);

INSERT INTO medicamentos (nome_medicamento, fabricante_medicamento, preco_medicamento, quantidade_medicamento)
VALUES
('Aspirina','Bayer',9.90,50),
('Ibuprofeno','Bayer',20.33,40),
('Omeprazol','EMS',3.44,10),
('Paracetamol','Europharma',10.67,20)

INSERT INTO venda (data_venda, id_medicamento, id_cliente)
VALUES
('2024-02-06',1,1),
('2024-01-26',2,2),
('2024-01-14',3,3),
('2023-12-04',4,4)
