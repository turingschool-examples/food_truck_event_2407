require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it "exists" do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it "has attributes" do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "can add inventory" do 
    expect(@food_truck.inventory).to eq({})
  end

  it "can check if an item is in stock" do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it "can stock a certain number of each item and check the inventory" do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.inventory).to eq({@item1 => 30})
  end

  it "can continue to add to the stock of items" do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    expect(@food_truck.check_stock(@item1)).to eq(55)

    @food_truck.stock(@item2, 12)
    expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
  end
end 