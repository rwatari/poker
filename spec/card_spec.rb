require 'card'
require 'colorize'

describe Card do
  subject(:card) { Card.new(suit, value) }

  describe '#initialize' do
    let(:suit) { :H }
    let(:value) { 7 }

    it 'initializes instance variables' do
      expect(card.suit).to eq(:H)
      expect(card.value).to eq(7)
    end
  end

  describe '#to_s' do
    it 'renders non-face cards as proper string' do
      card = Card.new(:H, 7)
      expect(card.to_s).to eq("7\u2665".colorize(:red))
    end

    it 'renders face cards as proper string' do
      card = Card.new(:S, 13)
      expect(card.to_s).to eq("K\u2660".colorize(:black))
    end
  end
end
