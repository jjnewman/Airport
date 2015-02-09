module Weather

	def sunny?
		@sunny
	end

	def stormy?
		@stormy
	end

	def randomizer
		prng = Random.new
		prng.rand(1..10) 
	end

	def current_condition!
		if randomizer < 10 
			@sunny = true 
			@stormy = false
		else
			@stormy = true 
			@sunny = false
		end
		self
	end

end