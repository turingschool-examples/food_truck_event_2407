class FoodTruck

    attr_reader :name, :inventory
    
    def initialize(name)
        @name = name
        @inventory = {}
    end

    def check_stock(item)
        return 0 if !@inventory.include?(item)
        num_stock = nil
        @inventory.each do |k, v|
            if k == item
                num_stock = v
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
        @inventory.each do |k ,v|
           revenue += k.price * v
        end
        revenue
    end
end