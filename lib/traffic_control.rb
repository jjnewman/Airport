class Traffic_control < Airport

def accept_for_landing(plane)
	raise "Airport is full" if full?
	storm_message
	planes << plane
end

def release_for_takeoff(plane)
    raise "Airport is empty" if empty?
    storm_message
    planes.delete(plane)
end

def storm_message
	raise "Weather is stormy" if stormy?
end


def full?
	landed_planes.count >= capacity
end

def empty?
	landed_planes.count == 0
end

def plane_sequence_landing
	flying_planes.each do |plane| 
		while landed_planes.count <= capacity
			plane.landed!
			puts "plane landed"
			landed_planes << plane
			flying_planes.delete(plane)
		end	
	end
	plane_sequence_taking_off
end

def plane_sequence_taking_off
	landed_planes.each do |plane| 
		while landed_planes.count > 0
			plane.taken_off!
			puts "plane taken off"
			flying_planes << plane
			landed_planes.delete(plane)
		end	
	end
end
end