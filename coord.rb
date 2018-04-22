class Coord
  def initialize(x,y)
    @x = x
    @y = y
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