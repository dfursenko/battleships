require './classes/plural'
require './classes/helper'

# Класс Salary
# - хранит информацию о зарплате,
# - вычисляет премию
# - расчитывает информацию о целой и дробной частях премии
# - формирует вывод зарплаты в консоль в необходимом формате
class Salary
  include Plural

  attr_reader :salary, :bonus, :bonus_int, :bonus_decimal

  def initialize(salary)
    @salary = salary
  end

  def calculate
    @bonus_int = @bonus.to_i
    @bonus_decimal = ((@bonus - @bonus_int).round(2) * 100).to_i
  end

  def add_bonus(percent)
    @bonus = @salary + @salary * percent
    calculate
  end

  def bonus_int_s_with_spaces
    @bonus_int.to_s_with_spaces
  end

  def bonus_decimal_s
    @bonus_decimal.to_s
  end

  def formatted(type)
    if type == :bonus_int
      pluralize(@bonus_int, 'рубль', 'рубля', 'рублей')
    elsif type == :bonus_decimal
      pluralize(@bonus_decimal, 'копейку', 'копейки', 'копеек')
    end
  end

  def to_s
    @salary.to_s
  end

  def to_str
    @salary.to_s
  end

  def to_i
    @salary.to_i
  end
end
