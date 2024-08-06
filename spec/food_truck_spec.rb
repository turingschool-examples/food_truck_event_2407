require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

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

        it "can stock different items" do
            @food_truck.stock(@item1,30)
            @food_truck.stock(@item2,25)

            expect(@food_truck.inventory).to eq({@item1 => 30, @item2 => 25})
        end
    end

    describe "potential_revenue" do
        it "returns the potential revenue of all items" do
            @food_truck.stock(@item1,30) # 112.5
            @food_truck.stock(@item2,25) # 62.6

            expect(@food_truck.potential_revenue).to eq 175
        end
    end

    describe "list items" do
        it "returns a list of all item names for sale" do
            @food_truck.stock(@item1,30)
            @food_truck.stock(@item2,25)

            expect(@food_truck.list_items).to eq([@item1.name, @item2.name])
        end
    end

end