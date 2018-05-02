require 'json'
require './classes/salary'

# Класс Worker
# - содержит информацию о работнике (имя, зарплата)
# - проверяет наличие введенной зарплаты
class Worker
  attr_accessor :name, :salary, :bonus

  def initialize(name, salary)
    @name = name
    @salary = Salary.new(salary.to_f) if check(salary)
    @salary.add_bonus(0.1)
    @bonus = @salary.bonus
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

  def to_s
    {name: @name, salary: @salary.salary}.to_s
  end

  def to_str
    name
  end

  def to_json
    {name: @name, salary: @salary.salary}.to_json
  end

  def Worker.show_all
    puts 'Список сотрудников:'
    File.readlines('./db/workers.txt').each do |line|
      hash = JSON.parse(line)
      puts "Сотрудник #{hash['name']}, зарплата #{hash['salary'].to_i.to_s_with_spaces}р."
    end
    puts ''
  end

  def Worker.get
    print 'Введите имя сотрудника и его зарплату (имя зарплата): '
    name, salary = gets.chomp.split(' ')
    Worker.new(name, salary)
  end

  def Worker.add
    worker = Worker.get
    File.open('./db/workers.txt', 'a') do |file|
      file.puts worker.to_json
    end
  end
end
