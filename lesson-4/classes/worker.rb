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

  def Worker.route
    puts 'Выберите действие:',
         '1 - добавить сотрудника',
         '2 - изменить данные сотрудника',
         '3 - удалить сотрудника',
         '4 - вывести список сотрудников',
         '5 - завершить работу и выйти из программы'

    case gets.to_i
      when 1 then add
      when 2 then edit
      when 3 then delete
      when 4 then show_all
      when 5 then exit
      else raise 'Выберите действие из предложенных.'
    end

    show_all
    route
  end

  def Worker.show_all
    design do |content|
      all.each_with_index do |worker, index|
        design_line index + 1, worker
      end
    end
  end

  def Worker.all
    workers = []
    File.readlines('./db/workers.txt').each do |line|
      worker = JSON.parse(line)
      workers << Worker.new(worker['name'], worker['salary'])
    end
    workers
  end

  def Worker.add
    add_to_file Worker.get
  end

  def Worker.edit
    number = get_number
    new_worker = get
    workers = all
    workers[number].name = new_worker.name
    workers[number].salary = new_worker.salary
    save workers
  end

  def Worker.delete
    workers = all
    workers.delete_at(get_number)
    save workers
  end

  def Worker.get
    print 'Введите имя сотрудника и его зарплату (имя зарплата): '
    name, salary = gets.chomp.split(' ')
    Worker.new(name, salary)
  end

  private

  def Worker.get_number
    print 'Выберите номер сотрудника: '
    gets.to_i - 1
  end

  def Worker.design
    puts 'СПИСОК СОТРУДНИКОВ:'
    yield
    puts ''
  end

  def Worker.design_line(index, worker)
    puts sprintf("Сотрудник %<index>s: %<name>-10s -> зарплата: %<salary>8sр.", {
        index: index, name: worker.name, salary: worker.salary.to_i.to_s_with_spaces
    })
  end

  def Worker.add_to_file(worker)
    File.open('./db/workers.txt', 'a') do |file|
      file.puts worker.to_json
    end
  end

  def Worker.save(workers)
    File.open('./db/workers.txt', 'w+') do |file|
      workers.each do |worker|
        file.puts worker.to_json
      end
    end
  end
end
