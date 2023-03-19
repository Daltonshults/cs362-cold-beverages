require_relative '../lib/water_dispenser'
require_relative 'spec_helper.rb'


describe 'A water dispenser' do

  context "instantiation and variables" do
    let(:water_dispenser) {WaterDispenser.new(100)}

    it "instantiates" do 
      water_dispenser
    end

    it "respondes to reservoir" do
      expect(water_dispenser).to respond_to(:reservoir)
    end
  end

  context "dispenses water" do
    let(:reservoir) {double('resevoir', capacity: 100, current_water_volume: 50)}
    let(:water_dispenser) {WaterDispenser.new(reservoir)}

    it "dispenses volume the size of the vessel's volume" do
      expect(reservoir).to receive(:drain).and_return(50)
      vessel = double('vessel', name: "Name", volume: 50, level: 0)
      allow(vessel).to receive(:fill).and_return(vessel.volume)
      expect(water_dispenser.dispense(vessel)).to eq(50)
    end

    it "dispenses the entire volume of the vessel" do
      expect(reservoir).to receive(:drain).and_return(0)
      vessel = double('vessel', name: "Name", volume: 100, level: 0)
      expect(vessel).to receive(:fill).and_return(vessel.level + reservoir.current_water_volume)

      expect(water_dispenser.dispense(vessel)).to eq(0)
    end
  end

end
