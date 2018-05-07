require 'sqlite3'

class Db
  def initialize
    @db = SQLite3::Database.open "./db/cars.db"
    @db.execute "DROP TABLE IF EXISTS Cars"
    @db.execute "DROP TABLE IF EXISTS Marks"

    @db.execute "CREATE TABLE Marks(MarkId INTEGER PRIMARY KEY, Mark TEXT)"
    @db.execute "CREATE TABLE Cars(CarId INTEGER PRIMARY KEY, Type TEXT, MarkId INTEGER,
                    FOREIGN KEY(MarkId) REFERENCES Marks(MarkId))"
  end

  def marks
    @rs = @db.execute "SELECT * FROM 'Marks'"
    result = []
    @rs.each do |row|
      result << row[1]
    end
    result
  end

  def cars
    @rs = @db.execute "SELECT * FROM 'Cars'"
    result = []
    @rs.each do |row|
      result << row
    end
    result
  end

  def add_mark(mark)
    @db.execute "INSERT INTO Marks('Mark') VALUES('#{mark}')"
  end

  def add_car(type, mark)
    @db.execute "INSERT INTO Cars(Type, MarkId) VALUES('#{type}', '#{mark_id mark}')"
  end

  def mark_id(name)
    @db.get_first_row "SELECT MarkId FROM Marks WHERE Mark='#{name}'"
  end

  def total_count(type)
    @db.execute("SELECT COUNT(*) FROM Cars WHERE Type='#{type}'")[0][0]
  end

  def mark_mates(mark)
    @db.execute("SELECT COUNT(*) FROM Cars WHERE MarkId='#{mark_id mark}'")[0][0]
  end

end

DB = Db.new
