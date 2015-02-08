class Traffic_control < Airport

def flying_planes
	$flying_planes
end

def display_all_planes
	puts "The planes currently in the air are:"
	puts flying_planes
	puts "\n--------\n"
	puts "The planes currently in the airport are:"
	puts airport_planes
end

def plane_sequence_landing
	flying_planes.each do |plane| 
		accept_for_landing(plane)
		puts "plane #{plane} landed"
	end
end

def plane_sequence_taking_off
	airport_planes.each do |plane| 
		release_for_takeoff(plane)
		puts "plane #{plane} taken off"
	end
end
end
