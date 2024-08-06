require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do 
  before(:each) do 
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do
    expect(@food_truck).to be_an_instance_of(FoodTruck)
  end

  it 'has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'has an empty inventory by default' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check stock for an item' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'stocks items' do 
    @food_truck.stock(@item1, 30)
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end
end