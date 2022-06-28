require '.\app\cliente.rb'
require '.\app\petshop.rb'
require 'sqlite3'

db = SQLite3::Database.open './banco/banco_petshop.db'
db.results_as_hash = true
petshop = Petshop.new
interacao1 = true
interacao2 = true
puts ""
puts "------------------------MENU------------------------"
puts "-------------------SEJA BEM VINDO-------------------\n\n"

while interacao1 == true
    puts "----------------------------------------------------"
    puts "|              O quê deseja fazer?                 |"
    puts "|                                                  |"
    puts "|0 - sair do programa                              |"
    puts "|1 - fazer Login                                   |"
    puts "|2 - fazer Cadastro                                |"
    puts "----------------------------------------------------"
    print "resposta: "
    resposta = gets.chomp.to_i
    puts ""
    case resposta
    when 0
        interacao1 = false
        interacao2 = false
        puts ''
    when 1 # Login
        puts "--------------Login de Clientes---------------"
        puts ""
        print 'digite seu login:'
        login = gets.chomp
        print 'digite sua senha:'
        senha = gets.chomp
        resultado = petshop.logar(login, senha)
        if resultado != 'Usuario não cadastrado'
            interacao1 = false
            puts ""
            puts resultado
        else
            puts ""
            puts resultado
        end
    when 2 # Cadastro
        puts "-------------Cadastro de Clientes-------------"
        puts ""
        print 'login:'
        login = gets.chomp
        resultado = petshop.logar(login)
        if resultado == 'Já existe um Usuário com esse login'
            puts ""
            puts 'Já existe um Usuário com esse login'
        else
            print 'senha:'
            senha = gets.chomp
            print 'nome:'
            nome = gets.chomp
            print 'pet:'
            pet = gets.chomp
            print 'data_nasc(dd/mm/yyyy):'
            data_nasc = gets.chomp
            print 'telefone(988247612):'
            telefone = gets.chomp
            cliente = Cliente.new(login, senha, nome, pet, data_nasc, telefone)
            puts ''
            resultado = petshop.cadastrar_cliente(cliente)
            if resultado == 'já existe um cliente com este telefone'
                puts 'já existe um cliente com este telefone'
            else
                puts resultado
                interacao1 = false
            end
            puts ""
        end
    end
