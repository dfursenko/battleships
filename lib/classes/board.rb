require_relative 'ship'
require_relative 'coord'

class Board
  BOARD_X = 10
  BOARD_Y = 10

  attr_reader :user, :computer

  def initialize
    puts 'Board.initialize'
    @user = user_board BOARD_X, BOARD_Y             # доска игрока 10х10
    @computer = computer_board BOARD_X, BOARD_Y     # доска компьютера 10х10
    Coord.user = @user
    Coord.computer = @computer
    @shoots = []                                    # кто, куда, результат
    create_ships
    locate_ships
  end

  def user_board(x = 10, y = 10)
    @user ||= build_board x, y, :user
  end

  def computer_board(x = 10, y = 10)
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

  def create_ships
    Ship.create_ships
  end

  # в случайном порядке расставляет корабли на картах игрока и компьютера
  def locate_ships
    Ship.user_ships.each { |ship| locate_random ship, @user }
    Ship.computer_ships.each { |ship| locate_random ship, @computer }
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
end