require_relative "rota"

class Onibus
	@gps
	@placa
	@rota
	
	attr_reader :gps, :placa, :rota
	
	def initialize gps,rota, placa
		@gps = gps
		@rota = rota
		@placa = placa
	end
	
	def posicao
		return @gps.posicao
	end
	
end
