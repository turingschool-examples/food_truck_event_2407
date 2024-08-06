require './lib/item'
require './lib/food_truck'
# require './lib/attendee'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Item do
  describe 'Item instance' do
    it 'is an instance of Item' do
      item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item).to be_an_instance_of(Item)
    end

    it 'has a name' do
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(item2.name).to eq('Apple Pie (Slice)')
    end

    it 'has a price' do
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      expect(item2.price).to eq('$2.50')
    end
  end
end
