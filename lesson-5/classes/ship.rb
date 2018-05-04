class Ship
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
  end

end