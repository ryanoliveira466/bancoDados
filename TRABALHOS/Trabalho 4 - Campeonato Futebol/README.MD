# Campeonato de Futsal - Base de Dados

Irá começar um campeonato de Futsal na escola e estão precisando de você! Para isso, crie uma base de dados chamada `Campeonato_[Seu Nome]`.

## Estrutura do Banco de Dados

### 1. Tabela de Times
A tabela de times armazenará informações sobre cada time, como:
- Nome do time
- Cidade
- Estado
- País
- Data de fundação
- Técnico
- Entre outros.

### 2. Tabela de Jogadores
A tabela de jogadores armazenará informações sobre cada jogador, como:
- Nome do jogador
- Posição
- Idade
- Altura
- Peso
- Número da camisa
- Entre outros.

### 3. Tabela de Jogos
A tabela de jogos armazenará informações sobre cada jogo, como:
- Data
- Hora
- Local
- Time adversário
- Resultado
- Entre outros.

### 4. Tabela de Estatísticas
A tabela de estatísticas armazenará informações sobre as estatísticas de cada jogador e time, como:
- Gols marcados
- Assistências
- Cartões amarelos e vermelhos recebidos
- Entre outros.

#### Exemplo de criação da tabela Estatísticas

```sql
CREATE TABLE Estatisticas(
	id_estatistica INT NOT NULL AUTO_INCREMENT,
	id_jogador INT,
	id_time INT,
	gols_time_casa INT,
	gols_time_fora INT,
	assistencia_casa INT, -- Referente às assistências de gol
	assistencia_fora INT,
	cartoes_amarelos_casa INT,
	cartoes_amarelos_fora INT,
	-- crie as foreign keys com constraint
);
```

---


## Atividades

### 1 - Qual é a lista completa de jogadores que fazem parte do time de futsal?
Para listar os jogadores de um time específico, pode-se realizar uma consulta SQL que busque todos os jogadores associados ao time, utilizando a tabela de jogadores e associando com a tabela de times.

### 2 - Quantas partidas o time já jogou nesta temporada?
Para obter o número de partidas que o time já disputou, deve-se contar o número de registros na tabela de jogos onde o time está envolvido, seja como time da casa ou como time visitante.

### 3 - Qual foi o resultado da última partida disputada pelo time?
A consulta para saber o resultado da última partida disputada pelo time pode ser realizada consultando a tabela de jogos, ordenando pela data de forma decrescente e filtrando pela identificação do time.

### 4 - Quais jogadores têm mais gols marcados na temporada?
Para listar os jogadores com mais gols, pode-se consultar a tabela de estatísticas, somando os gols de cada jogador ao longo das partidas da temporada e ordenando pela quantidade de gols.

### 5 - Qual é a média de gols por partida do time até agora?
A média de gols por partida pode ser calculada dividindo o total de gols marcados pelo time pelo número total de partidas disputadas na temporada.

### 6 - Quem são os jogadores que têm mais cartões amarelos acumulados?
A consulta pode ser feita através da tabela de estatísticas, somando os cartões amarelos de cada jogador e ordenando em ordem decrescente para identificar os jogadores com mais cartões.

### 7 - Quantas faltas foram cometidas pelo time até agora na temporada?
As faltas cometidas pelo time podem ser consultadas somando as ocorrências na tabela de jogos e estatísticas que se referem ao time, filtrando as informações relacionadas às faltas.

### 8 - Quais são as informações dos jogadores que jogaram em cada partida e em qual time eles estavam?
A consulta pode juntar as tabelas de jogadores, jogos e estatísticas, mostrando as informações dos jogadores e indicando em qual time eles estavam durante cada partida.

### 9 - Quais são as partidas em que um determinado jogador jogou e qual foi o resultado da partida?
A consulta pode buscar todas as partidas em que o jogador participou, associando as tabelas de jogadores e jogos para verificar os resultados dessas partidas.

### 10 - Quais são as informações dos jogadores que têm mais de 10 gols na temporada atual?
Aqui, pode-se realizar uma consulta que filtre jogadores com mais de 10 gols na temporada, utilizando a tabela de estatísticas para verificar a quantidade de gols de cada jogador.

### 11 - Qual é o ranking dos times com base no número de vitórias na temporada atual?
O ranking pode ser calculado somando o número de vitórias de cada time na tabela de jogos e estatísticas, ordenando os times em ordem decrescente de vitórias.

