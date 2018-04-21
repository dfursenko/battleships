require './ship'

class Fleet
  attr_reader :ships

  def initialize
    ship_a1 = Ship.new('battleship')
    ship_b1 = Ship.new('crase')
    ship_b2 = Ship.new('crase')
    ship_c1 = Ship.new('destroyer')
    ship_c2 = Ship.new('destroyer')
    ship_c3 = Ship.new('destroyer')
    ship_d1 = Ship.new('boat')
    ship_d2 = Ship.new('boat')
    ship_d3 = Ship.new('boat')
    ship_d4 = Ship.new('boat')

    @ships = [
        {a1: ship_a1},
        {b1: ship_b1},
        {b2: ship_b2},
        {c1: ship_c1},
        {c2: ship_c2},
        {c3: ship_c3},
        {d1: ship_d1},
        {d2: ship_d2},
        {d3: ship_d3},
        {d4: ship_d4},
    ]
  end
end