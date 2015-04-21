require 'weather'

class WeatherClass; include Weather; end

describe Weather do

let(:weather){WeatherClass.new}

it 'should not be sunny and stormy at the same time' do
	expect(weather).not_to be_stormy if weather.current_condition!.sunny?
end
end

