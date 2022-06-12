class SelecaoPilotoCopiloto

    def initialize(lista_alunos)
        @lista_alunos = lista_alunos
        @totalizador = 0
        @contador = 1
        @comparador = @lista_alunos.size
        @escolhido = nil
    end

    def selecionar
        if @lista_alunos.size < 2
            return 'Necessario minimo 2 pessoas'
        else
            @lista_alunos.each do |alunos|
                if alunos[:participacao] < @contador
                    @escolhido = alunos
                end
            end
            @lista_alunos.each do |aluno|
                if aluno == @escolhido
                    @lista_alunos.delete_at(@lista_alunos.index(aluno))
                    variavel = @escolhido[:participacao]
                    variavel += 1
                    @escolhido[:participacao] = variavel
                    @lista_alunos << @escolhido
                    break
                end
            end
            File.open('banco/alunos.yml', 'w') do |arq|
                arq.write(@lista_alunos.to_yaml)
            end
            @totalizador += 1
            if @totalizador == @comparador
                @contador += 1
                @totalizador = 0
            end
            @escolhido[:nome]
        end
    end

end