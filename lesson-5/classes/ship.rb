class Ship
  BOAT_QUANTITY = 4
  DESTROYER_QUANTITY = 3
  CRASE_QUANTITY = 2
  BATTLESHIP_QUANTITY = 1
  MAX_SHIPS = 10
  @@total_ships = 0
  @@ships = {
      BOAT_QUANTITY => 0,
      DESTROYER_QUANTITY => 0,
      CRASE_QUANTITY => 0,
      BATTLESHIP_QUANTITY => 0
  }

  class << self
    def how_many(number)
      puts self.wrong_coords_message unless (1..4).include?(number)

      case number
      when 1 then 4
      when 2 then 3
      when 3 then 2
      when 4 then 1
      else false
      end
    end

    def wrong_coords_message
      'Введено некорректное количество координат кораблика. Пожалуйста, введите число от 1 до 4'
    end

    def total_ships
      @@total_ships
    end

    def ships
      @@ships
    end

    def how_much_all(ship)
      case ship.type
      when :boat        then BOAT_QUANTITY
      when :destroyer   then DESTROYER_QUANTITY
      when :crase       then CRASE_QUANTITY
      when :battleship  then BATTLESHIP_QUANTITY
      else false
      end
    end

    def how_much_already(ship)
      case ship.type
        when :boat        then @@ships[BOAT_QUANTITY]
        when :destroyer   then @@ships[DESTROYER_QUANTITY]
        when :crase       then @@ships[CRASE_QUANTITY]
        when :battleship  then @@ships[BATTLESHIP_QUANTITY]
        else false
      end
    end

    def how_much_more(ship)
      case ship.type
        when :boat        then BOAT_QUANTITY        - @@ships[BOAT_QUANTITY]
        when :destroyer   then DESTROYER_QUANTITY   - @@ships[DESTROYER_QUANTITY]
        when :crase       then CRASE_QUANTITY       - @@ships[CRASE_QUANTITY]
        when :battleship  then BATTLESHIP_QUANTITY  - @@ships[BATTLESHIP_QUANTITY]
        else false
      end
    end
  end

  attr_reader :type

  def initialize(type)
    @type = type
    return if ships_enough?
    ship_quantity_increase
    total_ships
  end

  def ships_enough?
    return true if check_quantity_all
    case @type
      when :boat        then check_quantity BOAT_QUANTITY
      when :destroyer   then check_quantity DESTROYER_QUANTITY
      when :crase       then check_quantity CRASE_QUANTITY
      when :battleship  then check_quantity BATTLESHIP_QUANTITY
      else false
    end
  end

  def ship_quantity_increase
    case @type
      when :boat        then @@ships[BOAT_QUANTITY] += 1
      when :destroyer   then @@ships[DESTROYER_QUANTITY] += 1
      when :crase       then @@ships[CRASE_QUANTITY] += 1
      when :battleship  then @@ships[BATTLESHIP_QUANTITY] += 1
      else false
    end
  end

  def total_ships
    @@total_ships = @@ships.inject(0) {|sum, value| sum += value[1]}
  end

  def check_quantity_all
    if @@total_ships == MAX_SHIPS
      puts 'Корабль не создан. Количество кораблей не должно превышать 10.'
      return true
    end
  end

  def check_quantity(quantity)
    @@ships[quantity] == quantity ? message_ship_enough : false
  end

  def message_ship_enough
    puts "#{name_ru.capitalize} не создан, их количество не должно превышать #{type_quantity}."
    true
  end

  def name_ru
    case @type
      when :boat       then 'катер'
      when :destroyer  then 'эсминец'
      when :crase      then 'крейсер'
      when :battleship then 'линкор'
      else false
    end
  end

  def type_quantity
    case @type
      when :boat       then BOAT_QUANTITY
      when :destroyer  then DESTROYER_QUANTITY
      when :crase      then CRASE_QUANTITY
      when :battleship then BATTLESHIP_QUANTITY
      else false
    end
  end

  def how_much_all
    Ship.how_much_all self
  end

  def how_much_already
    Ship.how_much_already self
  end

  def how_much_more
    Ship.how_much_more self
  end
end