require 'minitest/autorun'
require './app/Livro'
require './app/Livraria'

class Test_Livraria < Minitest::Test

    def test_livraria_vender_livro
        pequeno_principe = Livro.new('O pequeno Principe', 40.00, 10)
        percy_jackson = Livro.new('Percy Jackson', 40.00, 120)
        livraria = Livraria.new
        livraria.cadastrar([pequeno_principe, percy_jackson])
        livraria.vender(pequeno_principe)

        assert_equal 9, pequeno_principe.quantidade
        assert_equal 40, livraria.saldo
    end

end