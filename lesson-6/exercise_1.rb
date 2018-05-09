
# ДОМАШНЕЕ ЗАДАНИЕ. Урок 6. Задание 1.
#
# 1. При создании кораблика должен создаваться массив, размера, соответствующего размеру кораблика,
#   и состоящий из координат Х и Y. Подумать, что будет служить элементом в таком массиве.

# battleship = Ship.new(:battleship, [[1,1],[1,2],[1,3],[1,4]])
#
# puts battleship

# есть список объектов кораблей, которые состоят из списка объектов координат
# координаты содержат информацию о том, что в них находится. кликнув в координату можно узнать,
# что там есть палуба кораблся, можно узнать какого кораблся. Или можно узнать, что эта координата занята, потому что
# рядом уже стоит корабль. Можно узнать состояние палубы корабля. Но нельзя узнать состояние корабля.
# Состояние кораблся можно узнать у корабля, насколько он целый.
#
#
# 1. Создать карту, нарисовать её
# 2. Создать корабли, разместить их на карте, нарисовать их
# 3.
class Coord
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end
class Shot

end
class User

end
class Board
  class << self
    def create(x, y)
      @instance ||= self.new x, y
    end
  end

  attr_accessor :coords_user, :coords_comp

  def initialize(x, y)
    @coords_user = coords_build x, y
    @coords_comp = coords_build x, y

  end

  def coords_build(x, y)
    result = []
    (1..x).each do |x|
      (1..y).each do |y|
        result << Coord.new(x, y)
      end
    end
    result
  end

  def locate_ships(ships)

  end

  def draw
    puts "А Б В Г Д Е Ж З И К     А Б В Г Д Е Ж З И К"

  end
end
class Ship
  class << self
    def create_ships

    end

  end
end



board = Board.create 10, 10
ships = Ship.create_ships
board.locate_ships ships
board.draw
board.game