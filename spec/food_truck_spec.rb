require './lib/item'
require './lib/food_truck'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe FoodTruck do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        @food_truck = FoodTruck.new("Rocky Mountain Pies")
    end
    
    describe 'initialize' do
        it 'exists' do
            expect(@food_truck).to be_a FoodTruck
            expect(@food_truck.inventory).to eq({})
        end
    end

    describe '#check_stock' do
        it 'can sheck the stock on an item' do
            expect(@food_truck.check_stock(@item1)).to eq 0
        end
    end

    describe '#stock' do
        it 'can stock an item with an amount' do 
            @food_truck.stock(@item1, 30)

            expect(@food_truck.check_stock(@item1)).to eq 30
            expect(@food_truck.inventory).to eq({
                @item1 => 30
            })
        end

        it 'returns zero if there is no it or the item is out of stock' do
            expect(@food_truck.check_stock(@item2)).to eq 0
            expect(@food_truck.inventory).to eq({})
        end
    end
end