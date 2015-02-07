class Airport

DEFAULT_CAPACITY = 50
LANDED_PLANES = Proc.new {|plane| !plane.flying?}

def planes
	@planes ||= []
end

def capacity
	@capacity ||= DEFAULT_CAPACITY 
end

def plane_count
	planes.count
end

def accept_for_landing(plane)
	raise "Airport is full" if full?
	planes << plane
end

def release_for_takeoff(plane)
    raise "Airport is empty" if empty?
    planes.delete(plane)
end

def full?
	plane_count == capacity
end

def empty?
	plane_count == 0
end

def landed_planes
	planes.select &LANDED_PLANES
end

def flying_planes
	planes.reject &LANDED_PLANES
end









end