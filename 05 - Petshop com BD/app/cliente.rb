class Cliente

    def initialize(nome, pet, data_nasc, telefone)
        @nome = nome
        @pet = pet
        @data_nasc = data_nasc
        @telefone = telefone
    end

    def nome
        @nome
    end

    def nome_valido?
        if @nome.kind_of? String
            true
        end
    end

    def pet
        @pet
    end
    
    def pet_valido?
        if @pet.kind_of? String
            true
        end
    end

    def data_nasc
        @data_nasc
    end

    def data_nas_valida?
        if @data_nasc.kind_of? String
            true
        end
    end

    def telefone
        @telefone
    end

    def telefone_valido?
        if @telefone.kind_of? String
            true
        end
    end

    def cliente_valido?
        if nome_valido? && pet_valido? && data_nas_valida? && telefone_valido?
            true
        end
    end

end