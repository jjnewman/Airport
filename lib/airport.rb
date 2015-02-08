require_relative 'weather'

class Airport

include Weather

attr_writer :capacity

DEFAULT_CAPACITY = 50

def initialize(options = {})
	self.capacity = options.fetch(:capacity, capacity)
end

def airport_planes
	@airport_planes ||= []
end

def capacity
	@capacity ||= DEFAULT_CAPACITY 
end

def accept_for_landing(plane)
	if airport_planes.include? plane
		raise "Plane already at airport"
	else
		full_message
		storm_message
		airport_planes << plane.land!
	end
end

def release_for_takeoff(plane)
	if !airport_planes.include? plane
		raise "Plane not at airport"
	else
    	storm_message
    	airport_planes.delete(plane.take_off!)
    end	
end

def full_message
	raise "Airport is full" if full?
end

def storm_message
	current_condition!
	raise "Weather is stormy" if stormy?
end

def full?
	airport_planes.count == capacity
end

end