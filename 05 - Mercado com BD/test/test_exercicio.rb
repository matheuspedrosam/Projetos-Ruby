require 'minitest/autorun'
require './aula_10/app/mercado.rb'

class TestExercicioMercadinho < Minitest::Test

  def test_mercadinho
    mercado = Mercado.new
    estoque = ['morango', 'morango', 'limao', 'limao', 'pitanga', 'pitanga']
    # mercado.cadastrar_mercado('mercadinho do rachid')
    # mercado.cadastrar_estoque('mercadinho do rachid', estoque)
    # mercado.vender('mercadinho do rachid', ['morango', 'limao', 'pitanga', 'pitanga'])
    
    assert_equal 'Já existe um mercado com esse nome', mercado.cadastrar_mercado('mercadinho do rachid')
    assert_equal 2, mercado.estoque('mercadinho do rachid').size
    assert_equal 3.5, mercado.saldo('mercadinho do rachid')
  end

end

  # Teste obrigatório:
  # 1. Fazer query que retorne total que o mercadinho faturou a partir das seguintes vendas:
  #
  # - Venda de um sacolé do sabor morando no valor de R$ 1,00
  # - Venda de um sacolé do sabor limão no valor de R$ 0,50
  # - Venda de dois sacolés do sabor pitanga no valor de R$ 2,00
  #
  # Dicas:
  # 1. User CREATE TABLE para criar os bancos: mercadinhos, sacoles, estoques
  # 2. Usar SELECT com WHERE para filtrar
  # 3. Usar UPDATE com WHERE para atualizar o dado correto do banco
  # 4. Usar INSERT para criar os sacolés, estoque e o mercadinho