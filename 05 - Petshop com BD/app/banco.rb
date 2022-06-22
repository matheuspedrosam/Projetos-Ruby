require 'sqlite3'
db = SQLite3::Database.open 'banco_petshop.db'

db.execute 'create table if not exists clientes( 
    id_cliente integer primary key autoincrement,
    login varchar(100) not null,
    senha varchar(30) not null,
    nome varchar(50) not null, 
    pet varchar(50) not null, 
    data_nasc varchar(50) not null, 
    telefone varchar(22) not null
    );'
    
db.execute 'create table if not exists servicos( 
    id_servico integer primary key autoincrement, 
    descricao varchar(50) not null, 
    valor float not null 
    );'
    
db.execute 'create table if not exists agendamentos( 
    id_agendamento integer primary key autoincrement, 
    id_cliente integer not null references clientes(id_cliente), 
    ag_data date not null,
    hora varchar(2) not null, 
    id_servico integer not null references servicos(id_servico) 
    );'

db.execute 'insert into servicos (descricao, valor) values (?, ?);', 'banho', '20.00'

db.execute 'insert into servicos (descricao, valor) values (?, ?);', 'tosa', '25.00'

db.execute 'insert into servicos (descricao, valor) values (?, ?);', 'banho e tosa', '38.25'