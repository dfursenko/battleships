class SeaBattle

  def initialize
    @x = [1,2,3,4,5,6,7,8,9,10]
    @y = [1,2,3,4,5,6,7,8,9,10]
    @ships = [
        [1,1],                    # 1-cell boat
        [3,1],[3,2],              # 2-cells destroyer
        [5,1],[5,2],[5,3],        # 3-cells crase
        [8,1],[8,2],[8,3],[8,4]   # 4-cells battleship
    ]
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
        print '_' #.bg_green@ships.include?([x,y]) ? '▪' : '_'
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
    print 'Блок 1/4 - X, Y (например 3, 5): '
    xy = gets.chomp
    p xy
  end
end
