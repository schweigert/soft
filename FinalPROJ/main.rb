require_relative "rota"
require_relative "ponto"
require_relative "mapa"
require_relative "usuario"

Ponto.setupPontos

Rota.setupRotas


def menu_principal
  puts "1 >> Calcular Rota"
  puts "2 >> Pontos"
  puts "3 >> Rotas"
  puts "E >> Sair"
  escolha = gets
  if escolha.to_i == 2
    menu_pontos
  elsif escolha.to_i == 3
    menu_rotas
  elsif escolha.to_i == 1
    menu_calcularRota
  elsif escolha.chomp == "E"
    exit
  end
end

def menu_calcularRota
  local = ""
  Usuario.showUsuario
  puts "Para onde deseja ir?"
  local = gets.chomp
  a = -1
  for i in 0..(Ponto.pontos.size()-1)
    if Ponto.pontos[i].chomp().delete(" ") == local.chomp().delete(" ")
      a = i
      puts "Encontramos essa rua! ;)"
      break
    end
  end

  if a == -1
    puts "Esta rua não foi encontrada :("
    gets
    return
  end

  Usuario.dijkstra a
  Usuario.setupUsuario a

end

def menu_rotas
  puts "1 >> Listar Rotas"
  puts "2 >> Inserir Rota"
  puts "* >> Voltar"
  escolha = gets.to_i
  if escolha == 1
    menu_listarRotas
  elsif escolha == 2
    menu_inserirRota
  end
end

def menu_listarRotas
  Rota.showRotas
  gets
end

def menu_inserirRota
  print "Nome: "
  nome = gets.chomp
  print "Numero de Pontos: "
  n = gets.to_i
  ruas = []
  n.times do
    ruas << gets.chomp
  end
  Rota.addRota nome, ruas
  puts "Rota adicionada"
  Rota.salvar
  puts "Rotas salvas"
  gets
end

def menu_pontos
  puts "1 >> Listar Pontos"
  puts "2 >> Inserir Ponto"
  puts "* >> Voltar"
  escolha = gets.to_i
  if escolha == 1
    menu_listarPontos
  elsif escolha == 2
    menu_inserirPontos
  end
end

def menu_listarPontos
  Ponto.showPontos
  gets
end

def menu_inserirPontos
  system "clear"
  print "Nome: "
  nome = gets.chomp
  r = Ponto.addPonto nome
  if r
    puts "Foi adicionado em #{r}"
  else
    puts "Este ponto já existia"
  end
  puts "Ok..."
  Ponto.salvar
  puts "Salvando..."
  gets
end

loop {
  Rota.setupIntersecsoes
  Mapa.setupMapa
  Usuario.setupUsuario(1)
  system "clear"
  puts "MIND THE BUSS: BIG HERO"
  puts "v 2.0 Beta Test"
  menu_principal
}
