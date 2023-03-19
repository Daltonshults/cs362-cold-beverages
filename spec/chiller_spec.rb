require_relative '../lib/chiller'
require_relative 'spec_helper.rb'

describe 'A chiller' do

  context "checking instance variable existence" do
    let(:chiller) {Chiller.new}
    
    it "check instantiation" do
      chiller
    end

    it "has a capacity" do
      expect(chiller).to respond_to(:capacity)
    end

    it "capacity equals 100" do
      expect(chiller.capacity).to eq(100)
    end

    it "has a room temperature" do
      expect(chiller).to respond_to(:temperature)
    end

    it "has the temperature set to 70 initially" do
      expect(chiller.temperature).to eq(70)
    end

    it "initially has a full remaining cappacity" do
      expect(chiller.remaining_capacity).to eq(100)
    end
  end

  context "changing the cappacity by adding an item" do
    
    chiller = Chiller.new
    it {
      item = double('item', volume: 50, name: "name")
      chiller.add(item)
      expect(chiller.remaining_capacity).to eq(50)
    }
  end

  context "checking power off/on" do
    chiller = Chiller.new

    it "Turns the power on" do
      expect(chiller.turn_on).to eq(:on)
    end

    it "Turns the power off" do
      expect(chiller.turn_off).to eq(:off)
    end
  end

  context "Setting the level" do
    chiller = Chiller.new
    it "expect chiller level 1 to eq 65" do
      expect(chiller.set_level(1)).to eq(65)
    end
  end

end
