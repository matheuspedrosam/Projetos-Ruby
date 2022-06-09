require 'yaml'

class Mercado

    def initialize
        @estoque = [{sabor: 'morango', preco: 0.50}, {sabor: 'morango', preco: 0.50}, {sabor: 'morango', preco: 0.50}, {sabor: 'morango', preco: 0.50}, {sabor: 'morango', preco: 0.50}, {sabor: 'limao', preco: 0.25}, {sabor: 'limao', preco: 0.25}, {sabor: 'limao', preco: 0.25}, {sabor: 'limao', preco: 0.25}, {sabor: 'limao', preco: 0.25}, {sabor: 'tangerina', preco: 0.25}, {sabor: 'tangerina', preco: 0.25}, {sabor: 'tangerina', preco: 0.25}, {sabor: 'tangerina', preco: 0.25}, {sabor: 'tangerina', preco: 0.25}, {sabor: 'maçã verde', preco: 0.50}, {sabor: 'maçã verde', preco: 0.50}, {sabor: 'maçã verde', preco: 0.50}, {sabor: 'maçã verde', preco: 0.50}, {sabor: 'maçã verde', preco: 0.50}, {sabor: 'goiaba', preco: 0.75}, {sabor: 'goiaba', preco: 0.75}, {sabor: 'goiaba', preco: 0.75}, {sabor: 'goiaba', preco: 0.75}, {sabor: 'goiaba', preco: 0.75}]
        @vendas = []
        @saldo = 0
    end

    def saldo
        @saldo
    end

    def estoque
        arquivo = File.read('desafioMercado/banco/estoque.yml')
        arq_yml = YAML.load(arquivo)
        arq_yml
    end

    def vender(cliente, sabor)
        @estoque.each do |iten|
            if iten[:sabor] == sabor
                @saldo += iten[:preco]
                @vendas << iten
                @estoque.delete_at(@estoque.index(iten))
                break
            end
        end
        File.open('desafioMercado/banco/estoque.yml', 'w') do |arquivo|
            arquivo.write(@estoque.to_yaml)
        end
        File.open('desafioMercado/banco/vendas.yml', 'w') do |arquivo|
            arquivo.write(@vendas.to_yaml)
        end
    end

    def vendas
        arquivo = File.read('desafioMercado/banco/vendas.yml')
        arq_yml = YAML.load(arquivo)
        arq_yml
    end

    def vendas_morango
        arquivo = File.read('desafioMercado/banco/vendas.yml')
        arq_yml = YAML.load(arquivo)
        arr = []
        arq_yml.each do |iten|
            if iten[:sabor] == 'morango'
                arr << iten
            end
        end
        arr
    end

    def vendas_limao
        arquivo = File.read('desafioMercado/banco/vendas.yml')
        arq_yml = YAML.load(arquivo)
        arr = []
        arq_yml.each do |iten|
            if iten[:sabor] == 'limao'
                arr << iten
            end
        end
        arr
    end

    def vendas_goiaba
        arquivo = File.read('desafioMercado/banco/vendas.yml')
        arq_yml = YAML.load(arquivo)
        arr = []
        arq_yml.each do |iten|
            if iten[:sabor] == 'goiaba'
                arr << iten
            end
        end
        arr
    end

    def vendas_maca_verde
        arquivo = File.read('desafioMercado/banco/vendas.yml')
        arq_yml = YAML.load(arquivo)
        arr = []
        arq_yml.each do |iten|
            if iten[:sabor] == 'maçã verde'
                arr << iten
            end
        end
        arr
    end

    def vendas_tangerina
        arquivo = File.read('desafioMercado/banco/vendas.yml')
        arq_yml = YAML.load(arquivo)
        arr = []
        arq_yml.each do |iten|
            if iten[:sabor] == 'tangerina'
                arr << iten
            end
        end
        arr
    end

end