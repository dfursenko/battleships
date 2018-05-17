# ДОМАШНЕЕ ЗАДАНИЕ 7. Задание 6.

# 7. *Реализовать модуль Очередь (FIFO) и класс, включающий этот модуль.

module Queueable
  def queue
    @queue ||= []
  end

  def add(item)
    queue.push item
  end

  def take
    queue.shift
  end
end

class Order
  include Queueable
end

order = Order.new
(1..5).each { |n| order.add n }
(1..5).each { |n| puts order.take }


# РЕЗУЛЬТАТ:
# => 1
# => 2
# => 3
# => 4
# => 5



