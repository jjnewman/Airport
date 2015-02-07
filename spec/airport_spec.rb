require 'airport'

describe Airport do

let(:airport){Airport.new(capacity: 25)}
let(:plane){double :plane, flying?: nil}
let(:landed_planes){double :plane, flying?: false}

it 'should allow a capacity to be set on initiation' do
	expect(airport.capacity).to eq(25)
end

it 'can accept a plane for landing' do
	expect(airport.landed_planes.count).to eq(0)
	airport.accept_for_landing(plane)
	expect(airport.landed_planes.count).to eq(1)
end

it 'can release a plane for take-off' do
	airport.accept_for_landing(plane)
	airport.release_for_takeoff(plane)
	expect(airport.landed_planes.count).to eq(0)	
end

end