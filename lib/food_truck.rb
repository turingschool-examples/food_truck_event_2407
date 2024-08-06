class Foodtruck

    attr_reader :name, :inventory

    def initialze(name)
       @inventory = {}
       @name = name
    end

    def stock(item1, amount)
        if @inventory[item]
            @inventory[item] += stock
        else
            @inventory = stock
        end
    end

    def check_stock
        @inventory[item] || 0
    end
end