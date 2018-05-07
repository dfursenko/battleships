require_relative 'classes/track'

# ДОМАШНЕЕ ЗАДАНИЕ. Урок 5. Задание 9.
#
# 9. * Попробовать найти альтернативу использования переменной класса для примера с тягачом Truck,
#   который при наследовании от Car неправильно просчитывал количество моделей и пр.

# Сделано:
# - хранение организовано в базе данных Sqlite3
# - подсчет общего количества машин учитывает класс, который вызывает метод
#     1. количество машин класса Car: 3
#     2. количество машин класса Track: 0

Car.add_mark('Honda')
Car.add_mark('Kia')
Car.add_mark('UAZ')

h1 = Car.new('Honda')
h2 = Car.new('Honda')
k1 = Car.new('Kia')
k2 = Car.new('Kia')
k3 = Car.new('Kia')
u1 = Car.new('UAZ')
u2 = Car.new('UAZ')
u3 = Car.new('UAZ')

puts "Существует #{u2.mark_mates} машин марки '#{u2.mark}', как и u2."
puts "Всего на заводе #{Car.total_count} машин."

puts "Total trucks count: #{Track.total_count}"

# РЕЗУЛЬТАТ
# => Существует 3 машин марки 'UAZ', как и u2.
# => Всего на заводе 8 машин.
# => Total trucks count: 0
