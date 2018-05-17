require_relative 'classes/ship'

# ДОМАШНЕЕ ЗАДАНИЕ. Урок 5. Задание 4.
#
# 4. Создать метод, который принимал бы объект кораблик и мог бы выводить,
#   сколько еще есть корабликов с таким же количеством палуб. (по желанию)

# Сделано:
# - Добавлены методы возвращающие:
#     1. допустимое количество кораблей, т.е. сколько всего можем построить кораблей указанного типа
#     2. количество уже построенных кораблей указанного типа
#     3. сколько еще кораблей указанного типа мы можем построить
# - Методы реализованны двумя способами:
#     1. Методами класса
#     2. Методами экземпляра


# МЕТОДЫ КЛАССА
# Создаем объекты
boat      = Ship.new :boat
destroyer = Ship.new :destroyer

# Сколько всего катеров
puts Ship.how_much_all boat                    # => 4
# Катеров построено
puts Ship.how_much_already boat                # => 1
# Можно еще построить катеров
puts Ship.how_much_more boat                   # => 3

# Сколько всего эсминцев
puts Ship.how_much_all destroyer               # => 3
# Эсминцев построено
puts Ship.how_much_already destroyer           # => 1
# Можно еще построить эсминцев
puts Ship.how_much_more destroyer              # => 2


# МЕТОДЫ ЭКЗЕМПЛЯРА
# Создаем объекты
crase       = Ship.new :crase
battleship  = Ship.new :battleship

# Сколько всего крейсеров
puts crase.how_much_all                        # => 2
# Крейсеров построено
puts crase.how_much_already                    # => 1
# Можно еще построить крейсеров
puts crase.how_much_more                       # => 1

# Сколько всего линкоров
puts battleship.how_much_all                   # => 1
# Линкоров построено
puts battleship.how_much_already               # => 1
# Можно еще построить линкоров
puts battleship.how_much_more                  # => 0
