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
    
    def total_inventory
        food_inventory = {}
        @food_trucks.each do |food_truck|
            food_truck.inventory.each do |item, quantity|
                food_inventory[item] ||= {quantity: 0, food_trucks: []}
                food_inventory[item][:quantity] += quantity
                food_inventory[item][:food_trucks] << food_truck
            end
        end
        food_inventory
    end
# had to look up and use (||= OR assignment) on ln 38 to stop @item1 from += into following food_truck3 that carries it. 

    def overstocked_items
        overstock = []
        total_inventory.each do |item, value|
            if value[:food_trucks].count > 1 && value[:quantity] > 50 
                overstock << item
            end
        end
        overstock
    end
end