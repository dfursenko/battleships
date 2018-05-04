class Ship
  MAX_SHIPS = 10
  @@total_ships = 0

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
  end

  def initialize(type)
    return if @@total_ships == MAX_SHIPS
    @type = type
    @@total_ships += 1
    p type
  end
end