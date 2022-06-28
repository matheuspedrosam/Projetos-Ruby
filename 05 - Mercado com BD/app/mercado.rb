require 'sqlite3'

class Mercado

    def initialize
        @db = SQLite3::Database.open './aula_10/app/banco_mercado.db'
        @db.results_as_hash = true 
    end

    def cadastrar_mercado(nome)
        resultado = @db.execute 'select nome from mercados where nome=?', nome
        if resultado == []
            @db.execute 'insert into mercados (nome) values (?)', nome
            return 'Mercado cadastrado com sucesso!'
        else
            return 'Já existe um mercado com esse nome'
        end
    end

    def estoque(nome)
        id = @db.execute 'select id from mercados where nome=?', nome
        id_mer = id[0]
        id_mercado = id_mer["id"]
        estoque = @db.execute 'select sabor, valor from estoque left join sacoles on sacoles.id = estoque.id_sacole where estoque.id_mercado=?', id_mercado
        estoque
    end

    def cadastrar_estoque(nome, estoque)
        id = @db.execute 'select id from mercados where nome=?', nome
        id_mer = id[0]
        id_mercado = id_mer["id"]
        estoque.each do |sabores|
            id_sac = @db.execute 'select id from sacoles where sabor=?', sabores
            id_sacol = id_sac[0]
            id_sacole = id_sacol["id"]
            @db.execute 'insert into estoque (id_sacole, id_mercado) values(?,?)', id_sacole, id_mercado
        end
    end

    def vender(nome, sabores)
        id_sacole = 0
        resultado = @db.execute 'select id from mercados where nome=?', nome
        id = resultado[0]
        id_mercado = id["id"]
        sabores.each do |sabor|
            if sabor == 'morango'
                id_sacole = 1
            elsif sabor == 'limao'
                id_sacole = 2
            elsif sabor == 'pitanga'
                id_sacole = 3
            end
            resultado = @db.execute 'select id from estoque where id_mercado=? and id_sacole=?', id_mercado, id_sacole
            id = resultado[0]
            id_estoque = id["id"]
            if resultado != []
                @db.execute 'delete from estoque where id=?', id_estoque
                @db.execute 'insert into vendas (id_sacole, id_mercado) values (?,?)', id_sacole, id_mercado
            else
                'não existe o iten no estoque'
            end
        end
    end

    def saldo(nome)
        soma = 0
        resultado = @db.execute 'select id from mercados where nome=?', nome
        id = resultado[0]
        id_mercado = id["id"]
        resultado = @db.execute 'select id_sacole from vendas where id_mercado=?', id_mercado
        resultado.each do |hash|
            hash.each do |key, value|
                if value == 1
                    valor = 1.0
                elsif value == 2
                    valor = 0.5
                elsif value == 3
                    valor = 1.0
                end
                soma += valor
            end
        end
        soma
    end

end