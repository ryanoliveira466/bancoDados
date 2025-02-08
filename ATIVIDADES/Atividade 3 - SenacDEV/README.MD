# Modelagem de Setores SenacDEV

## 1. Desenvolvimento de Software

[LINK TABELA](https://miro.com/welcomeonboard/Nk1ldjBLckRnWUoxWFRrWDlnU0xkVzRkNVJsaWpsUjRua0JEbjg3TFBQTG1KOVVydDlnamZmaWhyNnJjcGRUdHwzNDU4NzY0NTYyNzI2NzY2MjM5fDI=?share_link_id=13455755397)


### Tabelas:
- **Projetos**
  - ID
  - Nome
  - Descrição
  - Data_Inicio
  - Data_Entrega
  - Responsavel

- **Desenvolvedores**
  - ID
  - Nome
  - Cargo
  - Projeto_Associado
  - Data_Ingresso

### Relacionamento:
- **1:N (Projetos - Desenvolvedores)**: Um projeto pode ter vários desenvolvedores, mas cada desenvolvedor está associado a um único projeto.

---

## 2. Recursos Humanos

### Tabelas:
- **Funcionarios**
  - ID
  - Nome
  - Cargo
  - Data_Ingresso
  - Departamento

- **Salarios**
  - ID
  - Funcionario_Associado
  - Valor
  - Data_Pagamento

### Relacionamento:
- **1:N (Funcionarios - Salarios)**: Um funcionário pode ter vários salários registrados, mas cada salário é relacionado a um único funcionário.

---

## 3. Gerenciamento de Projetos

### Tabelas:
- **Projetos**
  - ID
  - Nome
  - Descrição
  - Data_Inicio
  - Data_Entrega
  - Responsavel

- **Tarefas**
  - ID
  - Projeto_Associado
  - Descrição
  - Responsavel
  - Data_Inicio
  - Data_Entrega

### Relacionamento:
- **1:N (Projetos - Tarefas)**: Um projeto pode ter várias tarefas, mas cada tarefa pertence a um único projeto.
- **1:N (Desenvolvedores - Tarefas)**: Um desenvolvedor pode ser responsável por várias tarefas, mas cada tarefa tem um único responsável.

---

## 4. Qualidade e Testes

### Tabelas:
- **Testes**
  - ID
  - Projeto_Associado
  - Desenvolvedor
  - Resultado
  - Data_Realizacao

- **Defeitos**
  - ID
  - Teste_Associado
  - Descrição
  - Gravidade
  - Status

### Relacionamento:
- **1:N (Testes - Defeitos)**: Um teste pode ter vários defeitos, mas cada defeito é relacionado a um único teste.

---

## 5. Infraestrutura e Redes

### Tabelas:
- **Equipamentos**
  - ID
  - Nome
  - Tipo
  - Status
  - Responsavel

- **Redes**
  - ID
  - Nome
  - Equipamento_Associado
  - Tipo
  - Velocidade

### Relacionamento:
- **1:N (Equipamentos - Redes)**: Um equipamento pode estar associado a várias redes, mas cada rede está associada a um único equipamento.

---

## 6. Suporte Técnico

### Tabelas:
- **Chamados**
  - ID
  - Cliente
  - Descrição
  - Status
  - Atendente
  - Data_Abertura

- **Solucoes**
  - ID
  - Chamado_Associado
  - Descricao
  - Atendente
  - Data_Solucao

### Relacionamento:
- **1:N (Chamados - Solucoes)**: Um chamado pode ter várias soluções, mas cada solução está relacionada a um único chamado.

---

## 7. Marketing e Vendas

### Tabelas:
- **Campanhas**
  - ID
  - Nome
  - Tipo
  - Data_Inicio
  - Data_Fim
  - Responsavel

- **Clientes**
  - ID
  - Nome
  - Email
  - Data_Cadastro
  - Campanha_Associada

### Relacionamento:
- **1:N (Campanhas - Clientes)**: Uma campanha pode ter vários clientes, mas cada cliente está associado a uma única campanha.

---

## 8. Finanças

### Tabelas:
- **Transacoes**
  - ID
  - Tipo
  - Valor
  - Data
  - Descricao

- **Contas**
  - ID
  - Tipo
  - Saldo

### Relacionamento:
- **1:N (Contas - Transacoes)**: Uma conta pode ter várias transações, mas cada transação está relacionada a uma única conta.

---

## 9. Atendimento ao Cliente

### Tabelas:
- **Chamados**
  - ID
  - Cliente
  - Descrição
  - Status
  - Atendente
  - Data_Abertura

- **Solucoes**
  - ID
  - Chamado_Associado
  - Descricao
  - Atendente
  - Data_Solucao

### Relacionamento:
- **1:N (Chamados - Solucoes)**: Um chamado pode ter várias soluções, mas cada solução está relacionada a um único chamado.

---

## 10. Pesquisa e Desenvolvimento

### Tabelas:
- **Projetos_Pesquisa**
  - ID
  - Nome
  - Descrição
  - Data_Inicio
  - Data_Entrega
  - Responsavel

- **Resultados_Pesquisa**
  - ID
  - Projeto_Pesquisa_Associado
  - Descrição
  - Data_Realizacao

### Relacionamento:
- **1:N (Projetos_Pesquisa - Resultados_Pesquisa)**: Um projeto de pesquisa pode gerar vários resultados, mas cada resultado está associado a um único projeto de pesquisa.

---

## 11. Segurança da Informação

### Tabelas:
- **Acessos**
  - ID
  - Usuario
  - Data_Acesso
  - Tipo_Acesso
  - IP

- **Logs_Seguranca**
  - ID
  - Evento
  - Usuario_Relacionado
  - Data_Evento
  - Detalhes

### Relacionamento:
- **1:N (Acessos - Logs_Seguranca)**: Um acesso pode gerar vários logs de segurança, mas cada log está relacionado a um único acesso.

---

## 12. Manutenção e Sustentação

### Tabelas:
- **Chamados**
  - ID
  - Cliente
  - Descrição
  - Status
  - Atendente
  - Data_Abertura

- **Solucoes**
  - ID
  - Chamado_Associado
  - Descricao
  - Atendente
  - Data_Solucao

### Relacionamento:
- **1:N (Chamados - Solucoes)**: Um chamado pode ter várias soluções, mas cada solução está relacionada a um único chamado.

