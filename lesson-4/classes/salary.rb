require './classes/plural'
require './classes/helper'

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
    @int.to_s_with_spaces
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