module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise 'Station is full' if full?
    bikes << bike
  end

  def release(bike)
    raise 'Station is empty' if empty?
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def empty?
    bike_count == 0
  end

  def available_bikes
    bikes.reject {|bike| bike.broken }
  end

  def list_broken_bikes
    bikes
  end

  def bike_van
    @bike_van ||= []
  end

  def pickup_bike(broken_bikes)
    bike_van << broken_bikes
  end

  def van_count
    bike_van.count
  end


#  def accept(bike)
#    garage.dock(bike)
#    garage.fix_bikes
#  end

end