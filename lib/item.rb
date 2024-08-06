class Item
    attr_reader :name, :price

    def initialize(data)
        @name = data[:name]
        @price = '%.2f' % data[:price].delete('$').to_f #FIX!!!!
    end
end