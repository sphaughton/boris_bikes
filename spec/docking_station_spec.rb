require 'docking_station'

describe DockingStation do
  let(:bike){double :working_bike1, broken?: false}
  let(:broken_bike){double :broken_bike, broken?: true}
  let(:bike_two){double :working_bike2}
  let(:station){DockingStation.new(capacity: 2)}

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
    station.dock(bike)
    station.dock(bike_two)
    expect(station).to be_full
  end

  it "should not accept a bike when it's full" do
    tiny_station = DockingStation.new(capacity: 1)
    tiny_station.dock(bike)
    expect{ tiny_station.dock(bike_two) }.to raise_error(RuntimeError, 'Station is full')
  end

  it "should provide the list of available bikes" do
    station.dock(bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([bike])
  end

end