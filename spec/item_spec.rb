require 'spec_helper'

RSpec.describe Item do
    before(:each) do
        @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    end

    describe '#initialize()' do
        it 'exists' do
            expect(@item1).to be_a(Item)
        end

        it 'has a name' do
            expect(@item1.name).to eq('Peach Pie (Slice)')
        end

        it 'has a price' do
            expect(@item1.price).to eq(3.75)
        end
    end
end