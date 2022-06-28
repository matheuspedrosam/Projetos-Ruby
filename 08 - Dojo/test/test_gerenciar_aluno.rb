require 'minitest/autorun'
require './app/aluno'
require './app/gerenciar_aluno'

class TestGerenciarAluno < Minitest::Test

    def test_cadastrar_quando_passa_aluno_valido
      # matheus = Aluno.new('matheus', '00006')
      # joao = Aluno.new('joao', '00009')
      joao = Aluno.new('joao', '001')
      matheus = Aluno.new('matheus', '002')
      carlos = Aluno.new('carlos', '003')
      gerenciar_aluno = GerenciarAluno.new
      gerenciar_aluno.cadastrar(joao)
      gerenciar_aluno.cadastrar(matheus)
      gerenciar_aluno.cadastrar(carlos)

      # assert_equal 'aluno cadastrado com sucesso!', gerenciar_aluno.cadastrar(joao)
      # assert_equal 2, gerenciar_aluno.alunos.size
   end

   # def test_cadastrar_quando_passa_aluno_invalido
   #  joao = Aluno.new('joao123', 'mat1234')
   #  matheus = Aluno.new('matheus', '00007')
   #  gerenciar_aluno = GerenciarAluno.new
   #  gerenciar_aluno.cadastrar(matheus)

   #  assert_equal 'erro, cadastre um aluno com nome ou matricula valida!', gerenciar_aluno.cadastrar(joao)
   #  assert_equal 3, gerenciar_aluno.alunos.size
   # end

   # def test_cadastrar_quando_passa_aluno_com_matricula_existente_no_banco
   # carlos = Aluno.new('carlos', '00006')
   #  gerenciar_aluno = GerenciarAluno.new

   # assert_equal 'Já existe um aluno com essa matrícula cadastrada', gerenciar_aluno.cadastrar(carlos)
   #  assert_equal 3, gerenciar_aluno.alunos.size
   # end

   # def test_mostrar_alunos_cadastrados
   #    ze = Aluno.new('ze', '12124')
   #    maria = Aluno.new('maria', '243513')
   #    gerenciar_aluno = GerenciarAluno.new
   #    gerenciar_aluno.cadastrar(ze)
   #    gerenciar_aluno.cadastrar(maria)

   #    assert_equal [{"id"=>1, "nome"=>"matheus", "matricula"=>"00006", "qtd_participacao"=>0}, {"id"=>2, "nome"=>"joao", "matricula"=>"00009", "qtd_participacao"=>0}, {"id"=>3, "nome"=>"matheus", "matricula"=>"00007", "qtd_participacao"=>0}, {"id"=>5, "nome"=>"ze", "matricula"=>"12124", "qtd_participacao"=>0}, {"id"=>6, "nome"=>"maria", "matricula"=>"243513", "qtd_participacao"=>0}], gerenciar_aluno.alunos
   # end

end