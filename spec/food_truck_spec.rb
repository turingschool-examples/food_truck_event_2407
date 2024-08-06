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
end