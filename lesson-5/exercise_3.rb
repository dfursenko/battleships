require_relative 'classes/ship'

# ДОМАШНЕЕ ЗАДАНИЕ. Урок 5. Задание 2.
#
# 3. Создать классовую переменную ships, которая была бы хэшем и в качестве ключа хранила бы количество палуб,
#   а в качестве значения количество корабликов с этим количеством палуб. При создании нового кораблика нужно
#   вносить соответствующие изменения в хэш.

boat_1 = Ship.new(:boat)              # boat 1
p Ship.ships                                  # => @@ships = {4=>1, 3=>0, 2=>0, 1=>0}

boat_2 = Ship.new(:boat)              # boat 2
p Ship.ships                                  # => @@ships = {4=>2, 3=>0, 2=>0, 1=>0}

boat_3 = Ship.new(:boat)              # boat 3
p Ship.ships                                  # => @@ships = {4=>3, 3=>0, 2=>0, 1=>0}

boat_4 = Ship.new(:boat)              # boat 4
p Ship.ships                                  # => @@ships = {4=>4, 3=>0, 2=>0, 1=>0}

boat_5 = Ship.new(:boat)              # boat 5 => Катер не создан. Количество катеров не должно превышать 4.
p Ship.ships                                  # => @@ships = {4=>4, 3=>0, 2=>0, 1=>0}

destroyer_1 = Ship.new(:destroyer)    # destroyer 1
p Ship.ships                                  # => @@ships = {4=>4, 3=>1, 2=>0, 1=>0}

destroyer_2 = Ship.new(:destroyer)    # destroyer 2
p Ship.ships                                  # => @@ships = {4=>4, 3=>2, 2=>0, 1=>0}

destroyer_3 = Ship.new(:destroyer)    # destroyer 3
p Ship.ships                                  # => @@ships = {4=>4, 3=>3, 2=>0, 1=>0}

destroyer_4 = Ship.new(:destroyer)    # destroyer 4 => > Эсминец не создан. Количество эсминцев не должно превышать 3.
p Ship.ships                                  # => @@ships = {4=>4, 3=>3, 2=>0, 1=>0}

crase_1 = Ship.new(:crase)            # crase 1
p Ship.ships                                  # => @@ships = {4=>4, 3=>3, 2=>1, 1=>0}

crase_2 = Ship.new(:crase)            # crase 2
p Ship.ships                                  # => @@ships = {4=>4, 3=>3, 2=>2, 1=>0}

crase_3 = Ship.new(:crase)            # crase 3 => Крейсер не создан. Количество крейсеров не должно превышать 2.
p Ship.ships                                  # => @@ships = {4=>4, 3=>3, 2=>2, 1=>0}

battleship_1 = Ship.new(:battleship)    # battleship 1
p Ship.ships                                  # => @@ships = {4=>4, 3=>3, 2=>2, 1=>1}

battleship_2 = Ship.new(:battleship)    # battleship 2 => Линкор не создан. Количество линкоров не должно превышать 1.
p Ship.ships                                  # => @@ships = {4=>4, 3=>3, 2=>2, 1=>1}

puts "Всего построено кораблей: #{Ship.total_ships}"
# => Всего построено кораблей: 10
