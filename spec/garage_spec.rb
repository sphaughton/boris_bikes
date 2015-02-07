require './lib/garage'

describe Garage do

let(:garage){Garage.new(capacity: 100)}
let(:bike){double :working_bike, broken: false}
let(:broken_bike){double :broken_bike, broken: true, fix!: :working_bike}

	it "should be able to fix broken bikes" do
		expect(broken_bike).to receive(:fix!)
		garage.dock(broken_bike)
	end

end