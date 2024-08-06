require './lib/food_truck'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end
 
  def food_truck_names
    @food_trucks.map(&:name)
  end
  
  def food_trucks_that_sell(item)
    @food_trucks.select {|food_truck| food_truck.check_stock(item) > 0}
  end

  def sorted_item_list
    item_names = @food_trucks.flat_map do |food_truck| 
      food_truck.inventory.keys.map(&:name)
    end
    item_names.uniq.sort
  end

  def total_inventory
    inventory_hash = Hash.new { |hash, key| hash[key] = { quantity: 0, food_trucks: [] } }
  
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        inventory_hash[item][:quantity] += quantity
        unless inventory_hash[item][:food_trucks].include?(food_truck)
          inventory_hash[item][:food_trucks] << food_truck
        end
      end
    end
    inventory_hash
  end

  def overstocked_items
    total_inventory.select do |item, info|
      info[:quantity] > 50 && info[:food_trucks].size > 1
    end.keys
  end
    
end