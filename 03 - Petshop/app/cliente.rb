class Cliente

    def initialize(nome, pet)
        @pet = pet
        @nome = nome
    end

    def nome
        @nome
    end

    def nome_valido?
        if nome.is_a? String
            if nome.include?('0') || nome.include?('1') || nome.include?('2') || nome.include?('3') || nome.include?('4') || nome.include?('5') || nome.include?('6') || nome.include?('7') || nome.include?('8') || nome.include?('9')
                return false
            else
                return true
            end
        else
            return false
        end
    end

    def pet
        @pet
    end

    def pet_valido?
        if pet.is_a? String
            if pet.include?('0') || pet.include?('1') || pet.include?('2') || pet.include?('3') || pet.include?('4') || pet.include?('5') || pet.include?('6') || pet.include?('7') || pet.include?('8') || pet.include?('9')
                return false
            else
                return true
            end
        else
            return false
        end
    end

    def cliente_valido?
        if pet_valido? && nome_valido?
            true
        end
    end

end