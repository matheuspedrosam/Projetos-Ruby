class SelecaoPilotoCopiloto

    def initialize(lista_alunos)
        @lista_alunos = lista_alunos
    end

    def selecionar
        if @lista_alunos.size < 2
            return 'Necessario minimo 2 pessoas'
        else
            @escolhido = 0
            @lista_escolhidos = []
            @contador = 1
            if @lista_escolhidos.size == @lista_alunos.size
                @contador += 1
                @lista_escolhidos = []
            else
                @lista_alunos.each do |alunos|
                    if alunos.qtd_participacao < @contador
                        @escolhido = alunos
                    end
                end
                @escolhido.add_participacao
                @lista_escolhidos << @escolhido
            end
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