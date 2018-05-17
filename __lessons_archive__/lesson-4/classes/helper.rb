# Добавляем возможность удаления последнего элемента одной командой
class Array
  def delete_last
    self.delete_at(-1)
  end
end

# Добавляем пробелы между разрядами (готового способа не нашел, поэтому сделал сам)
class Integer
  def to_s_with_spaces
    output = []

    self.to_s.split('').reverse.each_with_index do |value, key|
      output << value
      output << ' ' if (key + 1) % 3 == 0
    end

    output.delete_last if output.last == ' '
    output.reverse.join
  end
end