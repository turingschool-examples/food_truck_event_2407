require './lib/item'

RSpec.describe Item do
    before :all do
        it 'exists' do
            expect(item).to be_an_instance_of Item
        end

        it 'has a name' do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

            expect(item1.name).to be 'Peach Pie (Slice)'
            expect(item2.name).to be 'Apple Pie (Slice)'
            expect(item3.name).to be "Peach-Raspberry Nice Cream"
            expect(item4.name).to be "Banana Nice Cream"
        end

        it 'has a price' do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
            item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
            item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

            expect(item1.price).to eq("$3.75")
            expect(item2.price).to eq('$2.50')
            expect(item3.price).to eq("$5.30")
            expect(item4.price).to eq("$4.25")
        end
    end
end