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
end
