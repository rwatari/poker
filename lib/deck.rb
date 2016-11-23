require_relative 'card'

class Deck
  attr_reader :cards

  def self.set_cards
    cards_arr = []

    suits = [:S, :C, :H, :D]
    2.upto(14) do |i|
      suits.each do |suit|
        cards_arr << Card.new(suit, i)
      end
    end

    cards_arr
  end

  def initialize
    @cards = Deck.set_cards
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_card(n = 1)
    @cards.pop(n)
  end
end
