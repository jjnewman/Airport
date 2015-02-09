require 'airport'

describe Airport do

let(:luton) { Airport.new} 
let(:f16)   { double :plane }

	context 'when created' do
		it 'has no planes' do
			expect(luton.grounded_planes_count).to eq 0
		end

		it 'has a default capacity' do
      expect(luton.capacity).to eq Airport::DEFAULT_CAPACITY
    end

		it 'can have a custom capacity' do
			heathrow = Airport.new(capacity: 25)
      expect(heathrow.capacity).to eq(25)
		end
  end

  it 'can land a plane' do
    expect(f16).to receive(:land!)
    luton.add_plane(f16)
  end

  it 'has that plane after landing it' do
    allow(f16).to receive(:land!)

    luton.add_plane(f16)

    expect(luton.grounded_planes_count).to eq 1
  end

  context 'weather conditions' do
    context 'on sunny weather' do 
      
    end

    context 'on stormy weather' do
      
    end
  end
 
end