require './fleet'

class SeaBattle

  def initialize
    @x = (1..10)
    @y = (1..10)
    @fleet = Fleet.new
  end

  def create
    create_sea
    show_ships
    set_ships
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
        coord = @fleet.ships.find_index do |ship|
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

  def set_ships
    @fleet.ships.each do |ship|
      number = ship_type_number(ship[1].type)
      name = ship_ru_name(ship[1].type)
      length = ship[1].length

      (1..4).each do |i|
        print "(#{number}) #{name}: Блок #{i}/#{length} (x y): "
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
