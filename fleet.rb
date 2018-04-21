require './ship'

class Fleet
  attr_reader :ships

  def initialize
    @ships = {
        a_1: Ship.new('battleship', :a1, 1),
        b_1: Ship.new('crase', :b1, 1),
        b_2: Ship.new('crase', :b2, 2),
        c_1: Ship.new('destroyer', :c1, 1),
        c_2: Ship.new('destroyer', :c2, 2),
        c_3: Ship.new('destroyer', :c3, 3),
        d_1: Ship.new('boat', :d1, 1),
        d_2: Ship.new('boat', :d2, 2),
        d_3: Ship.new('boat', :d3, 3),
        d_4: Ship.new('boat', :d4, 4)
    }
  end
end