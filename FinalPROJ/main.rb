require_relative "rota"
require_relative "ponto"
require_relative "mapa"
puts "MIND THE BUSS: BIG HERO"
puts "v 2.0 Beta Test"

Ponto.setupPontos
Ponto.showPontos

Rota.setupRotas
Rota.showRotas
Rota.setupIntersecsoes
Rota.showIntersecsoes

Mapa.setupMapa
Mapa.showMapa
