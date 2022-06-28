require "minitest/autorun"
require '.\app\cliente.rb'
require '.\app\petshop.rb'

class TestPetshop < Minitest::Test

    def test_petshop
        db = SQLite3::Database.open './banco/banco_petshop.db'
        db.results_as_hash = true
        cliente = Cliente.new('matheus', 'pitbull', '12/09/2002', '988166281')
        petshop = Petshop.new
        
        # assert_equal 'cliente cadastrado com sucesso!', petshop.cadastrar_cliente(cliente)
        # assert_equal "agendamento concluido com sucesso!, o valor foi de R$ 20,00", petshop.agendar('banho', '26/07/2022', '988166281')

        # assert_equal [{"nome"=>"matheus", "pet"=>"pitbull", "telefone"=>"988166281", "descricao"=>"banho", "ag_data"=>"26/07/2022"}], petshop.agendamentos
        # resultado = db.execute 'select ag_data from agendamentos'
        # assert_equal [["26/07/2022"]], resultado
        resultado = db.execute 'select * from clientes where nome=?', 'matheus'
        assert_equal [], resultado
    end

end