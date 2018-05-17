require './lib/classes/board'

class GameController < ApplicationController
  def index
    Board.new
  end
end
