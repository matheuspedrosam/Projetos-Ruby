class Petshop

    def initialize
        @agendamentos = []
        @saldo = 0
        @saldo_a_receber = 0
    end

    def saldo
        @saldo
    end

    def saldo_a_receber
        @saldo_a_receber
    end

    def agendar(cliente, opcao, data, hora)
        total = 0
        if hora == 12
            "Horario de Almoço"
        else
            agendamentos.each do |hash|
                if hash[:data] == data
                    if hash[:hora] == "#{hora}hrs"
                        total += 1
                    end
                end
            end
            if cliente.cliente_valido? #apartir daqui começa o agendamento, caso as condições forem validas
                if total == 0
                    hora = "#{hora}hrs"
                    valor = 0
                    case opcao
                        when 'banho'
                            valor = 20
                        when 'tosa'
                            valor = 25
                        when 'banho e tosa'
                            valor = 38.25
                    else
                        'opcao invalida'
                    end
                    hash = {cliente: cliente.nome, pet: cliente.pet, opcao: opcao, data: data, hora: hora, valor: valor}
                    @agendamentos << hash
                    @saldo_a_receber += valor
                    "agendamento concluido, o preco saira por R$ #{valor}"
                else
                    'Já existe um agendamento para esta hora!'
                end
            else
                'cliente inválido'
            end
        end
    end

    def agendamentos
        @agendamentos
    end

    def agendamentos_do_dia_resumidos
        hoje = Time.now
        agendamentos_hoje = []
        hash = {}
        valor_cliente = String.new
        valor_opcao = String.new
        valor_hora = String.new
        agendamentos.each do |hash_ag|
            if hash_ag[:data] == "#{hoje.day}/0#{hoje.month}"
                valor_cliente = hash_ag[:cliente]  
                valor_opcao = hash_ag[:opcao]
                valor_hora = hash_ag[:hora]
                hash = {cliente: valor_cliente, opcao: valor_opcao, hora: valor_hora}
                agendamentos_hoje << hash
            end
        end
        agendamentos_hoje
    end

    def consultar_agendamentos_banho
        total = []
        agendamentos.each do |hash|
            if hash[:opcao] == 'banho'
                total << hash
            end
        end
        total
    end

    def consultar_agendamentos_tosa
        total = []
        agendamentos.each do |hash|
            if hash[:opcao] == 'tosa'
                total << hash
            end
        end
        total
    end

    def consultar_agendamentos_banho_e_tosa
        total = []
        agendamentos.each do |hash|
            if hash[:opcao] == 'banho e tosa'
                total << hash
            end
        end
        total
    end

    def consultar_agendamentos_pelo_cliente(cliente)
        ag_clientes = agendamentos.select do |hash_ag|
            hash_ag[:cliente] == cliente.nome
        end
        ag_clientes
    end

    def consultar_agendamentos_pela_data(data = 'hoje')
        if data == 'hoje'
            dia = Time.now
            ag_hoje = agendamentos.select do |hash_ag|
                hash_ag[:data] == "#{dia.day}/0#{dia.month}"
            end
            ag_hoje
        else
            ag_datas = agendamentos.select do |hash_ag|
                hash_ag[:data] == data
            end
            ag_datas
        end
    end

    def remover_agendamento(cliente, data = '*')
        if data == '*'
            total = 0
            agendamentos_a_remover = []
            agendamentos.each do |hash_ag|
                if hash_ag[:cliente] == cliente.nome
                    agendamentos_a_remover << hash_ag
                    total += 1
                end
            end
            for i in 0..total do
                agendamentos.delete(agendamentos_a_remover[i])
            end
            "agendamentos do #{cliente.nome} removidos com sucesso"
        else
            agendamentos.each do |hash_ag|
                if hash_ag[:data] == data
                    if hash_ag[:cliente] == cliente.nome
                        agendamentos.delete_at(agendamentos.index(hash_ag))
                    end
                end
            end
            "agendamento removido com sucesso para o #{cliente.nome} na data #{data}"
        end
    end

end