require 'json'
require './classes/salary'

# Класс Worker
# - содержит информацию о работнике (имя, зарплата)
# - проверяет наличие введенной зарплаты
class Worker
  attr_accessor :name, :salary

  def initialize(name, salary)
    @name = name
    @salary = Salary.new(salary.to_f) if check(salary)
    @salary.add_bonus(0.1)
  end

  # Проверяет наличие введенной зарплаты и выводит сообщение
  #   об ошибке, если зарплата не была указана. (Задание 4)
  def check(salary)
    salary ||= raise message_salary_missing
  end

  def message_salary_missing
    'Укажите зарплату вторым параметром через пробел после имени. '+ "\e[32mПример: Иннокентий 70000\e[0m"
  end

  def arr_output
    [@name + ' ' + @salary.salary.to_s]
  end

  def to_str
    name
  end

  def to_json
    {name: @name, salary: @salary.salary}.to_json
  end
end
