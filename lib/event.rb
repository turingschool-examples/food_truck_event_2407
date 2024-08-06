class Event 

  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    # look for foodtrucks with quantity > 0
    @food_trucks.find_all do |truck| 
      # check if item is in stock in truck
      truck.check_stock(item) > 0 
    end
  end
  

  def unique_item_names
    # put all items into a single array
    # get the list of items form the foodtuck inventory
    # get all names
    # iterate keys in the inventory hash, Item object
    # add the item name to array
    # use .uniq for no duplicates
    # then sort them
    item_names = []
     @food_trucks.each do |truck|
      truck.inventory.each_key do |item|
        item_names << item.name
      end
    end
    item_names.uniq.sort
  end

  def total_inventory
    # create a hash
    # extract food trucks by iterating
    # iterate though inventory hash item, quantity
    # so inventory item key needs to be set to a hash with 
    # quantity, and foodtrucks
    # we will need to update inventory if item
    # is in hash already
    # if its not in the inventory hash set it to it quantiry
    # and food truck instance
    item_inventory = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if item_inventory[item]
          item_inventory[item][:quantity] += quantity
          item_inventory[item][:food_trucks] << truck
        else
          item_inventory[item] = {
            quantity: quantity,
            food_trucks: [truck]
          }
        end
      end
    end
    # require 'pry'; binding.pry
    item_inventory
  end

  def overstocked_items
    # create array
    # iterate through totol_inventory hash |item, info|
    # we need food trucks that has the same item in the inventory > 1
    # we also need the quantity to be > 50 
    # if those conditions match push the item into array
    overstocked = []

    total_inventory.each do |item, info|
      if info[:food_trucks].length > 1 && info[:quantity] > 50
        overstocked << item
      end
    end
    overstocked
  end
end