require './lib/item'

Rspec.describe 'food_truck' do
    before(:each) do
        item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    end

    describe '#initialze' do
        it 'can initialze' do 
            expect(@item1.name).to eq('Peach Pie (Slice)')
            expect(@item1.price).to eq('$3.75')

            expect(@item2.name).to eq('Apple Pie (Slice)')
            expect(@item2.price).to eq('$2.50')
        end
    end
end