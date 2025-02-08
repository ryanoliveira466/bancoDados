CREATE TABLE desenvolvedores(
	id_dev INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_dev VARCHAR(100) NOT NULL,
	cargo_dev VARCHAR(200) NOT NULL,
	data_ingresso VARCHAR(20) NOT NULL
	);


CREATE TABLE projetos(
	id_projetos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_projetos VARCHAR(100) NOT NULL,
	desc_projetos VARCHAR(200) NOT NULL,
	data_inicio VARCHAR(20) NOT NULL,
	data_entrega VARCHAR(20),
	id_responsavel INT NOT NULL,
	FOREIGN KEY (id_responsavel) 
	REFERENCES desenvolvedores(id_dev)
	);
	
CREATE TABLE funcionarios(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_funcionario VARCHAR(100) NOT NULL,
	cargo_funcionario VARCHAR(100) NOT NULL,
	data_ingresso VARCHAR(20) NOT NULL,
	departamento_funcionario VARCHAR(100) NOT NULL
	);
	
	
CREATE TABLE salario(
   id_salario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
   funcionario_associado_salario INT NOT NULL,
	valor_salario FLOAT NOT NULL,
	data_pagamento_salario VARCHAR(20) NOT NULL,
	FOREIGN KEY (funcionario_associado_salario)
	REFERENCES funcionarios(id_funcionario)
	);	
	
	
CREATE TABLE tarefas(
	id_tarefa INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	projeto_associado_tarefa INT NOT NULL,
	descrição_tarefa VARCHAR(200) NOT NULL,
	responsavel_tarefa INT NOT NULL,
	data_inicio_tarefa VARCHAR(20) NOT NULL,
	data_entrega_tarefa VARCHAR(20),
	FOREIGN KEY (projeto_associado_tarefa)
	REFERENCES projetos(id_projetos),
	FOREIGN KEY (responsavel_tarefa)
	REFERENCES desenvolvedores(id_dev)
	);

CREATE TABLE testes(
	id_teste INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	projeto_associado_teste INT NOT NULL,
	desenvolvedor_teste INT NOT NULL,
	resultado_teste VARCHAR(200) NOT NULL,
	data_realizacao_teste VARCHAR(20) NOT NULL,
	FOREIGN KEY (projeto_associado_teste)
	REFERENCES projetos(id_projetos),
	FOREIGN KEY (desenvolvedor_teste)
	REFERENCES desenvolvedores(id_dev)
	);
	
	
CREATE TABLE defeitos(
	id_defeito INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	teste_associado_defeito INT NOT NULL,
	descrição_defeito VARCHAR(200) NOT NULL,
	gravidade_defeito VARCHAR(200) NOT NULL,
	status_defeito VARCHAR(200) NOT NULL,
	FOREIGN KEY (teste_associado_defeito)
	REFERENCES testes(id_teste)
	);	
	
	
CREATE TABLE equipamentos(
	id_equipamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_equipamento VARCHAR(100) NOT NULL,
	tipo_equipamento VARCHAR(100) NOT NULL,
	status_equipamento VARCHAR(100) NOT NULL,
	responsavel_equipamento INT NOT NULL,
	FOREIGN KEY (responsavel_equipamento)
	REFERENCES desenvolvedores(id_dev)
	);
	
CREATE TABLE redes(
	id_rede INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_rede VARCHAR(100) NOT NULL,
	equipamento_associado INT NOT NULL,
	tipo_rede VARCHAR(100) NOT NULL,
	velocidade_rede FLOAT NOT NULL,
	FOREIGN KEY (equipamento_associado)
	REFERENCES equipamentos(id_equipamento)
	);	

CREATE TABLE chamadas(
	id_chamada INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	cliente_chamada INT NOT NULL,
	descrição_chamada VARCHAR(100) NOT NULL,
	status_chamada VARCHAR(100) NOT NULL,
	atendente_chamada INT NOT NULL,
	data_abertura VARCHAR(50) NOT NULL,
	FOREIGN KEY (atendente_chamada)
	REFERENCES funcionarios(id_funcionario),
	FOREIGN KEY (cliente_chamada)
	REFERENCES clientes(id_cliente)
	);
	
CREATE TABLE solucoes(
	id_solucoes INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	chamada_associada INT NOT NULL,
	descrição_solucoes VARCHAR(100) NOT NULL,
	atendente VARCHAR(100) NOT NULL,
	data_solucao VARCHAR(50) NOT NULL,
	FOREIGN KEY (chamada_associada)
	REFERENCES chamadas(id_chamada)
	);
	
CREATE TABLE campanhas(
	id_campanha INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_campanha VARCHAR(100) NOT NULL,
	tipo_campanha VARCHAR(100) NOT NULL,
	data_inicio VARCHAR(50),
	data_fim VARCHAR(50),
	responsavel_campanha INT NOT NULL,
	FOREIGN KEY (responsavel_campanha)
	REFERENCES funcionarios(id_funcionario)
	);
	
CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_cliente VARCHAR(100) NOT NULL,
	email_cliente VARCHAR(100) NOT NULL,
	data_cadastro VARCHAR(50),
	campanha_associada INT NOT NULL,
	FOREIGN KEY (campanha_associada)
	REFERENCES campanhas(id_campanha)
	);
		
CREATE TABLE transacoes(
	id_transacao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	tipo_transacao VARCHAR(100) NOT NULL,
	valor_transacao VARCHAR(100) NOT NULL,
	data_transacao VARCHAR(50) NOT NULL,
	descricao_transacao VARCHAR(100) NOT NULL
	);	
	
CREATE TABLE contas(
	id_conta INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	tipo_conta VARCHAR(100) NOT NULL,
	saldo_conta FLOAT NOT NULL
	);								

CREATE TABLE projetos_pesquisa(
	id_projeto_pesquisa INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nome_projeto_pesquisa VARCHAR(100) NOT NULL,
	desc_projeto_pesquisa VARCHAR(200) NOT NULL,
	data_inicio_projeto_pesquisa VARCHAR(50) NOT NULL,
	data_entrega_projeto_pesquisa VARCHAR(50),
	responsavel_projeto_pesquisa INT NOT NULL,
	FOREIGN KEY (responsavel_projeto_pesquisa) 
	REFERENCES desenvolvedores(id_dev)
	);	
	
CREATE TABLE resultados_pesquisa(
	id_resultado_pesquisa INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	projeto_pesquisa_associado INT NOT NULL,
	descricao_resultado_pesquisa VARCHAR(200) NOT NULL,
	data_realizacao_resultado_pesquisa VARCHAR(50),
	FOREIGN KEY (projeto_pesquisa_associado) 
	REFERENCES projetos_pesquisa(id_projeto_pesquisa)
	);
	
CREATE TABLE acessos(
	id_acesso INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	usuario_acesso INT NOT NULL,
	data_acesso VARCHAR(50) NOT NULL,
	tipo_acesso VARCHAR(50) NOT NULL,
	ip_acesso INT NOT NULL,
	FOREIGN KEY (usuario_acesso) 
	REFERENCES funcionarios(id_funcionario)
	);
	
CREATE TABLE logs_seguranca(
	id_log_seguranca INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	evento_log_seguranca VARCHAR(50) NOT NULL,
	usuario_relacionado_log_seguranca INT NOT NULL,
	data_evento_log_seguranca VARCHAR(50) NOT NULL,
	detalhes_log_seguranca VARCHAR(100) NOT NULL,
	FOREIGN KEY (usuario_relacionado_log_seguranca) 
	REFERENCES acessos(id_acesso)
	);
