# require 'sqlite3'

# db = SQLite3::Database.open './aula_10/app/banco_mercado.db'

# db.execute 'CREATE TABLE sacoles(
#   id integer primary key,
#   sabor varchar(30) not null,
#   valor float not null
# );'

# db.execute 'CREATE TABLE mercados(
#   id integer primary key autoincrement,
#   nome varchar(30) not null
# );'

# db.execute 'CREATE TABLE estoque(
#   id integer primary key autoincrement,
#   id_sacole integer references sacoles(id),
#   id_mercado integer references mercados(id)
# );'

# db.execute 'CREATE TABLE vendas(
#   id integer primary key autoincrement,
#   id_sacole integer references sacoles(id),
#   id_mercado integer references mercados(id)
# );'

# db.execute 'insert into sacoles (id, sabor, valor) values(?,?,?)', 1, 'morango', 1.00
# db.execute 'insert into sacoles (id, sabor, valor) values(?,?,?)', 2, 'limao', 0.50
# db.execute 'insert into sacoles (id, sabor, valor) values(?,?,?)', 3, 'pitanga', 1.00


  # Criar uma tabela 'sacoles' com as seguintes colunas:
  # 1. id => Int
  # 3. sabor => String
  # 4. valor => Float
  #
  # Ex.:
  # id | sabor    | valor |
  # 21 |  morango | 1.0   |
  # 22 |  limao   | 0.5   |
  # 23 |  pitanga | 1.0   |
  #
  # Criar uma tabela 'estoques' com as seguintes colunas:
  # 1. id => Int
  # 2. mercadinho_id => Int
  # 3. sacole_id => Int
  # 4. vendido => Boolean
  #
  # Ex.:
  # id | mercadinho_id | sacole_id | vendido |
  # 11 |  1            | 21         | false   |
  # 12 |  1            | 21         | false   |
  # 13 |  1            | 22         | false   |
  # 14 |  1            | 23         | false   |
  # 15 |  1            | 23         | false   |
  # 16 |  1            | 23         | false   |
  #
  # Criar uma tabela 'mercadinhos' com as seguintes colunas:
  # 1. id => Int
  # 2. nome => String
  #
  # Ex.:
  # id | nome |
  # 1  | Mercadinho Rachid |