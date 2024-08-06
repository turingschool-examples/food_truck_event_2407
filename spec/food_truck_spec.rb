require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do 
  before(:each) do 
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do
    expect(@food_truck).to be_an_instance_of(FoodTruck)
  end

  it 'has a name' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
  end

  it 'has an empty inventory by default' do
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check stock for an item' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'stocks items' do 
    @food_truck.stock(@item1, 30)
    expect(@food_truck.check_stock(@item1)).to eq(30)
  end

  it 'restocks more items' do 
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    expect(@food_truck.check_stock(@item1)).to eq(55)
  end

  it 'stocks more items' do 
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)
    expected = {
      @item1 => 55,
      @item2 => 12
    }
    expect(@food_truck.check_stock(@item1)).to eq(55)
    expect(@food_truck.check_stock(@item2)).to eq(12)
    expect(@food_truck.inventory).to eq(expected)
  end
  
end