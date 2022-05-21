require 'minitest/autorun'
require './app/Livro'
require './app/Livraria'

class Test_Livraria < Minitest::Test

    # expectativas de sucesso ->

    def test_livraria_estoque_passando_livros_validos
        pequeno_principe = Livro.new('O pequeno Principe', 160.00, 5)
        percy_jackson = Livro.new('Percy Jackson', 120.00, 10)
        livraria = Livraria.new
        livraria.cadastrar([pequeno_principe, percy_jackson])

        assert_equal [pequeno_principe, percy_jackson], livraria.estoque
    end

    def test_adicionar_livro
        pequeno_principe = Livro.new('O pequeno Principe', 40.00, 10)
        percy_jackson = Livro.new('Percy Jackson', 40.00, 120)
        livraria = Livraria.new
        livraria.cadastrar([pequeno_principe, percy_jackson])
        livraria.adicionar(pequeno_principe)

        assert_equal 11, pequeno_principe.quantidade
        assert_equal 131, livraria.estoque_total
    end

    def test_livraria_estoque_retornando_os_nomes_dos_livros
        pequeno_principe = Livro.new('O pequeno Principe', 200.00, 20)
        percy_jackson = Livro.new('Percy Jackson', 180.00, 15)
        livraria = Livraria.new
        livraria.cadastrar([pequeno_principe, percy_jackson])

        assert_equal ['O pequeno Principe', 'Percy Jackson'], livraria.estoque_nome
    end

    def test_retornar_a_quantidade_de_livros
        pequeno_principe = Livro.new('O pequeno Principe', 200.00, 14)
        percy_jackson = Livro.new('Percy Jackson', 120.00, 20)
        livraria = Livraria.new
        livraria.cadastrar([pequeno_principe, percy_jackson])

        assert_equal 14, livraria.quantidade_de_livros(pequeno_principe)
        assert_equal 20, livraria.quantidade_de_livros(percy_jackson)
        assert_equal 34, livraria.estoque_total
    end

    # expectativas de falhas ->

    def test_livraria_cadastrando_livro_invalido
        pequeno_principe = Livro.new('O pequeno Principe', 'asdfasdf', '123')
        percy_jackson = Livro.new('Percy Jackson', 'asdfad', '123')
        livraria = Livraria.new
        livraria.cadastrar([pequeno_principe, percy_jackson])

        assert_equal [], livraria.estoque
        assert_equal [], livraria.estoque_nome
        assert_equal 0, livraria.estoque_total
    end

end