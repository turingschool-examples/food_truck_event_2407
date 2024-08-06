require 'date'

class Event
    attr_reader :name, :food_trucks, :date

    def initialize(name)
        @name = name
        @food_trucks = []
        @date = Date.today.strftime("%m/%d/%Y")
    end

    def add_food_truck(truck)
        @food_trucks << truck
    end

    def food_truck_names
        names = []
        @food_trucks.each do |truck|
            names << truck.name
        end
        names
    end

    def food_truck_that_sell(item)
        trucks = []
        @food_trucks.each do |truck|
            if truck.inventory.include?(item)
                trucks << truck
            end
        end
        trucks
    end

    def sorted_item_list
        items = []
        @food_trucks.each do |truck|
            truck.inventory.each do |item, _|
                if !items.include?(item.name)
                    items << item.name
                end
            end
        end
        items.sort
    end

    def overstocked_items
        items = []
        @food_trucks.each do |truck|
            truck.inventory.each do |item, _|
                if !items.include?(item)
                    items << item
                end
            end
        end
        returned = []
        items.each do |item|
            trucks = food_truck_that_sell(item)
            if trucks.count > 1
                amount = 0
                trucks.each do |truck|
                    amount += truck.inventory[item]
                end
                if amount > 50
                    returned << item
                end
            end
        end
        returned
    end    

    def total_inventory
        total = {}
        @food_trucks.each do |truck|
            truck.inventory.each do |item, stock|
                if total[item].nil? 
                    total[item] = {quantity: 0, food_trucks: []}
                end
                total[item][:quantity] += stock
                total[item][:food_trucks] << truck
            end
        end
        total
    end
        
    def set_date(month, day, year)
        @date = Date.new(year, month, day).strftime("%m/%d/%Y")
    end

    def sell(item, amount)
        if total_inventory[item][:quantity] > amount
            update_inventory(item, amount)
            true
        else
            false
        end
    end

    def update_inventory(item, amount)
        sold = 0
        trucks = total_inventory[item][:food_trucks]
        i = 0
        until i == trucks.count
            if trucks[i].check_stock(item) > 0
                stock = trucks[i].check_stock(item)
                if stock >= amount
                    trucks[i].stock(item, -amount)
                    i += 1
                    sold = amount
                else
                    trucks[i].stock(item, 0)
                    i +=1
                    sold = amount - stock
                end
            else
                i += 1
            end
        end
    end

end