require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.configure do 
    |config|config.formatter = :documentation 
end

# RSpec.describe Auction do