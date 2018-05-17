require_relative 'coord'

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

    def next_ship_type(income_ship)
      ship = @user_ships.find { |s| s.name == income_ship.name }
      index = @user_ships.index(ship)
      @user_ships[index + 1].type if @user_ships[index + 1]
    end
  end

  attr_accessor :type, :coords, :name, :length

  def initialize(type, name, coords = [])
    @type = type
    @name = name
    @length = ship_length type
    @coords = coords
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

  def fill_coords
    self.coords.each_with_index do |coord, idx|
      coord.ship = self
      coord.deck = idx + 1
      coord.deck_condition = :whole
    end
  end

  def near_coords
    near_coords = []
    self.coords.each do |coord|
      near_coords << coord.top if coord.top
      near_coords << coord.left if coord.left
      near_coords << coord.right if coord.right
      near_coords << coord.down if coord.down
      near_coords << coord.left_top if coord.left_top
      near_coords << coord.right_top if coord.right_top
      near_coords << coord.left_down if coord.left_down
      near_coords << coord.right_down if coord.right_down
    end
    near_coords.each do |coord|
      coord.ship = :near_ship unless coord.ship.class == Ship
    end
  end
end