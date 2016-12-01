require 'game'

describe Game do

  subject {described_class.new}

  row_winner = [['','',''],['','',''],['X','X','X']]
  column_winner = [['','O','X'],['X','O','X'],['','O','']]
  diagonal_winner = [['O','',''],['','O',''],['','','O']]
  draw = [['O','O','X'],['X','O','O'],['O','X','X']]
  incomplete_game = [['O','O',''],['X','O','O'],['O','X','X']]


  describe '#initialize' do
    it 'starts with a game board' do
      expect(subject.game_board).to be_an_instance_of GameBoard
    end
  end

  describe 'game_over?' do
    it 'returns true if the game is over as someone has won' do
      expect(subject.game_over?(column_winner)).to eq true
    end
    it 'returns true if the game is over as it is a tie' do
      expect(subject.game_over?(draw)).to eq true
    end
    it 'returns false if the game is not over' do
      expect(subject.game_over?(incomplete_game)).to eq false
    end
  end

  describe '#row_winner?' do
    it 'returns true it there is a complete row in the game board' do
      expect(subject.row_winner?(row_winner)).to eq true
    end
    it 'returns false it there is not a complete row in the game board' do
      expect(subject.row_winner?(column_winner)).to eq false
    end
  end

  describe '#column_winner?' do
    it 'returns true it there is a complete column in the game board' do
      expect(subject.column_winner?(column_winner)).to eq true
    end
    it 'returns fale it there is not a complete column in the game board' do
      expect(subject.column_winner?(row_winner)).to eq false
    end

  end

  describe '#diagonal_winner?' do
    it 'returns true it there is a complete diagonal in the game board' do
      expect(subject.diagonal_winner?(diagonal_winner)).to eq true
    end
  end

  describe '#tie?' do
    it 'returns true if the game is tied' do
      expect(subject.tie?(draw)).to eq true
    end
    it 'returns false it the game is incomplete' do
      expect(subject.tie?(incomplete_game)).to eq false
    end
  end

end
