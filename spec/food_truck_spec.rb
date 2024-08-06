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

    it 'stocks inventory together' do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        food_truck.stock(item1, 30)
        expect(food_truck.check_stock(item1)).to eq 30
        food_truck.stock(item1, 25)

        expect(food_truck.inventory).to eq({item1 => 55})
    end

    it 'stocks seperate items in inventory' do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        food_truck.stock(item1, 30)
        food_truck.stock(item1, 25)
        food_truck.stock(item2, 12)
    
        expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})        
    end

    it '#potential_revenue' do
        food_truck = FoodTruck.new("Rocky Mountain Pies")
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        food_truck.stock(item1, 30)
        food_truck.stock(item1, 25)
        food_truck.stock(item2, 12)

        expect(food_truck.potential_revenue).to eq(236.25)
    end
end