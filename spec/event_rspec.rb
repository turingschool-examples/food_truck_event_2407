require './lib/item'
require './lib/food_truck'
require './lib/event'

Rspec.describe 'event' do
    before(:each) do
        event = Event.new("South Pearl Street Farmers Market")
    end

    describe 'event name' do
        it 'has a name' do
            expect(@event.name).to eq('South Pearl Street Farmers Market')
        end
    end

    describe 'event has food trucks' do
        it 'food trucks present' do
            food_truck1 = Food_truck.new("Rocky Mountain Pies")
            expect(@event.food_truck). to eq([])
        end
    end
    

    describe 'food truck