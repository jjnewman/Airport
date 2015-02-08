class Plane

def initialize
	$flying_planes ||= []
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
	$flying_planes << self
	self
end

#add airport argument?
def land!
	@flying = false
	@grounded = true
	$flying_planes.delete(self)
	self
end

end