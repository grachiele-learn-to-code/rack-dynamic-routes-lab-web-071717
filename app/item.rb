class Item
  @@items = []
  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end

  def self.all
    @@items
  end

  def self.names
    hash = {}
    @@items.each do |item|
      hash[item.name] = item
    end
    hash
  end

end
