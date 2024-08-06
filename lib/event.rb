class Event
    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(food_truck)
        if !(@food_trucks.include?(food_truck))
            @food_trucks << food_truck
        end
    end
    
    def food_truck_names
        food_trucks.map { |food_truck| food_truck.name}
    end

    def food_trucks_that_sell(item)
        @food_trucks.find_all do |food_truck|
            food_truck.inventory.include?(item)
        end
    end


    def sorted_item_list
        output = []
        @food_trucks.each do |food_truck|
            food_truck.inventory.each { |item|  output << item[0].name}
        end
        output.uniq!
        output.sort { |a, b| a <=> b }
    end
end