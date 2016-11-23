require_relative 'deck'

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_cards(cards_arr)
    @cards.concat(cards_arr)
  end

  def discard(indicies)
    new_cards = []
    cards.each_with_index do |card, i|
      new_cards << card unless indicies.include?(i)
    end
    @cards = new_cards
  end

  def display
  end
end
