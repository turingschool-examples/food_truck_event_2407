require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe 'event' do
    before(:each) do
        event = Event.new("South Pearl Street Farmers Market")
    end

    describe 'event name' do
        it 'has a name' do
            expect(@event.name).to eq('South Pearl Street Farmers Market')
            expect(@event.food_trucks).to eq([])
        end
    end

    describe 'event has food trucks' do
        it 'food trucks present' do
            food_truck1 = Food_truck.new("Rocky Mountain Pies")
            food_truck2 = Food_truck.new("Ba-Nom-a-Nom")
            food_truck3 = FoodTruck.new("Palisade Peach Shack") 

            expect(@event.food_truck1).to eq([])
            expect(@event.food_truck2).to eq([])
            expect(@event.food_truck3).to eq([])
        end
    end
    
    describe 'it can add food trucks' do
        it 'adds food trucks' do
            expect(event.add_food_truck).to eq(food_truck1)
            expect(event.add_food_truck).to eq(food_truck2)
            expect(event.add_food_truck).to eq(food_truck3)
        end
    end

    describe 'it can sell items' do
        it 'sells items' do
            
        end
    end