require 'minitest/autorun'
require './app/aluno'
require './app/selecao_piloto_copiloto'

class TestSelecalPilotoCopiloto < Minitest::Test

  def test_selecionar_quando_a_lista_for_menor_que_dois
    joao = Aluno.new('Joao', '123')
    lista_alunos = [joao]
    selecao_piloto_copiloto = SelecaoPilotoCopiloto.new(lista_alunos)
    assert_equal 'Necessario minimo 2 pessoas', selecao_piloto_copiloto.selecionar
  end

  def test_selecionar_quando_a_lista_for_igual_a_dois
    ze = Aluno.new('Ze', '123')
    joao = Aluno.new('Joao', '223')
    lista_alunos = [ze, joao]
    selecao_piloto_copiloto = SelecaoPilotoCopiloto.new(lista_alunos)

    assert_equal 'Joao', selecao_piloto_copiloto.selecionar
    assert_equal 'Ze', selecao_piloto_copiloto.selecionar
  end

  def test_selecionar_quando_a_lista_for_maior_que_dois
    ze = Aluno.new('Ze', '123')
    joao = Aluno.new('Joao', '223')
    maria = Aluno.new('Maria', '225')
    lista_alunos = [ze, joao, maria]
    selecao_piloto_copiloto = SelecaoPilotoCopiloto.new(lista_alunos)

    assert_equal 'Maria', selecao_piloto_copiloto.selecionar
    assert_equal 'Joao', selecao_piloto_copiloto.selecionar
    assert_equal 'Ze', selecao_piloto_copiloto.selecionar
    assert_equal 1, ze.qtd_participacao
    assert_equal 1, joao.qtd_participacao
    assert_equal 1, maria.qtd_participacao
  end

  def test_selecionar_quando_todo_mundo_ja_tiver_jogado_uma_vez
    ze = Aluno.new('Ze', '123')
    joao = Aluno.new('Joao', '223')
    maria = Aluno.new('Maria', '225')
    lista_alunos = [ze, joao, maria]
    selecao_piloto_copiloto = SelecaoPilotoCopiloto.new(lista_alunos)

    assert_equal 'Maria', selecao_piloto_copiloto.selecionar
    assert_equal 'Joao', selecao_piloto_copiloto.selecionar
    assert_equal 'Ze', selecao_piloto_copiloto.selecionar
    assert_equal 'Maria', selecao_piloto_copiloto.selecionar
    assert_equal 'Joao', selecao_piloto_copiloto.selecionar
    assert_equal 'Ze', selecao_piloto_copiloto.selecionar
    assert_equal 2, ze.qtd_participacao
    assert_equal 2, joao.qtd_participacao
    assert_equal 2, maria.qtd_participacao
  end
end