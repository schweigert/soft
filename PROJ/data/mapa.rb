class Mapa

	@@matAdjacente = [
		[30,0,10,6,0,30],
		[30,0,5,6,0,0],
		[30,0,10,2,0,30],
		[30,0,1,6,0,30],
		[30,0,10,6,0,30],
		[30,0,0,6,0,3],
	]

	@@rotas = []

	def self.matAdjacente
		return @@matAdjacente
	end

	def self.rotas
		return @@rotas
	end

	def tempo a, b
		return 10
	end

end
