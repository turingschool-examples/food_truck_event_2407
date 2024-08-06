class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    names = []
    @food_trucks.each do |food_truck|
      names << food_truck.name
    end
    names
  end

  def food_trucks_that_sell(item)
    food_trucks_item = []
    @food_trucks.each do |food_truck|
      if food_truck.inventory.include?(item)
        food_trucks_item << food_truck
      end
    end
    food_trucks_item
  end

  def all_items_in_stock
    all_items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each_key do |item|
        all_items << item
      end
    end
    unique_items = all_items.uniq { |item| item.name }
    sorted_items = unique_items.sort_by { |item| item.name }
    sorted_items.map { |item| item.name }
  end

  def overstocked_items
    item_quantities = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        if item_quantities[item].nil?
          item_quantities[item] = {count: 0, quantity: 0}
        end
        item_quantities[item][:count] += 1
        item_quantities[item][:quantity] += quantity
      end
    end
    overstocked = []
    item_quantities.each do |item, data|
      if data[:count] > 1 && data[:quantity] > 50
        overstocked << item
      end
    end
    overstocked
  end

  def total_inventory
    inventory = {}
  
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        if inventory[item].nil?
          inventory[item] = {quantity: 0, food_trucks: []}
        end
        inventory[item][:quantity] += quantity
        if !inventory[item][:food_trucks].include?(food_truck)
          inventory[item][:food_trucks] << food_truck
        end
      end
    end
    inventory
  end

end




