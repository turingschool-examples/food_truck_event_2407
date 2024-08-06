


class Item

    attr_reader :food, :price

    def initialize(meal)
        @food = meal[:name]
        @price = meal[:price][1..-1].to_f
    end
end