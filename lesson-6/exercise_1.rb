
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
      @user ||= build_board x, y, :user
    end

    def computer_board(x, y)
      @computer ||= build_board x, y, :computer
    end

    def build_board(x, y, player)
      result = []
      (1..y).each do |y|
        (1..x).each do |x|
          result << Coord.new(x, y, player)
        end
      end
      result
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

  def right
    (self.player == :player) ? find_right(Coord.user) : find_right(Coord.computer)
  end

  def find_right(coords)
      coords.find { |coord| coord.x == self.x + 1 && coord.y == self.y }
  end

  def down
    (self.player == :player) ? find_down(Coord.user) : find_down(Coord.computer)
  end

  def find_down(coords)
    coords.find { |coord| coord.x == self.x && coord.y == self.y + 1 }
  end

  def to_s
    [self.x, self.y].to_s
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

    # в случайном порядке расставляет корабли на картах игрока и компьютера
    def locate_ships
      Ship.user_ships.each { |ship| locate_random ship, Coord.user; break }
      Ship.computer_ships.each { |ship| locate_random ship, Coord.computer; break }
    end

    def locate_random(ship, coords)
      # сначала ищем свободные координаты
      free_coords = free_coords coords
      # puts free_coords

      # потом ищем своодные места
      free_places = free_places ship, free_coords

      # случайным образом выбираем свободное место и устанавливаем корабль
      locate_ship_random ship, free_places
    end

    def free_coords(coords)
      coords.select {|coord| coord.ship.nil? }
    end

    def free_places(ship, free_coords)
      free_places = []
      free_coords.each do |coord|
        place = []
        cursor = coord
        (1..ship.length).each do |step|
          break unless cursor
          place << cursor if cursor && cursor.ship.nil?
          cursor = cursor.right
        end
        free_places << place if place.length == ship.length
      end
      free_places
    end

    def locate_ship_random(ship, free_places)
      ship.coords = free_places[Random.rand(1..free_places.length)]
      ship.coords.each_with_index do |coord, idx|
        coord.ship = ship
        coord.deck = idx + 1
        coord.deck_condition = :whole
      end
      p ship
      # установить в координаты данные о корабле
      # отрисовать корабль
      # сделать вертикальный вариант корабля
      # проверить как это работает с остальными кораблями
    end

    def draw
      puts "    А Б В Г Д Е Ж З И К     А Б В Г Д Е Ж З И К"
      (1..Board.y).each do |y|
        print sprintf(" %2d|", y)
        (1..Board.x).each do |x|
          print "_|"
        end
        print sprintf(" %2d|", y)
        (1..Board.x).each do |x|
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
          Ship.new(:battleship, 'battleship'),
          Ship.new(:cruiser, 'cruiser1'),
          Ship.new(:cruiser, 'cruiser2'),
          Ship.new(:destroyer, 'destroyer1'),
          Ship.new(:destroyer, 'destroyer2'),
          Ship.new(:destroyer, 'destroyer3'),
          Ship.new(:boat, 'boat1'),
          Ship.new(:boat, 'boat2'),
          Ship.new(:boat, 'boat3'),
          Ship.new(:boat, 'boat4')
      ]
    end
  end

  attr_accessor :coords, :name, :length

  def initialize(type, name)
    @type = type
    @name = name
    @length = ship_length type
    @coords = []
  end

  def ship_length(type)
    case type
      when :boat        then 1
      when :destroyer   then 2
      when :cruiser     then 3
      when :battleship  then 4
      else false
    end
  end
end



Board.create 10, 10
Ship.create_ships
Board.locate_ships
Board.draw
# Board.game