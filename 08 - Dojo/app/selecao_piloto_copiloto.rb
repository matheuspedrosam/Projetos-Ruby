require 'sqlite3'

class SelecaoPilotoCopiloto

    def initialize
        @totalizador = 0
        @escolhido = nil
        @db = SQLite3::Database.open './banco/alunos.db'
        @db.results_as_hash = true
    end

    def selecionar(lista_alunos)
        @contador = @db.execute 'select * from contador'
        totalizador = 0
        lista_alunos.each do |aluno|
            if aluno["qtd_participacao"] == @contador[0]["contador"]
                totalizador += 1
            end
        end
        if totalizador == lista_alunos.size
            variavel = @contador[0]["contador"] + 1
            @db.execute 'update contador set contador=?', variavel
            @totalizador = 0
        end

        if lista_alunos.size < 2
            return 'Necessario minimo 2 pessoas'
        else # seleção
            @contador = @db.execute 'select * from contador'
            lista_alunos.each do |alunos|
                if alunos["qtd_participacao"] < @contador[0]["contador"]
                    @escolhido = alunos
                end
            end
            lista_alunos.each do |aluno|
                if aluno == @escolhido
                    #lista_alunos.delete_at(lista_alunos.index(aluno))
                    variavel = @escolhido["qtd_participacao"] + 1
                    id_aluno = @escolhido["id"]
                    @db.execute 'update alunos set qtd_participacao=? where id=?', variavel, id_aluno
                    break
                end
            end
            @escolhido["nome"]
        end
    end

end