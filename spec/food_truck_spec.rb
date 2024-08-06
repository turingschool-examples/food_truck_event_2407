require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe FoodTruck do
    before(:each) do
        @food_truck = FoodTruck.new("Rocky Mountain Pies")
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    end

    it 'exists' do
        expect(@food_truck).to be_an_instance_of FoodTruck
    end

    it 'has a name and inventory' do
        expect(@food_truck.name).to eq("Rocky Mountain Pies")
        expect(@food_truck.inventory).to eq({})
    end

    it 'shows stock of an item' do
        expect(@food_truck.check_stock(@item1)).to eq(0)

        @food_truck.stock(@item1, 30)
        expect(@food_truck.inventory).to eq({@item1 => 30})

        @food_truck.stock(@item1, 25)
        expect(@food_truck.check_stock(@item1)).to eq(55)

        @food_truck.stock(@item2, 12)
        expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
    end

    it 'is the total of the stock times the price' do
        @food_truck.stock(@item1, 30)
        @food_truck.stock(@item2, 12)

        expect(@food_truck.potential_revenue).to eq(142.50)
    end
end