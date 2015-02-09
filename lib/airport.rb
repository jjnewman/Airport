require_relative 'weather'

class Airport
  attr_writer :capacity
  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    @grounded_planes = []
    self.capacity = options.fetch(:capacity, capacity)
  end

  def grounded_planes_count
    @grounded_planes.count
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY 
  end

  def add_plane(plane)
    @grounded_planes << plane.land!
  end

end