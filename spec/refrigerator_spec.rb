require_relative '../lib/refrigerator'
require_relative 'spec_helper.rb'


describe 'A refrigerator' do
  context "Checking instantiation" do
    let(:chiller) {double('chiller', capacity: 100, temperature: 70, power: :off, contents: [])}
    let(:freezer) {double('freezer', capacity: 100, temperature: 70, power: :off, contents: [])}
    let(:control_panel) {double('control_panel')}
    let(:water_reservoir) {double('waterreservoir', capacity: 10, initial_water_volume: 0)}
    let(:water_dispenser) {double('waterdispenser', reservoir: water_reservoir)}
    let(:refrigerator) {Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)}

    it "instantiates" do
      refrigerator
    end

    it "respondes to chiller" do
      expect(refrigerator).to respond_to(:chiller)
    end

    it "respondes to freezer" do
      expect(refrigerator).to respond_to(:freezer)
    end
    
    it "respondes to control_panel" do
      expect(refrigerator).to respond_to(:control_panel)
    end

    it "respondes to water_dispenser" do
      expect(refrigerator).to respond_to(:water_dispenser)
    end

    it "respondes to water_reservoir" do
      expect(refrigerator).to respond_to(:water_reservoir)
    end
  end

  context "adding items" do
    let(:chiller) {double('chiller', capacity: 100, temperature: 70, power: :off, contents: [])}
    let(:freezer) {double('freezer', capacity: 100, temperature: 70, power: :off, contents: [])}
    let(:control_panel) {double('control_panel')}
    let(:water_reservoir) {double('waterreservoir', capacity: 10, initial_water_volume: 0)}
    let(:water_dispenser) {double('waterdispenser', reservoir: water_reservoir)}
    let(:refrigerator) {Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)}
    
    it "adding item to chiller" do
      item = double('item', volume: 50, name: "name")
      expect(chiller).to receive(:add).and_return(chiller.contents << item)
      expect(refrigerator.chill(item)).to eq(chiller.contents << item)
    end

    it "adding item to chiller" do
      item = double('item', volume: 50, name: "name")
      expect(freezer).to receive(:add).and_return(freezer.contents << item)
      expect(refrigerator.freeze(item)).to eq(freezer.contents << item)
    end

    it "checking total capacity" do
      expect(refrigerator.total_capacity).to eq(200)
    end

    it "checking remaining capacity" do
      expect(freezer).to receive(:remaining_capacity).and_return(100)
      expect(chiller).to receive(:remaining_capacity).and_return(100)
      
      expect(refrigerator.remaining_capacity).to eq(200)
    end

    it "checking plug in" do
      expect(chiller).to receive(:turn_on).and_return(:on)
      expect(freezer).to receive(:turn_on).and_return(:on)

      expect(refrigerator.plug_in).to eq(:on)
    end

    it "checking unplug" do
      expect(chiller).to receive(:turn_off).and_return(:off)
      expect(freezer).to receive(:turn_off).and_return(:off)

      expect(refrigerator.unplug).to eq(:off)
    end

    it "sets the chiller level" do
      expect(chiller).to receive(:set_level).and_return(60)

      expect(refrigerator.set_chiller_level(1)).to eq(60)
    end

    it "set freezer level" do
      expect(freezer).to receive(:set_level).and_return(65)

      expect(refrigerator.set_freezer_level(1)).to eq(65)
    end

    it "check to_s power off" do

      # Setup for remaining capacity
      expect(chiller).to receive(:remaining_capacity).and_return(100)
      expect(freezer).to receive(:remaining_capacity).and_return(100)

      # Set up for total capacity
      expect(chiller).to receive(:capacity).and_return(100)
      expect(freezer).to receive(:capacity).and_return(100)

      # Set up for current_water_volume
      expect(water_reservoir).to receive(:current_water_volume).and_return(20)

      expect(refrigerator.to_s).to eq("Power: off\nStorage: 200 of 200 available\nTemps: Chiller is 70, Freezer is 70\nWater: Reservoir has 20 remaining.\n")

    end

    it "check to_s power on" do

      # Setup for remaining capacity
      expect(chiller).to receive(:remaining_capacity).and_return(100)
      expect(freezer).to receive(:remaining_capacity).and_return(100)

      # Set up for total capacity
      expect(chiller).to receive(:capacity).and_return(100)
      expect(freezer).to receive(:capacity).and_return(100)

      # Set up for current_water_volume
      expect(water_reservoir).to receive(:current_water_volume).and_return(20)
      
      # Set up for plug in
      expect(chiller).to receive(:turn_on).and_return(:on)
      expect(freezer).to receive(:turn_on).and_return(:on)
      
      refrigerator.plug_in
      expect(refrigerator.to_s).to eq("Power: on\nStorage: 200 of 200 available\nTemps: Chiller is 70, Freezer is 70\nWater: Reservoir has 20 remaining.\n")

    end
    
  end
end
