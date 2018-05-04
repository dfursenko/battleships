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
  end

  def initialize(type)
    @type = type
    return if ships_enough?
    ship_quantity_increase
    total_ships
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

  def ships_enough?
    if @@total_ships == MAX_SHIPS
      puts 'Корабль не создан. Количество кораблей не должно превышать 10.'
      return true
    end

    if @type == :boat && @@ships[BOAT_QUANTITY] == BOAT_QUANTITY
      puts 'Катер не создан. Количество катеров не должно превышать 4.'
      message_ship_enough
      return true
    end

    if @type == :destroyer && @@ships[DESTROYER_QUANTITY] == DESTROYER_QUANTITY
      puts 'Эсминец не создан. Количество эсминцев не должно превышать 3.'
      return true
    end

    if @type == :crase && @@ships[CRASE_QUANTITY] == CRASE_QUANTITY
      puts 'Крейсер не создан. Количество крейсеров не должно превышать 2.'
      return true
    end

    if @type == :battleship && @@ships[BATTLESHIP_QUANTITY] == BATTLESHIP_QUANTITY
      puts 'Линкор не создан. Количество линкоров не должно превышать 1.'
      return true
    end

    # result =
    #   case type
    #     when :all         then    #@@total_ships == MAX_SHIPS
    #     when :boat        then    #false if
    #     when :destroyer   then    #@@ships[DESTROYER_QUANTITY]  += 1
    #     when :crase       then    #@@ships[CRASE_QUANTITY]      += 1
    #     when :battleship  then    #@@ships[BATTLESHIP_QUANTITY] += 1
    #     else false
    #   end
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

  def name_ru
    case @type
      when :boat       then 'катер'
      when :destroyer  then 'эсминец'
      when :crase      then 'крейсер'
      when :battleship then 'линкор'
      else false
    end
  end

  def message_ship_enough
    puts "#{name_ru.capitalize} не создан, их количество не должно превышать #{type_quantity}."
  end


end