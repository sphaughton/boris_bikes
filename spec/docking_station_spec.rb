require 'docking_station'

describe DockingStation do
  let(:bike){Bike.new}
  let(:station){DockingStation.new(capacity: 20)}

  it 'should accept a bike' do
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end

  it 'should release a bike' do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

  it "should know when it's full" do
    expect(station).not_to be_full
    fill_station(station)
    expect(station).to be_full
  end

  it "should not accept a bike when it's full" do
    fill_station(station)
    expect{ station.dock(bike) }.to raise_error(RuntimeError, 'Station is full')
  end

  it "should not accept a bike if it's empty" do
    empty_station(station)
    expect{station.release(bike)}.to raise_error(RuntimeError, 'Station is empty')
  end

  def empty_station(station)
    0.times { station.dock(Bike.new) }
  end

  def fill_station(station)
    20.times { station.dock(Bike.new) }
  end

  it "should provide the list of available bikes" do
    bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    station.dock(bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([bike])
  end

  it "should provide the list of broken bikes" do
    broken_bike = Bike.new
    broken_bike.break!
    station.dock(broken_bike)
    expect(station.list_broken_bikes).to eq([broken_bike])
  end


end