require 'sqlite3'

db = SQLite3::Database.open './banco/alunos.db'

db.execute 'CREATE TABLE alunos(
    id integer primary key autoincrement,
    nome text not null,
    matricula text not null,
    qtd_participacao integer not null    
);'

db.execute 'CREATE TABLE contador(
    contador integer    
);'

db.execute 'insert into contador values(?)', 1