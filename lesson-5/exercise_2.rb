require_relative 'classes/ship'

# ДОМАШНЕЕ ЗАДАНИЕ. Урок 5. Задание 2.
#
# 2. Создать классовую переменную total_ships, которая хранила бы количество созданных корабликов.
#   При создании нового кораблика проверять, не будет ли он лишним (всего может быть только 10 корабликов).

boat_1        = Ship.new(:boat)       # => true (1)
boat_2        = Ship.new(:boat)       # => true (2)
boat_3        = Ship.new(:boat)       # => true (3)
boat_4        = Ship.new(:boat)       # => true (4)
destroyer_1   = Ship.new(:destroyer)  # => true (5)
destroyer_2   = Ship.new(:destroyer)  # => true (6)
destroyer_3   = Ship.new(:destroyer)  # => true (7)
crase_1       = Ship.new(:crase)      # => true (8)
crase_2       = Ship.new(:crase)      # => true (9)
battleship    = Ship.new(:battleship) # => true (10)

another       = Ship.new(:boat)       # => false (11)
else_one      = Ship.new(:battleship) # => false (12)

puts "Всего построено кораблей: #{Ship.total_ships}"

# РЕЗУЛЬТАТ
# => :boat
# => :boat
# => :boat
# => :boat
# => :destroyer
# => :destroyer
# => :destroyer
# => :crase
# => :crase
# => :battleship
# => Всего построено кораблей: 10
