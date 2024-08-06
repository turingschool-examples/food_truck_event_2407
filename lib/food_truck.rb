class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = Hash.new(0)
    end

    def check_stock(item)
        @inventory[item]
    end

    def stock(item, amount)
        @inventory[item] += amount
    end

    def potential_revenue
        revenue = 0
        @inventory.each do |item, stock|
            revenue += (item.price.delete("$").to_f)* stock
        end
        revenue
    end
end
