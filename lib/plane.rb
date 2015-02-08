class Plane

def initialize
	take_off!()
end

def flying?
	@flying
end

def grounded?
	@grounded
end

def take_off!
	@flying = true
	@grounded = false
	self
end

def land!
	@flying = false
	@grounded = true
	self
end

end