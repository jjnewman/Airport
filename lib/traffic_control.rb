class Traffic_control < Airport





def plane_sequence_landing
	flying_planes.each do |plane| 
		while grounded_planes.count <= capacity
			plane.land!
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