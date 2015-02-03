require 'docking_station'

describe DockingStation do
  let(:bike){double :bike}
  
  it 'should accept a bike' do
    station = DockingStation.new
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end

end