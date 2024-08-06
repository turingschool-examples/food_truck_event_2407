require './lib/food_truck'
require './lib/item'
require './lib/event'

RSpec.describe Event do
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

    describe '#intialize' do
        it 'exists' do
            expect(@event).to be_an_instance_of(Event)
        end

        it 'has attributes' do
            expect(@event.name).to eq("South Pearl Street Farmers Market")
            expect(@event.food_trucks).to eq([])
        end
    end

    describe '#add food trucks' do
        it 'can add foodtrucks' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expected = [@food_truck1, @food_truck2, @food_truck3]

            expect(@event.food_trucks).to eq(expected)
        end
    end

    describe '#food truck names' do
        it 'returns list of food truck names' do
            @event.add_food_truck(@food_truck1)
            @event.add_food_truck(@food_truck2)
            @event.add_food_truck(@food_truck3)

            expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

            expect(@event.food_truck_names).to eq(expected)
        end
    end

    describe '#food trucks that sell' do
        it 'returns list of foodtrucks that sell item' do
            @event.add_food_truck(@food_truck1)    
            @event.add_food_truck(@food_truck2)    
            @event.add_food_truck(@food_truck3)

            @food_truck1.stock(@item1, 35)
            @food_truck1.stock(@item2, 7)    
            @food_truck2.stock(@item4, 50)    
            @food_truck2.stock(@item3, 25)
            @food_truck3.stock(@item1, 65) 

            expected1 = [@food_truck1, @food_truck3]
            expected2 = [@food_truck2]

            expect(@event.food_trucks_that_sell(@item1)).to eq(expected1)
            expect(@event.food_trucks_that_sell(@item4)).to eq(expected2)
        end

        it 'doesnt return truck if item is out of stock' do
            @food_truck2.stock(@item4, 0)  

            expect(@event.food_trucks_that_sell(@item4)).to eq([])
        end
    end

    describe '#potential revenue' do
        it 'returns potential revenue for foodtuck' do
            @event.add_food_truck(@food_truck1)    
            @event.add_food_truck(@food_truck2)    
            @event.add_food_truck(@food_truck3)

            @food_truck1.stock(@item1, 35)
            @food_truck1.stock(@item2, 7)    
            @food_truck2.stock(@item4, 50)    
            @food_truck2.stock(@item3, 25)
            @food_truck3.stock(@item1, 65) 

            expect(@food_truck1.potential_revenue).to eq(148.75)
            expect(@food_truck2.potential_revenue).to eq(345.00)
            expect(@food_truck3.potential_revenue).to eq(243.75)
        end
    end

    describe '#sorted item list' do
        it 'returns unique alphabetical list of all items in stock' do
            @event.add_food_truck(@food_truck1)    
            @event.add_food_truck(@food_truck2)    
            @event.add_food_truck(@food_truck3)

            @food_truck1.stock(@item1, 35)
            @food_truck1.stock(@item2, 7)    
            @food_truck2.stock(@item4, 50)    
            @food_truck2.stock(@item3, 25)
            @food_truck3.stock(@item1, 65)

            expected = ['Apple Pie (Slice)', 
                        'Banana Nice Cream', 
                        'Peach Pie (Slice)', 
                        'Peach-Raspberry Nice Cream']
            
            expect(@event.sorted_item_list).to eq(expected)
        end
    end

    describe 'overstocked_items' do
        it 'returns list of items sold by > 1 food truck and total inventory > 50' do
            @event.add_food_truck(@food_truck1)    
            @event.add_food_truck(@food_truck2)    
            @event.add_food_truck(@food_truck3)

            @food_truck1.stock(@item1, 35)
            @food_truck1.stock(@item2, 7)    
            @food_truck2.stock(@item2, 53)    
            @food_truck2.stock(@item4, 50)    
            @food_truck2.stock(@item3, 25)
            @food_truck3.stock(@item1, 65)

            expected = [@item1, @item2]

            expect(@event.overstocked_items).to eq(expected)
        end
    end
end