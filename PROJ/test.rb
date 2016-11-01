require_relative "data/usuario"
require_relative "data/gps"
require_relative "data/onibus"
require_relative "data/administrador"

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

class TesteAdministrador < Test::Unit::TestCase
 
 #Login somente se usuário existir
  def test_simple
	for i in 0..1000
		numero = rand 300000 + 300
		email = "#{numero.to_s}@email.com"
		senha = numero.to_s
		admin = Administrador.new email, senha
		if not admin.existe?
			assert (not admin.login)
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
  def test_simple1
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
  def test_simple2
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
  
  # intersecao
  def test_simple3
	rota1 = (1..100).to_a
	rota2 = [2,3,4,5,6,7]
	r1 = Rota.new rota1
	r2 = Rota.new rota2
	assert((r1.intersecsao r2) == rota2)
  end
  
  
end
