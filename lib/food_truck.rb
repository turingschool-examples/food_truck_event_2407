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
    @inventory[item] = quantity
  end
end