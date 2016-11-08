class Rota

  @@rotas = Hash.new
  @@intersecsoes = Hash.new

  def self.rotas; return @@rotas; end

  def self.setupRotas
    txt = open("rotas").read
    lines = txt.split "\n"
    for i in lines
      nome, pontos = i.split "=>"
      nome.chomp!
      @@rotas[nome] = []
      pontos = pontos.split " "
      for i in pontos
        @@rotas[nome] << i.to_i
      end
    end
  end

  def self.showRotas
    puts "\nShow: Rotas"
    for i in @@rotas.keys
      puts "#{i.to_s}: #{@@rotas[i].to_s}"
    end
  end

  def self.intersecsao a,b
    ra = @@rotas[a]
    rb = @@rotas[b]
    r = []
    puts "Testando rota #{ra.to_s} com #{rb.to_s}"
    for i in ra.uniq
      for j in rb.uniq
        if i == j
          r << j
        end
      end
    end
    return r.sort
  end

  def self.setupIntersecsoes
    for i in @@rotas.keys
      for j in @@rotas.keys
        if i == j
          next
        end
        @@intersecsoes[i] ||= Hash.new
        @@intersecsoes[i][j] = Rota.intersecsao i, j
      end
    end
  end

  def self.showIntersecsoes
    puts "\nShow: Intersecsoes"
    for i in @@intersecsoes.keys
      for j in @@intersecsoes[i].keys
        if i == j
          next
        end
        puts "#{i.to_s}=>#{j.to_s}: #{@@intersecsoes[i][j]}"
      end
    end
  end

end
