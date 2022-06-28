require '.\app\conferencia.rb'

conferencia = Conferencia.new
conferencia.organizar
conferencia.selecionar
track_a = conferencia.resultado_final[0]
track_b = conferencia.resultado_final[1]
hora = 9
minuto = 0

puts "TRACK #A ->"
puts 
track_a.each do |conferencias|
    if hora >= 12 && hora < 13
        puts "#{hora}:#{minuto} - Hora do almoço 60min"
        minuto += 60
        if minuto >= 60
            minuto -= 60
            hora += 1
        end
    end
    puts "#{hora}:#{minuto} - #{conferencias[:descricao]}"
    minuto += conferencias[:tempo]
    if minuto >= 60
        minuto -= 60
        hora += 1
    end
end
puts "#{hora}:#{minuto} - Evento de Networking 60min"
puts
hora = 9
minuto = 0
puts "TRACK #B ->"
puts 
track_b.each do |conferencias|
    if hora >= 12 && hora < 13
        puts "#{hora}:#{minuto} - Hora do almoço 60min"
        minuto += 60
        if minuto >= 60
            minuto -= 60
            hora += 1
        end
    end
    puts "#{hora}:#{minuto} - #{conferencias[:descricao]}"
    minuto += conferencias[:tempo]
    if minuto >= 60
        minuto -= 60
        hora += 1
    end
end
puts "#{hora}:#{minuto} - Evento de Networking 60min"