
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
    attr_accessor :x, :y

    def create(x, y)
      @instance ||= self.new x, y
    end

    # в случайном порядке расставляет корабли на карте
    def locate_ships

    end

    def draw
      puts "    А Б В Г Д Е Ж З И К     А Б В Г Д Е Ж З И К"
      (1..Board.y).each do |y|
        print sprintf(" %2d|", y)
        (1..Board
                .x).each do |x|
          print "_|"
        end
        print sprintf(" %2d|", y)
        (1..Board
                .x).each do |x|
          print "_|"
        end
        puts ''
      end
    end
  end

  attr_accessor :user, :computer

  def initialize(x, y)
    Board.x = x
    Board.y = y
    @user = Coord.user_board x, y             # доска игрока 10х10
    @computer = Coord.computer_board x, y     # доска компьютера 10х10
    @shoots = []                              # кто, куда, результат
  end


end
class Ship
  class << self
    attr_reader :user_ships, :computer_ships

    def create_ships
      @user_ships ||= build_ships
      @computer_ships ||= build_ships
    end

    def build_ships
      [
          {battleship: Ship.new(:battleship, 'battleship')},
          {cruiser1: Ship.new(:cruiser, 'cruiser1')},
          {cruiser2: Ship.new(:cruiser, 'cruiser2')},
          {destroyer1: Ship.new(:destroyer, 'destroyer1')},
          {destroyer2: Ship.new(:destroyer, 'destroyer2')},
          {destroyer3: Ship.new(:destroyer, 'destroyer3')},
          {boat1: Ship.new(:boat, 'boat1')},
          {boat2: Ship.new(:boat, 'boat2')},
          {boat3: Ship.new(:boat, 'boat3')},
          {boat4: Ship.new(:boat, 'boat4')}
      ]
    end
  end

  attr_accessor :coords

  def initialize(type, name)
    @type = type
    @name = name
  end
end



Board.create 10, 10
Ship.create_ships
Board.locate_ships
Board.draw
# Board.game