require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
    before(:each) do
        @food_truck = FoodTruck.new("Rocky Mountain Pies")
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
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
    end
end