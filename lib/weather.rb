module Weather

def sunny?
	@sunny
end

def stormy?
	@stormy
end

def current_condition!
	prng = Random.new
	prng.rand(1..10) != 10? (@sunny = true && @stormy = false) : (@stormy = true && @stormy = false)
	self
end

end