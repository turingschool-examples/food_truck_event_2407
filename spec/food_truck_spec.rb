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

            expect(item1).to eq({name: 'Peach Pie (Slice)', price: "$3.75"})
            expect(item2).to eq({name: 'Apple Pie (Slice)', price: '$2.50'})
        end
    end
end