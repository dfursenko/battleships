require './lib/classes/board'

class GameController < ApplicationController
  before_action :authenticate_user!

  def index
    # Board.new
  end
end
