require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.configure do 
    |config|config.formatter = :documentation 
end

RSpec.describe Event do
    it 'is an event' do
        event = Event.new("South Pearl Street Farmers Market")    

        expect(event).to be_an_instance_of(Event)
    end

    it 'has an event name' do
        event = Event.new("South Pearl Street Farmers Market")    

        expect(event.name).to eq("South Pearl Street Farmers Market")
    end

    it 'even adds food trucks' do
        event = Event.new("South Pearl Street Farmers Market")  
        food_truck1 = Food_Truck.new("Rocky Mountain Pies")  
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        food_truck1.stock(item1, 35) 
        food_truck1.stock(item2, 7)   

        food_truck2 = Food_Truck.new("Ba-Nom-a-Nom")    
        food_truck2.stock(item4, 50) 
        food_truck2.stock(item3, 25)

        food_truck3 = Food_Truck.new("Palisade Peach Shack")  
        food_truck3.stock(item1, 65)  

        event.add_food_truck(food_truck1)  
        event.add_food_truck(food_truck2) 
        event.add_food_truck(food_truck3)

        expected = [food_truck1, food_truck2, food_truck3]

        expect(event.food_trucks).to eq(expected)
    end

    it 'lists food truck names' do
        event = Event.new("South Pearl Street Farmers Market") 

        food_truck1 = Food_Truck.new("Rocky Mountain Pies")  
        food_truck2 = Food_Truck.new("Ba-Nom-a-Nom")    
        food_truck3 = Food_Truck.new("Palisade Peach Shack")  

        event.add_food_truck(food_truck1)  
        event.add_food_truck(food_truck2) 
        event.add_food_truck(food_truck3)

        expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

        expect(event.food_truck_names).to eq(expected)
    end
end