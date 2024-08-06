require 'pry'
require 'rspec'


RSpec.configure do |config| 
    config.formatter = :documentation 
end

require './lib/item.rb'
require './lib/food_truck.rb'
require './lib/event.rb'