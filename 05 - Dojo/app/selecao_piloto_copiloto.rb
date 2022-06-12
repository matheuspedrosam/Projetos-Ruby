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


    # ## Selecionar Piloto e Copiloto
    # Função que recebe uma lista não vazia de alunos e dentre eles faz uma seleção de piloto e copiloto, priorizando os que tiverem menos participações, que farão parte do DOJO, em que após eles realizarem suas funções poderão voltar para a lista e novamente participar.

    # ### Requisitos Obrigatórios**
    
    # - Recebe Lista Alunos (Nome e Quantidade participação)
    # - Filtrar para chamar primeiro quem tem menos participação
    # - Selecionar PILOTO primeiro. Caso não haja um prévio copiloto, selecionar da lista filtrada
    # - Copiloto em seguida, selecionado da lista filtrada
    # - Piloto só é chamado da lista na primeira vez de cada sessão, nas seguintes, o copiloto vira piloto
    # - Terá que ter alunos, pelo menos 2 cadastrados, caso tenha menos não pode escolher, deverá ser informado uma mensagem de erro.