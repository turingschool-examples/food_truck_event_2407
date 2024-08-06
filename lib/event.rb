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
        @food_trucks.find_all {|food_truck| food_truck.check_stock(item) > 0}
    end

    def sorted_item_list
        @food_trucks.flat_map {|food_truck| food_truck.inventory.keys.map(&:name)}.uniq.sort
    end

    def overstocked_items
        all_items = @food_trucks.flat_map {|food_truck| food_truck.inventory.keys}
        all_items.uniq.select do |item|
        total_quantity(item) > 50 && food_trucks_that_sell(item).size > 1
        end
    end
    
    def total_quantity(item)
        @food_trucks.sum {|food_truck| food_truck.check_stock(item)}
    end
end