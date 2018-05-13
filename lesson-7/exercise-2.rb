require_relative './classes/study_group'

# ДОМАШНЕЕ ЗАДАНИЕ 7. Задание 2.

# 2. Найти первого в списке посещающих кружок программирования школьника, чья фамилия начинается на “А”.
#
# Сделано:
#   - Реализовано тремя способами:
#     1. Методом .select
#     2. Методом .find
#     3. Методом .grep

students = %w[Иванов Петров Сидоров Алексеева Казанцев Антропов Анисимова Кузнецов Соловьев Кошкина]
group = StudyGroup.new(students)

# Вариант 1: .select
puts group.select {|student| student if student.split('').first == 'А' }.first

# Вариант 2: .find
puts group.find {|student| student.split('').first == 'А' }

# Вариант 3: .grep
puts group.grep(/^А/).first


# РЕЗУЛЬТАТ:
# => Алексеева
