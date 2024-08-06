class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end

    def check_stock(item)
        item_stock = 0
        @inventory.each do |item|
            item_stock += item.values
        end

        item_stock
    end
end