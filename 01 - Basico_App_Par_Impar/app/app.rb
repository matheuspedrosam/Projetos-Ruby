require './app_par_impar/classes/jogador'
require './app_par_impar/classes/partida'


matheus = Jogador.new('matheus', 'impar', 5)
pedro = Jogador.new('pedro', 'par', 3)

ptd1 = Partida.new(matheus, pedro)

if ptd1.validacao1 == 'tudo tranquilo'
    if ptd1.validacao2 == 'tudo tranquilo'
        puts ptd1.resultado
    else
        puts 'erro'
    end
else
    puts 'erro'
end