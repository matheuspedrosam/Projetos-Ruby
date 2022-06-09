class Aluno

    def initialize(nome, matricula)
      @nome = nome
      @matricula = matricula
      @qtd_participacao = 0
    end
  
    def nome
      @nome
    end
  
    def nome_valido?
  
      if nome.kind_of? String
        if nome.include?('0') || nome.include?('1') || nome.include?('2') || nome.include?('3') || nome.include?('4') ||nome.include?('5') || nome.include?('6') || nome.include?('7') || nome.include?('8') || nome.include?('9')
          return false
        else
          return true
        end
      else
        return false
      end
      
    end
  
    def matricula
      @matricula
    end
  
    def matricula_valida?
      numeros = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
      if matricula.kind_of? String
        array_matricula = matricula.split("")
        total = 0
        array_matricula.each do |elementos|
          for index in 0..9
            if numeros[index] == elementos
              total += 1
            end
          end
        end

        if total == matricula.length
          return true
        else
          return false
        end
        
      else
        return false
      end
    end

    def qtd_participacao
      @qtd_participacao
    end

    def add_participacao
      @qtd_participacao += 1
    end
  
  end