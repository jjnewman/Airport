class Plane

def initialize
	taken_off!()
end

def flying?
	@flying
end

def taken_off!
	@flying = true
	self
end

def landed!
	@flying = false
	self
end

end