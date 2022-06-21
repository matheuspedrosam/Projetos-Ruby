require '.\app\cliente.rb'
require '.\app\petshop.rb'
require 'sqlite3'

db = SQLite3::Database.open './banco_petshop.db'
db.results_as_hash = true
petshop = Petshop.new
interacao = true
puts ""
puts "------------------------MENU------------------------"
puts "-------------------SEJA BEM VINDO-------------------\n\n"


while interacao == true
    puts "----------------------------------------------------"
    puts "|              O quê deseja fazer?                 |"
    puts "|                                                  |"
    puts "|0 - sair do programa                              |"
    puts "|1 - cadastrar cliente                             |"
    puts "|2 - agendar consulta                              |"
    puts "|3 - listar consultas                              |"
    puts "|4 - lista clientes cadastrados                    |"
    puts "|5 - filtrar consulta (por data)                   |"
    puts "|6 - buscar cliente (por telefone)                 |"
    puts "|7 - remover cliente (por telefone)                |"
    puts "|8 - remover consulta (por data)                   |"
    puts "----------------------------------------------------"
    print "resposta: "
    resposta = gets.chomp.to_i
    puts ""
    case resposta
    when 0
        puts ''
    when 1 # cadastro de clientes
        puts "-------------Cadastro de Clientes-------------"
        puts ""
        print 'nome:'
        nome = gets.chomp
        print 'pet:'
        pet = gets.chomp
        print 'data_nasc(dd/mm/yyyy):'
        data_nasc = gets.chomp
        print 'telefone(988247612):'
        telefone = gets.chomp
        cliente = Cliente.new(nome, pet, data_nasc, telefone)
        puts ''
        puts petshop.cadastrar_cliente(cliente)
        puts ""
    when 2 # agendamento do petshop
        puts "---------------Agendar Consulta---------------"
        puts ""
        servico = 0
        print 'digite seu telefone(988247612):'
        telefone = gets.chomp
        print 'qual a data o senhor quer agendar(dd/mm/yyyy):'
        data = gets.chomp
        print 'qual servico o senhor deseja?(banho, tosa, banho e tosa):'
        servico_desejado = gets.chomp
        puts petshop.agendar(servico_desejado, data, telefone)
        puts ""
    when 3 # listagem de agendamentos
        puts "----------------Agendamentos-----------------"
        puts ""
        agendamentos = petshop.agendamentos
        if agendamentos == "Não existe agendamentos"
            puts 'Não existe agendamentos para esta data'
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
                puts "----------------------------"
                soma += 1
            end
        end
        puts ""
    when 4 # listagem de clientes
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
    when 5
        puts "-------------Buscar Agendamentos--------------"
        puts ""
        print "digite a data:"
        data = gets.chomp
        agendamentos = petshop.agendamentos(data)
        if agendamentos == "Não existe agendamentos"
            puts 'Não existe agendamentos'
        else
            puts ""
            agendamentos.each do |agendamento|
                puts "--AGENDAMENTO DE #{agendamento["ag_data"]}--"
                puts "|nome = #{agendamento["nome"]}"
                puts "|pet = #{agendamento["pet"]}"
                puts "|telefone = #{agendamento["telefone"]}"
                puts "|serviço = #{agendamento["descricao"]}"
                puts "|data = #{agendamento["ag_data"]}"
                puts "----------------------------"
            end
        end
        puts ""
    when 6
        puts "-------------Bucar Cliente---------------" 
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
    when 7
        puts "------------Remover Cliente--------------" 
        puts ""
        print "digite o telefone do cliente:"
        telefone = gets.chomp
        puts ''
        puts petshop.remover_cliente(telefone)
        puts ''
    when 8
        puts "------------Remover Consulta--------------" 
        puts ""
        print "digite a data da consulta:"
        data = gets.chomp
        puts ''
        puts petshop.remover_agendamento(data)
        puts ''
    else
        'opcão inválida'
        puts ""
    end
    puts "deseja sair ou quer continuar?(1 - continuar / 2 - sair)"
    print "resposta: "
    continuar = gets.chomp
    if continuar == '2'
        interacao = false
    end
end
puts "\n-----------------Tenha um bom dia!--------------------\n\n"