end
puts ""
while interacao2 == true
    puts "----------------------------------------------------"
    puts "|              O quê deseja fazer?                 |"
    puts "|                                                  |"
    puts "|0 - sair do programa                              |"
    puts "|1 - agendar consulta                              |"
    puts "|2 - listar consultas                              |"
    puts "|3 - filtrar consultas (por data)                  |"
    puts "|4 - listar consultas do dia atual                 |"
    puts "|5 - remover consulta (por data e hora)            |"
    puts "|6 - listar clientes cadastrados                   |"
    puts "|7 - buscar cliente (por telefone)                 |"
    puts "|8 - remover cliente (por telefone)                |"
    puts "|9 - consultar saldo a receber do petshop          |"
    puts "----------------------------------------------------"
    print "resposta: "
    resposta = gets.chomp.to_i
    puts ""
    case resposta
    when 0 # sair
        puts ''
    when 1 # agendamento do petshop
        puts "---------------Agendar Consulta---------------"
        puts ""
        servico = 0
        print 'digite seu telefone(988247612):'
        telefone = gets.chomp
        print 'qual a data o senhor quer agendar(dd/mm/yyyy):'
        data = gets.chomp
        print 'qual horario ex.:(17):'
        hora = gets.chomp
        print 'qual servico o senhor deseja?(banho, tosa, banho e tosa):'
        servico_desejado = gets.chomp
        puts ""
        puts petshop.agendar(servico_desejado, data, hora, telefone)
        puts ""
    when 2 # listagem de agendamentos
        puts "----------------Agendamentos-----------------"
        puts ""
        agendamentos = petshop.agendamentos
        if agendamentos == "Não existe agendamentos"
            puts 'Não existe agendamentos'
        else
            soma = 1
            puts ""
            agendamentos.each do |agendamento|
                puts "--------AGENDAMENTO #{soma}--------"
                puts "|nome = #{agendamento["nome"]}"
                puts "|pet = #{agendamento["pet"]}"
                puts "|telefone = #{agendamento["telefone"]}"
                puts "|serviço = #{agendamento["descricao"]}"
                puts "|data = #{agendamento["ag_data"]}"
                puts "|hora = #{agendamento["hora"]}"
                puts "----------------------------"
                soma += 1
            end
        end
        puts ""
    when 3 # listagem dos agendamentos de uma data especifica
        puts "-------------Buscar Agendamentos--------------"
        puts ""
        print "digite a data:"
        data = gets.chomp
        agendamentos = petshop.agendamentos(data)
        if agendamentos == "Não existe agendamentos"
            puts 'Não existe agendamentos para esta data'
        else
            puts ""
            agendamentos.each do |agendamento|
                puts "--AGENDAMENTO DE #{agendamento["ag_data"]}--"
                puts "|nome = #{agendamento["nome"]}"
                puts "|pet = #{agendamento["pet"]}"
                puts "|telefone = #{agendamento["telefone"]}"
                puts "|serviço = #{agendamento["descricao"]}"
                puts "|hora = #{agendamento["hora"]}"
                puts "----------------------------"
            end
        end
        puts ""
    when 4 # listar os agendamentos apenas do dia atual
        time = Time.now
        dia = time.day
        mes = time.month
        ano = time.year
        data = "#{dia}/0#{mes}/#{ano}"
        agendamentos = petshop.agendamentos(data)
        if agendamentos == "Não existe agendamentos"
            puts 'Não existe agendamentos para hoje'
        else
            puts ""
            agendamentos.each do |agendamento|
                puts "---AGENDAMENTOS DE HOJE----"
                puts "|nome = #{agendamento["nome"]}"
                puts "|pet = #{agendamento["pet"]}"
                puts "|telefone = #{agendamento["telefone"]}"
                puts "|serviço = #{agendamento["descricao"]}"
                puts "|hora = #{agendamento["hora"]}"
                puts "----------------------------"
            end
        end
        puts ""
    when 5 # remover consulta por data e hora
        puts "--------------Remover Consulta----------------" 
        puts ""
        print "digite a data da consulta:"
        data = gets.chomp
        print "digite a hora da consulta:"
        hora = gets.chomp
        puts ''
        puts petshop.remover_agendamento(data, hora)
        puts ''
    when 6 # listagem de clientes
        puts "------------------Clientes--------------------"
        puts ""
        soma = 1
        clientes = petshop.clientes
        clientes.each do |cliente|
            puts "-----------CLIENTE #{soma}-----------"
            puts "|id = #{cliente["id_cliente"]}"
            puts "|nome = #{cliente["nome"]}"
            puts "|pet = #{cliente["pet"]}"
            puts "|data_nasc = #{cliente["data_nasc"]}"
            puts "|telefone = #{cliente["telefone"]}"
            puts "-------------------------------"
            soma += 1
        end
        puts ""
    when 7 # buscar cliente pelo telefone
        puts "---------------Bucar Cliente-----------------" 
        puts ""
        print "digite o telefone do cliente:"
        telefone = gets.chomp
        clientes = petshop.clientes(telefone)
        puts ""
        if clientes != 'Não existe Cliente com esse telefone'
            clientes.each do |cliente|
                puts "-----CLIENTE #{cliente["nome"]}------"
                puts "|id = #{cliente["id_cliente"]}"
                puts "|nome = #{cliente["nome"]}"
                puts "|pet = #{cliente["pet"]}"
                puts "|data_nasc = #{cliente["data_nasc"]}"
                puts "|telefone = #{cliente["telefone"]}"
                puts "--------------------------"
            end
        else
            puts 'Não existe Cliente com esse telefone'
        end
        puts ""
    when 8 # remover cliente pelo telefone
        puts "------------Remover Cliente--------------" 
        puts ""
        print "digite o telefone do cliente:"
        telefone = gets.chomp
        puts ''
        puts petshop.remover_cliente(telefone)
        puts ''
    when 9 # consultar saldo a receber
        puts "------------Saldo a Receber--------------" 
        puts ''
        puts "R$ #{petshop.saldo}"
        puts ''
    else
        puts 'Opcão inválida'
        puts ""
    end
    puts "deseja sair ou quer continuar?(1 - continuar / 2 - sair)"
    print "resposta: "
    continuar = gets.chomp
    if continuar == '2'
        interacao2 = false
    end
end
puts "\n-----------------Tenha um bom dia!--------------------\n\n"