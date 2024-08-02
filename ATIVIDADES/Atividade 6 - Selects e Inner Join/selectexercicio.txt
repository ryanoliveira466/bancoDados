1)SELECT nome_dev FROM desenvolvedores

2)SELECT nome,tipo FROM equipamentos

3)SELECT nome_projetos,desc_projetos FROM projetos

4)SELECT nome FROM clientes

5)SELECT nome_dev,cargo_dev FROM desenvolvedores

6)SELECT nome FROM equipamentos

7)SELECT nome_projetos,id_dev FROM projetos WHERE nome_projetos = 'Software'

8)SELECT nome,data_cadastro FROM clientes WHERE data_cadastro = '02/01/2024'

9)SELECT id_chamado,descricao FROM chamados

10)SELECT nome,tipo FROM equipamentos

11)SELECT desenvolvedores.nome_dev,projetos.nome_projetos FROM projetos
INNER JOIN desenvolvedores
WHERE desenvolvedores.id_dev = projetos.id_projetos

