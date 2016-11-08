class Ponto

  @@pontos = []

  def self.pontos; return @@pontos; end

  def self.setupPontos
    txt = open("pontos").read
    lines = txt.split "\n"
    for i in lines
      num, nome = i.split "=>"
      nome.chomp!
      num = num.to_i
      @@pontos[num] = nome
    end
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
