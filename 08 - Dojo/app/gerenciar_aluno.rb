require 'sqlite3'

class GerenciarAluno

    def initialize
        @db = SQLite3::Database.open './banco/alunos.db'
        @db.results_as_hash = true
    end

    def alunos
        @db.execute 'select * from alunos'
    end

    def cadastrar(aluno)
        if aluno.aluno_valido?
            if alunos.empty?
                @db.execute 'insert into alunos (nome, matricula, qtd_participacao) values (?,?,?)', aluno.nome, aluno.matricula, aluno.qtd_participacao
                'aluno cadastrado com sucesso!'
            else
                alunos.each do |alunos_cadastrados|
                    if alunos_cadastrados["matricula"] == aluno.matricula
                       return 'Já existe um aluno com essa matrícula cadastrada'
                    end
                end
                @db.execute 'insert into alunos (nome, matricula, qtd_participacao) values (?,?,?)', aluno.nome, aluno.matricula, aluno.qtd_participacao
                'aluno cadastrado com sucesso!'
            end
        else
            'erro, cadastre um aluno com nome ou matricula valida!'
        end
    end

    def consultar_participacao(matricula)
        participacao = 0
        alunos.each do |aluno|
            if aluno["matricula"] == matricula
                participacao = aluno["qtd_participacao"]
            end
        end
        participacao
    end

end