require './lib/food_truck'

RSpec.describe FoodTruck do
    it 'exists' do
        expect(FoodTruck.new("Rocky Mountain Pies")).to be_a FoodTruck
    end

    it 'has attributes from parameters' do
        food_truck = FoodTruck.new("Rocky Mountain Pies")

        expect(food_truck.name).to eq "Rocky Mountain Pies"
    end

    it 'has attributes created empty from initialize' do
        food_truck = FoodTruck.new("Rocky Mountain Pies")

        expect(food_truck.inventory).to eq({})
    end
end