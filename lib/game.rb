require_relative 'game_board'

class Game

  ROW_WINNERS =

  attr_reader :game_board

  def initialize
    @game_board = GameBoard.new
  end

  def row_winner?(game_board)
    test = game_board.select do |row|
      row == ['X','X','X'] || ['O','O','O']
    end
    !test.nil?
  end

end
