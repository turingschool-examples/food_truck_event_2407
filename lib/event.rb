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


  # def all_items_in_stock
  #     all_items = @food_trucks.flat_map do |food_truck|
  #       food_truck.inventory.keys
  #     end
  #     unique_items = all_items.uniq { |item| item.name }
  #     unique_items.sort_by { |item| item.name }.map(&:name)
  #   end

  def all_items_in_stock
    all_items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each_key do |item|
        all_items << item
      end
    end
    unique_items = []
    all_items.each do |item|
      found_duplicate = false
      unique_items.each do |unique_item|
        if unique_item.name == item.name
          found_duplicate = true
          break
        end
      end
      unless found_duplicate
        unique_items << item
      end
    end
    sorted_items = unique_items.sort do |item1, item2|
      item1.name <=> item2.name
    end
    item_names = []
    sorted_items.each do |item|
      item_names << item.name
    end
    item_names
  end
end




