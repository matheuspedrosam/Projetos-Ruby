require "minitest/autorun"
require './desafioMercado/app/cliente.rb'
require './desafioMercado/app/mercadinho.rb'
require 'yaml'

class TestMercado < Minitest::Test
    def test_mercadinho
        joao = Cliente.new("Joao")
        maria = Cliente.new("Maria")
        mercado = Mercado.new
        mercado.vender(joao, "morango")
        mercado.vender(joao, "morango")
        mercado.vender(joao, "limao")
        mercado.vender(joao, "goiaba")
        mercado.vender(maria, "maçã verde")
        mercado.vender(maria, "tangerina")
        mercado.vender(maria, "tangerina")

        assert_equal 18, mercado.estoque.size
        assert_equal 3, mercado.saldo
        assert_equal 2, mercado.vendas_morango.size
        assert_equal 1, mercado.vendas_limao.size
        assert_equal 1, mercado.vendas_goiaba.size
        assert_equal 1, mercado.vendas_maca_verde.size
        assert_equal 2, mercado.vendas_tangerina.size
        assert_equal 7, mercado.vendas.size
    end
end