
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

    def total_inventory
        total_inventory = Hash.new { |hash, key| hash[key] = { quantity: 0, food_trucks: [] } }

        @food_trucks.each do |food_truck|
            food_truck.inventory.each do |item, quantity|
                total_inventory[item][:quantity] += quantity
                next if total_inventory[item][:food_trucks].include?(food_truck)
                total_inventory[item][:food_trucks] << food_truck
            end
        end
        
        total_inventory
    end

    def overstocked_items
        items_over_stocked = total_inventory.find_all { |item, info| info[:quantity] > 50 && info[:food_trucks].length > 1}
        items_over_stocked.map { |item, info| item}
    end
end