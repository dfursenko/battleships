# ДОМАШНЕЕ ЗАДАНИЕ. УРОК 4. Задание 2.

# 2. Начальник решил выписать сотрудникам премию, равную 10% от оклада.
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


class Salary
  include Plural

  attr_reader :int, :decimal

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


class Employer
  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    @salary = Salary.new(salary.to_f)
    @salary.add_bonus(0.1)
  end

  def to_str
    name
  end
end

print 'Введите имя сотрудника и его зарплату (имя зарплата): '
name, salary = gets.chomp.split(' ')
employer = Employer.new(name, salary)

puts 'Сотрудник ' + employer.name + ' в этом месяце получит ' +
         employer.salary.int + ' ' + employer.salary.formatted(:int) + ', ' +
         employer.salary.decimal + ' ' + employer.salary.formatted(:decimal) + '!'