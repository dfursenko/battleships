require './classes/worker'

# ДОМАШНЕЕ ЗАДАНИЕ. УРОК 4. Задания 7

# 7. * Существует класс Worker (работник), у каждого работника есть имя и зарплата, которые считываются с консоли.
#   Необходимо организовать консольный вывод списка сотрудников и их заработных плат.
#   Нельзя использовать более трех переменных!

# workers = [
#     {name: 'Василий', salary: 120000},
#     {name: 'Игорь', salary: 70000},
#     {name: 'Николай', salary: 80000},
#     {name: 'Семён', salary: 100000}
# ]
$workers = [
    Worker.new('Василий', 120000),
    Worker.new('Игорь', 70000),
    Worker.new('Николай', 80000),
    Worker.new('Семён', 100000)
]
$action = nil

def list
  puts 'СПИСОК СОТРУДНИКОВ:'
  $workers.each_with_index do |worker, index|
    puts "#{index + 1}. #{worker.name}: зарплата #{worker.salary}р."
  end
  puts ''
end

def ask_action
  puts 'Выберите действие:',
       '1 - добавить сотрудника',
       '2 - изменить данные сотрудника',
       '3 - удалить сотрудника',
       '4 - вывести список сотрудников',
       '5 - завершить работу и выйти из программы'
  $action = gets.to_i
end

def add_worker
  print 'Введите имя сотрудника и его зарплату (имя зарплата): '
  name, salary = gets.chomp.split(' ')
  $workers << Worker.new(name, salary)
end

def edit_worker
  print 'Выберите номер сотрудника: '
  number = gets.to_i - 1
  print 'Введите новые данные сотрудника (имя зарплата): '
  name, salary = gets.chomp.split(' ')
  $workers[number].name = name
  $workers[number].salary = salary
end

def delete_worker
  print 'Введите номер сотрудника: '
  number = gets.to_i - 1
  $workers.delete_at(number)
end

list
ask_action
case $action
  when 1 then add_worker
  when 2 then edit_worker
  when 3 then delete_worker
  when 4 then list
  when 5 then exit
  else raise 'Выберите действие из предложенных.'
end

list


# puts 'Сотрудник ' + worker.name + ' в этом месяце получит ' +
#          worker.salary.bonus_int + ' ' + worker.salary.formatted(:bonus_int) + ', ' +
#          worker.salary.bonus_decimal + ' ' + worker.salary.formatted(:bonus_decimal) + '!'

# РЕЗУЛЬТАТ:
# Введите имя сотрудника и его зарплату (имя зарплата): Василий 200_234
# => Сотрудник Василий в этом месяце получит 220 257 рублей, 40 копеек!


