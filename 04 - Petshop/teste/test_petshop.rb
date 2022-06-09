require 'minitest/autorun'
require './app/cliente'
require './app/petshop'

class TestPetshop < Minitest::Test

    #expectativas de sucesso ->

    def test_validacao_cliente
        cliente1 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        
        assert_equal 'pitbull', cliente1.pet
        assert_equal true, cliente1.pet_valido?
    end

    def test_petshop_agendar_e_saldo_a_receber
        cliente1 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        cliente2 = Cliente.new('pedro', 'pointeringles', '12-09-2002', '(82) 9 88166281')
        cliente3 = Cliente.new('lucas', 'bulldog', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new


        assert_equal "agendamento concluido, o preco saira por R$ 20", petshop.agendar(cliente1, 'banho', '11/05', 9)
        assert_equal "agendamento concluido, o preco saira por R$ 25", petshop.agendar(cliente1, 'tosa', '12/05', 10)
        assert_equal "agendamento concluido, o preco saira por R$ 38.25", petshop.agendar(cliente1, 'banho e tosa', '13/05', 10)
        assert_equal 83.25, petshop.saldo_a_receber
        assert_equal 1, petshop.consultar_agendamentos_banho.size
        assert_equal 1, petshop.consultar_agendamentos_tosa.size
        assert_equal 1, petshop.consultar_agendamentos_banho_e_tosa.size
    end
    
    def test_petshop_mostrar_agendamentos
        cliente1 = Cliente.new('pedro', 'pintcher', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new
        petshop.agendar(cliente1, 'banho', '11/05', 9)


        assert_equal [{:cliente => 'pedro', :pet => 'pintcher', :opcao => 'banho', :data => '11/05', :hora => '9hrs', :valor => 20}], petshop.agendamentos
        assert_equal 20, petshop.saldo_a_receber
        assert_equal [{:cliente => 'pedro', :pet => 'pintcher', :opcao => 'banho', :data => '11/05', :hora => '9hrs', :valor => 20}], petshop.consultar_agendamentos_banho
        assert_equal 1, petshop.consultar_agendamentos_banho.size
    end

    def test_petshop_mostrar_agendamentos_com_mais_de_um_servico
        cliente1 = Cliente.new('pedro', 'pintcher', '12-09-2002', '(82) 9 88166281')
        cliente2 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new
        petshop.agendar(cliente1, 'banho', '11/05', 10)
        petshop.agendar(cliente2, 'banho e tosa', '14/05', 9)


        assert_equal [{:cliente => 'pedro', :pet => 'pintcher', :opcao => 'banho', :data => '11/05', :hora => '10hrs', :valor => 20},
            {:cliente => 'matheus', :pet => 'pitbull', :opcao => 'banho e tosa', :data => '14/05', :hora => '9hrs', :valor => 38.25}], petshop.agendamentos
        assert_equal 58.25, petshop.saldo_a_receber
    end

    def test_consulta_de_agendamentos_pelo_cliente_ou_pela_data
        cliente1 = Cliente.new('pedro', 'pintcher', '12-09-2002', '(82) 9 88166281')
        cliente2 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new
        petshop.agendar(cliente1, 'banho', '14/05', 10)
        petshop.agendar(cliente1, 'tosa', '14/05', 18)
        petshop.agendar(cliente2, 'tosa', '13/05', 14)
        petshop.agendar(cliente2, 'banho', '15/05', 16)


        assert_equal 2, petshop.consultar_agendamentos_pelo_cliente(cliente1).size
        assert_equal [{:cliente => 'matheus', :pet => 'pitbull', :opcao => 'tosa', :data => '13/05', :hora => '14hrs', :valor => 25}, {:cliente => 'matheus', :pet => 'pitbull', :opcao => 'banho', :data => '15/05', :hora => '16hrs', :valor => 20}], petshop.consultar_agendamentos_pelo_cliente(cliente2)

        assert_equal 2, petshop.consultar_agendamentos_pela_data('14/05').size
    end

    def test_consulta_de_agendamentos_data_de_hoje
        # vai dar falhar se testar em outro dia, pois tem que agendar alguem para o mesmo dia.
        cliente1 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        cliente2 = Cliente.new('pedro', 'pintcher', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new
        petshop.agendar(cliente2, 'banho e tosa', '20/05', 10) # estou testando nesse dia, (20/05/2022).
        petshop.agendar(cliente1, 'banho', '19/05', 11)

        assert_equal 1, petshop.consultar_agendamentos_pelo_cliente(cliente2).size
        assert_equal 2, petshop.agendamentos.size
        assert_equal 58.25, petshop.saldo_a_receber

        assert_equal [{:cliente => 'pedro', :pet => 'pintcher', :opcao => 'banho e tosa', :data => '20/05', :hora => '10hrs', :valor => 38.25}], petshop.consultar_agendamentos_pela_data
    end

    def test_remover_todos_agendamentos_do_cliente
        cliente1 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        cliente2 = Cliente.new('pedro', 'pintcher', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new
        petshop.agendar(cliente2, 'banho e tosa', '18/05', 10)
        petshop.agendar(cliente1, 'banho', '19/05', 10)
        petshop.agendar(cliente1, 'tosa', '17/05', 10)

        petshop.remover_agendamento(cliente1)  ## vai remover em todas as datas, caso nao passe a data

        assert_equal [{:cliente=>"pedro", :pet=>"pintcher", :opcao=>"banho e tosa", :data=>"18/05", :hora => '10hrs', :valor=>38.25}], petshop.agendamentos
    end

    def test_remover_apenas_os_agendamentos_do_cliente_em_uma_data_especifica ## LEMBRETE: colocar hora tambem!
        cliente1 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        cliente2 = Cliente.new('pedro', 'pintcher', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new
        petshop.agendar(cliente2, 'banho e tosa', '18/05', 10)
        petshop.agendar(cliente1, 'banho', '19/05', 11)
        petshop.agendar(cliente1, 'tosa', '17/05', 14)

        assert_equal 3, petshop.agendamentos.size

        petshop.remover_agendamento(cliente1, '19/05')

        assert_equal 2, petshop.agendamentos.size
    end

    def test_mostrar_de_forma_simplificada_os_agendamentos_do_dia
        cliente1 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        cliente2 = Cliente.new('pedro', 'pintcher', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new
        petshop.agendar(cliente1, 'banho', '20/05', 11)
        petshop.agendar(cliente2, 'banho e tosa', '23/05', 14)

        assert_equal [{:cliente => 'matheus', :opcao => 'banho', :hora => '11hrs'}], petshop.agendamentos_do_dia_resumidos
    end

    # # expectativas de falha ->

    def test_validacao_atributos_cliente
        cliente1 = Cliente.new('matheus123', '31241', '12-09-2002', '(82) 9 88166281')

        assert_equal false, cliente1.pet_valido?
        assert_equal false, cliente1.nome_valido?
    end

    def test_petshop_mostrar_agendamentos_com_pets_invalidos
        cliente1 = Cliente.new('matheus', '12312', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new


        assert_equal "cliente inválido", petshop.agendar(cliente1, 'banho', '11/05', 10)
        assert_equal 0, petshop.saldo_a_receber
        assert_equal [], petshop.agendamentos
    end

    def test_agendar_horas_iguais_na_mesma_data
        cliente1 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        cliente2 = Cliente.new('joao', 'pintcher', '12-09-2002', '(82) 9 88166281')
        cliente3 = Cliente.new('joaquim', 'papagaio', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new
        petshop.agendar(cliente1, 'banho', '11/05', 10)
        petshop.agendar(cliente2, 'tosa', '11/05', 10)
        petshop.agendar(cliente3, 'tosa', '12/05', 10)

        assert_equal [{:cliente=>"matheus", :pet=>"pitbull", :opcao=>"banho", :data=>"11/05", :hora => '10hrs', :valor=>20}, {:cliente=>"joaquim", :pet=>"papagaio", :opcao=>"tosa", :data=>"12/05", :hora => '10hrs', :valor=>25}], petshop.agendamentos
        
        assert_equal "Já existe um agendamento para esta hora!", petshop.agendar(cliente3, 'tosa', '11/05', 10)
        assert_equal 1, petshop.consultar_agendamentos_banho.size
        assert_equal 1, petshop.consultar_agendamentos_tosa.size
    end

    def test_agendar_ao_meio_dia
        cliente1 = Cliente.new('matheus', 'pitbull', '12-09-2002', '(82) 9 88166281')
        petshop = Petshop.new

        assert_equal "Horario de Almoço", petshop.agendar(cliente1, 'banho', '11/05', 12)
        assert_equal 0, petshop.agendamentos.size
    end
end