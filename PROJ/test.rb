require_relative "data/usuario"
require_relative "data/gps"
require_relative "data/onibus"

require "test/unit"
 
class TesteUsuario < Test::Unit::TestCase
 
 #posicao
  def test_simple
	for i in 0..100
		for j in 0..100
			assert(Usuario.new(i,j, "...").posicao == [i,j])
		end
    end
  end
  
 
end

class TesteGPS < Test::Unit::TestCase
 
  #posicao
  def test_simple
	for i in 0..100
		for j in 0..100
			assert(GPS.new(i,j).posicao == [i,j])
		end
    end
  end
 
end

class TesteOnibus < Test::Unit::TestCase
 
  #posicao
  def test_simple
	for i in 0..100
		for j in 0..100
			gps = GPS.new i, j
			onibus = Onibus.new gps, [], "JAS-1010"
			assert(onibus.posicao == [i,j])
		end
    end
  end
 
  #rota
  def test_simple
	for i in 0..100
		for j in 0..100
			gps = GPS.new i, j
			n = rand 100
			vet = []
			n.times do
				n << rand(100)
			end
			rota = Rota.new vet
			onibus = Onibus.new gps, rota, "JAS-1010"
			assert(onibus.posicao == [i,j])
		end
    end
  end
end

class TesteOnibus < Test::Unit::TestCase
 
  # pontos
  def test_simple
	for i in 0..100
		for j in 0..100
			gps = GPS.new i, j
			n = rand 100
			vet = []
			n.times do
				n << rand(100)
			end
			rota = Rota.new vet
			assert(rota.pontos == vet)
		end
    end
  end
  
  # inicio
  def test_simple
	for i in 0..100
		for j in 0..100
			gps = GPS.new i, j
			n = rand 100
			vet = []
			inicio = rand(100)
			vet << inicio
			n.times do
				n << rand(100)
			end
			rota = Rota.new vet
			assert(rota.inicio == inicio)
		end
    end
  end
  
  # fim
  def test_simple
	for i in 0..100
		for j in 0..100
			gps = GPS.new i, j
			n = rand 100
			vet = []
			fim = rand(100)
			n.times do
				n << rand(100)
			end
			vet << fim
			rota = Rota.new vet
			assert(rota.inicio == fim)
		end
    end
  end
  
  #comentário inutil
  
end
