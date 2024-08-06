

class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = Hash.new(0)
    end
    
    def check_stock(item)
        @inventory[item]
    end

    def stock(item, quantity)
        @inventory[item] += quantity
    end

    def potential_revenue
        @inventory.sum { |item, quantity| item.price * quantity }
    end

    def list_items
        @inventory.map { |item, quantity| item.name}
    end
    
    def sell_items(item, quantity)
        return false unless can_sell?(item,quantity)
        @inventory[item] -= quantity
    end

    def can_sell?(item, quantity)
        @inventory[item] >= quantity
    end
end