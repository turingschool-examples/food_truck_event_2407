require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
    before :all do
        it "exists" do
            event = Event.new
            expect(event).to be_an_instance_of Event
        end

        it 'has a name' do
            event = Event.new("South Pearl Street Farmers Market")
            expect(event.name).to be "South Pearl Street Farmers Market"
        end

        it 'has food trucks' do
            food_truck1 = FoodTruck.new("Rocky Mountain Pies")
            food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
            food_truck3 = FoodTruck.new("Palisade Peach Shack") 
            expect(event.food_trucks).to be "Rocky Mountain Pies"
            expect(event.food_trucks).to be "Ba-Nom-a-Nom"
            expect(event.food_trucks).to be "Palisade Peach Shack"
        end

        it 'can add food trucks' do
            # event.add_food_truck(food_truck1)
            # event.add_food_truck(food_truck2)
            # event.add_food_truck(food_truck3)
            food_truck1 = FoodTruck.new("Rocky Mountain Pies")
            food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
            food_truck3 = FoodTruck.new("Palisade Peach Shack") 
        end
    end
end