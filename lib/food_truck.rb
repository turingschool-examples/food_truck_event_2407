class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end

    def stock(item, quantitiy)
        inventory[item] = quantitiy
    end
end