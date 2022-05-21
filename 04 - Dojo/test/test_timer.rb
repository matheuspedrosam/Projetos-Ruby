require 'minitest/autorun'
require './Dojo/app/timer'

class TestTimer < Minitest::Test
    def test_quando_passar_tempo_menor_que_3
        tempo = Timer.new(2)

        assert_equal 'Tempo invalido. Tente tempo entre 3 e 6', tempo.valida_tempo()
    end

    def test_quando_passar_tempo_maior_que_6
        tempo = Timer.new(7)
        assert_equal 'Tempo invalido. Tente tempo entre 3 e 6', tempo.valida_tempo()
    end 
end