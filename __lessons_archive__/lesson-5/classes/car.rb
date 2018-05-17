require 'json'
require_relative 'db'

class Car
  class << self

    def add_mark(mark)
      return if marks.include? mark
      DB.add_mark mark
    end

    def total_count
      DB.total_count self
    end

    def marks
      DB.marks
    end

    def cars
      DB.cars
    end
  end

  attr_reader :mark

  def initialize(mark)
    raise "No such mark available: #{mark}!" unless Car.marks.include? mark
    @mark = mark
    DB.add_car self.class, mark
  end

  def mark_mates
    DB.mark_mates @mark
  end
end