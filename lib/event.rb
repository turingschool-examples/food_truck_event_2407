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
        names = []
        @food_trucks.each do |truck|
            names << truck.name
        end
        names
    end

    def food_trucks_that_sell(item)
        selling_trucks = []
        @food_trucks.each do |truck|
            if truck.inventory.include?(item)
                selling_trucks << truck
            end
        end
        selling_trucks
    end

    def sorted_item_list
        names_list = []
        items = []
        @food_trucks.each do |truck|
            truck.inventory.each do |item|
                items << item[0]
            end
        end
        items.each do |item|
            names_list << item.name
        end
        names_list.sort.uniq
    end

    def total_inventory
        hash = {}
        @food_trucks.each do |truck|
            truck.inventory.each do |item, num|
                if hash[item]
                    hash[item][:quantity] += num
                    hash[item][:food_trucks] << truck
                else
                    hash[item] = {quantity: num, food_trucks: [truck]}
                end
            end
        end
        hash
    end

    def overstocked_items
        item_quantity = Hash.new(0)
        @food_trucks.each do |truck|
            truck.inventory.each do |item, quantity|
                item_quantity[item] += quantity
            end
        end
        overstock = []
        item_quantity.each do |item, quantity|
            if quantity > 50
                overstock << item
            end
        end
        overstock
    end
end