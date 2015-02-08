require_relative 'weather'
require_relative 'plane'

class Airport

include Weather

attr_writer :capacity

DEFAULT_CAPACITY = 50
#LANDED_PLANES = Proc.new {|plane| !plane.flying?}

def initialize(options = {})
	self.capacity = options.fetch(:capacity, capacity)
end

def planes
	@planes ||= []
end

def landed_planes
	@landed_planes ||= []
	#planes.select &LANDED_PLANES
end

def flying_planes
	@flying_planes ||= []
	#planes.reject &LANDED_PLANES
end

def capacity
	@capacity ||= DEFAULT_CAPACITY 
end

def accept_for_landing(plane)
	landed_planes << plane
	flying_planes.delete(plane)
	#plane.landed!
end

def release_for_takeoff(plane)
    planes.delete(plane)
    flying_planes << plane
end


end