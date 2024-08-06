class FoodTruck
    attr_reader :name, :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end

    def stock(item, quantity)
        if inventory[item]
            inventory[item] += quantity
          else
            inventory[item] = quantity
          end
    end

    def check_stock(item)
        if inventory[item] == nil || inventory[item] == 0
            0
        else
            inventory[item]
        end
    end

    def potential_revenue
        output = 0
        @inventory.each do |item, quantity|
            price = format('%.2f', item.price).to_f
            output += price * quantity
        end
        output
    end
end