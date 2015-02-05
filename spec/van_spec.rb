require "van"
require "bike"
require "docking_station"

describe Van do

	let(:van){Van.new}
	let(:broken_bike){Bike.new.break!}
	let(:station){DockingStation.new(capacity: 20)}

	def fill_broken_bikes(station)

	end

	it "should put a broken bike into the van" do
		station.dock(broken_bike)
		van.dock(station.release(broken_bike))
		expect(van.bike_count).to eq(1)
	end

end