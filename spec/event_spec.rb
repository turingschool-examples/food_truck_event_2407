require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.configure do |config| 
 config.formatter = :documentation 
end

RSpec.describe Event do 
 before(:each) do 
    @event = Event.new("South Pearl Street Farmers Market")    
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom") 
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")    
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
 end

    it 'can exist and have attributes' do
        expect(@event).to be_an(Event)
        expect(@event.name).to eq("South Pearl Street Farmers Market")
        expect(@event.food_trucks).to eq([])
    end

    it 'can have food trucks that carry stock' do
        @food_truck1.stock(@item1, 35)    
        @food_truck1.stock(@item2, 7)  

        @food_truck2.stock(@item4, 50)    
        @food_truck2.stock(@item3, 25)

        @food_truck3.stock(@item1, 65) 

        @event.add_food_truck(@food_truck1)    
        @event.add_food_truck(@food_truck2)    
        @event.add_food_truck(@food_truck3)
        
        expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end

    it 'can bring back the names of the food trucks' do
        @event.add_food_truck(@food_truck1)    
        @event.add_food_truck(@food_truck2)    
        @event.add_food_truck(@food_truck3)

        expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'can tell us what food trucks sell what item' do
        @food_truck1.stock(@item1, 35)    
        @food_truck1.stock(@item2, 7)  
        @event.add_food_truck(@food_truck1) 

        @food_truck2.stock(@item4, 50)    
        @food_truck2.stock(@item3, 25)
        @event.add_food_truck(@food_truck2)   

        @food_truck3.stock(@item1, 65) 
        @event.add_food_truck(@food_truck3)

        expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
        expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end

    it 'can sort all food truck item names' do
        @food_truck1.stock(@item1, 35)    
        @food_truck1.stock(@item2, 7)  
        @event.add_food_truck(@food_truck1) 

        @food_truck2.stock(@item4, 50)    
        @food_truck2.stock(@item3, 25)
        @event.add_food_truck(@food_truck2)   

        @food_truck3.stock(@item1, 65) 
        @event.add_food_truck(@food_truck3)
        expect(@event.sorted_item_list).to eq(["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"])
    end

    it 'can give you a total inventory' do
        @food_truck1.stock(@item1, 35)    
        @food_truck1.stock(@item2, 7)  
        @food_truck1.stock(@item4, 50) 
        @event.add_food_truck(@food_truck1) 

        @food_truck2.stock(@item4, 50)    
        @food_truck2.stock(@item3, 25)
        @event.add_food_truck(@food_truck2)   

        @food_truck3.stock(@item1, 65) 
        @food_truck3.stock(@item2, 7)
        @event.add_food_truck(@food_truck3)

        expected = {
            @item1 => {quantity: 100, food_trucks: [@food_truck1, @food_truck3]},
            @item2 => {quantity: 14, food_trucks: [@food_truck1, @food_truck3]},
            @item3 => {quantity: 25, food_trucks: [@food_truck2]},
            @item4 => {quantity: 100, food_trucks: [@food_truck1, @food_truck2]}
        }
        expect(@event.total_inventory).to eq(expected)
    end

    it 'can tell you what food trucks have an overstock of items' do
        @food_truck1.stock(@item1, 35) 
        @food_truck1.stock(@item2, 7) 
        @food_truck1.stock(@item4, 50) 
        @event.add_food_truck(@food_truck1) 

        @food_truck2.stock(@item4, 50) 
        @food_truck1.stock(@item2, 25)
        @event.add_food_truck(@food_truck2)

        expect(@event.overstock_items).to eq([@item4])
    end
end