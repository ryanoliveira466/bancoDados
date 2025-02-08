DELIMITER //

CREATE FUNCTION soma_valores(valor1 INT, valor2 INT)
RETURNS INT
BEGIN
	DECLARE soma INT;
	SET soma = valor1 + valor2;
	RETURN soma;
END //

DELIMITER ;
—--------------------------------------
DELIMITER //

CREATE PROCEDURE soma_valores(IN valor1 INT, IN valor2 INT, OUT soma INT)
BEGIN
	SET soma = valor1 + valor2;
END //

DELIMITER ;
—--------------------------------------—--------------------------------------—--------------------------------------
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
