require 'spec_helper'

RSpec.describe Item do
    before(:each) do
        @event = Event.new("South Pearl Street Farmers Market")  
        @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
        @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
        @food_truck3 = FoodTruck.new("Palisade Peach Shack")
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: "$5.30"})
        @item4 = Item.new({name: 'Banana Nice Cream', price: "$4.25"})
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

    describe '#food_trucks_that_sell()' do
        it 'returns an array of food truck objects that sell the specified item' do
            @food_truck1.stock(@item1, 35)
            @food_truck1.stock(@item2, 7)
            @food_truck2.stock(@item3, 25)
            @food_truck2.stock(@item4, 50)
            @food_truck3.stock(@item1, 65)

            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
            expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
        end
    end

    describe '#sorted_item_list' do
        it 'returns an array of strings that repersents all items in food_trucks array sorted alphabetically' do
            @food_truck1.stock(@item1, 35)
            @food_truck1.stock(@item2, 7)
            @food_truck2.stock(@item3, 25)
            @food_truck2.stock(@item4, 50)

            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expected = ['Apple Pie (Slice)', 'Banana Nice Cream', 'Peach Pie (Slice)', 'Peach-Raspberry Nice Cream']

            expect(@event.sorted_item_list).to eq(expected)
        end

        it 'does not contain any repeating item names' do
            @food_truck1.stock(@item1, 35)
            @food_truck1.stock(@item2, 7)
            @food_truck1.stock(@item3, 25)
            @food_truck1.stock(@item4, 50)
            @food_truck2.stock(@item1, 35)
            @food_truck2.stock(@item2, 7)
            @food_truck2.stock(@item3, 25)
            @food_truck2.stock(@item4, 50)
            @food_truck3.stock(@item1, 35)
            @food_truck3.stock(@item2, 7)
            @food_truck3.stock(@item3, 25)
            @food_truck3.stock(@item4, 50)

            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expected = ['Apple Pie (Slice)', 'Banana Nice Cream', 'Peach Pie (Slice)', 'Peach-Raspberry Nice Cream']

            expect(@event.sorted_item_list).to eq(expected)
        end
    end
end