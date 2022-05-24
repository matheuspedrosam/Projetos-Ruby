require 'C:\Users\Matheus\Documents\RUBY ESTUDOS\Projetos em Ruby\01 - Jogo Par ou Impar\classes\jogador'
require 'C:\Users\Matheus\Documents\RUBY ESTUDOS\Projetos em Ruby\01 - Jogo Par ou Impar\classes\partida'

jogo = true

puts "jogador 1 digite seu nome:"
print 'nome:'
nome1 = gets.chomp
puts
puts "jogador 2 digite seu nome:"
print 'nome:'
nome2 = gets.chomp

while jogo == true
    puts
    puts "#{nome1} digite sua opcao e seu valor"
    print "opcao:"
    opcao1 = gets.chomp
    print 'valor:'
    valor1 = gets.chomp.to_i
    puts "#{nome2} digite sua opcao e seu valor"
    print "opcao:"
    opcao2 = gets.chomp
    print 'valor:'
    valor2 = gets.chomp.to_i

    jogador1 = Jogador.new(nome1, opcao1, valor1)
    jogador2 = Jogador.new(nome2, opcao2, valor2)


    ptd1 = Partida.new(jogador1, jogador2)

    if ptd1.validacao1 == 'tudo tranquilo'
        if ptd1.validacao2 == 'tudo tranquilo'
            puts ptd1.resultado
        else
            puts 'erro'
        end
    else
        puts 'erro'
    end
    puts "deseja jogar novamente?(s/n)"
    resposta = gets.chomp

    if resposta == 'n'
        jogo = false
    end
end