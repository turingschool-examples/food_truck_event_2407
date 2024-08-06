class Event
    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(truck_name)
        @food_trucks << truck_name
    end

    def food_truck_names
        truck_names = []
        @food_trucks.each do |truck| 
            truck_names << truck.name
        end
        truck_names
    end

    def food_trucks_that_sell(item)
        trucks_that_sell = []
        @food_trucks.each do |truck|
            if truck.inventory.key?(item)
                trucks_that_sell << truck
            end
        end
        trucks_that_sell
    end
end