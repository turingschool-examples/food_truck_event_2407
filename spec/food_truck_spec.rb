require './lib/item'
require './lib/food_truck'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe FoodTruck do
    before(:each) do
        @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
        @food_truck3 = FoodTruck.new("Palisade Peach Shack")

        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
        
    end

    describe 'Initialize' do
        it 'exists' do
            expect(@food_truck1).to be_an_instance_of(FoodTruck)
            expect(@food_truck2).to be_an_instance_of(FoodTruck)
            expect(@food_truck3).to be_an_instance_of(FoodTruck)
        end

        it 'has a name' do
            expect(@food_truck1.name).to eq("Rocky Mountain Pies")
            expect(@food_truck2.name).to eq("Ba-Nom-a-Nom")
            expect(@food_truck3.name).to eq("Palisade Peach Shack")
        end

        it 'has an inventory' do
            expect(@food_truck1.inventory).to eq({})
            expect(@food_truck2.inventory).to eq({})
            expect(@food_truck3.inventory).to eq({})
        end
    end

    describe 'inventory' do
        it 'checks the inventory of an item' do
            expect(@food_truck1.check_stock(@item1)).to eq(0)
            expect(@food_truck2.check_stock(@item1)).to eq(0)
            expect(@food_truck3.check_stock(@item1)).to eq(0)
        end

        it 'can stock inventory' do
            @food_truck1.stock(@item1, 30)
            expect(@food_truck1.check_stock(@item1)).to eq(30)
        end
    end

    describe 'potential revenue' do
        it 'returns sum of items sold' do
            @food_truck1.stock(@item1, 35)
            @food_truck1.stock(@item2, 7)
            @food_truck2.stock(@item4, 50)
            @food_truck2.stock(@item3, 25)
            @food_truck3.stock(@item1, 65)

            expect(@food_truck1.potential_revenue).to eq((@item1.price * 35) + (@item2.price * 7))
            expect(@food_truck2.potential_revenue).to eq((@item4.price * 50) + (@item3.price * 25))
            expect(@food_truck3.potential_revenue).to eq(@item1.price * 65)
        end
    end
end