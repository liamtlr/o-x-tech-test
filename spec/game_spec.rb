require 'game'

describe Game do

  subject {described_class.new}

  row_winner = [['','',''],['','',''],['X','X','X']]
  column_winner = [['','O','X'],['X','O','X'],['','O','']]
  diagonal_winner = [['O','',''],['','O',''],['','','O']]
  draw = [['O','O','X'],['X','O','O'],['O','X','X']]

  describe '#initialize' do
    it 'starts with a game board' do
      expect(subject.game_board).to be_an_instance_of GameBoard
    end
  end

  describe '#row_winner?' do
    it 'returns true it there is a complete row in the game board' do
      expect(subject.row_winner?(row_winner)).to eq true
    end
  end

  describe '#column_winner?' do
    it 'returns true it there is a complete column in the game board' do
      expect(subject.column_winner?(column_winner)).to eq true
    end
  end

  describe '#diagonal_winner?' do
    it 'returns true it there is a complete diagonal in the game board' do
      expect(subject.diagonal_winner?(diagonal_winner)).to eq true
    end
  end

  describe '#tie?' do
    it 'returns true it the game is tied' do
      expect(subject.tie?(draw)).to eq true
    end
  end

end
