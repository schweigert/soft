require_relative "mapa"
require_relative "ponto"
class Usuario

  def self.posicao; return @@posicao; end

  def self.setupUsuario v
    @@posicao = v
  end

  def self.showUsuario
    puts "Você está em: #{Ponto.pontos[@@posicao]}"
  end

  def self.dijkstra objetivo

    r = []
    v = Ponto.pontos.size() -1

    grafo = []

    for i in 0..(v)
      grafo[i] = []
      for j in 0..(v)
        if Mapa.matAdj[i]
          if Mapa.matAdj[i][j]
            grafo[i][j] = 1
          else
            grafo[i][j] = 0
          end
        else
          grafo[i][j] = 0
        end
      end
    end

    for i in 0..v
      r[i] = [
              -1, # Por onde
              0,  # Distância inicial
              0   # 0 - Não alcançado
                  # 1 - Alcançado
                  # 2 - Relaxado
             ]

    end

    # Primeiro ponto
    r[@@posicao] = [@@posicao, 0, 2]

    # Pontos iniciais

    for i in 0..v
      next if grafo[@@posicao][i] == 0
      r[i] = [@@posicao, 1, 1]
    end

    loop {
      # encontradar o menor caminho alcançado
      caminhos = []
      for i in 0..v
        next if r[i][2] != 1
        caminhos << [i, r[i][1]]
      end

      # se não encontrar nenhum caminho alcançado, terminar o loop
      break if caminhos.size == 0

      # encontrar menor caminho
      menor = caminhos[0]

      for i in caminhos
        menor = i if menor[1] > i[1]
      end

      b = menor[0]

      for i in 0..v
        next if grafo[b][i] == 0
        next if r[i][2] == 2
        if r[i][1] > r[b][1]+1 || r[i][2] == 0
          r[i][0] = b
          r[i][1] = r[b][1]+1
          r[i][2] = 1
        end
      end

      r[b][2] = 2

       break if r[objetivo][2] == 2
    }

    rota = []

    if r[objetivo][0] == -1
      puts "Parece que você não consegue alcançar este local :'("
      gets
      return []
    end
    rota << objetivo
    loop {
        break if objetivo == @@posicao
        rota << r[objetivo][0]
        objetivo = r[objetivo][0]
    }
    rotas = Rota.rotas
    retorno = Hash.new
    puts "Você deve usar esta rota:"
    for i in rota.reverse
      puts "#{i}-#{Ponto.pontos[i]}:"
      retorno[i] = []
      for j in rotas.keys
        if rotas[j].include? i
          puts "\t#{j}"
          retorno[i] << j
        end
      end
    end
    gets

    return retorno
  end

end
