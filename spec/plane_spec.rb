require './lib/plane'

describe Plane do

let(:plane){Plane.new}

it 'has a flying status when created' do
	expect(plane).to be_flying
end

it 'should have a flying status after taking off' do
	expect(plane.take_off!).to be_flying
end

it 'should not have a flying status after landing' do
	expect(plane.land!).not_to be_flying
end
	
end