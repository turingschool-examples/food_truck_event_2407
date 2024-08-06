require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        @food_truck = FoodTruck.new("Rocky Mountain Pies")

        @event = Event.new("South Pearl Street Farmers Market")
    end

    describe "initialize" do
        it "exist" do
            expect(@event).to be_an_instance_of Event
        end

        it "has a name" do
            expect(@event.name).to eq "South Pearl Street Farmers Market"
        end

        it "tracks food trucks; starts with none" do
            expect(@event.food_trucks).to eq []
        end
    end

end