class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end

    def stock(item, quantity)
        @inventory[item] = quantity
    end

    def check_stock(item)
        if @inventory.key?(item)
            @inventory[item]
        else 
            0
        end

    end

    
end