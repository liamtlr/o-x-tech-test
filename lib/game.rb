require_relative 'game_board'

class Game

  _WINNERS =

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

  def column_winner?(game_board)
    game_board = game_board.transpose
    test = game_board.select do |row|
      row == ['X','X','X'] || ['O','O','O']
    end
    !test.nil?
  end

  def diagonal_winner?(game_board)
    if game_board[0][0] == "X" && game_board[1][1] == "X" && game_board[2][2] == "X"
      true
    elsif game_board[0][0] == "O" && game_board[1][1] == "O" && game_board[2][2] == "O"
      true
    elsif game_board[0][2] == "X" && game_board[1][1] == "X" && game_board[2][0] == "X"
      true
    elsif game_board[0][2] == "O" && game_board[1][1] == "O" && game_board[2][0] == "O"
      true
    else
      false
    end
  end

  def tie?(game_board)
    test = game_board.select do |x|
      without_blanks = x.reject {|index| index.empty?}
      without_blanks.length == x.length
    end
    test.length == 3
  end



end
