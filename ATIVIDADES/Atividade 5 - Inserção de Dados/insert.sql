INSERT INTO desenvolvedores (nome_dev, cargo_dev) 
VALUES 
('Carlos Silva', 'Desenvolvedor Backend'),
('Ana Souza', 'Desenvolvedora Frontend'),
('Rafael Oliveira', 'DevOps'),
('Juliana Costa', 'Desenvolvedora Full Stack');


INSERT INTO projetos (nome_projetos, desc_projetos, id_dev) 
VALUES 
('Projeto A', 'Sistema de gerenciamento de vendas', 1),
('Projeto B', 'Aplicativo de finanças pessoais', 2),
('Projeto C', 'Plataforma de e-commerce', 3),
('Projeto D', 'Website institucional', 4);


INSERT INTO equipamentos (nome, tipo) 
VALUES 
('Laptop Dell XPS 15', 'Laptop'),
('Monitor Samsung 27"', 'Monitor'),
('Teclado Mecânico', 'Periférico'),
('Mouse Logitech', 'Periférico');


INSERT INTO clientes (nome, email, data_cadastro) 
VALUES 
('João Pereira', 'joao.pereira@email.com', '2025-01-10'),
('Maria Oliveira', 'maria.oliveira@email.com', '2025-01-12'),
('José Santos', 'jose.santos@email.com', '2025-02-01'),
('Patrícia Lima', 'patricia.lima@email.com', '2025-02-05');


INSERT INTO chamados (id_cliente, descricao, id_dev) 
VALUES 
(1, 'Erro ao acessar o sistema de vendas', 1),
(2, 'Bug no aplicativo de finanças', 2),
(3, 'Problemas de integração com o banco de dados', 3),
(4, 'Site fora do ar', 4);
