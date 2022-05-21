require 'minitest/autorun'
require './app/aluno'
require './app/selecao_piloto_copiloto'

class TestSelecalPilotoCopiloto < Minitest::Test

  def test_selecionar_quando_a_lista_for_menor_que_dois

    joao = Aluno.new('joao', '212345871')
    lista_alunos = [joao]
    selecao_piloto_copiloto = SelecaoPilotoCopiloto.new(lista_alunos)

    assert_equal 'Necessario minimo 2 pessoas', selecao_piloto_copiloto.selecionar
  end

  # def test_selecionar_quando_a_lista_for_igual_a_dois

  #   ze = Aluno.new('Ze', '1234123')
  #   joao = Aluno.new('Joao', '453133')
  #   lista_alunos = [ze, joao]
  #   selecao_piloto_copiloto = SelecaoPilotoCopiloto.new(lista_alunos)

  #   assert_equal 'Joao', selecao_piloto_copiloto.selecionar
  # end

  # def test_selecionar_quando_a_lista_for_maior_que_dois

  #   ze = Aluno.new('Ze', '1234123')
  #   joao = Aluno.new('Joao', '453133')
  #   maria = Aluno.new('Maria', '1234123')
  #   pedro = Aluno.new('Pedro', '123411423')

  #   lista_alunos = [ze, joao, maria, pedro]

  #   selecao_piloto_copiloto = SelecaoPilotoCopiloto.new(lista_alunos)

  #   assert_equal 'Pedro', selecao_piloto_copiloto.selecionar
  # end

  # def test_selecionar_com_quantidades_de_participacao_diferente

  #   ze = Aluno.new('Ze', '1234123')
  #   joao = Aluno.new('Joao', '453133')
  #   maria = Aluno.new('Maria', '1234123', 2)
  #   pedro = Aluno.new('Pedro', '123411423', 2)

  #   lista_alunos = [ze, joao, maria, pedro]

  #   selecao_piloto_copiloto = SelecaoPilotoCopiloto.new(lista_alunos)

  #   assert_equal 'Joao', selecao_piloto_copiloto.selecionar
  # end

  def test_todo_mundo_selecionado
    ze = Aluno.new('Ze', '1234123')
    joao = Aluno.new('Joao', '453133')
    maria = Aluno.new('Maria', '1234123')
    pedro = Aluno.new('Pedro', '123411423')

    lista_alunos = [ze, joao, maria, pedro]
    selecao_piloto_copiloto = SelecaoPilotoCopiloto.new(lista_alunos)

    selecao_piloto_copiloto.selecionar
    selecao_piloto_copiloto.selecionar
    selecao_piloto_copiloto.selecionar
    selecao_piloto_copiloto.selecionar

    assert_equal 'Pedro', selecao_piloto_copiloto.selecionar
    assert_equal 1, pedro.qtd_participacao
  end

end