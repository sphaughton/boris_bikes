require './lib/docking_station'

describe DockingStation do
  
  let(:bike){double :working_bike, broken: false}
  let(:broken_bike){double :broken_bike, broken: true}
  let(:station){DockingStation.new(capacity: 20)}

  it 'should accept a bike' do
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end

  it 'should release a bike' do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

  it "should know when it's full" do
    20.times { station.dock(bike) }
    expect{ station.dock(bike) }.to raise_error(RuntimeError, 'Station is full')
  end

  it "should not release a bike if it's empty" do
    0.times { station.dock(bike) }
    expect{station.release(bike)}.to raise_error(RuntimeError, 'Station is empty')
  end

  it "should provide the list of available bikes" do
    station.dock(bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([bike])
  end

  it "should provide the list of broken bikes" do
    station.dock(broken_bike)
    expect(station.broken_bikes).to eq([broken_bike])
  end

end