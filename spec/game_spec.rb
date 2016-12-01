require 'game'

describe Game do

  subject {described_class.new}

  describe '#initialize' do
    it 'starts with a game board' do
      expect(subject.game_board).to be_an_instance_of GameBoard
    end
  end
end
