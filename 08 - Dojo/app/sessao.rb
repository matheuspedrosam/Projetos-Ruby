require 'sqlite3'
require '.\app\selecao_piloto_copiloto.rb'
require '.\app\timer.rb'

class Sessao

    def initialize(alunos_presentes)
      @selecao_piloto_copiloto = SelecaoPilotoCopiloto.new
      @db = SQLite3::Database.open './banco/alunos.db'
      @db.results_as_hash = true
      @db.execute 'update alunos set qtd_participacao=?', 0
      @db.execute 'update contador set contador=?', 1
      @lista_alunos = []
      alunos_presentes.each do |alunos_presentes|
        resultado = @db.execute 'select * from alunos where matricula=?', alunos_presentes.matricula
        if resultado != []
          @lista_alunos << resultado[0]
        end
      end
    end
  
    def selecionar_piloto_e_co_piloto
      if @piloto == nil
        @piloto = @selecao_piloto_copiloto.selecionar(@lista_alunos)
        @co_piloto = @selecao_piloto_copiloto.selecionar(@lista_alunos)
      else
        @piloto = @co_piloto
        @co_piloto = @selecao_piloto_copiloto.selecionar(@lista_alunos)
      end
      "Próximo Piloto e Co-piloto respectivamente: #{@piloto} e #{@co_piloto}."
    end
  
    def iniciar
      timer = Timer.new(3)
      timer.iniciar
    end
  end