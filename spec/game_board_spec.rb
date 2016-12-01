require 'game_board'

describe GameBoard do

  subject {described_class.new}

  describe '#initialize' do
    it 'starts with a 3x3 game board array' do
      expect(subject.game_board[0].length).to eq 3
    end
  end

  describe '#add_move' do
    it 'adds a move to the game board' do
      subject.add_move("O", 1, 1)
      expect(subject.game_board[0][0]).to eq "O"
    end
  end

  describe '#o_or_x?' do
    it 'returns true if a nought or a cross is given' do
      expect(subject.o_or_x?('o')).to eq true
    end
    it 'returns false if a different string is given' do
      expect(subject.o_or_x?('hello')).to eq false
    end
  end

  describe '#valid_move?' do
    it 'returns true if the move is valid and not already taken' do
      expect(valid_move?(0,0)).to eq true
    end
    it 'returns false if the move is valid but already taken' do
      expect(valid_move?(0,0)).to eq false
    end
    it 'returns false if the move is not valid' do
      expect(valid_move?(5,5)).to eq false
    end
  end
end
