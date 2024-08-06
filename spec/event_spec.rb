require './lib/event'

RSpec.describe Event do
    it 'exists' do
        expect(Event.new("South Pearl Street Farmers Market")).to be_a Event
    end

    it 'has attributes' do
        event = Event.new("South Pearl Street Farmers Market")

        expect(event.name).to eq "South Pearl Street Farmers Market"
        expect(event.food_trucks).to eq([])
    end
end