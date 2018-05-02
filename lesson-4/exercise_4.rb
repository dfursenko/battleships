require './classes/worker'

# ДОМАШНЕЕ ЗАДАНИЕ. УРОК 4. Задания 4

# 4. К предыдущей задаче добавьте метод, который проверял бы наличие введенной
# зарплаты и выводил бы сообщение об ошибке, если зарплата не была указана.

print 'Введите имя сотрудника и его зарплату (имя зарплата): '
name, salary = gets.chomp.split(' ')
worker = Worker.new(name, salary)

puts 'Сотрудник ' + worker.name + ' в этом месяце получит ' +
         worker.salary.bonus_int_s_with_spaces + ' ' + worker.salary.formatted(:bonus_int) + ', ' +
         worker.salary.bonus_decimal_s + ' ' + worker.salary.formatted(:bonus_decimal) + '!'

# РЕЗУЛЬТАТ:
# Введите имя сотрудника и его зарплату (имя зарплата): Василий
# => Укажите зарплату вторым параметром через пробел после имени.
# => Пример: Иннокентий 70000 (RuntimeError)
