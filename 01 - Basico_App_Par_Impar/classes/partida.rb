class Partida

    def initialize(jogador1, jogador2)
        @jogador1 = jogador1
        @jogador2 = jogador2
    end

    def validacao1

        if (@jogador1.impopar) == (@jogador2.impopar)
            return 'erro'
        else
            return 'tudo tranquilo'
        end

    end

    def validacao2

        if @jogador1.impopar == 'par' || @jogador1.impopar == 'impar'
            if @jogador2.impopar == 'par' || @jogador2.impopar == 'impar'
            return 'tudo tranquilo'
            end
        else
            return 'erro'
        end

    end

    def resultado

        resultado = (@jogador1.valor) + (@jogador2.valor)

        if resultado % 2 == 0
            if @jogador1.impopar == "par"
                puts "#{@jogador1.nome} ganhou parabéns"
            else
                puts "#{@jogador2.nome} ganhou parabéns"
            end
        else
            if @jogador1.impopar == "impar"
                puts "#{@jogador1.nome} ganhou parabéns"
            else
                puts "#{@jogador2.nome} ganhou parabéns"
            end 
        end

    end

end