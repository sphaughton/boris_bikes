require './lib/bike_container'
require './lib/bike'
require './lib/van'

class Garage; include BikeContainer

  def initialize(options ={})
    self.capacity=(options.fetch(:capacity, capacity))
  end

  def dock(bike)
    bike.fix!
  end

end