require './lib/event'
require './lib/item'
require './lib/food_truck'


RSpec.describe Event do
    before(:each) do
        @event = Event.new("South Pearl Street Farmers Market")
    end
    
end