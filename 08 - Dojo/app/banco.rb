require 'sqlite3'

db = SQLite3::Database.open './Dojo/app/alunos.db'

db.execute 'CREATE TABLE alunos(
  id integer primary key autoincrement,
  nome varchar(50) not null,
  matricula varchar(30) not null
)'