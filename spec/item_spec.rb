require './lib/item'
require './lib/food_truck'

RSpec.describe Item do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    end
    it 'exists' do
        @item = Item.new({name: "Eggs", price: '$1.00'})
        
        expect(@item).to be_a Item
    end
    it 'has attributes' do
        expect(@item2.name).to eq("Apple Pie (Slice)")
        expect(@item2.price).to eq(2.50)
    end
end