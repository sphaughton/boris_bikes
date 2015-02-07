require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike) {double :working_bike, broken: false}
	let(:broken_bike) {double :broken_bike, broken: true}
	let(:holder) { ContainerHolder.new }

	it 'should accept a bike' do
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it 'should release a bike' do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should not accept a bike when it's full" do
		10.times {holder.dock(bike)}
		expect{holder.dock(bike)}.to raise_error(RuntimeError, "Station is full")
	end

	it "should provide a list of available bikes" do
    holder.dock(bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([bike])
  end

  it "should provide a list of broken bikes" do
  	holder.dock(broken_bike)
  	expect(holder.broken_bikes).to eq([broken_bike])
  end
end