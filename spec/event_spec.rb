require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'date'

RSpec.describe Event do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        @food_truck1.stock(@item1, 35) 
        @food_truck1.stock(@item2, 7)

        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)
        
        @food_truck3 = FoodTruck.new("Palisade Peach Shack")
        @food_truck3.stock(@item1, 65)     


        allow(Date).to receive(:today).and_return(Date.new(2023, 2, 24))
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

        it "has a date" do
            expect(@event.date).to eq("24/02/2023")
        end
    end

    describe "add_food_truck" do
        it "adds food trucks to an event" do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
        end
    end

    describe "food_truck_names" do
        it "returns all the names of the food trucks for an event" do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
        end
    end

    describe "food_trucks_that_sell" do
        it "returns food all food trucks that sell a specified item" do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_trucks_that_sell(@item1)).to eq [@food_truck1, @food_truck3]
            expect(@event.food_trucks_that_sell(@item4)).to eq [@food_truck2]
        end
    end

    describe "sorted_item_list" do
        it "returns all alphabetically sorted array of all FoodTruck items names with no duplicates" do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.sorted_item_list).to eq([
                "Apple Pie (Slice)",
                "Banana Nice Cream",
                "Peach Pie (Slice)",
                "Peach-Raspberry Nice Cream"
            ])
        end
    end

    describe "total_inventory" do
        it "returns an array with nested array containing food_Trucks and quantity" do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.total_inventory).to eq ({
                @item1 => {
                  quantity: 100, # 35 + 65 = 100
                  food_trucks: [@food_truck1, @food_truck3]
                },
                @item2 => {
                  quantity: 7,
                  food_trucks: [@food_truck1]
                },
                @item3 => {
                  quantity: 25, 
                  food_trucks: [@food_truck2]
                },
                @item4 => {
                  quantity: 50, 
                  food_trucks: [@food_truck2]
                }
              })
        end
    end

    describe "overstocked_items" do
        it "returns an array of all overstocked items" do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.overstocked_items).to eq([@item1])
        end
        
        it "returns only items that are above 50 and sold my multiple food_trucks" do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)
            @food_truck1.stock(@item2, 70)

            expect(@event.overstocked_items).to eq([@item1])

            @food_truck2.stock(@item2, 5)
            expect(@event.overstocked_items).to eq([@item1, @item2])
        end
    end
end