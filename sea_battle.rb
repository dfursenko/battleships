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
    puts '                          '
    puts '       МОРСКОЙ БОЙ!       '
    puts '__________________________'
    puts '|   1 2 3 4 5 6 7 8 9 10 |'
    @y.each do |y|
      print '|'
      print ' ' unless y == 10
      print y
      @x.each do |x|
        print '|'
        print @ships.include?([x,y]) ? '▪' : '_'
        print ''
      end
      print '| |'
      puts ''
    end
    puts '__________________________'
    puts ''
  end

  def show_ships
    puts ''
    puts 'Подготовка к бою. РАССТАВЬТЕ КОРАБЛИ:'
    puts " (1) Линкор:  ▪▪▪▪ 1 шт"
    puts " (2) Крейсер: ▪▪▪ 2 шт"
    puts " (3) Эсминец: ▪▪ 3 шт"
    puts " (4) Катер:   ▪ 4 шт"
    puts ''
  end
end
