require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
    before :all do
        it 'exists' do
            food_truck = FoodTruck.new
            expect(food_truck).to be_an_instance_of FoodTruck
        end

        it 'has items' do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

            expect(item1).to eq({name: 'Peach Pie (Slice)', price: "$3.75"})
            expect(item2).to eq({name: 'Apple Pie (Slice)', price: '$2.50'})
            expect(item3).to eq({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            expect(item4).to eq({name: "Banana Nice Cream", price: "$4.25"})
        end

        it 'has a name' do
            food_truck = FoodTruck.new("Rocky Mountain Pies")
            
            expect(food_truck.name).to be "Rocky Mountain Pies"
        end

        it 'has an inventory' do
            expect(food_truck.inventory).to eq({})
        end

        it 'stocks items' do
            food_truck1.stock(item1, 35) 
            food_truck1.stock(item2, 7)
            food_truck2.stock(item4, 50)
            food_truck2.stock(item3, 25)
            food_truck3.stock(item1, 65)
        end

        it 'can add stock' do

        end

        it 'can check stock' do

        end

        it 'can calculate potential revenue' do
            expect(food_truck1.potential_revenue).to eq(148.75)
            expect(food_truck2.potential_revenue).to eq(345.00)
            expect(food_truck3.potential_revenue).to eq(243.75)
        end
    end
end