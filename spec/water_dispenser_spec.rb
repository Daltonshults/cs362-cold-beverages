require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative 'spec_helper.rb'


describe 'A water dispenser' do

  context "instantiation and variables" do
    let(:reservoir) {double('reservoir', capacity: 100, current_water_volume: 50)}
    let(:water_dispenser) {WaterDispenser.new(reservoir)}

    it "instantiates" do 
      water_dispenser
    end

    it "respondes to reservoir" do
      expect(water_dispenser).to respond_to(:reservoir)
    end
  end

  context "dispenses water" do
    let(:reservoir) {WaterReservoir.new(100, 100)}
    let(:water_dispenser) {WaterDispenser.new(reservoir)}

    it "dispenses volume the size of the vessel's volume" do
      vessel = double('vessel', name: "Name", volume: 50, level: 0)
      allow(vessel).to receive(:fill).and_return(vessel.volume)
      expect(water_dispenser.dispense(vessel)).to eq(50)
      expect(reservoir.current_water_volume).to eq(50)
    end

    it "dispenses the entire volume of the vessel" do
      vessel = double('vessel', name: "Name", volume: 200, level: 0)
      expect(vessel).to receive(:fill).and_return(vessel.level + reservoir.current_water_volume)
      expect(water_dispenser.dispense(vessel)).to eq(0)
      expect(reservoir.current_water_volume).to eq(0)
    end
  end

end
