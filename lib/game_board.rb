
class GameBoard

  attr_reader :game_board

  def initialize
    @game_board = [['','',''],['','',''],['','','']]
  end

  def add_move(o_or_x, row_num, column_num)
    if o_or_x?(o_or_x) and valid_move?(row_num, column_num)
      @game_board[row_num - 1][column_num - 1] = o_or_x.upcase
    else
      "Not a valid move"
    end
  end

  def o_or_x?(o_or_x)
    o_or_x.upcase == "O" || o_or_x.upcase == "X"
  end

  def valid_move?(row_num, column_num)
    (1..3).include?(row_num) && (1..3).include?(column_num) && @game_board[row_num - 1][column_num - 1].empty?
  end

  def display_game_board
    puts "#{@game_board[0][0]}   |   #{@game_board[0][1]}   |   #{@game_board[0][2]}"
    puts "-------------"
    puts "#{@game_board[1][0]}   |   #{@game_board[1][1]}   |   #{@game_board[1][2]}"
    puts "-------------"
    puts "#{@game_board[2][0]}   |   #{@game_board[2][1]}   |   #{@game_board[2][2]}"
  end

end
