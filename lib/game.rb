require_relative 'game_board'

class Game

  attr_reader :game_board

  def initialize
    @game_board = GameBoard.new
  end

end
