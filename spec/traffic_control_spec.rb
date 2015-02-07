require 'traffic_control'

describe Traffic_control do

let(:traffic_control){Traffic_control.new}
let(:plane){double :plane, flying?: nil}

it 'should not accept a plane if the airport is full' do
	traffic_control.capacity.times{traffic_control.accept_for_landing(plane)}
	expect{traffic_control.accept_for_landing(plane)}.to raise_error(RuntimeError, 'Airport is full')
end

it 'should not release a plane if the airport is empty' do
	expect{traffic_control.release_for_takeoff(plane)}.to raise_error(RuntimeError, 'Airport is empty')
end

it 'should not accept a plane if the weather is stormy' do
	(expect{traffic_control.accept_for_landing(plane)}.to raise_error(RuntimeError, 'Weather is stormy')) if traffic_control.stormy?
end

it 'should not release a plane if the weather is stormy' do
	(expect{traffic_control.release_for_takeoff(plane)}.to raise_error(RuntimeError, 'Weather is stormy')) if traffic_control.stormy?
end


#it 'should provide the list of landed and flying planes' do
#	flying_plane, landed_plane = Plane.new, Plane.new
#	landed_plane.land!
#end


end