class Item

    def initialize(info)
        @name = info[:name]
        @price = info[:price].to_f
    end
end