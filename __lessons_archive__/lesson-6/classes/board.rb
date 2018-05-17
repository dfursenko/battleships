require_relative 'ship'
require_relative 'coord'

class Board
  class << self
    attr_accessor :x, :y

    def create(x, y)
      @instance ||= self.new x, y
    end

    # в случайном порядке расставляет корабли на картах игрока и компьютера
    def locate_ships
      Ship.user_ships.each { |ship| locate_random ship, Coord.user }
      Ship.computer_ships.each { |ship| locate_random ship, Coord.computer }
    end

    def locate_random(ship, coords)
      # сначала ищем свободные координаты
      free_coords = free_coords coords
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
      collect_free_places(ship, free_coords, free_places, :horizontal)
      collect_free_places(ship, free_coords, free_places, :vertical)
      free_places
    end

    def collect_free_places(ship, free_coords, free_places, direction)
      free_coords.each do |coord|
        place = []
        cursor = coord
        (1..ship.length).each do |step|
          break unless cursor
          place << cursor if cursor.ship.nil?
          cursor = direction == :horizontal ? cursor.right : cursor.down
        end
        free_places << place if place.length == ship.length
      end
    end

    def locate_ship_random(ship, free_places)
      ship.coords = random_coords free_places
      ship.fill_coords
      ship.near_coords
    end

    def random_coords(free_places)
      index = random_index(free_places)
      free_places[index - 1]
    end

    def random_index(free_places)
      Random.rand(1..free_places.length)
    end

    def draw
      puts "    А Б В Г Д Е Ж З И К     А Б В Г Д Е Ж З И К"
      (1..Board.y).each do |y|
        draw_line y, Coord.user
        draw_line y, Coord.computer
        puts ''
      end
    end

    def draw_line(y, coords)
      print sprintf(" %2d|", y)
      (1..Board.x).each do |x|
        coord = coords.find { |coord| coord.x == x && coord.y == y }
        print result = if coord.ship?
                         "▪"
                       elsif coord.near_ship?
                         "·"
                       else
                         "_"
                       end
        print '|'
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