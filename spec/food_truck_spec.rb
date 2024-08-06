require 'spec_helper'

RSpec.describe Item do
    before(:each) do
        @food_truck = FoodTruck.new("Rocky Mountain Pies")
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
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
        end
    end

    describe '#check_stock()' do
        it 'returns quantity of specified item in inventory' do

        end

        it 'returns 0 if the specified item is not in stock' do

        end
    end
end