class Traffic_control < Airport

def plane_sequence
	flying_planes.each do |plane| 
		while landed_planes.count <= capacity
			plane.landed!
			puts "plane landed"
			landed_planes << plane
			flying_planes.delete(plane)
		end	
	end
end

def accept_for_landing(plane)
	raise "Airport is full" if full?
	storm_message
	planes << plane
end

def release_for_takeoff(plane)
    raise "Airport is empty" if empty?
    storm_message
    super
end

def storm_message
	raise "Weather is stormy" if stormy?
end

def flying_planes
	planes.reject &LANDED_PLANES
end

def full?
	landed_planes.count >= capacity
end

def empty?
	landed_planes.count == 0
end

end