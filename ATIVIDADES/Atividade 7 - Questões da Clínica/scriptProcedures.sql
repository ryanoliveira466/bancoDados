--ESCREVA UMA FUNÇÃO ARMAZENADA ONDE SE A SOMA DAS RENDAS DOS CLIENTES FOR MENOR QUE 345,56
--APLIQUE UM AUMENTO DE 5,14% PARA TODOS OS CLIENTES.
--CASO CONTRÁRIO APLIQUE 10,23%.

--COMO FAZER A PORCENTAGEM: INSIRA O "1." ANTES DO VALOR DA PORCENTAGEM, EXEMPLO:
-- 5,14% = 1.0514;

CREATE TABLE clientes(
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    renda FLOAT(20) NOT NULL
)

INSERT INTO clientes(nome, renda)
VALUES 
("teste", 5000.0),
("alisson", 10000.00),
("renan", 4000.0),
("tecla", 5080.00)

DELIMITER **

CREATE FUNCTION aplicar_aumento()
RETURNS VARCHAR(50)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Funcao que aplica aumento nas rendas dos clientes'
BEGIN
	DECLARE soma_renda FLOAT;
	DECLARE aumento FLOAT;
	
	SELECT SUM(renda) INTO soma_renda FROM clientes;
	
	IF soma_renda < 345.56 THEN
		SET aumento = 1.0514;
	ELSE
		SET aumento = 1.1023;
	END IF;
	
	UPDATE clientes SET renda = renda * aumento;
	
	RETURN CONCAT('O aumento foi aplicado com sucesso');
END **

DELIMITER ;

SELECT aplicar_aumento();


-- Se a renda for menor que 1000 então 0 imposto
-- se for menor que 2000 entao 15% de imposto
-- se menor que 3k entao 22%
-- se não 27%

DELIMITER **
CREATE FUNCTION calcula_imposto(renda DECIMAL(7,2))
RETURNS DECIMAL(7,2)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Funcao para calcular o valor do imposto'
BEGIN
    DECLARE valor_imposto DECIMAL(7,2)
    CASE
    WHEN renda > 3000.00 THEN
        SET valor_imposto = renda * 0.27;
    WHEN renda > 2000.00 THEN
        SET valor_imposto = renda * 0.22;
    WHEN renda > 1000.00 THEN 
        SET valor_imposto = renda * 0.15;
    ELSE
        SET valor_imposto = 0;
    END CASE;

    RETURN valor_imposto;
END **

DELIMITER ;


SELECT calcula_imposto(renda)
FROM clientes
WHERE nome = 'tecla'