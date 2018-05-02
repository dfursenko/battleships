class Ship
  attr_reader :length, :coords

  def initialize
    @coords = []
  end

  def length=(length)
    if (1..4).include?(length)
      @length = length
    else
      raise 'Длина кораблика должна быть от 1 до 4'
    end
  end

  def Ship.how_many_ships(length)
    case length
      when 1 then 4
      when 2 then 3
      when 3 then 4
      when 4 then 1
      else false
    end
  end
end