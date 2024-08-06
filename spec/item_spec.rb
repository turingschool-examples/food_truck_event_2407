require './lib/item'
require './lib/food_truck'
require './lib/event'


RSpec.describe Item do
  before(:each) do
    @item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  end

  it "exists" do
    expect(@item).to be_instance_of(Item)
  end

  it "has a name" do
    expect(@item.name).to eq('Peach Pie (Slice)')
  end

  it "has a price" do
    expect(@item.price).to eq(3.75)
  end

  it "shows the price as a float" do
    item_price = Item.new({name: 'Apple Pie (Slice)', price: "$2.50"})
    expect(item_price.price).to eq(2.50)
  end
end