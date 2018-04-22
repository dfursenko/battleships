require './ship'

class SeaBattle

  def initialize
    @x = (1..10)
    @y = (1..10)
    @ships_player = {
        a_1: Ship.new(:battleship, :a1, 1),
        b_1: Ship.new(:crase, :b1, 1),
        b_2: Ship.new(:crase, :b2, 2),
        c_1: Ship.new(:destroyer, :c1, 1),
        c_2: Ship.new(:destroyer, :c2, 2),
        c_3: Ship.new(:destroyer, :c3, 3),
        d_1: Ship.new(:boat, :d1, 1),
        d_2: Ship.new(:boat, :d2, 2),
        d_3: Ship.new(:boat, :d3, 3),
        d_4: Ship.new(:boat, :d4, 4)
    }
    @ships_computer = {
        a_1: Ship.new(:battleship, :a1, 1),
        b_1: Ship.new(:crase, :b1, 1),
        b_2: Ship.new(:crase, :b2, 2),
        c_1: Ship.new(:destroyer, :c1, 1),
        c_2: Ship.new(:destroyer, :c2, 2),
        c_3: Ship.new(:destroyer, :c3, 3),
        d_1: Ship.new(:boat, :d1, 1),
        d_2: Ship.new(:boat, :d2, 2),
        d_3: Ship.new(:boat, :d3, 3),
        d_4: Ship.new(:boat, :d4, 4)
    }
  end

  # начальный экран
  def create
    show_map
    ask_setup
  end

  # запрос варианта установки (авто или ручной)
  def ask_setup
    print 'Выберите режим расстановки кораблей: 1 - авто, 2 - ручной: '
    type = gets.chomp.to_i

    if type == 2
      show_map
      show_fleet
      ask_fleet_coords
    else
      set_player_fleet
      set_computer_fleet
      show_map
    end
  end

  # установка флота игрока в автоматическом режиме
  # TODO random set
  def set_player_fleet
    @ships_player[:a_1].coords = [[2,2],[3,2],[4,2],[5,2]]
    @ships_player[:b_1].coords = [[5,4],[6,4],[7,4]]
    @ships_player[:b_2].coords = [[3,7],[3,8],[3,9]]
    @ships_player[:c_1].coords = [[1,5],[1,6]]
    @ships_player[:c_2].coords = [[6,6],[7,6]]
    @ships_player[:c_3].coords = [[9,10],[10,10]]
    @ships_player[:d_1].coords = [[7,8]]
    @ships_player[:d_2].coords = [[5,10]]
    @ships_player[:d_3].coords = [[10,5]]
    @ships_player[:d_4].coords = [[10,7]]
  end

  # установка флота компьютера в автоматическом режиме
  def set_computer_fleet
    @ships_computer[:a_1].coords = [[2,2],[3,2],[4,2],[5,2]]
    @ships_computer[:b_1].coords = [[5,4],[6,4],[7,4]]
    @ships_computer[:b_2].coords = [[3,7],[3,8],[3,9]]
    @ships_computer[:c_1].coords = [[1,5],[1,6]]
    @ships_computer[:c_2].coords = [[6,6],[7,6]]
    @ships_computer[:c_3].coords = [[9,10],[10,10]]
    @ships_computer[:d_1].coords = [[7,8]]
    @ships_computer[:d_2].coords = [[5,10]]
    @ships_computer[:d_3].coords = [[10,5]]
    @ships_computer[:d_4].coords = [[10,7]]
  end

  # отрисовать карту
  def show_map
    # ▪
    puts '_______________________________________________________'
    puts '|                                                     |'
    puts '|                Игра "МОРСКОЙ БОЙ!"                  |'
    puts '|                                                     |'
    puts '|       ВАША КАРТА                 КАРТА ПРОТИВНИКА   |'
    puts '|_____________________________________________________|'
    puts '|   1 2 3 4 5 6 7 8 9 10 |   |   1 2 3 4 5 6 7 8 9 10 |'
    @y.each do |y|
      #ваша карта
      print '|'
      print ' ' unless y == 10
      print y
      @x.each do |x|
        print '|'
        coord = @ships_player.find_index do |ship|
          ship[1].coords.include?([x,y])
        end
        print coord ? '▪' : '_'
        print ''
      end
      print '| |   '

      #карта противника
      print '|'
      print ' ' unless y == 10
      print y
      @x.each do |x|
        print '|'
        print '_'
        print ''
      end
      print '| |'

      puts ''
    end
    puts '_______________________________________________________'
    puts ''
  end

  # отобразить флот (типы кораблей и их количество)
  # TODO dynamic content
  def show_fleet
    puts '  РАССТАВЬТЕ КОРАБЛИ:'
    puts '   (1) Линкор:  ▪▪▪▪ 1 шт'
    puts '   (2) Крейсер: ▪▪▪ 2 шт'
    puts '   (3) Эсминец: ▪▪ 3 шт'
    puts '   (4) Катер:   ▪ 4 шт'
    puts ''
  end

  # запрос координат корабля для ручной установки
  # TODO показать доступные поля
  # TODO проверить поле, запретить если недступно
  # TODO задать координаты снова
  def ask_fleet_coords
    @ships_player.each do |ship|
      number = ship_type_number(ship[1].type)
      name = ship_ru_name(ship[1].type)
      length = ship[1].length
      ship_number = ship[1].number

      (1..length).each do |i|
        print "(#{number}) #{name} #{ship_number}: Блок #{i}/#{length} (x y): "
        xy = gets.chomp.split
        ship[1].coords << [xy[0].to_i,xy[1].to_i]
        show_map
        show_fleet
      end

      ship[1].displayed = true
    end
  end

  # порядковый номер типа кораблей
  def ship_type_number(type)
    case type
      when :battleship then type_number = 1
      when :crase then type_number = 2
      when :destroyer then type_number = 3
      when :boat then type_number = 4
      else false
    end
  end

  # название кораблей на русском языке
  def ship_ru_name(type)
    case type
      when :battleship then ru_name = 'ЛИНКОР'
      when :crase then tru_name = 'КРЕЙСЕР'
      when :destroyer then tru_name = 'ЭСМИНЕЦ'
      when :boat then ru_name = 'КАТЕР'
      else false
    end
  end
end

# изменение цвета клеток карты и символов
class String
  def bg_green
    "\e[42m#{self}\e[0m"
  end
  def bg_red
    "\e[41m#{self}\e[0m"
  end
end
