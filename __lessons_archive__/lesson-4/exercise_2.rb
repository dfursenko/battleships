require './classes/worker'

# ДОМАШНЕЕ ЗАДАНИЕ. УРОК 4. Задания 2

# 2. Начальник решил выписать сотрудникам премию, равную 10% от оклада.
#   Напишите программу, которая бы считывала имя сотрудника,
#     его зарплату и выводила бы на экран строку вида
#     «Сотрудник (имя) в этом месяце получит (сумма оклада и премии) рублей!»
#   Выполните эту задачу, не используя интерполяцию!
#   Помните о пустой строке, которая прибавляется при вводе значений с консоли.

worker = Worker.get

puts 'Сотрудник ' + worker.name + ' в этом месяце получит ' +
         worker.salary.bonus_int_s_with_spaces + ' ' + worker.salary.formatted(:bonus_int) + ', ' +
         worker.salary.bonus_decimal_s + ' ' + worker.salary.formatted(:bonus_decimal) + '!'

# РЕЗУЛЬТАТ:
# Введите имя сотрудника и его зарплату (имя зарплата): <= Василий 200_234
# => Сотрудник Василий в этом месяце получит 220 257 рублей, 40 копеек!
