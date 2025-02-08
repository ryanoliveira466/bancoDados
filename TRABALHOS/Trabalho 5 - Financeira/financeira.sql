-- 1. Você foi convocado para criar um banco de dados de uma instituição
-- bancária. A princípio vamos fazer apenas o seguinte:
-- a) Crie um banco de dados chamado Banco_do_RS, e dentro do banco é
-- necessário ter as seguintes tabelas:
-- i) conta_corrente com o número, o saldo_atual, o nome do dono, número DO
-- pix e o documento cpf/cnpj;
-- ii) conta_poupança com o número, o saldo, o nome do dono, número do pix e
-- o documento cpf;
-- iii) cartao_credito com número, fatura_atual e número da conta do dono do
-- cartão de crédito;


CREATE TABLE conta_corrente(
id_conta_corrente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
saldo_atual FLOAT NOT NULL,
nome_dono VARCHAR(50) NOT NULL,
pix VARCHAR(50),
cpf VARCHAR(11) NOT NULL UNIQUE,
cnpj VARCHAR(14) UNIQUE
)

CREATE TABLE conta_poupança(
id_conta_poupança INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
saldo_atual FLOAT NOT NULL,
nome_dono VARCHAR(50) NOT NULL,
pix VARCHAR(50),
cpf VARCHAR(11) NOT NULL UNIQUE,
cnpj VARCHAR(14) UNIQUE
)

CREATE TABLE cartao_credito(
id_cartao_credito INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
fatura_atual INT NOT NULL,
id_conta_corrente INT,
CONSTRAINT FK_Conta_Corrente_Cartao_Credito
FOREIGN KEY (id_conta_corrente) REFERENCES conta_corrente(id_conta_corrente)
)


INSERT INTO conta_corrente(saldo_atual, nome_dono, pix, cpf, cnpj)
VALUES
(3000.00,'Charles','charles@gmail.com',12345678910,null)









-- 2. Agora crie um procedimento/função para saque onde retire o valor do saldo
-- da conta e atualize a tabela.


DELIMITER //

CREATE FUNCTION saque(id INT,valor FLOAT)
RETURNS VARCHAR(50)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Saque'
BEGIN
   DECLARE saldo_cliente FLOAT;

   SELECT saldo_atual FROM conta_corrente WHERE id_conta_corrente = id INTO saldo_cliente;

   IF valor > saldo_cliente THEN
      RETURN CONCAT('Valor não permitido');
   ELSE
      UPDATE conta_corrente
      SET saldo_atual = saldo_cliente - valor
      WHERE id_conta_corrente = id;
   END IF;
   RETURN CONCAT('Valor saquado');
END//

DELIMITER ;

SELECT saque(1, 400);











-- 3. Após isso, um procedimento/função de depósito.


DELIMITER //

CREATE FUNCTION deposito(id INT,valor FLOAT)
RETURNS VARCHAR(50)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Depósito'
BEGIN
   DECLARE saldo_cliente FLOAT;

   SELECT saldo_atual FROM conta_corrente WHERE id_conta_corrente = id INTO saldo_cliente;

   UPDATE conta_corrente
   SET saldo_atual = saldo_cliente + valor
   WHERE id_conta_corrente = id;
   
   RETURN CONCAT('Valor depositado');
END//

DELIMITER ;

SELECT deposito(1, 400);






-- 4. Após isso, um procedimento/função para transferência entre contas. Lembre-
-- se de utilizar IF ELSE nessa questão.




INSERT INTO conta_poupança(saldo_atual, nome_dono, pix, cpf, cnpj)
VALUES
(100.00,'Charles','charles@gmail.com',12345678910,NULL)

INSERT INTO conta_corrente(saldo_atual, nome_dono, pix, cpf, cnpj)
VALUES
(2000.00,'Thomas','thomas@gmail.com',09876543219,NULL)



DELIMITER //

CREATE FUNCTION transferencia(id INT,id_transf INT, valor FLOAT)
RETURNS VARCHAR(50)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Transferência'
BEGIN
   DECLARE saldo_cliente FLOAT;
   DECLARE saldo_transf FLOAT;
   
   SELECT saldo_atual FROM conta_corrente WHERE id_conta_corrente = id INTO saldo_cliente;
   SELECT saldo_atual FROM conta_corrente WHERE id_conta_corrente = id_transf INTO saldo_transf;
   
   IF valor > saldo_cliente THEN
      RETURN CONCAT('Valor não permitido');
   END IF;
   
   IF id_transf IN (SELECT id_conta_corrente FROM conta_corrente) = FALSE THEN
      RETURN CONCAT('Conta não localizada');
   ELSE
	   UPDATE conta_corrente
	   SET saldo_atual = saldo_transf + valor
	   WHERE id_conta_corrente = id_transf;
	   
	   UPDATE conta_corrente
	   SET saldo_atual = saldo_cliente - valor
	   WHERE id_conta_corrente = id;
	END IF;
	    RETURN CONCAT('Valor transferido');
END//

DELIMITER ;

SELECT transferencia(1, 2, 500);





-- 5. Agora vamos fazer algumas alterações no Banco_do_RS.
-- a) Crie uma tabela chamada movimentação que contenha
-- o número da movimentação, o número da conta, o saldo
-- anterior e o saldo atual.
-- b) Agora crie um trigger que após o update na
-- conta_corrente atualiza essa conta.
-- Dica: Você pode utilizar os dados da tabela conta corrente no insert do trigger
-- utilizando OLD.numerodacoluna e o saldo atualizado como NEW.saldo)

 	   
	   
CREATE TABLE movimentacoes(
id_mov INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
saldo_atual FLOAT NOT NULL,
saldo_anteriro FLOAT NOT NULL,
id_conta_corrente INT,
CONSTRAINT FK_Conta_Corrente_Movimentacoes
FOREIGN KEY (id_conta_corrente) REFERENCES conta_corrente(id_conta_corrente)
)

-- TRIGGER PULADO







  
-- 6. Crie uma função que liste contas com saldo maior que o valor informado.

DELIMITER //

CREATE PROCEDURE maior(IN valor FLOAT)
BEGIN
   SELECT saldo_atual FROM conta_corrente WHERE saldo_atual > valor;
END //

DELIMITER ;   


CALL maior(2500);
SELECT maior














-- 7. Crie um procedimento que modifica o saldo de todas as contas com o valor
-- informado; Dica: Remova o safe updates nas configs.



DELIMITER //

CREATE FUNCTION modificar_saldo(valor FLOAT)
RETURNS VARCHAR(50)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT 'Modificar saldo de todas as contas'
BEGIN
   UPDATE conta_corrente
   SET saldo_atual = valor;
   
   RETURN CONCAT('Saldo atualizado');
END //

DELIMITER ;   


SELECT modificar_saldo(5000)


