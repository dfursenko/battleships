require './classes/worker'
require './classes/helper'

# ДОМАШНЕЕ ЗАДАНИЕ. УРОК 4. Задания 5

# 5.*В задании с начальником сохранить зарплату и имя сотрудника в файл.
#   Загружать при старте программы из файла.

# $workers = [
#     Worker.new('Василий', 120000),
#     Worker.new('Игорь', 70000),
#     Worker.new('Николай', 80000),
#     Worker.new('Семён', 100000)
# ]
# $workers2 = []

# puts File.read('workers.txt')
#
# File.readlines('workers.txt', 'w+').each do |file|
#   employer = Worker.new('Дмитрий', 70000)
#   e_json = employer.to_json
#   file.puts e_json
# end
#
# hash = JSON.parse File.read('workers.txt')
# employer = Worker.new(hash['name'], hash['salary'])
# puts employer
#

# worker = $workers[0]
# puts worker.to_json

# File.open('./db/workers.txt', 'w+') do |file|
#   $workers.each do |worker|
#     file.puts worker.to_json
#   end
# end

def list
  puts 'Список сотрудников:'
  File.readlines('./db/workers.txt').each do |line|
    hash = JSON.parse(line)
    puts "Сотрудник #{hash['name']}, зарплата #{hash['salary'].to_i.to_s_with_spaces}р."
  end
  puts ''
end

list

print 'Введите имя сотрудника и его зарплату (имя зарплата): '
name, salary = gets.chomp.split(' ')
worker = Worker.new(name, salary)

File.open('./db/workers.txt', 'a') do |file|
  file.puts worker.to_json
end

list