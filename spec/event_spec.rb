require './lib/event'
require './lib/food_truck'
require './lib/item'

RSpec.describe Event do
    it 'exists' do
        expect(Event.new("South Pearl Street Farmers Market")).to be_a Event
    end

    it 'has attributes' do
        event = Event.new("South Pearl Street Farmers Market")

        expect(event.name).to eq "South Pearl Street Farmers Market"
        expect(event.food_trucks).to eq([])
    end

    describe "methods" do
        before(:each) do
            @event = Event.new("South Pearl Street Farmers Market")
            @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
            @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")  
            @food_truck3 = FoodTruck.new("Palisade Peach Shack")  
            @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

            @food_truck1.stock(@item1, 35)
            @food_truck1.stock(@item2, 7) 
            @food_truck2.stock(@item3, 25)
            @food_truck2.stock(@item4, 50) 
            @food_truck3.stock(@item1, 65)
        end
        
        it '#add_food_truck' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
        end

        it '#food_truck_names' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
        end

        it '#food_truck_that_sell' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_truck_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
            expect(@event.food_truck_that_sell(@item4)).to eq([@food_truck2])
        end

        it '#sorted_item_list' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.sorted_item_list).to eq([@item2.name, @item4.name, @item1.name, @item3.name])
        end

        it '#overstocked_items' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.overstocked_items).to eq([@item1])

            @food_truck3.stock(@item4, 5)

            expect(@event.overstocked_items).to eq([@item1, @item4])
        end

        it '#total_inventory' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expected = {
                @item1 => {quantity: 100, food_trucks: [@food_truck1, @food_truck3]},
                @item2 => {quantity: 7, food_trucks: [@food_truck1]},
                @item3 => {quantity: 25, food_trucks: [@food_truck2]},
                @item4 => {quantity: 50, food_trucks: [@food_truck2]}
            }
            expect(@event.total_inventory).to eq(expected)
        end

        it 'has #date' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            @event.set_date(4, 20, 2020)
            expect(@event.date).to eq("04/20/2020")
        end

        it 'can #sell' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)
            expect(@event.sell(@item2, 35)).to eq false
            expect(@event.sell(@item1, 35)).to eq true
        end

        it 'updates the inventory of total and individual trucks' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)
            @event.sell(@item1, 35)
            
            expected = {
                @item1 => {quantity: 65, food_trucks: [@food_truck1, @food_truck3]},
                @item2 => {quantity: 7, food_trucks: [@food_truck1]},
                @item3 => {quantity: 25, food_trucks: [@food_truck2]},
                @item4 => {quantity: 50, food_trucks: [@food_truck2]}
            }
            # expect(@event.total_inventory).to eq(expected)
            # require 'pry';binding.pry
            expect(@event.food_trucks[0].inventory[@item1]).to eq 0
            expect(@event.food_trucks[1].inventory[@item1]).to eq 65
        end
    end
end