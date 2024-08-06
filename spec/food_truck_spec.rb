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
end