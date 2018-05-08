# ДОМАШНЕЕ ЗАДАНИЕ. Урок 5. Задание 9.
#
# 9. * Попробовать найти альтернативу использования переменной класса для примера с тягачом Truck,
#   который при наследовании от Car неправильно просчитывал количество моделей и пр.


class Car2
  @total_count = 5

  def self.total_count
    @total_count
  end
end

class Track2 < Car2
  @total_count = 0

  def self.total_count
    @total_count
  end
end

p Car2.total_count      # => 5
p Track2.total_count    # => 0