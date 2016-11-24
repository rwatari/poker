require 'player'

describe Player do
  subject(:player) { Player.new('Bob', 100) }

  describe '#initialize' do
    it 'sets a name' do
      expect(player.name).to eq('Bob')
    end

    it 'sets the pot' do
      expect(player.pot).to eq(100)
    end

    it 'initializes a hand' do
      expect(player.hand).to be_a(Hand)
    end
  end

  # describe '#get_discard' do
  #   expect(player.get_discard)
  # end
end
