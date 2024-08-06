class Event

    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(food_truck)
        @food_trucks << food_truck unless @food_trucks.include?(food_truck)
    end

    def food_truck_names
        @food_trucks.map(&:name)
    end

    def food_trucks_that_sell(item)
        @food_trucks.select do |food_truck| 
            food_truck.check_stock(item) > 0 
        end
    end

    def sorted_item_list
        unique_names = @food_trucks.flat_map do |food_truck|
          food_truck.inventory.keys.map(&:name)
        end
        unique_names.uniq.sort
    end

    def overstocked_items
        item_quantities = Hash.new(0)
        item_food_truck_counts = Hash.new(0)
    
        @food_trucks.each do |food_truck|
          food_truck.inventory.each do |item, quantity|
            item_quantities[item] += quantity
            item_food_truck_counts[item] += 1
          end
        end

        item_quantities.select do |item, total_quantity|
          item_food_truck_counts[item] > 1 && total_quantity > 50
        end.keys
    end
end
