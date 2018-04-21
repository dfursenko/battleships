class SeaBattle

  def initialize
    @x = [1,2,3,4,5,6,7,8,9,10]
    @y = [1,2,3,4,5,6,7,8,9,10]
    @ships = []
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
        print @ships.include?([x,y]) ? '▪' : '_'
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
    puts '(1) ЛИНКОР:'
    print 'Блок 1/4 - X Y (например: 3 5): '
    xy = gets.chomp.split
    @ships << [xy[0].to_i, xy[1].to_i]
    create_sea
    show_ships

    print 'Блок 2/4 - X Y: '
    xy = gets.chomp.split
    @ships << [xy[0].to_i, xy[1].to_i]
    create_sea
    show_ships

    print 'Блок 3/4 - X Y: '
    xy = gets.chomp.split
    @ships << [xy[0].to_i, xy[1].to_i]
    create_sea
    show_ships

    print 'Блок 4/4 - X Y: '
    xy = gets.chomp.split
    @ships << [xy[0].to_i, xy[1].to_i]
    create_sea
    show_ships
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
