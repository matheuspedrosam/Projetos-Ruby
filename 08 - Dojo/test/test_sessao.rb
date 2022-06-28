require 'minitest/autorun'
require '.\app\aluno.rb'
require '.\app\sessao.rb'

class TestSessao < Minitest::Test

    def test_selecao_piloto_e_copiloto
      joao = Aluno.new('joao', '001')
      matheus = Aluno.new('matheus', '002')
      carlos = Aluno.new('carlos', '003')
  
      alunos_presentes = [joao, matheus, carlos]
  
      sessao = Sessao.new(alunos_presentes)
  
      message_selecao = sessao.selecionar_piloto_e_co_piloto
      assert_equal 'Próximo Piloto e Co-piloto respectivamente: joao e matheus.', message_selecao
  
      # message_selecao = sessao.selecionar_piloto_e_co_piloto
      # assert_equal 'Próximo Piloto e Co-piloto respectivamente: matheus e carlos.', message_selecao
  
      # message_selecao = sessao.selecionar_piloto_e_co_piloto
      # assert_equal 'Próximo Piloto e Co-piloto respectivamente: carlos e joao.', message_selecao
    end
  
    def test_selecao_start
      skip 'test demora três minutos para executar - remover skip só quando quiser testar'
  
      joao = Aluno.new('joao', '001')
      matheus = Aluno.new('matheus', '002')
      carlos = Aluno.new('carlos', '003')
  
      carlos.soma_participacoes
  
      alunos_presentes = [joao, matheus, carlos]
  
      sessao = Sessao.new(alunos_presentes)
  
      assert_equal 'O tempo acabou!', sessao.iniciar
    end
  end