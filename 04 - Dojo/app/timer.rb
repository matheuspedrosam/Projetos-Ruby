class Timer
    def initialize(tempo)
        @tempo = tempo
    end
    def valida_tempo
        if @tempo < 3 || @tempo > 6
            'Tempo invalido. Tente tempo entre 3 e 6'
        end
    end

end