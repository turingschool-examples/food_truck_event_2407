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


    def total_inventory
        inventory = Hash.new { |hash, key| hash[key] = {quantity: 0, food_trucks: []} }
        @food_trucks.each do |truck|
            truck.inventory.each do |item, quantity|
                next unless !inventory[item][:food_trucks].include?(truck)
                inventory[item][:quantity] += quantity 
                inventory[item][:food_trucks] << truck
            end
        end
        inventory
    end

    def overstocked_items
        overstock = []

        unique_items = @food_trucks.map do |truck|
            truck.inventory.keys
        end.flatten.uniq

        unique_items.each do |item|
            total_quantity = 0
            total_trucks = 0

            @food_trucks.each do |truck|
                total_quantity += truck.inventory[item]
                total_trucks += 1
            end

            if total_quantity > 50 && total_trucks > 1
                overstock << item
            end
        end
        overstock
    end
end