require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @food_truck = FoodTruck.new("Rocky Mountain Pies")

    end

    describe "initialize" do
        it 'exists' do
            expect(@food_truck).to be_an_instance_of FoodTruck
        end

        it 'has a name' do
            expect(@food_truck.name).to eq("Rocky Mountain Pies")
        end

        it "starts with empty inventory" do
            expect(@food_truck.inventory).to eq({})
        end
    end

    describe "check_stock" do
        it "checks if an item in stock, returns 0 if none" do
            expect(@food_truck.check_stock(@item1)).to eq 0
        end
    end

    describe "stock" do
        it "stocks the inventory" do
            @food_truck.stock(@item1,30)
            @food_truck.stock(@item1,25)

            expect(@food_truck.check_stock(@item1)).to eq 55
        end
    end
end