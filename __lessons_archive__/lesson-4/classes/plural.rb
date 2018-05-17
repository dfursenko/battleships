# Модуль Plural
# определяет слово в зависимости от количества
module Plural
  def pluralize(value, one, two, three)
    i = value.to_s.split('').last.to_i
    if i == 1
      one
    elsif i == 2 || i == 3 || i == 4
      two
    else
      three
    end
  end
end