
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
        @food_trucks.map { |food_truck| food_truck.name }
    end

    def food_trucks_that_sell(item)
        @food_trucks.find_all { |food_truck| food_truck.check_stock(item) > 0}
    end

    def sorted_item_list
      all_items = @food_trucks.map { |food_truck| food_truck.list_items}
      sorted_items = all_items.flatten.uniq.sort
    end
end