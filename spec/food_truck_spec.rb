require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
    before(:each) do
        @food_truck = FoodTruck.new("Rocky Mountain Pies")
    end

    it 'exists' do
        expect(@food_truck).to be_a FoodTruck
    end

    it 'has a name and inventory(empty array)' do
        expect(@food_truck.name).to eq("Rocky Mountain Pies")
        expect(@food_truck.inventory).to eq({})
    end
end