require './lib/item'

RSpec.describe Item do
  before :each do
    @item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
  end

  it 'exists' do
    expect(@item).to be_an_instance_of(Item)
  end

  it 'has a name' do
    expect(@item.name).to eq('Peach Pie (Slice)')
  end

  it 'has a price' do
    expect(@item.price).to eq(3.75)
  end
end