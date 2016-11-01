require_relative "gps"

class Usuario
	@macAdrass
	@gps
	
	def initialize x, y, mac
		@gps = GPS.new x, y
	end
	
	def posicao
		return @gps.posicao
	end
end
