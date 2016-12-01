
class GameBoard

  attr_reader :game_board

  def initialize
    @game_board = [['','',''],['','',''],['','','']]
  end

  def add_move(o_or_x, row_num, column_num)
    if o_or_x?(o_or_x) and valid_move?(row_num, column_num)
      @game_board[row_num - 1][column_num - 1] = o_or_x.upcase
    end
  end

  def o_or_x?(o_or_x)
    o_or_x.upcase == "O" || o_or_x.upcase == "X"
  end

  def valid_move?(row_num, column_num)
    (1..3).include?(row_num) && (1..3).include?(column_num) && @game_board[row_num - 1][column_num - 1].empty?
  end

end
