require_relative 'weather'

class Airport

include Weather

attr_writer :capacity

DEFAULT_CAPACITY = 50
LANDED_PLANES = Proc.new {|plane| !plane.flying?}


def initialize(options = {})
	self.capacity = options.fetch(:capacity, capacity)
end

def planes
	@planes ||= []
end

def capacity
	@capacity ||= DEFAULT_CAPACITY 
end

def accept_for_landing(plane)
#raise "Airport is full" if full?
	planes << plane
end

def release_for_takeoff(plane)
    planes.delete(plane)
end

def landed_planes
	planes.select &LANDED_PLANES
end


#def landed_planes_count
#	landed_planes.count
#end



end