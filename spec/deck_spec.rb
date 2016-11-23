require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe '::set_cards' do
    it 'creates an array of 52 cards' do
      expect(Deck.set_cards.length).to eq(52)
    end
  end

  describe '#initialize' do
    it 'creates an array of 52 cards' do
      expect(deck.cards.length).to eq(52)
    end
  end

  describe '#shuffle' do
    it 'should shuffle cards' do
      cards_dup = deck.cards.dup
      deck.shuffle
      expect(deck.cards).to_not eq(cards_dup)
    end
  end

  describe '#deal_card' do
    context 'when given no argument' do
      it 'removes card from deck' do
        card = deck.deal_card
        expect(card.first).to_not eq(deck.cards.last)
      end
    end

    context 'when given a number argument' do
      it 'removes and returns 5 cards from deck' do
        cards = deck.deal_card(5)
        expect(cards.length).to eq(5)
        expect(deck.cards.length).to eq(47)
      end
    end
  end
end
