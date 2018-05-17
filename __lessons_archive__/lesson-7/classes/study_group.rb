class StudyGroup
  include Enumerable

  attr_accessor :students

  def initialize(students = [])
    @students = students
  end

  def each
    @students.each { |student| yield student }
  end
end