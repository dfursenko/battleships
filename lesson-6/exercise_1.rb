
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
  class << self
    attr_accessor :user, :computer

    def user_board(x = 10, y = 10)
      @user ||= build_board x, y
    end

    def computer_board(x, y)
      @computer ||= build_board x, y
    end

    def build_board(x, y)
      result = []
      (1..x).each do |x|
        (1..y).each do |y|
          result << Coord.new(x, y)
        end
      end
      result
    end
  end

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @ship = nil               # nil, :near_ship, Ship
    @deck = nil               # nil, 1, 2, 3, 4
    @deck_condition = nil     # nil, :whole, :damaged
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

  attr_accessor :user, :computer

  def initialize(x, y)
    @user = Coord.user_board x, y             # доска игрока 10х10
    @computer = Coord.computer_board x, y     # доска компьютера 10х10
    @shoots = []                              # кто, куда, результат
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
      @user_ships ||= build_ships
      @computer_ships ||= build_ships
      # p Coord.user_board
    end

    def build_ships
      [
          {boat1: Ship.new(:boat, 'boat1')},
          {boat2: Ship.new(:boat, 'boat2')},
          {boat3: Ship.new(:boat, 'boat3')},
          {boat4: Ship.new(:boat, 'boat4')},
          {destroyer1: Ship.new(:destroyer, 'destroyer1')},
          {destroyer2: Ship.new(:destroyer, 'destroyer2')},
          {destroyer3: Ship.new(:destroyer, 'destroyer3')},
          {cruiser1: Ship.new(:cruiser, 'cruiser1')},
          {cruiser2: Ship.new(:cruiser, 'cruiser2')},
          {battleship: Ship.new(:battleship, 'battleship')},
      ]
    end
  end

  def initialize(type, name)
    @type = type
    @name = name
  end
end



board = Board.create 10, 10
# p board.user
ships = Ship.create_ships
p ships
# board.locate_ships ships
# board.draw
# board.game