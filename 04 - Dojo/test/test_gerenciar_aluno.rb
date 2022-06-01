require 'minitest/autorun'
require './app/aluno'
require './app/gerenciar_aluno'

class TestGerenciarAluno < Minitest::Test

    def test_cadastrar_quando_passa_aluno_valido

     joao = Aluno.new('joao', '00005')
     gerenciar_aluno = GerenciarAluno.new

     assert_equal 'aluno cadastrado com sucesso!', gerenciar_aluno.cadastrar(joao)
     assert_equal [joao], gerenciar_aluno.alunos

   end

   def test_cadastrar_quando_passa_aluno_invalido

    joao = Aluno.new('joao123', 'mat1234')
    gerenciar_aluno = GerenciarAluno.new

    assert_equal 'erro, cadastre um aluno com nome ou matricula valida!', gerenciar_aluno.cadastrar(joao)
    assert_equal [], gerenciar_aluno.alunos

   end

   def test_cadastrar_quando_passa_aluno_com_matricula_existente_no_banco

    joao = Aluno.new('joao', '1234')
    matheus = Aluno.new('matheus', '12431')
    carlos = Aluno.new('carlos', '1234')
    gerenciar_aluno = GerenciarAluno.new([joao, matheus])

    assert_equal 'Já existe um aluno com essa matrícula cadastrada', gerenciar_aluno.cadastrar(carlos)
    assert_equal [joao, matheus], gerenciar_aluno.alunos

   end

   def test_mostrar_alunos_cadastrados

      ze = Aluno.new('ze', '12124')
      maria = Aluno.new('maria', '243513')
      gerenciar_aluno = GerenciarAluno.new
      
      gerenciar_aluno.cadastrar(ze)
      gerenciar_aluno.cadastrar(maria)

     assert_equal [ze, maria], gerenciar_aluno.alunos()
   end

end