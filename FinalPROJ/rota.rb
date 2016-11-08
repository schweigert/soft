class Rota

  @@rotas = Hash.new

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
    for i in @@rotas.keys
      puts "#{i.to_s}: #{@@rotas[i].to_s}"
    end
  end

end
