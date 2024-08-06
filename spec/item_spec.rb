require './lib/item'
require './lib/food_truck'
# require './lib/attendee'

RSpec.configure do 
    |config|config.formatter = :documentation 
end

RSpec.describe Item do
    describe 'item' do
        it 'is an instance of Item' do
            item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

            expect(item).to be_an_instance_of(Item)
        end
    end
        
    xit 'item has name' do
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        expect(item2.name).to eq({'Apple (Slice)'})
    end

    xit 'item has price' do
        item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

        expect(item2.name).to eq({'Apple (Slice)'})
    end
    


end