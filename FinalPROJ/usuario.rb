require_relative "mapa"

class Usuario
  def self.setupUsuario v
    @@posicao = v
  end

  def self.procurarCaminhos b
    matAdj = Mapa.matAdj
    pontos = Ponto.pontos
    v = pontos.size
    mat = []
    lixo = []
    for i in 0..(v-1)
      mat[i] = []
      lixo[i] = v*v
      for j in i..(v-1)
        if matAdj[i] == nil
          mat[i][j] = 0
          next
        end
        if matAdj[i][j] == nil
          mat[i][j] = 0
        else
          mat[i][j] = matAdj[i][j].size
        end
      end
    end
    menorCaminho(@@posicao, b, lixo, mat, 0)
    return encontrarCaminhos @@posicao, b, mat, menor[b]
  end

  def self.encontrarCaminhos a,b, grafo, menor
    if menor == 0
      return nil
    end
    v = grafo.size -1

    for i in 0..v
      next if grafo[a][v] == 0
    end
  end

  def self.menorCaminho a, b, lista, grafo, d
    if a == b
      lista[a] = d
      return 0
    end

    if lista[a] > d
      lista[a] = d
    else
      return 0
    end

    v = grafo.size-1

    for i in 0..v
      next if grafo[a][i] == 0
      menorCaminho(i,b,lista,grafo,d+1)
    end
  end
end
