require "./lib/van"
require "./lib/bike"
require "./lib/docking_station"

describe Van do

  let(:van){Van.new}
  let(:broken_bike){double :broken_bike, broken: true}
  let(:station){DockingStation.new}

  it "should put a broken bike into the van" do
    station.dock(broken_bike)
    van.dock(station.release(broken_bike))
    expect(van.bike_count).to eq(1)
  end

  it "should know when it's full" do
    10.times { van.dock_bikes(broken_bike) }
    expect{ van.dock_bikes(broken_bike) }.to raise_error(RuntimeError, 'Van is full')
  end

end