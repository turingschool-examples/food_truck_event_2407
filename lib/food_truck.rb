class FoodTruck
    attr_reader :items, :inventory

    def initialize(items, inventory)
        @items = items
        @inventory = {}
    end
end