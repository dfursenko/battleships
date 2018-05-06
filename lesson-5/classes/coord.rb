class Coord
  attr_accessor :deck_status

  def initialize(x, y, ship = nil, deck_number = nil, deck_status)
    @x = x
    @y = y
    @ship = ship
    @deck_number = deck_number
    @deck_status = deck_status
  end

  def ship_name(name)
    @ship_name = name
  end

  def ship_length(length)
    @ship_length = length
  end

  def check_ship_length(ship)
    ship.length == ship.coords.length
  end
end