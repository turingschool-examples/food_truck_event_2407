require './lib/item'

RSpec.describe Item do
    before :all do
        it 'exists' do
            expect(item).to be_an_instance_of Item
        end

        it 'has a name' do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

            expect(item1.name).to be 'Peach Pie (Slice)'
            expect(item2.name).to be 'Apple Pie (Slice)'
        end

        it 'has a price' do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

            expect(item1.price).to eq("$3.75")
            expect(item2.price).to eq('$2.50')
        end
    end
end