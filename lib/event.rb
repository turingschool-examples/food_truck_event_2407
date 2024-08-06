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

    def overstocked_items
        output = []
        all_items_hash = Hash.new { |hash, key| hash[key] = [] }
        dup_items = []
        @food_trucks.each do |food_truck|
            food_truck.inventory.each do |item|
                all_items_hash[item[0]] << item[1]
            end
        end
 
        all_items_hash.each do |item, quant_array|
            if quant_array.length > 1 && quant_array.sum > 50
                output << item
            end
        end
        output
    end
end