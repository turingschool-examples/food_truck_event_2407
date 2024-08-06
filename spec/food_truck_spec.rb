require './lib/food_truck'
require './lib/item'

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

    it '#check_stock' do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

        expect(food_truck.check_stock(item1)).to eq 0
    end

    it '#stock' do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        food_truck.stock(item1, 30)
        
        expect(food_truck.inventory).to eq({item1 => 30})
        expect(food_truck.check_stock(item1)).to eq 30
    end
end