require_relative './classes/study_group'

# ДОМАШНЕЕ ЗАДАНИЕ 7. Задание 4.

# 4. Найти самого преуспевающего школьника из кружка при помощи метода max.
#   Успеваемость ученика определяется в зависимости от количества решенных задач.

students = [
    {name: 'Иванов',    progress: 73},
    {name: 'Петров',    progress: 69},
    {name: 'Сидоров',   progress: 71},
    {name: 'Алексеева', progress: 88},
    {name: 'Казанцев',  progress: 94}, # max
    {name: 'Антропов',  progress: 68},
    {name: 'Анисимова', progress: 74},
    {name: 'Кузнецов',  progress: 92},
    {name: 'Соловьев',  progress: 84},
    {name: 'Кошкина',   progress: 79}
]
group = StudyGroup.new(students)

puts group.max { |a, b| a[:progress] <=> b[:progress] }[:name]

# РЕЗУЛЬТАТ:
# => Казанцев
