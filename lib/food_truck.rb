class FoodTruck

    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end

    def check_stock(item)
        return 0 if !@inventory.include?(item)
        num_stock = nil
        @inventory.each do |item, quantity|
            if item == item
                num_stock = quantity
            end
        end
        num_stock
    end

    def stock(item, num)
        if @inventory[item]
            @inventory[item] += num
        else
            @inventory[item] = num
        end
    end

    def potential_revenue
        revenue = 0.0
        @inventory.each do |item, quantity|
           revenue += item.price * quantity
        end
        revenue
    end
end