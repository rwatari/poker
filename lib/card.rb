require 'colorize'

class Card
  attr_reader :suit, :value

  SUITS = { S: "\u2660", H: "\u2665", D: "\u2666", C: "\u2663" }
  VALUES = { 11 => "J", 12 => "Q", 13 => "K", 14 => "A" }

  def initialize(suit, value)
    @suit = suit
    @value = value
    @color = set_color
  end

  def set_color
    case suit
    when :S, :C
      :black
    when :D, :H
      :red
    end
  end

  def to_s
    display = ""

    if value > 10
      display << VALUES[value]
    else
      display << value.to_s
    end

    display << SUITS[suit]
    display.colorize(@color)
  end
end

# card = Card.new(:S, 13)
# puts card.to_s
