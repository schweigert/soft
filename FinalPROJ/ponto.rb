class Ponto

  @@pontos = []

  def self.pontos; return @@pontos; end

  def self.setupPontos
    txt = open("pontos").read
    lines = txt.split "\n"
    for i in lines
      num, nome = i.split "=>"
      unless nome
        @@pontos [num.to_i] = ""
        next
      end
      nome.chomp!
      num = num.to_i
      @@pontos[num] = nome.chomp
    end
  end

  def self.salvar
    f = open "pontos", "w"
    a = 0
    for i in @@pontos
      f.puts "#{a.to_s} => #{i.to_s}"
      a += 1
    end
    f.close
  end

  def self.addPonto nome

    nome.chomp!

    # Verificar se o ponto já existe
    a = 0
    for i in @@pontos
      return a if i == nome
      a += 1
    end

    @@pontos << nome
    return (@@pontos.size-1)

  end

  def self.showPontos
    puts "\nShow: Pontos"
    a = 0
    for i in @@pontos
      puts "#{a}: #{i}"
      a = a+1
    end
  end


end
