require_relative '../lib/freezer'
require_relative 'spec_helper.rb'


describe 'A freezer' do
  
  context "Checking instantiation" do
    let(:freezer) {Freezer.new}

    it "instantiates" do
      freezer
    end

    it "checking response of capacity" do
      expect(freezer).to respond_to(:capacity)
    end

    it "checking response of temperature" do
      expect(freezer).to respond_to(:temperature)
    end
  end

  context "turning power on or off" do
    let(:freezer) {Freezer.new}

    it "turns the freezer on" do
      expect(freezer.turn_on).to eq(:on)
    end

    it "turns the freezer off" do
      expect(freezer.turn_off).to eq(:off)
    end
  end

  context "changing capacity of freezer" do
    let(:freezer) {Freezer.new}

    it "adding an item with capacity of 50" do
      item = double('item', volume: 50, name: "name")
      freezer.add(item)
      expect(freezer.remaining_capacity).to eq(50)
    end
  end

  context "setting the level of a freezer" do
    let(:freezer) {Freezer.new}

    it "setting level to 1" do
      expect(freezer.set_level(1)).to eq(60)
    end
  end
  
end
