require_relative '../lib/water_reservoir'
require_relative 'spec_helper.rb'


describe 'A water reservoir' do
  
  context "instantiation and variables" do
    let(:water_reservoir) {WaterReservoir.new}

    it "instantiates" do
      water_reservoir
    end

    it "respondes to capacity" do
      expect(water_reservoir).to respond_to(:capacity)
    end
  end

  context "checking the water volume" do
    let(:empty_reservoir) {WaterReservoir.new(10, 0)}
    let(:full_reservoir) {WaterReservoir.new(10, 10)}

    it "returns true when empty" do
      expect(empty_reservoir).to be_empty
    end

    it "returns false when not empty" do
      expect(full_reservoir).to_not be_empty
    end

    it "fills an empty reservoir" do 
      expect(empty_reservoir.fill).to eq(10)
    end

    it "drains an full reservoir" do
      expect(full_reservoir.drain(5)).to eq(5)
    end
  end

end
