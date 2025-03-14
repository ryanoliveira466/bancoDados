# Trabalho 5 - Financeira (Banco de Dados)

  1 - Você foi convocado para criar um banco de dados de uma instituição bancária. A princípio vamos fazer apenas o seguinte:


**a)** Crie um banco de dados chamado Banco_do_RS, e dentro do banco é 
necessário ter as seguintes tabelas:

 i) conta_corrente com o número, o saldo_atual, o nome do dono, número do 
pix e o documento cpf/cnpj;

 ii) conta_poupança com o número, o saldo, o nome do dono, número do pix e 
o documento cpf;

 iii) cartao_credito com número, fatura_atual e número da conta do dono do 
cartão de crédito;

---

 2 - Agora crie um procedimento/função para saque onde retire o valor do saldo da conta e atualize a tabela.

---

 3 - Após isso, um procedimento/função de depósito.

 ---
 
 4 - Após isso, um procedimento/função para transferência entre contas. Lembrese de utilizar IF ELSE nessa questão.

---

 5 - Agora vamos fazer algumas alterações no Banco_do_RS.
 
 
 **a**) Crie uma tabela chamada movimentação que contenha
 o número da movimentação, o número da conta, o saldo
 anterior e o saldo atual.
 
 **b**) Agora crie um trigger que após o update na
 conta_corrente atualiza essa conta.
 Dica: Você pode utilizar os dados da tabela conta corrente no insert do trigger 
utilizando OLD.numerodacoluna e o saldo atualizado como NEW.saldo)

---

 6 - Crie uma função que liste contas com saldo maior que o valor informado.
 
 ---
 
 7 - Crie um procedimento que modifica o saldo de todas as contas com o valor informado;.
 
 Dica: Remova o safe updates nas configs
