require './lib/item'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Item do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    end

    describe 'Initialize' do
        it 'exists' do
            expect(@item1).to be_an_instance_of(Item)
            expect(@item2).to be_an_instance_of(Item)
        end

        it 'has a name' do
            expect(@item1.name).to eq('Peach Pie (Slice)')
            expect(@item2.name).to eq('Apple Pie (Slice)')
        end

        it 'has a price' do
            expect(@item1.price).to eq(3.75)
            expect(@item2.price).to eq(2.50)
        end
    end
end