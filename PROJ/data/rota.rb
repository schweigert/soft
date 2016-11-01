require_relative "mapa"

class Rota < Mapa

	@pontos
	@inicio
	@fim
	
	  
	attr_reader :pontos, :inicio, :fim
	#attr_writer :velocity
	
	def initialize caminho
		@pontos = caminho
		@inicio = caminho.first
		@fim = caminho.last
	end
	
	def intersecsao rota
		pts = rota.pontos
		ret = []
		for i in pts
			for j in @pontos
				if (i == j)
					ret << i
				end
			end
		end
		
		return ret
	end
	
end
