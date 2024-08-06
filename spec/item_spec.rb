require 'spec_helper'

RSpec.describe Item do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    end

    describe '#initialize()' do
        it 'exists' do
            expect(@@item).to be_a(Class_example)
        end

        it 'has a name' do
            expect(@item.name).to eq("example")
        end

        it 'has a price' do
            expect(@item.price).to eq("example")
        end
    end

end