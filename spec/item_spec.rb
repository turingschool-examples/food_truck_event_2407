require './lib/item'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Item do
    describe 'initialize' do
        it 'exists' do
            item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

            expect(item1).to be_an Item
            expect(item1.name).to eq 'Peach Pie (Slice)'
            expect(item1.price).to eq "$3.75"
        end

        it 'can have another name and price' do
            item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

            expect(item2.name).to eq 'Apple Pie (Slice)'
            expect(item2.price).to eq "$2.50"
        end
    end
end