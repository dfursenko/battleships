require_relative 'sea_battle'

class User
  def shoot(x, y)
    coord = SEA_BATTLE.board.select {|coord| coord[:coord].x == x && coord[:coord].y == y}[0]
    coord[:shooted] = true
  end
end