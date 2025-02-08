# Avaliação Banco de Dados 2 - Análise em Desenvolvimento de Sistemas

Todas as linhas de código devem ser entregues no mesmo documento com a identificação da questão como comentário.

## 1) Criação do Banco de Dados

Crie um banco de dados com o nome **Clínica**.

**Obs.:** A partir da segunda questão, considere que os atributos em **negrito** são chaves primárias (PK) e os em *itálico* são chaves estrangeiras (FK). Não esqueça de utilizar **CONSTRAINT**.

## 2) Criação das Tabelas

### a) **ambulatorios**
- i) `cod_amb` (int)
- ii) `andar` (int) (não nulo)
- iii) `capacidade` (int)

### b) **medicos**
- i) `cod_m` (int)
- ii) `nome` (varchar(40)) (não nulo)
- iii) `idade` (int) (não nulo)
- iv) `especialidade` (varchar(20))
- v) `CPF` (varchar(11)) (único)
- vi) `cidade` (varchar(30))
- vii) `cod_amb` (int)

### c) **pacientes**
- i) `cod_p` (int)
- ii) `nome` (varchar(40)) (não nulo)
- iii) `idade` (smallint) (não nulo)
- iv) `cidade` (char(30))
- v) `CPF` (numeric(11)) (único)
- vi) `doenca` (varchar(40)) (não nulo)

### d) **funcionarios**
- i) `cod_f` (int)
- ii) `nome` (varchar(40)) (não nulo)
- iii) `idade` (smallint)
- iv) `CPF` (varchar(11)) (único)
- v) `cidade` (varchar(30))
- vi) `salario` (numeric(10))
- vii) `cargo` (varchar(20))

### e) **consultas**
- i) `cod_m` (int)
- ii) `cod_p` (int)
- iii) `data` (date) (não nulo)
- iv) `hora` (time) (não nulo)

## 3) Inserção de Dados

Agora, insira 5 linhas de dados nas tabelas:
- **ambulatorio**
- **medico**
- **paciente**
- **funcionarios**

E insira 10 linhas de código na tabela **consultas**.

## 4) Resolução dos Problemas

a) O segundo paciente da lista se mudou para Ilhota;

b) A consulta do médico 1 com o paciente 4 foi marcada para as 12 horas do dia 4 de novembro de 2021;

c) O funcionário 4 deixou a clínica;

d) Foram contratados 2 novos funcionários: o funcionário Matheus e a funcionária Martina;

e) Delete o paciente 3 pela doença e adicione um novo com a mesma doença;

f) Os pacientes com idade inferior a 24 anos deixaram a clínica.

## 5) Busca de Informações Filtradas

a) Buscar os dados dos ambulatórios que possuem capacidade superior a 30;

b) Buscar os dados dos médicos com menos de 40 anos ou com especialidade em traumatologia;

c) Buscar os códigos dos médicos e os códigos dos pacientes, para todas as consultas marcadas no período da tarde (a partir das 13h) após o dia 15/05/2022 (caso não tenha, insira na tabela ou modifique e coloque o UPDATE também na resposta dessa questão);

d) Buscar o nome e a idade dos pacientes que não residem em Passo Fundo;

e) Buscar o nome e a idade (em meses) dos pacientes;

f) Qual o menor e o maior salário dos funcionários de Passo Fundo?

g) Qual a média de idade dos médicos e o total de ambulatórios atendidos por eles?

## 6) Busca com Junção de Tabelas

a) Buscar o número e o andar dos ambulatórios utilizados por médicos ortopedistas (caso não tenha médico com especialidade de ortopedia, insira e coloque o INSERT ou o UPDATE também na resposta desta questão);

b) Buscar o código, nome e data dos pacientes com consulta marcada para horários após às 14 horas.

## 7) Criação do SELECT

Crie um SELECT para buscar o código, o nome e o salário líquido dos funcionários. O salário líquido é obtido pela diferença entre o salário cadastrado menos 20% desse mesmo salário.
