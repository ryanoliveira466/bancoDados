8) Crie um procedimento para buscar o código, o nome e o
salário líquido dos funcionários. O salário líquido é obtido pela
diferença entre o salário cadastrado menos 20% desse
mesmo salário;

DELIMITER //

CREATE PROCEDURE dados(OUT salario_liquido DECIMAL)
BEGIN
     SELECT id_f, nome, salario - (salario* 0.20) FROM funcionarios;
END //

DELIMITER ;

CALL dados(@salario_liquido);
SELECT @salario_liquido;













-- 9) Agora transforme todas as consultas das questões a seguir em
-- procedimentos armazenados, podendo ser Function ou
-- Procedure:


-- 6) Busque as seguintes informações filtrando os dados:

-- a) Buscar os dados dos ambulatórios que possuem
-- capacidade superior à 30;

DELIMITER //

CREATE PROCEDURE amb_cap()

BEGIN
   SELECT id_amb FROM ambulatorios WHERE capacidade > 30;
END //

DELIMITER ;



CALL amb_cap();
SELECT amb_cap;









-- b) Buscar os dados dos médicos com menos de 40 anos
-- ou com especialidade traumatologia;
DELIMITER //

CREATE PROCEDURE dados_med()
BEGIN
   SELECT * FROM medicos WHERE especialidade = 'Traumatologia' OR idade < 40;
END //

DELIMITER ;   


CALL dados_med();
SELECT dados_med;






-- c) Buscar os códigos dos médicos e os códigos dos
-- pacientes, para todas as consultas marcadas no período
-- da tarde (a partir das 13h) após o dia 15/05/2022 (caso
-- não tenha, insira na tabela ou modifique e coloque o
-- UPDATE também na resposta dessa questão);

DELIMITER //

CREATE PROCEDURE consulta()
BEGIN
   SELECT id_m, id_p FROM consultas WHERE hora > '12:59:59' AND dia > '2024-05-15';
END //

DELIMITER ;  
	 


CALL consulta();
SELECT consulta;







-- d) Buscar o nome e a idade dos pacientes que não
-- residem em Passo Fundo;

DELIMITER //

CREATE PROCEDURE paciente()
BEGIN
    SELECT nome, idade FROM pacientes WHERE cidade != 'Passo Fundo';
END //

DELIMITER ;    


CALL paciente();
SELECT paciente;









-- e) Buscar o nome e a idade (em meses) dos pacientes;

DELIMITER //

CREATE PROCEDURE paciente2()
COMMENT
BEGIN
   SELECT nome, idade * 12 FROM pacientes;
END //

DELIMITER ;   


CALL paciente2();
SELECT paciente2;









-- f) Qual o menor e o maior salário dos funcionários de
-- Passo Fundo?
DELIMITER //

CREATE PROCEDURE menor_maior()
BEGIN
   SELECT nome, salario FROM funcionarios WHERE cidade = 'Passo Fundo' ORDER BY salario DESC;
END //

DELIMITER ;   
   

CALL menor_maior();
SELECT menor_maior;








-- g) Qual a média de idade dos médicos e o total de
-- ambulatórios atendidos por eles?

DELIMITER //

CREATE PROCEDURE media_idade_med_count_amb()
BEGIN
   SELECT AVG(idade), COUNT(id_amb) FROM medicos;
END //

DELIMITER ;   



CALL media_idade_med_count_amb();
SELECT media_idade_med_count_amb;









