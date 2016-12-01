require 'game_board'

describe GameBoard do

  subject {described_class.new}

  describe '#initialize' do
    it 'starts with a 3x3 game board array' do
      expect(subject.game_board[0].length).to eq 3
    end
  end
end
