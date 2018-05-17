class Ship
  include Comparable

  attr_accessor :name, :length

  def initialize(name, length)
    @name = name
    @length = length
  end

  def <=>(other)
    length <=> other.length
  end

  def to_str
    name
  end

  def message_equal(other)
    'Корабли ' + self + ' и ' + other + ' равны.'
  end

  def message_more_than(other)
    'Корабль ' + self + ' больше, чем ' + other + '.'
  end
end
