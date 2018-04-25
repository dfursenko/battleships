# ДОМАШНЕЕ ЗАДАНИЕ

# 1. Укоротить метод ​ my_loop...

  # Сделано:
  # - повторения описаны циклом
  # - добавлена возможность указывать конечное число
  # - добавлена возможность не использовать блок при вызове метода
  def my_loop(last = 3)
    n = 0
    puts 'Начало'
    yield n += 1 until n == last if block_given?
    puts 'Завершение'
  end

  # стандартный вызов
  my_loop {|n| puts n} # => Начало 1 2 3 Завершение

  # вызов до нужного числа
  my_loop(10) {|n| puts n} # => Начало 1 2 3 4 5 6 7 8 9 10 Завершение

  # вызов без блока
  my_loop # => Начало Завершение


# 2. Доработать Ship.how_many_ships(length)...

  # Сделано:
  # - проверка корректности вводимых данных
  # - использован case/when
  # - использован условный модификатор
  class Ship
    def Ship.how_many_ships(length)
      puts self.wrong_coords_message unless (1..4).include?(length)

      count =
        case length
        when 1 then 4
        when 2 then 3
        when 3 then 2
        when 4 then 1
        else false
        end
      puts count if count
    end

    def Ship.wrong_coords_message
      'Введено некорректное количество координат кораблика. Пожалуйста, введите число от 1 до 4'
    end
  end

  Ship.how_many_ships 3  # => 2
  Ship.how_many_ships 7 # => 'Введено некорректное количество координат кораблика...'


# 3. Создать метод, который принимает длину кораблика и массив координат...

  # Сделано:
  # - метод проверяет условие и выводит соответствующее сообщение
  # - метод реализован тремя способами:
  #    1. обычное условие
  #    2. тернарный оператор
  #    3. вариант с модификаторами и с передачей условия сравнения в блоке

  # вариант 1: обычное условие
  def ship_request_1(length, coords)
    puts result =
      if length == coords.size
        success_message
      else
        error_message
      end
  end

  # вариант 2: тернарный оператор
  def ship_request_2(length, coords)
    puts length == coords.size ? success_message : error_message
  end

  # вариант 3: вариант с модификаторами и с передачей условия сравнения в блоке
  def ship_request_3(length, coords)
    result = yield length, coords.size
    puts success_message if result
    puts error_message unless result
  end

  def success_message
    'Всё в порядке, можно плыть!'
  end
  def error_message
    'Извините, но ваш кораблик не достроен. Достройте его, а то он утонет!'
  end

  # 1
  puts 'Вариант 1'
  ship_request_1(4, [[2,2],[2,3],[2,4],[2,5]])  # => Всё в порядке, можно плыть!
  ship_request_1(4, [[2,2],[2,3]])  # => Извините, но ваш кораблик не достроен...

  # 2
  puts 'Вариант 2'
  ship_request_2(4, [[2,2],[2,3],[2,4],[2,5]]) # => Всё в порядке, можно плыть!
  ship_request_2(4, [[2,2],[2,3]]) # => Извините, но ваш кораблик не достроен...

  # 3
  puts 'Вариант 3'
  ship_request_2(4, [[2,2],[2,3],[2,4],[2,5]]) { |l, c| l == c } # => Всё в порядке, можно плыть!
  ship_request_2(4, [[2,2],[2,3]]) { |l, c| l == c } # => Извините, но ваш кораблик не достроен...


# 4. Создать метод, который принимает длину кораблика и запрашивает его координаты...

  # Сделано:
  # - метод запрашивает координаты в соответствии с длиной корабля
  # - метод реализован тремя способами:
  #    1. циклом loop
  #    2. циклом until
  #    3. итератором times

  # вариант 1: цикл loop
  def ask_ship_coords_1(length)
    coords = []
    n = 0

    puts 'Начинаем строительство первого корабля...'

    loop do
      puts "Введите координату #{n += 1}/#{length}:"
      coords << gets.to_i
      break if n == length
    end

    puts "Первый корабль построен. Его координаты #{coords}."
  end

  # вариант 2: цикл until
  def ask_ship_coords_2(length)
    coords = []
    n = 0

    puts 'Начинаем строительство второго корабля...'

    until coords.size == length
      puts "Введите координату #{n += 1}/#{length}:"
      coords << gets.to_i
    end

    puts "Второй корабль построен. Его координаты #{coords}."
  end

  # вариант 3: итератор times
  def ask_ship_coords_3(length)
    coords = []
    n = 0

    puts 'Начинаем строительство третьего корабля...'

    length.times do
      puts "Введите координату #{n += 1}/#{length}:"
      coords << gets.to_i
    end

    puts "Третий корабль построен. Его координаты #{coords}."
  end

  # 1
  ask_ship_coords_1(4) # => Корабль построен. Его координаты [1, 2, 3, 4].

  # 2
  ask_ship_coords_2(4) # => Корабль построен. Его координаты [1, 2, 3, 4].

  # 3
  ask_ship_coords_3(4) # => Корабль построен. Его координаты [1, 2, 3, 4].


# 5. Дан массив [‘cat’, ‘dog’, ‘tiger’]. Вернуть массив, состоящий только из элементов...

  # Сделано:
  # - возвращается массив элементов содержащих символ 't'
  # - реализовано в двух вариантах:
  #    1. с использованием метода map
  #    2. с использованием метода delete_if (более короткий вариант)

  arr = %w[cat, dog, tiger]

  # вариант 1: с использованием map
  p arr.map { |animal| animal if animal.include?('t') }.compact! # => ["cat,", "tiger"]

  # вариант 2: более короткая запись
  p arr.delete_if { |animal| !animal.include?('t') } # => ["cat,", "tiger"]


# 6. *Дан массив [‘cat’, ‘dog’, ‘tiger’]. Используя итератор map...

  # Сделано:
  # - выводится список элементов с заглавной буквы, а после - в оригинальном виде
  # - записано в одну строку

  arr = %w[cat, dog, tiger]

  arr.map(&:capitalize).map{ |a| puts a; a }.map(&:downcase).map{ |a| puts a; a }


