class Conferencia

    def initialize
        @arquivo = File.read('.\proposals.txt')
        @arquivo_organizado = []
        @valores = []
    end

    def organizar
        arquivo = @arquivo.split("\n")
        arquivo.each do |linhas|
           tempo = /\d\d/.match(linhas)
           linha_e_tempo = {descricao: linhas, tempo: tempo[0].to_i}
           @arquivo_organizado << linha_e_tempo
        end
        @arquivo_organizado
    end

    def selecionar
        soma = 60 #começa com 60 porque já sabemos que existe a hora do almoço
        tempos = []
        @arquivo_organizado.each do |hashs|
            tempos << hashs[:tempo]
        end
        while soma < 480 #equivalente a um tracking de 8h
            tempo_aleatorio = tempos.sample
            tempos.delete_at(tempos.index(tempo_aleatorio))
            soma += tempo_aleatorio
            @valores << tempo_aleatorio
            if soma > 480
                soma = 60
                @valores = []
                @arquivo_organizado.each do |hashs|
                    tempos << hashs[:tempo]
                end
            end
        end
        @valores
    end

    def resultado_final
        resultado_a = []
        resultado_b = @arquivo_organizado
        @arquivo_organizado.each do |hash|
            for i in 0..@valores.size - 1
                if hash[:tempo] == @valores[i]
                    resultado_a << hash
                    @valores.delete_at(@valores.index(@valores[i]))
                    resultado_b.delete_at(resultado_b.index(hash))
                    break
                end
            end
        end
        track_a_and_track_b = []
        track_a_and_track_b << resultado_a
        track_a_and_track_b << resultado_b
        track_a_and_track_b
    end

end