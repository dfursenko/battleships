class SeaBattle

  def initialize
    @x = [1,2,3,4,5,6,7,8,9,10]
    @y = [1,2,3,4,5,6,7,8,9,10]
    @ships = [
        [1,1],                    # 1-cell boat
        [3,1],[3,2],              # 2-cells destroyer
        [5,1],[5,2],[5,3],        # 3-cells crase
        [7,1],[7,2],[7,3],[7,4]   # 4-cells battleship
    ]
  end

  def show

    # ▪
    puts '                          '
    puts '       МОРСКОЙ БОЙ!       '
    puts '__________________________'
    puts '|   1 2 3 4 5 6 7 8 9 10 |'
    @x.each do |x|
      print '|'
      print ' ' unless x == 10
      print x
      print '|','_','|','_','|','_','|','_','|','_','|','_','|','_','|','_','|','_','|','_','| |'
      puts ''
    end
    puts '__________________________'
    puts ''
  end
end