require 'minitest/autorun'
require './app/Livro'
require './app/Livraria'

class Test_Livraria < Minitest::Test

    # expectativas de sucesso ->

    def test_livro_valido
        livro1 = Livro.new('O pequeno Principe', 40.00, 10)
        livro2 = Livro.new('Percy Jackson', 35.00, 10)

        assert_equal true, livro1.quantidade_valida?
        assert_equal true, livro1.nome_valido?
        assert_equal true, livro1.preco_valido?
        assert_equal true, livro1.livro_valido?
        assert_equal true, livro2.livro_valido?
    end

    # expectativas de falha ->

    def test_livro_invalido
        livro1 = Livro.new(123123, -120.00, -10)
        livro2 = Livro.new('Percy Jackson', -120.00, -123)

        assert_equal false, livro1.quantidade_valida?
        assert_equal false, livro1.nome_valido?
        assert_equal false, livro1.preco_valido?
        assert_equal false, livro1.livro_valido?
        assert_equal false, livro2.livro_valido?
    end

end