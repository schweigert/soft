class GPS
	@x
	@y
	
	def initialize x, y
		@x = x
		@y = y
	end
	
	def posicao
		return @x, @y
	end
end
