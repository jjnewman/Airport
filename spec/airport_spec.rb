require './lib/airport'
require './lib/plane'

describe Airport do

let(:airport){Airport.new}
let(:plane){Plane.new}

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





end