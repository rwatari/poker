require 'hand'

describe Hand do
  subject(:hand) { Hand.new }
  let(:deck) { Deck.new }

  describe '#initialize' do
    it 'starts with an empty hand' do
      expect(hand.cards).to eq([])
    end
  end

  context 'interaction with cards' do
    let(:cards) { deck.deal_card(5) }

    describe '#add_cards' do
      it 'adds cards to the hand' do
        hand.add_cards(cards)
        expect(hand.cards.length).to eq(5)
      end
    end

    describe '#discard' do
      it 'discards the set number of cards' do
        hand.add_cards(cards)
        hand.discard([1,2,3])
        expect(hand.cards.length).to eq(2)
      end

      # it 'raises an error if asked to discard more than possible' do
        # expect { hand.discard() }.to raise_error("Can't discard that much")
      # end
    end
  end

  describe '#score' do
    it 'recognizes a royal flush' do
      cards = (10..14).map { |val| Card.new(:D, val) }
      hand.add_cards(cards)
      expect(hand.score).to eq([9, []])
    end

    it 'recognizes a straight flush' do
      cards = (2..6).map { |val| Card.new(:D, val) }
      hand.add_cards(cards)
      expect(hand.score).to eq([8, [6]])
    end

    it 'recognizes a four of a kind' do
      cards = [
        Card.new(:D, 5),
        Card.new(:S, 5),
        Card.new(:C, 5),
        Card.new(:H, 5),
        Card.new(:H, 6),
      ]
      hand.add_cards(cards)
      expect(hand.score).to eq([7, [5, 6]])
    end

    it 'recognizes a full house' do
      cards = [
        Card.new(:D, 5),
        Card.new(:S, 5),
        Card.new(:C, 5),
        Card.new(:S, 6),
        Card.new(:H, 6),
      ]
      hand.add_cards(cards)
      expect(hand.score).to eq([6, [5, 6]])
    end

    it 'recognizes a flush' do
      cards = [
        Card.new(:S, 9),
        Card.new(:S, 14),
        Card.new(:S, 5),
        Card.new(:S, 6),
        Card.new(:S, 7),
      ]
      hand.add_cards(cards)
      expect(hand.score).to eq([5, [14, 9, 7, 6, 5]])
    end

    it 'recognizes a straight' do
      cards = [
        Card.new(:D, 14),
        Card.new(:S, 2),
        Card.new(:C, 3),
        Card.new(:H, 4),
        Card.new(:H, 5),
      ]
      hand.add_cards(cards)
      expect(hand.score).to eq([4, [5]])
    end

    it 'recognizes a three of a kind' do
      cards = [
        Card.new(:D, 5),
        Card.new(:S, 5),
        Card.new(:C, 5),
        Card.new(:S, 2),
        Card.new(:H, 6),
      ]
      hand.add_cards(cards)
      expect(hand.score).to eq([3, [5, 6, 2]])
    end

    it 'recognizes a two pair' do
      cards = [
        Card.new(:D, 5),
        Card.new(:S, 5),
        Card.new(:C, 4),
        Card.new(:S, 4),
        Card.new(:H, 6),
      ]
      hand.add_cards(cards)
      expect(hand.score).to eq([2, [5, 4, 6]])
    end

    it 'recognizes a two pair' do
      cards = [
        Card.new(:D, 5),
        Card.new(:S, 5),
        Card.new(:C, 4),
        Card.new(:S, 8),
        Card.new(:H, 6),
      ]
      hand.add_cards(cards)
      expect(hand.score).to eq([1, [5, 8, 6, 4]])
    end

    it 'recognizes a high card' do
      cards = [
        Card.new(:D, 10),
        Card.new(:S, 5),
        Card.new(:C, 4),
        Card.new(:S, 8),
        Card.new(:H, 6),
      ]
      hand.add_cards(cards)
      expect(hand.score).to eq([0, [10, 8, 6, 5, 4]])
    end

  end
end
