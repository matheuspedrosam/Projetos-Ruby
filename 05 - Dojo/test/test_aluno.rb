require 'minitest/autorun'
require 'C:\Users\Matheus\Documents\RUBY ESTUDOS\Projetos em Ruby\05 - Dojo\app\aluno.rb'

class TestAluno < Minitest::Test

  def test_nome_valido_quando_passa_so_letras
     aluno = Aluno.new('joao', '02')

     assert_equal true, aluno.nome_valido?()
   end

  def test_nome_valido_quando_passa_so_letras_e_numeros
     aluno = Aluno.new('matheus0065', '02')

     assert_equal false, aluno.nome_valido?()
  end

  def test_matricula_valida_quando_passa_letras_e_numeros
  
      aluno = Aluno.new('matheus', 'Matheus05123')
  
      assert_equal false, aluno.matricula_valida?()
  end

   def test_matricula_valida_quando_passa_so_numeros

      aluno = Aluno.new('matheus', '9988880')

      assert_equal true, aluno.matricula_valida?()
   end
end