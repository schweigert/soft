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
	
end
