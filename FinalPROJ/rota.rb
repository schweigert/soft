class Rota

  @@rotas = Hash.new
  @@intersecsoes = Hash.new

  def self.rotas; return @@rotas; end

  def self.setupRotas
    txt = open("rotas").read
    lines = txt.split "\n"
    for i in lines
      nome, pontos = i.split "=>"
      nome = nome.chomp.delete " "
      @@rotas[nome] = []
      pontos = pontos.split " "
      for i in pontos
        @@rotas[nome] << i.to_i
      end
    end
  end

  def self.salvar
    Ponto.salvar
    f = open "rotas", "w"
    for i in @@rotas.keys
      f.write i
      f.write " => "
      for j in @@rotas[i]
        f.write " "+j.to_s
      end
      f.write "\n"
    end
    f.close
  end

  def self.addRota nome ,ruas
    nome.chomp!
    num_vet = []
    pontos = Ponto.pontos
    for i in ruas
      a = 0
      for j in pontos
        if i.chomp == j.chomp
          num_vet << a
          break
        end
        a += 1
      end
      puts "Ponto #{i} não encontrado"

      a = Ponto.addPonto i
      num_vet << a
      pontos = Ponto.pontos

    end

    @@rotas[nome] = []
    ultimo = nil
    for i in  num_vet
      if i == ultimo
        next
      end
      @@rotas[nome] << i
      ultimo = i
    end

    puts "Roda #{nome} adicionada:"
    for i in @@rotas[nome]
      puts "#{i} - #{Ponto.pontos[i]}"
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
