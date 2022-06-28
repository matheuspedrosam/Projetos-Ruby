require 'minitest/autorun'
require './app/conferencia'

class TestConferencia < Minitest::Test

    def test_conferencia
        conferencia = Conferencia.new
        arr = []
        soma_dos_tempos = 60 #já com a hora do almoço incluso

        assert_equal 19, conferencia.organizar.size #aqui vai organizar o arquivo em hashs contendo a descrição: e o tempo:
        
        arr = conferencia.selecionar #aqui vai selecionar dentre esses hashs quais valores a soma dos tempos da 480 (equivalente a uma tracking)
        arr.each do |valores|
            soma_dos_tempos += valores
        end

        assert_equal 480, soma_dos_tempos
        assert_equal 2, conferencia.resultado_final.size #trackA e trackB
    end

end