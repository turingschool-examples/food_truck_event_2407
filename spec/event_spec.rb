require 'spec_helper'

RSpec.describe Item do
    before(:each) do
        @event = Event.new("South Pearl Street Farmers Market")  
    end

    describe '#initialize()' do
        it 'exists' do
            expect(@event).to be_a(Event)
        end

        it 'has a name' do
            expect(@event.name).to eq('South Pearl Street Farmers Market')
        end

        it 'has an empty food_trucks array' do
            expect(@event.food_trucks).to eq([])
        end
    end
end