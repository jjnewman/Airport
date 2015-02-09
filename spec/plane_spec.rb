require 'plane'

describe Plane do

let(:plane)        { Plane.new       }
let(:landed_plane) { Plane.new.land! }

it 'has a flying status when created' do
	expect(plane).to be_flying
end

it 'can land' do
	expect(plane.land!).not_to be_flying
end

it 'can take off' do
	expect(landed_plane.take_off!).to be_flying
end

it 'cannot land unless it is flying' do
	expect{landed_plane.land!}.to raise_error 'You are already landed, moron! What have you been smoking?'
end
	

end