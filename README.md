# Atividades sobre Banco de Dados

Este repositório contém atividades de prática sobre banco de dados e lógica de programação utilizando HeidiSQL/Mariadb.

<img src="https://upload.wikimedia.org/wikipedia/commons/8/87/Sql_data_base_with_logo.png" width="400" />

## Objetivo
Aprender os conceitos fundamentais de bancos de dados e como interagir com eles. O objetivo é entender como armazenar, consultar, atualizar e deletar dados de maneira eficiente.

## Dependências

* Para utilizar o banco de dados, vamos utilizar por agora o HeidiSQL - [HeidiSQL - Página Oficial](https://www.heidisql.com/)

 
<img src="https://upload.wikimedia.org/wikipedia/commons/3/32/HeidiSQL_logo_image.png" width="200" />

<br>

* Para utilizar o HeidiSQL, vamos utilizar o banco de dados MariaDB - [MariaDB - Página Oficial](https://mariadb.org/)

<img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/MariaDB_colour_logo.svg" width="400" />






## Como utilizar

* Copie o diretório da pasta bin do MariaDB:

```bash
cd C:\Users\Ryan Oliveira\Documents\mariadb-11.4.2-winx64\bin
```

* Abra o terminal de comando do Windows e execute:

```bash
mysql_install_db.exe
```

* Crie um arquivo de texto e depois mude esse aquivo para .bat com o executável abaixo(coloque-o na pasta bin com o nome de `starserver`):


```bash
mysqld.exe --console
```

* Abra o HeidiSQL e verifique esses dados:

Tipo de rede: MariaDB ou MySQL;

Biblioteca: libmysql.dll

Servidor/IP: 127.0.0.1

Usuário: root

Senha:

Porta: 3306

**Após isso o ambiente já estará pronto no HeidiSQL** 
 
* Caso queira, você pode acessar o banco de dados diretamente do terminal
* Execute esse código na basta bin novamente

```bash
mysql -u root -p
```

* Depois disso, pedirá senha(coloque-a se tiver) e pronto, você pode acessar o banco através do terminal
```prompt
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 11.4.2-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
```



