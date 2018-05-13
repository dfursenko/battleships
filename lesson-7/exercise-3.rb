require_relative './classes/study_group'

# ДОМАШНЕЕ ЗАДАНИЕ 7. Задание 1.

# 3. Найти всех школьников, чья фамилия начинается на “А”
#
#   Реализовано двумя способами:
#     1. Методом .select
#     2. Методом .grep

students = %w[Иванов Петров Сидоров Алексеева Казанцев Антропов Анисимова Кузнецов Соловьев Кошкина]
group = StudyGroup.new(students)

# Вариант 1: .select
puts group.select {|student| student if student.split('').first == 'А' }

# Вариант 2: .grep
puts group.grep(/^А/)


# РЕЗУЛЬТАТ:
# => Алексеева
# => Антропов
# => Анисимова
