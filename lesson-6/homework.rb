require_relative 'classes/board'

# ДОМАШНЕЕ ЗАДАНИЕ. Урок 6. Расположение кораблей на картах.

Board.create 10, 10
Ship.create_ships
Board.locate_ships
Board.draw
# Board.game