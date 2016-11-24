require 'game'

describe Poker do
  let(:players) { %w(amy bob chris dylan) }
  subject(:game) { Poker.new(players, 100) }

  describe '#initialize' do
    it 'makes a new deck' do
      expect(game.deck).to be_a(Deck)
    end

    it 'keeps an array of players' do
      expect(game.players).to match_array(players)
    end

    it 'keeps track of the pot' do
      expect(game.pot).to be_an(Integer)
    end
  end

  describe '#play' do
    it 'runs game until game_over is true' do
      expect(game).to receive(:game_over?)
      game.play
    end
  end

  describe '#winner' do
    it 'returns correct winner' do

    end
  end

  describe '#game_over?' do
    it 'returns true if game is over' do

    end

    it 'returns false if game is not over' do

    end
  end

  describe '#compare_hands' do
    let(:p1) { double(score: [8, [6]]) }
    let(:p2) { double(score: [5, [6,3,2]]) }
    let(:p3) { double(score: [8, [9]]) }

    it 'returns highest ranking hand as winner' do
      expect(game.compare_hands([p1, p2])).to eq(p1)
    end

    it 'handles tiebreaking' do
      expect(game.compare_hands([p1, p3])).to eq(p3)
    end

  end

  describe '#play_round' do

  end
end
