require './ship'

class SeaBattle

  def initialize
    @x = (1..10)
    @y = (1..10)
    @ships_player = [
        [:a_1, Ship.new(:battleship, :a1, 1)],
        [:b_1, Ship.new(:crase, :b1, 1)],
        [:b_2, Ship.new(:crase, :b2, 2)],
        [:c_1, Ship.new(:destroyer, :c1, 1)],
        [:c_2, Ship.new(:destroyer, :c2, 2)],
        [:c_3, Ship.new(:destroyer, :c3, 3)],
        [:d_1, Ship.new(:boat, :d1, 1)],
        [:d_2, Ship.new(:boat, :d2, 2)],
        [:d_3, Ship.new(:boat, :d3, 3)],
        [:d_4, Ship.new(:boat, :d4, 4)]
    ]
    @ships_computer = [
        [:a_1, Ship.new(:battleship, :a1, 1)],
        [:b_1, Ship.new(:crase, :b1, 1)],
        [:b_2, Ship.new(:crase, :b2, 2)],
        [:c_1, Ship.new(:destroyer, :c1, 1)],
        [:c_2, Ship.new(:destroyer, :c2, 2)],
        [:c_3, Ship.new(:destroyer, :c3, 3)],
        [:d_1, Ship.new(:boat, :d1, 1)],
        [:d_2, Ship.new(:boat, :d2, 2)],
        [:d_3, Ship.new(:boat, :d3, 3)],
        [:d_4, Ship.new(:boat, :d4, 4)]
    ]
  end

  def create
    create_sea
    get_setup
  end

  def get_setup
    print 'Выберите режим расстановки кораблей: 1 - авто, 2 - ручной: '
    type = gets.chomp.to_i

    if type == 2
      create_sea
      show_ships
      set_ships
    else
      create_fleet
    end
  end

  def create_fleet
    puts 1
  end

  def create_sea
    # ▪
    puts '                                                       '
    puts '        ВАША КАРТА                 КАРТА ПРОТИВНИКА    '
    puts '_______________________________________________________'
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

  def show_ships
    puts '  РАССТАВЬТЕ КОРАБЛИ:'
    puts "   (1) Линкор:  ▪▪▪▪ 1 шт"
    puts "   (2) Крейсер: ▪▪▪ 2 шт"
    puts "   (3) Эсминец: ▪▪ 3 шт"
    puts "   (4) Катер:   ▪ 4 шт"
    puts ''
  end

  # TODO показать доступные поля
  # TODO проверить поле, запретить если недступно
  # TODO задать координаты снова
  def set_ships
    @ships_player.each do |ship|
      number = ship_type_number(ship[1].type)
      name = ship_ru_name(ship[1].type)
      length = ship[1].length
      ship_number = ship[1].number

      (1..length).each do |i|
        print "(#{number}) #{name} #{ship_number}: Блок #{i}/#{length} (x y): "
        xy = gets.chomp.split
        ship[1].coords << [xy[0].to_i,xy[1].to_i]
        create_sea
        show_ships
      end

      ship[1].displayed = true
    end
  end

  def ship_type_number(type)
    case type
      when :battleship then type_number = 1
      when :crase then type_number = 2
      when :destroyer then type_number = 3
      when :boat then type_number = 4
      else false
    end
  end

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

class String
  def bg_green
    "\e[42m#{self}\e[0m"
  end
  def bg_red
    "\e[41m#{self}\e[0m"
  end
end
