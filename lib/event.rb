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

    def sorted_item_list
        sorted_item_list = []
        @food_trucks.each do |truck|
            truck.inventory.each do |item, quantity|
                sorted_item_list << item.name
            end
        end
        sorted_item_list.uniq.sort
    end

    def overstocked_items
        overstocked_items = []
        @food_trucks.each do |truck|
            total_qty_of_item = 0
            truck.inventory.each do |item, quantity|
                if food_trucks_that_sell(item).count > 1
                    total_qty_of_item += quantity
                end

                if total_qty_of_item > 50
                    overstocked_items << item
                end
            end
        end
        overstocked_items
    end

    def total_inventory
        item_hash = Hash.new(0)  
        @food_trucks.each do |truck|
            truck.inventory.each do |item, quantity|
                item_hash[item] += quantity
            end
        end

        item_hash
    end  
end