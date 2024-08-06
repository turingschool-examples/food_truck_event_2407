class Event
    attr_reader :name,
                :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(food_truck)
        @food_trucks << food_truck
    end

    def food_truck_names
       @food_trucks.map {|food_truck| food_truck.name}
    end

    def food_trucks_that_sell(item)
        @food_trucks.select do |food_truck| 
            food_truck.inventory.include?(item)
        end
    end

    def sorted_item_list
       @food_trucks.flat_map do |food_truck|
        food_truck.inventory.keys.map do |item|
            item.name
         end
       end.uniq.sort
    end

    def total_inventory
        inventory = Hash.new 
        @food_trucks.each do |food_truck|
            food_truck.inventory.each do |item, quantity|
            unless inventory.key?(item)
                inventory[item] = { quantity: 0, food_trucks: [] }  
            end
                inventory[item][:quantity] += quantity
                inventory[item][:food_trucks] << food_truck 
            end
        end
        inventory 
    end
    
    def overstock_items
        overstocked_items = []
        total_inventory.each do |item, item_info|
          if item_info[:quantity] > 50 && item_info[:food_trucks].size > 1
            overstocked_items << item
          end
        end
        overstocked_items
      end
end