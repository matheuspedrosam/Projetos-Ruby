require 'yaml'

class GerenciarAluno

    def initialize
        @alunos = []
    end

    def alunos
        arq = File.read('banco/alunos.yml')
        arq_alunos = YAML.load(arq)
        arq_alunos
    end

    def cadastrar(aluno)
        if aluno.aluno_valido?
            if alunos == nil
                hash = {nome: aluno.nome, matricula: aluno.matricula, participacao: aluno.qtd_participacao}
                @alunos << hash
                File.open('banco/alunos.yml', 'w') do |arq|
                    arq.write(@alunos.to_yaml)
                end
                'aluno cadastrado com sucesso!'
            else
                alunos.each do |alunos_cadastrados|
                    if alunos_cadastrados[:matricula] == aluno.matricula
                        return 'Já existe um aluno com essa matrícula cadastrada'
                    end
                end
                hash = {nome: aluno.nome, matricula: aluno.matricula, participacao: aluno.qtd_participacao}
                @alunos << hash
                File.open('banco/alunos.yml', 'w') do |arq|
                    arq.write(@alunos.to_yaml)
                end
                'aluno cadastrado com sucesso!'
            end
        else
            'erro, cadastre um aluno com nome ou matricula valida!'
        end
    end

    def consultar_participacao(matricula)
        participacao = 0
        alunos.each do |aluno|
            if aluno[:matricula] == matricula
                participacao = aluno[:participacao]
            end
        end
        participacao
    end

end