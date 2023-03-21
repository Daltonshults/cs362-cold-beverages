require_relative '../lib/vessel'
require_relative 'spec_helper.rb'

describe 'A vessel for holding liquid' do

  it 'has a name and volume' do
    vessel = Vessel.new("FAKE", 100)
    expect(vessel).to respond_to(:name)
    expect(vessel).to respond_to(:volume)
  end

  it 'is initially empty' do
    #skip
    vessel = Vessel.new('FAKE', 100)
    expect(vessel).to be_empty
  end

  it 'is no longer empty when we fill it' do
    vessel = Vessel.new('FAKE', 100)
    vessel.fill
    expect(vessel).to_not be_empty
  end

  it "can't overfill the vessel" do
    vessel = Vessel.new("Fake", 100)
    vessel.fill(120)
    expect(vessel.volume).to eq(100)
  end
end
