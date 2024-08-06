class Event

    attr_reader :name, :food_trucks

    def initialize(name)
        @name = name
        @food_trucks= []
    end

    def add_food_truck(food_truck)
        @food_trucks << food_truck
    end

    def food_truck_names
        names = [] 
        @food_trucks.each { |food_truck| names << food_truck.name }
        names
    end

    def food_trucks_that_sell(item)
        @food_trucks.find_all { |food_truck| food_truck.inventory.include?(item)}
    end

    def sorted_item_list
        sorted_list = []
        @food_trucks.each do |food_truck| 
            food_truck.inventory.each do |item, name|
            sorted_list << item.name
            end
        end
        sorted_list.uniq.sort
    end
end