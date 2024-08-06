require './lib/event'
require './lib/item'
require './lib/food_truck'


RSpec.describe Event do
    before(:each) do
        @event = Event.new("South Pearl Street Farmers Market")
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
        @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")    
        @food_truck3 = FoodTruck.new("Palisade Peach Shack")    
    end

    it 'exists and has attributes' do
        expect(@event).to be_a(Event)
        expect(@event.name).to eq("South Pearl Street Farmers Market")
        expect(@event.food_trucks).to eq([])
    end

    it '#add_food_truck adds food trucks to the @food_trucks array' do
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.food_trucks).to eq [@food_truck1, @food_truck2, @food_truck3]
    end

    it "#add_food_truck_names returns the name of the truck in an array" do
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]) 
    end

    it '#food_trucks_that_sell finds/lists food trucks that sell a particular item' do
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)  

        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)

        @food_truck3.stock(@item1, 65)

        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
        expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end

    it '#sorted_item_list returns an array of all FoodTruck item names as a string w/ no duplicates' do
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)  

        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)

        @food_truck3.stock(@item1, 65)

        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.sorted_item_list).to eq(['Apple Pie (Slice)', "Banana Nice Cream", 'Peach Pie (Slice)', "Peach-Raspberry Nice Cream"])
    end

    it '#total_inventory returns a hash of total inventory that reports the available inventory of all items sold at the event' do
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)  

        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)

        @food_truck3.stock(@item1, 65)

        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expected = {
            @item1 => {
                quantity: 100,
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
        }

        expect(@event.total_inventory).to eq(expected)
    end

    it '#overstocked_items returns an array of items sold by more than 1 food truck AND the total quantity is greater than 50' do
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)  

        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)

        @food_truck3.stock(@item1, 65)

        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.overstocked_items).to eq([@item1])
        expect(@event.overstocked_items).not_to eq([@item4])
    end
end
