class GerenciarAluno

    def initialize(alunos = [])
        @alunos = alunos
    end

    def alunos
        @alunos
    end

    def cadastrar(aluno)
        if aluno.nome_valido? && aluno.matricula_valida?
            if @alunos.empty?
                @alunos << aluno
                return 'aluno cadastrado com sucesso!'
            else
                @alunos.each do |alunos_cadastrados|
                    if alunos_cadastrados.matricula == aluno.matricula
                        return 'Já existe um aluno com essa matrícula cadastrada'
                    else
                        @alunos << aluno
                        'aluno cadastrado com sucesso!'
                    end
                end
            end
        else
            return 'erro, cadastre um aluno com nome ou matricula valida!'
        end
    end

end