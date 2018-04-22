class Ship
  attr_reader :type, :name, :length, :number, :status
  attr_accessor :coords, :displayed

  def initialize(type, name, number)
    @type = type
    @name = name
    @number = number
    case type
      when :battleship then @length = 4
      when :crase then @length = 3
      when :destroyer then @length = 2
      when :boat then @length = 1
      else false
    end
    @status = :whole
    @coords = []
    @displayed = false
  end

end