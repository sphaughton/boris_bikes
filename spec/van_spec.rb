require "van"
require "bike"
require "docking_station"

describe Van do

	let(:van){Van.new}
	let(:broken_bikes){Bike.new.break!}
	let(:station){DockingStation.new(capacity: 20)}

	it "should put a broken bike into the van" do
		expect(van.bike_count).to eq(0)
		station.dock(broken_bikes)
		van.pickup_bike(broken_bikes)
		expect(van.van_count).to eq(1)
	end

end