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


Atividades
Qual é a lista completa de jogadores que fazem parte do time de futsal?

Quantas partidas o time já jogou nesta temporada?

Qual foi o resultado da última partida disputada pelo time?

Quais jogadores têm mais gols marcados na temporada?

Qual é a média de gols por partida do time até agora?

Quem são os jogadores que têm mais cartões amarelos acumulados?

Quantas faltas foram cometidas pelo time até agora na temporada?

Quais são as informações dos jogadores que jogaram em cada partida e em qual time eles estavam?

Quais são as partidas em que um determinado jogador jogou e qual foi o resultado da partida?

Quais são as informações dos jogadores que têm mais de 10 gols na temporada atual?

Qual é o ranking dos times com base no número de vitórias na temporada atual?
