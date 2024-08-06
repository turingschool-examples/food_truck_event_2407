require './lib/item'
require './food_truck'

RSpec.describe Item do
    before(:each) do
        @item_1 = Item.new

    end

    describe "initialize" do
        it 'exists' do
            expect(@item_1).to be_an_instance_of Item
        end
    end

end