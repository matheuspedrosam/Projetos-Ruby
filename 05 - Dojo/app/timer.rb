class Timer
    def initialize(tempo)
        @tempo = tempo
    end

    def tempo
        @tempo
    end

    def valida_tempo
        if @tempo < 3 || @tempo > 6
            'Tempo invalido. Tente tempo entre 3 e 6'
        else
            true
        end
    end

    def iniciar
        if valida_tempo == true
            segundos = tempo*60
            while segundos > 0
                puts "faltam #{segundos} segundos"
                segundos -= 1
                sleep 1
            end
            "Seu Tempo Acabou!"
        end
    end
end