class FoodTruck 

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}  
  end

  def check_stock(item)
    quantity = 0
  @inventory.each do |inventory_item, amount|
    if inventory_item == item
      quantity = amount 
    end
  end
  # require 'pry'; binding.pry
  quantity
  end

  def stock(item, quantity)
    if @inventory[item]
      @inventory[item] += quantity
    else
      @inventory[item] = quantity
    end
  end

  def potential_revenue
    # this method helps event
    # multiplying item with quantity
    @inventory.sum do |item,quantity|
      item.price * quantity
    end
  end
end