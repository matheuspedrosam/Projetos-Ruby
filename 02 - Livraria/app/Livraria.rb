class Livraria

    def initialize
        @saldo = 0
    end

    def cadastrar(livros)
        @livros = []
        livros.each do |livros|
            if livros.livro_valido?
                @livros << livros
            end
        end
    end

    def adicionar(livro)
        livro.aumentar_quantidade
    end

    def estoque
        @livros
    end

    def estoque_total
        soma = 0
        @livros.each do |livro|
            soma += livro.quantidade
        end
        soma
    end

    def estoque_nome
        @estoque_nome = []
        @livros.each do |nome_livros|
            @estoque_nome << nome_livros.nome
        end
        @estoque_nome
    end

    def quantidade_de_livros(livro)
        livro.quantidade
    end

    def saldo
        @saldo
    end

    def vender(livro)
        @saldo += livro.preco
        livro.diminuir_quantidade
    end
end