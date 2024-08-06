class Event
    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks = []
    end

    def add_food_truck(truck)
        @food_trucks << truck
    end

    def food_truck_names
        @food_trucks.map do |truck|
            truck.name
        end
    end

    def food_trucks_that_sell(item)
        @food_trucks.find_all do |truck|
            truck.inventory.keys.include?(item) && truck.inventory[item] > 0
        end
    end

    def sorted_item_list
        list = []
         @food_trucks.each do |truck|
            truck.inventory.each do |item, quantity|
               list << item.name if !list.include?(item.name)
            end
        end
        list.sort
    end

end