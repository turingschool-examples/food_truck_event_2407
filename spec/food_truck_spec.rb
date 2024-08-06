require './lib/item'
require './lib/food_truck'

RSpec.configure do 
    |config|config.formatter = :documentation 
end

RSpec.describe Food_Truck do
    it 'is an instance of Food_Truck' do
        food_truck = Food_Truck.new("Rocky Mountain Pies")
  
        expect(food_truck).to be_an_instance_of(Food_Truck)
    end

    it 'has inventory' do
        food_truck = Food_Truck.new("Rocky Mountain Pies")

        food_truck.inventory
  
        expect(food_truck.inventory).to eq({})
    end

    it 'checks stock for a given item' do
        food_truck = Food_Truck.new("Rocky Mountain Pies")
        item1 = Item.new(name: 'Peach Pie (Slice)', price: "$3.75")

        food_truck.check_stock(item1)
        
        expect(food_truck.check_stock(item1)).to eq(0)
    end

    it 'stocks' do
        food_truck = Food_Truck.new("Rocky Mountain Pies")
        item1 = Item.new(name: 'Peach Pie (Slice)', price: "$3.75")

        food_truck.stock(item1, 30)

        food_truck.check_stock(item1)
        
        expect(food_truck.check_stock(item1)).to eq(30)
    end

    it 'stocks sums' do
        food_truck = Food_Truck.new("Rocky Mountain Pies")
        item1 = Item.new(name: 'Peach Pie (Slice)', price: "$3.75")

        food_truck.stock(item1, 30)
        food_truck.stock(item1, 25)

        food_truck.check_stock(item1)
        
        expect(food_truck.check_stock(item1)).to eq(55)
    end

    it 'stocks again' do
        food_truck = Food_Truck.new("Rocky Mountain Pies")
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        food_truck.stock(item2, 12)

        food_truck.check_stock(item2)
        
        expect(food_truck.check_stock(item2)).to eq(12)
    end

    it 'calculates potential_revenue' do
        item1 = Item.new(name: 'Peach Pie (Slice)', price: "$3.75")
        item2 = Item.new(name: 'Apple Pie (Slice)', price: '$2.50')
        item3 = Item.new(name: 'Pecan Pie (Slice)', price: '$3.25')

        food_truck1 = Food_Truck.new("Rocky Mountain Pies")
        food_truck2 = Food_Truck.new("Ba-Nom-a-Nom")
        food_truck3 = Food_Truck.new("Palisade Peach Shack")

        food_truck1.stock(item1, 15) 
        food_truck1.stock(item2, 37)

        food_truck2.stock(item1, 51) 
        food_truck2.stock(item2, 22) 
        food_truck2.stock(item3, 30) 

        food_truck3.stock(item1, 34) 
        food_truck3.stock(item2, 14) 
        food_truck3.stock(item3, 25) 

        expect(food_truck1.potential_revenue).to eq(148.75) 
        expect(food_truck2.potential_revenue).to eq(343.75)
        expect(food_truck3.potential_revenue).to eq(243.75)
    end
end