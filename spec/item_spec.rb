require_relative '../lib/item'
require_relative 'spec_helper.rb'


describe 'An item of food or a beverage' do
  context "checking instantiation" do
    let(:item) {Item.new("Name", 100)}
    it "instantiates" do
      item
    end

    it "has a name" do
      expect(item).to respond_to(:name)
    end

    it "has a volume" do
      expect(item).to respond_to(:volume)
    end

    it "has a name of 'name'" do
      expect(item.name).to eq("Name")
    end

    it "has a volume of '100'" do
      expect(item.volume).to eq(100)
    end
  end

end
