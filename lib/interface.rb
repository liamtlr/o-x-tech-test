require_relative 'game'

class Interface

  def new_game
    puts "Welcome, enter player 1's name"
    @player_one = gets.chomp.to_s
    puts "Enter player 2's name"
    @player_two = gets.chomp.to_s
    @current_player = @player_one
    create_new_game
    create_game_board
    @game_board = GameBoard.new
    display_game_board
    turn(@current_player)
  end

  private

  def turn(current_player)
    puts "#{@current_player}'s turn. Place #{return_x_or_o}"
    puts "Enter a row number"
    row_number = gets.chomp
    puts "Enter a column number"
    column_number = gets.chomp
    play_x_or_o(row_number, column_number)
    display_game_board
    post_turn
  end

  def post_turn
    if !@game.game_over?(@game_board.game_board)
      switch_turns
    else
      return_outcome
    end
  end

  def return_outcome
    if @game.game_status(@game_board.game_board) == "Game over Somebody won"
      puts "#{@current_player} won!"
    else
      puts 'It was a tie :('
    end
    new_game_or_quit
  end

  def switch_turns
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
    turn(@current_player)
  end

  def return_x_or_o
    if @current_player == @player_one
      "X"
    else
      "O"
    end
  end

  def new_game_or_quit
    puts "Enter 'y' to play again or enter any other key to quit"
    response = gets.chomp
    if response.upcase == "Y"
      new_game
    else
      puts "Goodbye"
      exit
    end
  end

  def play_x_or_o(row_number, column_number)
    if @current_player == @player_one
      @game_board.add_move("X", row_number.to_i, column_number.to_i)
    else
      @game_board.add_move("O", row_number.to_i, column_number.to_i)
    end
  end

  def create_new_game
    @game ||= @game = Game.new
  end

  def create_game_board
    if @game_board
      @game_board.reset_board
    else
      @game_board = GameBoard.new
    end
  end

  def display_game_board
    puts "   1    2     3"
    puts "1| #{@game_board.game_board[0][0]}  | #{@game_board.game_board[0][1]}   |   #{@game_board.game_board[0][2]}"
    puts "  ---------------"
    puts "2| #{@game_board.game_board[1][0]}  |  #{@game_board.game_board[1][1]}  |   #{@game_board.game_board[1][2]}"
    puts "  ---------------"
    puts "3| #{@game_board.game_board[2][0]}  |  #{@game_board.game_board[2][1]}  |   #{@game_board.game_board[2][2]}"
  end


end
