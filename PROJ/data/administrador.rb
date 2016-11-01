require_relative "mapa"

class Administrador
	@email
	@pass
	@level
	
	def initialize email, pass
		@email = email
		@pass = pass
	end
	
	def existe?
		return true
	end
	
	def login
		return true
	end
	
	def addRota a, b, tempo
		mapa[a] = []
		for i in
	end
end
