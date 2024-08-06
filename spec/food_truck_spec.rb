require './lib/food_truck'
require './lib/item'


RSpec.describe FoodTruck do
    before(:each) do
        @food_truck = FoodTruck.new("Rocky Mountain Pies")
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    end

    describe '#initialize' do
        it 'exists' do
            expect(@food_truck).to be_an_instance_of(FoodTruck)
        end

        it 'has attributes' do
            expect(@food_truck.name).to eq("Rocky Mountain Pies")
            expect(@food_truck.inventory).to eq({})
        end
    end

    describe 'stock' do
        it 'checks stock' do
            expect(@food_truck.check_stock(@item1)).to eq(0)
        end

        it 'stocks items' do
            @food_truck.stock(@item1, 30)
            expect(@food_truck.check_stock(@item1)).to eq(30)
        end
    end
end
