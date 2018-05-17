require_relative 'coord'

class SeaBattle
  BOARD_WIDTH = 10
  BOARD_HEIGHT = 10

  attr_accessor :board

  def initialize
    coord = Coord.new 1, 1

    @board = []
    (1..BOARD_WIDTH).each do |coord_x|
      (1..BOARD_HEIGHT).each do |coord_y|
        @board << {coord: Coord.new(coord_x, coord_y), shooted: false}
      end
    end

  end

  def check_coord(x, y)
    coord = SEA_BATTLE.board.select {|coord| coord[:coord].x == x && coord[:coord].y == y}[0]
    coord[:shooted]
  end
end
SEA_BATTLE = SeaBattle.new