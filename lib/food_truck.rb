class FoodTruck
attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end

    def check_stock(item)
        @inventory.fetch(item, 0)
    end

    def stock(item, amount)
        if @inventory.key?(item)
            @inventory[item] += amount
        else
            @inventory[item] = amount
        end
    end

    def potential_revenue
        @inventory.sum {|item, amount| item.price * amount} 
    end
end
