require 'airport'

describe Airport do

let(:airport){Airport.new(capacity: 25)}
let(:plane){double :plane, land!: nil, take_off!: nil}

it 'should allow a capacity to be set on initiation' do
	expect(airport.capacity).to eq(25)
end

it 'can accept a plane for landing' do
	expect(airport.planes.count).to eq(0)
	airport.accept_for_landing(plane)
	expect(airport.planes.count).to eq(1)
end

it 'can release a plane for take-off' do
	airport.accept_for_landing(plane)
	airport.release_for_takeoff(plane)
	expect(airport.planes.count).to eq(0)	
end

it 'should not accept a plane if the airport is full' do
	airport.capacity.times{airport.accept_for_landing(plane)}
	expect{airport.accept_for_landing(plane)}.to raise_error(RuntimeError, 'Airport is full')
end

it 'should not release a plane if the airport is empty' do
	expect{airport.release_for_takeoff(plane)}.to raise_error(RuntimeError, 'Airport is empty')
end

it 'should not accept a plane if the weather is stormy' do
	(expect{airport.accept_for_landing(plane)}.to raise_error(RuntimeError, 'Weather is stormy')) if airport.stormy?
end

it 'should not release a plane if the weather is stormy' do
	(expect{airport.release_for_takeoff(plane)}.to raise_error(RuntimeError, 'Weather is stormy')) if airport.stormy?
end

end