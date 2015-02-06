require './lib/bike_container'

class Van

	VAN_DEFAULT_CAPACITY = 10

	include BikeContainer

	def bike_van
    @bike_van ||= []
  end

  def dock_bikes(broken_bike)
  	raise 'Van is full' if van_full?
  	bike_van << broken_bike
  end

  def van_count
    bike_van.count
  end

  def van_full?
   	bike_van.count == VAN_DEFAULT_CAPACITY
  end

end