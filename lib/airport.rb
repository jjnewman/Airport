require_relative 'weather'
require_relative 'plane'

class Airport

include Weather

attr_writer :capacity

DEFAULT_CAPACITY = 50
#LANDED_PLANES = Proc.new {|plane| !plane.flying?}
#FLYING_PLANES = Proc.new {|plane| plane.flying?}

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
	raise "Airport is full" if full?
	storm_message
	planes << plane.land!
end

def release_for_takeoff(plane)
    raise "Airport is empty" if empty?
    storm_message
    planes.delete(plane.take_off!)
end

def storm_message
	raise "Weather is stormy" if stormy?
end

def full?
	planes.count == capacity
end

def empty?
	planes.count == 0
end


#def grounded_planes
#	@grounded_planes = planes.select{|plane| plane.grounded?}
	#planes.select &LANDED_PLANES
#end

#def flying_planes
#	@flying_planes = planes.select{|plane| plane.flying?}
	#planes.reject &LANDED_PLANES
#end

end