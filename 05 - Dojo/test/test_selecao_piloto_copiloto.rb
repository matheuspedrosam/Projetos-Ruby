require 'minitest/autorun'
require '.\app\aluno.rb'
require '.\app\gerenciar_aluno.rb'
require '.\app\selecao_piloto_copiloto.rb'

class TestSelecalPilotoCopiloto < Minitest::Test

  def test_selecionar_quando_a_lista_for_menor_que_dois
    joao = Aluno.new('Joao', '123')
    ga = GerenciarAluno.new
    ga.cadastrar(joao)
    lista_alunos = ga.alunos
    selecao_piloto_copiloto = SelecaoPilotoCopiloto.new
    assert_equal 'Necessario minimo 2 pessoas', selecao_piloto_copiloto.selecionar(lista_alunos)
  end

  def test_selecionar_quando_a_lista_for_igual_a_dois
    ze = Aluno.new('Ze', '1234')
    joao = Aluno.new('Joao', '223')
    ga = GerenciarAluno.new
    ga.cadastrar(ze)
    ga.cadastrar(joao)
    lista_alunos = ga.alunos
    spc = SelecaoPilotoCopiloto.new

    assert_equal 'Joao', spc.selecionar(lista_alunos)
    assert_equal 'Ze', spc.selecionar(lista_alunos)
  end

  def test_selecionar_quando_a_lista_for_maior_que_dois
    ze = Aluno.new('Ze', '1235')
    joao = Aluno.new('Joao', '2231')
    maria = Aluno.new('Maria', '2255')
    ga = GerenciarAluno.new
    ga.cadastrar(ze)
    ga.cadastrar(joao)
    ga.cadastrar(maria)
    lista_alunos = ga.alunos
    spc = SelecaoPilotoCopiloto.new

    assert_equal 'Maria', spc.selecionar(lista_alunos)
    assert_equal 'Joao', spc.selecionar(lista_alunos)
    assert_equal 'Ze', spc.selecionar(lista_alunos)
    assert_equal [{:nome=>"Maria", :matricula=>"2255", :participacao=>1}, {:nome=>"Joao", :matricula=>"2231", :participacao=>1}, {:nome=>"Ze", :matricula=>"1235", :participacao=>1}], ga.alunos
    assert_equal 1, ga.consultar_participacao("1235")
    assert_equal 1, ga.consultar_participacao("2231")
    assert_equal 1, ga.consultar_participacao("2255")
  end

  def test_selecionar_quando_todo_mundo_ja_tiver_jogado_uma_vez
    ze = Aluno.new('Ze', '2287')
    joao = Aluno.new('Joao', '22973')
    maria = Aluno.new('Maria', '22556')
    ga = GerenciarAluno.new
    ga.cadastrar(ze)
    ga.cadastrar(joao)
    ga.cadastrar(maria)
    lista_alunos = ga.alunos
    spc = SelecaoPilotoCopiloto.new

    assert_equal 'Maria', spc.selecionar(lista_alunos)
    assert_equal 'Joao', spc.selecionar(lista_alunos)
    assert_equal 'Ze', spc.selecionar(lista_alunos)
    assert_equal 'Ze', spc.selecionar(lista_alunos)
    assert_equal 'Joao', spc.selecionar(lista_alunos)
    assert_equal 'Maria', spc.selecionar(lista_alunos)
    assert_equal 2, ga.consultar_participacao('2287')
    assert_equal 2, ga.consultar_participacao('22973')
    assert_equal 2, ga.consultar_participacao('22556')
  end
end