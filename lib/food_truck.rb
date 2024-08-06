class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end

    def stock(item, quantitiy)
        inventory[item] = quantitiy
    end

    def check_stock(item)
        if inventory[item] == nil || inventory[item] == 0
            0
        else
            inventory[item]
        end
    end
end