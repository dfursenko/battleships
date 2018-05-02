require 'json'

# ДОМАШНЕЕ ЗАДАНИЕ. УРОК 4. Задания 2, 4

# 2. Начальник решил выписать сотрудникам премию, равную 10% от оклада...
# 4. К предыдущей задаче добавьте метод, который проверял бы наличие введенной зарплаты и выводил бы сообщение
#   об ошибке, если зарплата не была указана.
# 5.*В задании с начальником сохранить зарплату и имя сотрудника в файл. Загружать при старте программы из файла.

# Модуль Plural
# изменяет слово в зависимости от количества
module Plural
  def pluralize(value, one, two, three)
    i = value.to_s.split('').last.to_i
    if i == 1
      one
    elsif i == 2 || i == 3 || i == 4
      two
    else
      three
    end
  end
end

# Класс Salary
# - хранит информацию о зарплате,
# - вычисляет премию
# - расчитывает информацию о целой и дробной частях зарплаты
# - формирует вывод зарплаты в консоль в необходимом формате
class Salary
  include Plural

  attr_reader :salary, :int, :decimal

  def initialize(salary)
    @salary = salary
  end

  def calculate
    @int = @salary.to_i
    @decimal = ((@salary - @int).round(2) * 100).to_i
  end

  def add_bonus(percent)
    @salary += @salary *= percent
    calculate
  end

  def int
    @int.to_s
  end

  def decimal
    @decimal.to_s
  end

  def formatted(type)
    if type == :int
      pluralize(@int, 'рубль', 'рубля', 'рублей')
    elsif type == :decimal
      pluralize(@decimal, 'копейку', 'копейки', 'копеек')
    end
  end

  def to_str
    @salary
  end
end

# Класс Employer
# - содержит информацию о работнике (имя, зарплата)
# - проверяет наличие введенной зарплаты
class Employer
  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    check(salary)
    @salary = Salary.new(salary.to_f)
    @salary.add_bonus(0.1)
  end

  # Проверяет наличие введенной зарплаты и выводит сообщение
  #   об ошибке, если зарплата не была указана. (Задание 4)
  def check(salary)
    raise message_salary_missing unless salary
  end

  def message_salary_missing
    'Укажите зарплату вторым параметром через пробел после имени. '+ "\e[32mПример: Иннокентий 70000\e[0m"
  end

  def to_str
    name
  end

  def to_json
    {name: @name, salary: @salary.salary}.to_json
  end
end

puts File.read('employers.txt')

File.open('employers.txt', 'w+') do |file|
  employer = Employer.new('Дмитрий', 70000)
  e_json = employer.to_json
  file.puts e_json
end

file = File.read('employers.txt')
hash = JSON.parse file
employer = Employer.new(hash['name'], hash['salary'])
# puts employer

# print 'Введите имя сотрудника и его зарплату (имя зарплата): '
# name, salary = gets.chomp.split(' ')
# employer = Employer.new(name, salary)

puts 'Сотрудник ' + employer.name + ' в этом месяце получит ' +
         employer.salary.int + ' ' + employer.salary.formatted(:int) + ', ' +
         employer.salary.decimal + ' ' + employer.salary.formatted(:decimal) + '!'



