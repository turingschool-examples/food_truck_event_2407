require 'spec_helper'

RSpec.describe Item do
    before(:each) do
        @event = Event.new("South Pearl Street Farmers Market")  
        @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
        @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    end

    describe '#initialize()' do
        it 'exists' do
            expect(@event).to be_a(Event)
        end

        it 'has a name' do
            expect(@event.name).to eq('South Pearl Street Farmers Market')
        end

        it 'has an empty food_trucks array' do
            expect(@event.food_trucks).to eq([])
        end
    end

    describe '#add_food_truck()' do
        it 'adds the specified food truck objects to the food_trucks array' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)
            @event.add_food_truck(@food_truck3) # CHECK FOR DUPLICATE PREVENTION


            expected = [@food_truck1, @food_truck2, @food_truck3]

            expect(@event.food_trucks).to eq(expected)
        end
    end

    describe 'food_truck_names' do
        it 'returns an array of food truck name in the food_trucks array' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

            expect(@event.food_truck_names).to eq(expected)
        end
    end
end