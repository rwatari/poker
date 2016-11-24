require_relative 'hand'

class Player
  attr_reader :name, :pot

  def initialize(name, pot)
    @name = name
    @pot = pot
    @hand = Hand.new
  end

  def get_discard

  end

  def get_bet
  end

  def empty_hand
    @hand.empty
  end

  def take_cards(arr)
    @hand.add_cards(arr)
  end
end
