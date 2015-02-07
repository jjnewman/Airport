require './lib/airport'

describe Airport do

let(:airport){Airport.new(capacity: 25)}
let(:plane){double :plane}
let(:stormy_weather){double :weather, stormy?: true}

it 'should allow a capacity to be set on initiation' do
	expect(airport.capacity).to eq(25)
end

it 'should accept a plane for landing' do
	expect(airport.plane_count).to eq(0)
	airport.accept_for_landing(plane)
	expect(airport.plane_count).to eq(1)
end

it 'should release a plane for take-off' do
	airport.accept_for_landing(plane)
	airport.release_for_takeoff(plane)
	expect(airport.plane_count).to eq(0)	
end

it 'should not accept a plane if the airport is full' do
	airport.capacity.times{airport.accept_for_landing(plane)}
	expect{airport.accept_for_landing(plane)}.to raise_error(RuntimeError, 'Airport is full')
end

it 'should not release a plane if the airport is empty' do
	expect{airport.release_for_takeoff(plane)}.to raise_error(RuntimeError, 'Airport is empty')
end

#it 'should not accept a plane if the weather is stormy' do
#	stormy_weather
#	expect{airport.accept_for_landing(plane)}.to raise_error(RuntimeError, 'Weather is stormy')	
#end

#it 'should provide the list of landed and flying planes' do
#	flying_plane, landed_plane = Plane.new, Plane.new
#	landed_plane.land!
#end


end