require 'yaml'

class SelecaoPilotoCopiloto

    def initialize
        @totalizador = 0
        @contador = 1
        @escolhido = nil
    end

    def selecionar(lista_alunos)
        if lista_alunos.size < 2
            return 'Necessario minimo 2 pessoas'
        else
            lista_alunos.each do |alunos|
                if alunos[:participacao] < @contador
                    @escolhido = alunos
                end
            end
            lista_alunos.each do |aluno|
                if aluno == @escolhido
                    lista_alunos.delete_at(lista_alunos.index(aluno))
                    variavel = @escolhido[:participacao] + 1
                    @escolhido[:participacao] = variavel
                    lista_alunos << @escolhido
                    break
                end
            end
            File.open('banco/alunos.yml', 'w') do |arq|
                arq.write(lista_alunos.to_yaml)
            end
            @totalizador += 1
            if @totalizador == lista_alunos.size
                @contador += 1
                @totalizador = 0
            end
            @escolhido[:nome]
        end
    end

end