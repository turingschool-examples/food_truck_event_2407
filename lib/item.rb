


class Item

    attr_reader :name, :price

    def initialize(meal)
        @name = meal[:name]
        @price = meal[:price][1..-1].to_f
    end
end