class Plane

def initialize
	take_off!
end

def flying?
	@flying
end

def take_off!
	@flying = true
	self
end

#add airport argument?
def land!
	raise 'You are already landed, moron! What have you been smoking?' unless flying?
	@flying = false
	self
end

end