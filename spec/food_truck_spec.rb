require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
    before(:each) do
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
end