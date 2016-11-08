require_relative "ponto"
require_relative "mapa"

class Mapa

  @@matAdj = []

  def self.setupMapa
    rotas = Rota.rotas

    for i in rotas.keys
      for j in 0..(rotas[i].size-2)
        @@matAdj[rotas[i][j]] ||= []
        @@matAdj[rotas[i][j]][rotas[i][j+1]] ||= []
        @@matAdj[rotas[i][j]][rotas[i][j+1]] << i
      end
    end

  end

  def self.showMapa
    puts "\nShow: Mapa"
    v = Ponto.pontos.size

    for i in 0..(v-1)
      for j in 0..(v-1)
        if @@matAdj[i]
          if @@matAdj[i][j]
            print "#{@@matAdj[i][j]} "
          else
            print '0 '
          end
        else
          print '0 '
        end
      end
      print "\n"
    end

  end

end
