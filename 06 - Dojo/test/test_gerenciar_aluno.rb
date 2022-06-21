require 'minitest/autorun'
require './app/aluno'
require './app/gerenciar_aluno'

class TestGerenciarAluno < Minitest::Test

    def test_cadastrar_quando_passa_aluno_valido
      matheus = Aluno.new('matheus', '00006')
      joao = Aluno.new('joao', '00009')
      gerenciar_aluno = GerenciarAluno.new
      gerenciar_aluno.cadastrar(matheus)

      assert_equal 'aluno cadastrado com sucesso!', gerenciar_aluno.cadastrar(joao)
      assert_equal 2, gerenciar_aluno.alunos.size
   end

   def test_cadastrar_quando_passa_aluno_invalido
    joao = Aluno.new('joao123', 'mat1234')
    matheus = Aluno.new('matheus', '00007')
    gerenciar_aluno = GerenciarAluno.new
    gerenciar_aluno.cadastrar(matheus)

    assert_equal 'erro, cadastre um aluno com nome ou matricula valida!', gerenciar_aluno.cadastrar(joao)
    assert_equal 1, gerenciar_aluno.alunos.size

   end

   def test_cadastrar_quando_passa_aluno_com_matricula_existente_no_banco
    pedro = Aluno.new('pedro', '00005')
    carlos = Aluno.new('carlos', '00005')
    gerenciar_aluno = GerenciarAluno.new
    gerenciar_aluno.cadastrar(pedro)

    assert_equal 'Já existe um aluno com essa matrícula cadastrada', gerenciar_aluno.cadastrar(carlos)
    assert_equal 1, gerenciar_aluno.alunos.size

   end

   def test_mostrar_alunos_cadastrados
      ze = Aluno.new('ze', '12124')
      maria = Aluno.new('maria', '243513')
      gerenciar_aluno = GerenciarAluno.new
      gerenciar_aluno.cadastrar(ze)
      gerenciar_aluno.cadastrar(maria)

      assert_equal [{:nome=>"ze", :matricula=>"12124", :participacao=>0}, {:nome=>"maria", :matricula=>"243513", :participacao=>0}], gerenciar_aluno.alunos
   end

end