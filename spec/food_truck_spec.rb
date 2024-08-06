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

end