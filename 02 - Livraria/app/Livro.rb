class Livro

    def initialize(nome, preco, quantidade)
        @nome = nome
        @preco = preco
        @quantidade = quantidade
    end

    def nome
        @nome
    end

    def nome_valido?
        nome.is_a? String
    end

    def preco
        @preco
    end

    def preco_valido?
        if preco.is_a? Float
            if preco > 0
                true
            else
                false
            end
        end
    end

    def quantidade
        @quantidade
    end

    def quantidade_valida?
        if quantidade.is_a? Integer
            if quantidade > 0
                true
            else
                false
            end
        end
    end  

    def diminuir_quantidade
        @quantidade -= 1
    end

    def aumentar_quantidade
        @quantidade += 1
    end

    def livro_valido?
        if nome_valido? && quantidade_valida? && preco_valido?
            true
        else
            false
        end
    end

end