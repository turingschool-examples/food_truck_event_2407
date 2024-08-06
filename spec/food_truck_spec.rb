require 'spec_helper'

RSpec.describe Item do
    before(:each) do
        @food_truck = FoodTruck.new("Rocky Mountain Pies")
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

    describe '#check_stock()' do

    end

    describe '#stock()' do

    end
end