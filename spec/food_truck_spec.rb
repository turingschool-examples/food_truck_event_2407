require './lib/item'
require './lib/food_truck'

RSpec.describe 'food_truck' do
    before(:each) do
        food_truck = Food_truck.new("Rocky Mountain Pies")
    end

    describe 'it has a name and inventory' do
        it 'has a name and inventory' do
            expect(@food_truck.name).to eq("Rocky Mountain Pies")
            expect(@food_truck.inventory).to eq({})
        end
    end

    describe 'it can check for stock' do 
        it 'check for stock' do
            expect(@food_truck.stock).to eq(item1, amount)
            expect(@food_truck.stock). to eq(item2, amount)
        end
    end

    describe 'it can take away stock' do
        it'takes away stock' do
            @stock.add_amount(item1, 30)
            @stock.add_amount(item1, 25)
            @stock.add_amount(item2, 12)
        end
    end
end