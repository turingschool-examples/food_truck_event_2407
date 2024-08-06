require 'spec_helper'

RSpec.describe Item do
    before(:each) do
        @food_truck = FoodTruck.new("Rocky Mountain Pies")
        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
        @food_truck3 = FoodTruck.new("Palisade Peach Shack")
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    end

    describe '#initialize()' do
        it 'exists' do
            expect(@food_truck).to be_a(FoodTruck)
        end

        it 'has a name' do
            expect(@food_truck.name).to eq("Rocky Mountain Pies")
        end

        it 'has an empty inventory hash' do
            expect(@food_truck.inventory).to eq({})
        end
    end

    describe '#stock()' do
        it 'adds item and quantity as KVP to inventory hash' do
            expect(@food_truck.inventory).to eq({})
            @food_truck.stock(@item1, 30)

            expect(@food_truck.inventory).to eq({@item1 => 30})

            @food_truck.stock(@item1, 50) #CAN UPDATE EXISITING KEYS
            expect(@food_truck.inventory).to eq({@item1 => 80})

            @food_truck.stock(@item2, 50) #CAN HOLD MULTIPLE KVPs

            expect(@food_truck.inventory).to eq({@item1 => 80 , @item2 => 50})
        end
    end

    describe '#check_stock()' do
        it 'returns quantity of specified item in inventory' do
            @food_truck.stock(@item1, 30)
            @food_truck.stock(@item2, 50)
            expect(@food_truck.check_stock(@item1)).to eq(30)
            expect(@food_truck.check_stock(@item2)).to eq(50)
        end

        it 'returns 0 if the specified item is not in stock' do
            expect(@food_truck.inventory).to eq({})
            expect(@food_truck.check_stock(@item1)).to eq(0)
        end
    end

    describe '#potential_revenue' do
        it 'returns a float repersenting the total potential revenue based on the sum of all their items price * quantity.' do
            @food_truck.stock(@item1, 35)
            @food_truck.stock(@item2, 7)
            @food_truck2.stock(@item3, 25)
            @food_truck2.stock(@item4, 50)
            @food_truck3.stock(@item1, 65)

            expect(@food_truck.potential_revenue).to eq(148.75)
            expect(@food_truck2.potential_revenue).to eq(345.00)
            expect(@food_truck3.potential_revenue).to eq(243.75)
        end
    end
end