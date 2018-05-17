class Coord
  class << self
    attr_accessor :user, :computer, :user_json, :computer_json

    def ship?(x, y, player = :user)
      (player == :user) ? find_ship(x, y, Coord.user) : find_ship(x, y, Coord.computer)
    end

    def find_ship(x, y, coords)
      coord = coords.find { |coord| (coord.x && coord.x == x) && (coord.y && coord.y == y) }
      !coord.ship.class == Ship
    end
  end

  attr_reader :x, :y, :player
  attr_accessor :ship, :deck, :deck_condition

  def initialize(x, y, player)
    @x = x
    @y = y
    @player = player
    @ship = nil               # nil, :near_ship, Ship
    @deck = nil               # nil, 1, 2, 3, 4
    @deck_condition = nil     # nil, :whole, :damaged
  end

  def top
    (self.player == :user) ? find_top(Coord.user) : find_top(Coord.computer)
  end

  def find_top(coords)
    coords.find { |coord| coord.x == self.x && coord.y == self.y - 1 }
  end

  def right
    (self.player == :user) ? find_right(Coord.user) : find_right(Coord.computer)
  end

  def find_right(coords)
    coords.find { |coord| coord.x == self.x + 1 && coord.y == self.y }
  end

  def down
    (self.player == :user) ? find_down(Coord.user) : find_down(Coord.computer)
  end

  def find_down(coords)
    coords.find { |coord| coord.x == self.x && coord.y == self.y + 1 }
  end

  def left
    (self.player == :user) ? find_left(Coord.user) : find_left(Coord.computer)
  end

  def find_left(coords)
    coords.find { |coord| coord.x == self.x - 1 && coord.y == self.y }
  end

  def left_top
    (self.player == :user) ? find_left_top(Coord.user) : find_left_top(Coord.computer)
  end

  def find_left_top(coords)
    coords.find { |coord| coord.x == self.x - 1 && coord.y == self.y - 1 }
  end

  def right_top
    (self.player == :user) ? find_right_top(Coord.user) : find_right_top(Coord.computer)
  end

  def find_right_top(coords)
    coords.find { |coord| coord.x == self.x + 1 && coord.y == self.y - 1 }
  end

  def left_down
    (self.player == :user) ? find_left_down(Coord.user) : find_left_down(Coord.computer)
  end

  def find_left_down(coords)
    coords.find { |coord| coord.x == self.x - 1 && coord.y == self.y + 1 }
  end

  def right_down
    (self.player == :user) ? find_right_down(Coord.user) : find_right_down(Coord.computer)
  end

  def find_right_down(coords)
    coords.find { |coord| coord.x == self.x + 1 && coord.y == self.y + 1 }
  end

  def ship?
    true if self.ship.class == Ship
  end

  def near_ship?
    true if self.ship == :near_ship
  end

  def to_s
    [self.x, self.y].to_s
  end
end