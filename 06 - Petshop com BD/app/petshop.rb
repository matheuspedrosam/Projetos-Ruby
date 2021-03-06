require 'sqlite3'
 
class Petshop

    def initialize
        @db = SQLite3::Database.open './banco/banco_petshop.db'
        @db.results_as_hash = true    
    end

    def saldo #saldo a receber
        soma = 0
        resultado = @db.execute 'select valor from agendamentos left join servicos on
        agendamentos.id_servico = servicos.id_servico'
        resultado.each do |valores|
            soma += valores["valor"]
        end
        soma
    end

    def logar(login, senha = '*')
        if senha == '*'
            resultado = @db.execute 'select login from clientes where login=?', login
            if resultado != []
                return 'Já existe um Usuário com esse login'
            end
        else
            resultado = @db.execute 'select nome from clientes where login=? and senha=?', login, senha
            if resultado == []
                'Usuario não cadastrado'
            else
                nome = resultado[0]
                "Login efetuado com sucesso!, bem vindo #{nome["nome"]}"
            end
        end
    end

    def clientes(telefone = 'x')
        if telefone == 'x'
            clientes = @db.execute 'select * from clientes'
            clientes.to_a
        else
            clientes = @db.execute 'select * from clientes where telefone=?', telefone
            if clientes == []
                'Não existe Cliente com esse telefone'
            else
                clientes.to_a
            end
        end
    end

    def remover_cliente(telefone)
        clientes = @db.execute 'select telefone from clientes where telefone=?', telefone
        if clientes != []
            @db.execute 'delete from clientes where telefone=?', telefone
            puts 'Cliente Removido com sucesso!'
        else
            puts 'Não existe cliente com esse telefone'
        end
    end

    def cadastrar_cliente(cliente)
        if cliente.cliente_valido?
            resultado = @db.execute 'select telefone from clientes'
            resultado.each do |telefones|
                if telefones[0] == cliente.telefone
                    return 'já existe um cliente com este telefone'
                end
            end
            @db.execute 'insert into clientes (login, senha, nome, pet, data_nasc, telefone) values (?, ?, ?, ?, ?, ?)', cliente.login, cliente.senha, cliente.nome, cliente.pet, cliente.data_nasc, cliente.telefone
            'cliente cadastrado com sucesso!'
        else
            'cliente invalido!'
        end
    end

    def agendamentos(data = '*')
        if data == '*'
            resultado = @db.execute 'select nome, pet, telefone, descricao, ag_data, hora from agendamentos
            left join clientes on agendamentos.id_cliente = clientes.id_cliente
            left join servicos on agendamentos.id_servico = servicos.id_servico'
            if resultado == []
                return 'Não existe agendamentos'
            end
            agendamentos = resultado.to_a
        else
            resultado = @db.execute 'select nome, pet, telefone, descricao, ag_data, hora from agendamentos
            left join clientes on agendamentos.id_cliente = clientes.id_cliente
            left join servicos on agendamentos.id_servico = servicos.id_servico
            where ag_data = ?', data
            if resultado == []
                return 'Não existe agendamentos'
            end
            agendamentos = resultado.to_a
        end
    end

    def agendar(servico_desejado, data, hora, telefone)
        resultado = @db.execute 'select hora from agendamentos where ag_data=? and hora=?', data, hora
            if resultado != []
                return 'já existe uma agendamento para esta data, nesse horário'
            end
        servico = 0
        valor = 0
        if servico_desejado == 'banho'
            servico = 1
            valor = 20
        elsif servico_desejado == 'tosa'
            servico = 2
            valor = 25
        elsif servico_desejado == 'banho e tosa'
            servico = 3
            valor = 38.25
        end
        cliente = @db.execute 'select * from clientes where telefone=?', telefone
        if cliente == []
            return 'Não existe nenhum cliente com esse numero'
        end
        cliente_certo = cliente[0]
        id = cliente_certo["id_cliente"]
        @db.execute 'insert into agendamentos (id_cliente, ag_data, hora, id_servico) values(?, ?, ?, ?)', id, data, hora, servico
        "agendamento concluido com sucesso!, o valor foi de R$ #{valor},00"
    end

    def remover_agendamento(data, hora)
        agendamento = @db.execute 'select ag_data from agendamentos where ag_data=? and hora=?', data, hora
        if agendamento != []
            @db.execute 'delete from agendamentos where ag_data=? and hora=?', data, hora
            'Agendamento Removido com sucesso!'
        else
            'Não existe agendamento com essa data e hora'
        end
    end

    
end