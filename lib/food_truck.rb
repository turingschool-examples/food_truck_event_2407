class FoodTruck
    attr_reader :items, :inventory, :stock, :potential_revenue

    def initialize(items, inventory)
        @items = items
        @inventory = {}
        @stock = 0
        @potential_revenue = potential_revenue
    end

    def stock(item_name, quantity)
        stock = 0
        # @items.each do |item|
    end

    def check_stock(stock)

    end

    def inventory 
        inventory = {}
        inventory.each do |item, quantity|

        end
    end

    def potential_revenue
        # potential_revenue = sum of all items price * quantity
        @potential_revenue = potential_revenue
        total_price = items.price.sum do |item| 
        potential_revenue = total_price * inventory[quantity]
        end
    end
    potential_revenue
end