require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do 
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({'Peach Pie (Slice)', price: '$3.75'})
    @item2 = Item.new({'Apple Pie (Slice)', price: '$2.50'})
  end

  it 'exists' do 
    expect(@food_truck).to be_instance_of(FoodTruck)
  end

  it 'has attributes' do
    expect(@food_truck.name).to eq("Rocky Mountain Pies")
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check stock' do 
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can stock items' do 
    @food_truck.stcok(@item1, 30)
    expect(@food_truck.ivnentory).to eq({@item1 => 30})

    @food_truck.stock(@item1, 25)
    expect(@food_truck.inventory).to eq({@item1 => 55})

    @food_truck.stock(@item2, 12).to eq({@item1 => 55, @item2 => 12})
  end
end