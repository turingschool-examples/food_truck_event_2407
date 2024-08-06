require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do 
  before(:each) do 
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  it 'exists' do 
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
    expect(@food_truck.inventory).to eq({})
    expect(@food_truck.check_stock).to eq(0)
  end
end